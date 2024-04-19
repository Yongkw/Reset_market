<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title><t:insertAttribute name="title"/></title>
</head>
<body>
   <div id="container" style="width:100%;">
      <div id="top">
         <t:insertAttribute name="top"/>
      </div>
      <div id="navbar">
         <t:insertAttribute name="navbar"/>
      </div>
      <div id="slide_banner">
         <t:insertAttribute name="slide_banner"/>
      </div>
      <div id="body">
         <t:insertAttribute name="body"/>
      </div>
      <div id="footer">
         <t:insertAttribute name="footer"/>
      </div>
   </div>
</body>
</html>