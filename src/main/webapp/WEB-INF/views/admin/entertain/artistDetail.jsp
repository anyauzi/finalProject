<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<head>

<link rel=" shortcut icon" href="${pageContext.request.contextPath }/resources/full/image/favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/full/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/full/vendor/css/bootstrap.min.css">
<link rel="stylesheet" href='${pageContext.request.contextPath }/resources/full/vendor/css/select2.min.css' />
<link rel="stylesheet" href='${pageContext.request.contextPath }/resources/full/vendor/css/bootstrap-datetimepicker.min.css' />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/full/css/main.css">
<!-- <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet"> -->


<style>

  .vertical-center {
    vertical-align: middle;
  }
div,input, label,p {
  font-family: "Jua", sans-serif;
  font-weight: 400;
  font-style: normal;
}
  /* 탭 메뉴 스타일 */
  .tab {
    overflow: hidden;
    background-color: none; 
    text-align: center; 
    margin-bottom: 50px;
  }

  /* 탭 링크 스타일 */
  .tab a {
    background-color :#fff;
    display: inline-block; 
    border: 1px solid #eee;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
  }

  /* 탭 링크 - 마우스 오버 시 */
  .tab a:hover {
    background-color: #ddd;
  }

  /* 활성 탭 링크 스타일 */
  .tab a.active {
    background-color: #ccc;
  }
  .main-content {
  	padding-left: 200px;
  	width: 103%;
  }
  .panel-body{
  	margin-top: 18px;
  	padding: 0;
  }
  #modBtn, #delBtn, #addBtn{
  	border: medium none;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    -o-border-radius: 5px;
    border-radius: 5px;
    color: #fff;
    font-size: 14px;
    line-height: 40px;
    margin-left: 20px;
    margin-top: 5px;
    text-transform: uppercase;
    width: 107px;
    background: rgba(0, 0, 0, 0) linear-gradient(-135deg, #1de9b6 0%, #1dc4e9 100%) repeat scroll 0 0;
    -webkit-transition: all 0.2s linear 0s;
    -moz-transition: all 0.2s linear 0s;
    -ms-transition: all 0.2s linear 0s;
    -o-transition: all 0.2s linear 0s;
    transition: all 0.2s linear 0s;
  }
  #addBtn {
  	margin-bottom: 20px;
  }
  
  #Profile td  {
  	font-size: 16px;
  	padding: 20px 10px;
  }
  #Profile td p {
  	font-size: 16px;
  }
  #Profile td:first-child {
	font-weight: 600; 
	border-right: 1px solid #eaeaea;
	text-align: center;
	width: 200px;
  }
  .cart-page h1 {
  	font-size: 80px;
  	font-weight: 700;
  }
  .row:after {
  	display: none;
  }
  .row:before {
	display: none;
  }
  .prodthumimg-box {
  	width: 500px;
  }
  table tr td:first-child {
  	padding-left: 0;
  }
  table tbody tr td:last-child  {
  	padding-right: 0;
  }
  #Album td {
  	font-size: 16px;
  	padding: 30px 40px;
  }
  #Album td:first-child {
	font-weight: 600; 
	border-right: 1px solid #eaeaea;
	text-align: center;
	width: 200px;
  }
  .alName {
  	font-size: 25px;
  	font-weight: 600;
  	margin-bottom: 20px;
  }
  .alimg {
  	min-width: 300px;
  	flex-grow: 2;
  }
  .alIntro{
  	padding-left: 50px;
  	flex-grow: 1;
  	line-height: 29px;
  }
  .agName {
  	font-size: 25px !important;
  	font-weight: 600;
  }
  .albox {
  	display: flex;
  }
  .alsemi{
  	display: flex;
  	flex-direction: column;
  }
  .alUrl{
  	padding-top: 10px;
  	padding-left: 50px;
  }
</style>
</head>

<body>

<div class="tab">
  <a href="#1" class="tablinks" onclick="openTab(event, 'Schedule')">일정 관리</a>
  <a href="#2" class="tablinks active" onclick="openTab(event, 'Profile')">프로필 관리</a>
  <a href="#3" class="tablinks" onclick="openTab(event, 'Album')">앨범 관리</a>
</div>

