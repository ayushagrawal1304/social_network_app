function showFlashNotifications(flash = {}) {

  if (flash.notice || flash.success) { iziToast.success({ position: 'topRight',
    message: `${flash.notice || flash.success}` }); }
  
  if (flash.error) { iziToast.error({ position: 'topRight', 
    message: flash.error, timeout: 0 }); }
        
  if (flash.alert) { iziToast.error({ position: 'topRight', 
    message: flash.alert, timeout: 0 }); }
        
  if (flash.info) { iziToast.info({ position: 'topRight',
    message: flash.info }); }
      
}