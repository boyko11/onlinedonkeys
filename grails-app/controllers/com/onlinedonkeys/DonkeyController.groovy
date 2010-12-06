package com.onlinedonkeys

class DonkeyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [donkeyInstanceList: Donkey.list(params), donkeyInstanceTotal: Donkey.count()]
    }

    def create = {
        def donkeyInstance = new Donkey()
        donkeyInstance.properties = params
        return [donkeyInstance: donkeyInstance]
    }

    def save = {
        def donkeyInstance = new Donkey(params)
        if (donkeyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'donkey.label', default: 'Donkey'), donkeyInstance.id])}"
            redirect(action: "show", id: donkeyInstance.id)
        }
        else {
            render(view: "create", model: [donkeyInstance: donkeyInstance])
        }
    }

    def show = {
        def donkeyInstance = Donkey.get(params.id)
        if (!donkeyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'donkey.label', default: 'Donkey'), params.id])}"
            redirect(action: "list")
        }
        else {
            [donkeyInstance: donkeyInstance]
        }
    }

    def edit = {
        def donkeyInstance = Donkey.get(params.id)
        if (!donkeyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'donkey.label', default: 'Donkey'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [donkeyInstance: donkeyInstance]
        }
    }

    def update = {
        def donkeyInstance = Donkey.get(params.id)
        if (donkeyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (donkeyInstance.version > version) {
                    
                    donkeyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'donkey.label', default: 'Donkey')] as Object[], "Another user has updated this Donkey while you were editing")
                    render(view: "edit", model: [donkeyInstance: donkeyInstance])
                    return
                }
            }
            donkeyInstance.properties = params
            if (!donkeyInstance.hasErrors() && donkeyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'donkey.label', default: 'Donkey'), donkeyInstance.id])}"
                redirect(action: "show", id: donkeyInstance.id)
            }
            else {
                render(view: "edit", model: [donkeyInstance: donkeyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'donkey.label', default: 'Donkey'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def donkeyInstance = Donkey.get(params.id)
        if (donkeyInstance) {
            try {
                donkeyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'donkey.label', default: 'Donkey'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'donkey.label', default: 'Donkey'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'donkey.label', default: 'Donkey'), params.id])}"
            redirect(action: "list")
        }
    }
}
