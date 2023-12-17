clasclassdef Hangman < matlab.apps.AppBase
% Properties that correspond to app components
properties (Access = public)
UIFigure matlab.ui.Figure
NewGameButton matlab.ui.control.Button
ChooseWordCategoryDropDownLabel matlab.ui.control.Label
ChooseWordCategoryDropDown matlab.ui.control.DropDown
WordGuessingLabel matlab.ui.control.Label
KeyboardLabel matlab.ui.control.Label
QButton matlab.ui.control.Button
WButton matlab.ui.control.Button
EButton matlab.ui.control.Button
RButton matlab.ui.control.Button
TButton matlab.ui.control.Button
YButton matlab.ui.control.Button
UButton matlab.ui.control.Button
OButton matlab.ui.control.Button
PButton matlab.ui.control.Button
IButton matlab.ui.control.Button
AButton matlab.ui.control.Button
SButton matlab.ui.control.Button
DButton matlab.ui.control.Button
FButton matlab.ui.control.Button
GButton matlab.ui.control.Button
HButton matlab.ui.control.Button
JButton matlab.ui.control.Button
LButton matlab.ui.control.Button
KButton matlab.ui.control.Button
ZButton matlab.ui.control.Button
XButton matlab.ui.control.Button
CButton matlab.ui.control.Button
VButton matlab.ui.control.Button
BButton matlab.ui.control.Button
NButton matlab.ui.control.Button
MButton matlab.ui.control.Button
Label matlab.ui.control.Label
Label_2 matlab.ui.control.Label
Label_3 matlab.ui.control.Label
Image matlab.ui.control.Image
Image2 matlab.ui.control.Image
Image3 matlab.ui.control.Image
Image4 matlab.ui.control.Image
Image5 matlab.ui.control.Image
Image6 matlab.ui.control.Image
Label_4 matlab.ui.control.Label
Label_5 matlab.ui.control.Label
Label_6 matlab.ui.control.Label
Label_7 matlab.ui.control.Label
Label_8 matlab.ui.control.Label
Label_9 matlab.ui.control.Label
Label_10 matlab.ui.control.Label
Label_11 matlab.ui.control.Label
Label_12 matlab.ui.control.Label
end
methods (Access = private)
%This function radnomizes a word from the chosen category%
function ChooseWordCategory(app)
global wordlist
global word
global trials
trials=6;
global correctcounter
correctcounter=0;
global wordstr
wordstr=char(word);
switch app.ChooseWordCategoryDropDown.Value
case 'Food'
table=readtable('WordList.xlsx','Range','A2:A61');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
case 'Movies'
table=readtable('WordList.xlsx','Range','B2:B15');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
case 'Science'
table=readtable('WordList.xlsx','Range','C2:C55');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
case 'Colors'
table=readtable('WordList.xlsx','Range','D2:D50');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
disp(word);
case 'Names'
table=readtable('WordList.xlsx','Range','E2:E63');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
case 'Animals'
table=readtable('WordList.xlsx','Range','F2:F26');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
end
msgbox('You Have only 6 trials!','Game Started','help','modal');
end
%This function creates the same number of blanks of word letters.
function InitializeBlanks(app)
global wordlength
for i=1:wordlength
if i==1
app.Label_2.Text='_';
elseif i==2
app.Label.Text='_' ;
elseif i==3
app.Label_3.Text='_' ;
elseif i==4
app.Label_4.Text='_' ;
elseif i==5
app.Label_5.Text='_' ;
elseif i==6
app.Label_6.Text='_' ;
elseif i==7
app.Label_7.Text='_' ;
elseif i==8
app.Label_8.Text='_' ;
elseif i==9
app.Label_9.Text='_' ;
elseif i==10
app.Label_10.Text='_' ;
elseif i==11
app.Label_11.Text='_' ;
elseif i==12
app.Label_12.Text='_' ;
end
end
end
%This function changes the states of hangman image according to player's wrong
guesses%
function image(app)
global c
global trials
%This counter (c) indicates whether the letter is in the word or not%
if c==0
trials=trials-1;
switch trials
case 5
app.Image.Visible=1;
app.Image2.Visible=0;
app.Image3.Visible=0;
app.Image4.Visible=0;
app.Image5.Visible=0;
app.Image6.Visible=0;
case 4
app.Image.Visible=0;
app.Image2.Visible=1;
app.Image3.Visible=0;
app.Image4.Visible=0;
app.Image5.Visible=0;
app.Image6.Visible=0;
case 3
app.Image.Visible=0;
app.Image2.Visible=0;
app.Image3.Visible=1;
app.Image4.Visible=0;
app.Image5.Visible=0;
app.Image6.Visible=0;
case 2
app.Image.Visible=0;
app.Image2.Visible=0;
app.Image3.Visible=0;
app.Image4.Visible=1;
app.Image5.Visible=0;
app.Image6.Visible=0;
case 1
app.Image.Visible=0;
app.Image2.Visible=0;
app.Image3.Visible=0;
app.Image4.Visible=0;
app.Image5.Visible=1;
app.Image6.Visible=0;
case 0
app.Image.Visible=0;
app.Image2.Visible=0;
app.Image3.Visible=0;
app.Image4.Visible=0;
app.Image5.Visible=0;
app.Image6.Visible=1;
end
end
end
%This function displays the secret word and the end message if the player ran out of
trials%
function Lose(app)
global trials
global wordlength
global wordstr
if trials==0
for i=1:wordlength
if i==1
app.Label.Text=upper(wordstr(1));
elseif i==2
app.Label_2.Text=wordstr(2);
elseif i==3
app.Label_3.Text=wordstr(3) ;
elseif i==4
app.Label_4.Text=wordstr(4);
elseif i==5
app.Label_5.Text=wordstr(5);
elseif i==6
app.Label_6.Text=wordstr(6);
elseif i==7
app.Label_7.Text=wordstr(7);
elseif i==8
app.Label_8.Text=wordstr(8);
elseif i==9
app.Label_9.Text=wordstr(9);
elseif i==10
app.Label_10.Text=wordstr(10);
elseif i==11
app.Label_11.Text=wordstr(11);
elseif i==12
app.Label_12.Text=wordstr(12);
end
end
msgbox('You Lost!','Game over','none','modal');
end
end
%This function displays win message when the player guesses the word correctly%
function Win(app) %#ok<MANU>
global correctcounter
global wordlength
if correctcounter==wordlength
msgbox('You Won!','Game over','none','modal');
end
end
end
% Callbacks that handle component events
methods (Access = private)
% Code that executes after component creation
function startupFcn(app, getvariables)
end
% Value changed function: ChooseWordCategoryDropDown
function ChooseWordCategoryDropDownValueChanged(app, event)
ChooseWordCategory(app)
global wordlist
wordlist=table2array(table);
global word
global trials
trials=6;
global correctcounter
correctcounter=0;
global wordstr
wordstr=char(word);
global wordlength
wordlength=length(wordstr);
InitializeBlanks(app)
end
% Button pushed function: NewGameButton
function NewGameButtonPushed(app, event)
%This function removes the existing word and image, resets the number of trials and
keyboard. %
global trials
trials=6;
global correctcounter
correctcounter=0;
app.Label_2.Text='';
app.Label.Text='' ;
app.Label_3.Text='' ;
app.Label_4.Text='' ;
app.Label_5.Text='' ;
app.Label_6.Text='' ;
app.Label_7.Text='' ;
app.Label_8.Text='' ;
app.Label_9.Text='' ;
app.Label_10.Text='' ;
app.Label_11.Text='' ;
app.Label_12.Text='' ;
app.QButton.Visible=1;
app.WButton.Visible=1;
app.EButton.Visible=1;
app.RButton.Visible=1;
app.TButton.Visible=1;
app.YButton.Visible=1;
app.UButton.Visible=1;
app.OButton.Visible=1;
app.PButton.Visible=1;
app.IButton.Visible=1;
app.AButton.Visible=1;
app.SButton.Visible=1;
app.DButton.Visible=1;
app.FButton.Visible=1;
app.GButton.Visible=1;
app.HButton.Visible=1;
app.JButton.Visible=1;
app.LButton.Visible=1;
app.ZButton.Visible=1;
app.XButton.Visible=1;
app.CButton.Visible=1;
app.VButton.Visible=1;
app.BButton.Visible=1;
app.NButton.Visible=1;
app.MButton.Visible=1;
app.KButton.Visible=1;
app.Image.Visible=0;
app.Image2.Visible=0;
app.Image3.Visible=0;
app.Image4.Visible=0;
app.Image5.Visible=0;
app.Image6.Visible=0;
app.ChooseWordCategoryDropDown.Value='';
end
% Button pushed function: QButton
function QButtonPushed(app, event)
%This function checks whether the letter exists in the word or not and deletes the
letter%
app.QButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
%This counter counts how many correct letters the player guessed so far%
global correctcounter
Letter='q';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='Q';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: WButton
function WButtonPushed(app, event)
app.WButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
Letter='w';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
if i==1
app.Label.Text='W';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: EButton
function EButtonPushed(app, event)
app.EButton.Visible=0;
global wordstr
global c
c=0;
global correctcounter
global wordlength
Letter='e';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='E';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: RButton
function RButtonPushed(app, event)
app.RButton.Visible=0;
global c
c=0;
global wordstr
global correctcounter
global wordlength
Letter='r';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='R';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: TButton
function TButtonPushed(app, event)
app.TButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='t';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='T';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: YButton
function YButtonPushed(app, event)
app.YButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='y';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='Y';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: UButton
function UButtonPushed(app, event)
app.UButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='u';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='U';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: IButton
function IButtonPushed(app, event)
app.IButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='i';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='I';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: OButton
function OButtonPushed(app, event)
app.OButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='o';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='O';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: PButton
function PButtonPushed(app, event)
app.PButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='p';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='P';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: AButton
function AButtonPushed(app, event)
app.AButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='a';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='A';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: SButton
function SButtonPushed(app, event)
app.SButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='s';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='S';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: DButton
function DButtonPushed(app, event)
app.DButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='d';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='D';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: FButton
function FButtonPushed(app, event)
app.FButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='f';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='F';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: GButton
function GButtonPushed(app, event)
app.GButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='g';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='G';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: HButton
function HButtonPushed(app, event)
app.HButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='h';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='H';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: JButton
function JButtonPushed(app, event)
app.JButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='j';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='J';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: KButton
function KButtonPushed(app, event)
app.KButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='k';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='K';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: LButton
function LButtonPushed(app, event)
app.LButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='l';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='L';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: ZButton
function ZButtonPushed(app, event)
app.ZButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='z';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='Z';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: XButton
function XButtonPushed(app, event)
app.XButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='x';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='X';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: CButton
function CButtonPushed(app, event)
app.CButton.Visible=0;
global c
c=0;
global wordstr
global correctcounter
global wordlength
Letter='c';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='C';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: VButton
function VButtonPushed(app, event)
app.VButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='v';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='V';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: BButton
function BButtonPushed(app, event)
app.BButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='b';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='B';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: NButton
function NButtonPushed(app, event)
app.NButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='n';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='N';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: MButton
function MButtonPushed(app, event)
app.MButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='m';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='M';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
end
% Component initialization
methods (Access = private)
% Create UIFigure and components
function createComponents(app)
% Create UIFigure and hide until all components are created
app.UIFigure = uifigure('Visible', 'off');
app.UIFigure.Color = [0.902 0.902 0.902];
app.UIFigure.Position = [100 100 896 496];
app.UIFigure.Name = 'UI Figure';
% Create NewGameButton
app.NewGameButton = uibutton(app.UIFigure, 'push');
app.NewGameButton.ButtonPushedFcn = createCallbackFcn(app,
@NewGameButtonPushed, true);
app.NewGameButton.BackgroundColor = [0.2275 0.549 0.3216];
app.NewGameButton.FontSize = 18;
app.NewGameButton.FontWeight = 'bold';
app.NewGameButton.Position = [131 401 172 85];
app.NewGameButton.Text = 'New Game';
% Create ChooseWordCategoryDropDownLabel
app.ChooseWordCategoryDropDownLabel = uilabel(app.UIFigure);
app.ChooseWordCategoryDropDownLabel.BackgroundColor = [0.3529 0.702 0.3137];
app.ChooseWordCategoryDropDownLabel.HorizontalAlignment = 'right';
app.ChooseWordCategoryDropDownLabel.Position = [14 361 131 22];
app.ChooseWordCategoryDropDownLabel.Text = 'Choose Word Category';
% Create ChooseWordCategoryDropDown
app.ChooseWordCategoryDropDown = uidropdown(app.UIFigure);
app.ChooseWordCategoryDropDown.Items = {'', 'Food', 'Movies', 'Science', 'Colors',
'Names', 'Animals'};
app.ChooseWordCategoryDropDown.ValueChangedFcn = createCallbackFcn(app,
@ChooseWordCategoryDropDownValueChanged, true);
app.ChooseWordCategoryDropDown.BackgroundColor = [0.3529 0.702 0.3137];
app.ChooseWordCategoryDropDown.Position = [160 361 255 22];
app.ChooseWordCategoryDropDown.Value = '';
% Create WordGuessingLabel
app.WordGuessingLabel = uilabel(app.UIFigure);
app.WordGuessingLabel.HorizontalAlignment = 'center';
app.WordGuessingLabel.FontSize = 25;
app.WordGuessingLabel.FontWeight = 'bold';
app.WordGuessingLabel.Position = [83 321 220 30];
app.WordGuessingLabel.Text = 'Word Guessing';
% Create KeyboardLabel
app.KeyboardLabel = uilabel(app.UIFigure);
app.KeyboardLabel.BackgroundColor = [0.902 0.902 0.902];
app.KeyboardLabel.FontSize = 16;
app.KeyboardLabel.FontWeight = 'bold';
app.KeyboardLabel.Position = [150 208 79 23];
app.KeyboardLabel.Text = 'Keyboard';
% Create QButton
app.QButton = uibutton(app.UIFigure, 'push');
app.QButton.ButtonPushedFcn = createCallbackFcn(app, @QButtonPushed, true);
app.QButton.Position = [1 158 30 30];
app.QButton.Text = 'Q';
% Create WButton
app.WButton = uibutton(app.UIFigure, 'push');
app.WButton.ButtonPushedFcn = createCallbackFcn(app, @WButtonPushed, true);
app.WButton.Position = [41 158 30 30];
app.WButton.Text = 'W';
% Create EButton
app.EButton = uibutton(app.UIFigure, 'push');
app.EButton.ButtonPushedFcn = createCallbackFcn(app, @EButtonPushed, true);
app.EButton.Position = [81 158 30 30];
app.EButton.Text = 'E';
% Create RButton
app.RButton = uibutton(app.UIFigure, 'push');
app.RButton.ButtonPushedFcn = createCallbackFcn(app, @RButtonPushed, true);
app.RButton.Position = [121 158 30 30];
app.RButton.Text = 'R';
% Create TButton
app.TButton = uibutton(app.UIFigure, 'push');
app.TButton.ButtonPushedFcn = createCallbackFcn(app, @TButtonPushed, true);
app.TButton.Position = [162 158 30 30];
app.TButton.Text = 'T';
% Create YButton
app.YButton = uibutton(app.UIFigure, 'push');
app.YButton.ButtonPushedFcn = createCallbackFcn(app, @YButtonPushed, true);
app.YButton.Position = [201 158 30 30];
app.YButton.Text = 'Y';
% Create UButton
app.UButton = uibutton(app.UIFigure, 'push');
app.UButton.ButtonPushedFcn = createCallbackFcn(app, @UButtonPushed, true);
app.UButton.Position = [241 158 30 30];
app.UButton.Text = 'U';
% Create OButton
app.OButton = uibutton(app.UIFigure, 'push');
app.OButton.ButtonPushedFcn = createCallbackFcn(app, @OButtonPushed, true);
app.OButton.Position = [321 158 30 30];
app.OButton.Text = 'O';
% Create PButton
app.PButton = uibutton(app.UIFigure, 'push');
app.PButton.ButtonPushedFcn = createCallbackFcn(app, @PButtonPushed, true);
app.PButton.Position = [361 158 30 30];
app.PButton.Text = 'P';
% Create IButton
app.IButton = uibutton(app.UIFigure, 'push');
app.IButton.ButtonPushedFcn = createCallbackFcn(app, @IButtonPushed, true);
app.IButton.Position = [281 158 30 30];
app.IButton.Text = 'I';
% Create AButton
app.AButton = uibutton(app.UIFigure, 'push');
app.AButton.ButtonPushedFcn = createCallbackFcn(app, @AButtonPushed, true);
app.AButton.Position = [41 107 30 30];
app.AButton.Text = 'A';
% Create SButton
app.SButton = uibutton(app.UIFigure, 'push');
app.SButton.ButtonPushedFcn = createCallbackFcn(app, @SButtonPushed, true);
app.SButton.Position = [81 107 30 30];
app.SButton.Text = 'S';
% Create DButton
app.DButton = uibutton(app.UIFigure, 'push');
app.DButton.ButtonPushedFcn = createCallbackFcn(app, @DButtonPushed, true);
app.DButton.Position = [121 107 30 30];
app.DButton.Text = 'D';
% Create FButton
app.FButton = uibutton(app.UIFigure, 'push');
app.FButton.ButtonPushedFcn = createCallbackFcn(app, @FButtonPushed, true);
app.FButton.Position = [161 107 30 30];
app.FButton.Text = 'F';
% Create GButton
app.GButton = uibutton(app.UIFigure, 'push');
app.GButton.ButtonPushedFcn = createCallbackFcn(app, @GButtonPushed, true);
app.GButton.Position = [202 107 30 30];
app.GButton.Text = 'G';
% Create HButton
app.HButton = uibutton(app.UIFigure, 'push');
app.HButton.ButtonPushedFcn = createCallbackFcn(app, @HButtonPushed, true);
app.HButton.Position = [241 107 30 30];
app.HButton.Text = 'H';
% Create JButton
app.JButton = uibutton(app.UIFigure, 'push');
app.JButton.ButtonPushedFcn = createCallbackFcn(app, @JButtonPushed, true);
app.JButton.Position = [281 107 30 30];
app.JButton.Text = 'J';
% Create LButton
app.LButton = uibutton(app.UIFigure, 'push');
app.LButton.ButtonPushedFcn = createCallbackFcn(app, @LButtonPushed, true);
app.LButton.Position = [361 107 30 30];
app.LButton.Text = 'L';
% Create KButton
app.KButton = uibutton(app.UIFigure, 'push');
app.KButton.ButtonPushedFcn = createCallbackFcn(app, @KButtonPushed, true);
app.KButton.Position = [321 107 30 30];
app.KButton.Text = 'K';
% Create ZButton
app.ZButton = uibutton(app.UIFigure, 'push');
app.ZButton.ButtonPushedFcn = createCallbackFcn(app, @ZButtonPushed, true);
app.ZButton.Position = [81 57 30 30];
app.ZButton.Text = 'Z';
% Create XButton
app.XButton = uibutton(app.UIFigure, 'push');
app.XButton.ButtonPushedFcn = createCallbackFcn(app, @XButtonPushed, true);
app.XButton.Position = [121 57 30 30];
app.XButton.Text = 'X';
% Create CButton
app.CButton = uibutton(app.UIFigure, 'push');
app.CButton.ButtonPushedFcn = createCallbackFcn(app, @CButtonPushed, true);
app.CButton.Position = [161 57 30 30];
app.CButton.Text = 'C';
% Create VButton
app.VButton = uibutton(app.UIFigure, 'push');
app.VButton.ButtonPushedFcn = createCallbackFcn(app, @VButtonPushed, true);
app.VButton.Position = [201 57 30 30];
app.VButton.Text = 'V';
% Create BButton
app.BButton = uibutton(app.UIFigure, 'push');
app.BButton.ButtonPushedFcn = createCallbackFcn(app, @BButtonPushed, true);
app.BButton.Position = [242 57 30 30];
app.BButton.Text = 'B';
% Create NButton
app.NButton = uibutton(app.UIFigure, 'push');
app.NButton.ButtonPushedFcn = createCallbackFcn(app, @NButtonPushed, true);
app.NButton.Position = [281 57 30 30];
app.NButton.Text = 'N';
% Create MButton
app.MButton = uibutton(app.UIFigure, 'push');
app.MButton.ButtonPushedFcn = createCallbackFcn(app, @MButtonPushed, true);
app.MButton.Position = [321 57 30 30];
app.MButton.Text = 'M';
% Create Label
app.Label = uilabel(app.UIFigure);
app.Label.FontName = 'Georgia';
app.Label.FontSize = 15;
app.Label.Position = [108 292 25 22];
app.Label.Text = '_';
% Create Label_2
app.Label_2 = uilabel(app.UIFigure);
app.Label_2.FontName = 'Georgia';
app.Label_2.FontSize = 15;
app.Label_2.Position = [123 292 25 22];
app.Label_2.Text = '_';
% Create Label_3
app.Label_3 = uilabel(app.UIFigure);
app.Label_3.FontName = 'Georgia';
app.Label_3.FontSize = 15;
app.Label_3.Position = [139 292 25 22];
app.Label_3.Text = '_';
% Create Image
app.Image = uiimage(app.UIFigure);
app.Image.Position = [468 1 458 496];
app.Image.ImageSource = '1.png';
% Create Image2
app.Image2 = uiimage(app.UIFigure);
app.Image2.Position = [468 1 469 496];
app.Image2.ImageSource = '2.png';
% Create Image3
app.Image3 = uiimage(app.UIFigure);
app.Image3.Position = [468 1 429 496];
app.Image3.ImageSource = '3.png';
% Create Image4
app.Image4 = uiimage(app.UIFigure);
app.Image4.Position = [468 1 429 496];
app.Image4.ImageSource = '4.png';
% Create Image5
app.Image5 = uiimage(app.UIFigure);
app.Image5.Position = [468 1 429 496];
app.Image5.ImageSource = '5.png';
% Create Image6
app.Image6 = uiimage(app.UIFigure);
app.Image6.Position = [468 1 429 496];
app.Image6.ImageSource = '6.png';
% Create Label_4
app.Label_4 = uilabel(app.UIFigure);
app.Label_4.FontName = 'Georgia';
app.Label_4.FontSize = 15;
app.Label_4.Position = [155 292 25 22];
app.Label_4.Text = '_';
% Create Label_5
app.Label_5 = uilabel(app.UIFigure);
app.Label_5.FontName = 'Georgia';
app.Label_5.FontSize = 15;
app.Label_5.Position = [171 292 25 22];
app.Label_5.Text = '_';
% Create Label_6
app.Label_6 = uilabel(app.UIFigure);
app.Label_6.FontName = 'Georgia';
app.Label_6.FontSize = 15;
app.Label_6.Position = [187 292 25 22];
app.Label_6.Text = '_';
% Create Label_7
app.Label_7 = uilabel(app.UIFigure);
app.Label_7.FontName = 'Georgia';
app.Label_7.FontSize = 15;
app.Label_7.Position = [203 292 25 22];
app.Label_7.Text = '_';
% Create Label_8
app.Label_8 = uilabel(app.UIFigure);
app.Label_8.FontName = 'Georgia';
app.Label_8.FontSize = 15;
app.Label_8.Position = [219 292 25 22];
app.Label_8.Text = '_';
% Create Label_9
app.Label_9 = uilabel(app.UIFigure);
app.Label_9.FontName = 'Georgia';
app.Label_9.FontSize = 15;
app.Label_9.Position = [235 292 25 22];
app.Label_9.Text = '_';
% Create Label_10
app.Label_10 = uilabel(app.UIFigure);
app.Label_10.FontName = 'Georgia';
app.Label_10.FontSize = 15;
app.Label_10.Position = [251 292 25 22];
app.Label_10.Text = '_';
% Create Label_11
app.Label_11 = uilabel(app.UIFigure);
app.Label_11.FontName = 'Georgia';
app.Label_11.FontSize = 15;
app.Label_11.Position = [267 292 25 22];
app.Label_11.Text = '_';
% Create Label_12
app.Label_12 = uilabel(app.UIFigure);
app.Label_12.FontName = 'Georgia';
app.Label_12.FontSize = 15;
app.Label_12.Position = [283 292 25 22];
app.Label_12.Text = '_';
% Show the figure after all components are created
app.UIFigure.Visible = 'on';
end
end
% App creation and deletion
methods (Access = public)
% Construct app
function app = Hangman(varargin)
% Create UIFigure and components
createComponents(app)
% Register the app with App Designer
registerApp(app, app.UIFigure)
% Execute the startup function
runStartupFcn(app, @(app)startupFcn(app, varargin{:}))
if nargout == 0
clear app
end
end
% Code that executes before app deletion
function delete(app)
% Delete UIFigure when app is deleted
delete(app.UIFigure)
end
end
end
sdef Hangman < matlab.apps.AppBase
% Properties that correspond to app components
properties (Access = public)
UIFigure matlab.ui.Figure
NewGameButton matlab.ui.control.Button
ChooseWordCategoryDropDownLabel matlab.ui.control.Label
ChooseWordCategoryDropDown matlab.ui.control.DropDown
WordGuessingLabel matlab.ui.control.Label
KeyboardLabel matlab.ui.control.Label
QButton matlab.ui.control.Button
WButton matlab.ui.control.Button
EButton matlab.ui.control.Button
RButton matlab.ui.control.Button
TButton matlab.ui.control.Button
YButton matlab.ui.control.Button
UButton matlab.ui.control.Button
OButton matlab.ui.control.Button
PButton matlab.ui.control.Button
IButton matlab.ui.control.Button
AButton matlab.ui.control.Button
SButton matlab.ui.control.Button
DButton matlab.ui.control.Button
FButton matlab.ui.control.Button
GButton matlab.ui.control.Button
HButton matlab.ui.control.Button
JButton matlab.ui.control.Button
LButton matlab.ui.control.Button
KButton matlab.ui.control.Button
ZButton matlab.ui.control.Button
XButton matlab.ui.control.Button
CButton matlab.ui.control.Button
VButton matlab.ui.control.Button
BButton matlab.ui.control.Button
NButton matlab.ui.control.Button
MButton matlab.ui.control.Button
Label matlab.ui.control.Label
Label_2 matlab.ui.control.Label
Label_3 matlab.ui.control.Label
Image matlab.ui.control.Image
Image2 matlab.ui.control.Image
Image3 matlab.ui.control.Image
Image4 matlab.ui.control.Image
Image5 matlab.ui.control.Image
Image6 matlab.ui.control.Image
Label_4 matlab.ui.control.Label
Label_5 matlab.ui.control.Label
Label_6 matlab.ui.control.Label
Label_7 matlab.ui.control.Label
Label_8 matlab.ui.control.Label
Label_9 matlab.ui.control.Label
Label_10 matlab.ui.control.Label
Label_11 matlab.ui.control.Label
Label_12 matlab.ui.control.Label
end
methods (Access = private)
%This function radnomizes a word from the chosen category%
function ChooseWordCategory(app)
global wordlist
global word
global trials
trials=6;
global correctcounter
correctcounter=0;
global wordstr
wordstr=char(word);
switch app.ChooseWordCategoryDropDown.Value
case 'Food'
table=readtable('WordList.xlsx','Range','A2:A61');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
case 'Movies'
table=readtable('WordList.xlsx','Range','B2:B15');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
case 'Science'
table=readtable('WordList.xlsx','Range','C2:C55');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
case 'Colors'
table=readtable('WordList.xlsx','Range','D2:D50');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
disp(word);
case 'Names'
table=readtable('WordList.xlsx','Range','E2:E63');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
case 'Animals'
table=readtable('WordList.xlsx','Range','F2:F26');
wordlist=table2array(table);
order=randi([1 length(wordlist)]);
word=wordlist(order);
end
msgbox('You Have only 6 trials!','Game Started','help','modal');
end
%This function creates the same number of blanks of word letters.
function InitializeBlanks(app)
global wordlength
for i=1:wordlength
if i==1
app.Label_2.Text='_';
elseif i==2
app.Label.Text='_' ;
elseif i==3
app.Label_3.Text='_' ;
elseif i==4
app.Label_4.Text='_' ;
elseif i==5
app.Label_5.Text='_' ;
elseif i==6
app.Label_6.Text='_' ;
elseif i==7
app.Label_7.Text='_' ;
elseif i==8
app.Label_8.Text='_' ;
elseif i==9
app.Label_9.Text='_' ;
elseif i==10
app.Label_10.Text='_' ;
elseif i==11
app.Label_11.Text='_' ;
elseif i==12
app.Label_12.Text='_' ;
end
end
end
%This function changes the states of hangman image according to player's wrong
guesses%
function image(app)
global c
global trials
%This counter (c) indicates whether the letter is in the word or not%
if c==0
trials=trials-1;
switch trials
case 5
app.Image.Visible=1;
app.Image2.Visible=0;
app.Image3.Visible=0;
app.Image4.Visible=0;
app.Image5.Visible=0;
app.Image6.Visible=0;
case 4
app.Image.Visible=0;
app.Image2.Visible=1;
app.Image3.Visible=0;
app.Image4.Visible=0;
app.Image5.Visible=0;
app.Image6.Visible=0;
case 3
app.Image.Visible=0;
app.Image2.Visible=0;
app.Image3.Visible=1;
app.Image4.Visible=0;
app.Image5.Visible=0;
app.Image6.Visible=0;
case 2
app.Image.Visible=0;
app.Image2.Visible=0;
app.Image3.Visible=0;
app.Image4.Visible=1;
app.Image5.Visible=0;
app.Image6.Visible=0;
case 1
app.Image.Visible=0;
app.Image2.Visible=0;
app.Image3.Visible=0;
app.Image4.Visible=0;
app.Image5.Visible=1;
app.Image6.Visible=0;
case 0
app.Image.Visible=0;
app.Image2.Visible=0;
app.Image3.Visible=0;
app.Image4.Visible=0;
app.Image5.Visible=0;
app.Image6.Visible=1;
end
end
end
%This function displays the secret word and the end message if the player ran out of
trials%
function Lose(app)
global trials
global wordlength
global wordstr
if trials==0
for i=1:wordlength
if i==1
app.Label.Text=upper(wordstr(1));
elseif i==2
app.Label_2.Text=wordstr(2);
elseif i==3
app.Label_3.Text=wordstr(3) ;
elseif i==4
app.Label_4.Text=wordstr(4);
elseif i==5
app.Label_5.Text=wordstr(5);
elseif i==6
app.Label_6.Text=wordstr(6);
elseif i==7
app.Label_7.Text=wordstr(7);
elseif i==8
app.Label_8.Text=wordstr(8);
elseif i==9
app.Label_9.Text=wordstr(9);
elseif i==10
app.Label_10.Text=wordstr(10);
elseif i==11
app.Label_11.Text=wordstr(11);
elseif i==12
app.Label_12.Text=wordstr(12);
end
end
msgbox('You Lost!','Game over','none','modal');
end
end
%This function displays win message when the player guesses the word correctly%
function Win(app) %#ok<MANU>
global correctcounter
global wordlength
if correctcounter==wordlength
msgbox('You Won!','Game over','none','modal');
end
end
end
% Callbacks that handle component events
methods (Access = private)
% Code that executes after component creation
function startupFcn(app, getvariables)
end
% Value changed function: ChooseWordCategoryDropDown
function ChooseWordCategoryDropDownValueChanged(app, event)
ChooseWordCategory(app)
global wordlist
wordlist=table2array(table);
global word
global trials
trials=6;
global correctcounter
correctcounter=0;
global wordstr
wordstr=char(word);
global wordlength
wordlength=length(wordstr);
InitializeBlanks(app)
end
% Button pushed function: NewGameButton
function NewGameButtonPushed(app, event)
%This function removes the existing word and image, resets the number of trials and
keyboard. %
global trials
trials=6;
global correctcounter
correctcounter=0;
app.Label_2.Text='';
app.Label.Text='' ;
app.Label_3.Text='' ;
app.Label_4.Text='' ;
app.Label_5.Text='' ;
app.Label_6.Text='' ;
app.Label_7.Text='' ;
app.Label_8.Text='' ;
app.Label_9.Text='' ;
app.Label_10.Text='' ;
app.Label_11.Text='' ;
app.Label_12.Text='' ;
app.QButton.Visible=1;
app.WButton.Visible=1;
app.EButton.Visible=1;
app.RButton.Visible=1;
app.TButton.Visible=1;
app.YButton.Visible=1;
app.UButton.Visible=1;
app.OButton.Visible=1;
app.PButton.Visible=1;
app.IButton.Visible=1;
app.AButton.Visible=1;
app.SButton.Visible=1;
app.DButton.Visible=1;
app.FButton.Visible=1;
app.GButton.Visible=1;
app.HButton.Visible=1;
app.JButton.Visible=1;
app.LButton.Visible=1;
app.ZButton.Visible=1;
app.XButton.Visible=1;
app.CButton.Visible=1;
app.VButton.Visible=1;
app.BButton.Visible=1;
app.NButton.Visible=1;
app.MButton.Visible=1;
app.KButton.Visible=1;
app.Image.Visible=0;
app.Image2.Visible=0;
app.Image3.Visible=0;
app.Image4.Visible=0;
app.Image5.Visible=0;
app.Image6.Visible=0;
app.ChooseWordCategoryDropDown.Value='';
end
% Button pushed function: QButton
function QButtonPushed(app, event)
%This function checks whether the letter exists in the word or not and deletes the
letter%
app.QButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
%This counter counts how many correct letters the player guessed so far%
global correctcounter
Letter='q';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='Q';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: WButton
function WButtonPushed(app, event)
app.WButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
Letter='w';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
if i==1
app.Label.Text='W';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: EButton
function EButtonPushed(app, event)
app.EButton.Visible=0;
global wordstr
global c
c=0;
global correctcounter
global wordlength
Letter='e';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='E';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: RButton
function RButtonPushed(app, event)
app.RButton.Visible=0;
global c
c=0;
global wordstr
global correctcounter
global wordlength
Letter='r';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='R';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: TButton
function TButtonPushed(app, event)
app.TButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='t';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='T';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: YButton
function YButtonPushed(app, event)
app.YButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='y';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='Y';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: UButton
function UButtonPushed(app, event)
app.UButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='u';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='U';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: IButton
function IButtonPushed(app, event)
app.IButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='i';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='I';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: OButton
function OButtonPushed(app, event)
app.OButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='o';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='O';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: PButton
function PButtonPushed(app, event)
app.PButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='p';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='P';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: AButton
function AButtonPushed(app, event)
app.AButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='a';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='A';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: SButton
function SButtonPushed(app, event)
app.SButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='s';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='S';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: DButton
function DButtonPushed(app, event)
app.DButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='d';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='D';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: FButton
function FButtonPushed(app, event)
app.FButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='f';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='F';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: GButton
function GButtonPushed(app, event)
app.GButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='g';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='G';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: HButton
function HButtonPushed(app, event)
app.HButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='h';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='H';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: JButton
function JButtonPushed(app, event)
app.JButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='j';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='J';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: KButton
function KButtonPushed(app, event)
app.KButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='k';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='K';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: LButton
function LButtonPushed(app, event)
app.LButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='l';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='L';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: ZButton
function ZButtonPushed(app, event)
app.ZButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='z';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='Z';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: XButton
function XButtonPushed(app, event)
app.XButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='x';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='X';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: CButton
function CButtonPushed(app, event)
app.CButton.Visible=0;
global c
c=0;
global wordstr
global correctcounter
global wordlength
Letter='c';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='C';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: VButton
function VButtonPushed(app, event)
app.VButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='v';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='V';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: BButton
function BButtonPushed(app, event)
app.BButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='b';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='B';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: NButton
function NButtonPushed(app, event)
app.NButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='n';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='N';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
% Button pushed function: MButton
function MButtonPushed(app, event)
app.MButton.Visible=0;
global c
c=0;
global wordstr
global wordlength
global correctcounter
Letter='m';
for i=1:wordlength
if strcmp(wordstr(i),Letter)==1
c=c+1;
correctcounter=correctcounter+1;
if i==1
app.Label.Text='M';
elseif i==2
app.Label_2.Text=Letter ;
elseif i==3
app.Label_3.Text=Letter ;
elseif i==4
app.Label_4.Text=Letter ;
elseif i==5
app.Label_5.Text=Letter;
elseif i==6
app.Label_6.Text=Letter;
elseif i==7
app.Label_7.Text=Letter;
elseif i==8
app.Label_8.Text=Letter;
elseif i==9
app.Label_9.Text=Letter;
elseif i==10
app.Label_10.Text=Letter;
elseif i==11
app.Label_11.Text=Letter;
elseif i==12
app.Label_12.Text=Letter;
end
end
end
image(app)
Lose(app)
Win(app)
end
end
% Component initialization
methods (Access = private)
% Create UIFigure and components
function createComponents(app)
% Create UIFigure and hide until all components are created
app.UIFigure = uifigure('Visible', 'off');
app.UIFigure.Color = [0.902 0.902 0.902];
app.UIFigure.Position = [100 100 896 496];
app.UIFigure.Name = 'UI Figure';
% Create NewGameButton
app.NewGameButton = uibutton(app.UIFigure, 'push');
app.NewGameButton.ButtonPushedFcn = createCallbackFcn(app,
@NewGameButtonPushed, true);
app.NewGameButton.BackgroundColor = [0.2275 0.549 0.3216];
app.NewGameButton.FontSize = 18;
app.NewGameButton.FontWeight = 'bold';
app.NewGameButton.Position = [131 401 172 85];
app.NewGameButton.Text = 'New Game';
% Create ChooseWordCategoryDropDownLabel
app.ChooseWordCategoryDropDownLabel = uilabel(app.UIFigure);
app.ChooseWordCategoryDropDownLabel.BackgroundColor = [0.3529 0.702 0.3137];
app.ChooseWordCategoryDropDownLabel.HorizontalAlignment = 'right';
app.ChooseWordCategoryDropDownLabel.Position = [14 361 131 22];
app.ChooseWordCategoryDropDownLabel.Text = 'Choose Word Category';
% Create ChooseWordCategoryDropDown
app.ChooseWordCategoryDropDown = uidropdown(app.UIFigure);
app.ChooseWordCategoryDropDown.Items = {'', 'Food', 'Movies', 'Science', 'Colors',
'Names', 'Animals'};
app.ChooseWordCategoryDropDown.ValueChangedFcn = createCallbackFcn(app,
@ChooseWordCategoryDropDownValueChanged, true);
app.ChooseWordCategoryDropDown.BackgroundColor = [0.3529 0.702 0.3137];
app.ChooseWordCategoryDropDown.Position = [160 361 255 22];
app.ChooseWordCategoryDropDown.Value = '';
% Create WordGuessingLabel
app.WordGuessingLabel = uilabel(app.UIFigure);
app.WordGuessingLabel.HorizontalAlignment = 'center';
app.WordGuessingLabel.FontSize = 25;
app.WordGuessingLabel.FontWeight = 'bold';
app.WordGuessingLabel.Position = [83 321 220 30];
app.WordGuessingLabel.Text = 'Word Guessing';
% Create KeyboardLabel
app.KeyboardLabel = uilabel(app.UIFigure);
app.KeyboardLabel.BackgroundColor = [0.902 0.902 0.902];
app.KeyboardLabel.FontSize = 16;
app.KeyboardLabel.FontWeight = 'bold';
app.KeyboardLabel.Position = [150 208 79 23];
app.KeyboardLabel.Text = 'Keyboard';
% Create QButton
app.QButton = uibutton(app.UIFigure, 'push');
app.QButton.ButtonPushedFcn = createCallbackFcn(app, @QButtonPushed, true);
app.QButton.Position = [1 158 30 30];
app.QButton.Text = 'Q';
% Create WButton
app.WButton = uibutton(app.UIFigure, 'push');
app.WButton.ButtonPushedFcn = createCallbackFcn(app, @WButtonPushed, true);
app.WButton.Position = [41 158 30 30];
app.WButton.Text = 'W';
% Create EButton
app.EButton = uibutton(app.UIFigure, 'push');
app.EButton.ButtonPushedFcn = createCallbackFcn(app, @EButtonPushed, true);
app.EButton.Position = [81 158 30 30];
app.EButton.Text = 'E';
% Create RButton
app.RButton = uibutton(app.UIFigure, 'push');
app.RButton.ButtonPushedFcn = createCallbackFcn(app, @RButtonPushed, true);
app.RButton.Position = [121 158 30 30];
app.RButton.Text = 'R';
% Create TButton
app.TButton = uibutton(app.UIFigure, 'push');
app.TButton.ButtonPushedFcn = createCallbackFcn(app, @TButtonPushed, true);
app.TButton.Position = [162 158 30 30];
app.TButton.Text = 'T';
% Create YButton
app.YButton = uibutton(app.UIFigure, 'push');
app.YButton.ButtonPushedFcn = createCallbackFcn(app, @YButtonPushed, true);
app.YButton.Position = [201 158 30 30];
app.YButton.Text = 'Y';
% Create UButton
app.UButton = uibutton(app.UIFigure, 'push');
app.UButton.ButtonPushedFcn = createCallbackFcn(app, @UButtonPushed, true);
app.UButton.Position = [241 158 30 30];
app.UButton.Text = 'U';
% Create OButton
app.OButton = uibutton(app.UIFigure, 'push');
app.OButton.ButtonPushedFcn = createCallbackFcn(app, @OButtonPushed, true);
app.OButton.Position = [321 158 30 30];
app.OButton.Text = 'O';
% Create PButton
app.PButton = uibutton(app.UIFigure, 'push');
app.PButton.ButtonPushedFcn = createCallbackFcn(app, @PButtonPushed, true);
app.PButton.Position = [361 158 30 30];
app.PButton.Text = 'P';
% Create IButton
app.IButton = uibutton(app.UIFigure, 'push');
app.IButton.ButtonPushedFcn = createCallbackFcn(app, @IButtonPushed, true);
app.IButton.Position = [281 158 30 30];
app.IButton.Text = 'I';
% Create AButton
app.AButton = uibutton(app.UIFigure, 'push');
app.AButton.ButtonPushedFcn = createCallbackFcn(app, @AButtonPushed, true);
app.AButton.Position = [41 107 30 30];
app.AButton.Text = 'A';
% Create SButton
app.SButton = uibutton(app.UIFigure, 'push');
app.SButton.ButtonPushedFcn = createCallbackFcn(app, @SButtonPushed, true);
app.SButton.Position = [81 107 30 30];
app.SButton.Text = 'S';
% Create DButton
app.DButton = uibutton(app.UIFigure, 'push');
app.DButton.ButtonPushedFcn = createCallbackFcn(app, @DButtonPushed, true);
app.DButton.Position = [121 107 30 30];
app.DButton.Text = 'D';
% Create FButton
app.FButton = uibutton(app.UIFigure, 'push');
app.FButton.ButtonPushedFcn = createCallbackFcn(app, @FButtonPushed, true);
app.FButton.Position = [161 107 30 30];
app.FButton.Text = 'F';
% Create GButton
app.GButton = uibutton(app.UIFigure, 'push');
app.GButton.ButtonPushedFcn = createCallbackFcn(app, @GButtonPushed, true);
app.GButton.Position = [202 107 30 30];
app.GButton.Text = 'G';
% Create HButton
app.HButton = uibutton(app.UIFigure, 'push');
app.HButton.ButtonPushedFcn = createCallbackFcn(app, @HButtonPushed, true);
app.HButton.Position = [241 107 30 30];
app.HButton.Text = 'H';
% Create JButton
app.JButton = uibutton(app.UIFigure, 'push');
app.JButton.ButtonPushedFcn = createCallbackFcn(app, @JButtonPushed, true);
app.JButton.Position = [281 107 30 30];
app.JButton.Text = 'J';
% Create LButton
app.LButton = uibutton(app.UIFigure, 'push');
app.LButton.ButtonPushedFcn = createCallbackFcn(app, @LButtonPushed, true);
app.LButton.Position = [361 107 30 30];
app.LButton.Text = 'L';
% Create KButton
app.KButton = uibutton(app.UIFigure, 'push');
app.KButton.ButtonPushedFcn = createCallbackFcn(app, @KButtonPushed, true);
app.KButton.Position = [321 107 30 30];
app.KButton.Text = 'K';
% Create ZButton
app.ZButton = uibutton(app.UIFigure, 'push');
app.ZButton.ButtonPushedFcn = createCallbackFcn(app, @ZButtonPushed, true);
app.ZButton.Position = [81 57 30 30];
app.ZButton.Text = 'Z';
% Create XButton
app.XButton = uibutton(app.UIFigure, 'push');
app.XButton.ButtonPushedFcn = createCallbackFcn(app, @XButtonPushed, true);
app.XButton.Position = [121 57 30 30];
app.XButton.Text = 'X';
% Create CButton
app.CButton = uibutton(app.UIFigure, 'push');
app.CButton.ButtonPushedFcn = createCallbackFcn(app, @CButtonPushed, true);
app.CButton.Position = [161 57 30 30];
app.CButton.Text = 'C';
% Create VButton
app.VButton = uibutton(app.UIFigure, 'push');
app.VButton.ButtonPushedFcn = createCallbackFcn(app, @VButtonPushed, true);
app.VButton.Position = [201 57 30 30];
app.VButton.Text = 'V';
% Create BButton
app.BButton = uibutton(app.UIFigure, 'push');
app.BButton.ButtonPushedFcn = createCallbackFcn(app, @BButtonPushed, true);
app.BButton.Position = [242 57 30 30];
app.BButton.Text = 'B';
% Create NButton
app.NButton = uibutton(app.UIFigure, 'push');
app.NButton.ButtonPushedFcn = createCallbackFcn(app, @NButtonPushed, true);
app.NButton.Position = [281 57 30 30];
app.NButton.Text = 'N';
% Create MButton
app.MButton = uibutton(app.UIFigure, 'push');
app.MButton.ButtonPushedFcn = createCallbackFcn(app, @MButtonPushed, true);
app.MButton.Position = [321 57 30 30];
app.MButton.Text = 'M';
% Create Label
app.Label = uilabel(app.UIFigure);
app.Label.FontName = 'Georgia';
app.Label.FontSize = 15;
app.Label.Position = [108 292 25 22];
app.Label.Text = '_';
% Create Label_2
app.Label_2 = uilabel(app.UIFigure);
app.Label_2.FontName = 'Georgia';
app.Label_2.FontSize = 15;
app.Label_2.Position = [123 292 25 22];
app.Label_2.Text = '_';
% Create Label_3
app.Label_3 = uilabel(app.UIFigure);
app.Label_3.FontName = 'Georgia';
app.Label_3.FontSize = 15;
app.Label_3.Position = [139 292 25 22];
app.Label_3.Text = '_';
% Create Image
app.Image = uiimage(app.UIFigure);
app.Image.Position = [468 1 458 496];
app.Image.ImageSource = '1.png';
% Create Image2
app.Image2 = uiimage(app.UIFigure);
app.Image2.Position = [468 1 469 496];
app.Image2.ImageSource = '2.png';
% Create Image3
app.Image3 = uiimage(app.UIFigure);
app.Image3.Position = [468 1 429 496];
app.Image3.ImageSource = '3.png';
% Create Image4
app.Image4 = uiimage(app.UIFigure);
app.Image4.Position = [468 1 429 496];
app.Image4.ImageSource = '4.png';
% Create Image5
app.Image5 = uiimage(app.UIFigure);
app.Image5.Position = [468 1 429 496];
app.Image5.ImageSource = '5.png';
% Create Image6
app.Image6 = uiimage(app.UIFigure);
app.Image6.Position = [468 1 429 496];
app.Image6.ImageSource = '6.png';
% Create Label_4
app.Label_4 = uilabel(app.UIFigure);
app.Label_4.FontName = 'Georgia';
app.Label_4.FontSize = 15;
app.Label_4.Position = [155 292 25 22];
app.Label_4.Text = '_';
% Create Label_5
app.Label_5 = uilabel(app.UIFigure);
app.Label_5.FontName = 'Georgia';
app.Label_5.FontSize = 15;
app.Label_5.Position = [171 292 25 22];
app.Label_5.Text = '_';
% Create Label_6
app.Label_6 = uilabel(app.UIFigure);
app.Label_6.FontName = 'Georgia';
app.Label_6.FontSize = 15;
app.Label_6.Position = [187 292 25 22];
app.Label_6.Text = '_';
% Create Label_7
app.Label_7 = uilabel(app.UIFigure);
app.Label_7.FontName = 'Georgia';
app.Label_7.FontSize = 15;
app.Label_7.Position = [203 292 25 22];
app.Label_7.Text = '_';
% Create Label_8
app.Label_8 = uilabel(app.UIFigure);
app.Label_8.FontName = 'Georgia';
app.Label_8.FontSize = 15;
app.Label_8.Position = [219 292 25 22];
app.Label_8.Text = '_';
% Create Label_9
app.Label_9 = uilabel(app.UIFigure);
app.Label_9.FontName = 'Georgia';
app.Label_9.FontSize = 15;
app.Label_9.Position = [235 292 25 22];
app.Label_9.Text = '_';
% Create Label_10
app.Label_10 = uilabel(app.UIFigure);
app.Label_10.FontName = 'Georgia';
app.Label_10.FontSize = 15;
app.Label_10.Position = [251 292 25 22];
app.Label_10.Text = '_';
% Create Label_11
app.Label_11 = uilabel(app.UIFigure);
app.Label_11.FontName = 'Georgia';
app.Label_11.FontSize = 15;
app.Label_11.Position = [267 292 25 22];
app.Label_11.Text = '_';
% Create Label_12
app.Label_12 = uilabel(app.UIFigure);
app.Label_12.FontName = 'Georgia';
app.Label_12.FontSize = 15;
app.Label_12.Position = [283 292 25 22];
app.Label_12.Text = '_';
% Show the figure after all components are created
app.UIFigure.Visible = 'on';
end
end
% App creation and deletion
methods (Access = public)
% Construct app
function app = Hangman(varargin)
% Create UIFigure and components
createComponents(app)
% Register the app with App Designer
registerApp(app, app.UIFigure)
% Execute the startup function
runStartupFcn(app, @(app)startupFcn(app, varargin{:}))
if nargout == 0
clear app
end
end
% Code that executes before app deletion
function delete(app)
% Delete UIFigure when app is deleted
delete(app.UIFigure)
end
end
end
