unit uArquivoIni;

interface

uses IniFiles, System.SysUtils, Vcl.Forms, System.Hash;
procedure EscreverArquivoIni(const Servidor, Base, Porta: String);
procedure LerArquivoIni(out Servidor, Base, Porta: String);

implementation

procedure EscreverArquivoIni(const Servidor, Base, Porta: String);
var
  arquivoConfig: TIniFile;
  caminhoArquivo, userCript, passCript: String;
begin

  caminhoArquivo := IncludeTrailingPathDelimiter
    (ExtractFilePath(Application.ExeName)) + 'FerySis.ini';

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
  caminhoArquivo, userCript, passCript: String;
begin

  caminhoArquivo := IncludeTrailingPathDelimiter
    (ExtractFilePath(Application.ExeName)) + 'FerySis.ini';

  if not FileExists(caminhoArquivo) then
    raise Exception.Create
      ('Arquivo FerySis.ini n�o encontrado no diret�rio da aplica��o.');
  arquivoConfig := TIniFile.Create(caminhoArquivo);
  try
    Servidor := arquivoConfig.ReadString('DATABASE_CONFIG', 'SERVIDOR',
      Servidor);
    Base := arquivoConfig.ReadString('DATABASE_CONFIG', 'BASE', Base);
    Porta := arquivoConfig.ReadString('DATABASE_CONFIG', 'PORTA', Porta);

  finally
    arquivoConfig.Free;
  end;

end;

end.
