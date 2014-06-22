package org.openmrs.module.accounting.api.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Type;


@Entity
@Table(name = "accounting_payment")
public class Payment {
	@Id
	@GeneratedValue
	@Column(name = "payment_id")
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name="account_id")
	private Account account;
	
	@ManyToOne
	@JoinColumn(name="payee_id")
	private Payee payee;
	
	@Column(name = "ref_order_no")
	private String referenceOrderNo;
	
	@Column(name = "commitment_no")
	private Integer commitmentNo;
	
	@Column(name = "voucher_no")
	private String voucherNo;
	
	@Column(name = "cost", precision = 9, scale = 2)
	private BigDecimal cost;
	
	@Column(name = "total_commitment", precision = 9, scale = 2)
	private BigDecimal totalCommitment;
	
	@Column(name = "payable", precision = 9, scale = 2)
	private BigDecimal payable;
	
	@Column(name = "total_payable", precision = 9, scale = 2)
	private BigDecimal totalPayable;
	
	@Column(name = "actual_payment", precision = 9, scale = 2)
	private BigDecimal actualPayment;
	
	@Column(name = "total_actual_payment", precision = 9, scale = 2)
	private BigDecimal totalActualPayment;
	
	@Column(name = "total_payable_plus_payment", precision = 9, scale = 2)
	private BigDecimal totalPayablePlusPayment;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "payment_date")
	private  Date paymentDate;
	
	@Column(name = "created_date")
	@Type(type="timestamp")
	private Date createdDate;
	
	@Column(name = "created_by")
	private int createdBy;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "status")
	private PaymentStatus status;
	
	@Column(name = "updated_by")
	private Integer updatedBy;
	
	@Column(name = "updated_date")
	@Type(type="timestamp")
	private Date updatedDate;

	@Column(name = "retired_date")
	@Type(type="timestamp")
	private Date retiredDate;
	
	@Column(name = "retired_by")
	private Integer retiredBy;
	
	@Column(name="note", length=1000)
	private String note;

	@Column(name = "retired")
	private Boolean retired;
	
	public Payment(){
		this.retired = false;
		this.status = PaymentStatus.OPEN;
	}
	
    public Integer getId() {
    	return id;
    }

	
    public void setId(Integer id) {
    	this.id = id;
    }

	
    public Account getAccount() {
    	return account;
    }

	
    public void setAccount(Account account) {
    	this.account = account;
    }

	
    public Payee getPayee() {
    	return payee;
    }

	
    public void setPayee(Payee payee) {
    	this.payee = payee;
    }

	
    public String getReferenceOrderNo() {
    	return referenceOrderNo;
    }

	
    public void setReferenceOrderNo(String referenceOrderNo) {
    	this.referenceOrderNo = referenceOrderNo;
    }

	
    public Integer getCommitmentNo() {
    	return commitmentNo;
    }

	
    public void setCommitmentNo(Integer commitmentNo) {
    	this.commitmentNo = commitmentNo;
    }

	
    public String getVoucherNo() {
    	return voucherNo;
    }

	
    public void setVoucherNo(String voucherNo) {
    	this.voucherNo = voucherNo;
    }

	
    public BigDecimal getCost() {
    	return cost;
    }

	
    public void setCost(BigDecimal cost) {
    	this.cost = cost;
    }

	
    public BigDecimal getTotalCommitment() {
    	return totalCommitment;
    }

	
    public void setTotalCommitment(BigDecimal totalCommitment) {
    	this.totalCommitment = totalCommitment;
    }

	
    public BigDecimal getPayable() {
    	return payable;
    }

	
    public void setPayable(BigDecimal payable) {
    	this.payable = payable;
    }

	
    public BigDecimal getTotalPayable() {
    	return totalPayable;
    }

	
    public void setTotalPayable(BigDecimal totalPayable) {
    	this.totalPayable = totalPayable;
    }

	
    public BigDecimal getActualPayment() {
    	return actualPayment;
    }

	
    public void setActualPayment(BigDecimal actualPayment) {
    	this.actualPayment = actualPayment;
    }

	
    public BigDecimal getTotalActualPayment() {
    	return totalActualPayment;
    }

	
    public void setTotalActualPayment(BigDecimal totalActualPayment) {
    	this.totalActualPayment = totalActualPayment;
    }

	
    public BigDecimal getTotalPayablePlusPayment() {
    	return totalPayablePlusPayment;
    }

	
    public void setTotalPayablePlusPayment(BigDecimal totalPayablePlusPayment) {
    	this.totalPayablePlusPayment = totalPayablePlusPayment;
    }

	
    public Date getPaymentDate() {
    	return paymentDate;
    }

	
    public void setPaymentDate(Date paymentDate) {
    	this.paymentDate = paymentDate;
    }


	
    public int getCreatedBy() {
    	return createdBy;
    }

	
    public void setCreatedBy(int createdBy) {
    	this.createdBy = createdBy;
    }

	
    public PaymentStatus getStatus() {
    	return status;
    }

	
    public void setStatus(PaymentStatus status) {
    	this.status = status;
    }

	
    public Integer getUpdatedBy() {
    	return updatedBy;
    }

	
    public void setUpdatedBy(Integer updatedBy) {
    	this.updatedBy = updatedBy;
    }


	
    public Date getCreatedDate() {
    	return createdDate;
    }


	
    public void setCreatedDate(Date createdDate) {
    	this.createdDate = createdDate;
    }


	
    public Date getUpdatedDate() {
    	return updatedDate;
    }


	
    public void setUpdatedDate(Date updatedDate) {
    	this.updatedDate = updatedDate;
    }


	@Override
    public int hashCode() {
	    final int prime = 31;
	    int result = 1;
	    result = prime * result + createdBy;
	    result = prime * result + ((createdDate == null) ? 0 : createdDate.hashCode());
	    result = prime * result + ((id == null) ? 0 : id.hashCode());
	    return result;
    }


	@Override
    public boolean equals(Object obj) {
	    if (this == obj)
		    return true;
	    if (obj == null)
		    return false;
	    if (getClass() != obj.getClass())
		    return false;
	    Payment other = (Payment) obj;
	    if (createdBy != other.createdBy)
		    return false;
	    if (createdDate == null) {
		    if (other.createdDate != null)
			    return false;
	    } else if (!createdDate.equals(other.createdDate))
		    return false;
	    if (id == null) {
		    if (other.id != null)
			    return false;
	    } else if (!id.equals(other.id))
		    return false;
	    return true;
    }


	
    public Date getRetiredDate() {
    	return retiredDate;
    }


	
    public void setRetiredDate(Date retiredDate) {
    	this.retiredDate = retiredDate;
    }


	
    public Integer getRetiredBy() {
    	return retiredBy;
    }


	
    public void setRetiredBy(Integer retiredBy) {
    	this.retiredBy = retiredBy;
    }


	
    public String getNote() {
    	return note;
    }


	
    public void setNote(String note) {
    	this.note = note;
    }


	
    public Boolean getRetired() {
    	return retired;
    }


	
    public void setRetired(Boolean retired) {
    	this.retired = retired;
    }

	

}
