   M S B A M L   `   `   `  ����F  BChat Client, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:chat_applicationchat_application  5   	   Q-clr-namespace:chat_application.MVVM.ViewModelchat_application.MVVM.ViewModel  66   !    chat_application.MainWindow   5   	   W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:chat_application     5   	   C	viewmodel-clr-namespace:chat_application.MVVM.ViewModel     66   $	��650��5   	   $
��1200��6   ���#36393F  � WindowStyle$
  None=�5
   	    � AllowsTransparency$
 True��5   	    � Title$ Disposable Chat��5   	    � 
ResizeMode$ CanResizeWithGrip=�5   	    � DataContext 5      3  -chat_application.MVVM.ViewModel.MainViewModel  5   
   .��5      �  � RowDefinitions 5   
   �� 5      $��25 �6   �� 5       � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5      .+�5   
   �� -   5        $��2��5      ���#252525._�5      � $��Stretch=�6   .+�5#      �� $��0,0,0,0q�6   .��5$      �� $��/Icons/chat1.png��6   5%      �� 5&      $��Disposable Chat��6   
�������$��SemiBold"�5(      $��	20,-1,0,0q�5)      �� 5+      $��Right=�6    �� Orientation$ 
Horizontal=�5,      .+�5.      �� -   5        $��20��5.      $��20��6(   $
��🗕��64   
������ $��0q�50      
�������$
��Bold"�52      53      �� 55      -   5        $��20��55      $��20��6(   $
��🗖��64   
������ $��0q�57      
�������$
��Bold"�59      5:      �� 5<      -   5        $��20��5<      $��20��6(   $	��✖��64   
������ $��0q�5>      
�������$
��Bold"�5@      5A      5C      5D      5F      � 5H   
   ���#2F3136$��1��6$    5I      �� 5J      $��50 �6    �� 5K      �� 5L      $	��140 �6    .+�5O      � $��0��6    5P      �� 5Q      $��35 �6'   �� 5R      .+�5T      �� $��/Icons/group.png��6   $��20��62   $��8,0,0,0q�6=   �� 5U      $��Contacts��6   $��1��5V      $��Center=�5W      $��Medium"�5X      
�������$��4,0,0,0q�5Z      $��16(�5[      5\      �� 5^   
   -   5        
������ 
�������$��0q�5a      $��1��5b      ��5^      �� *Users+��5c      �� 5d      .R�5e      �� ���#9c9c9c$��12,0,0,0q�6S   $��12(�6e   $��Medium"�6s   ��6$   �� *
Username+6s   5f      5h      �� 5i      $��2��6   $ Vertical=�5j      ���#292B2F$
��Left=�5k   .   $	��200��6I   .+�5l      �� $��Username��6   $��Center=�5m      $��4,0,0,0q�5n      $��Medium"�5o      
�������5p      � 5q      $��2��6   $��Center=�6$   $��Center=�6A    5r      �� 5s      $��20 �6+   �� 5t      .+�5v      �� $��/Icons/user - Copy.png��6   $��1��5w      $��	4,-4,-2,0q�5x      $��Center=�5y      $��Center=�5z      �� 5{      $��2��6   $��25��5|      $	��160��5}      $��8,0,8,5q�5~      
�������
������ $��2q�5�       �� 
CaretBrush
 �������5�      �� *
Username+	 �� UpdateSourceTrigger$	 PropertyChanged=�.��5�   -   
 � 	Resources
 5�       �� 
TargetType �� Property �� Value��%^   '��       �� 5�      " ��6$   .�5�   "   ��  �@��CornerRadius$ 3��6A   5�      5�      .��6-   5�      5�      �� 5�      $��IP Address : Port��6   $��Center=�5�      $��4,-8,0,0q�5�      $��Medium"�5�      
�������5�      � 5�      $��2��6   $��Center=�6$   $��Center=�6A    5�      �� 5�      $��20 �6+   �� 5�      .+�5�      �� $��/Icons/plug - Copy.png��6   $��1��5�      $��	4,-4,-2,0q�5�      $��Center=�5�      $��Center=�5�      �� 5�      $��2��6   $��25��5�      $	��160��5�      $��8,0,8,5q�5�      
�������
������ $��2q�5�      
 �������5�      �� *	Address+$	 PropertyChanged=�.��5�   -   
 5�      ��%^   '��       �� 5�      " ��6$   .�5�   "   ��  �@��CornerRadius$ 3��6A   5�      5�      .��6-   5�      5�      �� 5�      $��25��6   $��55��5�      $��Connect��5�      ��5�      �� *ConnectToServerCommand+5�      5�      5�      � 5�   
   $��1��6   $��1��5�       5�      �� 5�      $��50 �6    �� 5�      �� 5�      $��70 �6    .+�5�      �� ���#2F3136$��0,0,0,2q�6+   ._�5�      � $��Stretch=�6   $��8q�5�      .+�5�      � $��0��6    5�      �� 5�      $��35 �6/   �� 5�      .+�5�      �� $��/Icons/chatting.png��6    $��20��6=   $��8,0,0,0q�6H   �� 5�      $��
Discussion��6    
�������$
��Bold"�5�      $��5,-1,5,0q�5�      $��Center=�5�      $��16(�5�      $��1��5�      5�      5�      5�      �� 5�      $��1��6   $��15q�6$   
������ $��0q�5�      
���������5�      �� *
Messages+� 5�      $��2��6    5�      �� 5�      �� 5�      $��90 �6'   .+�5�      �� 
 ��������#2F3136$��0q�5�       �� TextWrapping$
 Wrap=�5�      
�������$��55��5�      $��5,5,2,5q�5�      $��5q�5�      $��Center=�5�      $��1��5�      ��5�      �� *	Message+$	 PropertyChanged=�.��5�   .   
 5�      ��%^   '��       �� 5�      " ��6    .�5�      ��  �@��CornerRadius$ 8��6=   5�      5�      .��6)   5�      �� 5�      $��55��6   $��40��5�      $��2��5�      $��Center=�5�      $��Center=�5�      ��5�      �� *SendMessageCommand+.��5�      �� $$��/Icons/send-message - Copy.png��6   $��50��6D   $��30��6O   $��Center=�5�      $��Center=�69   5�      5�      5�      5�      5�      