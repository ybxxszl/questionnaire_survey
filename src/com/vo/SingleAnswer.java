package com.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class SingleAnswer implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column single_answer.single_answer_id
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    private String singleAnswerId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column single_answer.design_single_id
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    private String designSingleId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column single_answer.dict_single_option_id
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    private String dictSingleOptionId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column single_answer.single_answer_id
     *
     * @return the value of single_answer.single_answer_id
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public String getSingleAnswerId() {
        return singleAnswerId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column single_answer.single_answer_id
     *
     * @param singleAnswerId the value for single_answer.single_answer_id
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public void setSingleAnswerId(String singleAnswerId) {
        this.singleAnswerId = singleAnswerId == null ? null : singleAnswerId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column single_answer.design_single_id
     *
     * @return the value of single_answer.design_single_id
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public String getDesignSingleId() {
        return designSingleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column single_answer.design_single_id
     *
     * @param designSingleId the value for single_answer.design_single_id
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public void setDesignSingleId(String designSingleId) {
        this.designSingleId = designSingleId == null ? null : designSingleId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column single_answer.dict_single_option_id
     *
     * @return the value of single_answer.dict_single_option_id
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public String getDictSingleOptionId() {
        return dictSingleOptionId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column single_answer.dict_single_option_id
     *
     * @param dictSingleOptionId the value for single_answer.dict_single_option_id
     *
     * @mbggenerated Sun Jan 07 16:26:51 CST 2018
     */
    public void setDictSingleOptionId(String dictSingleOptionId) {
        this.dictSingleOptionId = dictSingleOptionId == null ? null : dictSingleOptionId.trim();
    }
}