program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAnalogIn;

type
  TExample = class
  private
    ipcon: TIPConnection;
    ai: TBrickletAnalogIn;
  public
    procedure ReachedCB(sender: TBrickletAnalogIn; const voltage: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = '7oj'; { Change to your UID }

var
  e: TExample;

{ Callback for voltage smaller than 5V }
procedure TExample.ReachedCB(sender: TBrickletAnalogIn; const voltage: word);
begin
  WriteLn(Format('Voltage dropped below 5V: %f', [voltage/1000.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  ai := TBrickletAnalogIn.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  ai.SetDebouncePeriod(10000);

  { Register threshold reached callback to procedure ReachedCB }
  ai.OnVoltageReached := {$ifdef FPC}@{$endif}ReachedCB;

  { Configure threshold for "smaller than 5V" (unit is mV) }
  ai.SetVoltageCallbackThreshold('<', 5*1000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
