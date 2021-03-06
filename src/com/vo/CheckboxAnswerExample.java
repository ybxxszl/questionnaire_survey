package com.vo;

import java.util.ArrayList;
import java.util.List;

public class CheckboxAnswerExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public CheckboxAnswerExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
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
     * This method corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
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

        public Criteria andCheckboxAnswerIdIsNull() {
            addCriterion("checkbox_answer_id is null");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdIsNotNull() {
            addCriterion("checkbox_answer_id is not null");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdEqualTo(String value) {
            addCriterion("checkbox_answer_id =", value, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdNotEqualTo(String value) {
            addCriterion("checkbox_answer_id <>", value, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdGreaterThan(String value) {
            addCriterion("checkbox_answer_id >", value, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdGreaterThanOrEqualTo(String value) {
            addCriterion("checkbox_answer_id >=", value, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdLessThan(String value) {
            addCriterion("checkbox_answer_id <", value, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdLessThanOrEqualTo(String value) {
            addCriterion("checkbox_answer_id <=", value, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdLike(String value) {
            addCriterion("checkbox_answer_id like", value, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdNotLike(String value) {
            addCriterion("checkbox_answer_id not like", value, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdIn(List<String> values) {
            addCriterion("checkbox_answer_id in", values, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdNotIn(List<String> values) {
            addCriterion("checkbox_answer_id not in", values, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdBetween(String value1, String value2) {
            addCriterion("checkbox_answer_id between", value1, value2, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andCheckboxAnswerIdNotBetween(String value1, String value2) {
            addCriterion("checkbox_answer_id not between", value1, value2, "checkboxAnswerId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdIsNull() {
            addCriterion("design_checkbox_id is null");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdIsNotNull() {
            addCriterion("design_checkbox_id is not null");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdEqualTo(String value) {
            addCriterion("design_checkbox_id =", value, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdNotEqualTo(String value) {
            addCriterion("design_checkbox_id <>", value, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdGreaterThan(String value) {
            addCriterion("design_checkbox_id >", value, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdGreaterThanOrEqualTo(String value) {
            addCriterion("design_checkbox_id >=", value, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdLessThan(String value) {
            addCriterion("design_checkbox_id <", value, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdLessThanOrEqualTo(String value) {
            addCriterion("design_checkbox_id <=", value, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdLike(String value) {
            addCriterion("design_checkbox_id like", value, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdNotLike(String value) {
            addCriterion("design_checkbox_id not like", value, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdIn(List<String> values) {
            addCriterion("design_checkbox_id in", values, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdNotIn(List<String> values) {
            addCriterion("design_checkbox_id not in", values, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdBetween(String value1, String value2) {
            addCriterion("design_checkbox_id between", value1, value2, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDesignCheckboxIdNotBetween(String value1, String value2) {
            addCriterion("design_checkbox_id not between", value1, value2, "designCheckboxId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdIsNull() {
            addCriterion("dict_checkbox_option_id is null");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdIsNotNull() {
            addCriterion("dict_checkbox_option_id is not null");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdEqualTo(String value) {
            addCriterion("dict_checkbox_option_id =", value, "dictCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdNotEqualTo(String value) {
            addCriterion("dict_checkbox_option_id <>", value, "dictCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdGreaterThan(String value) {
            addCriterion("dict_checkbox_option_id >", value, "dictCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdGreaterThanOrEqualTo(String value) {
            addCriterion("dict_checkbox_option_id >=", value, "dictCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdLessThan(String value) {
            addCriterion("dict_checkbox_option_id <", value, "dictCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdLessThanOrEqualTo(String value) {
            addCriterion("dict_checkbox_option_id <=", value, "dictCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdLike(String value) {
            addCriterion("dict_checkbox_option_id like", value, "dictCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdNotLike(String value) {
            addCriterion("dict_checkbox_option_id not like", value, "dictCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdIn(List<String> values) {
            addCriterion("dict_checkbox_option_id in", values, "dictCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdNotIn(List<String> values) {
            addCriterion("dict_checkbox_option_id not in", values, "dictCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdBetween(String value1, String value2) {
            addCriterion("dict_checkbox_option_id between", value1, value2, "dictCheckboxOptionId");
            return (Criteria) this;
        }

        public Criteria andDictCheckboxOptionIdNotBetween(String value1, String value2) {
            addCriterion("dict_checkbox_option_id not between", value1, value2, "dictCheckboxOptionId");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table checkbox_answer
     *
     * @mbggenerated do_not_delete_during_merge Sun Jan 07 16:26:51 CST 2018
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table checkbox_answer
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
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