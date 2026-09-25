const {app,BrowserWindow,ipcMain}=require('electron');
const path=require('path');
let win;
function createWindow(){
 win=new BrowserWindow({width:1280,height:850,minWidth:900,minHeight:650,title:'MyOpenProctor',autoHideMenuBar:true,webPreferences:{preload:path.join(__dirname,'preload.js'),contextIsolation:true,nodeIntegration:false}});
 win.loadFile('student.html');
 win.on('blur',()=>win.webContents.send('proctor-event',{type:'window_blur',severity:'review',message:'Exam client lost focus',time:new Date().toISOString()}));
 win.webContents.setWindowOpenHandler(({url})=>{win.webContents.send('proctor-event',{type:'external_navigation',severity:'review',message:`External navigation requested: ${url}`,time:new Date().toISOString()});return {action:'deny'}});
}
ipcMain.handle('open-exam',async(_e,{url})=>{if(!/^https:\/\//i.test(url))throw new Error('Exam URL must use HTTPS');await win.loadURL(url);return true});
ipcMain.handle('end-session',async()=>{await win.loadFile('student.html',{query:{ended:'1'}});return true});
app.whenReady().then(createWindow);
app.on('window-all-closed',()=>{if(process.platform!=='darwin')app.quit()});
