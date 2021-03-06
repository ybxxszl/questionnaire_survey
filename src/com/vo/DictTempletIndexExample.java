package com.vo;

import java.util.ArrayList;
import java.util.List;

public class DictTempletIndexExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public DictTempletIndexExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andDictTempletIndexIdIsNull() {
            addCriterion("dict_templet_index_id is null");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdIsNotNull() {
            addCriterion("dict_templet_index_id is not null");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdEqualTo(String value) {
            addCriterion("dict_templet_index_id =", value, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdNotEqualTo(String value) {
            addCriterion("dict_templet_index_id <>", value, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdGreaterThan(String value) {
            addCriterion("dict_templet_index_id >", value, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdGreaterThanOrEqualTo(String value) {
            addCriterion("dict_templet_index_id >=", value, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdLessThan(String value) {
            addCriterion("dict_templet_index_id <", value, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdLessThanOrEqualTo(String value) {
            addCriterion("dict_templet_index_id <=", value, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdLike(String value) {
            addCriterion("dict_templet_index_id like", value, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdNotLike(String value) {
            addCriterion("dict_templet_index_id not like", value, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdIn(List<String> values) {
            addCriterion("dict_templet_index_id in", values, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdNotIn(List<String> values) {
            addCriterion("dict_templet_index_id not in", values, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdBetween(String value1, String value2) {
            addCriterion("dict_templet_index_id between", value1, value2, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexIdNotBetween(String value1, String value2) {
            addCriterion("dict_templet_index_id not between", value1, value2, "dictTempletIndexId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignIsNull() {
            addCriterion("dict_templet_index_sign is null");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignIsNotNull() {
            addCriterion("dict_templet_index_sign is not null");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignEqualTo(Integer value) {
            addCriterion("dict_templet_index_sign =", value, "dictTempletIndexSign");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignNotEqualTo(Integer value) {
            addCriterion("dict_templet_index_sign <>", value, "dictTempletIndexSign");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignGreaterThan(Integer value) {
            addCriterion("dict_templet_index_sign >", value, "dictTempletIndexSign");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignGreaterThanOrEqualTo(Integer value) {
            addCriterion("dict_templet_index_sign >=", value, "dictTempletIndexSign");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignLessThan(Integer value) {
            addCriterion("dict_templet_index_sign <", value, "dictTempletIndexSign");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignLessThanOrEqualTo(Integer value) {
            addCriterion("dict_templet_index_sign <=", value, "dictTempletIndexSign");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignIn(List<Integer> values) {
            addCriterion("dict_templet_index_sign in", values, "dictTempletIndexSign");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignNotIn(List<Integer> values) {
            addCriterion("dict_templet_index_sign not in", values, "dictTempletIndexSign");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignBetween(Integer value1, Integer value2) {
            addCriterion("dict_templet_index_sign between", value1, value2, "dictTempletIndexSign");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexSignNotBetween(Integer value1, Integer value2) {
            addCriterion("dict_templet_index_sign not between", value1, value2, "dictTempletIndexSign");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderIsNull() {
            addCriterion("dict_templet_index_order is null");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderIsNotNull() {
            addCriterion("dict_templet_index_order is not null");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderEqualTo(Integer value) {
            addCriterion("dict_templet_index_order =", value, "dictTempletIndexOrder");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderNotEqualTo(Integer value) {
            addCriterion("dict_templet_index_order <>", value, "dictTempletIndexOrder");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderGreaterThan(Integer value) {
            addCriterion("dict_templet_index_order >", value, "dictTempletIndexOrder");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderGreaterThanOrEqualTo(Integer value) {
            addCriterion("dict_templet_index_order >=", value, "dictTempletIndexOrder");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderLessThan(Integer value) {
            addCriterion("dict_templet_index_order <", value, "dictTempletIndexOrder");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderLessThanOrEqualTo(Integer value) {
            addCriterion("dict_templet_index_order <=", value, "dictTempletIndexOrder");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderIn(List<Integer> values) {
            addCriterion("dict_templet_index_order in", values, "dictTempletIndexOrder");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderNotIn(List<Integer> values) {
            addCriterion("dict_templet_index_order not in", values, "dictTempletIndexOrder");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderBetween(Integer value1, Integer value2) {
            addCriterion("dict_templet_index_order between", value1, value2, "dictTempletIndexOrder");
            return (Criteria) this;
        }

        public Criteria andDictTempletIndexOrderNotBetween(Integer value1, Integer value2) {
            addCriterion("dict_templet_index_order not between", value1, value2, "dictTempletIndexOrder");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdIsNull() {
            addCriterion("dict_exercise_id is null");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdIsNotNull() {
            addCriterion("dict_exercise_id is not null");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdEqualTo(String value) {
            addCriterion("dict_exercise_id =", value, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdNotEqualTo(String value) {
            addCriterion("dict_exercise_id <>", value, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdGreaterThan(String value) {
            addCriterion("dict_exercise_id >", value, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdGreaterThanOrEqualTo(String value) {
            addCriterion("dict_exercise_id >=", value, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdLessThan(String value) {
            addCriterion("dict_exercise_id <", value, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdLessThanOrEqualTo(String value) {
            addCriterion("dict_exercise_id <=", value, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdLike(String value) {
            addCriterion("dict_exercise_id like", value, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdNotLike(String value) {
            addCriterion("dict_exercise_id not like", value, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdIn(List<String> values) {
            addCriterion("dict_exercise_id in", values, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdNotIn(List<String> values) {
            addCriterion("dict_exercise_id not in", values, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdBetween(String value1, String value2) {
            addCriterion("dict_exercise_id between", value1, value2, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictExerciseIdNotBetween(String value1, String value2) {
            addCriterion("dict_exercise_id not between", value1, value2, "dictExerciseId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdIsNull() {
            addCriterion("dict_templet_id is null");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdIsNotNull() {
            addCriterion("dict_templet_id is not null");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdEqualTo(String value) {
            addCriterion("dict_templet_id =", value, "dictTempletId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdNotEqualTo(String value) {
            addCriterion("dict_templet_id <>", value, "dictTempletId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdGreaterThan(String value) {
            addCriterion("dict_templet_id >", value, "dictTempletId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdGreaterThanOrEqualTo(String value) {
            addCriterion("dict_templet_id >=", value, "dictTempletId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdLessThan(String value) {
            addCriterion("dict_templet_id <", value, "dictTempletId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdLessThanOrEqualTo(String value) {
            addCriterion("dict_templet_id <=", value, "dictTempletId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdLike(String value) {
            addCriterion("dict_templet_id like", value, "dictTempletId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdNotLike(String value) {
            addCriterion("dict_templet_id not like", value, "dictTempletId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdIn(List<String> values) {
            addCriterion("dict_templet_id in", values, "dictTempletId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdNotIn(List<String> values) {
            addCriterion("dict_templet_id not in", values, "dictTempletId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdBetween(String value1, String value2) {
            addCriterion("dict_templet_id between", value1, value2, "dictTempletId");
            return (Criteria) this;
        }

        public Criteria andDictTempletIdNotBetween(String value1, String value2) {
            addCriterion("dict_templet_id not between", value1, value2, "dictTempletId");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table dict_templet_index
     *
     * @mbggenerated do_not_delete_during_merge Tue Apr 10 16:03:01 CST 2018
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table dict_templet_index
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}