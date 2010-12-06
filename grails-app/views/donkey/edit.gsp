

<%@ page import="com.onlinedonkeys.Donkey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'donkey.label', default: 'Donkey')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${donkeyInstance}">
            <div class="errors">
                <g:renderErrors bean="${donkeyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${donkeyInstance?.id}" />
                <g:hiddenField name="version" value="${donkeyInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="donkey.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: donkeyInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${donkeyInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dob"><g:message code="donkey.dob.label" default="Dob" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: donkeyInstance, field: 'dob', 'errors')}">
                                    <g:datePicker name="dob" precision="day" value="${donkeyInstance?.dob}" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="temper"><g:message code="donkey.temper.label" default="Temper" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: donkeyInstance, field: 'temper', 'errors')}">
                                    <g:textField name="temper" value="${donkeyInstance?.temper}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="intelligence"><g:message code="donkey.intelligence.label" default="Intelligence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: donkeyInstance, field: 'intelligence', 'errors')}">
                                    <g:textField name="intelligence" value="${donkeyInstance?.intelligence}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="color"><g:message code="donkey.color.label" default="Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: donkeyInstance, field: 'color', 'errors')}">
                                    <g:textField name="color" value="${donkeyInstance?.color}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="kickPower"><g:message code="donkey.kickPower.label" default="Kick Power" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: donkeyInstance, field: 'kickPower', 'errors')}">
                                    <g:textField name="kickPower" value="${donkeyInstance?.kickPower}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
