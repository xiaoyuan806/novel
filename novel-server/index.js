const http = require('http');
const badyParser = require('body-parser');
const express = require('express');
const novelApi = require('./api/novelApi');
const novelUploadApi=require('./api/novelUploadApi')
	
let app = express();
let server = http.createServer(app);
// 解析body数据
app.use(express.json())
// 托管静态文件
// app.use('/img/pic', express.static(__dirname + '/img/pic'))
// //下面是为了接受http请求服务器本地文件做的设置！重要！
// app.get('/img/pic/*', function (req, res) {
//     res.sendFile( __dirname + "/" + req.url );
//     console.log("Request for " + req.url + " received.");
// })

// app.use(badyParser.json());
// app.use(badyParser.urlencoded({
//     extended: false
// }));
	
// 后端api路由
app.use('/api/novel',novelApi);
// app.use('/api/novelUpload',novelUploadApi);

// 启动监听8888端口。
server.listen(8888, () => {
console.log(' success!! port:8888')
})