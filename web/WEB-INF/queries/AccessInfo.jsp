<%--
  Created by IntelliJ IDEA.
  User: cristph
  Date: 2016/6/7
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%@ page session="true" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="jp" uri="http://www.tonbeller.com/jpivot" %>

<jp:mondrianQuery id="query01" jdbcDriver="com.mysql.jdbc.Driver" jdbcUrl="jdbc:mysql://localhost/accessInfo" catalogUri="/WEB-INF/queries/tezz.xml"
                  jdbcUser="root"  jdbcPassword=""  connectionPooling="false">
    SELECT {[Measures].[num], [Measures].[avgprice],[Measures].[tsalenum]} ON COLUMNS, {([product].[allproduct],[customer].[allsex])} ON ROWS FROM [Sales]
</jp:mondrianQuery>

</body>
</html>
