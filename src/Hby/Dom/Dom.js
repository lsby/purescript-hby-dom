exports.onLoad = function (action) {
    return function () {
        if (document.readyState === 'interactive') {
            action()
        } else {
            document.addEventListener('DOMContentLoaded', action)
        }
        return {}
    }
}
exports.setBodyHtml = (html) => () => {
    document.body.innerHTML = html
}
