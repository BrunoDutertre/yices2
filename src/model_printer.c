/*
 * PRINT A MODEL
 */

#include <assert.h>
#include <inttypes.h>
#include <string.h>

#include "int_vectors.h"
#include "model_eval.h"
#include "model_printer.h"


/*
 * Print the assignment for t in model
 * - the format is (= <t's name> <value>)
 */
void model_print_term_value(FILE *f, model_t *model, term_t t) {
  int_hmap_pair_t *r;
  char *name;

  assert(term_kind(model->terms, t) == UNINTERPRETED_TERM);

  name = term_name(model->terms, t);
  if (name == NULL) {
    fprintf(f, "(= t!%"PRId32" ", t);
  } else {
    fprintf(f, "(= %s ", name);
  }

  r = int_hmap_find(&model->map, t);
  if (r == NULL) {
    /*
     * ??) is a stupid C trigraph so "???)" can be misinterpreted by compilers
     */
    fputs("???"")", f); 
  } else {
    vtbl_print_object(f, &model->vtbl, r->val);
    fputc(')', f);
  }
}






/*
 * Check whether term t should be printed in the assignments
 */
static inline bool term_to_print(term_table_t *tbl, term_t t) {
  return term_kind(tbl, t) == UNINTERPRETED_TERM && term_name(tbl, t) != NULL;
}



/*
 * Collect all terms to print
 * - store them in vector v
 */
static void model_collect_terms(model_t *model, ivector_t *v) {
  int_hmap_t *hmap;
  int_hmap_pair_t *r;
  term_table_t *terms;
  term_t t;

  terms = model->terms;
  hmap = &model->map;
  r = int_hmap_first_record(hmap);
  while (r != NULL) {
    t = r->key;  // key is the term id
    if (term_to_print(terms, t)) {
      ivector_push(v, t);
    }
    r = int_hmap_next_record(hmap, r);
  }
}



/*
 * Print the assignment for all boolean terms in array a
 * - n = size of the array
 */
static void model_print_bool_assignments(FILE *f, model_t *model, term_t *a, uint32_t n) {  
  term_table_t *terms;
  uint32_t i;
  term_t t;

  terms = model->terms;
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_boolean_term(terms, t)) {
      model_print_term_value(f, model, t);
      fputc('\n', f);
    }
  }
}


/*
 * Print the assignment for all arithmetic terms in array a
 * - n = size of the array
 */
static void model_print_arithmetic_assignments(FILE *f, model_t *model, term_t *a, uint32_t n) {  
  term_table_t *terms;
  uint32_t i;
  term_t t;

  terms = model->terms;
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_arithmetic_term(terms, t)) {
      model_print_term_value(f, model, t);
      fputc('\n', f);
    }
  }
}



/*
 * Print the assignment for all bitvector terms in array a
 * - n = size of the array
 */
static void model_print_bitvector_assignments(FILE *f, model_t *model, term_t *a, uint32_t n) {  
  term_table_t *terms;
  uint32_t i;
  term_t t;

  terms = model->terms;
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_bitvector_term(terms, t)) {
      model_print_term_value(f, model, t);
      fputc('\n', f);
    }
  }
}


/*
 * Print the terms of uninterpreted type in array a
 * - n = size of the array
 */
static void model_print_constant_assignments(FILE *f, model_t *model, term_t *a, uint32_t n) {
  term_table_t *terms;
  char *name;
  value_unint_t *d;
  uint32_t i;
  term_t t;
  value_t c;
  type_kind_t tau;

  terms = model->terms;
  for (i=0; i<n; i++) {
    t = a[i];
    tau = term_type_kind(terms, t);
    if (tau == UNINTERPRETED_TYPE || tau == SCALAR_TYPE) {
      c = model_find_term_value(model, t);
      d = vtbl_unint(&model->vtbl, c);
      name = term_name(terms, t);
      assert(name != NULL);
      if (d->name == NULL || strcmp(name, d->name) != 0) {
	fprintf(f, "(= %s ", name);
	vtbl_print_object(f, &model->vtbl, c);
	fputs(")\n", f);
      }
    }
  }
}



/*
 * Print the assignment for all tuple terms in array a
 * - n = size of the array
 */
static void model_print_tuple_assignments(FILE *f, model_t *model, term_t *a, uint32_t n) {  
  term_table_t *terms;
  uint32_t i;
  term_t t;

  terms = model->terms;
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_tuple_term(terms, t)) {
      model_print_term_value(f, model, t);
      fputc('\n', f);
    }
  }
}


/*
 * Print the function terms in array a
 * - n = size of the array
 */
