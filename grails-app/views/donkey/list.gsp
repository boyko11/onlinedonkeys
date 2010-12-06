
<%@ page import="com.onlinedonkeys.Donkey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'donkey.label', default: 'Donkey')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'donkey.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'donkey.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="dob" title="${message(code: 'donkey.dob.label', default: 'Dob')}" />
                        
                            <g:sortableColumn property="temper" title="${message(code: 'donkey.temper.label', default: 'Temper')}" />
                        
                            <g:sortableColumn property="intelligence" title="${message(code: 'donkey.intelligence.label', default: 'Intelligence')}" />
                        
                            <g:sortableColumn property="color" title="${message(code: 'donkey.color.label', default: 'Color')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${donkeyInstanceList}" status="i" var="donkeyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${donkeyInstance.id}">${fieldValue(bean: donkeyInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: donkeyInstance, field: "name")}</td>
                        
                            <td><g:formatDate date="${donkeyInstance.dob}" /></td>
                        
                            <td>${fieldValue(bean: donkeyInstance, field: "temper")}</td>
                        
                            <td>${fieldValue(bean: donkeyInstance, field: "intelligence")}</td>
                        
                            <td>${fieldValue(bean: donkeyInstance, field: "color")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${donkeyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
