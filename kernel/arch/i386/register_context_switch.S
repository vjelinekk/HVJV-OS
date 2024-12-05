    .global register_context_switch
register_context_switch:
    # Funkce přijímá 2 argumenty: esp (v %edi), eip (v %esi)
    # Nastavíme ESP na hodnotu, která byla předána v registru EDI
    mov %edi, %esp         # Načte hodnotu esp (předanou v %edi) do registru ESP
    # Nastavíme EIP na hodnotu, která byla předána v registru ESI
    mov %esi, %eax         # Načte hodnotu eip (předanou v %esi) do registru EAX
    # Skok na adresu uloženou v EAX, což je nový EIP
    jmp *%eax              #Skok na adresu v registru EAX (nový EIP)
