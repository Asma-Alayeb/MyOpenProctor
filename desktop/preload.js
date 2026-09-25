const {contextBridge,ipcRenderer}=require('electron');
contextBridge.exposeInMainWorld('myOpenProctor',{
 openExam:(url)=>ipcRenderer.invoke('open-exam',{url}),
 endSession:()=>ipcRenderer.invoke('end-session'),
 onEvent:(fn)=>ipcRenderer.on('proctor-event',(_e,event)=>fn(event))
});
