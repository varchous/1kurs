uses crt,graphabc;
const line='|    �����    |  ������   |����|���|   ����   |';
   type pk = record
        Marka:string;
        Model:string;
        Cena:integer;
        ves:integer;

        cvet:string;
        end;
var f: file of pk;   y:char;    x,v:integer;

procedure Vvod (var ff: file of pk);
var i,n: integer; d: pk;
begin
  clrscr;
  x:=loadpicture('44824.jpg');
  drawpicture(x,1,1,800,600);
  reset(f);
  write('���������� �������: '); readln(n);
  writeln('������� ������:');
  for i:=1 to n do
    with d do
         begin
         write('�����: ');readln(Marka);
         write('������: ');readln(Model);
         write('����: ');readln(Cena);
         write('��� ');readln(ves);
         write('����: ');readln(cvet);
         write(ff,d);
         end;

  writeln('������ ��������. Enter ��� �����������...');
  readln;
end;

procedure Vyvod (ff: file of pk);
var d: pk;
begin
clrscr;
  x:=loadpicture('44824.jpg');
  drawpicture(x,1,1,800,600);
  reset(ff);
  writeln(line);
  while not eof(ff) do
      begin
      read(ff,d);
      with d do
           begin
           writeln('|',marka:13,'|',model:11,'|',cena:4,'|',ves:3,'|',cvet:10,'|');
           end;
      end;
      close (ff);
  writeln('������ ��������. Enter ��� �����������...');
  readln;
end;

procedure poisk(ff: file of pk);
var i: integer;
  d:pk;
  a:string;
begin
  clrscr;
  x:=loadpicture('44824.jpg');
  drawpicture(x,1,1,800,600);
  reset(f);
  writeln('������� �����');
  readln(a);
  writeln(line);
  while not eof(ff) do
  begin
    read(f,d);
    if d.marka = a then
    begin
      writeln('|',d.marka:13,'|',d.model:11,'|',d.cena:4,'|',d.ves:3,'|',d.cvet:10,'|');
    end;
  end;
  close(f);
  writeln('������ ��������. Enter ��� �����������...');
  readln;
end;
procedure redaktirovanie(ff:file of pk);
var d:pk;
n:integer;
begin
     clrscr;
     x:=loadpicture('44824.jpg');
     drawpicture(x,1,1,800,600);
     reset(f);
     writeln('������� ����� ������');
     readln(n);
     seek (f, n-1);
     write('�����: ');readln(d.Marka);
     write('������: ');readln(d.Model);
     write('����: ');readln(d.Cena);
     write('��� ');readln(d.ves);
     write('����: ');readln(d.cvet);
     write(ff,d);
     close(f);
       writeln('������ ��������. Enter ��� �����������...');
  readln;
end;
procedure Udalenie(var ff:file of pk);
var n,i:integer;
    d:pk;
begin
     clrscr;
     x:=loadpicture('44824.jpg');
     drawpicture(x,1,1,800,600);
     write('������� ����� ������  ');
     readln(n);
     Reset(f);
     if (filesize(f)<n)or(n<0) then
     begin
          writeln('� ����� ��� ����� ������');
          close(f);
          writeln('������ ��������. Enter ��� �����������...');
          readln;
          exit;
     end;
     seek(f,n-1);
     for i:=n-1 to filesize(f)-2 do
     begin
          seek(f,i+1);
          read(f,d);
          seek(f,i);
          write(f,d);
     end;
     seek(f,filesize(f)-1);
     truncate(f);
     close(f);
     writeln('������ ��������. Enter ��� �����������...');
     readln;
end;
procedure Menu;
begin
     clrscr;
     x:=loadpicture('44824.jpg');
     drawpicture(x,1,1,800,600);
     textout(300,25,'����');
     textout(100,100,'1-�����');
     textout(100,150,'2-�����');
     textout(100,200,'3-�����');
     textout(100,250,'4-��������������');
     textout(100,300,'5-������� ������');
     textout(100,350,'0-�����');
     SetwindowWidth(800);
     Setwindowheight(600);
end;
procedure Privetstvie;
begin

          x:=loadpicture('44824.jpg');
          drawpicture(x,1,1,800,600);
          SetwindowWidth(800);
          Setwindowheight(600);
          textout(300,50,'������ ������ ����?');
          textout(200,85,'��(������� Y)');
          textout(455,85,'���(������� N)');
          readln(y);

end;
begin

     Privetstvie;
     if y='n' then exit;
     Assign(f,'baza.txt');
     v:=1;
     repeat
     Menu;
     readln(v);
     case v of
     1: Vvod(f);
     2: Vyvod(f);
     3: poisk(f);
     4:redaktirovanie(f);
     5:Udalenie(f);
     end;
     until v=0;
end.
