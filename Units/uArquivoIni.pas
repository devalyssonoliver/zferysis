unit uArquivoIni;

interface

uses
  IniFiles, System.SysUtils, Vcl.Forms;

procedure EscreverArquivoIni(const Servidor, Base, Porta: String);
procedure LerArquivoIni(out Servidor, Base, Porta: String);
function ArquivoIniExiste: Boolean;

var
  caminhoArquivo: String;

implementation

procedure InicializarCaminhoArquivo;
begin
  caminhoArquivo := IncludeTrailingPathDelimiter
    (ExtractFilePath(Application.ExeName)) + 'FerySis.ini';
end;

function ArquivoIniExiste: Boolean;
begin
  Result := FileExists(caminhoArquivo);
end;

procedure EscreverArquivoIni(const Servidor, Base, Porta: String);
var
  arquivoConfig: TIniFile;
begin
  arquivoConfig := TIniFile.Create(caminhoArquivo);
  try
    arquivoConfig.WriteString('DATABASE_CONFIG', 'SERVIDOR', Servidor);
    arquivoConfig.WriteString('DATABASE_CONFIG', 'BASE', Base);
    arquivoConfig.WriteString('DATABASE_CONFIG', 'PORTA', Porta);
  finally
    arquivoConfig.Free;
  end;
end;

procedure LerArquivoIni(out Servidor, Base, Porta: String);
var
  arquivoConfig: TIniFile;
begin
  if not ArquivoIniExiste then
    raise Exception.Create('Arquivo INI n�o encontrado: ' + caminhoArquivo);

  arquivoConfig := TIniFile.Create(caminhoArquivo);
  try
    Servidor := arquivoConfig.ReadString('DATABASE_CONFIG', 'SERVIDOR', '');
    Base := arquivoConfig.ReadString('DATABASE_CONFIG', 'BASE', '');
    Porta := arquivoConfig.ReadString('DATABASE_CONFIG', 'PORTA', '');
  finally
    arquivoConfig.Free;
  end;
end;

initialization

InicializarCaminhoArquivo;

end.
