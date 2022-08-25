const env = process.env.APP_ENV || process.env.NODE_ENV
console.log('当前环境--', env)
const current = require(`./env.${env}`)

module.exports = Object.assign(
  {
    searchHistoryDuration: 24 * 60 * 7,
    version: Date.now(),
    baiduMapAppKey: 'rEzDZxvvxcZbFSbcnsujwYYeEXlGRmGv',
    countryCode: 'CN', // ISO-3166
    languageCode: 'ZH', // ISO-639
    currencyCode: 'CNY', // ISO-4217
    gtm: 'GTM-KRFWJ6S',
    gaTrackingId: 'UA-32769654-11',
    baidu: '54d7d7bc4f030e7865e221e244cdfd4c',
    insideTagSrc: '//asia3-track.inside-graph.cn/gtm/IN-1000912-YSL/include.js',
    contentSquare: '65d4ede10fc48',
    publicPath: '/_nuxt/',
  },
  current
)