static void model_print_function_assignments(FILE *f, model_t *model, term_t *a, uint32_t n) {  
  term_table_t *terms;
  value_fun_t *fun;
  char *name;
  ivector_t v;
  term_t t;
  value_t c;
  uint32_t i;

  init_ivector(&v, 0);
  terms = model->terms;
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_function_term(terms, t)) {
      /*
       * t is mapped to a function object fun
       * if t and fun have different names, we print 
       * (= <t's name> <fun 's name>) otherwise we print nothing
       * and store fun in vector v.
       */
      c = model_find_term_value(model, t);
      name = term_name(terms, t);
      assert(name != NULL);
      if (object_is_function(&model->vtbl, c)) {
	fun = vtbl_function(&model->vtbl, c);
	if (fun->name == NULL || strcmp(name, fun->name) != 0) {
	  fprintf(f, "(= %s ", name);
	  vtbl_print_object(f, &model->vtbl, c);
	  fputs(")\n", f);
	} else {
	  ivector_push(&v, c);
	}
#if 0 
      } else {
	fprintf(f, "(= %s ", name);
	vtbl_print_object(f, &model->vtbl, c);
	fputs(")\n", f);
#endif
      }
    }
  }

  /*
   * Second pass: print the update objects
   */
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_function_term(terms, t)) {
      c = model_find_term_value(model, t);
      name = term_name(terms, t);
      assert(name != NULL);
      if (object_is_update(&model->vtbl, c)) {
	vtbl_normalize_and_print_update(f, &model->vtbl, name, c, true);
      }
    }
  }

  // now print the function maps for every object in v
  n = v.size;
  for (i=0; i<n; i++) {
    vtbl_print_function(f, &model->vtbl, v.data[i], true);
  }  

  delete_ivector(&v);
}




/*
 * Print the model->map table
 */
void model_print(FILE *f, model_t *model) {
  ivector_t v;
  term_t *a;
  uint32_t n;

  init_ivector(&v, 0);
  model_collect_terms(model, &v);

  n = v.size;
  a = v.data;
  model_print_bool_assignments(f, model, a, n);
  model_print_arithmetic_assignments(f, model, a, n);
  model_print_bitvector_assignments(f, model, a, n);
  model_print_constant_assignments(f, model, a, n);
  model_print_tuple_assignments(f, model, a, n);
  model_print_function_assignments(f, model, a, n);    

  delete_ivector(&v);
}




/*
 * FULL MODEL: USE EVALUATOR
 */

/*
 * Print the assignment for t as computed by the evaluator
 * - t must be a valid, uninterpreted term
 */
static void eval_print_term_value(FILE *f, evaluator_t *eval, term_t t) {
  model_t *model;
  char *name;
  value_t v;

  assert(term_kind(eval->model->terms, t) == UNINTERPRETED_TERM);
  model = eval->model;

  v = eval_in_model(eval, t);
  if (v >= 0) {
    // v = good value for t
    name = term_name(model->terms, t);
    if (name == NULL) {
      fprintf(f, "(= t!%"PRId32" ", t);
    } else {
      fprintf(f, "(= %s ", name);
    }
    vtbl_print_object(f, &model->vtbl, v);
    fputc(')', f);
  }
}


/*
 * Print the assignment for all boolean terms in array a
 * - n = size of a
 */
static void eval_print_bool_assignments(FILE *f, evaluator_t *eval, term_t *a, uint32_t n) {
  term_table_t *terms;
  uint32_t i;
  term_t t;

  terms = eval->model->terms;
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_boolean_term(terms, t)) {
      eval_print_term_value(f, eval, t);
      fputc('\n', f);
    }
  }
  
}

/*
 * Print the assignment for all arithmetic terms in array a
 * - n = size of the array
 */
static void eval_print_arithmetic_assignments(FILE *f, evaluator_t *eval, term_t *a, uint32_t n) {  
  term_table_t *terms;
  uint32_t i;
  term_t t;

  terms = eval->model->terms;
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_arithmetic_term(terms, t)) {
      eval_print_term_value(f, eval, t);
      fputc('\n', f);
    }
  }
}



/*
 * Print the assignment for all bitvector terms in array a
 * - n = size of the array
 */
static void eval_print_bitvector_assignments(FILE *f, evaluator_t *eval, term_t *a, uint32_t n) {  
  term_table_t *terms;
  uint32_t i;
  term_t t;

  terms = eval->model->terms;
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_bitvector_term(terms, t)) {
      eval_print_term_value(f, eval, t);
      fputc('\n', f);
    }
  }
}



/*
 * Print the assignment for all tuple terms in array a
 * - n = size of the array
 */
static void eval_print_tuple_assignments(FILE *f, evaluator_t *eval, term_t *a, uint32_t n) {  
  term_table_t *terms;
  uint32_t i;
  term_t t;

  terms = eval->model->terms;
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_tuple_term(terms, t)) {
      eval_print_term_value(f, eval, t);
      fputc('\n', f);
    }
  }
}


/*
 * Print the terms of uninterpreted type in array a
 * - n = size of the array
 */
