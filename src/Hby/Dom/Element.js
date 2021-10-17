exports.getElementById = (id) => () => {
    var r = document.getElementById(id)
    if (r == null) {
        throw new Error('查找id失败: ' + id)
    }
    return r
}

exports.setValueById = (id) => (value) => () => {
    var r = document.getElementById(id)
    if (r == null) {
        throw new Error('查找id失败: ' + id)
    }
    r.value = value
}

exports.setHtmlById = (id) => (html) => () => {
    var r = document.getElementById(id)
    if (r == null) {
        throw new Error('查找id失败: ' + id)
    }
    r.innerHTML = html
}

exports.getElementStrAttr = (e) => (attrName) => () => {
    if (e[attrName] == null) {
        throw new Error('属性不存在: ' + attrName)
    }
    if (typeof e[attrName] != 'string') {
        throw new Error('属性不是字符串: ' + attrName)
    }
    return e[attrName]
}

exports.onClick = (t) => (f) => () => {
    t.addEventListener('click', (e) => f(e)())
}
exports.onChange = (t) => (f) => () => {
    t.addEventListener('input', (e) => {
        return f(e)()
    })
}
