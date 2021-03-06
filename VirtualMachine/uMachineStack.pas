unit uMachineStack;

// Ths source is distributed under Apache 2.0

// Copyright (C) 2019-2020 Herbert M Sauro

// Author Contact Information:
// email: hsauro@gmail.com

interface

Uses Classes, SysUtils, uListObject, uStringObject;

type
  TStackType = (stNone, stInteger, stDouble, stBoolean, stString, stList, stObject);
  TMachineStackRecord = record
     stackType : TStackType;  // 1 byte
     case TStackType of       // Max 8 bytes
       stInteger: (iValue : integer);
       stBoolean: (bValue : boolean);
       stDouble : (dValue : double);
       stString : (sValue : TStringObject);
       stList   : (lValue : TListObject);
     end;

  PMachineStackRecord = ^TMachineStackRecord;
  TMachineStack = array of TMachineStackRecord;

var memCount : integer;
    noneStackType : TMachineStackRecord;

    function stToStr (st : TStackType) : string;

implementation

function stToStr (st : TStackType) : string;
begin
  case st of
     stInteger: result := 'integer';
     stBoolean: result := 'boolean';
     stDouble : result := 'double';
     stString : result := 'string';
     stList   : result := 'list';
  end;

end;


initialization
  noneStackType.stackType := stNone;
end.

