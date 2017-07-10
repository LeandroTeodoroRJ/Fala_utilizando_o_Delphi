unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComObj, StdCtrls;
//É obrigatório inserir "ComObj" em uses.

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Vol: integer;
  voz: OLEVariant;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
    voz := CreateOLEObject ('SAPI.SpVoice');
    if (Edit1.Text<>'Insert the text in english for system speak') and (Edit1.Text <>'') then
    begin
      voz.Speak(Edit1.Text,0); //o sistema vai falar o texto digitado no Edit1
// SpVoice.Speak(Text As String,[Flags As SpeechVoiceSpeakFlags = SVSFDefault]) As Long
    
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Vol:=100;
Label2.Caption := IntToStr(vol);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
        if (Vol<101) then
        begin
        Vol:=Vol+1;
        voz.volume := Vol;
        Label2.Caption := IntToStr(vol);
        end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
        if (Vol>-1) then
        begin
        Vol:=Vol-1;
        voz.volume := Vol;
        Label2.Caption := IntToStr(vol);
        end;
end;

end.
