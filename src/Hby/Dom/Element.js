exports._getElementById = (left) => (right) => (id) => () => {
    var r = document.getElementById(id)
    if (r == null) {
        return left('查找id失败: ' + id)
    }
    return right(r)
}
exports.onClick = (t) => (f) => () => {
    t.addEventListener('click', (e) => f(e)())
}
exports._setValueById = (left) => (right) => (id) => (value) => () => {
    var r = document.getElementById(id)
    if (r == null) {
        return left('查找id失败: ' + id)
    }
    r.value = value
    return right()
}
exports._setHtmlById = (left) => (right) => (id) => (html) => () => {
    var r = document.getElementById(id)
    if (r == null) {
        return left('查找id失败: ' + id)
    }
    r.innerHTML = html
    return right()
}
exports.onChange = (t) => (f) => () => {
    t.addEventListener('input', (e) => {
        return f(e)()
    })
}
exports._getElementStrAttr = (left) => (right) => (e) => (attrName) => () => {
    if (e[attrName] == null) {
        return left('属性不存在')
    }
    if (typeof e[attrName] != 'string') {
        return left('属性不是字符串')
    }
    return right(e[attrName])
}
