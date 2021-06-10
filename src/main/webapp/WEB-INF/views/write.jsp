<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/write.css" type="text/css">
	<title>Insert title here</title>
	<script type="text/javascript" src="script.js" charset="utf-8"></script>
  </head>
  <body>
  <%@ include file="./header.jsp" %>
	<div class="total">
	  <form>
	    <h1>게스트 하우스 소개</h1>
	    <div class="section">
	    
		    <div class="title">
		          <h3>제목&nbsp;&nbsp;&nbsp;<input type="text" name="write_title" width="100"></h3>
		    </div>
	        <div class="title2">
			    <h4>이미지 업로드&nbsp;&nbsp;&nbsp;</h4>
			    <input type="file" name="write_image" size="10">
	        </div>
				<div class="detail">
						<h3>상세 내용</h3>
						<h4>인원수&nbsp;&nbsp;&nbsp; 
							<select name="category" id="category">
								<option value='1'>1인실</option>
								<option value='2'>2인실</option>
								<option value='3'>4인실</option>
								<option value='4'>8인실</option>
								<option value='4'>16인실</option>
							</select>
						</h4>
						<h4>
							<!-- 주소 입력 -->
							<script type="text/javascript" src="resources/js/juso2.js" ></script>
							도로명 주소 
							<input  type="text"  style="width:auto;" id="location_addr" name="location_addr" readonly/>
							<input type="button" onClick="goPopup();" value="주소 찾기"/><br>
							상세 주소&nbsp;&nbsp;&nbsp;
							 <input type="text" name="location_detail">
							 <input type="hidden" name="location_first_name" />
							<input type="hidden" name="location_second_name" />
							
						</h4>
				</div>
	    <div class="content">
	        <h4>소개</h4>
	        <textarea 
	        	style="overflow: auto; height: 400px" 
	        	rows="auto" cols="70" name="write_detail"></textarea>
	      </div>
	      <div class="button">
	        <button type="submit" onclick="" class="but">글 올리기</button>
	        <button type="reset" class="but">다시쓰기</button>
	        <span><button type="button" value="뒤로가기" onclick="history.back()" class="but">뒤로가기</button></span>
	      </div>
	    </div>
	  </form>
	  <div class="clear"></div>
	</div>
	 <%@ include file="./footer.jsp" %>
  </body>
</html>
