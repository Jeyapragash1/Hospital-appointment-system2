<%-- 
    Document   : pay_charges
    Created on : Aug 10, 2024, 2:30:54 PM
    Author     : User
--%>

<%@page import="classes.DbConnector"%>
<%@page import="classes.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    int appointment_ID;
    String payment_method, amount;
%>

<%
    appointment_ID = Integer.parseInt(request.getParameter("appoinment_ID"));
    payment_method = request.getParameter("payment_method");
    amount = request.getParameter("amount");

    Payment payment = new Payment(appointment_ID, payment_method, amount);

    if(payment.makePayment(DbConnector.getConnection())){
       response.sendRedirect("index.jsp?s=1");
    }else{
      response.sendRedirect("index.jsp?s=0");  
    }
%>
