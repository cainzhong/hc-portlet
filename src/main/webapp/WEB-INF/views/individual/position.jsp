<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><spring:message code="T_PORTLET_TITLE" /></title>
<jsp:include page="../resourceInclude.jsp" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/individual.js"></script>
</head>
<body class="">
	<jsp:include page="../header.jsp" />

	<div class="container">
		<div>
			<em>Name & Navigation</em>
		</div>

		<c:set var="username" value="${pageContext.request.userPrincipal.name}" />
		<div>
			<span id="username" class="hide"><c:out value="${username}" /></span>
		</div>

		<c:url var="editJobAsked" value="/individual/editJobAsked">
			<c:param name="username" value="${username}" />
		</c:url>

		<div class="content">
			<table id="job_asked">
				<thead>
					<tr>
						<th colspan=3><spring:message code="T_INDIVIDUAL_POSITION_JOB_ASKED" /></th>
						<th class="fa-hover">
							<a id="job_asked_edit_btn"><i class="fa fa-pencil-square-o"></i></a>
							<div id="job_asked_submit" class="hide fa-hover">
								<a id="job_asked_submit_btn"><i class="fa fa-check"></i></a><a name="cancel_btn"><i class="fa fa-times"></i></a>
							</div></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${jobAskeds}" var="jobAsked">
						<form id="job_asked_form" method="post" action="${editJobAsked}">
							<tr>
								<td><spring:message code="T_INDIVIDUAL_POSITION_PROFESSIONAL_FIELD" /></td>
								<td><input name="proField" value="${jobAsked.proField}" /></td>
								<td><spring:message code="T_INDIVIDUAL_POSITION_JOB_ASKED" /></td>
								<td><input name="title" value="${jobAsked.title}" /></td>
							</tr>
							<tr>
								<td><spring:message code="T_INDIVIDUAL_POSITION_WORK_TIME_TYPE" /></td>
								<td><input name="workTimeType" value="<spring:message code="${jobAsked.workTimeType.type}" />" /></td>
								<td><spring:message code="T_INDIVIDUAL_POSITION_OFFICE_AREA" /></td>
								<td><input name="officeArea" value="${jobAsked.officeArea}" /></td>
							</tr>
							<tr>
								<td><spring:message code="T_INDIVIDUAL_POSITION_EXPECT_SALARY" /></td>
								<td><input name="expectSalary" value="${jobAsked.expectSalary}" /></td>
								<td><spring:message code="T_INDIVIDUAL_POSITION_OTHER_REQUIREMENT" /></td>
								<td><input name="requirement" value="${jobAsked.requirement}" /></td>
							</tr>
						</form>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>

	<p id="back-to-top">
		<a href="#top" title="<spring:message code="T_INDIVIDUAL_BACK_TO_TOP" />"><i class="fa fa-chevron-circle-up fa-2x"></i></a>
	</p>

	<div id="dialog-success" title="Confirm" class="hide">
		<p>
			<spring:message code="T_INDIVIDUAL_DATA_UPDATE_SUCCESS" />
		</p>
	</div>

	<jsp:include page="../footer.jsp" />

</body>
<script type="text/javascript">
	$(document).ready(function() {

		disableAllInput();
		
		// disable all the input box in the page when first get into the page.
		function disableAllInput() {
			$("#job_asked").find("input").attr("disabled", true);
		}

		//edit btn
		$("#job_asked_edit_btn").click(function() {
			$(this).hide();
			$("#job_asked_submit").show();
			$("#job_asked").find("input").attr("disabled", false);
		});
		
		//cancel btn
		$("job_asked_submit a[name='cancel_btn']").click(function() {
			location.reload();
		});
		
		//submit btn
		$("#job_asked_submit_btn").click(function(){
			$("#job_asked_form").submit();
		});
		
		$("#dialog-success").dialog({
			modal : true,
			autoOpen : false,
			resizable : false,
			width : 480,
			height : 260
		});

		//首先将#back-to-top隐藏
		$("#back-to-top").hide();
		//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
		$(function() {
			$(window).scroll(function() {
				if ($(window).scrollTop() > 100) {
					$("#back-to-top").fadeIn(1500);
				} else {
					$("#back-to-top").fadeOut(1500);
				}
			});
			//当点击跳转链接后，回到页面顶部位置
			$("#back-to-top").click(function() {
				$('body,html').animate({
					scrollTop : 0
				}, 10);
				return false;
			});
		});
	});
</script>
</html>