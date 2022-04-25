

// install event
self.addEventListener('install', event => {
   console.log('service worker is installed')
})

// activate event
self.addEventListener('activate', event => {
    console.log('service worker is activated')
})

// fetch 
self.addEventListener('fetch', event => {
   event.respondWith(fetch(event.request));
})