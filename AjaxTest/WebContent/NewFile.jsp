<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style type="text/css">

table{

	border-collapse: collapse;

}

td{

	border: #ABF200 solid;

}

</style>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script type="text/javascript">

//$("#joinOk").bind("click",function(){
	//function test(){
$(document).ready(function() {
	$("#con").hide();

	$("#b").click(function() {

    $.ajax({
        url : "AjaxController",
        type: "get",
        dataType : "json", // ������ Ÿ���� ���̽� ���ؾ���, �ٸ������ 2��������
		cache : false, // �̰� �Ⱦ��ų� true�ϸ� �����ص� ���ݿ��� �߾ȴ�
        data : { 
        	"id" : $("#id").val(),
			"pw" : $("#pw").val()
        },
        
        success : function(data){
        	
        	$("#con").html(""); // div�� �ϴ� �������� �ʱ�ȭ���� , �ֳĸ� ��ư ������ ������ ��ø�Ǵϱ�
        	
			$("<table/>").css({

				backgroundColor : "#E4F7BA",

				border : "solid 3px #E4F7BA",
				
			

			}).appendTo("#con"); // ���̺��� �����ϰ� �� ���̺��� div�� �߰���
			
			var key = Object.keys(data["memberlist"][0]); // id , pw , addr , tel �� Ű���� ������

			$("<tr>" , {
				

				html : "<td>" + key[0] + "</td>"+  // �÷����

						"<td>" + key[1] + "</td>"+

						"<td>" + key[2] + "</td>"+
						
						"<td>" + key[3] + "</td>"


			}).appendTo("table") // �̰��� ���̺�����

			$.each(data.memberlist, function(index, memberlist) { // ��ġ�� �Ἥ ��� �����͵��� �迭�� ����

				var items = [];

				items.push("<td>" + memberlist.id + "</td>"); // ���⿡ id pw addr tel�� ���� �迭�� ������

				items.push("<td>" + memberlist.pw + "</td>");

				items.push("<td>" + memberlist.date + "</td>");
				items.push("<td>" + memberlist.sdate + "</td>");

				
				$("<tr/>", {

					html : items // Ƽ�˿� ����,

				}).appendTo("table"); // �׸��� �� tr�� ���̺� ����

			});//each��
           
        }
    });
	});
});
//});


</script>
<body>
<input type="text" id="id" value="gusdn"> 
<input type="text" id="pw" value="620q"> 
<!-- <button id="joinOk" onclick="test()">asdf</button>
<div id="container"></div> -->

<input type="button" id="b" value="ȸ����������">
<div id="con">
</div>
<table>
</table>

</body>
</html>