
;                  === MAIN.ASM - �������� ��楤�� ===

Main_proc proc
      call Hide_cursor	;���祬 �����

      call Save_mainscr ;���࠭�� ᮤ�ন��� ��࠭�...

      mov Height_X,23	;���� ࠬ�� ��� '�ͻ' � '�ͼ'
      mov Width_Y,78	;��ਭ� ࠬ�� (�.�. �� ���� ��࠭) ��� '�' � '�'
      mov Num_attr,31	;���� - ᢥ⫮-���� �� ᨭ�� 䮭�
      call Draw_frame	;� ������ ��砥 ��㥬 ࠬ�� �� ���� ��࠭
;����ᯥ६������ � ���⮩ � �ਭ��, �᫨ �㤥� �������...

      call Pause	   ;���� ������ ������

      call Restore_mainscr ;����⠭���� ᮤ�ন��� ��࠭�!

      call Restore_cursor  ;����⠭���� �����

      ret		   ;��室!
Main_proc endp