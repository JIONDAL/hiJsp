<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex5</title>
</head>
<body>
<h1> 논리 연산자들</h1>
\${(5>2) || (5<2)} : ${(5>2) || (5>2)} => 
\${false or true} : ${false or true}<br>

\${(5>2) && (5>2)} : ${(5>2) && (5>2)} => 
\${false and true} : ${false and true}<br>

\${ !(5>2) }  : ${ !(5>2) }  => \${ not false} : ${ not false }<br>
</body>
</html>













