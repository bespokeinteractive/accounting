<%--
 *  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Accounting module.
 *
 *  Billing module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Billing module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Billing module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<openmrs:require privilege="Add/Edit Account" otherwise="/login.htm"
	redirect="/module/accounting/account.list" />

<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/nav.jsp" %>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/moduleResources/accounting/scripts/jquery/css/thickbox.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/accounting/scripts/jquery/jquery.ui.autocomplete.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/accounting/scripts/jquery/jquery.thickbox.js"></script>
<openmrs:htmlInclude file="/scripts/calendar/calendar.js" />

<h2>
	<spring:message code="accounting.payment.addedit" />
</h2>

<c:forEach items="${errors.allErrors}" var="error">
	<span class="error"><spring:message
			code="${error.defaultMessage}" text="${error.defaultMessage}" /> </span>
</c:forEach>
<spring:bind path="payment">
	<c:if test="${not empty  status.errorMessages}">
		<div class="error">
			<ul>
				<c:forEach items="${status.errorMessages}" var="error">
					<li>${error}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
</spring:bind>
<form:form method="post" commandName="payment" cssClass="box">
	<table>
		<tr>
			<td><spring:message code="accounting.account" /></td>
			<td><input type="text" id="comboAccount"/><form:hidden path="account" id="hiddenAccount"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.payee" /></td>
			<td><input type="text" id="comboPayee"/><form:hidden path="payee" id="hiddenPayee"/>
			</td>
			<td><input type="button" value="Add Payee" onclick="addPayee()"/></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.payment.date"/></td>
			<td>
				<form:input path="paymentDate" onfocus="showCalendar(this)"/>
			</td>
			<td><form:errors path="paymentDate"  cssClass="error" /></td>
		</tr>
		
		<tr>
			<td><spring:message code="accounting.orderReferenceNumber"/></td>
			<td><form:input path="referenceOrderNo"/></td>
			<td><form:errors path="referenceOrderNo"  cssClass="error" /></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.commitmentNo"/></td>
			<td><form:input path="commitmentNo"/></td>
			<td><form:errors path="commitmentNo"  cssClass="error" /></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.voucherNo"/></td>
			<td><form:input path="voucherNo"/></td>
			<td><form:errors path="voucherNo"  cssClass="error" /></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.totalCommitment"/></td>
			<td><form:input path="totalCommitment"/></td>
			<td><form:errors path="totalCommitment"  cssClass="error" /></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.payable"/></td>
			<td><form:input path="payable"/></td>
			<td><form:errors path="payable"  cssClass="error" /></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.totalPayable"/></td>
			<td><form:input path="totalPayable"/></td>
			<td><form:errors path="totalPayable"  cssClass="error" /></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.actualPayment"/></td>
			<td><form:input path="actualPayment"/></td>
			<td><form:errors path="actualPayment"  cssClass="error" /></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.totalActualPayment"/></td>
			<td><form:input path="totalActualPayment"/></td>
			<td><form:errors path="totalActualPayment"  cssClass="error" /></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.totalPayablePlusPayment"/></td>
			<td><form:input path="totalPayablePlusPayment"/></td>
			<td><form:errors path="totalPayablePlusPayment"  cssClass="error" /></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.status"/></td>
			<td><form:select path="status">
				<form:options items="${paymentStatuses}"  itemLabel="name"/>
			</form:select></td>
			<td><form:errors path="status"  cssClass="error" /></td>
		</tr>
		<tr>
			<td><spring:message code="accounting.note"/></td>
			<td><form:input path="note"/></td>
			<td><form:errors path="note"  cssClass="error" /></td>
		</tr>
		<tr>
			<td><spring:message code="general.retired" /></td>
			<td>
				<form:radiobutton path="retired" value="false" />NO 
				<form:radiobutton path="retired" value="true" />YES
			</td>
			<td><form:errors path="retired" cssClass="error" /></td>
		</tr>
	</table>
	<br /> <input type="submit"
		value="<spring:message code="general.save"/>"> <input
		type="button" value="<spring:message code="general.cancel"/>"
		onclick="javascript:window.location.href='payment.list'">
</form:form>
<input type="hidden" value='${listPayees}' id="listPayees"/>
<input type="hidden" value='${accounts}' id="accounts"/>

<script>
	function addPayee() {
		tb_show("Add Payee","payee.form?&keepThis=true&TB_iframe=true&height=250&width=400",null);
	}
	
	jQuery(document).ready(function(){
		var arrPayee=[];
		 var payees = jQuery("#listPayees").val();
		var obj = jQuery.parseJSON(payees);

		jQuery.each(obj, function (index, value) {
			arrPayee.push({id:value["id"], label:value["name"]});
		});
		
		jQuery( "#comboPayee" ).autocomplete({
					 minLength: 0,
			      source: arrPayee,
			      focus: function( event, ui ) {
					
			        jQuery( "#comboPayee" ).val( ui.item.label );
					return false;
			      },
			      select: function( event, ui ) {
			        jQuery( "#comboPayee" ).val( ui.item.label );
			        jQuery( "#hiddenPayee" ).val( ui.item.id );
					return false;
			      }
		   });
		var arrAccount=[];
		 var accounts = jQuery("#accounts").val();
		var obj = jQuery.parseJSON(accounts);

		jQuery.each(obj, function (index, value) {
			arrAccount.push({id:value["id"], label:value["name"]});
		});
		
		jQuery( "#comboAccount" ).autocomplete({
					 minLength: 0,
			      source: arrAccount,
			      focus: function( event, ui ) {
					
			        jQuery( "#comboAccount" ).val( ui.item.label );
					return false;
			      },
			      select: function( event, ui ) {
			        jQuery( "#comboAccount" ).val( ui.item.label );
			        jQuery( "#hiddenAccount" ).val( ui.item.id );
					return false;
			      }
		   });
	});
</script>
<%@ include file="/WEB-INF/template/footer.jsp"%>