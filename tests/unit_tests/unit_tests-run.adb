with
  Ahven.Framework,
  Ahven.Text_Runner;

procedure Unit_Tests.Run is
   Suite : Ahven.Framework.Test_Suite := Tests.Suite;
begin
   Ahven.Text_Runner.Run (Suite);
end Unit_Tests.Run;
