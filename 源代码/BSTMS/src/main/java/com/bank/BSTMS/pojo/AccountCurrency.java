package com.bank.BSTMS.pojo;

import java.io.Serializable;

public class AccountCurrency implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column account_currency.CardID
     *
     * @mbggenerated
     */
    private String cardid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column account_currency.AccountBalance
     *
     * @mbggenerated
     */
    private String accountbalance;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column account_currency.Type
     *
     * @mbggenerated
     */
    private String type;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table account_currency
     *
     * @mbggenerated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column account_currency.CardID
     *
     * @return the value of account_currency.CardID
     *
     * @mbggenerated
     */
    public String getCardid() {
        return cardid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column account_currency.CardID
     *
     * @param cardid the value for account_currency.CardID
     *
     * @mbggenerated
     */
    public void setCardid(String cardid) {
        this.cardid = cardid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column account_currency.AccountBalance
     *
     * @return the value of account_currency.AccountBalance
     *
     * @mbggenerated
     */
    public String getAccountbalance() {
        return accountbalance;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column account_currency.AccountBalance
     *
     * @param accountbalance the value for account_currency.AccountBalance
     *
     * @mbggenerated
     */
    public void setAccountbalance(String accountbalance) {
        this.accountbalance = accountbalance;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column account_currency.Type
     *
     * @return the value of account_currency.Type
     *
     * @mbggenerated
     */
    public String getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column account_currency.Type
     *
     * @param type the value for account_currency.Type
     *
     * @mbggenerated
     */
    public void setType(String type) {
        this.type = type;
    }
}