<!-- 프로필 관리 탭 내용 -->
<div id="Profile" class="tabcontent">
        <div class="sub-bar">
        </div>
        <div class="gap no-gap">
            <div class="inner-bg">
                <div class="cart-page">
                <h1>${profile.agId }</h1>
                <div class="widget">
                    <table class="cart-table table table-responsive">
                        <tbody>
                            <tr>
                                <td>그룹명</td>
                                <td class="agName">${profile.agName}</td>

                            </tr>
                            <tr>
                                <td>데뷔일</td>
                                <td>
                                	<fmt:parseDate value="${profile.agDate}" var="agDate" pattern="yyyy-MM-dd" />
                                    <fmt:formatDate value="${agDate}" pattern="yyyy-MM-dd" />
                                </td>
                            </tr>

                            <tr>
                                <td>멤버</td>
                                <td>
                                    <c:forEach var="list" items="${artistList}">
                                        <p>${list.artistFakename} 
                                        <fmt:parseDate value="${list.artistBirth }" var="artistBirth" pattern="yyyy-MM-dd" />
                                        (<fmt:formatDate value="${artistBirth}" pattern="yyyy-MM-dd" />)</p>
                                    </c:forEach>
                                </td>
                            </tr>


                            <tr>
                                <td class="vertical-center">그룹소개</td>
                                <td>${profile.agIntro}</td>
                            </tr>
                            <tr>
                                <td class="vertical-center">그룹 이미지</td>
                                <td>
                                    <div class="prodthumimg-box" style="display: flex; border:none; background: none;">
                                        <c:choose>
                                            <c:when test="${fn:contains(profile.agProfile, 'http')}">
                                                <img id="thumimg" src="${profile.agProfile}" alt="" class="profile-img">
                                            </c:when>
                                            <c:otherwise>
                                                <img id="thumimg"
                                                    src="${pageContext.request.contextPath}/resources/upload/group/${profile.agProfile}"
                                                    alt="" class="profile-img">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>멤버 이미지</td>
                                <td>
                                    <%-- <div class="prodthumimg-box" style="display: flex; border:none; background: none;">
                                        <c:forEach var="list" items="${artistList}">
                                            <c:choose>
                                                <c:when test="${fn:contains(list.userProfile, 'http')}">
                                                    <!-- 외부 URL인 경우 -->
                                                    <img src="${list.userProfile}" alt="" class="profile-img"
                                                        style="margin-right: 55px;">
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- 내부 경로인 경우 -->
                                                    <img src="${pageContext.request.contextPath}/resources/upload/group/${list.userProfile}"
                                                        alt="" class="profile-img" style="margin-right: 5px;">
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div> --%>
                                    <div class="row remove-70" style="padding: 30px;">
										<c:forEach var="list" items="${artistList}">
								            <div class="col-md-2 col-sm-2">
								              <div class="woo-product">
								                <figure> <img src="images/resources/product-1.jpg" alt=""> </figure>
								                <div class="product-meta">
								                  <div class="artist-box">
								                  	<c:choose>
														<c:when test="${fn:contains(list.userProfile, 'http')}">
										                  	<img alt="" src="${list.userProfile}" alt="" class="profile-img">
														</c:when>
														<c:otherwise>
															<img alt="" src="${list.userProfile}" alt="" class="profile-img">
														</c:otherwise>
													</c:choose>
								                  </div>
								                </div>
								              </div>
								            </div>
							            </c:forEach>
					         		 </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
			    <div class="buttonz"> 
			        <form action="/entertain/artist/profile/updateForm.do" method="get">
			            <input type="hidden" name="agId" id="agId" value="${profile.agId}">
			            <button type="submit" id="modBtn" name="modBtn" value="${name}" style="margin-top: 20px;">수정하기</button>
			            <sec:csrfInput />
			        </form>
				</div>
            </div>
        </div>
    </div>
    
<!-- 앨범 관리 탭 내용 -->
<div id="Album" class="tabcontent" style="display:none">
    <div class="content-area">
        <div class="gap no-gap">
            <div class="inner-bg">
                <div class="cart-page">
                    <div class="buttonz">
                        <form action="/entertain/artist/album/albumInsertForm.do" method="get">
                            <input type="hidden" name="agId" id="agId" value="${profile.agId}">
                            <button type="submit" id="addBtn" name="addBtn" value="${name}">등록하기</button>
                            <sec:csrfInput />
                        </form>
                    </div>
                    <table class="cart-table table table-responsive">

                        <tbody>
                            <tr>
                                <td>그룹명</td>
                                <td class="agName">${profile.agName}</td>
                            </tr>
                            <c:forEach var="albumList" items="${albumList}" varStatus="status">
                                <tr>
                                    <td>앨범 ${status.index+1 }</td>
                                    <td>
                                    	<div class="alName">
                                       		${albumList.alName }
                                        </div>
                                        <div class="albox">
	                                        <div class="prodthumimg-box alimg">
	                                            <c:choose>
	                                                <c:when test="${fn:contains(albumList.alPhoto, 'http')}">
	                                                    <img id="thumimg" src="${albumList.alPhoto}" alt="" class="profile-img">
	                                                </c:when>
	                                                <c:otherwise>
	                                                    <img id="thumimg"
	                                                        src="${pageContext.request.contextPath}/resources/upload/group/${albumList.alPhoto}"
	                                                        alt="" class="profile-img">
	                                                </c:otherwise>
	                                            </c:choose>
	                                        </div>
	                                        <div class="alsemi">
		                                        <div class="alIntro">
		                                        	${albumList.alIntro }
		                                        </div>
		                                        <div class="alUrl">
		                                       		<a href="${albumList.alUrl }">${albumList.alUrl }</a>
		                                        </div>
	                                        </div>
	                                    </div>
                                        <div class="buttonz" style="display: flex; justify-content: flex-end">
                                            <form action="/entertain/artist/album/albumUpdateForm.do" method="get">
                                                <input type="hidden" name="alNo" id=alNo value="${albumList.alNo}">
                                                <input type="hidden" name="agId" id=agId value="${profile.agId}">
                                                <button type="submit" id="modBtn" name="modBtn"
                                                    value="${name}">수정하기</button>
                                                <sec:csrfInput />
                                            </form>
                                            <form action="/entertain/artist/album/albumDelete.do" method="post">
                                                <input type="hidden" name="alNo" id=alNo value="${albumList.alNo}">
                                                <button type="submit" id="delBtn" name="delBtn"
                                                    value="${name}">삭제하기</button>
                                                <sec:csrfInput />
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 일정 관리 탭 내용 -->
<div id="Schedule" class="tabcontent" style="display:none">
   <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">일정 등록하기</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox">
                            </div>
                        </div>
							
						 <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">일정주체</label>
                                <select class="inputModal" type="text" name="edit-username" id="edit-username">
                                    <option value="${profile.agId }">${profile.agId }</option>
                                <c:forEach var="list" items="${artistList}">
                                    <option value="${list.artistFakename }">${list.artistFakename }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>	
							
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                                <input class="inputModal" type="hidden" name="edit-agId" id="edit-agId" value="${profile.agId }" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="행사">행사</option>
                                    <option value="방송">방송</option>
                                    <option value="콘서트">콘서트</option>
                                    <option value="개인방송">개인방송</option>
                                </select>
                            </div>
                        </div>
                          
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="행사">행사</option>
                            <option value="방송">방송</option>
                            <option value="콘서트">콘서트</option>
                            <option value="개인방송">개인방송</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
				        <!-- 전체 선택 체크박스 추가 -->
				        <label class="checkbox-inline">
				            <input type="checkbox" id="checkAll" checked>전체 선택
				        </label>
                        <label class="checkbox-inline">
                        	<input class='filter' type="checkbox" value="${profile.agId }" checked>${profile.agId }
                        </label>
                        <c:forEach var="list" items="${artistList }">
                        	<label class="checkbox-inline">
                        		<input class='filter' type="checkbox" value="${list.artistFakename }" checked>${list.artistFakename }
                        	</label>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>	
    <!-- /.container -->
    
