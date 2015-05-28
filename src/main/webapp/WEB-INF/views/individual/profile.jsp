<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>中华海外人才网</title>
<jsp:include page="../resourceInclude.jsp" />
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/custom.css' type="text/css">
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/main.css' type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/individual.js"></script>
</head>
<body class="">
	<jsp:include page="../header.jsp" />

	<div class="container">
		<div>
			<em>Name & Navigation</em>
		</div>

		<c:set var="username" value="email@email.com" />
		<div>
			<span id="username"><c:out value="${username}" /></span>
		</div>

		<div>
			<table id="basic_info">
				<thead>
					<tr>
						<th colspan=3>基本资料</th>
						<th><a id="basic_info_edit_btn">Edit</a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>真实姓名</td>
						<td id="real_name"><c:out value="${user.realName}" /></td>
						<td>英文名</td>
						<td id="english_name"><c:out value="${user.englishName}" /></td>
					</tr>
					<tr>
						<td>所在地区</td>
						<td id="current_country"><c:out value="${user.currentCountry}" /> <c:out value="${user.currentCity}" /></td>
						<td>邮箱地址</td>
						<td id="email"><c:out value="${email}" /></td>
					</tr>
					<tr>
						<td>手机号码</td>
						<td id="telephone"><c:out value="${telephone}" /></td>
						<td>QQ号码</td>
						<td id="qq"><c:out value="${qq}" /></td>
					</tr>
					<tr>
						<td>微信号</td>
						<td id="webchat"><c:out value="${webchat}" /></td>
					</tr>
				</tbody>
			</table>
			<div id="basic_info_submit" class="hide tableBtn">
				<a id="basic_info_submit_btn">Submit</a><a>Cancel</a>
			</div>

			<c:forEach items="${personalHistories}" var="personalHistory">
				<table class="personal_history" id="personal_history_table${personalHistory.id}">
					<thead>
						<tr>
							<th colspan=3>学历资料</th>
							<th><a name="personal_history_edit_btn">Edit</a> <span class="hide"><c:out value="${personalHistory.id}" /></span></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>毕业学校</td>
							<td class="university"><c:out value="${personalHistory.university}" /></td>
							<td>所在专业</td>
							<td class="major"><c:out value="${personalHistory.major}" /></td>
						</tr>
						<tr>
							<td>学历</td>
							<td class="university_degree"><spring:message code="${personalHistory.universityDegree.degree}" /></td>
							<td>毕业年份</td>
							<td class="graduation_year"><c:out value="${personalHistory.graduationYear}" /></td>
						</tr>
					</tbody>
				</table>
				<div id="personal_history_submit${personalHistory.id}" class="hide tableBtn">
					<a name="personal_history_submit_btn${personalHistory.id}">Submit</a> <a>Cancel</a>
				</div>
			</c:forEach>

			<table id="awards">
				<thead>
					<tr>
						<th colspan=3>获得荣誉</th>
					</tr>
				</thead>
				<c:forEach items="${awardsList}" var="awards">
					<tbody>
						<tr>
							<c:if test="${awards.type.identify eq 0}">
								<td>荣誉称号</td>
								<td class="award_type"><c:out value="${awards.type.type}" /></td>
								<td class="award_description"><c:out value="${awards.description}" /></td>
								<td><a name="award_edit_btn">Edit</a>
									<div class="award_submit hide">
										<a name="award_submit_btn">Submit</a> <a>Cancel</a>
									</div> <span class="hide"><c:out value="${awards.id}" /></span></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${awards.type.identify eq 1}">
								<td>论文专著</td>
								<td class="award_type"><c:out value="${awards.type.type}" /></td>
								<td class="award_description"><c:out value="${awards.description}" /></td>
								<td><a name="award_edit_btn">Edit</a>
									<div class="award_submit hide">
										<a name="award_submit_btn">Submit</a> <a>Cancel</a>
									</div> <span class="hide"><c:out value="${awards.id}" /></span></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${awards.type.identify eq 2}">
								<td>INTELLECTUAL PROPERTY</td>
								<td class="award_type"><c:out value="${awards.type.type}" /></td>
								<td class="award_description"><c:out value="${awards.description}" /></td>
								<td><a name="award_edit_btn">Edit</a>
									<div class="award_submit hide">
										<a name="award_submit_btn">Submit</a> <a>Cancel</a>
									</div> <span class="hide"><c:out value="${awards.id}" /></span></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${awards.type.identify eq 3}">
								<td>${awards.other}</td>
								<td class="award_type"><c:out value="${awards.type.type}" /></td>
								<td class="award_description"><c:out value="${awards.description}" /></td>
								<td><a name="award_edit_btn">Edit</a>
									<div class="award_submit hide">
										<a name="award_submit_btn">Submit</a> <a>Cancel</a>
									</div> <span class="hide"><c:out value="${awards.id}" /></span></td>
							</c:if>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>

	<div id="dialog-success" title="Confirm" class="hide">
		<p>The data has been updated successfully.</p>
	</div>

	<div id="dialog-error" title="Confirm" class="hide">
		<p>The data can not be updated! Please try again.</p>
	</div>

	<div id="dialog-ajax-error" title="Ajax Error" class="hide">
		<p>The data can not be retrived from serve! Please try again.</p>
	</div>

	<jsp:include page="../footer.jsp" />

</body>
<script type="text/javascript">
	$("#dialog-success").dialog({
		modal : true,
		autoOpen : false,
		buttons : {
			"Ok" : function() {
				location.reload();
			},
			"Cancel" : function() {
				$(this).dialog('close');
			}
		}
	});

	$("#dialog-error").dialog({
		modal : true,
		autoOpen : false,
		buttons : {
			"Ok" : function() {
				location.reload();
			},
			"Cancel" : function() {
				$(this).dialog('close');
			}
		}
	});

	$("#dialog-ajax-error").dialog({
		modal : true,
		autoOpen : false,
		buttons : {
			"Ok" : function() {
				location.reload();
			},
			"Cancel" : function() {
				$(this).dialog('close');
			}
		}
	});
</script>
</html>