static void eval_print_constant_assignments(FILE *f, evaluator_t *eval, term_t *a, uint32_t n) {
  model_t *model;
  term_table_t *terms;
  char *name;
  value_unint_t *d;
  uint32_t i;
  term_t t;
  value_t c;
  type_kind_t tau;

  model = eval->model;
  terms = model->terms;

  for (i=0; i<n; i++) {
    t = a[i];
    tau = term_type_kind(terms, t);
    if (tau == UNINTERPRETED_TYPE || tau == SCALAR_TYPE) {
      c = eval_in_model(eval, t);
      d = vtbl_unint(&model->vtbl, c);
      name = term_name(terms, t);
      assert(name != NULL);
      if (d->name == NULL || strcmp(name, d->name) != 0) {
	fprintf(f, "(= %s ", name);
	vtbl_print_object(f, &model->vtbl, c);
	fputs(")\n", f);
      }
    }
  }
}


/*
 * Print the function terms in array a
 * - n = size of the array
 */
static void eval_print_function_assignments(FILE *f, evaluator_t *eval, term_t *a, uint32_t n) {  
  model_t *model;
  term_table_t *terms;
  value_fun_t *fun;
  char *name;
  ivector_t v;
  term_t t;
  value_t c;
  uint32_t i;

  init_ivector(&v, 0);
  model = eval->model;
  terms = model->terms;

  // first pass: function objects
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_function_term(terms, t)) {
      /*
       * t is mapped to a function object fun
       * if t and fun have different names, we print 
       * (= <t's name> <fun 's name>) otherwise we print nothing
       * and store fun in vector v.
       */
      c = eval_in_model(eval, t);
      name = term_name(terms, t);
      assert(name != NULL);
      if (object_is_function(&model->vtbl, c)) {
	fun = vtbl_function(&model->vtbl, c);
	if (fun->name == NULL || strcmp(name, fun->name) != 0) {
	  fprintf(f, "(= %s ", name);
	  vtbl_print_object(f, &model->vtbl, c);
	  fputs(")\n", f);
	} else {
	  ivector_push(&v, c);
	}
#if 0
      } else {
	fprintf(f, "(= %s ", name);
	vtbl_print_object(f, &model->vtbl, c);
	fputs(")\n", f);
#endif
      }
    }
  }

  /*
   * second pass: deal with update objects
   * there's some small overhead in calling eval_in_model
   * again, but that should be small since it's just a 
   * lookup in the cache
   */
  for (i=0; i<n; i++) {
    t = a[i];
    if (is_function_term(terms, t)) {
      c = eval_in_model(eval, t);
      name = term_name(terms, t);
      assert(name != NULL);
      if (object_is_update(&model->vtbl, c)) {
	vtbl_normalize_and_print_update(f, &model->vtbl, name, c, true);
      }
    }
  }

  // now print the function maps for every object in v
  n = v.size;
  for (i=0; i<n; i++) {
    vtbl_print_function(f, &model->vtbl, v.data[i], true);
  }

  delete_ivector(&v);

}


/*
 * Collect all terms to print
 * - store them in vector v
 */
static void model_collect_all_terms(model_t *model, ivector_t *v) {
  int_hmap_t *hmap;
  int_hmap_pair_t *r;
  term_table_t *terms;
  term_t t;

  terms = model->terms;
  hmap = &model->map;
  r = int_hmap_first_record(hmap);
  while (r != NULL) {
    t = r->key;  // key is the term id
    if (term_to_print(terms, t)) {
      ivector_push(v, t);
    }
    r = int_hmap_next_record(hmap, r);
  }

  hmap = model->alias_map;
  if (hmap != NULL) {
    r = int_hmap_first_record(hmap);
    while (r != NULL) {
      t = r->key;
      if (term_to_print(terms, t)) {
	ivector_push(v, t);
      }
      r = int_hmap_next_record(hmap, r);
    }
  }
}


/*
 * Print model, including the aliased terms
 * - one line per term 
 * - if model->has_alias is true, then the value of all terms in
 *   the alias table is displayed
 * - if model->has_alias is false, then this is the same as model_print
 */
void model_print_full(FILE *f, model_t *model) {
  evaluator_t eval;
  ivector_t v;
  term_t *a;
  uint32_t n;

  if (model->has_alias && model->alias_map != NULL) {
    init_ivector(&v, 0);
    model_collect_all_terms(model, &v);
    n = v.size;
    a = v.data;
    init_evaluator(&eval, model);
    eval_print_bool_assignments(f, &eval, a, n);
    eval_print_arithmetic_assignments(f, &eval, a, n);
    eval_print_bitvector_assignments(f, &eval, a, n);
    eval_print_constant_assignments(f, &eval, a, n);
    eval_print_tuple_assignments(f, &eval, a, n);
    eval_print_function_assignments(f, &eval, a, n);
    vtbl_print_anonymous_functions(f, &model->vtbl, true);
    delete_evaluator(&eval);
    delete_ivector(&v);
  } else {
    model_print(f, model);
    vtbl_print_anonymous_functions(f, &model->vtbl, true);
  }
}


