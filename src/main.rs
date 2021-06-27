#![no_main]
#![no_std]

#[no_mangle]
pub static mut STACK: [u8; 1024] = [0; 1024];

#[no_mangle]
pub extern "C" fn __start_rust() -> ! {
    let uart = 0x1000_0000  as *mut u8;
    for &c in b"Hello from Rust!".iter() {
        unsafe {
            core::ptr::write_volatile(uart, c);
        }
    }

    loop{}
}

use core::panic::PanicInfo;
#[panic_handler]
#[no_mangle]
pub fn panic(_info: &PanicInfo) -> ! {
    loop{}
}

#[no_mangle]
pub extern "C" fn abort() -> ! {
    loop{}
}
