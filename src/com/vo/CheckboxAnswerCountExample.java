package com.vo;

import java.util.ArrayList;
import java.util.List;

public class CheckboxAnswerCountExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table checkbox_answer_count
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table checkbox_answer_count
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table checkbox_answer_count
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer_count
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public CheckboxAnswerCountExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer_count
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer_count
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer_count
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer_count
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer_count
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer_count
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer_count
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
     * This method corresponds to the database table checkbox_answer_count
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
     * This method corresponds to the database table checkbox_answer_count
     *
     * @mbggenerated Tue Apr 10 16:03:01 CST 2018
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer_count
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
     * This class corresponds to the database table checkbox_answer_count
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

        public Criteria andCheckboxAnswerCountIdIsNull() {
            addCriterion("checkbox_answer_count_id is null");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdIsNotNull() {
            addCriterion("checkbox_answer_count_id is not null");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdEqualTo(String value) {
            addCriterion("checkbox_answer_count_id =", value, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdNotEqualTo(String value) {
            addCriterion("checkbox_answer_count_id <>", value, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdGreaterThan(String value) {
            addCriterion("checkbox_answer_count_id >", value, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdGreaterThanOrEqualTo(String value) {
            addCriterion("checkbox_answer_count_id >=", value, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdLessThan(String value) {
            addCriterion("checkbox_answer_count_id <", value, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdLessThanOrEqualTo(String value) {
            addCriterion("checkbox_answer_count_id <=", value, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdLike(String value) {
            addCriterion("checkbox_answer_count_id like", value, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdNotLike(String value) {
            addCriterion("checkbox_answer_count_id not like", value, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdIn(List<String> values) {
            addCriterion("checkbox_answer_count_id in", values, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdNotIn(List<String> values) {
            addCriterion("checkbox_answer_count_id not in", values, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdBetween(String value1, String value2) {
            addCriterion("checkbox_answer_count_id between", value1, value2, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIdNotBetween(String value1, String value2) {
            addCriterion("checkbox_answer_count_id not between", value1, value2, "checkboxAnswerCountId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIsNull() {
            addCriterion("checkbox_answer_count is null");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIsNotNull() {
            addCriterion("checkbox_answer_count is not null");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountEqualTo(Integer value) {
            addCriterion("checkbox_answer_count =", value, "checkboxAnswerCount");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountNotEqualTo(Integer value) {
            addCriterion("checkbox_answer_count <>", value, "checkboxAnswerCount");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountGreaterThan(Integer value) {
            addCriterion("checkbox_answer_count >", value, "checkboxAnswerCount");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("checkbox_answer_count >=", value, "checkboxAnswerCount");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountLessThan(Integer value) {
            addCriterion("checkbox_answer_count <", value, "checkboxAnswerCount");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountLessThanOrEqualTo(Integer value) {
            addCriterion("checkbox_answer_count <=", value, "checkboxAnswerCount");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountIn(List<Integer> values) {
            addCriterion("checkbox_answer_count in", values, "checkboxAnswerCount");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountNotIn(List<Integer> values) {
            addCriterion("checkbox_answer_count not in", values, "checkboxAnswerCount");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountBetween(Integer value1, Integer value2) {
            addCriterion("checkbox_answer_count between", value1, value2, "checkboxAnswerCount");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerCountNotBetween(Integer value1, Integer value2) {
            addCriterion("checkbox_answer_count not between", value1, value2, "checkboxAnswerCount");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdIsNull() {
            addCriterion("design_checkbox_option_id is null");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdIsNotNull() {
            addCriterion("design_checkbox_option_id is not null");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdEqualTo(String value) {
            addCriterion("design_checkbox_option_id =", value, "designCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdNotEqualTo(String value) {
            addCriterion("design_checkbox_option_id <>", value, "designCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdGreaterThan(String value) {
            addCriterion("design_checkbox_option_id >", value, "designCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdGreaterThanOrEqualTo(String value) {
            addCriterion("design_checkbox_option_id >=", value, "designCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdLessThan(String value) {
            addCriterion("design_checkbox_option_id <", value, "designCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdLessThanOrEqualTo(String value) {
            addCriterion("design_checkbox_option_id <=", value, "designCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdLike(String value) {
            addCriterion("design_checkbox_option_id like", value, "designCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdNotLike(String value) {
            addCriterion("design_checkbox_option_id not like", value, "designCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdIn(List<String> values) {
            addCriterion("design_checkbox_option_id in", values, "designCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdNotIn(List<String> values) {
            addCriterion("design_checkbox_option_id not in", values, "designCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdBetween(String value1, String value2) {
            addCriterion("design_checkbox_option_id between", value1, value2, "designCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxOptionIdNotBetween(String value1, String value2) {
            addCriterion("design_checkbox_option_id not between", value1, value2, "designCheckboxOptionId");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table checkbox_answer_count
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
     * This class corresponds to the database table checkbox_answer_count
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