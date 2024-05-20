<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
.comment_textBox {
    margin-left: 10px;
    position: absolute;
    top: 65px;
}
/* .slick-multiple button::before,  */
/* button[aria-label="Previous"] { */
/*     margin-left: -25px; */
/*     background-color: #9551fc; */
/*     opacity: 1; */
/*     color: #fff; */
/* } */

button[aria-label="Previous"]::before {
	 background-color: transparent; 
     opacity: 1;
     color: #9551fc;
     margin-left: -25px;
}

button[aria-label="Next"]::before {
	background-color: transparent; 
    opacity: 1;
    color: #9551fc;
    margin-left: 10px;
}

.commentTopArea {
	margin-top: 75px;
}

.commentArtistBox:hover {
	transform: translateY(-10px);
}

.slick-track {
	margin-top: 10px;
}
</style>
<div class="sliderz-slick commentTopArea">
    <div class="row">
        <div class="col-md-12">
            <div class="central-meta" style="background-color: transparent; border: none; height: 200px;">
                <div class="slick-multiple">
                    <c:forEach items="${artistCommentList}" var="artist">
                        <div class="slick-slide-item commentArtistBox " data-feedno="${artist.feedNo}" style="position: relative; width: 380px; height: 140px; cursor:pointer;  background-color: #fff;  border-radius: 10px; margin-right: 10px; transition: transform 0.3s ease;">
                            <img src="${pageContext.request.contextPath}${artist.userProfile}" class="img-fluid" alt="" style="border-radius: 50%; size: 50px; height: 70px; margin-bottom: 10px;">
                            <div class="comment_textBox">
                                <div style="margin-bottom: 3px; width: 100px; display: flex;">
                                    <span style="font-weight: bold; margin-right: 2%;">${artist.mnNickName }</span>
                                    <img src="${pageContext.request.contextPath}/resources/images/mark.png" alt="" style="width: 15px; height: 15px; position: relative; top: 1px;">                 
                                </div>
                                <div>
	                                <span id="myFeedView" style="cursor: pointer;">${myComment.fcContent}</span>
	                                <span style="font-weight: 200;">${artist.fcContent}</span>   
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
// $(function() {
// 	$(".slick-multiple button").css("background-color","red");
// });
</script>
	