</div>
</body>
    <script src="${pageContext.request.contextPath }/resources/full/vendor/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/full/vendor/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/full/vendor/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/full/vendor/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/full/vendor/js/ko.js"></script>
    <script src="${pageContext.request.contextPath }/resources/full/vendor/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/full/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/full/js/main.js"></script>
    <script src="${pageContext.request.contextPath }/resources/full/js/addEvent.js"></script>
    <script src="${pageContext.request.contextPath }/resources/full/js/editEvent.js"></script>
    <script src="${pageContext.request.contextPath }/resources/full/js/etcSetting.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script>
var header = "";
var token = "";
header = $("meta[name='_csrf_header']").attr("content");
token = $("meta[name='_csrf']").attr("content");
function openTab(evt, tabName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>
<script>
document.addEventListener('DOMContentLoaded', (event) => {
	  var hash = window.location.hash;
	  
	  switch(hash) {
	    case "#1":
	      openTabDirectly('Schedule'); Schedule
	      break;
	    case "#2":
	      openTabDirectly('Profile');
	      break;
	    case "#3":
	      openTabDirectly('Album'); Album
	      break;
	    default:
	      openTabDirectly('Schedule');
	  }
	});

	function openTabDirectly(tabId) {
	  var evt = { currentTarget: document.querySelector(`a[href="${tabId}"]`) };
	  if(evt.currentTarget) {
	    openTab(evt, tabId);
	  }
	}

</script>

<script>
$(document).ready(function() {
    $('#delBtn').click(function(e) {
        e.preventDefault(); // 기본 이벤트를 방지

        Swal.fire({
            title: '삭제하시겠습니까?',
            text: "이 작업은 되돌릴 수 없습니다!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예, 삭제합니다!',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 '예'를 선택한 경우, AJAX 요청을 통해 데이터 삭제를 진행
                var alNo = $('#alNo').val(); 

                $.ajax({
                    url: '/entertain/artist/album/albumDelete.do', 
                    type: 'POST', 
                    data: {
                        alNo: alNo 
                    },
                    beforeSend: function(xhr){
                    	xhr.setRequestHeader(header, token);
                    },
                    success: function(response) {
                        Swal.fire(
                            '삭제 성공!',
                            '삭제에 성공하였습니다.',
                            'success'
                        );
                        // 성공적으로 삭제된 후의 리다이렉션 또는 다른 로직 처리
                        // 예: window.location.href = '/entertain/artist/album/list.do';
                    },
                    error: function(xhr, status, error) {
                        Swal.fire(
                            '삭제 실패!',
                            '문제가 발생했습니다. 다시 시도해 주세요.',
                            'error'
                        );
                    }
                });
            }
        });
    });
    
    var eventModal = $('#eventModal');
    
    eventModal.on('show.bs.modal', function () {
        var modal = $(this);
        modal.appendTo('body');
   });
   setTimeout(() => {
	   $("img").css("max-width", "");
}, 500);
});
</script>



</html>