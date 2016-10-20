<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	h1,h2,h3,h4,h5,h6{margin:0 0 10px;font-weight:400;color:#ffffff;}h1.glyphicons,h2.glyphicons,h3.glyphicons,h4.glyphicons,h5.glyphicons,h6.glyphicons{color:#ffffff;}
	select,textarea,input[type="text"],input[type="password"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="search"],input[type="tel"],input[type="color"],.uneditable-input{margin-bottom:0px;}
	
	
	.table-condensed th {background-color: rgba(0, 0, 0, 0.5); text-align: left;}
	.table-condensed td {vertical-align: middle;}
	#pinfoData label {float: left;vertical-align: middle;padding-right:20px;}
	.input-append .add-on{padding:4px;} 
	.input-append {
		margin-bottom: 0px;
	}
</style>
<!-- 내용 -->
<div class="widget" style="margin-bottom: 0px;">
	<form id="form02" name="form02"  method="post">
		<table summary="사용자정보등록/수정" style="width: 100%;" class="table table-bordered table-condensed">
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			<tbody>				
				<tr>
					<th scope="row">사용자 아이디 *</th>
					<td >
						<c:if test="${mode =='I' }">
							<input type="text" id="userId" name="userId" value="${userInfo.user_id}" onchange="javascript:userIdChange();" style="width:80%;">							
						</c:if>	
						<c:if test="${mode =='U'}">
							<input type="text" id="userId" name="userId" readonly="readonly" value="${userInfo.user_id}" style="width:80%;">
							<div class="pagination pagination-small pull-right" style="margin: 1px 4px 0px 0px;">
								<div data-toggle="tooltip" data-placement="bottom" style="word-break:break-all; word-wrap:break-word; float: left;" title="비밀번호 수정">
									<a id="passwordChangeBtn" class="btn-action glyphicons keys btn-inverse"  href="javascript:passwordCahnge('${userInfo.user_id}');"><i></i></a>
								</div>
							</div>							
						</c:if>	
						<c:if test="${mode =='V'}">
							${userInfo.user_id}
						</c:if>		
						<input type="hidden" id="mode" value="${mode}"/>
					</td>					
					<th scope="row">사용자명 *</th>					
					<td>
						<c:if test="${mode !='V' }">
							<input type="text" id="userName" name="userName"  value="${userInfo.user_nm}" style="width:80%;">
						</c:if>
						<c:if test="${mode =='V' }">
							${userInfo.user_nm}
						</c:if>
					</td>
				</tr>
				<c:if test="${mode =='I' }">
					<tr>
						<th scope="row">패스워드 *</th>
						<td>			
							<input type="password" id="password1" name="password1"  value="" style="width:80%;">
						</td>
						<th scope="row">패스워드확인 *</th>
						<td>
							<input type="password" id="password2" name="password2"  value="" style="width:80%;">							
						</td>					
					</tr>
				</c:if>		
				<tr>						
					<th scope="row">소속 *</th>
					<td>
						<c:if test="${mode !='V' }">
							<input type="text" id="blg" name="blg"  value="${userInfo.blg}" style="width:80%;">
						</c:if>
						<c:if test="${mode =='V' }">
							${userInfo.blg}
						</c:if>
					</td>
					<th scope="row">부서 *</th>
					<td>
						<c:if test="${mode !='V' }">
							<input type="text" id="department" name="department"  value="${userInfo.dept}" style="width:80%;">
						</c:if>
						<c:if test="${mode =='V' }">
							${userInfo.dept}
						</c:if>
					</td>
				</tr>			
				<tr>
					<th scope="row">직급 *</th>
					<td>
						<c:if test="${mode !='V' }">
							<input type="text" id="jgd" name="jgd"  value="${userInfo.jgd}" style="width:80%;">
						</c:if>
						<c:if test="${mode =='V' }">
							${userInfo.jgd}
						</c:if>
					</td>
					<th scope="row">담당업무</th>
					<td>
						<c:if test="${mode !='V' }">
							<input type="text" id="cg_biz_def" name="cg_biz_def"  value="${userInfo.cg_biz_def}" style="width:80%;">
						</c:if>
						<c:if test="${mode =='V' }">
							${userInfo.cg_biz_def}
						</c:if>
					</td>
							
				</tr>					
				<tr>
					<th scope="row">휴대폰번호</th>
					<td>
						<c:if test="${mode !='V' }">
							<input type="text" id="phoneNo" name="phoneNo"  value="${userInfo.hpnm_no}" style="width:80%;">
						</c:if>
						<c:if test="${mode =='V' }">
							${userInfo.hpnm_no}
						</c:if>
					</td>
					<th scope="row">권한구분</th>
					<td>					
						<c:choose>
							<c:when test="${mode =='I' }">
								<select id="authDivision" name="authDivision" style="width: 140px;"  selected="selected">						
									<option value="1">사용자</option>
									<option value="3">관리자</option>
								</select>
							</c:when>
							<c:when test="${mode =='U' }">
								<select id="authDivision" name="authDivision" style="width: 140px;" selected="selected" disabled="disabled">						
									<option value="1">사용자</option>
									<option value="3">관리자</option>
								</select>
							</c:when>
							<c:when test="${mode =='V' }">
								<c:choose>										
									<c:when test="${userInfo.auth_dv == '슈퍼유저'}">
										관리자
									</c:when>
									<c:otherwise>
										${userInfo.auth_dv}
									</c:otherwise>
								</c:choose>
							</c:when>
						</c:choose>						
					</td>	
				</tr>
				<tr>
					<th scope="row">사용자만료일</th>
					<td>
						<c:if test="${mode !='V' }">
							<div class="input-append">	
								<input type="text"  id="userExpired"   name="userExpired" value="${userInfo.user_expd}" style="width:80%;"/>
								<span class="add-on glyphicons calendar" ><i></i></span>
							</div>
						</c:if>
						<c:if test="${mode =='V' }">
							${userInfo.user_expd}
						</c:if>
					</td>	
					<th scope="row">사용여부</th>
					<td>
						<c:if test="${mode !='V' }">
							<select id="useYn" name="useYn" style="width:140px;" >							
								<option value="Y">사용</option>				         
				        		<option value="N">미사용</option>	
							</select>	
						</c:if>
						<c:if test="${mode =='V' }">
							${userInfo.use_yn}
						</c:if>
					</td>
				</tr>		
				<tr>
					<th scope="row">PG 모니터링 경로</th>
					<td>
						<c:if test="${mode !='V' }">
							<input type="text" id="pg_mon_client_path" name="pg_mon_client_path" value="${userInfo.pg_mon_client_path}" style="width:80%;">	
						</c:if>
						<c:if test="${mode =='V' }">
							${userInfo.pg_mon_client_path}
						</c:if>
					</td>	
					<th scope="row">암호화 관리 경로</th>
					<td>
						<c:if test="${mode !='V' }">
							<input type="text" id="enc_mng_path" name="enc_mng_path" value="${userInfo.enc_mng_path}" style="width:80%;">
						</c:if>
						<c:if test="${mode =='V' }">
							${userInfo.enc_mng_path}
						</c:if>
					</td>
				</tr>			
			</tbody>
		</table>
		<label style="text-align: right; font-weight: bold;">* 필수입력항목</label>
	</form>	
</div>

<script src="theme/scripts/load.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var date = new Date();
		var now = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
		getCalendar('form02','userExpired', now);	
		
		$('#userExpired').datepicker();
	    $('#userExpired').datepicker("option", "minDate", now);
	    $('#userExpired').datepicker("option", "onClose", function ( selectedDate ) {
	        
	    });
	    $('#userExpired').click(function () {
	    	var style = $('#ui-datepicker-div').attr('style');
	    	style = style.replace('z-index: 3', 'z-index: 1051');
	    	
	    	$('#ui-datepicker-div').attr('style', style);
	    	//'left: 390.35px; top: 429.5px; display: block; position: fixed; z-index: 1051;'
	    	//alert($('#ui-datepicker-div').attr('style'));
	    	
        });
		
		var mode = $("#mode").val();
		
		//사용자정보 수정의 경우 Select Box의 Option값을 DB에 등록되어 있는 값으로 설정 
		if (mode == 'U') {
			selected('authDivision', '${userInfo.auth_dv}');
			selected('useYn', '${userInfo.use_yn}');
		}
		
		//사용자 등록시 사용자 만료일을 오늘날짜로 설정
		var userExpired = $("#userExpired").val();
		if (userExpired == null || userExpired == '') {
			var toDay = new Date();
			//var tmp = 
			var year = toDay.getFullYear();
			
			var month = toDay.getMonth() + 1;
			if (month < 10) {
				month = '0' + month;
			}
			var day = toDay.getDate();
			
			if (day < 10) {
				day = '0' + day;
			}
			
			var tmp = year + '-' + month + '-' + day;
			$("#userExpired").val(tmp);
		}
		
		jQuery.validator.addMethod("charCheck", function(value, element) {
			var userId = value;
			var excludeCharacter = "{}[]()<>?_|~`!@#$%^&*-+\"'\\/ "; //입력을 막을 특수문자 기재.					

			for (var i = 0; i < userId.length; i++) {
				if (-1 != excludeCharacter.indexOf(userId[i])) {
					return false;
				}
			}
			return true;
		}, "특수문자를 입력할수 없습니다.");
		
		jQuery.validator.addMethod("dupCheck", function(value, element) {
			var dupCheck = false;
			var userId = value;
			$.ajax({
				url : '/userDuplicateCheack?mode=I&userId=' + userId,
				type : 'post',
				async: false,
				success : function(data, status, xhr) {
					if (data == 'Y') {
						dupCheck = false;
					} else {
						dupCheck = true;		
					}
				}, error: function (e) { {}
					ajaxErrorHandler(e);
				}
			});
			return dupCheck;
		}, "사용할수 없는 사용자아이디 입니다.");
		
		jQuery.validator.addMethod("passwordCheck", function(value, element) {
			var password1 = $("#password1").val();
			var password2 = value;
			if(password1 != password2) {
				return false;
			}
			return true;
		}, "패스워드가 맞지 않습니다.");
		
		//jQuery.validator.addMethod("pg_mon_client_path_check", existsFile($('#pg_mon_client_path').val()), "PG 모니터링 경로가 우요하지 않습니다.");
		
		jQuery.validator.addMethod("existsFileCheck", function(value, element) {			
			if (element.name == "pg_mon_client_path") {
				return existsFile(value, "DX.MonPostgres.exe");
			} else {
				return existsFile(value, "edgedb-admin-console.exe");
			}						

		}, "경로가 우효하지 않습니다.");
				
		if (mode == 'I') {
		// validate signup form on keyup and submit
			$("#form02").validate({
				rules: {
					userId: {required : true, charCheck: true, dupCheck: true},
					userName: {required : true, charCheck: true},
					password1: {required : true},
					password2: {required : true, passwordCheck: true},
					blg: {required : true},
					department: {required : true},
					jgd: {required : true},
					authDivision: {required : true},
					pg_mon_client_path : {existsFileCheck: true},
					enc_mng_path : {existsFileCheck: true}
				}, messages: {
					userId: {required : "이 필드는 필수입니다."},
					userName: {required : "이 필드는 필수입니다."},
					password1: {required : "이 필드는 필수입니다."},
					password2: {required : "이 필드는 필수입니다."},
					blg: {required : "이 필드는 필수입니다."},
					department: {required : "이 필드는 필수입니다."},
					jgd: {required : "이 필드는 필수입니다."},
					authDivision: {required : "이 필드는 필수입니다."}
				}
			});
		} else if (mode == 'U') {
			$("#form02").validate({
				rules: {
					userName: {required : true, charCheck: true},
					password1: {required : true},
					password2: {required : true, passwordCheck: true},
					blg: {required : true},
					department: {required : true},
					jgd: {required : true},
					authDivision: {required : true},
					pg_mon_client_path : {existsFileCheck: true},
					enc_mng_path : {existsFileCheck: true}
				}, messages: {
					userName: {required : "이 필드는 필수입니다."},
					password1: {required : "이 필드는 필수입니다."},
					password2: {required : "이 필드는 필수입니다."},
					blg: {required : "이 필드는 필수입니다."},
					department: {required : "이 필드는 필수입니다."},
					jgd: {required : "이 필드는 필수입니다."},
					authDivision: {required : "이 필드는 필수입니다."}
				}
			});
		}
	});
	
	//사용자정보 수정시 Select Box의 Option값이 DB에서 가져온 값과 일치하는 경우 Selected를 설정
	function selected(target, value) {
		for (i = 0; i < document.getElementById(target).options.length; i++) {
		    if (document.getElementById(target).options[i].value == value) {
		        document.getElementById(target).options[i].selected = "selected";
		    }
		}
	}	
</script>
