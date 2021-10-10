var { watch } = require('gulp')
var path = require('path')
var exec = require('@lsby/exec_cmd').default
var opn = require('better-opn')
var { parallel } = require('gulp')

exports.web持续编译 = async function web持续编译() {
    console.log('web持续编译...')
    opn('http://localhost:1234/')
    await exec(
        `node ${path.resolve(__dirname, './node_modules/parcel/lib/bin.js')} ${path.resolve(
            __dirname,
            './test/index.html',
        )}`,
        { cwd: path.resolve(__dirname, '.') },
    )
}
exports.purs持续编译 = async function purs持续编译() {
    console.log('purs持续编译...')
    watch(
        ['src/**/*', 'test/**/*'],
        {
            ignoreInitial: false,
            // delay: 500
        },
        async function purs持续编译() {
            console.log('purs持续编译: 检测到文件变化, 开始编译.')
            try {
                var r = await exec('node node_modules/spago/spago build')
                console.log('purs持续编译: 编译完成.', r)
            } catch (e) {
                console.log('purs持续编译: 编译出错.', e)
            }
        },
    )
}
exports.test = parallel(exports.purs持续编译, exports.web持续编译)
