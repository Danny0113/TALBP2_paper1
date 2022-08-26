unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, ComObj, MATH, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.GanttCh, VCLTee.TeeProcs, VCLTee.Chart;

type
  my_set = set of 1..255;

  array100 = array[1..100] of Integer;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    Button8: TButton;
    //DABC
    procedure Button1Click(Sender: TObject);
    procedure DABC_ReCT(); //CT������С����
    procedure DABC_ReCT1();
    procedure ReadDate();
    procedure DABC_CreateJIEpop(); //��ʼ������Ⱥ
    procedure RandomCreateJie();
    procedure maopao();
    procedure DABC_evaluate(var ind: integer);
    procedure DABC_TP_PMX();  //
    procedure DABC_PMX();    //ԭ����
    procedure DABC_OX();
    function RouletteWheelSelection(): integer;
    procedure DABC_VNS();
    procedure DABC20set(var scout_number: Integer); //�����õ�������Ͻ�
    procedure Button2Click(Sender: TObject);
    procedure DABC_decode(var ind: Integer);
    procedure DABC_evaluate_ini(var ind: Integer);
    procedure DABC_decode_up(var ind: Integer);
    procedure Lre_arr_back(var ind: Integer; pzhan: Integer);
    procedure Rre_arr_back(var ind: Integer; pzhan: Integer);
    procedure Lre_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure Rre_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure DABC_re_bestInd(var key: string);
    function choose_direction(var ind: integer; pzhan: Integer): integer;  //����  -1=���  1=�ұ�
    procedure Lre_arr_back_1(var ind: Integer; pzhan: Integer);
    procedure Rre_arr_back_1(var ind: Integer; pzhan: Integer);
    function choose_procedure(var ind: Integer; LA: my_set): Integer;
    procedure DABC_bad_MATRIX(var ind: Integer);
    procedure calculation_SI;
    function comp_SI(var ind: Integer): Double;
    procedure SCOUT_LS(var big_ind: Integer);
    //EDA
    procedure EDAModel_initial();
    procedure EDAPopModel_initial();
    procedure EDA_maopao();
    procedure EDA_decode(var ind: Integer); //������
    procedure EDA_decode2(var ind: Integer);//��������
    procedure EDAModel_update;
    procedure EDAModeL_sample(); //����EDA��������Ⱥ���� �����ʼ��Ⱥ���ơ�
    procedure EDA_jiema();
    procedure EDA_jiema_one(var ind: integer);
    procedure EDA_evaluate(var ind: Integer);
    procedure EDA_evaluate2(var ind: integer);
    procedure EDA_evaluate3(var ind: integer); //����
    procedure EDA_initial_matrix();
    procedure EDA_initial_matrix_2();
    procedure EDA_initial_matrix_3();
    procedure EDA_UPDATE_CT();
    procedure EDA_UPDATE_CT_1();
    procedure Button3Click(Sender: TObject);
    procedure EDA_decode_dir(var ind: integer);
    procedure maopao_samplepop();
    procedure EDA_Relationship_Matrix_initial();
    procedure EDA_Createpop_Intial();
    procedure EDAGetFirstCT();
    procedure EDA_UPdate_Relationship_Matrix();
    procedure EDA_sample();
    procedure EDA_Rand_replace();
    procedure EDA_Set_replace;
    procedure EDA1_sample();   //�ؼ�������֤
    procedure EDA_LS1(); //WUWU        //  LS  �и�����ʷ����  ��CT
    procedure EDA_LS2(); //WUWU        //  LS  �и�����ʷ����  ��CT
    procedure EDA_LS3();
    procedure EDA1_LS1(var ind: Integer); //�ؼ�������֤
    procedure EDA1_LS2(var ind: Integer);
    procedure EDA_Reconstruction_strategy(); //EDA���ع�����
    procedure EDA_CHOOSE_L_P(var ind: Integer; pzhan: Integer);
    procedure EDA_CHOOSE_R_P(var ind: Integer; pzhan: Integer);
    procedure EDA_Refre_Lstation(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure EDA_Refre_Rstation(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure EDA_OX();
    procedure EDA_update_M();
    procedure EDA_update();
   //BAS
    procedure BAS_sample();
    procedure bas_decode(var ind: Integer; DEV: INTEGER);
    procedure BAS_evaluate(var ind: integer);
    procedure BAS_RefreashMartrix(var ind: Integer);
    function BAS_L(var ind: Integer; pzhan: Integer; TIME_D: Integer): Integer;
    function BAS_R(var ind: Integer; pzhan: Integer; TIME_D: Integer): Integer;
    procedure CLEAR();
    procedure BAS_L_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure BAS_R_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure RE_MATRIXandJie(var ind: Integer; p: Integer);
    function BAS_choose_direction(var ind: Integer; pzhan: Integer): integer;  //����  -1=���  1=�ұ�
    procedure bad_MATRIX();
    procedure BAS_swap(var ind: Integer);
    procedure Deviation_decode(var ind: Integer; dev: Integer);
    procedure Button6Click(Sender: TObject);

    //�Ա�IG
    procedure mNEH();
    procedure IG_INI_maopao();
    procedure IG_LocalSearch();    //��op���ֲ�����
    procedure IG_evaluate(var ind: integer);
    procedure Panel1Click(Sender: TObject);
    procedure Restructure(ind: Integer);  //�ع�����
    procedure Restructure_decode(var ind: Integer);   //�ع�վ�Ľ���
    procedure Restructure_evaluate(var ind: Integer);              //�ع�վ������
    procedure Reconstruction_process_L(var ind: Integer; pzhan: Integer; TIME_D: Integer);
    procedure Reconstruction_process_R(var ind: Integer; pzhan: Integer; TIME_D: Integer);
    procedure Refactoring_information_update_L(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure Refactoring_information_update_R(var ind: Integer; a: Integer; Pzhan: Integer);
    procedure Restructure_calculation_new_SI(var ind: Integer);
    procedure SaveParameter_experiment_results(var p: Integer);  //�������ʵ����

    //�Ա��㷨GA
    procedure Crossover(var ind: integer); //����
    procedure mutation(var ind: integer);
    procedure Button7Click(Sender: TObject);  //����
    procedure GA_LS();

    procedure savebestdate();
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

var
  ExcelApp: Variant;

implementation
{$R *.dfm}
//DABC

type
  structure_gongxu = record         //�������Խṹ��
    xu: integer;
    zhuangtai: integer;
    fangxiang: integer;
    shijian: integer;
    houxu: array[1..50] of integer; //Ĭ��ֱ�Ӻ���������50
    qianxu: array[1..50] of integer; //ֱ�Ӻ���
    wp: double;
    aset: set of 1..255;
    bset: set of 1..255;      //����ǰ�򣬺��򣬽��ڣ�ָ��
    anearset: set of 1..250;
    bnearset: set of 1..250;
    anum: Integer;
    bnum: Integer;
    aNearnum: Integer;
    bNearnum: Integer;
    earlytime: Integer;
    totalTime: Integer;
    PL: Double;  //IG  ����ļ���ֵ
  end;
type
  structure_jiepop = record           //��Ⱥ�ṹ��
    CTp: integer;
    IG_indexCT: Integer;
    LSI: Double;
    gongxu: array[1..250] of structure_gongxu; //��ʱĬ�Ϲ��򲻳���100
    DABC_L2:Double;
    Acc_t:Integer;
  end;
var
  jiepop: array[1..400] of structure_jiepop;   //��Ⱥ��ģһ��  101��Ŷ�ȡ��˳��������
  copyjie: structure_jiepop;
  oldjiepop: array[1..400] of structure_jiepop;
  oldjie: structure_jiepop;
  deepjie: structure_jiepop;
  Copyjiepop: array[1..400] of structure_jiepop;
  Scoutjiepop: array[1..400] of structure_jiepop; //������
  copyoldjiepop: array[1..400] of structure_jiepop;
  Sample_jiepop: array[1..400] of structure_jiepop;
  bestjie: structure_jiepop;
  oldbestjie: structure_jiepop;
  LSjie: structure_jiepop;
  ls1jie: structure_jiepop;
  OperationJie: structure_jiepop;
  OperationJie_best: structure_jiepop;
  OperationJie_copy: structure_jiepop;
  BEST_LSI_jiepop: structure_jiepop;
  best_refactor: structure_jiepop; //��������ع�
  Backup_process: structure_jiepop;  //����ȥ��ǰ����ع�վ�ڹ���

type
  structure_zhandian = record
    zuoxulie: array[1..200] of integer;
    youxulie: array[1..200] of integer;
    zuoshijian: integer;
    youshijian: integer;
  end;

type
  struture_keixing_zuobianyoubianzhan = record
    zongshijian: integer;
    kexingGongxu: array[1..200] of integer;     //Ĭ��һ��վ���100������
    ZhanCTp: Integer;
    gxEndTime: array[1..200] of Integer;
    gxset: set of 1..255;
    lastx: Integer;  //���һ������
  end;

type
  struture_station = record
    FreeTime: Integer;
    OverTime: Integer;
  end;

type
  structure_kexingjiePOP = record
    zuoBianzhan: array[1..20] of struture_keixing_zuobianyoubianzhan;        //Ĭ�������100�����վ
    youBianzhan: array[1..20] of struture_keixing_zuobianyoubianzhan;
    Station: array[1..100] of struture_station;
    CTp: integer;  //�ý��CTp   //�����ۺ�������
    PCTp: Double;  //����
  end;

type
  structure_gongxu_set = record
    aset: set of 1..250;
    bset: set of 1..250;
    anearset: set of 1..250;
    bnearset: set of 1..250;
  end;

var
  EdaFeasibleSolution: array[1..200] of structure_jiepop;
  bestEdaFeasibleSolution: structure_jiepop;
  vns_bestEdaFeasibleSolution: structure_jiepop;
  vns_Solution: structure_jiepop;
  copyEdaFeasibleSolution: array[1..300] of structure_jiepop;
  Local_Matrix: array[0..250] of array[0..250] of double; //0&1   0&��0
  copy_Matrix: array[0..250] of array[0..250] of double; //0&1   0&��0
  stop_Matrix: array[1..250] of array[1..3] of Integer;  //��ĩ��λ�þ���
  copy_stop_Matrix: array[1..250] of array[1..3] of Integer;
  TwoMatrix: array[0..250] of array[0..250] of double; //����Ϊʵ��  0��Ϊ��������
  init_TwoMatrix: array[0..250] of array[0..250] of double; //����Ϊʵ��  0��Ϊ��������
  gongxuset: array[1..250] of structure_gongxu_set;
  zhan: struture_keixing_zuobianyoubianzhan;  //���¼�����
  BCT: Integer;
  gx_L, gx_R: Integer; // ��¼վ�Ϲ���ĵ����
  code_set: set of 1..255;
  DABC_SI: Double;
  EDA_SI: Double;
  DABC_CT: Integer;
  EDA_CT: Integer;
  bestCTp:Integer;
  Acc_idle_time:Integer;
  Quick_evaluation:Integer;
  deep1,deep2:integer;
  set3:integer; //���ɼ��ϵĴ�С
  line_sb,crow_sb:integer;
var
  zhandian: array[1..100] of structure_zhandian;
  n_guimo: integer;             //���ݹ�ģ
  nm: array100; //���վ������
  rand_jie: array[1..250] of structure_gongxu; //������ɽ� //ֻ�ܱ�ʾһ����
  Temporary_storage: structure_gongxu;  //�ݴ�һ������ �����滻��
  gongxu: structure_gongxu;  //�ݴ�һ������ �����滻��
  CT: Double;            //�����Ǹ�С��
  CM: array[1..100] of Integer;
  indexD: integer;        //����������
  iterationMax: Integer;
  IndexA: double;         //��ֵCM��ϵ�� //��ʼ��CT��һ��
  kexingjiepop: array[1..400] of structure_kexingjiePOP;    //Ĭ�Ͽ��н�Ⱥ�����102���ռ�
  copykxjie: structure_kexingjiePOP;
  oldkexingjiepop: array[1..400] of structure_kexingjiePOP;    //Ĭ�Ͽ��н�Ⱥ�����102���ռ�
  oldkxjie: structure_kexingjiePOP;
  copyoldkexingjiepop: array[1..400] of structure_kexingjiePOP;
  Sample_kexingjiepop: array[1..400] of structure_kexingjiePOP;
  vns_kexingjiepop: structure_kexingjiePOP;
  BestKexingjie: structure_kexingjiePOP;
  oldBestKexingjie: structure_kexingjiePOP;
  CurrentKexingjie: structure_kexingjiePOP;
  OperationKexingjie: structure_kexingjiePOP;
  BestOperationKexingjie: structure_kexingjiePOP;
  LSKexingjie: structure_kexingjiePOP;
  ls1kxjie:structure_kexingjiePOP;
  vns_bestkexingjie: structure_kexingjiePOP;
  Copykexingjiepop: array[1..400] of structure_kexingjiePOP; //�ֲ���֮ǰ����һ�ݱ��棬�����бȽ��õ�
  scoutkexingjiepop: array[1..400] of structure_kexingjiePOP;
  BEST_LSI_kexingjiepop: structure_kexingjiePOP;
  iteration: integer;
  erro_x: integer;   //����ʧ�ܱ�־  1��������
  popsize: integer;  //��Ⱥ��С��������
  yita: double;      //��Ӣ��ռ�ȡ�������
  aerfa: double;     //ѧϰ�ʡ�������
  indexBack: Integer;
  LCANT: Integer;
  RCANT: Integer;
  zhannumber: Integer;
  BestCT: Double;
  bestind: integer;
  CMean: array[1..20] of double;
  X: Integer;  //����ĺ���
  BadMatrix: array[0..250] of array[0..250] of Integer;
  Badset: set of 1..255;
  EDA_Relashion_Matrix: array[0..250] of array[0..250] of double;
  SI: Double;
  oldSI: Double;
  t1, t2: Double;
  CTp: Integer;
  BEST_LSI: Double;
  Number_operations: Integer; //�ع�վ�ڹ������
  Refactoring_error: Integer;  //�ع������־
  subscript: Integer;  //ѡ����ع�վ
  insert_times: Integer;  //����ʷ���Ÿ�����insert����
  rtime: Integer;
  Total_process_time:Integer; //�ܹ���ʱ��
  Total_idle_time_ind:integer;
  Quick_evaluation_ind:integer;
  Acc_idle_time_ind:integer;
function get_iterationmax(): Integer;
var
  a, b, c: integer;
begin
  case n_guimo of
    9:
      Result := 500;
    12:
      Result := 500;
    16:
      Result := 500;
    65:
      Result := 500;
    148:
      Result := 500;
    205:
      Result := 1000;
  end;
end;
//վ���ع�����
//��ȡ���õ�LSI

procedure TForm1.Restructure(ind: Integer);
var
  a, b, c, d: Integer;
  Light, Right: array[1..20] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
  Partial_sorting: array[1..200] of Integer;  //��ȡ��վ�ڲ�������  �Դ˽����ع�
  Difference: Integer;  //վ�����ƫ��
  first_part_ocess: array[1..300] of Integer; //ѡ��վ��֮ǰ�Ĺ���
  Partial_sorting_SET: set of 1..255;  //վ�ڹ��򼯺�
  Original_sort: array[1..300] of Integer;
  rand_pointA, rand_pointB: Integer;  //���ȡ��������
  indcopy: Integer;
begin
  jiepop[198] := jiepop[197]; // ���
  //�������վ��SI����ֵ
  for a := 1 to zhannumber do //����ÿ��վ��ʵ�ʹ���ʱ��
  begin                       //���Ҽ�¼�������ʵ�ʹ���ʱ��
    Light[a] := 0;
    Right[a] := 0;
    b := 1;   //���
    Light_max := jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b]].shijian;
    repeat
      if jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b]].shijian > Light_max then
      begin
        Light_max := jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b]].shijian;
      end;
      Light[a] := Light[a] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b] = 0;
    b := 1;   //�ұ�
    Right_max := jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[a].kexingGongxu[b]].shijian;
    repeat
      if jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[a].kexingGongxu[b]].shijian > Right_max then
      begin
        Right_max := jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[a].kexingGongxu[b]].shijian;
      end;
      Right[a] := Right[a] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[a].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].youBianzhan[a].kexingGongxu[b] = 0;
  end;
  Difference := Abs(Light[1] - Right[1]);  //��ȡ�׸�վ�Ĳ�ֵ
  subscript := 1;
  for a := 1 to zhannumber do
  begin
    if Difference < Abs(Light[a] - Right[a]) then
    begin
      Difference := Abs(Light[a] - Right[a]);  //�õ�����ֵ
      subscript := a;     //�õ����վ���±�
    end;
  end;

  //�Բ�ֵ����վ���ع�
  //�ݲ�����ԭ��������������  �����Ͽ��ǿ��ܸ���   ���ǲ���ʵ��
  for a := 1 to 200 do
  begin
    Partial_sorting[a] := 0;
    Original_sort[a] := 0;
  end;
  a := 1;
  b := 1;
  c := 1;
  repeat
    if (kexingjiepop[ind].zuoBianzhan[subscript].kexingGongxu[a] <> 0) then
    begin
      Partial_sorting[c] := kexingjiepop[ind].zuoBianzhan[subscript].kexingGongxu[a]; //�������(���)
      a := a + 1;
      c := c + 1;
    end;
    if (kexingjiepop[ind].youBianzhan[subscript].kexingGongxu[b] <> 0) then
    begin
      Partial_sorting[c] := kexingjiepop[ind].youBianzhan[subscript].kexingGongxu[b]; //�������(�ұ�)
      b := b + 1;
      c := c + 1;
    end;
  until (kexingjiepop[ind].zuoBianzhan[subscript].kexingGongxu[a] = 0) and (kexingjiepop[ind].youBianzhan[subscript].kexingGongxu[b] = 0);
  //վ�ڹ�����뼯�� ���ڵõ�ԭ����
  Partial_sorting_SET := [];
  a := 1;
  repeat
    if Partial_sorting[a] <> 0 then
    begin
      Partial_sorting_SET := Partial_sorting_SET + [Partial_sorting[a]];
    end;
    a := a + 1;
  until Partial_sorting[a] = 0;

  b := 1;
  for a := 1 to n_guimo do
  begin
    if jiepop[ind].gongxu[a].xu in Partial_sorting_SET then
    begin
      Original_sort[b] := jiepop[ind].gongxu[a].xu;
      b := b + 1;
    end;
  end;
  //�����վ֮ǰ�����й���
  //����Щ����״̬�ڸ���198����Ѿ�����  ����ѡ��վ�Ĺ������޳�ǰ��
  for a := 1 to 200 do
  begin
    first_part_ocess[a] := 0;
  end;
  //��ʼ�ۼ�
  c := 1;  //�ۼƹ����±�
  for a := 1 to subscript - 1 do
  begin
    b := 1;  //վ�ڹ����±�
    d := 1;
    repeat
      if (kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b] <> 0) then
      begin
        first_part_ocess[c] := kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b]; //�������(���)
        b := b + 1;
        c := c + 1;
      end;
      if (kexingjiepop[ind].youBianzhan[a].kexingGongxu[d] <> 0) then
      begin
        first_part_ocess[c] := kexingjiepop[ind].youBianzhan[a].kexingGongxu[d]; //�������(�ұ�)
        d := d + 1;
        c := c + 1;
      end;
    until (kexingjiepop[ind].zuoBianzhan[a].kexingGongxu[b] = 0) and (kexingjiepop[ind].youBianzhan[a].kexingGongxu[d] = 0);
  end;
  //����ѡ��վ�Ĺ������
  a := 1;
  repeat
    if Partial_sorting[a] <> 0 then
    begin
      a := a + 1;
    end;
  until Partial_sorting[a] = 0;
  Number_operations := a - 1;
  if Number_operations > 2 then //���������Ŀ����2  �����ع�������
  begin
    //�����������������
    a := 1;
    repeat
      jiepop[198].gongxu[a] := jiepop[199].gongxu[Original_sort[a]]; //�������򣬲���������
      a := a + 1;
    until Original_sort[a] = 0;
    indcopy := ind;  //�ݴ�
    //����Щ�������ʴ���
    ind := 198;
    for b := 1 to Number_operations do              //���ں����ǰ�򼯺����޳���ǰ��
    begin
      a := 1;
      repeat
        if first_part_ocess[a] in jiepop[ind].gongxu[b].aset then
        begin
          jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [first_part_ocess[a]];
        end;
        a := a + 1;
      until first_part_ocess[a] = 0;
    end;
    Backup_process := jiepop[198]; //���� ���ڻ�ԭ����

    Restructure_decode(ind);  //
    Restructure_evaluate(ind);  //����SI
    best_refactor := jiepop[198]; //��������ع�
    for a := 1 to 100 do  //�ع�ʮ��  ȡ��÷���
    begin
      rand_pointA := 1;
      rand_pointB := 1;
      while (rand_pointA = rand_pointB) do   //���ȡ��ͬ��������
      begin
        rand_pointA := RandomRange(1, Number_operations + 1);
        rand_pointB := RandomRange(1, Number_operations + 1);
      end;
      Temporary_storage := jiepop[ind].gongxu[rand_pointA];
      jiepop[ind].gongxu[rand_pointA] := jiepop[ind].gongxu[rand_pointB];
      jiepop[ind].gongxu[rand_pointB] := Temporary_storage;

      Restructure_decode(ind);  //�������������  ���������ǰm-1������
      if Refactoring_error = 1 then    //�ع�����
      begin
        jiepop[198] := best_refactor; //��ԭ
      end
      else if Refactoring_error = 0 then  //�ع�����CT  �ɹ�һ��
      begin
        Restructure_evaluate(ind);  //����SI ��ȡ���
        if jiepop[ind].LSI < best_refactor.LSI then
        begin
          best_refactor := jiepop[ind];  //���ºõ�SI����
          ind := indcopy;
          kexingjiepop[ind].zuoBianzhan[subscript] := Kexingjiepop[198].zuoBianzhan[1];
          kexingjiepop[ind].youBianzhan[subscript] := Kexingjiepop[198].youBianzhan[1];
          //�����µ�SIֵ
          DABC_evaluate(ind); //
          if jiepop[ind].LSI < oldjiepop[ind].LSI then
          begin
            c := 1;
          end;
       //   Restructure_calculation_new_SI(ind);


        end;
      end;
    end;
  end;
end;
//�����ع������SI CT

procedure TForm1.Restructure_calculation_new_SI(var ind: Integer);
var
  b: Integer;
  MaxT: Integer; //�����ߵ����CTpʱ��
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..20] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  MaxT := 0;
  for A := 1 to zhannumber do  // ����ÿ��վ���깤ʱ��CTp
  begin
    if A <> subscript then
    begin
      if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
      else
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
    end
    else if A = subscript then
    begin
      if (kexingjiepop[198].zuobianzhan[1].zongshijian >= kexingjiepop[198].youbianzhan[1].zongshijian) then
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
      else
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
    end;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //�������վ�깤ʱ��
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  kexingjiepop[ind].CTp := MaxT;   //�õ�һ������վ����CTp
  jiepop[ind].CTp := kexingjiepop[ind].CTp;
  //*********
  if (iteration > 0) and (kexingjiepop[ind].CTp = oldkexingjiepop[ind].CTp) then
  begin
    compare1 := 0;
    compare2 := 0;
    for b := 1 to zhannumber do//Ȩ�ؽ��ԽСԽ��
    begin                       //��վ�Ľ��Ĵ�ŵ����վ����ģ�ֱ�Ӹ������
      compare1 := compare1 + (zhannumber - b) * (max(0, kexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (Bct + CT) / 2) + max(0, BCT - (CT - BCT) / 2 - kexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
      compare2 := compare2 + (zhannumber - b) * (max(0, oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (BCT + CT) / 2) + max(0, BCT - (CT - BCT) / 2 - oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
    end;
    if compare2 < compare1 then  //ԭ���Ľ�����򣬻���ȥ
    begin
      jiepop[ind] := oldjiepop[ind];
      kexingjiepop[ind] := oldkexingjiepop[ind];
    end
    else   //�½����  ����old
    begin
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
    end;
  end
  else if (iteration > 0) and (oldkexingjiepop[ind].CTp < kexingjiepop[ind].CTp) then  //����ȥ
  begin
    jiepop[ind] := oldjiepop[ind];
    kexingjiepop[ind] := oldkexingjiepop[ind];
  end
  else   //�½����  ����old
  begin
    oldjiepop[ind] := jiepop[ind];
    oldkexingjiepop[ind] := kexingjiepop[ind];
  end;
  //����վ��ʵ�ʹ���ʱ����ΪĿ����ƽ�� //����ƽ��ָ��SI
  for A := 1 to zhannumber do //����ÿ��վ��ʵ�ʹ���ʱ��
  begin
    if A <> subscript then
    begin
      Light[A] := 0;
      Right[A] := 0;
      b := 1;   //���
      repeat
        Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Light[A] > Light_max) then
      begin
        Light_max := Light[A];
      end;
      b := 1;   //�ұ�
      Right_max := jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
      repeat
        Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Right[A] > Right_max) then
      begin
        Right_max := Right[A];
      end
    end
    else if A = subscript then
    begin
      Light[A] := 0;
      Right[A] := 0;
      b := 1;   //���
      repeat
        Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[198].zuoBianzhan[1].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[198].zuoBianzhan[1].kexingGongxu[b] = 0;
      if (A = 1) or (Light[A] > Light_max) then
      begin
        Light_max := Light[A];
      end;
      b := 1;   //�ұ�
      repeat
        Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[198].youBianzhan[1].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[198].youBianzhan[1].kexingGongxu[b] = 0;
      if (A = 1) or (Right[A] > Right_max) then
      begin
        Right_max := Right[A];
      end
    end;
  end;

  MAX_T := Max(Light_max, Right_max);    // bug
  LSI := 0;
  for A := 1 to zhannumber do
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;

  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;
  if jiepop[ind].LSI < oldjiepop[ind].LSI then
  begin
    oldjiepop[ind] := jiepop[ind];
    oldkexingjiepop[ind].zuoBianzhan[subscript] := kexingjiepop[198].zuoBianzhan[1];
    oldkexingjiepop[ind].youBianzhan[subscript] := kexingjiepop[198].youBianzhan[1];
  end;
  //����SI ����
end;

procedure TForm1.SCOUT_LS(var big_ind: Integer);
var
  flag1, flag2: array[1..200] of integer;
  a: Integer;
  s1, s2: Integer;  //ѡ����
  p1, p2, mid: Integer;  //ѡ����λ��
  set1: set of 1..255;
  lab2: integer;
begin
  s1 := 1;
  s2 := 1;
  while s1 = s2 do
  begin
    s1 := big_ind;
    s2 := RandomRange(1, popsize + 1);
  end;
  p1 := 1;
  p2 := 1;
  while p1 = p2 do             //ѡ����λ��
  begin
    p1 := RandomRange(1, n_guimo);
    p2 := RandomRange(1, n_guimo);
  end;
  if p1 > p2 then  //����s1<s2
  begin
    mid := p1;
    p1 := p2;
    p2 := mid;
  end;
  set1 := [];
  for a := p1 to p2 do  //������1�Ĳ���Ƭ��  ���뼯�� ��������2���ж�
  begin
    set1 := set1 + [jiepop[s1].gongxu[a].xu];
  end;
  lab2 := 0;  //��2�ı����±�
  for a := 1 to (p1 - 1) do     //�Ӹ�2��ѡ�������1ǰ��
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  for a := p2 + 1 to n_guimo do     //�Ӹ�2��ѡ�������1ǰ��
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  DABC_decode(s1);
  DABC_evaluate(s1);
  if jiepop[s1].CTp <= CT then
  begin
    CT := jiepop[s1].CTp - 1;
  end;
end;
//DABC�㷨

procedure TForm1.Button1Click(Sender: TObject);
var
  a, d, c, pop: integer;
  B: integer;                    //CM[B] ѭ����ȡCM
  select: Integer;
  Lorder, Rorder: string;
  small_ind: Integer;  //�����ĸ�����Ŀ
  big_ind: Integer;
  minT, maxT: Integer;
  CopyCT: Integer;
  yuanshixu: string;
  ind: Integer;
  b_num: Integer;
  num: Integer;
  key: string;
  crow, times, line: Integer;
  COCT: Double;
  code_set: set of 1..255;
  scout_number: Integer;
label
  2, 3;
begin
  rtime := 0;
  ExcelApp := CreateOleObject('Excel.Application');  //����Excel
  ExcelApp.WorkBooks.Open('D:\SAVE_Verification_of_key_links.xls');
  ExcelApp.WorkSheets[1].Activate;
  ExcelApp.Visible := True;
  crow := 1;
 // for times := 1 to 10 do
  begin
    line := 1;
    b_num := 2;  //����վ���Լ�
  //  repeat
      ReadDate();
      IndexA := 1.5;
      small_ind := 1;  //����������Ŀ��������
      big_ind := 0;
      d := 0;
      minT := 0;  //�������������ĸ���
      maxT := 0;
      popsize := 160;  //����������Ⱥ��ģ��
      scout_number := 150;
      //����վ�����ݺ��ʼ��
      code_set := [];
      t1 := GetTickCount;  //��ʼʱ��
      zhanNumber := nm[b_num];
      BCT := CM[b_num];
      CT := 1.2 * BCT;
      iteration := 0;        //��ʼ��������Ϊ0
      DABC_CreateJIEpop();      //����ʽ�������ɳ�ʼ��
      for ind := 1 to popsize do //��������
      begin
        DABC_decode(ind);
        DABC_evaluate_ini(ind);   //����ѡ���ֱ������
        oldjiepop[ind] := jiepop[ind]; //ѡ�������õ�
        oldkexingjiepop[ind] := kexingjiepop[ind];
        if ind=1 then
        begin
          bestCTp:=jiepop[1].CTp;
          bestind := ind;
          DABC_SI := jiepop[bestind].LSI;
          DABC_CT := jiepop[bestind].CTp;
        end;
        if jiepop[ind].CTp < bestCTp then
        begin
          bestCTp:=jiepop[ind].CTp;
          bestind := ind;
          DABC_SI := jiepop[bestind].LSI;
          DABC_CT := jiepop[bestind].CTp;
        end;
      end;
      CT:= bestCTp-1;
      //��ʼ��Ⱥ����
      repeat
        iteration := iteration + 1;
        for ind := 1 to (popsize div 2) do //����Ӷ��׶Ρ�
        begin
          DABC_OX();
        end;
        for ind := 1 to popsize do //���Թ۷�׶Ρ�
        begin
          DABC_VNS();
        end;
        begin//������׶Ρ�         1.����ظ��ĸ���  2.û���ظ���������ĸ���
          DABC20Set(scout_number);     //�������
          for ind := 1 to scout_number do  //���ݿռ� ����ȷ��������20��
          begin
            Copyjiepop[ind] := jiepop[ind];
            Copykexingjiepop[ind] := kexingjiepop[ind];
            copyoldjiepop[ind] := oldjiepop[ind];
            copyoldkexingjiepop[ind] := oldkexingjiepop[ind];
          end;
          for ind := 1 to scout_number do
          begin
            jiepop[ind] := Scoutjiepop[ind];
          end;
          iteration := 0;  //����ѡ���ֱ������
          CT:=bestCTp; //����ý���ȡ����
          for ind := 1 to scout_number do   //����20�������
          begin
            DABC_decode(ind);
            DABC_evaluate(ind);
          end;
          CT:=bestCTp-1;
          minT := jiepop[1].CTp;
          small_ind := 1;
          for d := 1 to scout_number do
          begin
            if jiepop[d].CTp < minT then
            begin
              minT := jiepop[d].CTp;
              small_ind := d;
            end
          end;                   //�ҵ���������õĸ���
          Scoutjiepop[1] := jiepop[small_ind];
          scoutkexingjiepop[1] := kexingjiepop[small_ind];
          for a := 1 to scout_number do  //��ԭ�ռ�
          begin
            jiepop[a] := copyjiepop[a];
            kexingjiepop[a] := Copykexingjiepop[a];
            oldjiepop[a] := copyoldjiepop[a];
            oldkexingjiepop[a] := copyoldkexingjiepop[a];
          end;
          begin     //�ҵ��ظ���һ��  [��Ч]
            for a := 1 to popsize do //����ߵĶԱ� //�൱��һ��ð���㷨  ���ǲ���Ҫ����
            begin
              for B := a + 1 to popsize do
              begin
                for c := 1 to n_guimo do
                begin
                  if jiepop[a].gongxu[c].xu <> jiepop[B].gongxu[c].xu then
                    goto 2;
                end;
                if c = n_guimo + 1 then  //˵��ȫ���������  �ظ���
                begin
                  code_set := code_set + [a];
                  jiepop[a] := Scoutjiepop[1];
                  oldjiepop[a] := Scoutjiepop[1];
                  kexingjiepop[a] := scoutkexingjiepop[1];  //���滻���塿
                  oldkexingjiepop[a] := scoutkexingjiepop[1];
                  big_ind := a;
                  goto 3;
                end;
                2: //�������ظ�ֱ������
              end;
            end;
            begin     //���û���ظ�����������Ⱥ��������
              maxT := jiepop[1].CTp;
              big_ind := 1;
              for d := 1 to popsize do
              begin
                if jiepop[d].CTp > maxT then
                begin
                  maxT := jiepop[d].CTp;
                  big_ind := d;
                end
              end;    //jiepop[index2] ����Ⱥ�����ĸ���
              code_set := code_set + [big_ind];
              jiepop[big_ind] := Scoutjiepop[1];
              oldjiepop[big_ind] := Scoutjiepop[1];
              kexingjiepop[big_ind] := scoutkexingjiepop[1];  //���滻���塿
              oldkexingjiepop[big_ind] := scoutkexingjiepop[1];
            end;
            3: //���ظ�����ֱ������
          end;
        end;
        memo1.lines.add(inttostr(bestCTp));
        t2 := GetTickCount; //���ʱ��
      until (t2 - t1) > (n_guimo * n_guimo * 15);  //�ﵽ����������
     { Lorder:='';
      Rorder:='';
      for a := 1 to zhannumber do
      begin
        c:=0;
        num:=0;
        repeat
          num:=num+1;
          c:=c+1;
        until (kexingjiepop[bestind].zuoBianzhan[a].kexingGongxu[c]=0)and(kexingjiepop[bestind].youBianzhan[a].kexingGongxu[c]=0) ;
        if kexingjiepop[bestind].zuoBianzhan[a].kexingGongxu[1]<>0 then
        begin
          C:=1;
          repeat
              Lorder:=Lorder+inttostr(kexingjiepop[bestind].zuoBianzhan[a].kexingGongxu[c])+', ';
              c:=c+1;
          until c=num;
        end
        else
        begin
          Lorder:=Lorder+'  ��  ';
        end;
        Lorder:=Lorder+'  |  ';
        if kexingjiepop[bestind].youBianzhan[a].kexingGongxu[1]<>0 then
        begin
          c:=1;
          repeat
            Rorder:=Rorder+inttostr(kexingjiepop[bestind].youBianzhan[a].kexingGongxu[c])+', ';
            c:=c+1;
          until c=num;
        end
        else
        begin
          Rorder:=Rorder+'  ��  ';
        end;
        Rorder:=Rorder+'  |  ';
      end;
      //���ԭʼ�����
      yuanshixu:='';
      for a := 1 to n_guimo do
      begin
        yuanshixu:=yuanshixu+inttostr(jiepop[bestind].gongxu[a].xu)+',';
      end;
      Memo1.Lines.Add('ʵ�ʵ�������'+inttostr(iteration));
      Memo1.Lines.Add('�����ģ��'+inttostr(n_guimo));
      Memo1.Lines.Add('��λ��ģ��'+inttostr(Nm[B_num]));
      Memo1.Lines.Add('���Ž��ģ�'+FloatToStr(bestCT));
      Memo1.Lines.Add('���վ������'+Lorder);
      Memo1.Lines.Add('�ұ�վ������'+Rorder);
      Memo1.Lines.Add('ԭʼ��'+yuanshixu);
      Memo1.Lines.Add('best_CT_LSI��'+FloatToStr(JIEPOP[bestind].LSI));
      Memo1.Lines.Add('best_LSI��'+FloatToStr(BEST_LSI));
      Memo1.Lines.Add('              ');    }
      Memo1.Lines.Add('decode��'+IntToStr(rtime));
      rtime := 0;
      ExcelApp.Cells[line, crow].Value := IntToStr(DABC_CT);
      ExcelApp.Cells[line, crow + 1].Value := FloatToStr(DABC_SI);
      line := line + 1;
      b_num := b_num + 1;  //��վ�������Լ�����  //����һ��
      FillChar(jiepop, SizeOf(jiepop), 0);
      FillChar(oldjiepop, SizeOf(oldjiepop), 0);
      FillChar(copyjiepop, SizeOf(jiepop), 0);
      FillChar(oldkexingjiepop, SizeOf(oldkexingjiepop), 0);
      FillChar(Copykexingjiepop, SizeOf(kexingjiepop), 0);
 //   until (Nm[b_num] = 0);
    crow := crow + 2;
    CLEAR();
  end;
  ExcelApp.Activeteworkbook.save;
end;

procedure TForm1.CLEAR();
var
  a: Integer;
begin
  FillChar(jiepop, SizeOf(jiepop), 0);
  FillChar(copyjiepop, SizeOf(jiepop), 0);
  FillChar(kexingjiepop, SizeOf(kexingjiepop), 0);
  FillChar(Copykexingjiepop, SizeOf(kexingjiepop), 0);
  fillchar(nm, SizeOf(nm), 0);
end;

procedure TForm1.EDA_Relationship_Matrix_initial();
var
  a, b, c: Integer;
begin
  for a := 1 to n_guimo do        //������
  begin
    EDA_Relashion_Matrix[0, a] := a;
    EDA_Relashion_Matrix[a, 0] := a;
  end;
  for a := 1 to n_guimo do
    for b := 1 to n_guimo do
    begin
      EDA_Relashion_Matrix[a, b] := 0.1;  //ʣ��λ�û�����ѡ�����۳�0��
    end;
end;

procedure TForm1.EDAGetFirstCT();
var
  ind: Integer;
  DEV: Integer;
begin
  ind := 300;
  DEV := 10000;
  repeat
    jiepop[300] := jiepop[299];  //��ԭ
    kexingjiepop[300] := kexingjiepop[299]; //��
    CT := CT + 1;
    bas_decode(ind, DEV);
    BAS_evaluate(ind);
    bad_MATRIX();
 //     memo1.lines.add(inttostr(kexingjiepop[IND].CTp));
  until jiepop[300].CTp <= ct;
  jiepop[1] := jiepop[300];      //��һ����
  kexingjiepop[1] := kexingjiepop[300];
  jiepop[300] := jiepop[299];  //��ԭ
  kexingjiepop[300] := kexingjiepop[299];
end;
//����EDA�Ĺ�ϵ����  ˭��˭���  ��һ�����ʾ���

procedure TForm1.EDA_UPdate_Relationship_Matrix();
var
  a, b, x, y: Integer;
  add: array[1..250] of array[1..250] of Integer;
  ind: Integer;
begin
  for a := 1 to n_guimo do
    for b := 1 to n_guimo do
    begin
      add[a, b] := 0;
    end;           //  trunc(yita*popsize)+1
  for ind := 1 to Trunc(yita * popsize) do
  begin
    for a := 1 to n_guimo - 1 do
    begin
      add[jiepop[ind].gongxu[a].xu, jiepop[ind].gongxu[a + 1].xu] := add[jiepop[ind].gongxu[a].xu, jiepop[ind].gongxu[a + 1].xu] + 1;
    end;
  end;         //�����ۼƸ���ֵ
  for x := 1 to n_guimo do        //local_matrix[x,y]:=TRUNC(((1-aerfa)*local_matrix[x,y]+(aerfa/30)*add[x,y])*1000)/1000;
  begin
    for y := 1 to n_guimo do
    begin
      EDA_Relashion_Matrix[x, y] := TRUNC(((1 - aerfa) * EDA_Relashion_Matrix[x, y] + (aerfa / (yita * popsize)) * add[x, y]) * 1000) / 1000;
    end;
  end;
end;
//EDA�ع����Լ�СLSI
//�ع�����bestjie
//�������bestjie ӵ�и��õ�LSI

procedure TForm1.EDA_Reconstruction_strategy();
var
  a, b, c, d: Integer;
  Light, Right: array[1..20] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
  Partial_sorting: array[1..200] of Integer;  //��ȡ��վ�ڲ�������  �Դ˽����ع�
  Difference: Integer;  //վ�����ƫ��
  first_part_ocess: array[1..300] of Integer; //ѡ��վ��֮ǰ�Ĺ���
  Partial_sorting_SET: set of 1..255;  //վ�ڹ��򼯺�
  Original_sort: array[1..300] of Integer;
  rand_pointA, rand_pointB: Integer;  //���ȡ��������
  indcopy: Integer;
  sta: Integer;   //��Ҫ�ع���վ
  ind: Integer;
  num: Integer;
  op: Integer;
  Insertop: Integer;  //��ȡ��
  Insertop2: Integer; //�����
  times: Integer;
label 1;
begin
  //���������Ͷ�ʱ��վ���վλ��
  //�Ӹ�λ�����ع��ķ���
  //�ظ�1��
  //�������վ��SI����ֵ
  for a := 1 to zhannumber do //����ÿ��վ��ʵ�ʹ���ʱ��
  begin                       //���Ҽ�¼�������ʵ�ʹ���ʱ��
    Light[a] := 0;
    Right[a] := 0;
    b := 1;   //���
    Light_max := bestjie.gongxu[BestKexingjie.zuoBianzhan[a].kexingGongxu[b]].shijian;
    repeat
      if bestjie.gongxu[BestKexingjie.zuoBianzhan[a].kexingGongxu[b]].shijian > Light_max then
      begin
        Light_max := bestjie.gongxu[BestKexingjie.zuoBianzhan[a].kexingGongxu[b]].shijian;
      end;
      Light[a] := Light[a] + bestjie.gongxu[BestKexingjie.zuoBianzhan[a].kexingGongxu[b]].shijian;
      b := b + 1;
    until BestKexingjie.zuoBianzhan[a].kexingGongxu[b] = 0;
    b := 1;   //�ұ�
    Right_max := bestjie.gongxu[BestKexingjie.youBianzhan[a].kexingGongxu[b]].shijian;
    repeat
      if bestjie.gongxu[BestKexingjie.youBianzhan[a].kexingGongxu[b]].shijian > Right_max then
      begin
        Right_max := bestjie.gongxu[BestKexingjie.youBianzhan[a].kexingGongxu[b]].shijian;
      end;
      Right[a] := Right[a] + bestjie.gongxu[BestKexingjie.youBianzhan[a].kexingGongxu[b]].shijian;
      b := b + 1;
    until BestKexingjie.youBianzhan[a].kexingGongxu[b] = 0;
  end;

  Difference := Abs(Light[1] - Right[1]);  //��ȡ�׸�վ�Ĳ�ֵ
  subscript := 1;
  for a := 1 to zhannumber do
  begin
    if Difference < Abs(Light[a] - Right[a]) then
    begin
      Difference := Abs(Light[a] - Right[a]);  //�õ�����ֵ
      subscript := a;     //�õ����վ���±�
    end;
  end;

  //������ֵ��վ��ʼ�ع���߲���
  //ǰ���Ѱ��Ź���
  //���δ���Ź���
  for a := 1 to 200 do
  begin
    Partial_sorting[a] := 0; //���ʣ�๤��
    Original_sort[a] := 0;   //ǰ���Ѱ��Ź���
  end;
  a := 1;
  b := 1;
  c := 1;
  for sta := subscript to zhannumber do  //������Ҫ�ع���վ������
  begin
    repeat
      if (BestKexingjie.zuoBianzhan[subscript].kexingGongxu[a] <> 0) then
      begin
        Partial_sorting[c] := BestKexingjie.zuoBianzhan[subscript].kexingGongxu[a]; //�������(���)
        a := a + 1;
        c := c + 1;
      end;
      if (BestKexingjie.youBianzhan[subscript].kexingGongxu[b] <> 0) then
      begin
        Partial_sorting[c] := BestKexingjie.youBianzhan[subscript].kexingGongxu[b]; //�������(�ұ�)
        b := b + 1;
        c := c + 1;
      end;
    until (BestKexingjie.zuoBianzhan[subscript].kexingGongxu[a] = 0) and (BestKexingjie.youBianzhan[subscript].kexingGongxu[b] = 0);
  end;
  //վ�ڹ�����뼯�� ���ڵõ�ԭ����
  Partial_sorting_SET := [];
  a := 1;
  repeat
    if Partial_sorting[a] <> 0 then
    begin
      Partial_sorting_SET := Partial_sorting_SET + [Partial_sorting[a]];
    end;
    a := a + 1;
  until Partial_sorting[a] = 0;
  b := 1;
  for a := 1 to n_guimo do
  begin
    if bestjie.gongxu[a].xu in Partial_sorting_SET then
    begin
      Original_sort[b] := bestjie.gongxu[a].xu;
      b := b + 1;
    end;
  end;
  a := 0;
  repeat
    a := a + 1;
  until Original_sort[a] = 0;
  num := a - 1;

  for times := 1 to zhannumber do   //�ع�����=վ����Ŀ
  begin
    //��ʼ��������
    oldbestjie := bestjie; //������ý�
    oldbestkexingjie := BestKexingjie;
    op := RandomRange(1, num);
    a := 0;
    repeat
      a := a + 1;
    until bestjie.gongxu[a].xu = op;
    Insertop := a; //��ȡ��  //������
    Insertop2 := RandomRange(Insertop, n_guimo); //�����
    jiepop[300].gongxu[1] := bestjie.gongxu[Insertop]; //��һ����ȡ��;
    for a := Insertop + 1 to Insertop2 do    //�ƶ�Ƭ��
    begin
      bestjie.gongxu[a - 1] := bestjie.gongxu[a];
    end;
    bestjie.gongxu[Insertop2] := jiepop[300].gongxu[1]; //����

    oldjiepop[194] := bestjie;
    oldkexingjiepop[194] := BestKexingjie;
    jiepop[194] := bestjie;
    kexingjiepop[194]:= BestKexingjie;
    a := 194;

    CT:=BESTJIE.CTP;
    EDA_decode(a);           //����
    EDA_evaluate3(a); //��̰��������  ����
    CT:=BESTJIE.CTP-1;

    if (jiepop[194].CTp < bestjie.CTp) then
    begin
      if jiepop[194].CTp < bestjie.CTp then
      begin
        CT := jiepop[194].CTp - 1;
        bestjie := jiepop[194];               //����
        BestKexingjie := kexingjiepop[194];
        EDA_CT := bestjie.CTp;
        EDA_SI := bestjie.LSI;
        EDA_update_M;
          //    savebestdate();
        Memo1.Lines.Add('�ع� FIND:' + IntToStr(EDA_CT));
        Memo1.Lines.Add('�ع� FIND:' + FloatToStr(EDA_SI));
        GOTO 1;
      end
    end
    else
    if (jiepop[194].CTp = bestjie.CTp) and (jiepop[194].LSI < bestjie.LSI) then
    begin
      bestjie := jiepop[194];               //����
      BestKexingjie := kexingjiepop[194];
      EDA_CT := bestjie.CTp;
      EDA_SI := bestjie.LSI;
      EDA_update_M;
         //   savebestdate();
      Memo1.Lines.Add('�ع� FIND_SI:' + FloatToStr(EDA_SI));
      GOTO 1;
    end
    else
    begin
      bestjie := oldbestjie;     //��ԭ
      BestKexingjie := oldbestkexingjie;
    end;
  end;
 1:
end;

//EDA�㷨
procedure TForm1.Button2Click(Sender: TObject);
var
  bestCTp: Integer;
  a, b, c, d: Integer;
  b_num: integer; //վ��Ŀ�±�
  t1, t2: Double;
  ind: integer;
  p: integer; //����
  bestgongxu: string;
  num: Integer;
  Lorder, Rorder, yuanshixu: string;
  itera: Integer;
  choose: Integer;  //�������
  PTEXT: Integer;
  times: Integer;
  line, crow: Integer;  //������ⲿ����
  cop: Double;  //�������Ÿ������
  copy1:Integer;
  combination:Integer; //�����������
  deep3:integer;
  paramter_exp: integer;
begin
  rtime := 0;
  ExcelApp := CreateOleObject('Excel.Application');  //����Excel
  ExcelApp.WorkBooks.Open('D:\SAVE_Verification_of_key_links.xls');
  ExcelApp.WorkSheets[1].Activate;
  ExcelApp.Visible := True;

  crow := 1;
  for paramter_exp := 1 to 16 do  //����ʵ������ 16��
  begin
    line := 1;   //����Ϊ��һ������
    popsize := 100; //[����]
    deep2 := 20;
//    area := 0.1;    //[����]
    for times := 1 to 10 do      //ÿ�����ʵ�����5��
    begin
      Readdate();       //�������ݼ�
      b_num := 1;

      t1 := gettickcount();

      zhanNumber := nm[b_num];
      BCT := CM[b_num];
      CT := BCT;
      set3:=(300+(trunc(n_guimo /3)+1));
      iteration := 0; //���������۳�ʼ��ǰ��
      EDAGetFirstCT();

      EDA_Createpop_Intial();   //��ʼ����Ⱥ   1+29+70
      EDA_maopao();   //�˷�ʱ��
      bestjie := jiepop[1];
      bestkexingjie:=kexingjiepop[1];
      CT := bestjie.CTp - 1;
      repeat        //��ʼ��ʱ
        copy1:=bestjie.CTp;
        iteration := iteration + 1;
        //���¸���ģ��(��Ӣѡ�񣬲���)
//        EDA_update;
        //������������Ⱥ
//        EDA_sample;
        //�ֲ�������d-insert����
        EDA_LS3();
        //�ֲ��������ع�����
        if copy1 = bestjie.CTp then   //ֻ�з������仯���ع�
        begin
          EDA_Reconstruction_strategy();  //�Ը�����ع�����
        end;
        memo1.Lines.Add(inttostr(bestjie.CTp));
        t2 := gettickcount();
      until (t2 - t1) > (n_guimo * n_guimo * 3); //��ʱ��ֹͣ
      Lorder:='';
      Rorder:='';
      for a := 1 to zhannumber do
      begin
        c:=0;
        num:=0;
        repeat
          num:=num+1;
          c:=c+1;
        until (bestkexingjie.zuoBianzhan[a].kexingGongxu[c]=0)and(bestkexingjie.youBianzhan[a].kexingGongxu[c]=0) ;
        if bestkexingjie.zuoBianzhan[a].kexingGongxu[1]<>0 then
        begin
          C:=1;
          repeat
              Lorder:=Lorder+inttostr(bestkexingjie.zuoBianzhan[a].kexingGongxu[c])+', ';
              c:=c+1;
          until c=num;
        end
        else
        begin
          Lorder:=Lorder+'  ��  ';
        end;
        Lorder:=Lorder+'  |  ';
        if bestkexingjie.youBianzhan[a].kexingGongxu[1]<>0 then
        begin
          c:=1;
          repeat
            Rorder:=Rorder+inttostr(bestkexingjie.youBianzhan[a].kexingGongxu[c])+', ';
            c:=c+1;
          until c=num;
        end
        else
        begin
          Rorder:=Rorder+'  ��  ';
        end;
        Rorder:=Rorder+'  |  ';
      end;
      Memo1.Lines.Add('�����ģ��'+inttostr(n_guimo));
      Memo1.Lines.Add('��λ��ģ��'+inttostr(Nm[B_num]));
      Memo1.Lines.Add('���վ������'+Lorder);
      Memo1.Lines.Add('�ұ�վ������'+Rorder);
      Memo1.Lines.Add('CT��'+FloatToStr(bestjie.CTp));
      Memo1.Lines.Add('SI��'+FloatToStr(bestjie.LSI));
      Memo1.Lines.Add('              ');

      rtime := 0;
      ExcelApp.Cells[line, crow].Value := IntToStr(BESTJIE.CTP);
      ExcelApp.Cells[line, crow + 1].Value := FloatToStr(BESTJIE.LSI);

      line := line + 1;
      CLEAR();
    end;
    crow := crow + 2;
  end;
end;

procedure TForm1.saveParameter_experiment_results(var p: Integer);
var
  ExcelApp: Variant;
  a, b, c, d, e: integer;
  total: integer;
  maxT: Integer;
  p_stop: Integer; //ĩ��λ��
  TM: array[1..20] of integer; //�����ֵʱ��
  L_Time, R_Time: integer;
  L_M_time, R_M_time: array[1..20] of integer; //���ұ�ʱ���½�
begin
  ExcelApp := CreateOleObject('Excel.Application');  //����Excel
  ExcelApp.WorkBooks.Open('E:\SaveParameter_experiment_results' + '.xls');
  ExcelApp.WorkSheets[1].Activate;

  ExcelApp.Cells[p, 1].Value := bestjie.CTp;
  // �رչ�������
//  ExcelApp.WorkBooks.Close ;
  //�˳� Excel��
//  ExcelApp.Quit;
//  memo1.Lines.Add('������ϣ�')
end;
//CT����

procedure TForm1.EDA_UPDATE_CT();
begin
  if CT >= bestEdaFeasibleSolution.ctp then
  begin
    CT := bestEdaFeasibleSolution.ctp - 1;
    memo1.lines.add(FloatToStr(bestEdaFeasibleSolution.ctp));
  end;
end;
//

procedure TForm1.EDA_UPDATE_CT_1();
begin
  if CT >= EdaFeasibleSolution[1].ctp then
  begin
    CT := CT - 1;
  end;
end;
//GA����
//OX˳�򽻲�

procedure TForm1.Crossover(var ind: integer);
var
  flag1, flag2: array[1..200] of integer;
  a,b: Integer;
  s1, s2: Integer;  //ѡ����
  p1, p2, mid: Integer;  //ѡ����λ��
  set1: set of 1..255;
  lab2: integer;
  label 1;
begin
  s1:=ind;
  s2:=s1;
  while s1=s2 do
  begin
    randomize ;
    s2:=RandomRange(1,popsize) ;
  end;
  p1 := 1;
  p2 := 1;
  while p1 = p2 do             //ѡ����λ��
  begin
    randomize ;
    p1 := RandomRange(1, n_guimo);
    p2 := RandomRange(1, n_guimo);
  end;
  if p1 > p2 then  //����s1<s2
  begin
    mid := p1;
    p1 := p2;
    p2 := mid;
  end;
  set1 := [];
  for a := p1 to p2 do  //������1�Ĳ���Ƭ��  ���뼯�� ��������2���ж�
  begin
    set1 := set1 + [jiepop[s1].gongxu[a].xu];
  end;
  lab2 := 0;  //��2�ı����±�
  for a := 1 to (p1 - 1) do     //�Ӹ�2��ѡ�������1ǰ��
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  for a := p2 + 1 to n_guimo do     //�Ӹ�2��ѡ�������1ǰ��
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  EDA_decode2(s1);
  EDA_evaluate2(s1);
  if (jiepop[s1].CTp < bestjie.CTp)OR ((jiepop[s1].CTp = bestjie.CTp)AND(jiepop[s1].LSI < bestjie.LSI) )then //����CT
  begin
  //  Memo1.Lines.Add('CROSSOVER ��CT  ' + inttostr(jiepop[s1].CTp)+' IND '+IntToStr(s1)+'  SI: '+floatTOSTR(bestjie.LSI));
    if (jiepop[s1].CTp < bestjie.CTp) then
    begin
      CT := bestjie.CTp - 1;
  //    memo1.lines.add(' CROSS  CT  '+INTTOSTR(BESTJIE.CTP)+'SI '+FLOATTOSTR(BESTJIE.LSI) );
    end;
    bestjie:=jiepop[s1];;
    bestkexingjie:=kexingjiepop[s1];
  end

end;
//GA����
//����
procedure TForm1.mutation(var ind: integer);
var
  rand_a,rand_b:integer;
  a,b,c:integer;
begin
  rand_a:=1;
  rand_b:=1;
  while rand_a=rand_b do
  begin
    rand_a:=randomrange(1,n_guimo);
    rand_b:=randomrange(1,n_guimo);
  end;
  if rand_a>rand_b then   //����rand_a<rand_b
  begin
    a:=rand_a;
    rand_a:=rand_b;
    rand_b:=a;
  end;
  gongxu:=jiepop[ind].gongxu[rand_a];
  for a := rand_a to rand_b-1 do
  begin
    jiepop[ind].gongxu[a]:=jiepop[ind].gongxu[a+1];
  end;
  jiepop[ind].gongxu[rand_b]:=gongxu;
  dabc_decode(ind);
  EDA_evaluate(ind);  //ֱ��
end;
//GA  insert
procedure TForm1.GA_LS();
var
  rand_a,rand_b:integer;
  a,b,c:integer;
  t:integer;
  ind:integer;
begin
  for t := 1 to n_guimo do
  begin
    CT:=bestjie.CTp-1;
    JIEPOP[300]:=BESTJIE;
    OLDJIEPOP[300]:=BESTJIE;
    kexingjiepop[300]:=bestkexingjie;
    oldkexingjiepop[300]:=bestkexingjie;
    ind:=300;
    rand_a:=1;
    rand_b:=1;
    while rand_a=rand_b do
    begin
      rand_a:=randomrange(1,n_guimo);
      rand_b:=randomrange(1,n_guimo);
    end;
    if rand_a>rand_b then   //����rand_a<rand_b
    begin
      a:=rand_a;
      rand_a:=rand_b;
      rand_b:=a;
    end;
    gongxu:=jiepop[ind].gongxu[rand_a];
    for a := rand_a to rand_b-1 do
    begin
      jiepop[ind].gongxu[a]:=jiepop[ind].gongxu[a+1];
    end;
    jiepop[ind].gongxu[rand_b]:=gongxu;
    EDA_decode2(ind);
    EDA_evaluate2(ind);
    if (jiepop[ind].CTp<bestjie.CTp) then
    begin
      bestjie:=jiepop[ind];
      bestkexingjie:=kexingjiepop[ind];
      CT:=bestjie.CTp-1;
   //   memo1.Lines.Add('GA_LS :CT  '+intTostr(BESTJIE.CTp)  );
    end;
  end;
end;
//�Ա��㷨NGA
//��GA ���Ľ�

procedure TForm1.Button3Click(Sender: TObject);
var
  a, d, c, pop: integer;
  B: integer;                    //CM[B] ѭ����ȡCM
  select: Integer;
  Lorder, Rorder: string;
  small_ind: Integer;  //�����ĸ�����Ŀ
  big_ind: Integer;
  minT, maxT: Integer;
  CopyCT: Integer;
  yuanshixu: string;
  ind: Integer;
  b_num: Integer;
  num: Integer;
  key: string;
  CME: Double;
  crow ,times ,line:integer;
begin
  rtime := 0;
  ExcelApp := CreateOleObject('Excel.Application');  //����Excel
  ExcelApp.WorkBooks.Open('D:\SAVE_Verification_of_key_links.xls');
  ExcelApp.WorkSheets[1].Activate;
  ExcelApp.Visible := True;

  crow := 1;
 // for times := 1 to 20 do
  begin
    line:=1;
    readDate();
    iterationMax := get_iterationmax();
    IndexA := 1.2;  //
    small_ind := 1;  //����������Ŀ��������
    big_ind := 0;
    d := 0;
    minT := 0;
    maxT := 0;
    b_num := 2;  //����վ���Լ�
    popsize := 160;  //����������Ⱥ��ģ��
  //  repeat
      //����վ�����ݺ��ʼ��
      t1 := GetTickCount;  //��ʼʱ��
      zhanNumber := nm[b_num];
      BCT := CM[b_num];
      CME := CMean[b_num];
      CT:=BCT;
      EDAGetFirstCT();
      iteration := 0;        //��ʼ��������Ϊ0
      DABC_CreateJIEpop();   //����ʽ�������ɳ�ʼ��
      for ind := 1 to popsize do //��������
      begin
        DABC_decode(ind);
        EDA_evaluate(ind);
      end;
      bestjie := jiepop[1]; //��������õģ�����û��ϵ
      CT:=bestjie.CTp-1;
      //��ʼGA����
      repeat
        iteration := iteration + 1;  //����������
        for ind := 1 to popsize do    //��ÿ�ν�����嶼����
        begin
          if randomrange(1,10)>1 then   //�������90%
          begin
            Crossover(ind);
          end;
        end;
        for ind := 1 to popsize do
        begin
          if randomrange(1,10)>8 then  //�������10%
          begin
            mutation(ind);
          end;
        end;
        GA_LS();
        MEMO1.lines.add(inttostr(bestjie.ctp));
        t2 := GetTickCount; //���ʱ��
//        memo1.lines.add('iteration '+INTTOSTR(ITERATION)+' CT  '+INTTOSTR(BESTJIE.CTP)+'SI '+FLOATTOSTR(BESTJIE.LSI) );
      until (t2 - t1) > (n_guimo * n_guimo * 15);  //�ﵽ����������
  //    Memo1.Lines.Add('���������' + IntToStr(rtime));
      rtime := 0;
      ExcelApp.Cells[line, crow].Value := IntToStr(bestjie.CTp);
      ExcelApp.Cells[line, crow + 1].Value := FloatToStr(bestjie.LSI);
      line := line + 1;
    //  b_num := b_num + 1;  //��վ�������Լ�����  //����һ��
  //  until (Nm[b_num] = 0);

    crow := crow + 2;
    CLEAR();
  end;
end;

//IG ��ʼ����ʽ
procedure TForm1.mNEH();
var
  ind: Integer;
  a, b, c: Integer;
begin
  ind := 200; //����200�����ݴ�����ʼ
  for a := 1 to n_guimo do  //ÿ��������ں����ʱ��֮��
  begin
    b := 0;
    repeat
      b := b + 1;
      if jiepop[200].gongxu[a].houxu[b] <> 0 then
      begin
        jiepop[200].gongxu[a].totalTime := jiepop[200].gongxu[a].totalTime + jiepop[200].gongxu[jiepop[200].gongxu[a].houxu[b]].shijian;
      end;
    until jiepop[200].gongxu[a].houxu[b] = 0;
  end;
  for a := 1 to n_guimo do    //ÿ��������ں����ʱ��+�Լ���ʱ��֮��
  begin
    jiepop[200].gongxu[a].totalTime := jiepop[200].gongxu[a].totalTime + jiepop[200].gongxu[a].shijian;
  end;
  IG_INI_maopao();     //��������
  for a := 1 to n_guimo do
  begin
    jiepop[200].gongxu[a].PL := 1 - (2 * a - 1) / (2 * n_guimo);
  end;
  //�õ�RPW ����
  //����NEH��������  [��ȱ]

end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

//����
procedure TForm1.IG_INI_maopao();
var
  i, j, k: integer;
  temp: structure_gongxu;
begin
  for i := (n_guimo - 1) downto 1 do
  begin
    for j := 1 to i do
    begin                          //����
      if jiepop[200].gongxu[j].totalTime < jiepop[200].gongxu[j + 1].totalTime then
      begin
        temp := jiepop[200].gongxu[j];
        jiepop[200].gongxu[j] := jiepop[200].gongxu[j + 1];
        jiepop[200].gongxu[j + 1] := temp;
      end;
    end;
  end;
end;

procedure TForm1.IG_LocalSearch();    //��op���ֲ�����
var
  counter: Integer;
  i: integer;
  j: Integer;
  a: Integer;
  setA: set of 1..255;
  b: Integer;
  ind: Integer;
  ceshi: Integer;
  LScount:integer;
label
  1;

begin
  lscount:=0;
  counter := 0;
 // i := 1;        //i��ȡλ��
  while( counter <n_guimo)do
  begin
   i:=randomrange(1,n_guimo);
   j:=randomrange(1,n_guimo);
  //  for j := 1 to n_guimo do   //j����λ��
    begin
      ls1jie := lsjie; //���
      ls1kxjie:=lskexingjie;
      oldjiepop[1]:=ls1jie;
      oldkexingjiepop[1]:= ls1kxjie ;
   //  if (i<j)and (not(lsjie.gongxu[i].xu in lsjie.gongxu[j].aset)) then
      if (i<j) THEN
      begin
        ls1jie.gongxu[j] := lsjie.gongxu[i];  //��������½�
        for a := i + 1 to j do
        begin
          ls1jie.gongxu[a - 1] := lsjie.gongxu[a];
        end;
      end
      else
    //  if (i>j)and (not(lsjie.gongxu[j].xu in lsjie.gongxu[i].aset))then
      if (i>j) THEN
      begin
        ls1jie.gongxu[j] := lsjie.gongxu[i];  //��������½�
        for a := i - 1 downto j do
        begin
          ls1jie.gongxu[a + 1] := lsjie.gongxu[a];
        end;
      end
      else
      begin
        goto 1;
      end;
      jiepop[1] := ls1jie; //����
      ind := 1;
      LScount:=LScount+1;
      EDA_decode2(ind);
      eda_evaluate2(ind);
     // IG_evaluate(ind);
      ls1jie := jiepop[1]; //����
      LS1Kxjie := kexingjiepop[1];
      if ls1jie.CTp < LSjie.CTp then
      begin
        lsjie := ls1jie;
        LSKexingjie:= LS1Kxjie;
        counter := 0;  // ���¼���
     //   memo1.lines.add('LS����:  '+inttostr(LSjie.CTp));
        if LSjie.ctp<=CT then
        begin
          CT:= LSjie.ctp-1;
      //    memo1.lines.add('LS����:  '+inttostr(LSjie.CTp));
        end;
      end
      else if ls1jie.CTp = LSjie.CTp then
      begin
        lsjie := ls1jie;  //δ�Ż�  ��������
        LSKexingjie:= LS1Kxjie;
      end; 
1:   //˵��������
    end;
    counter := counter + 1;
    i := (i + 1);
    if i>n_guimo then
    begin
      i := (i - n_guimo);
    end;
  end;
 // memo1.lines.add('L���������'+inttostr(lscount));
end;
//�Ա�IG -2016����
//���۶���   �Ǽ�Ȩ����ʱ��+ƽ��ǰ�� ���� վ��ʱ��

procedure TForm1.Button6Click(Sender: TObject);
var
  A, B, C: Integer;
  i, d: Integer;
  Temperature: double;  //ģ���˻��¶�
  ind: Integer;   //ֻ��200��Ϊ����
  rand_p: Integer;
  TotalT: Integer;
  T: Integer;
  Rand_insert: Integer;
  crow,times,line:integer;
  tem:double;
begin
  rtime := 0;
  ExcelApp := CreateOleObject('Excel.Application');  //����Excel
  ExcelApp.WorkBooks.Open('D:\SAVE_Verification_of_key_links.xls');
  ExcelApp.WorkSheets[1].Activate;
  ExcelApp.Visible := True;
  crow := 1;
//  for times := 1 to 20 do
  begin
    line := 1;
    ReadDate();
    B := 2;
    TotalT := 0;
    for A := 1 to n_guimo do   //�������й���ʱ��֮��
    begin
      TotalT := TotalT + jiepop[200].gongxu[A].shijian;
    end;
    T := 1;  //ģ���˻����
 //   repeat
      t1 := GetTickCount;
      BCT := CM[B];
      zhannumber := nm[B];
      CT := BCT * 1.2;//��ʼ��CT
      d := 4;      //�Ŷ���С(����1)
      Temperature := (T * TotalT ) / ( 100*nm[B]);
      mNEH();    //[����������ʼ������û�ôﵽ]
      ind := 200;   //ֻ��һ������
      iteration := 0;
      DABC_decode(ind);
      IG_evaluate(ind);    //�״�����
      CT := jiepop[200].CTp;
      if jiepop[200].CTp <= CT then  //����CT�½�
      begin
        CT := jiepop[200].CTP - 1;
      end;
      bestjie := jiepop[200]; //���Ž�
      bestkexingjie := kexingjiepop[200];
      repeat   // ��ʼ����
        iteration := iteration + 1;
    //    memo1.Lines.Add('iteration  '+inttostr(iteration));
        OperationJie :=  jiepop[200];
        OperationKexingjie := kexingjiepop[200];
   //     memo1.Lines.Add('������ֵ  '+inttostr(OperationJie.CTp));

      //  if randomrange(1,10)>=8 then
        begin
          for i := 1 to 4 do      //��op��d��insert�Ŷ�
          begin
            rand_p := (n_guimo - d + i);
            while rand_p = (n_guimo - d + i) do
            begin
              randomize;
              rand_p := RandomRange(1, n_guimo); //���һ��λ��
            end;
            if rand_p < (n_guimo - d + i) then  //���insert
            begin
              OperationJie.gongxu[250] := OperationJie.gongxu[rand_p]; //������ȡλ��
              for A := rand_p + 1 to n_guimo - d + i do
              begin
                OperationJie.gongxu[A - 1] := OperationJie.gongxu[A];  //Ƭ���ƶ�
              end;
              OperationJie.gongxu[n_guimo - d + i] := OperationJie.gongxu[250]; //insert ����
            end
            else
            if rand_p > (n_guimo - d + i) then  //��ǰinsert
            begin
              OperationJie.gongxu[250] := OperationJie.gongxu[rand_p]; //������ȡλ��
              for A := rand_p - 1 downto n_guimo - d + i do
              begin
                OperationJie.gongxu[A + 1] := OperationJie.gongxu[A];  //Ƭ���ƶ�
              end;
              OperationJie.gongxu[n_guimo - d + i] := OperationJie.gongxu[250]; //insert ����
            end;
          end;
          begin                        //�Ŷ���Ч[]
            jiepop[2]:= OperationJie;
            ind:=2;
            DABC_decode(ind);
            EDA_evaluate(ind);    //ֱ��
            OperationJie:= jiepop[2];
            Operationkexingjie:=kexingjiepop[2];
            oldjiepop[2]:=jiepop[2];
            oldkexingjiepop[2]:=kexingjiepop[2];
       //     memo1.Lines.Add('�Ŷ�4��  '+inttostr(OperationJie.CTp));
          end;
        end;

        OperationJie_best := OperationJie;   //��Ҫ���۲��ܺ���̰��ѡ��
        BestOperationKexingjie:=Operationkexingjie;
        if OperationJie.CTp < bestjie.CTp then
        begin
          bestkexingjie := Operationkexingjie;
          bestjie := OperationJie;
          CT:=  bestjie.CTp-1;
        //  memo1.Lines.Add('�Ŷ�����������  '+inttostr(bestjie.CTp));
        end;
        for i := 1 to 4 do    //��op��d��insert,ѡ��õ�������
        begin                  //n-d+i ����ȡ��     n-d+i ֮ǰ�����λ����insert��
          oldjiepop[1]:=OperationJie;
          oldkexingjiepop[1]:=Operationkexingjie;
          randomize;
          for c := 1 to (n_guimo - d + i-1) do
          begin
            Rand_insert := c;  //insert��

            OperationJie.gongxu[250] := OperationJie.gongxu[n_guimo - d + i]; //������ȡλ��
            for A := n_guimo - d + i - 1 downto Rand_insert do
            begin
              OperationJie.gongxu[A + 1] := OperationJie.gongxu[A];  //Ƭ���ƶ�
            end;
            OperationJie.gongxu[Rand_insert] := OperationJie.gongxu[250]; //insert ����

            jiepop[1] := OperationJie;

            ind := 1;
            DABC_decode(ind);
            IG_evaluate(ind);
            if OperationJie_best.CTp > jiepop[1].CTp then //������
            begin
              OperationJie_best := jiepop[1]; //����
              BestOperationKexingjie:=kexingjiepop[1];
              OperationJie:=OperationJie_best;
              Operationkexingjie:=BestOperationKexingjie;
              if OperationJie.CTp < bestjie.CTp then
              begin
                bestkexingjie := Operationkexingjie;
                bestjie := OperationJie;
                CT:=  bestjie.CTp-1;
            //    memo1.Lines.Add('�Ŷ���insert��������  '+inttostr(bestjie.CTp));
              end;
            end;
          end;
        end;
        LSjie := OperationJie_best;   //�����ֲ�����
        lskexingjie:= Operationkexingjie;
       // CT:= LSjie.CTP;
        IG_LocalSearch();    //��op���ֲ�����

        tem:=exp(-(lsjie.CTp-jiepop[200].ctp)/Temperature);
        if LSjie.CTp < jiepop[200].CTp then   //LS<KEXING200
        begin
          kexingjiepop[200] := LSKexingjie;  //��ø��� ����
          jiepop[200] := LSjie;              //��ø���  վ����Ϣ
     //     memo1.Lines.Add('�ֲ�LS�����˵�����ֵ���õ���  '+inttostr(LSjie.CTp));
          if LSjie.CTp  < bestjie.CTp then
          begin
            bestkexingjie :=LSKexingjie;
            bestjie :=LSjie;
            CT:= bestjie.CTp-1;
  //          memo1.Lines.Add('���ε������������ţ��õ���  '+inttostr(bestjie.CTp));
          end
        end
        else
                                  //exp(-(lsjie.CTp-jiepop[200].ctp)/Temperature)
       if randomrange(1,10)/10>exp(-(lsjie.CTp-jiepop[200].ctp)/Temperature) then
        begin
          kexingjiepop[200] := LSKexingjie;  //��ø��� ����
          jiepop[200] := LSjie;
        end;
        memo1.lines.add(inttostr(bestjie.ctp));
        t2 := GetTickCount;
      until t2 - t1 > n_guimo * n_guimo * 15;
     // Memo1.Lines.Add('ITERATION  ' + IntToStr(iteration));
   //   Memo1.Lines.Add('CT   ' + IntToStr(bestjie.CTp));
   //   Memo1.Lines.Add('SI   ' + FloatToStr(bestjie.LSI));
      ExcelApp.Cells[line, crow].Value := IntToStr(bestjie.CTp);
      ExcelApp.Cells[line, crow + 1].Value := FloatToStr(bestjie.LSI);
      line := line + 1;
 //     B := B + 1;
 //   until nm[B] = 0; //����վ������

    crow := crow + 2;
    CLEAR();
  end;
end;

//�ؼ�������֤  ȫ�̲����ǹ�������� ����EDAѧϰ
procedure TForm1.Button7Click(Sender: TObject);
var
  bestCTp: Integer;
  a, b, c, d: Integer;
  b_num: integer; //վ��Ŀ�±�
  t1, t2: Double;
  ind: integer;
  p: integer; //����
  bestgongxu: string;
  num: Integer;
  Lorder, Rorder, yuanshixu: string;
  itera: Integer;
  choose: Integer;  //�������
  PTEXT: Integer;
  times: Integer;
  line, crow: Integer;
//  y: TObject;  //������ⲿ����
  x, y: Integer;
begin
  ExcelApp := CreateOleObject('Excel.Application');  //����Excel
  ExcelApp.WorkBooks.Open('D:\SAVE_Verification_of_key_links.xls');
  ExcelApp.WorkSheets[1].Activate;
  ExcelApp.Visible := True;
  crow := 1;
  for times := 1 to 10 do
  begin
    Readdate();       //�������ݼ�
    CT := 0;
    b_num := 1;
    line := 1;
    repeat
      t1 := gettickcount();
      zhanNumber := nm[b_num];
      BCT := CM[b_num];
      CT := BCT;
      popsize := 100;  //��Ⱥ��С��������
      aerfa := 0.7;    //ѧϰ��  ��������
      yita := 0.1;    //��Ӣռ�ȡ�������
      insert_times := 20;  //�����Ÿ�����insert���� ��������  ��ȡλ��
   //   EDAModel_initial();   //����model
      EDAGetFirstCT();
  //    EDA_Relationship_Matrix_initial();
      iteration := 0; //���������۳�ʼ��ǰ��
      EDA_Createpop_Intial();   //��ʼ����Ⱥ   1+29+70
      EDA_maopao();
      bestjie := jiepop[1];
      CT := jiepop[1].ctp;      //����CT
      CT := CT - 1;  //ѹ��CT
      for x := 1 to n_guimo do   //������λ������
        for y := 1 to n_guimo do
        begin
          Local_Matrix[x, y] := 1;
        end;
      for x := 1 to n_guimo do
      begin
        Local_Matrix[x, 0] := x;
        Local_Matrix[0, x] := x;
      end;

      repeat
        iteration := iteration + 1;
      //  EDA_UPdate_Relationship_Matrix();  //�״θ��¹�ϵ���� (��ϵ����Ļ����ڽ����и���)
        EDAModel_update();        //ȡǰ5%����EDAModel
      //  EDAModeL_sample(); //����EDA��������Ⱥ���� //�����ٴα��
        EDA1_sample();
        EDA_maopao();         //�������  ��һά������
        EDA_LS1(); //WUWU        //  LS  �и�����ʷ����  ��CT
        jiepop[101] := bestjie;
        ind := 101;
        begin
          EDA_LS2(); //WUWU        //  LS  �и�����ʷ����  ��CT
        end;
        jiepop[6] := bestjie;
        t2 := gettickcount();
      until t2 - t1 > n_guimo * n_guimo * 5; //��ʱ��ֹͣ
      EDA_Reconstruction_strategy();
      Memo1.Lines.Add('���Ž��ģ�' + FloatToStr(CT + 1));
      Memo1.Lines.Add('����SI��' + FloatToStr(bestjie.LSI));
      ExcelApp.Cells[line, crow].Value := FloatToStr(CT + 1);
      ExcelApp.Cells[line, crow + 1].Value := FloatToStr(bestjie.LSI);
      line := line + 1;
      //������ŷ���
     { bestgongxu:='';
      for A:=1 to n_guimo do
      begin
        bestgongxu:=bestgongxu+','+inttostr(bestjie.gongxu[a].xu);
      end;
   //   EDA_update_gantte(zhanNumber);
      Lorder:='';
      Rorder:='';
      for a := 1 to zhannumber do
      begin
        c:=0;
        num:=0;
        repeat
          num:=num+1;
          c:=c+1;
        until (BestKexingjie.zuoBianzhan[a].kexingGongxu[c]=0)and(BestKexingjie.youBianzhan[a].kexingGongxu[c]=0) ;
        if BestKexingjie.zuoBianzhan[a].kexingGongxu[1]<>0 then
        begin
          C:=1;
          repeat
              Lorder:=Lorder+inttostr(BestKexingjie.zuoBianzhan[a].kexingGongxu[c])+', ';
              c:=c+1;
          until c=num;
        end
        else
        begin
          Lorder:=Lorder+'  ��  ';
        end;
        Lorder:=Lorder+'  |  ';
        if BestKexingjie.youBianzhan[a].kexingGongxu[1]<>0 then
        begin
          c:=1;
          repeat
            Rorder:=Rorder+inttostr(BestKexingjie.youBianzhan[a].kexingGongxu[c])+', ';
            c:=c+1;
          until c=num;
        end
        else
        begin
          Rorder:=Rorder+'  ��  ';
        end;
        Rorder:=Rorder+'  |  ';
      end;
      Memo1.Lines.Add('ʵ�ʵ�������'+inttostr(iteration));
      Memo1.Lines.Add('�����ģ��'+inttostr(n_guimo));
      Memo1.Lines.Add('��λ��ģ��'+inttostr(zhannumber));
      Memo1.Lines.Add('���Ž��ģ�'+FloatToStr(CT+1));
      Memo1.Lines.Add('���վ������'+Lorder);
      Memo1.Lines.Add('�ұ�վ������'+Rorder);
      Memo1.Lines.Add('ԭʼ��'+bestgongxu);
      Memo1.Lines.Add('              ');  }
      b_num := b_num + 1; //��װ��վ��Ŀ
    until nm[b_num] = 0;  //�ù�ģ���Լ�����վ��ģ����
    crow := crow + 2;
    CLEAR();
  end;
  ExcelApp.Activeteworkbook.save;
end;

procedure TForm1.Button8Click(Sender: TObject);
VAR
b_num:INTEGER;

BEGIN
    Readdate();       //�������ݼ�
    b_num:=1;
    repeat
      zhanNumber := nm[b_num];
      BCT := CM[b_num];
      CT := BCT;
      EDAGetFirstCT();
      memo1.Lines.Add('M:  '+INTTOSTR(zhanNumber)+'  LB: '+inttostr(bct)+'  CT  '+floattostr(CT));
      b_num:=b_num+1;
    until  nm[b_num]=0;
END;

procedure direct_decode(var ind: Integer);
var
  A, B, C: Integer;
begin

end;

procedure TForm1.BAS_swap(var ind: Integer);
var
  a, b, c, d: Integer;
  Point1: Integer;
  time: Integer;
begin
  time := 1;

  repeat
    DABC_bad_MATRIX(ind);
    if Badset <> [] then
    begin
      for d := 1 to 2 do
      begin
        c := RandomRange(1, n_guimo);
        b := RandomRange(1, n_guimo);
        jiepop[101] := jiepop[ind];
        jiepop[ind].gongxu[c] := jiepop[ind].gongxu[b];
        jiepop[ind].gongxu[b] := jiepop[101].gongxu[c];
      end;

      jiepop[101] := jiepop[102];  //��ԭ

      ;
      DABC_decode(ind);

      DABC_evaluate(ind);
      if jiepop[ind].CTp <= CT then
      begin
        CT := jiepop[ind].CTp;
        CT := CT - 1;
        Memo1.Lines.Add(FloatToStr(CT));
      end;
      time := time + 1;
    end;
  until time = 100000000000;
end;

procedure TForm1.bad_MATRIX();
var
  A, B: Integer;
begin
  for A := 1 to zhannumber do
  begin
    if kexingjiepop[101].Station[A].FreeTime <> 0 then
    begin
      B := 1;
      repeat
        if (B = 1) and (kexingjiepop[101].zuoBianzhan[A].gxEndTime[B] <> jiepop[101].gongxu[kexingjiepop[101].zuoBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[101].zuoBianzhan[A].kexingGongxu[B]];
        end
        else if (B > 1) and (kexingjiepop[101].zuoBianzhan[A].gxEndTime[B] - kexingjiepop[101].zuoBianzhan[A].gxEndTime[B - 1] <> jiepop[101].gongxu[kexingjiepop[101].zuoBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[101].zuoBianzhan[A].kexingGongxu[B]];
        end;
        B := B + 1;
      until kexingjiepop[101].zuoBianzhan[A].kexingGongxu[B] = 0;
      B := 1;
      repeat
        if (B = 1) and (kexingjiepop[101].youBianzhan[A].gxEndTime[B] <> jiepop[101].gongxu[kexingjiepop[101].youBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[101].youBianzhan[A].kexingGongxu[B]];
        end
        else if (B > 1) and (kexingjiepop[101].youBianzhan[A].gxEndTime[B] - kexingjiepop[101].youBianzhan[A].gxEndTime[B - 1] <> jiepop[101].gongxu[kexingjiepop[101].youBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[101].youBianzhan[A].kexingGongxu[B]];
        end;
        B := B + 1;
      until kexingjiepop[101].youBianzhan[A].kexingGongxu[B] = 0;
    end;
  end;
end;

procedure TForm1.DABC_bad_MATRIX(var ind: Integer);
var
  A, B, c, num: Integer;
  SET1: set of 1..255;
begin
  SET1 := Badset;
  badset := [];
  for A := 1 to zhannumber do
  begin
    if kexingjiepop[ind].Station[A].FreeTime <> 0 then
    begin
      B := 1;
      repeat
        if (B = 1) and (kexingjiepop[ind].zuoBianzhan[A].gxEndTime[B] <> jiepop[ind].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[B]];
        end
        else if (B > 1) and (kexingjiepop[ind].zuoBianzhan[A].gxEndTime[B] - kexingjiepop[ind].zuoBianzhan[A].gxEndTime[B - 1] <> jiepop[ind].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[B]];
        end;
        B := B + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[B] = 0;
      B := 1;
      repeat
        if (B = 1) and (kexingjiepop[ind].youBianzhan[A].gxEndTime[B] <> jiepop[ind].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[ind].youBianzhan[A].kexingGongxu[B]];
        end
        else if (B > 1) and (kexingjiepop[ind].youBianzhan[A].gxEndTime[B] - kexingjiepop[ind].youBianzhan[A].gxEndTime[B - 1] <> jiepop[ind].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[B]].shijian) then
        begin
          Badset := Badset + [kexingjiepop[ind].youBianzhan[A].kexingGongxu[B]];
        end;
        B := B + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[B] = 0;
    end;
  end;
  num := 0;
  if SET1 <> Badset then
  begin
//    for c in badset  do inc(num);
//    memo1.lines.add(inttostr(num));
  end;
end;

procedure TForm1.BAS_RefreashMartrix(var ind: Integer);
var
  a: Integer;
  b: Integer;
begin
  for a := 1 to n_guimo do
  begin
    if jiepop[ind].gongxu[a].zhuangtai = 0 then
    begin
      for b := 1 to n_guimo do
      begin
        Local_Matrix[jiepop[102].gongxu[jiepop[ind].gongxu[a].xu].xu, b] := 0;
      end;
    end;
  end;
end;

procedure TForm1.BAS_evaluate(var ind: integer);
var
  LevelA: integer;  //1��ʾ�������CTp�����  //-1��ʾ�������CTP���
  b: Integer;
  MaxT: Integer; //�����ߵ����CTpʱ��
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
label
  1;
begin
  MaxT := 0;
  LevelA := 0;       //��ʼ��0
  //�˴�дһ�����۹���       һ����ÿ��վĩβʱ��+CT-ĩβʱ��
  //��������־��leveA��ֵ
  for A := 1 to zhannumber do  // ����ÿ��վ���깤ʱ��CTp
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //�������վ�깤ʱ��
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  kexingjiepop[ind].CTp := MaxT;   //�õ�һ������վ����CTp
  if (iteration > 0) and (kexingjiepop[ind].CTp = oldkexingjiepop[ind].CTp) then
  begin
    compare1 := 0;
    compare2 := 0;
    for b := 1 to zhannumber do//Ȩ�ؽ��ԽСԽ��
    begin                       //��վ�Ľ��Ĵ�ŵ����վ����ģ�ֱ�Ӹ������
      compare1 := compare1 + (zhannumber - b) * (max(0, kexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (Bct + CT) / 2) + max(0, BCT - (CT - BCT) / 2 - kexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
      compare2 := compare2 + (zhannumber - b) * (max(0, oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (BCT + CT) / 2) + max(0, BCT - (CT - BCT) / 2 - oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
    end;
    if compare2 < compare1 then  //ԭ���Ľ�����򣬻���ȥ
    begin
      jiepop[ind] := oldjiepop[ind];
      kexingjiepop[ind] := oldkexingjiepop[ind];
    end
    else   //�½����  ����old
    begin
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
    end;
  end
  else if (iteration > 0) and (oldkexingjiepop[ind].CTp < kexingjiepop[ind].CTp) then  //����ȥ
  begin
    jiepop[ind] := oldjiepop[ind];
    kexingjiepop[ind] := oldkexingjiepop[ind];
  end
  else   //�½����  ����old
  begin
    oldjiepop[ind] := jiepop[ind];
    oldkexingjiepop[ind] := kexingjiepop[ind];
  end;

  jiepop[ind].CTp := kexingjiepop[ind].CTp;

  for pzhan := 1 to zhannumber do
  begin
    A := 1;
    kexingjiepop[ind].Station[pzhan].FreeTime := 0;
    T_Light := 0;
    repeat
      if kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A] <> 0 then
      begin
        if A = 1 then
        begin
          T_Light := T_Light + (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A] - jiepop[299].gongxu[kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[A]].shijian);
        end
        else
        begin
          T_Light := T_Light + (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A] - jiepop[299].gongxu[kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[A]].shijian - kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A - 1]);
        end;
      end;
      A := A + 1;
    until kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A] = 0;
    T_Light := T_Light + trunc(CT) - kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[A - 1];

    A := 1;
    kexingjiepop[ind].Station[pzhan].FreeTime := 0;
    T_Right := 0;
    repeat
      if kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A] <> 0 then
      begin
        if A = 1 then
        begin
          T_Right := T_Right + (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A] - jiepop[299].gongxu[kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[A]].shijian);
        end
        else
        begin
          T_Right := T_Right + (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A] - jiepop[299].gongxu[kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[A]].shijian - kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A - 1]);
        end;
      end;
      A := A + 1;
    until kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A] = 0;
    T_Right := T_Right + trunc(CT) - kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[A - 1];

    kexingjiepop[ind].Station[pzhan].FreeTime := T_Right + T_Light;

    if kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian >= kexingjiepop[ind].youBianzhan[pzhan].zongshijian then
    begin
      kexingjiepop[ind].Station[pzhan].OverTime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian;
    end
    else
    begin
      kexingjiepop[ind].Station[pzhan].OverTime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian;
    end;

  end;
end;
//��������[���������ǰ��Լ������]

procedure TForm1.ReadDate();
var
  ExcelApp: Variant;
  a, b, c, d, e: integer;
  total: integer;
  maxT: Integer;
  p_stop: Integer; //ĩ��λ��
  TM2:array[1..20] of double; //�����ֵʱ��
  TM: array[1..20] of integer; //�����ֵʱ��
  L_Time, R_Time: integer;
  L_M_time, R_M_time: array[1..20] of integer; //���ұ�ʱ���½�
begin
  ExcelApp := CreateOleObject('Excel.Application');  //����Excel
  n_guimo := StrToInt(Edit1.Text);
  ExcelApp.WorkBooks.Open('C:\p' + INTTOSTR(n_guimo) + '.xls');
  ExcelApp.WorkSheets[1].Activate;
  //ʱ�䣬����״̬��ֱ�Ӻ������
  for a := 1 to n_guimo do
  begin
    jiepop[300].gongxu[a].xu := a;
    jiepop[300].gongxu[a].zhuangtai := 1; //��ʼ��״̬Ϊ�ɷ���  //1�����ɷ���    0 �����ѷ���
    jiepop[300].gongxu[a].fangxiang := ExcelApp.Cells[a, 2].Value;
    jiepop[300].gongxu[a].shijian := ExcelApp.Cells[a, 3].Value;
    if ExcelApp.Cells[a, 4].Value = 0 then //���������
    begin
      jiepop[b].gongxu[a].houxu[1] := 0;
      c := 4;
    end
    else
    begin
      b := 1;
      c := 4;           //�ӵ����п�ʼ��ֱ�Ӻ������  //ֱ������0
      repeat
        jiepop[300].gongxu[a].houxu[b] := ExcelApp.Cells[a, c].Value;
        c := c + 1;
        b := b + 1;
      until ExcelApp.Cells[a, c].Value = 0;
    end;
  end;
  for c := 1 to 20 do
  begin
    nm[c] := 0;
  end;
  c := 1;
  repeat   //����վ��Ŀ
    nm[c] := ExcelApp.Cells[n_guimo + 1, c].Value;
    c := c + 1;
  until ExcelApp.Cells[n_guimo + 1, c].Value = 0;
  //�����½�CM  ��LB=max(���ʱ��֮��/m,�ұ�ʱ��֮��/m,tmax,T��/2m)
  total := 0;
  for a := 1 to n_guimo do
  begin
    total := total + jiepop[300].gongxu[a].shijian;
  end;
  c := 1;
  repeat
    CMean[c] := total / (2 * nm[c]);
    c := c + 1;
  until nm[c] = 0;
  //�ҵ��������ļӹ�ʱ��
  maxT := jiepop[300].gongxu[1].shijian;
  for a := 2 to n_guimo do
  begin
    if jiepop[300].gongxu[a].shijian > maxT then
      maxT := jiepop[300].gongxu[a].shijian;
  end;
  //���㱾��ģ���в���վ��ġ�CMֵ����ȫ�ֱ���
  c := 1;
  repeat
    if trunc(total / (2 * nm[c]))=(total / (2 * nm[c])) then
    begin
      TM[c] := trunc(total / (2 * nm[c]) );
    end
    else
    begin
      TM[c] := trunc(total / (2 * nm[c]) + 1);    //����ȡ��
    end;
    TM2[c] := (total / (2 * nm[c]) );    //����ȡ��
    c := c + 1;
  until nm[c] = 0;
  //�������ұ߾�ֵʱ��
  L_Time := 0;
  R_Time := 0;
  for a := 1 to n_guimo do
  begin
    if jiepop[300].gongxu[a].fangxiang = -1 then
    begin
      L_Time := L_Time + jiepop[300].gongxu[a].shijian;
    end;
    if jiepop[300].gongxu[a].fangxiang = 1 then
    begin
      R_Time := R_Time + jiepop[300].gongxu[a].shijian;
    end;
  end;
  a := 1;
  repeat
    L_M_time[a] := trunc(L_Time / nm[a]) + 1; //����ȡ��
    R_M_time[a] := trunc(R_Time / nm[a]) + 1;
    a := a + 1;
  until nm[a] = 0;
  a := 1;
  repeat
    CM[a] := max(max(L_M_time[a], R_M_time[a]), max(TM[a], maxT));
    a := a + 1;
  until nm[a] = 0;
  //�������ǰ��������   [����֤������]
  for a := 1 to n_guimo do
  begin
    d := 1;
    for b := 1 to n_guimo do
    begin
      c := 1;
      repeat
        if jiepop[300].gongxu[b].houxu[c] = a then
        begin
          jiepop[300].gongxu[a].qianxu[d] := b;
          d := d + 1;
        end;
        c := c + 1;
      until jiepop[300].gongxu[b].houxu[c] = 0;
      ;
    end;

  end;

  EDA_initial_matrix_3();
  for a := 1 to n_guimo do
  begin
    for b := 1 to 3 do
    begin
      copy_stop_Matrix[a, b] := stop_Matrix[a, b];
    end;
  end;
  jiepop[299] := jiepop[300];   //����  ���������
  EDAModel_initial();   //����model
  Total_process_time:=0;
  for A := 1 to n_guimo do
  begin
    Total_process_time:=Total_process_time+jiepop[300].gongxu[a].shijian;
  end;
  // �رչ�������
  ExcelApp.WorkBooks.Close;
  //�˳� Excel��
  ExcelApp.Quit;
  memo1.Lines.Add('������ϣ�')
end;

//���ü��ϻ�ȡ���λ��

procedure TForm1.EDA_initial_matrix_3();
var
  a, b, c, d: integer;
  num: array[1..250] of integer;
  pos_a, pos_b: array[1..250] of integer;
begin
  //ǰ����Ŀ
  for a := 1 to n_guimo do
  for b := 1 to n_guimo do
  local_matrix[a,b]:=0;
  for a := 1 to n_guimo do
  begin
    gongxuset[a].aset := [];
  end;
  for a := 1 to n_guimo do  //��ȡÿ�������ǰ�򼯺�
  begin
    if jiepop[300].gongxu[a].qianxu[1] <> 0 then
    begin
      b := 1;
      repeat
        gongxuset[a].aset := gongxuset[a].aset + [jiepop[300].gongxu[a].qianxu[b]];
        b := b + 1;
      until jiepop[300].gongxu[a].qianxu[b] = 0;
    end;
  end;
  for a := 1 to n_guimo do      //��¼����ǰ�����
  begin
    num[a] := 0;
    for c in gongxuset[a].anearset do
      Inc(num[a]);
    jiepop[300].gongxu[a].aNearnum := num[a];
  end;

  for a := 1 to n_guimo do
  begin
    gongxuset[a].anearset := gongxuset[a].aset;
  end;
  for a := 1 to n_guimo do   //ǰ�򼯺����
  begin
    if jiepop[300].gongxu[a].qianxu[1] <> 0 then
    begin
      b := 1;
      repeat
        gongxuset[a].aset := gongxuset[a].aset + gongxuset[jiepop[300].gongxu[a].qianxu[b]].aset;
        b := b + 1;
      until jiepop[300].gongxu[a].qianxu[b] = 0;
    end;
  end;
  for a := 1 to n_guimo do   //�ۼƳ���Ŀ
  begin
    num[a] := 0;
    for c in gongxuset[a].aset do
      Inc(num[a]);
  end;
  for a := 1 to n_guimo do
  begin
    pos_a[a] := num[a] + 1;    //��¼��ʼλ��
    jiepop[300].gongxu[a].anum := num[a]; //��¼ǰ����Ŀ
  end;
  //���������Ŀ
  for a := 1 to n_guimo do
  begin
    gongxuset[a].bset := [];
  end;
  for a := 1 to n_guimo do  //��ȡÿ������ĺ��򼯺�
  begin
    if jiepop[300].gongxu[a].houxu[1] <> 0 then
    begin
      b := 1;
      repeat
        gongxuset[a].bset := gongxuset[a].bset + [jiepop[300].gongxu[a].houxu[b]];
        b := b + 1;
      until jiepop[300].gongxu[a].houxu[b] = 0;
    end;
  end;
  for a := 1 to n_guimo do
  begin
    gongxuset[a].bnearset := gongxuset[a].bset;
  end;
  for a := 1 to n_guimo do
  begin
    num[a] := 0;
    for c in gongxuset[a].bnearset do
      Inc(num[a]);
    jiepop[300].gongxu[a].bNearnum := num[a];
  end;
  for a := n_guimo downto 1 do
  begin
    if jiepop[300].gongxu[a].houxu[1] <> 0 then
    begin
      b := 1;
      repeat
        gongxuset[a].bset := gongxuset[a].bset + gongxuset[jiepop[300].gongxu[a].houxu[b]].bset;
        b := b + 1;
      until jiepop[300].gongxu[a].houxu[b] = 0;
    end;
  end;
  for a := 1 to n_guimo do   //�ۼƳ���Ŀ
  begin
    num[a] := 0;
    for c in gongxuset[a].bset do
      Inc(num[a]);
  end;
  for a := 1 to n_guimo do
  begin
    pos_b[a] := n_guimo - num[a];    //��¼����λ��
    jiepop[300].gongxu[a].bnum := num[a]; //��¼ǰ����Ŀ
  end;
  //������ȱ����
  for a := 1 to n_guimo do
  begin
    local_matrix[0, a] := a;
    local_matrix[a, 0] := a;
  end;
  for a := 1 to n_guimo do
  begin
    for b := pos_a[a] to pos_b[a] do
    begin
      local_matrix[a, b] := 1;
    end;
  end;
  for a := 1 to n_guimo do
  begin
    jiepop[300].gongxu[a].aset := gongxuset[a].aset;
    jiepop[300].gongxu[a].bset := gongxuset[a].bset;
    jiepop[300].gongxu[a].anearset := gongxuset[a].anearset;
    jiepop[300].gongxu[a].bnearset := gongxuset[a].bnearset;
  end;
  for b := 1 to n_guimo do   //����  λ�þ���
  begin
    for c := 1 to n_guimo do   //����
    begin
      Local_Matrix[b, c]:= 1;
    end;
  end;
end;

procedure TForm1.EDA_initial_matrix_2();
var
  a, b, c, d: integer;
  matrix_nn: array[1..250] of array[1..250] of integer;
  num: integer;
begin
  for a := 1 to n_guimo do
    for b := 1 to n_guimo do
      matrix_nn[a, b] := 0;  //���
  for a := n_guimo downto 1 do
  begin
    if jiepop[101].gongxu[a].qianxu[1] <> 0 then
    begin
      b := 1;
      num := 0;
      repeat
        matrix_nn[a, jiepop[101].gongxu[a].qianxu[b]] := 1;
        num := num + 1;
        b := b + 1;
      until jiepop[101].gongxu[a].qianxu[b] = 0;
      for b := 1 to n_guimo do
      begin
        if matrix_nn[b, a] <> 0 then
          matrix_nn[b, a] := matrix_nn[b, a] + num;
      end;
    end;
  end;
end;

procedure TForm1.EDA_initial_matrix();
var
  a, b, c: integer;
 // pos_a,pos_b:integer; //���磬����λ��
  T_matrix: array[1..250] of array[1..250] of integer;
  lie_sum: integer;  //�к�
  hang_sum: integer;
  pos_a, pos_b: array[1..250] of integer;
begin
  for a := 1 to n_guimo do
    for b := 1 to n_guimo do
      T_matrix[a, b] := 0;
  //ͨ��������ǰ����Ŀ
  for a := 1 to n_guimo do
  begin
    if jiepop[101].gongxu[a].houxu[1] <> 0 then //�к���Ÿ��¾���
    begin
      b := 1;
      repeat
        lie_sum := 0;
        for c := 1 to n_guimo do
        begin
          lie_sum := lie_sum + T_matrix[c, a];
        end;
        T_matrix[a, jiepop[101].gongxu[a].houxu[b]] := lie_sum + 1;
        b := b + 1;
      until (jiepop[101].gongxu[a].houxu[b]) = 0; //�޺���

    end;
  end;
  for a := 1 to n_guimo do
  begin
    pos_a[a] := 0;
  end;
  for a := 1 to n_guimo do
  begin
    for b := 1 to n_guimo do
    begin
      pos_a[a] := pos_a[a] + T_matrix[b, a];  //ǰ�����
    end;
  end;
  for a := 1 to 250 do
    for b := 1 to 250 do
      T_matrix[a, b] := 0;
  //ͨ��ǰ���Һ�����Ŀ
  for a := n_guimo downto 1 do
  begin
    if jiepop[101].gongxu[a].qianxu[1] <> 0 then //�к���Ÿ��¾���
    begin
      b := 1;
      repeat
        lie_sum := 0;
        for c := 1 to n_guimo do
        begin
          lie_sum := lie_sum + T_matrix[c, a];
        end;
        T_matrix[a, jiepop[101].gongxu[a].qianxu[b]] := lie_sum + 1;
        b := b + 1;
      until (jiepop[101].gongxu[a].qianxu[b]) = 0; //�޺���

    end;
  end;
  for a := 1 to n_guimo do
  begin
    pos_b[a] := 0;
  end;
  for a := 1 to n_guimo do
  begin
    for b := 1 to n_guimo do
    begin
      pos_b[a] := pos_b[a] + T_matrix[b, a];  //�������
    end;
  end;
  //��ʼ�����ʾ���
  for a := 1 to n_guimo do
    local_MATRIX[0, a] := a;
  for a := 1 to n_guimo do
    local_MATRIX[a, 0] := a;
  for a := 1 to n_guimo do  //n��
    for b := pos_a[a] + 1 to (n_guimo - pos_b[a]) do
      local_MATRIX[a, b] := 1;

end;
//�����ĳλ���ϳ���ĳ�������ά����
//���룺�����ܳ��� n_guimo    ���������������

procedure TForm1.EDAModel_initial();//��ʼ�����ʷֲ�ģ��
var
  a, b: Integer;
begin
  for a := 0 to n_guimo do   //λ��
  begin
    for b := 0 to n_guimo do   //����
    begin
      TwoMatrix[a, b] := Local_Matrix[a, b];
      init_TwoMatrix[a, b] := Local_Matrix[a, b];
    end;
  end;
  //���ݹ�������ͼ�������ܵ�λ�ñ��Ϊ0
  //ǰ�������������ȷ���ù��򲻿�������Щλ�ó���
  //�Դ˼�С���ʾ���������С
end;
//��������㹤��Լ����ֱ�ӿ���һά��
//��ʽ�����ݸ��ʾ���������� // ��ʹ�ø��ʲ���
//��Ⱥ��ģ��100��

procedure TForm1.EDAPopModel_initial();
var
  a, b, c, d: Integer;
  dir: Integer;          //��־
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //���Ȱ��Ź����б�
  numR: double;  //���̶����λ��
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
  ceshi1: integer;
label
  1, 2, 3, 4, 5, 6;
begin
  ind := 1;
  repeat
    for b := 1 to n_guimo do    //�򳤶�
    begin             //jiepop101��̬�仯   102�̶�����
      for c := 1 to n_guimo do
      begin           //�����ж��Ƿ�����ǰ��Լ��
        if Local_Matrix[c, b] <> 0 then       //=0˵���ù����ڸ�λ�ò�����
        begin         //c��ʾ����±�      //[��,��]
          d := 1;
          repeat
            if jiepop[101].gongxu[jiepop[102].gongxu[c].qianxu[d]].zhuangtai = 1 then
            begin    //��ǰ��δ����
              Local_Matrix[c, b] := 0;  //��λ������ //�ǵûָ�
              goto 3;                //��������
            end;
            d := d + 1;
          until jiepop[102].gongxu[c].qianxu[d] = 0; //�����ù��������ֱ��ǰ��
        end;
3:

      end;           //�õ�����λ�ø���������model
      begin //�ڸ��������̶�ѡ��
        psum := 0;
        e := 0;
        for d := 1 to n_guimo do
        begin
          pind[d, 1] := 0;
          pind[d, 2] := 0;
        end;
        for d := 1 to n_guimo do
        begin
          if Local_Matrix[d, b] <> 0 then
          begin
            e := e + 1;
            psum := psum + Local_Matrix[d, b];
            pind[e, 1] := pind[e - 1, 1] + Local_Matrix[d, b]; //�ۼƸ���ֵ
            pind[e, 2] := d;    //��¼���ʵ�λ��
            pind[e + 1, 2] := 0;  //�������ұ�־
          end;
        end;
        numR := Random(trunc(psum * 100)) / 100; //���������������

        e := 1;
        repeat
          if pind[e, 1] >= numR then
          begin
            jiepop[ind].gongxu[b] := jiepop[102].gongxu[trunc(Local_Matrix[trunc(pind[e, 2]), 0])];
            jiepop[101].gongxu[jiepop[ind].gongxu[b].xu].zhuangtai := 0; //���¹���״̬
            for d := 1 to n_guimo do
            begin        //����ģ�͸���
              Local_Matrix[jiepop[ind].gongxu[b].xu, d] := 0;
            end;
            goto 5;

          end;
          e := e + 1;
        until pind[e, 2] = 0;
5:

      end
    end;
    for b := 1 to n_guimo do
    begin
      for c := 1 to n_guimo do
      begin    //��ԭ����
        Local_Matrix[b, c] := TwoMatrix[b, c]; //��ʼ����
      end;
    end;
     //��ԭ���ݼ�
    jiepop[101] := jiepop[102];
    DABC_decode(ind);
    DABC_evaluate(ind);
    ind := ind + 1;
  until ind = 101;
end;

//EDA����
procedure TForm1.EDA_jiema();
var
  a, b, c: Integer;
  P_zuo: Integer;
  P_you: Integer;
  zhanfull: Integer;  //��վ����־
  Rzanman: integer;   //�ұ�һ�ηŲ��±�־
  Lzanman: integer;   //�ұ�һ�ηŲ��±�־
  duimianyueshu: Integer;  //����Լ����־   1Ϊ����Լ��
  ind: Integer;       //�����±�
  gongxu: Integer;
  L_gongxu, R_gongxu: Integer;  //����λ���±�
  matrix_line: string;
  matrix_line1: string;
  indcopy: integer;
label
  1;
label
  3; //����վ��Ŀ����Ч�⣬����
begin
  //����
  //CT:=6;
  //zhannumber:=3;
  if iteration = 0 then
  begin
    indcopy := 0; //�±�
  end;
  for ind := 1 to popsize do
  begin
    Copykexingjiepop[ind] := kexingjiepop[ind];
  end;
  for ind := 1 to n_guimo do
  begin
    kexingjiepop[ind] := kexingjiepop[101];
  end;
  for ind := 1 to popsize do //��Ⱥȫ������
  begin
    matrix_line1 := '';
    for a := 1 to n_guimo do
    begin
      matrix_line1 := matrix_line1 + ',' + inttostr(EdaFeasibleSolution[ind].gongxu[a].xu);
    end;
  //  memo1.lines.add(matrix_line1);
    P_zuo := 1;     //վ���һ
    P_you := 1;
    L_gongxu := 1;  //վ�����һ
    R_gongxu := 1;
    b := 1;
    repeat  //���ڹ���ѭ������
  //    memo1.lines.Add(matrix_line1);
      if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 0 then
      begin     //E�͹���
      //����
  //    memo1.lines.Add(inttostr(EdaFeasibleSolution[ind].gongxu[b].xu)+'�ù���ΪE��');
        if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian = kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin    //���߿������

          if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 0 then
          begin  //��һ��Ҳ��E��  //Ĭ�����
          //����
      //      memo1.lines.Add('E�ͣ�����ʱ����ͬ������ҲΪE��');
            if kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then  //����CT��
            begin    //������CT��
       //       memo1.lines.Add('E�ͣ�����ʱ����ͬ���ŵ��£����');
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1; //����λ�õ���
            end
            else   //�ŵ���һ��վ
            begin
      //        memo1.lines.Add('E�ͣ�����ʱ����ͬ����վ�Ų��£�������վֱ�ӷ�');
              P_zuo := P_zuo + 1;  //վ����
              L_gongxu := 1;     //����� 1
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1; //�±����
            end;
          end
          else    //��һ����R��
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 1 then
          begin   //ѡL��
          //����
     //     memo1.lines.Add('E�ͣ�����ʱ����ͬ������Ϊ�ң����Է����');
            if kexingjiepop[ind].youBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
      //        memo1.lines.Add('E�ͣ�����ʱ����ͬ���ŵ��£����');
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1;
            end
            else
            begin       //������վֱ�ӷ�
      //        memo1.lines.Add('E�ͣ�����ʱ����ͬ����վ�Ų��£�������վֱ�ӷ�');
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1;
            end;
          end
          else  //��һ����L��
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = -1 then
          begin   //ѡR��
            //����
     //       memo1.lines.Add('E�ͣ�����ʱ����ͬ������Ϊ���,���ұ�');
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1;
            end;
          end;
        end
        else        //�����ѵ㡿վ��Ŀ��ͬ��
if P_zuo = P_you then    //����վ��ͬһλ��
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
          begin   //�ұ߿��д�����߿��� ���ѵ㡿  //ѡ�ұ�
            //����
       //     memo1.Lines.Add('E�ͣ��ұ߿մ��ж���߹����Ƿ��Ǳ�E�Ľ���ǰ��Լ��');
            duimianyueshu := 0;  //��ʼ������ʱ��Լ��Ϊ0
            c := 1;    //�����������ǰԼ������
            repeat   //��������Ǳ������ǰԼ������
              if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu - 1] then
              begin
                duimianyueshu := 1;    //���������Լ��Ϊ1
              end;
              c := c + 1;
            until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
            if duimianyueshu = 1 then //����ʱ��Լ��
            begin
              //����
              if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
         //       memo1.Lines.Add('��Լ���ҷŵ��£��ſռ�С�����'); //��ŵ��ռ�С��һ��
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //�±����
              end
              else     //С�ռ�Ų��£����Ҳ��������
              begin
              //����
       //         memo1.Lines.Add('��Լ��С�ռ�Ų��£�վ����'); //��ŵ��ռ�С��һ��
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //�±����
              end;
            end
            else if duimianyueshu = 0 then //����ʱ�䲻Լ��
            begin
              //����
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
       //         memo1.Lines.Add('��Լ��,�ſռ���ұ�');
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                R_gongxu := R_gongxu + 1;
              end
              else
              begin
              //����
      //          memo1.Lines.Add('��Լ����ռ�Ų��£�վ����'); //��ŵ��ռ�С��һ��
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                R_gongxu := R_gongxu + 1;
              end;
            end;
          end
          else     //��߿��д����ұ�
if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian < kexingjiepop[ind].youBianzhan[P_you].zongshijian then
          begin   //ѡL��
            //����
      //      memo1.Lines.Add('E�ͣ���߿մ��ж��ұ߹����Ƿ��Ǳ�E�Ľ���ǰ��Լ��');
            duimianyueshu := 0;  //��ʼ������ʱ��Լ��Ϊ0
            c := 1;    //�����������ǰԼ������
            repeat   //��������Ǳ������ǰԼ������
              if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu - 1] then
              begin
                duimianyueshu := 1;    //���������Լ��Ϊ1
              end;
              c := c + 1;
            until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
            if duimianyueshu = 1 then //����ʱ��Լ��
            begin
            //����
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
        //        memo1.Lines.Add('��Լ��,�ŵ��£��ſռ�С�����');
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                R_gongxu := R_gongxu + 1; //�±����
              end
              else
              begin
        //        memo1.Lines.Add('��Լ��,�Ų��£�վ����');
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                R_gongxu := R_gongxu + 1; //�±����
              end;
            end
            else if duimianyueshu = 0 then  //����ʱ�䲻Լ��
            begin
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
                //����
        //        memo1.Lines.Add('��Լ�����ŵ��£��ſռ������');
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1;
              end
              else
              begin
     //           memo1.Lines.Add('��Լ�����Ų��£�վ����');
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1;
              end;
            end;
          end;
        end
        else if P_zuo > P_you then   //��߿����ұ�  //���ұ߿����ŵ��²�
        begin
      //    memo1.lines.add('���վλ����Ŀ�����ұ�');
          duimianyueshu := 0;  //��ʼ������ʱ��Լ��Ϊ0
          c := 1;    //�����������ǰԼ������
          repeat   //��������Ǳ������ǰԼ������
            if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu - 1] then
            begin
              duimianyueshu := 1;    //���������Լ��Ϊ1
            end;
            c := c + 1;
          until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
          if duimianyueshu = 1 then //����ʱ��Լ��
          begin
            //����
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
        //      memo1.Lines.Add('��Լ���ҷŵ��£��ſռ�С�����'); //��ŵ��ռ�С��һ��
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1; //�±����
            end
            else     //С�ռ�Ų��£����Ҳ��������
            begin
            //����
      //        memo1.Lines.Add('��Լ��С�ռ�Ų��£�վ����'); //��ŵ��ռ�С��һ��
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1; //�±����
            end;
          end
          else if duimianyueshu = 0 then //����ʱ�䲻Լ��
          begin
            //����
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
       //       memo1.Lines.Add('��Լ��,�ſռ���ұ�');
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1;
            end
            else
            begin
            //����
     //         memo1.Lines.Add('��Լ����ռ�Ų��£�վ����'); //��ŵ��ռ�С��һ��
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1;
            end;
          end;
        end
        else if P_zuo < P_you then   //�ұ߿������
        begin
      //    memo1.lines.add('�ұ�վλ����Ŀ�������');
          duimianyueshu := 0;  //��ʼ������ʱ��Լ��Ϊ0
          c := 1;    //�����������ǰԼ������
          repeat   //��������Ǳ������ǰԼ������
            if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu - 1] then
            begin
              duimianyueshu := 1;    //���������Լ��Ϊ1
            end;
            c := c + 1;
          until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
          if duimianyueshu = 1 then //����ʱ��Լ��
          begin
          //����
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
        //      memo1.Lines.Add('��Լ��,�ŵ��£��ſռ�С�����');
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1; //�±����
            end
            else
            begin
        //      memo1.Lines.Add('��Լ��,�Ų��£�վ����');
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              R_gongxu := R_gongxu + 1; //�±����
            end;
          end
          else if duimianyueshu = 0 then  //����ʱ�䲻Լ��
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
            begin
              //����
        //      memo1.Lines.Add('��Լ�����ŵ��£��ſռ������');
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1;
            end
            else
            begin
        //      memo1.Lines.Add('��Լ�����Ų��£�վ����');
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              L_gongxu := L_gongxu + 1;
            end;
          end;
        end;
      end
      else if EdaFeasibleSolution[ind].gongxu[b].fangxiang = -1 then  //������͹���   //���ұ��Ƿ�Լ��
      begin
      //����
    //    memo1.lines.Add(inttostr(EdaFeasibleSolution[ind].gongxu[b].xu)+'�ù���ΪL��');
        duimianyueshu := 0;  //��ʼ������ʱ��Լ��Ϊ0����
        if ((P_zuo = P_you) and (kexingjiepop[ind].youBianzhan[P_you].zongshijian > kexingjiepop[ind].youBianzhan[P_zuo].zongshijian)) or (P_zuo < P_you) then
        begin
          c := 1;    //����������Ľ���ǰԼ������
          repeat   //��������Ǳ������ǰԼ������
            if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu - 1] then
            begin
              duimianyueshu := 1;    //���������Լ��Ϊ1
            end;
            c := c + 1;
          until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
        end;
        if duimianyueshu = 1 then //����ʱ��Լ��
        begin
          begin
            if P_zuo = P_you then
            begin
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
            //    memo1.lines.Add('Լ����ͬվ������CT');
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //�±����
              end
              else
              begin
            //    memo1.lines.Add('Լ����ͬվ��������CT,������վ��ֱ�ӷ�');
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //�±����
              end;
            end
            else if P_zuo < P_you then
            begin
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
              begin
       //         memo1.lines.Add('Լ������һ��վ,����CT,�Զ������ʱ��');
                P_zuo := P_you;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //�±����
              end
              else
              begin
         //       memo1.lines.Add('Լ������һ��վ,������CT,�ٿ���һ����վ����ʱ���ұ߿���');
                P_zuo := P_you + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                L_gongxu := L_gongxu + 1; //�±����
              end;
            end
          end
        end
        else if duimianyueshu = 0 then  //����ʱ�䲻Լ��
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian < CT then
          begin
            //����
       //     memo1.lines.Add('�����ڶ���Լ��������CT');
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            L_gongxu := L_gongxu + 1;
          end
          else
          begin
        //    memo1.lines.Add('�����ڶ���Լ����������CT');
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            L_gongxu := L_gongxu + 1;
          end;
        end;
      end
      else if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 1 then     //���ұ��͹���
      begin
      //����
       // memo1.lines.Add(inttostr(EdaFeasibleSolution[ind].gongxu[b].xu)+'�ù���ΪR��');
        duimianyueshu := 0;  //��ʼ������ʱ��Լ��Ϊ0
        if ((P_zuo = P_you) and (kexingjiepop[ind].youBianzhan[P_you].zongshijian > kexingjiepop[ind].youBianzhan[P_zuo].zongshijian)) or (P_zuo > P_you) then
        begin
          c := 1;    //�����������ǰԼ������
          repeat   //��������Ǳ������ǰԼ������
            if jiepop[102].gongxu[jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c]].xu = kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu - 1] then
            begin
              duimianyueshu := 1;    //���������Լ��Ϊ1
            end;
            c := c + 1;
          until jiepop[102].gongxu[EdaFeasibleSolution[ind].gongxu[b].xu].qianxu[c] = 0;
        end;
        if duimianyueshu = 1 then //����ʱ��Լ��
        begin
          if P_zuo = P_you then
          begin
            //����
         //   memo1.lines.Add('���ڶ���Լ��');
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            R_gongxu := R_gongxu + 1; //�±����
          end
          else if P_zuo > P_you then   //վ��������
          begin
            P_you := P_zuo;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            R_gongxu := R_gongxu + 1; //�±����
          end;
        end
        else if duimianyueshu = 0 then //����ʱ�䲻Լ��
        begin
          //����
      //    memo1.lines.Add('�����ڶ���Լ��');
          kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
          R_gongxu := R_gongxu + 1; //�±����
        end;
      end;
      b := b + 1;  //��������
      if (P_you > zhanNumber) or (P_zuo > zhanNumber) then
      begin
        if iteration = 0 then
        begin
          kexingjiepop[ind] := copykexingjiepop[indcopy];
          EdaFeasibleSolution[ind] := copyEdaFeasibleSolution[indcopy];
        end
        else
        begin
          kexingjiepop[ind] := copykexingjiepop[ind];  //�滻��ԭ���Ŀ��н�
          EdaFeasibleSolution[ind] := copyEdaFeasibleSolution[ind]; //�滻��ԭ��������
        end;
        goto 3;
      end;
    until b = n_guimo + 1;  //���Ҷ��� //�����վ����
    if iteration = 0 then  //��ʼ����ʱ����һ�����м�
    begin
      indcopy := indcopy + 1;
      copykexingjiepop[indcopy] := kexingjiepop[ind];  //�滻��ԭ���Ŀ��н�
      copyEdaFeasibleSolution[indcopy] := EdaFeasibleSolution[ind];
    end;
3:

  end;  //ȫ���������
  for a := 1 to zhannumber do     //����ÿ��վ�����ʱ��
  begin
    if kexingjiepop[ind].zuobianzhan[a].zongshijian <> 0 then
    begin   //����ǿ��н�
      if kexingjiepop[ind].zuobianzhan[a].zongshijian >= kexingjiepop[ind].youbianzhan[a].zongshijian then
        kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].zuobianzhan[a].zongshijian
      else
        kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].youbianzhan[a].zongshijian;
    end;
  end;
end;
//EDA����

procedure TForm1.EDA_jiema_one(var ind: integer);
var
  a, b, c: Integer;
  P_zuo: Integer;
  P_you: Integer;
  zhanfull: Integer;  //��վ����־
  Rzanman: integer;   //�ұ�һ�ηŲ��±�־
  Lzanman: integer;   //�ұ�һ�ηŲ��±�־
  duimianyueshu: Integer;  //����Լ����־   1Ϊ����Լ��
  gongxu: Integer;
  L_gongxu, R_gongxu: Integer;  //����λ���±�
  matrix_line: string;
  matrix_line1: string;
  indcopy: integer;
  back: Integer;
  back_P_you, back_P_zuo: Integer; //������
  i: Integer;
  num: Integer;
label
  1;
label
  3; //����վ��Ŀ����Ч�⣬����
label
  2;
label
  4;
label
  5;
label
  86; //���������
begin
  jiepop[ind] := jiepop[101];
  kexingjiepop[ind] := kexingjiepop[101];    // ���
  P_zuo := 1;     //վ���һ
  P_you := 1;
  L_gongxu := 1;  //վ�����һ
  R_gongxu := 1;
  b := 1;
  repeat  //���ڹ���ѭ������
    if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 0 then
    begin     //E�͹���
      if P_zuo = P_you then    //����վ��ͬһλ��
      begin
        if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian = kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin    //���߿������
          if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 0 then
          begin  //��һ��Ҳ��E��  //Ĭ�����
            if kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then  //����CT��
            begin    //������CT��         //������
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //����λ�õ���
              goto 86;
            end
            else   //�ŵ���һ��վ
            begin           //wuwu            ������
              P_zuo := P_zuo + 1;  //վ����
              L_gongxu := 1;     //����� 1
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end;
          end
          else    //��һ����R��                ������
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 1 then
          begin   //ѡL��
          //����
            if kexingjiepop[ind].youBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin       //������վֱ�ӷ�
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end
          else  //��һ����L��               ������
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = -1 then
          begin   //ѡR��
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else                   //E��  ͬվ  ��߿����ұ�   ������
if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[P_zuo].gxset <> [] then
          begin          //ͬһվ���ұ߱���߿죬���ж�
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[P_zuo].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat
              if (kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //������Լ��ֹͣ
                if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end;
              end;
              back := back - 1;
            until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian);
            ;
            //E��  ͬվ   ��Լ��  ��ûԼ����    [������
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end
          else
          begin        //E��  ͬվ  ��Լ��  ���ұ� [����] ������
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else     //�ұ߿������                  ������
if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian < kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[P_you].gxset <> [] then
          begin    //ֱ�ӽ�E�ŵ�  ��Լ����һ��
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[P_you].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat
              if (kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin
                if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end
                else     //С�ռ�Ų��£����Ҳ��������
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end;
              end;
              back := back - 1;
            until (back = 0) or (kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian);
            ;
            //E  ��  ͬվ  ��Լ��  ûԼ����  ֱ�ӷ����  ������
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end
            else     //С�ռ�Ų��£����Ҳ��������
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end;
          end          //��Լ�����ſռ������
          else                                //������
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end
            else     //С�ռ�Ų��£����Ҳ��������
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end;
          end;
        end
      end
      else if P_zuo > P_you then   //��߿����ұ�  //���ұ߿����ŵ��²�
      begin
        back_P_zuo := P_zuo;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin // ��һ��վ ����Ҫ���ǰ��**
            begin
              if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1; //�±����
                goto 86;
              end
              else     //С�ռ�Ų��£����Ҳ��������
              begin
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1; //�±����
                goto 86;
              end;
            end;
          end;
          back_P_zuo := back_P_zuo - 1;
        until P_you = back_P_zuo;   //ֱ�����ҵ�ͬվ  ͬվ��������  ��ֹ׼��һ��
                 //ͬһվ                       ������
        if kexingjiepop[ind].zuoBianzhan[back_P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat
              if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //������Լ��ֹͣ
                if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end;
              end;
              back := back - 1;
            until kexingjiepop[ind].zuoBianzhan[back_P_you].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            //E��  ͬվ   ��Լ��  ��ûԼ����       ������
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end
          else
          begin
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else
        begin        //E��  ͬվ  ��Լ��  ���ұ� [����]������
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1;
            goto 86;
          end;
        end;
      end
      else if P_zuo < P_you then   //�ұ߿������    //�ұ���Լ��  ���ұ�  //û��Լ�������
      begin
        back_P_you := P_you;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin                //��һ��վ  ����Ҫ���ǰ��
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1; //�±����
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1; //�±����
              goto 86;
            end;
          end;
          back_P_you := back_P_you - 1;
        until P_zuo = back_P_you;   //ֱ�����ҵ�ͬվ  ͬվ��������  ��ֹ׼��һ��
               //ͬһվ                           ������
        if kexingjiepop[ind].youBianzhan[back_P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin    //ֱ�ӽ�E�ŵ�  ��Լ����һ��
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin
                if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end
                else     //С�ռ�Ų��£����Ҳ��������
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end;
              end;
              back := back - 1;
            until kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu - 1];
            ;
            //E  ��  ͬվ  ��Լ��  ûԼ����  ֱ�ӷ����
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end
            else     //С�ռ�Ų��£����Ҳ��������
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end;
          end          //��Լ�����ſռ������
          else
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end
            else     //С�ռ�Ų��£����Ҳ��������
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end;
          end;
        end
        else
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1; //�±����
            goto 86;
          end
          else     //С�ռ�Ų��£����Ҳ��������
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1; //�±����
            goto 86;
          end;
        end;
      end
    end
    else                                //����
if EdaFeasibleSolution[ind].gongxu[b].fangxiang = -1 then  //������͹���   //���ұ��Ƿ�Լ��
    begin
      if (P_zuo = P_you) and (kexingjiepop[ind].youBianzhan[P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian) then
      begin          //ͬһվ���ұ߱���߿죬���ж�    ������
        if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[P_you].gxset <> [] then
        begin
          num := 0;
          for i in kexingjiepop[ind].youBianzhan[P_you].gxset do
            Inc(num); //�����ұ߹���ĸ���
          back := num;  //��ǰ����
          repeat
            if (kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //������Լ��ֹͣ
              if kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1; //�±����
                goto 86;
              end
              else
              begin
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1; //�±����
                goto 86;
              end;
            end;
            back := back - 1;                          //�����ҵ��ұ߱������ֹͣ
          until kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          //������Լ��  ֱ�ӷ����                  ������
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end;
        end   //����
        else      //������ǰ��  ͬվ  ֱ�ӷ�  ���
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end;
        end;
      end
      else if (P_zuo < P_you) then
      begin
        back_P_you := P_you;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat      //������Ϊ��,����ǰ��,����Լ��
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //������Լ��ֹͣ
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  P_zuo := back_P_you;  //ֱ�Ӹ���  ��ճ�����
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  P_zuo := back_P_you + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end;
              end;
              back := back - 1;
            until back = 0;     //�Ȳ��ҿ��վ
          end;
          back_P_you := back_P_you - 1;
        until P_zuo = back_P_you;   //ֱ�����ҵ�ͬվ  ͬվ��������  ��ֹ׼��һ��

        if kexingjiepop[ind].youBianzhan[back_P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian then
        begin          //ͬһվ���ұ߱���߿죬���ж�
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //������Լ��ֹͣ
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end;
              end;
              back := back - 1;                          //�����ҵ��ұ߱������ֹͣ
            until kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            //��Լ��  ֱ�ӷ����
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end
          else     //��ǰ��  ֱ�ӷ�
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else     //ǰ����  ������  ֱ�ӷ����
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end;
        end;
      end
      else  //�Ǿ�û��ǰ��Լ��
      begin                   //wuwu    ������
        if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
        begin
          kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          L_gongxu := L_gongxu + 1;
          goto 86;
        end
        else
        begin
          P_zuo := P_zuo + 1;
          L_gongxu := 1;
          kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          L_gongxu := L_gongxu + 1;
          goto 86;
        end;
      end;
    end
    else if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 1 then     //���ұ��͹���
    begin
      if (P_zuo = P_you) and (kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian) then
      begin
        if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[P_zuo].gxset <> [] then
        begin
          num := 0;
          for i in kexingjiepop[ind].zuoBianzhan[P_zuo].gxset do
            Inc(num); //���㹤��ĸ���
          back := num;  //��ǰ����
          repeat
            if (kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //������Լ��ֹͣ
              if kexingjiepop[ind].ZUOBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //�±����
                goto 86;
              end
              else
              begin
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //�±����
                goto 86;
              end;
            end;
            back := back - 1;                          //�����ҵ��ұ߱������ֹͣ
          until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu - 1]);
          // ��ǰ��  ��Լ��  ֱ�ӷ��ұ�
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin                 //wuwu
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end;
        end
        else     //��Լ��
        begin
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin                 //wuwu
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end;
        end;
      end
      else if (P_you < P_zuo) then
      begin
        back_P_zuo := P_zuo;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat      //������Ϊ��,����ǰ��,����Լ�� //����
              if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //������Լ��ֹͣ
                P_you := back_P_zuo;
                R_gongxu := 1;
                if kexingjiepop[ind].ZUOBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end;
              end;
              back := back - 1;
            until back = 0;     //�Ȳ��ҿ��վ
          end;
          back_P_zuo := back_P_zuo - 1;
        until P_you = back_P_zuo;   //ֱ�����ҵ�ͬվ  ͬվ��������  ��ֹ׼��һ��
        if kexingjiepop[ind].zuoBianzhan[back_P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin          //ͬһվ���ұ߱���߿죬���ж�
          num := 0;
          for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
            Inc(num); //�����ұ߹���ĸ���
          back := num;  //��ǰ����
          repeat
            if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //������Լ��ֹͣ
              if kexingjiepop[ind].ZUOBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //�±����
                goto 86;
              end
              else
              begin
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //�±����
                goto 86;
              end;
            end;
            back := back - 1;                          //�����ҵ��ұ߱������ֹͣ
          until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian);
          //��ǰ��  ��Լ��  ֱ�ӷ�
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end;
        end
        else
        begin
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end;
        end;
      end
      else         //������
      begin
        if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
        begin
          kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
          R_gongxu := R_gongxu + 1; //�±����
          goto 86;
        end
        else
        begin
          P_you := P_you + 1;
          ;
          R_gongxu := 1;
          kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
          R_gongxu := R_gongxu + 1; //�±����
          goto 86;
        end;
      end;
    end;
86:
    b := b + 1;  //��������
    erro_x := 0;
    if (P_you > zhanNumber) or (P_zuo > zhanNumber) then
    begin       //����������
      bad_matrix();
      erro_x := 1;
      goto 3;
    end;
  until b = n_guimo + 1;  //���Ҷ��� //�����վ����
  for a := 1 to zhannumber do  //����ɹ� ����û��վ���깤ʱ��
  begin
    if (kexingjiepop[ind].zuobianzhan[a].zongshijian >= kexingjiepop[ind].youbianzhan[a].zongshijian) then
      kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].zuobianzhan[a].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].youbianzhan[a].zongshijian;
  end;
3:  //������������ɹ�

end;
//EDA����

procedure TForm1.EDA_decode_dir(var ind: integer);
var
  a, b, c: Integer;
  P_zuo: Integer;
  P_you: Integer;
  zhanfull: Integer;  //��վ����־
  Rzanman: integer;   //�ұ�һ�ηŲ��±�־
  Lzanman: integer;   //�ұ�һ�ηŲ��±�־
  duimianyueshu: Integer;  //����Լ����־   1Ϊ����Լ��
  gongxu: Integer;
  L_gongxu, R_gongxu: Integer;  //����λ���±�
  matrix_line: string;
  matrix_line1: string;
  indcopy: integer;
  back: Integer;
  back_P_you, back_P_zuo: Integer; //������
  i: Integer;
  num: Integer;
label
  1;
label
  3; //����վ��Ŀ����Ч�⣬����
label
  2;
label
  4;
label
  5;
label
  86; //���������
begin

  kexingjiepop[ind] := kexingjiepop[101];    // ���
  P_zuo := 1;     //վ���һ
  P_you := 1;
  L_gongxu := 1;  //վ�����һ
  R_gongxu := 1;
  b := 1;
  repeat  //���ڹ���ѭ������
    if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 0 then
    begin     //E�͹���
      if (P_zuo = P_you) and (P_you <> zhannumber) then    //����վ��ͬһλ��
      begin
        if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian = kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin    //���߿������    ����Ϊ��һ����Լ���Ķ��棬���Լ����ͬһ�ߡ�
          if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 0 then
          begin  //��һ��Ҳ��E��  //Ĭ�����
            if kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then  //����CT��
            begin    //������CT��         //������
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //����λ�õ���
              goto 86;
            end
            else   //�ŵ���һ��վ
            begin           //wuwu            ������
              P_zuo := P_zuo + 1;  //վ����
              L_gongxu := 1;     //����� 1
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end;
          end
          else    //��һ����R��(�������ǰ��Լ���ɷŶ���)  ���Ѹġ�              ������
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = 1 then
          begin   //ѡL��
          //����
            if not EdaFeasibleSolution[ind].gongxu[b].xu in gongxuset[EdaFeasibleSolution[ind].gongxu[b + 1].xu].aset then
            begin
              if kexingjiepop[ind].youBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1;
                goto 86;
              end
              else
              begin       //������վֱ�ӷ�
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1;
                goto 86;
              end;
            end
            else  //�����Ǳ�����ĺ���Լ��
            begin
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1;
                goto 86;
              end
              else
              begin
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1;
                goto 86;
              end;
            end;
          end
          else  //��һ����L��               ������
if EdaFeasibleSolution[ind].gongxu[b + 1].fangxiang = -1 then
          begin   //ѡR��
            if not EdaFeasibleSolution[ind].gongxu[b].xu in gongxuset[EdaFeasibleSolution[ind].gongxu[b + 1].xu].aset then
            begin
              if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1;
                goto 86;
              end
              else
              begin
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1;
                goto 86;
              end;
            end
            else
            begin
              if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1;
                goto 86;
              end
              else
              begin       //������վֱ�ӷ�
                P_zuo := P_zuo + 1;
                L_gongxu := 1;
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1;
                goto 86;
              end;
            end;
          end;
        end
        else                   //E��  ͬվ  ��߿����ұ�  ��ֱ�ӷŵ��ռ��һ�ߣ���ʱ����ϵ��϶�� ������
if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[P_zuo].gxset <> [] then
          begin          //ͬһվ���ұ߱���߿죬���ж�
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[P_zuo].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat                       // ����Ϊ�ұߡ�
              if (kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //������Լ��ֹͣ
                if kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1;
                  goto 86;
                end;
              end;
              back := back - 1;
            until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian);
            //E��  ͬվ   ��Լ��  ��ûԼ����    [������
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end
          else
          begin        //E��  ͬվ  ��Լ��  ���ұ� [����] ������
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else     //�ұ߿������    ������ߡ�              ������
if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian < kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[P_you].gxset <> [] then
          begin    //ֱ�ӽ�E�ŵ�  ��Լ����һ��
            num := 0;                     // ���ġ�
            for i in kexingjiepop[ind].youBianzhan[P_you].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat
              if (kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin
                if kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end
                else     //С�ռ�Ų��£����Ҳ��������
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1;
                  goto 86;
                end;
              end;
              back := back - 1;
            until (back = 0) or (kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian);
            ;
            //E  ��  ͬվ  ��Լ��  ûԼ����  ֱ�ӷ����  ������
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end
            else     //С�ռ�Ų��£����Ҳ��������
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end;
          end          //��Լ�����ſռ������
          else                                //������
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end
            else     //С�ռ�Ų��£����Ҳ��������
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end;
          end;
        end
      end
      else if (P_zuo > P_you) then   //��߿����ұ�  //���ұ߿����ŵ��²�
      begin
        back_P_zuo := P_zuo;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin          //ͬһվ���ұ߱���߿죬���ж�
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat                       // ����Ϊ�ұߡ�
              if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //������Լ��ֹͣ
                if kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  P_you := back_P_zuo;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  if (back_P_zuo <> zhannumber) then
                  begin
                    P_you := back_P_zuo + 1;
                    R_gongxu := 1;
                    kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                    R_gongxu := R_gongxu + 1;
                    goto 86;
                  end
                  else   //���һվԼ���ַŲ��¡�3.21��
                  begin
                    P_you := back_P_zuo;
                    R_gongxu := 1;
                    kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                    R_gongxu := R_gongxu + 1; //�±����
                    goto 86;
                  end;
                end;
              end;
              back := back - 1;
            until (back = 0);
            ;  //��******ò�Ʋ���****��
          end;
          back_P_zuo := back_P_zuo - 1;
        until P_you = back_P_zuo;   //ֱ�����ҵ�ͬվ  ͬվ��������  ��ֹ׼��һ��
                 //ͬһվ                       ������
        if kexingjiepop[ind].zuoBianzhan[back_P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat
              if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //������Լ��ֹͣ
                if kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1;
                  goto 86;
                end;
              end;
              back := back - 1;
            until kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            //E��  ͬվ   ��Լ��  ��ûԼ����       ������
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end
          else
          begin
            if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_you := P_you + 1;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else
        begin        //E��  ͬվ  ��Լ��  ���ұ� [����]������
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1;
            goto 86;
          end;
        end;
      end
      else if P_zuo < P_you then   //�ұ߿������    //�ұ���Լ��  ���ұ�  //û��Լ�������
      begin
        back_P_you := P_you;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin    //ֱ�ӽ�E�ŵ�  ��Լ����һ��
            num := 0;                     // ���ġ�
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin
                P_zuo := back_P_you;
                L_gongxu := 1;
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end
                else     //С�ռ�Ų��£����Ҳ��������
                begin
                  if P_zuo <> zhannumber then
                  begin
                    P_zuo := P_zuo + 1;
                    L_gongxu := 1;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                    L_gongxu := L_gongxu + 1;
                    goto 86;
                  end
                  else
                  begin
                    kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                    L_gongxu := L_gongxu + 1; //�±����
                    goto 86;
                  end;
                end;
              end;
              back := back - 1;
            until (back = 0); //��****ò�Ʋ���**��
          end;          //��Լ�����ſռ������
          back_P_you := back_P_you - 1;
        until P_zuo = back_P_you;   //ֱ�����ҵ�ͬվ  ͬվ��������  ��ֹ׼��һ��
               //ͬһվ                           ������
        if kexingjiepop[ind].youBianzhan[back_P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian then
        begin
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin    //ֱ�ӽ�E�ŵ�  ��Լ����һ��
            num := 0;                     // ���ġ�
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].ZUOBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end
                else     //С�ռ�Ų��£����Ҳ��������
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1;
                  goto 86;
                end;
              end;
              back := back - 1;
            until (back = 0) or (kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian);
            ;
            //E  ��  ͬվ  ��Լ��  ûԼ����  ֱ�ӷ����  ������
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end
            else     //С�ռ�Ų��£����Ҳ��������
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end;
          end          //��Լ�����ſռ������
          else
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end
            else     //С�ռ�Ų��£����Ҳ��������
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1; //�±����
              goto 86;
            end;
          end;
        end
        else
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1; //�±����
            goto 86;
          end
          else     //С�ռ�Ų��£����Ҳ��������
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1; //�±����
            goto 86;
          end;
        end;
      end
    end
    else                                //����
if EdaFeasibleSolution[ind].gongxu[b].fangxiang = -1 then  //������͹���   //���ұ��Ƿ�Լ��
    begin
      if (P_zuo = P_you) and (kexingjiepop[ind].youBianzhan[P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian) then
      begin          //ͬһվ���ұ߱���߿죬���ж�    ������
        if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[P_you].gxset <> [] then
        begin
          num := 0;
          for i in kexingjiepop[ind].youBianzhan[P_you].gxset do
            Inc(num); //�����ұ߹���ĸ���
          back := num;  //��ǰ����
          repeat
            if (kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //������Լ��ֹͣ
              if kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                L_gongxu := L_gongxu + 1; //�±����
                goto 86;
              end
              else
              begin
                if P_zuo <> ZHANNUMBER then
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end;
              end;
            end;
            back := back - 1;                          //�����ҵ��ұ߱������ֹͣ
          until kexingjiepop[ind].youBianzhan[P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          //������Լ��  ֱ�ӷ����                  ������
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            if P_zuo <> ZHANNUMBER then
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end;
        end   //����
        else      //������ǰ��  ͬվ  ֱ�ӷ�  ���
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            if P_zuo <> ZHANNUMBER then
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end;
        end;
      end
      else if (P_zuo < P_you) then
      begin
        back_P_you := P_you;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat      //������Ϊ��,����ǰ��,����Լ��
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //������Լ��ֹͣ
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  P_zuo := back_P_you;  //ֱ�Ӹ���  ��ճ�����
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  if back_P_you <> zhannumber then
                  begin
                    P_zuo := back_P_you + 1;
                    L_gongxu := 1;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                    L_gongxu := L_gongxu + 1; //�±����
                    goto 86;
                  end
                  else
                  begin
                    P_zuo := back_P_you;  //ֱ�Ӹ���  ��ճ�����
                    L_gongxu := 1;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                    L_gongxu := L_gongxu + 1; //�±����
                    goto 86;
                  end;
                end;
              end;
              back := back - 1;
            until back = 0;     //�Ȳ��ҿ��վ
          end;
          back_P_you := back_P_you - 1;
        until P_zuo = back_P_you;   //ֱ�����ҵ�ͬվ  ͬվ��������  ��ֹ׼��һ��

        if kexingjiepop[ind].youBianzhan[back_P_you].zongshijian > kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian then
        begin          //ͬһվ���ұ߱���߿죬���ж�
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].youBianzhan[back_P_you].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].youBianzhan[back_P_you].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat
              if (kexingjiepop[ind].youBianzhan[back_P_you].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //������Լ��ֹͣ
                if kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  P_zuo := P_zuo + 1;
                  L_gongxu := 1;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
                  L_gongxu := L_gongxu + 1; //�±����
                  goto 86;
                end;
              end;
              back := back - 1;                          //�����ҵ��ұ߱������ֹͣ
            until kexingjiepop[ind].youBianzhan[back_P_you].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            //��Լ��  ֱ�ӷ����
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end
          else     //��ǰ��  ֱ�ӷ�
          begin
            if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
            begin
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end
            else
            begin
              P_zuo := P_zuo + 1;
              L_gongxu := 1;
              kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
              L_gongxu := L_gongxu + 1;
              goto 86;
            end;
          end;
        end
        else     //ǰ����  ������  ֱ�ӷ����
        begin
          if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end
          else
          begin
            P_zuo := P_zuo + 1;
            L_gongxu := 1;
            kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
            L_gongxu := L_gongxu + 1;
            goto 86;
          end;
        end;
      end
      else  //�Ǿ�û��ǰ��Լ��
      begin                   //wuwu    ������
        if kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
        begin
          kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          L_gongxu := L_gongxu + 1;
          goto 86;
        end
        else
        begin
          P_zuo := P_zuo + 1;
          L_gongxu := 1;
          kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[L_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxset := kexingjiepop[ind].zuoBianzhan[P_zuo].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[L_gongxu] := kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian;
          L_gongxu := L_gongxu + 1;
          goto 86;
        end;
      end;
    end
    else if EdaFeasibleSolution[ind].gongxu[b].fangxiang = 1 then     //���ұ��͹���
    begin
      if (P_zuo = P_you) and (kexingjiepop[ind].zuoBianzhan[P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian) then
      begin
        if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[P_zuo].gxset <> [] then
        begin
          num := 0;
          for i in kexingjiepop[ind].zuoBianzhan[P_zuo].gxset do
            Inc(num); //���㹤��ĸ���
          back := num;  //��ǰ����
          repeat
            if (kexingjiepop[ind].zuoBianzhan[P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //������Լ��ֹͣ
              if kexingjiepop[ind].ZUOBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //�±����
                goto 86;
              end
              else
              begin
                if P_you <> zhannumber then
                begin
                  P_you := P_you + 1;
                  R_gongxu := 1;
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end;
              end;
            end;
            back := back - 1;                          //�����ҵ��ұ߱������ֹͣ
          until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu - 1]);
          // ��ǰ��  ��Լ��  ֱ�ӷ��ұ�
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin                 //wuwu
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end
          else
          begin

            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end;
        end
        else     //��Լ��
        begin
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin                 //wuwu
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end
          else
          begin
            if P_you <> zhannumber then
            begin
              P_you := P_you + 1;
              ;
              R_gongxu := 1;
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1; //�±����
              goto 86;
            end
            else
            begin
              kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
              kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
              kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
              kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
              R_gongxu := R_gongxu + 1; //�±����
              goto 86;
            end;
          end;
        end;
      end
      else if (P_you < P_zuo) then
      begin
        back_P_zuo := P_zuo;
        repeat
          if gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset * kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset <> [] then
          begin
            num := 0;
            for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
              Inc(num); //�����ұ߹���ĸ���
            back := num;  //��ǰ����
            repeat      //������Ϊ��,����ǰ��,����Լ�� //����
              if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
              begin                 //������Լ��ֹͣ
                P_you := back_P_zuo;
                R_gongxu := 1;
                if kexingjiepop[ind].ZUOBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
                begin
                  kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                  kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                  kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                  R_gongxu := R_gongxu + 1; //�±����
                  goto 86;
                end
                else
                begin
                  if P_you <> zhannumber then
                  begin
                    P_you := P_you + 1;
                    R_gongxu := 1;
                    kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                    R_gongxu := R_gongxu + 1; //�±����
                    goto 86;
                  end
                  else
                  begin
                    kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                    kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                    kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                    kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                    R_gongxu := R_gongxu + 1; //�±����
                    goto 86;
                  end;
                end;
              end;
              back := back - 1;
            until back = 0;     //�Ȳ��ҿ��վ
          end;
          back_P_zuo := back_P_zuo - 1;
        until P_you = back_P_zuo;   //ֱ�����ҵ�ͬվ  ͬվ��������  ��ֹ׼��һ��
        if kexingjiepop[ind].zuoBianzhan[back_P_zuo].zongshijian > kexingjiepop[ind].youBianzhan[P_you].zongshijian then
        begin          //ͬһվ���ұ߱���߿죬���ж�
          num := 0;
          for i in kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxset do
            Inc(num); //�����ұ߹���ĸ���
          back := num;  //��ǰ����
          repeat
            if (kexingjiepop[ind].zuoBianzhan[back_P_zuo].kexingGongxu[back] in gongxuset[EdaFeasibleSolution[ind].gongxu[b].xu].aset) then
            begin                 //������Լ��ֹͣ
              if kexingjiepop[ind].ZUOBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
              begin
                kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := kexingjiepop[ind].zuoBianzhan[back_P_zuo].gxEndTime[back] + EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //�±����
                goto 86;
              end
              else
              begin
                P_you := P_you + 1;
                R_gongxu := 1;
                kexingjiepop[ind].YOUBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
                kexingjiepop[ind].YOUBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
                kexingjiepop[ind].YOUBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
                kexingjiepop[ind].YOUBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
                R_gongxu := R_gongxu + 1; //�±����
                goto 86;
              end;
            end;
            back := back - 1;                          //�����ҵ��ұ߱������ֹͣ
          until (back = 0) or (kexingjiepop[ind].zuoBianzhan[P_zuo].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[P_you].zongshijian);
          //��ǰ��  ��Լ��  ֱ�ӷ�
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end;
        end
        else
        begin
          if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
          begin
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end
          else
          begin
            P_you := P_you + 1;
            ;
            R_gongxu := 1;
            kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
            kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
            kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
            kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
            R_gongxu := R_gongxu + 1; //�±����
            goto 86;
          end;
        end;
      end
      else         //������
      begin
        if kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian <= CT then
        begin
          kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].youBianzhan[P_you].zongshijian := kexingjiepop[ind].youBianzhan[P_you].zongshijian + EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
          R_gongxu := R_gongxu + 1; //�±����
          goto 86;
        end
        else
        begin
          P_you := P_you + 1;
          ;
          R_gongxu := 1;
          kexingjiepop[ind].youBianzhan[P_you].kexingGongxu[R_gongxu] := EdaFeasibleSolution[ind].gongxu[b].xu;
          kexingjiepop[ind].youBianzhan[P_you].gxset := kexingjiepop[ind].youBianzhan[P_you].gxset + [EdaFeasibleSolution[ind].gongxu[b].xu];
          kexingjiepop[ind].youBianzhan[P_you].zongshijian := EdaFeasibleSolution[ind].gongxu[b].shijian;
          kexingjiepop[ind].youBianzhan[P_you].gxEndTime[R_gongxu] := kexingjiepop[ind].youBianzhan[P_you].zongshijian;
          R_gongxu := R_gongxu + 1; //�±����
          goto 86;
        end;
      end;
    end;
86:
    b := b + 1;  //��������
  until b = n_guimo + 1;  //���Ҷ��� //�����վ����
  for a := 1 to zhannumber do  //����ɹ� ����û��վ���깤ʱ��
  begin
    if (kexingjiepop[ind].zuobianzhan[a].zongshijian >= kexingjiepop[ind].youbianzhan[a].zongshijian) then
      kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].zuobianzhan[a].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[a].ZhanCTp := kexingjiepop[ind].youbianzhan[a].zongshijian;
  end;
3:  //������������ɹ�

end;

//CR-EDA���۲���
procedure TForm1.EDA_evaluate(var ind: Integer);
var
  b: Integer;
  MaxT: Integer; //�����ߵ����CTpʱ��
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..200] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  MaxT := 0;
  for A := 1 to zhannumber do  // ����ÿ��վ���깤ʱ��CTp
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //�������վ�깤ʱ��
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  kexingjiepop[ind].CTp := MaxT;   //�õ�һ������վ����CTp

  jiepop[ind].CTp := kexingjiepop[ind].CTp;
  //�������ڲ�̰��ѡ��
  //����վ��ʵ�ʹ���ʱ����ΪĿ����ƽ�� //����ƽ��ָ��SI
  for A := 1 to zhannumber do //����ÿ��վ��ʵ�ʹ���ʱ��
  begin
    Light[A] := 0;
    Right[A] := 0;
    b := 1;   //���
    repeat
      Light[A] := Light[A] + jiepop[299].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Light[A] > Light_max) then
    begin
      Light_max := Light[A];
    end;
    b := 1;   //�ұ�
    repeat
      Right[A] := Right[A] + jiepop[299].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Right[A] > Right_max) then
    begin
      Right_max := Right[A];
    end;
  end;
  MAX_T := Max(Light_max, Right_max);
  LSI := 0;
  for A := 1 to zhannumber do
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;
  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;
  //�����ܿ���ʱ��
  jiepop[ind].Acc_t:= zhannumber*2*MaxT-Total_process_time;
  oldjiepop[ind]:=jiepop[ind]
end;

procedure TForm1.EDA_evaluate2(var ind: integer);
var
  b: Integer;
  MaxT: Integer; //�����ߵ����CTpʱ��
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..200] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  if  Quick_evaluation_ind=0 then
  begin
    MaxT := 0;
    for A := 1 to zhannumber do  // ����ÿ��վ���깤ʱ��CTp
    begin
      if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
      else
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
    end;
    MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
    for b := 2 to zhannumber do      //�������վ�깤ʱ��
    begin
      if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
      begin
        MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
      end;
    end;
    if MaxT = 0 then
    begin
      MaxT := 0;
    end;
    kexingjiepop[ind].CTp := MaxT;   //�õ�һ������վ����CTp
    jiepop[ind].CTp := kexingjiepop[ind].CTp;
    //����SI
    for A := 1 to zhannumber do //����ÿ��վ��ʵ�ʹ���ʱ��
    begin
      Light[A] := 0;
      Right[A] := 0;
      b := 1;   //���
      repeat
        Light[A] := Light[A] + jiepop[299].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Light[A] > Light_max) then
      begin
        Light_max := Light[A];
      end;
      b := 1;   //�ұ�
      repeat
        Right[A] := Right[A] + jiepop[299].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Right[A] > Right_max) then
      begin
        Right_max := Right[A];
      end;
    end;
    MAX_T := Max(Light_max, Right_max);
    LSI := 0;
    for A := 1 to zhannumber do
    begin
      LSI := LSI + Sqr(MAX_T - Light[A]);
      LSI := LSI + Sqr(MAX_T - Right[A]);
    end;
    LSI := Sqrt((LSI) / (2 * zhannumber));
    jiepop[ind].LSI := LSI;   //�õ�SI
    //��SIΪ��������
    if (iteration > 0) and (jiepop[ind].CTp = oldjiepop[ind].CTp) then
    begin
      if jiepop[ind].LSI < oldjiepop[ind].LSI then
      begin
        oldjiepop[ind] := jiepop[ind];
        oldkexingjiepop[ind] := kexingjiepop[ind];
      end
      else
      begin
        jiepop[ind] := oldjiepop[ind];
        kexingjiepop[ind] := oldkexingjiepop[ind];
      end;
    end
    else
    if (iteration > 0) and (oldjiepop[ind].CTp <= jiepop[ind].CTp) then  //����ȥ
    begin
      jiepop[ind] := oldjiepop[ind];
      kexingjiepop[ind] := oldkexingjiepop[ind];
    end
    else   //�½����  ����old
    begin
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
    end;
  end
  else
  begin
    jiepop[ind]:=oldjiepop[ind];
    kexingjiepop[ind]:=oldkexingjiepop[ind];
  end;
end;
procedure TForm1.EDA_evaluate3(var ind: integer);
var
  b: Integer;
  MaxT: Integer; //�����ߵ����CTpʱ��
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..200] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  if Quick_evaluation=0 then //����
  begin
    MaxT := 0;
    for A := 1 to zhannumber do  // ����ÿ��վ���깤ʱ��CTp
    begin
      if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
      else
        kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
    end;
    MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
    for b := 2 to zhannumber do      //�������վ�깤ʱ��
    begin
      if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
      begin
        MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
      end;
    end;
    if MaxT = 0 then
    begin
      MaxT := 0;
    end;
    kexingjiepop[ind].CTp := MaxT;   //�õ�һ������վ����CTp
    jiepop[ind].CTp := kexingjiepop[ind].CTp;
    //����SI
    for A := 1 to zhannumber do //����ÿ��վ��ʵ�ʹ���ʱ��
    begin
      Light[A] := 0;
      Right[A] := 0;
      b := 1;   //���
      repeat
        Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Light[A] > Light_max) then
      begin
        Light_max := Light[A];
      end;
      b := 1;   //�ұ�
      repeat
        Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
        b := b + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
      if (A = 1) or (Right[A] > Right_max) then
      begin
        Right_max := Right[A];
      end;
    end;
    MAX_T := Max(Light_max, Right_max);
    LSI := 0;
    for A := 1 to zhannumber do
    begin
      LSI := LSI + Sqr(MAX_T - Light[A]);
      LSI := LSI + Sqr(MAX_T - Right[A]);
    end;
    LSI := Sqrt((LSI) / (2 * zhannumber));
    jiepop[ind].LSI := LSI;   //�õ�SI
    //��SIΪ��������
    if (iteration > 0) and (jiepop[ind].CTp = oldjiepop[ind].CTp) then
    begin
      if jiepop[ind].LSI < oldjiepop[ind].LSI then
      begin
        oldjiepop[ind] := jiepop[ind];
        oldkexingjiepop[ind] := kexingjiepop[ind];
      end
      else
      begin
        jiepop[ind] := oldjiepop[ind];
        kexingjiepop[ind] := oldkexingjiepop[ind];
      end;
    end
    else
    if (iteration > 0) and (oldjiepop[ind].CTp <= jiepop[ind].CTp) then  //����ȥ
    begin
      jiepop[ind] := oldjiepop[ind];
      kexingjiepop[ind] := oldkexingjiepop[ind];
    end
    else   //�½����  ����old
    begin
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
    end;
  end
  else
  begin
    jiepop[ind]:=oldjiepop[ind];
    kexingjiepop[ind]:=oldkexingjiepop[ind];
  end;
end;
//��EDA��Ⱥ��������С��������

procedure TForm1.EDA_maopao();
var
  i, j, k: integer;
  temp: structure_jiepop;
  temp1: structure_kexingjiePOP;
  ind: Integer;
begin
  for i := (popsize - 1) downto 1 do
  begin
    for j := 1 to i do
    begin                         //����
      if jiepop[j].CTp > jiepop[j + 1].CTp then
      begin
        temp := jiepop[j];
        jiepop[j] := jiepop[j + 1];
        jiepop[j + 1] := temp;

        temp1 := kexingjiepop[j];
        kexingjiepop[j] := kexingjiepop[j + 1];
        kexingjiepop[j + 1] := temp1;
      end;
    end;
  end;
  for ind :=1 to popsize do
  begin
    oldjiepop[ind]:=jiepop[ind];
    oldkexingjiepop[ind]:=kexingjiepop[ind];
  end;
end;

procedure TForm1.maopao_samplepop();
var
  i, j, k: integer;
  temp: structure_jiepop;
  temp1: structure_kexingjiePOP;
begin
  for i := (99) downto 1 do
  begin
    for j := 1 to i do
    begin                         //����
      if Sample_jiepop[j].CTp > Sample_jiepop[j + 1].CTp then
      begin
        temp := Sample_jiepop[j];
        Sample_jiepop[j] := Sample_jiepop[j + 1];
        Sample_jiepop[j + 1] := temp;

        temp1 := sample_kexingjiepop[j];
        sample_kexingjiepop[j] := sample_kexingjiepop[j + 1];
        sample_kexingjiepop[j + 1] := temp1;
      end;
    end;
  end;
end;
//������Ⱥǰ30%������¸���ģ��
//����ѧϰ��ʽ

procedure TForm1.EDAModel_update();
var
  a, b, c: integer;
  add: array[1..250] of array[1..250] of integer;
  ind: integer;
  xi: integer;
  x, y: integer;
  num: Integer;
begin
  for a := 1 to n_guimo do
    for b := 1 to n_guimo do
    begin
      add[a, b] := 0;
    end;           //  trunc(yita*popsize)+1
  num := 0;
  for ind := 1 to Trunc(yita * popsize) + 1 do
  begin
    if jiepop[ind].ctp <= (CT * 1.1) then
    begin
      for xi := 1 to n_guimo do      //xi��ĳλ�ó��ֵĴ���
      begin
        add[jiepop[ind].gongxu[xi].xu, xi] := add[jiepop[ind].gongxu[xi].xu, xi] + 1;
      end;
      num := num + 1;
    end;
  end;         //�����ۼƸ���ֵ
  if num > 0 then
  begin
    for x := 1 to n_guimo do
    begin
      for y := 1 to n_guimo do
      begin
        if local_matrix[x, y] <> 0 then
        begin                                                    //3��ʾ��Ӣ��Ⱥ
          local_matrix[x, y] := TRUNC(((1 - aerfa) * local_matrix[x, y] + ((aerfa * add[x, y]) / (num))) * 1000) / 1000;
          if local_matrix[x, y] = 0 then                            //yita*popsize
          begin
            local_matrix[x, y] := 0.1;
          end;
        end;
      end;
    end;
  end;
end;

//ÿ�γ�������������һ�ξ���
procedure TForm1.EDA_update_M();
var
  a, b, c: integer;
  sum_crow:array [1..250]of Double;
begin
  for a := 1 to n_guimo do  //1.�ۼƸ��к�
  begin
    sum_crow[a]:=0;
    for b := 1 to n_guimo do
    begin
      sum_crow[a]:= sum_crow[a]+ local_matrix[a,b];
    end;
  end;
  for a := 1 to n_guimo do
  begin
    local_matrix[bestjie.gongxu[a].xu,a]:=local_matrix[bestjie.gongxu[a].xu,a]+aerfa*sum_crow[a];
  end;
  for a := 1 to n_guimo do    //�ٴ��ۼ��кͣ���һ��
  begin
    sum_crow[a]:=0;
    for b := 1 to n_guimo do
    begin
      sum_crow[a]:= sum_crow[a]+ local_matrix[a,b];
    end;
  end;
  for a :=1 to n_guimo do      //��һ��
  begin
    for b := 1 to n_guimo do
    begin
      local_matrix[b,a]:= local_matrix[b,a]/sum_crow[a];
      if local_matrix[b,a]<0.0001then
      begin
        local_matrix[b,a]:=0.0001;
      end;
    end;
  end;
end;

//ÿ�γ�������������һ�ξ���
procedure TForm1.EDA_update();
var
  a, b, c: integer;
  sum_crow:array [1..250]of Double;
begin
  for a := 1 to n_guimo do  //1.�ۼƸ��к�
  begin
    sum_crow[a]:=0;
    for b := 1 to n_guimo do
    begin
      sum_crow[a]:= sum_crow[a]+ local_matrix[a,b];
    end;
  end;
  for a := 1 to n_guimo do
  begin
    local_matrix[bestjie.gongxu[a].xu,a]:=local_matrix[bestjie.gongxu[a].xu,a]+aerfa*sum_crow[a];
  end;
  for a := 1 to n_guimo do    //�ٴ��ۼ��кͣ���һ��
  begin
    sum_crow[a]:=0;
    for b := 1 to n_guimo do
    begin
      sum_crow[a]:= sum_crow[a]+ local_matrix[a,b];
    end;
  end;
  for a :=1 to n_guimo do      //��һ��
  begin
    for b := 1 to n_guimo do
    begin
      local_matrix[b,a]:= local_matrix[b,a]/sum_crow[a];
      if local_matrix[b,a]<0.0001then
      begin
        local_matrix[b,a]:=0.0001;
      end;
    end;
  end;
end;
//ģ����������Ⱥ

procedure TForm1.BAS_sample();  //�����γɳ�ʼ��Ĵ�����ͬ��
var
  a, b, c, d: Integer;
  dir: Integer;          //��־
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //���Ȱ��Ź����б�
  numR: double;  //���̶����λ��
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
label
  1, 2, 3, 4, 5, 6;
begin
  ind := 1;
  jiepop[ind] := jiepop[102];
  for b := 0 to n_guimo do   //λ��        //����ģ�ͣ���ֹ�ƻ�
  begin
    for c := 0 to n_guimo do   //����
    begin
      TwoMatrix[b, c] := Local_Matrix[b, c];
    end;
  end;

  for b := 1 to n_guimo do    //�򳤶�
  begin             //jiepop101��̬�仯   102�̶�����
    for c := 1 to n_guimo do
    begin           //�����ж��Ƿ�����ǰ��Լ��
      if Local_Matrix[c, b] <> 0 then       //=0˵���ù����ڸ�λ�ò�����
      begin         //c��ʾ����±�      //[��,��]
        d := 1;
        repeat
          if jiepop[101].gongxu[jiepop[102].gongxu[c].qianxu[d]].zhuangtai = 1 then
          begin    //��ǰ��δ����
            Local_Matrix[c, b] := 0;  //��λ������ //�ǵûָ�
            goto 3;                //��������
          end;
          d := d + 1;
        until jiepop[102].gongxu[c].qianxu[d] = 0; //�����ù��������ֱ��ǰ��
      end;
3:

    end;           //�õ�����λ�ø���������model

    begin //�ڸ��������̶�ѡ��
      psum := 0;
      e := 0;
      for d := 1 to n_guimo do
      begin
        pind[d, 1] := 0;
        pind[d, 2] := 0;
      end;
      for d := 1 to n_guimo do
      begin
        if Local_Matrix[d, b] <> 0 then
        begin
          e := e + 1;
          psum := psum + Local_Matrix[d, b];
          pind[e, 1] := pind[e - 1, 1] + Local_Matrix[d, b]; //�ۼƸ���ֵ
          pind[e, 2] := d;    //��¼���ʵ�λ��
          pind[e + 1, 2] := 0;  //�������ұ�־
        end;
      end;
      numR := (random(trunc(psum * 100)) / 100); //���������������
      e := 1;
      repeat
        if pind[e, 1] > numR then
        begin
          jiepop[ind].gongxu[b] := jiepop[102].gongxu[trunc(Local_Matrix[trunc(pind[e, 2]), 0])];
          if trunc(jiepop[ind].gongxu[b].xu) = 0 then
          begin
            memo1.lines.add('�������Ϊ0');
          end;
          jiepop[101].gongxu[jiepop[ind].gongxu[b].xu].zhuangtai := 0; //���¹���״̬
          for d := 1 to n_guimo do
          begin        //����ģ�͸���
            Local_Matrix[trunc(Local_Matrix[trunc(pind[e, 2]), 0]), d] := 0;
          end;
          goto 5;
        end;
        e := e + 1;
      until pind[e, 2] = 0;
5:

    end;
  end;
  for b := 1 to n_guimo do
  begin
    for c := 1 to n_guimo do
    begin    //��ԭ����
      Local_Matrix[b, c] := TwoMatrix[b, c];
    end;
  end;
   //��ԭ���ݼ�
  jiepop[101] := jiepop[102];
end;
//ģ����������Ⱥ

procedure TForm1.EDAModeL_sample();  //�����γɳ�ʼ��Ĵ�����ͬ��
var
  a, b, c, d: Integer;
  dir: Integer;          //��־
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //���Ȱ��Ź����б�
  numR: double;  //���̶����λ��
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
label
  1, 2, 3, 4, 5, 6;
begin
  ind := 1;  //1-100ȫ����������
  repeat
    jiepop[ind] := jiepop[102];
    oldjiepop[ind] := jiepop[102];
    for b := 0 to n_guimo do   //λ��        //����ģ�ͣ���ֹ�ƻ�
    begin
      for c := 0 to n_guimo do   //����
      begin
        TwoMatrix[b, c] := Local_Matrix[b, c];
      end;
    end;

    for b := 1 to n_guimo do    //�򳤶�
    begin             //jiepop101��̬�仯   102�̶�����
      for c := 1 to n_guimo do
      begin           //�����ж��Ƿ�����ǰ��Լ��
        if Local_Matrix[c, b] <> 0 then       //=0˵���ù����ڸ�λ�ò�����
        begin         //c��ʾ����±�      //[��,��]
          d := 1;
          repeat
            if jiepop[101].gongxu[jiepop[102].gongxu[c].qianxu[d]].zhuangtai = 1 then
            begin    //��ǰ��δ����
              Local_Matrix[c, b] := 0;  //��λ������ //�ǵûָ�
              goto 3;                //��������
            end;
            d := d + 1;
          until jiepop[102].gongxu[c].qianxu[d] = 0; //�����ù��������ֱ��ǰ��
        end;
3:

      end;           //�õ�����λ�ø���������model

      begin //�ڸ��������̶�ѡ��
        psum := 0;
        e := 0;
        for d := 1 to n_guimo do
        begin
          pind[d, 1] := 0;
          pind[d, 2] := 0;
        end;
        for d := 1 to n_guimo do
        begin
          if Local_Matrix[d, b] <> 0 then
          begin
            e := e + 1;
            psum := psum + Local_Matrix[d, b];
            pind[e, 1] := pind[e - 1, 1] + Local_Matrix[d, b]; //�ۼƸ���ֵ
            pind[e, 2] := d;    //��¼���ʵ�λ��
            pind[e + 1, 2] := 0;  //�������ұ�־
          end;
        end;
        numR := (random(trunc(psum * 100)) / 100); //���������������
        e := 1;
        repeat
          if pind[e, 1] > numR then
          begin
            jiepop[ind].gongxu[b] := jiepop[102].gongxu[trunc(Local_Matrix[trunc(pind[e, 2]), 0])];
            if trunc(jiepop[ind].gongxu[b].xu) = 0 then
            begin
              memo1.lines.add('�������Ϊ0');
            end;
            jiepop[101].gongxu[jiepop[ind].gongxu[b].xu].zhuangtai := 0; //���¹���״̬
            for d := 1 to n_guimo do
            begin        //����ģ�͸���
              Local_Matrix[trunc(Local_Matrix[trunc(pind[e, 2]), 0]), d] := 0;
            end;
            goto 5;
          end;
          e := e + 1;
        until pind[e, 2] = 0;
5:

      end;
    end;

    DABC_decode(ind);
    DABC_evaluate(ind);

    ind := ind + 1;
    for b := 1 to n_guimo do
    begin
      for c := 1 to n_guimo do
      begin    //��ԭ����
        Local_Matrix[b, c] := TwoMatrix[b, c];
      end;
    end;
     //��ԭ���ݼ�
    jiepop[101] := jiepop[102];

  until ind = popsize + 1;

end;
//�����ǹ��������ֱ�Ӳ���

procedure TForm1.EDA1_sample();
var
  a, b, c, d: Integer;
  dir: Integer;          //��־
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //���Ȱ��Ź����б�
  numR: double;  //���̶����λ��
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
label
  1, 2, 3, 4, 5, 6;
begin
  ind := 1;  //1-100ȫ����������
  repeat
    jiepop[ind] := jiepop[197];    //���
    oldjiepop[ind] := jiepop[197];  //���
    for b := 0 to n_guimo do   //����  λ�þ���
    begin
      for c := 0 to n_guimo do   //����
      begin
        TwoMatrix[b, c] := Local_Matrix[b, c];
      end;
    end;

    for b := 1 to n_guimo do    //�򳤶�
    begin             //jiepop200��̬�仯   199�̶�����
      begin //�ڸ��������̶�ѡ��
        psum := 0;
        e := 0;
        for d := 1 to n_guimo do
        begin
          pind[d, 1] := 0;
          pind[d, 2] := 0;
        end;
        for d := 1 to n_guimo do
        begin
          if Local_Matrix[d, b] <> 0 then
          begin
            e := e + 1;
            psum := psum + Local_Matrix[d, b];
            if e > 1 then
            begin
              pind[e, 1] := pind[e - 1, 1] + Local_Matrix[d, b]; //�ۼƸ���ֵ
            end
            else if e = 1 then
            begin
              pind[e, 1] := Local_Matrix[d, b];
            end;
            pind[e, 2] := d;    //��¼���ʵ�λ��
            pind[e + 1, 2] := 0;  //�������ұ�־
          end;
        end;
        numR := RandomRange(0, trunc(psum * 100)) / 100; //���������������

        e := 1;
        repeat
          if (pind[e, 1] > numR) then
          begin
            jiepop[ind].gongxu[b] := jiepop[199].gongxu[trunc(Local_Matrix[trunc(pind[e, 2]), 0])];
            if (jiepop[ind].gongxu[b].xu) = 0 then
            begin
              memo1.lines.add('�������Ϊ0');
            end;
            jiepop[200].gongxu[jiepop[ind].gongxu[b].xu].zhuangtai := 0; //���¹���״̬
            for d := 1 to n_guimo do
            begin        //����ģ�͸���  //ѡ���������
              Local_Matrix[trunc(Local_Matrix[trunc(pind[e, 2]), 0]), d] := 0;
            end;
            goto 5;
          end;
          e := e + 1;
        until pind[e, 2] = 0;
5:

      end;
    end;

    DABC_decode(ind);
    EDA_evaluate(ind);

    ind := ind + 1;
    for b := 1 to n_guimo do
    begin
      for c := 1 to n_guimo do
      begin    //��ԭ����
        Local_Matrix[b, c] := TwoMatrix[b, c];
      end;
    end;
     //��ԭ���ݼ�
    jiepop[200] := jiepop[199];

  until ind = popsize + 1;
end;
//���ݹ�ϵ���������¸���
//ѡ�����+��ϵ����

procedure TForm1.EDA_sample();
var
  a, b, c, d: Integer;
  dir: Integer;          //��־
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //���Ȱ��Ź����б�
  numR: double;  //���̶����λ��
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
  maxT,big_ind:Integer;
  min:Integer;
label
  1, 2, 3, 4, 5, 6,7,8;
begin
  ind := 1; //��1��popȫ���滻
  repeat
    jiepop[ind] := jiepop[297];    //���
    oldjiepop[ind] := jiepop[297];  //���
    for b := 0 to n_guimo do   //����  λ�þ���
    begin
      for c := 0 to n_guimo do   //����
      begin
        TwoMatrix[b, c] := Local_Matrix[b, c];
      end;
    end;
    for b := 1 to n_guimo do    //�򳤶�
    begin             //jiepop200��̬�仯   199�̶�����
      for c := 1 to n_guimo do
      begin           //�����ж��Ƿ�����ǰ��Լ��
        if Local_Matrix[c, b] <> 0 then       //=0˵���ù����ڸ�λ�ò�����
        begin         //c��ʾ����±�      //[��,��]
          d := 1;
          repeat
            if jiepop[300].gongxu[jiepop[299].gongxu[c].qianxu[d]].zhuangtai = 1 then
            begin    //��ǰ��δ����
              Local_Matrix[c, b] := 0;  //��λ������ //�ǵûָ�
              goto 3;                //��������
            end;
            d := d + 1;
          until jiepop[299].gongxu[c].qianxu[d] = 0; //�����ù��������ֱ��ǰ��
        end;
  3:
      end;           //�õ�����λ�ø���������model
      begin //�ڸ��������̶�ѡ��
        psum := 0;
        e := 0;
        for d := 1 to n_guimo do
        begin
          pind[d, 1] := 0;
          pind[d, 2] := 0;
        end;
        for d := 1 to n_guimo do
        begin
          if Local_Matrix[d, b] <> 0 then
          begin
            e := e + 1;
            psum := psum + Local_Matrix[d, b];
            if e > 1 then
            begin
              pind[e, 1] := pind[e - 1, 1] + Local_Matrix[d, b]; //�ۼƸ���ֵ
            end
            else if e = 1 then
            begin
              pind[e, 1] := Local_Matrix[d, b];
            end;
            pind[e, 2] := d;    //��¼���ʵ�λ��
            pind[e + 1, 2] := 0;  //�������ұ�־
          end;
        end;
        numR := RandomRange(0, trunc(psum * 100)) / 100; //���������������
        e := 1;
        repeat
          if (pind[e, 1] > numR) then
          begin
            jiepop[ind].gongxu[b] := jiepop[299].gongxu[trunc(Local_Matrix[trunc(pind[e, 2]), 0])];
            if (jiepop[ind].gongxu[b].xu) = 0 then
            begin
              memo1.lines.add('�������Ϊ0');
            end;
            jiepop[300].gongxu[jiepop[ind].gongxu[b].xu].zhuangtai := 0; //���¹���״̬
            for d := 1 to n_guimo do
            begin        //����ģ�͸���
              Local_Matrix[trunc(Local_Matrix[trunc(pind[e, 2]), 0]), d] := 0;
            end;
            goto 5;
          end;
          e := e + 1;
        until pind[e, 2] = 0;
  5:
      end;
    end;
    iteration:=0;  //Ϊ�˽���
    EDA_decode(ind);  //��ȫ����
    EDA_evaluate(ind); //ֱ��
    iteration:=1;

    for b := 1 to n_guimo do
    begin
      for c := 1 to n_guimo do
      begin    //��ԭ����
        Local_Matrix[b, c] := TwoMatrix[b, c];
      end;
    end;
    jiepop[300] := jiepop[299];    //��ԭ���ݼ�
    ind:=ind+1;
  until ind = popsize+1;

//  min:=jiepop[301].ctp;
//  ind:=301; //ѡ��ĸ���
//  for a := 301 to set3 do
//  begin
//    if (jiepop[a].ctp<min) then
//    begin
//      min:=jiepop[a].ctp;
//      ind:=a; //ѡ��ĸ���
//    end;
//  end;
//  jiepop[301]:=jiepop[ind];
//  kexingjiepop[301]:=kexingjiepop[ind];
//
//  code_set:=[];
//  begin     //�ҵ��ظ���һ��  [��Ч]
//    for a := 1 to popsize do //����ߵĶԱ� //�൱��һ��ð���㷨  ���ǲ���Ҫ����
//    begin
//      for B := a + 1 to popsize do
//      begin
//        for c := 1 to n_guimo do
//        begin
//          if jiepop[a].gongxu[c].xu <> jiepop[B].gongxu[c].xu then
//            goto 7;
//        end;
//        if c = n_guimo + 1 then  //˵��ȫ���������  �ظ���
//        begin
//          code_set := code_set + [a];
//          jiepop[a] := jiepop[301];
//          kexingjiepop[a] := kexingjiepop[301];  //���滻���塿
//          oldjiepop[a] := jiepop[301];
//          oldkexingjiepop[a] := kexingjiepop[301];
//          goto 8;
//        end;
//        7: //�������ظ�ֱ������
//      end;
//    end;
//    begin     //���û���ظ�����������Ⱥ��������
//      maxT := jiepop[1].CTp;
//      big_ind := 1;
//      for d := 1 to popsize do
//      begin
//        if jiepop[d].CTp > maxT then
//        begin
//          maxT := jiepop[d].CTp;
//          big_ind := d;
//        end
//      end;    //jiepop[index2] ����Ⱥ�����ĸ���
//      code_set := code_set + [big_ind];
//      jiepop[big_ind] := jiepop[301];
//      oldjiepop[big_ind] := jiepop[301];
//      kexingjiepop[big_ind] := kexingjiepop[301];  //���滻���塿
//      oldkexingjiepop[big_ind] := kexingjiepop[301];
//    end;
//    8: //���ظ�����ֱ������
//  end;
end;
procedure TForm1.EDA_Set_replace();
var
  a,c, d: Integer;
  dir: Integer;          //��־
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //���Ȱ��Ź����б�
  numR: double;  //���̶����λ��
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
  maxT,big_ind:Integer;
  min:Integer;
  weizhi1,weizhi2:Integer;
  b:structure_gongxu;
label
  1, 2, 3, 4, 5, 6,7,8;
begin
  ind := 201;
  repeat
    jiepop[ind] := jiepop[197];    //���
    oldjiepop[ind] := jiepop[197];  //���

    jiepop[200] := jiepop[199];
    for c := 1 to n_guimo do //������Ҵ���
    begin
      weizhi1 := 1;
      weizhi2 := 1;
      while (weizhi1 = weizhi2) do //ѡȡ������ͬ�ĵ�
      begin
        weizhi1 := RandomRange(1, n_guimo);
        weizhi2 := RandomRange(1, n_guimo);
      end;
      b := jiepop[200].gongxu[weizhi1];
      jiepop[200].gongxu[weizhi1] := jiepop[200].gongxu[weizhi2];
      jiepop[200].gongxu[weizhi2] := b;
    end;
    jiepop[ind]:=jiepop[200];
    iteration:=0;  //Ϊ�˽���
    EDA_decode(ind);
    EDA_evaluate(ind); //ֱ��
    iteration:=1;

    ind:=ind+1;
  until ind = set3+1;  //������ģ����ȡ��
  min:=jiepop[201].ctp;
  ind:=201; //ѡ��ĸ���
  for a := 201 to set3 do
  begin
    if (jiepop[a].ctp<min) then
    begin
      min:=jiepop[a].ctp;
      ind:=a; //ѡ��ĸ���
    end;
  end;
  jiepop[201]:=jiepop[ind];
  if min=0 then
  begin
    a:=1;
  end;
  if jiepop[201].gongxu[1].xu=0 then
  begin
    a:=1;
  end;
  begin     //�ҵ��ظ���һ��  [��Ч]
    for a := 1 to popsize do //����ߵĶԱ� //�൱��һ��ð���㷨  ���ǲ���Ҫ����
    begin
      for d := a + 1 to popsize do
      begin
        for c := 1 to n_guimo do
        begin
          if jiepop[a].gongxu[c].xu <> jiepop[d].gongxu[c].xu then
            goto 7;
        end;
        if c = n_guimo + 1 then  //˵��ȫ���������  �ظ���
        begin
          code_set := code_set + [a];
          jiepop[a] := jiepop[201];
          kexingjiepop[a] := kexingjiepop[201];  //���滻���塿
          oldjiepop[a] := jiepop[201];
          oldkexingjiepop[a] := kexingjiepop[201];
          goto 8;
        end;
        7: //�������ظ�ֱ������
      end;
    end;
    begin     //���û���ظ�����������Ⱥ��������
      maxT := jiepop[1].CTp;
      big_ind := 1;
      for d := 1 to popsize do
      begin
        if jiepop[d].CTp > maxT then
        begin
          maxT := jiepop[d].CTp;
          big_ind := d;
        end
      end;    //jiepop[index2] ����Ⱥ�����ĸ���
      code_set := code_set + [big_ind];
      jiepop[big_ind] := jiepop[201];
      oldjiepop[big_ind] := jiepop[201];
      kexingjiepop[big_ind] := kexingjiepop[201];  //���滻���塿
      oldkexingjiepop[big_ind] := kexingjiepop[201];
    end;
    8: //���ظ�����ֱ������
  end;
end;
procedure TForm1.EDA_Rand_replace();
var
  a,c, d: Integer;
  dir: Integer;          //��־
  number: integer;
  minlength: integer;
  minposition: integer;
  add: integer;
  prochoose: array[1..250] of array[1..250] of double; //���Ȱ��Ź����б�
  numR: double;  //���̶����λ��
  psum: double;
  e: Integer;
  pind: array[1..250] of array[1..2] of double;
  firstnum: integer;
  lineMatrix: string;
  ind: integer;
  maxT,big_ind:Integer;
  min:Integer;
  weizhi1,weizhi2:Integer;
  b:structure_gongxu;
label
  1, 2, 3, 4, 5, 6,7,8;
begin
  ind := 300;
  jiepop[ind] := jiepop[197];    //���
  oldjiepop[ind] := jiepop[197];  //���
  jiepop[200] := jiepop[199];
  for c := 1 to n_guimo do //������Ҵ���
  begin
    weizhi1 := 1;
    weizhi2 := 1;
    while (weizhi1 = weizhi2) do //ѡȡ������ͬ�ĵ�
    begin
      weizhi1 := RandomRange(1, n_guimo);
      weizhi2 := RandomRange(1, n_guimo);
    end;
    b := jiepop[200].gongxu[weizhi1];
    jiepop[200].gongxu[weizhi1] := jiepop[200].gongxu[weizhi2];
    jiepop[200].gongxu[weizhi2] := b;
  end;
  jiepop[ind]:=jiepop[200];
  begin
    iteration:=0;  //Ϊ�˽���
    EDA_decode(ind);
    EDA_evaluate(ind); //ֱ��
    iteration:=1;
  end;
  jiepop[300]:=jiepop[ind];
  begin     //�ҵ��ظ���һ��  [��Ч]
    for a := 1 to popsize do //����ߵĶԱ� //�൱��һ��ð���㷨  ���ǲ���Ҫ����
    begin
      for d := a + 1 to popsize do
      begin
        for c := 1 to n_guimo do
        begin
          if jiepop[a].gongxu[c].xu <> jiepop[d].gongxu[c].xu then
            goto 7;
        end;
        if c = n_guimo + 1 then  //˵��ȫ���������  �ظ���
        begin
          code_set := code_set + [a];
          jiepop[a] := jiepop[300];
          kexingjiepop[a] := kexingjiepop[300];  //���滻���塿
          oldjiepop[a] := jiepop[300];
          oldkexingjiepop[a] := kexingjiepop[300];
          goto 8;
        end;
        7: //�������ظ�ֱ������
      end;
    end;
    begin     //���û���ظ�����������Ⱥ��������
      maxT := jiepop[1].CTp;
      big_ind := 1;
      for d := 1 to popsize do
      begin
        if jiepop[d].CTp > maxT then
        begin
          maxT := jiepop[d].CTp;
          big_ind := d;
        end
      end;    //jiepop[index2] ����Ⱥ�����ĸ���
      code_set := code_set + [big_ind];
      jiepop[big_ind] := jiepop[300];
      oldjiepop[big_ind] := jiepop[300];
      kexingjiepop[big_ind] := kexingjiepop[300];  //���滻���塿
      oldkexingjiepop[big_ind] := kexingjiepop[300];
    end;
    8: //���ظ�����ֱ������
  end;
end;
//��ǰ���������

procedure TForm1.EDA_LS1();
var
  a, b, c, d, e: Integer;
  savenum: integer;
  point1, point2: integer; //��ȡ�Ͳ���λ��
  line: string; //����
  stop_insert: integer;  //��ֹinsert             copy����  vns��������
  best_ctp: integer;
  ceshi1, ceshi2: integer;
  CTold: DOUBLE;
  Time: Integer;
  ind: Integer;
  acc:Integer;
  num:Integer;
label
  2, 4, 5;
begin
  for ind := 1 to trunc(popsize * yita) do  //��ǰ5%����  LS
  begin
    for Time := 1 to 5 do
    begin
      acc:=0;
      a := RandomRange(1, n_guimo);  //���λ��
      point1 := jiepop[ind].gongxu[a].xu;  //��ȡ�Ĺ���ֵ
      best_ctp := jiepop[ind].CTp;
      num:=a;
      repeat        // ������ insert
        num:=num+1;
      until   (jiepop[ind].gongxu[num].xu in gongxuset[point1].bnearset)or(num=n_guimo) ;
      if (num-1)>a then //������һ����ɲ���
      begin
        b := RandomRange(a+1, num-1);  //�����ȡ�����ϸ��������
        oldjiepop[ind] := jiepop[ind];
        oldkexingjiepop[ind] := kexingjiepop[ind];
        for c := a + 1 to b do //Ƭ�θ���
        begin
          jiepop[ind].gongxu[c - 1] := jiepop[ind].gongxu[c];
        end;
        jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //����
        EDA_decode(ind);
        EDA_evaluate2(ind);
        if (jiepop[ind].CTp <= CT)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI)) then
        begin
          CT := jiepop[ind].CTp - 1;
          bestjie := jiepop[ind];
          BestKexingjie := kexingjiepop[ind];
          EDA_CT := bestjie.CTp;
          EDA_SI := bestjie.LSI;
          acc:=0;
          Memo1.Lines.Add('LS1 ��� FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI));
          goto 5;
        end
      end;
    end;

    for Time := 1 to 5 do
    begin      //��ǰinsert
      acc:=0;
      a := RandomRange(2, n_guimo);
      point1 := jiepop[ind].gongxu[a].xu;  //��ȡ�Ĺ���ֵ
      best_ctp := jiepop[ind].CTp;
      num:=a;
      repeat        // ������ insert
        num:=num-1;
      until   (jiepop[ind].gongxu[num].xu in gongxuset[point1].anearset )or(num=1) ;
    //  if (num-1)<a then //������һ����ɲ���
      b := RandomRange(num+1,a-1 );  //�����ȡ�����ϸ��������
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
      for c := a downto b do //Ƭ�θ���
      begin
        jiepop[ind].gongxu[c] := jiepop[ind].gongxu[c - 1];
      end;
      jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //����
      EDA_decode(ind);
      EDA_evaluate2(ind);
      if (jiepop[ind].CTp <= CT)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI))  then
      begin
        CT := jiepop[ind].CTp - 1;
        bestjie := jiepop[ind];
        BestKexingjie := kexingjiepop[ind];
        acc:=0;
        Memo1.Lines.Add('LS1 ��ǰ FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI));
        goto 5;   //�кþ�����
      end
    end;
5:
  end;
end;
//��ʷ������

procedure TForm1.EDA_LS2();
var
  a, b, c, d, e: Integer;
  savenum: integer;
  point1, point2: integer; //��ȡ�Ͳ���λ��
  line: string; //����
  ceshi1, ceshi2: integer;
  CTold: DOUBLE;
  Time: Integer;
  second_insert: Integer;
  ind: Integer; //�������Ž�
  acc:Integer;
  num:Integer;
  times: Integer;
  flag:Integer;
  t:integer;
label 2, 4, 5;
begin
  for times := 1 to popsize do
  begin
    ind:=RandomRange(1,popsize+1);
    oldjie:=jiepop[ind];   //����
    oldkxjie:=kexingjiepop[ind];
    flag:=0;
    acc:=0;
    t:=1;
    repeat
      a:=1;
      b:=1;
      while a=b do
      begin
        a:=randomrange(1,n_guimo);
        b:=randomrange(1,n_guimo);
      end;
      if (a<b)and(jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].bset) then    //��insert
      begin
        copyjie := jiepop[ind];
        for c := a + 1 to b do //Ƭ�θ���
        begin
          jiepop[ind].gongxu[c - 1] := jiepop[ind].gongxu[c];
        end;
        jiepop[ind].gongxu[b] := copyjie.gongxu[a]; //����
        deepjie:= jiepop[ind];//deep����
        EDA_decode2(ind);
        EDA_evaluate2(ind);
        if (jiepop[ind].CTp <bestjie.CTp)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI))  then
        begin          //1.�����Ž�Ƚ�
          if (jiepop[ind].CTp < bestjie.CTp) then
          begin
            CT := bestjie.CTp - 1;
          end;
          bestjie := jiepop[ind];
          BestKexingjie := kexingjiepop[ind];
          EDA_CT := bestjie.ctp;
          EDA_SI := bestjie.LSI;
          flag:=1;  //����Ҫdeep��־
          EDA_update_M;
             //   savebestdate();
        //  Memo1.Lines.Add('LS2 ��� FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI)+'  acc  '+inttostr(acc));
        end
        else        //2.���Լ��Ƚ�
        if (jiepop[ind].CTp <oldjie.CTp)or((jiepop[ind].CTp = oldjie.CTp)and(jiepop[ind].LSI <oldjie.LSI))  then
        begin
          flag:=1;  //����Ҫdeep��־
        end
        else       //3.û�н�չ  ��deep
        begin
          acc:=acc+1;  //����������
          jiepop[ind]:=deepjie;
        end;
      end
      else
      if  (a>b)and(jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset) then     //ǰinsert
      begin
        copyjie := jiepop[ind];
        for c := a downto b do //Ƭ�θ���
        begin
          jiepop[ind].gongxu[c] := jiepop[ind].gongxu[c - 1];
        end;
        jiepop[ind].gongxu[b] := copyjie.gongxu[a]; //����
        EDA_decode2(ind);
        EDA_evaluate2(ind);
        if (jiepop[ind].CTp < bestjie.CTp)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI))  then
        begin
          if (jiepop[ind].CTp < bestjie.CTp) then
          begin
            CT := bestjie.CTp - 1;
          end;
          bestjie := jiepop[ind];
          BestKexingjie := kexingjiepop[ind];
          EDA_CT := bestjie.ctp;
          EDA_SI := bestjie.LSI;
          flag:=1;  //����Ҫdeep��־
          EDA_update_M;
            //    savebestdate();
        //  Memo1.Lines.Add('LS2 ��ǰ FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI)+'  acc  '+inttostr(acc));
        end
        else        //2.���Լ��Ƚ�
        if (jiepop[ind].CTp <oldjie.CTp)or((jiepop[ind].CTp = oldjie.CTp)and(jiepop[ind].LSI <oldjie.LSI))  then
        begin
          flag:=1;  //����Ҫdeep��־
        end
        else       //3.û�н�չ  ��deep
        begin
          acc:=acc+1;  //����������
          jiepop[ind]:=deepjie;
        end;
      end;
      t:=t+1;
      if acc = 4 then
        a := 1;
    until (acc = deep1) or ( flag=1) or (t>n_guimo) ;
    if flag=0 then
    begin
      jiepop[ind]:=oldjie;   //����
      kexingjiepop[ind]:=oldkxjie;
    end;
  end;
end;
procedure TForm1.EDA_LS3();
var
  a, b, c, d, e: Integer;
  savenum: integer;
  point1, point2: integer; //��ȡ�Ͳ���λ��
  line: string; //����
  ceshi1, ceshi2: integer;
  CTold: DOUBLE;
  Time: Integer;
  second_insert: Integer;
  ind: Integer; //�������Ž�
  acc:Integer;
  num:Integer;
  times: Integer;
  flag:Integer;
  oldbest:Integer;
  t:integer;
label 1,2, 4, 5,6;
begin
  jiepop[300]:=bestjie;
  oldjiepop[300]:=jiepop[300];
  kexingjiepop[300]:=BestKexingjie;
  oldkexingjiepop[300]:=kexingjiepop[300];
  ind:=300;
  oldjie:=jiepop[ind];   //����
  oldkxjie:=kexingjiepop[ind];
  flag:=0;
  acc:=0;
  oldbest:= bestjie.ctp;
  t:=1;
  repeat
    a:=1;
    b:=1;
    while a=b do
    begin
      a:=randomrange(1,n_guimo);
      b:=randomrange(1,n_guimo);
    end;
    if (a<b)and(jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].bset) then    //��insert
    begin
      copyjie := jiepop[ind];
      for c := a + 1 to b do //Ƭ�θ���
      begin
        jiepop[ind].gongxu[c - 1] := jiepop[ind].gongxu[c];
      end;
      jiepop[ind].gongxu[b] := copyjie.gongxu[a]; //����
      deepjie:= jiepop[ind];//deep����

//      EDA_decode2(ind);
//      EDA_evaluate2(ind);

      EDA_decode(ind);           //����
      EDA_evaluate3(ind); //��̰��������  ����

      if (jiepop[ind].CTp <bestjie.CTp)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI))  then
      begin          //1.�����Ž�Ƚ�
        if  (jiepop[ind].CTp <bestjie.CTp) then
        begin
         CT := bestjie.CTp - 1;
        end;
        bestjie := jiepop[ind];
        BestKexingjie := kexingjiepop[ind];
        EDA_CT := bestjie.ctp;
        EDA_SI := bestjie.LSI;
        flag:=1;  //����Ҫdeep��־
//        EDA_update_M;
           //   savebestdate();
     //   Memo1.Lines.Add('LS3 ��� FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI)+'acc'+inttostr(acc)+'dep'+inttostr(D));
      end
      else        //2.���Լ��Ƚ�
      if (jiepop[ind].CTp <oldjie.CTp)or((jiepop[ind].CTp = oldjie.CTp)and(jiepop[ind].LSI <oldjie.LSI))  then
      begin
        flag:=1;  //����Ҫdeep��־
      end
      else       //3.û�н�չ  ��deep
      begin
        acc:=acc+1;  //����������
        jiepop[ind]:=deepjie;
      end;
    end
    else
    if  (a>b)and(jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset) then     //ǰinsert
    begin

      copyjie := jiepop[ind];
      for c := a downto b do //Ƭ�θ���
      begin
        jiepop[ind].gongxu[c] := jiepop[ind].gongxu[c - 1];
      end;
      jiepop[ind].gongxu[b] := copyjie.gongxu[a]; //����

  //      EDA_decode2(ind);
  //      EDA_evaluate2(ind);

      EDA_decode(ind);           //����
      EDA_evaluate3(ind); //��̰��������  ����

      if (jiepop[ind].CTp < bestjie.CTp)or((jiepop[ind].CTp = bestjie.CTp)and(jiepop[ind].LSI < bestjie.LSI))  then
      begin
        if  (jiepop[ind].CTp <bestjie.CTp) then
        begin
         CT := bestjie.CTp - 1;
        end;
        bestjie := jiepop[ind];
        BestKexingjie := kexingjiepop[ind];
        EDA_CT := bestjie.ctp;
        EDA_SI := bestjie.LSI;
        flag:=1;  //����Ҫdeep��־
//
           //   savebestdate();
      //  Memo1.Lines.Add('LS3 ��ǰ FIND:' + IntToStr(EDA_CT)+'  SI:' + FloatToStr(EDA_SI)+'  acc  '+inttostr(acc)+'dep'+inttostr(D));
      end
      else        //2.���Լ��Ƚ�
      if (jiepop[ind].CTp <oldjie.CTp)or((jiepop[ind].CTp = oldjie.CTp)and(jiepop[ind].LSI <oldjie.LSI))  then
      begin
        flag:=1;  //����Ҫdeep��־
      end
      else       //3.û�н�չ  ��deep
      begin
        acc:=acc+1;  //����������
        jiepop[ind]:=deepjie;
      end;
    end;
    t:=t+1;
  until (acc = deep2) or ( flag=1)or (t>n_guimo) ;
  if flag=0 then   //û�н�չ��ԭ
  begin
    jiepop[ind]:=oldjie;
    kexingjiepop[ind]:=oldkxjie;
  end;
end;
//��ǰ���������

procedure TForm1.EDA1_LS1(var ind: Integer);
var
  a, b, c, d, e: Integer;
  savenum: integer;
  point1, point2: integer; //��ȡ�Ͳ���λ��
  line: string; //����
  stop_insert: integer;  //��ֹinsert             copy����  vns��������
  best_ctp: integer;
  ceshi1, ceshi2: integer;
  CTold: DOUBLE;
  Time: Integer;
label
  2, 4, 5;
begin
  //���insert     ������
  for Time := 1 to 20 do         //�����
  begin
    a := RandomRange(1, n_guimo);  //���λ��

    point1 := jiepop[ind].gongxu[a].xu;  //��ȡ�Ĺ���ֵ
    copyjiepop[ind] := jiepop[ind];
    copykexingjiepop[ind] := kexingjiepop[ind];
    best_ctp := jiepop[ind].CTp;
    for b := a + 1 to n_guimo do //����λ��[b֮��]   //ÿ�ζ�Ҫ��
    begin
      jiepop[ind] := copyjiepop[ind];    //���ı�
      kexingjiepop[ind] := copykexingjiepop[ind];
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
      begin
        for c := a + 1 to b do //Ƭ�θ���
        begin
          jiepop[ind].gongxu[c - 1] := jiepop[ind].gongxu[c];
        end;
        jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //����
        EDA_decode(ind);
        EDA_evaluate2(ind);
        if jiepop[ind].CTp <= CT then
        begin
          CT := jiepop[ind].CTp - 1;
          bestjie := jiepop[ind];
          BestKexingjie := kexingjiepop[ind];
          EDA_CT := bestjie.ctp;
          EDA_SI := bestjie.LSI;
          Memo1.Lines.Add('LS1 ��� FIND:' + IntToStr(EDA_CT));
          Memo1.Lines.Add('LS1 FIND:' + FloatToStr(EDA_SI));
          goto 5;
        end;
      end;
    end;
  end;
  for Time := 1 to 20 do
  begin
    //��ǰinsert
    a := RandomRange(1, n_guimo);
    point1 := jiepop[ind].gongxu[a].xu;  //��ȡ�Ĺ���ֵ
    copyjiepop[ind] := jiepop[ind];
    copykexingjiepop[ind] := kexingjiepop[ind];
    best_ctp := jiepop[ind].CTp;
    for b := a - 1 downto 1 do //����λ��[b֮ǰ]
    begin
      jiepop[ind] := copyjiepop[ind];    //���ı�
      kexingjiepop[ind] := copykexingjiepop[ind];
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
      begin
        for c := a downto b do //Ƭ�θ���
        begin
          jiepop[ind].gongxu[c] := jiepop[ind].gongxu[c - 1];
        end;
        jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //����
        DABC_decode(ind);
        EDA_evaluate2(ind);
        if jiepop[ind].CTp <= CT then
        begin
          CT := jiepop[ind].CTp - 1;
          bestjie := jiepop[ind];
          BestKexingjie := kexingjiepop[ind];
          EDA_CT := bestjie.ctp;
          EDA_SI := bestjie.LSI;
          Memo1.Lines.Add('LS1 ��ǰ FIND:' + IntToStr(EDA_CT));
          Memo1.Lines.Add('LS1 FIND:' + FloatToStr(EDA_SI));
          goto 5;
        end;
      end;
    end;
  end;
5:

end;
//��ʷ������

procedure TForm1.EDA1_LS2(var ind: Integer);
var
  a, b, c, d, e: Integer;
  savenum: integer;
  point1, point2: integer; //��ȡ�Ͳ���λ��
  line: string; //����
  stop_insert: integer;  //��ֹinsert             copy����  vns��������
  best_ctp: integer;
  ceshi1, ceshi2: integer;
  CTold: DOUBLE;
  Time: Integer;
  second_insert: Integer;
label
  2, 4;
begin
  //���insert     ������
  for Time := 1 to insert_times do
  begin
    a := RandomRange(1, n_guimo - 1);
    begin
      point1 := jiepop[ind].gongxu[a].xu;  //��ȡ�Ĺ���ֵ
      begin
        copyjiepop[ind] := jiepop[ind];
        copykexingjiepop[ind] := kexingjiepop[ind];
        best_ctp := jiepop[ind].CTp;
        for b := a + 1 to n_guimo do //����λ��[b֮��]
        begin
          jiepop[ind] := copyjiepop[ind];    //���ı�
          kexingjiepop[ind] := copykexingjiepop[ind];
          oldjiepop[ind] := jiepop[ind];
          oldkexingjiepop[ind] := kexingjiepop[ind];
          begin
            for c := a + 1 to b do //Ƭ�θ���
            begin
              jiepop[ind].gongxu[c - 1] := jiepop[ind].gongxu[c];
            end;
            jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //����

            DABC_decode(ind);
            EDA_evaluate2(ind);
            if jiepop[ind].CTp <= CT then
            begin
              CT := jiepop[ind].CTp - 1;
              bestjie := jiepop[ind];
              BestKexingjie := kexingjiepop[ind];
      //          Memo1.Lines.Add('bestCT   '+FloatToStr(CT+1)+'    LS2');
            end;
          end;
        end;
      end;
    end;
  end;
  for Time := 1 to insert_times do
  begin
    //��ǰinsert
    a := RandomRange(1, n_guimo - 1);
    begin
      point1 := jiepop[ind].gongxu[a].xu;  //��ȡ�Ĺ���ֵ
      copyjiepop[ind] := jiepop[ind];
      copykexingjiepop[ind] := kexingjiepop[ind];
      best_ctp := jiepop[ind].CTp;
      for b := a - 1 downto 1 do //����λ��[b֮ǰ]
      begin
        jiepop[ind] := copyjiepop[ind];    //���ı�
        kexingjiepop[ind] := copykexingjiepop[ind];
        oldjiepop[ind] := jiepop[ind];
        oldkexingjiepop[ind] := kexingjiepop[ind];
        begin
          for c := a downto b do //Ƭ�θ���
          begin
            jiepop[ind].gongxu[c] := jiepop[ind].gongxu[c - 1];
          end;
          jiepop[ind].gongxu[b] := oldjiepop[ind].gongxu[a]; //����
          DABC_decode(ind);
          EDA_evaluate2(ind);
          if jiepop[ind].CTp <= CT then
          begin
            CT := jiepop[ind].CTp - 1;
            bestjie := jiepop[ind];
            BestKexingjie := kexingjiepop[ind];
    //        Memo1.Lines.Add('bestCT   '+FloatToStr(CT+1)+'    LS2')
          end;
        end;
      end;
    end;
  end;
end;

function TForm1.choose_direction(var ind: integer; pzhan: Integer): integer;  //����  -1=���  1=�ұ�
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  L_NUM, R_NUM: Integer;
  L_BSET, R_BSET: set of 1..255;
label
  1;
begin
  endtime := 0;
  for A := 1 to n_guimo do
  begin
    if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //������ʱ��Լ��
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //������
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //���һ̨վ��ʱ���ж�
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          end
          else   //ûԼ����
          begin
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
        end
      end;
    end;
    begin   //ѡ
      L_NUM := 0;
      R_NUM := 0;
      for B := 1 to n_guimo do
      begin
        if (jiepop[ind].gongxu[B].xu in LA1) and ((jiepop[ind].gongxu[B].fangxiang = -1) or (jiepop[ind].gongxu[B].fangxiang = 0)) then
          Inc(L_NUM)
        else if (jiepop[ind].gongxu[B].xu in LA1) and ((jiepop[ind].gongxu[B].fangxiang = 1) or (jiepop[ind].gongxu[B].fangxiang = 0)) then
          Inc(R_NUM);
      end;
      if L_NUM > R_NUM then
      begin
        Result := -1;
      end
      else if L_NUM < R_NUM then
      begin
        Result := 1;
      end
      else if (L_NUM = R_NUM) and (R_NUM <> 0) then
      begin
        L_BSET := [];
        R_BSET := [];
        for B := 1 to n_guimo do
        begin
          if (jiepop[ind].gongxu[B].xu in LA1) and ((jiepop[ind].gongxu[B].fangxiang = -1) or (jiepop[ind].gongxu[B].fangxiang = 0)) then
          begin
            L_BSET := L_BSET + jiepop[ind].gongxu[B].bnearset;
          end
          else if (jiepop[ind].gongxu[B].xu in LA1) and ((jiepop[ind].gongxu[B].fangxiang = 1) or (jiepop[ind].gongxu[B].fangxiang = 0)) then
          begin
            R_BSET := R_BSET + jiepop[ind].gongxu[B].bnearset;
          end;
        end;

        for C in L_BSET do
          Inc(L_NUM);
        for C in R_BSET do
          Inc(L_NUM);

        if L_NUM >= R_NUM then    //��һ��Ĭ���
        begin
          Result := -1;
        end
        else if L_NUM < R_NUM then
        begin
          Result := 1;
        end
      end;
    end;
1:

  end;
end;

function TForm1.BAS_choose_direction(var ind: Integer; pzhan: Integer): integer;  //����  -1=���  1=�ұ�
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  L_NUM, R_NUM: Integer;
  L_BSET, R_BSET: set of 1..255;
label
  1, 2;
begin
  LA1 := [];
  LA2 := [];
  endtime := 0;
  for A := 1 to n_guimo do
  begin
    if (jiepop[ind].gongxu[A].fangxiang = -1) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //������ʱ��Լ��
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //������
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //���һ̨վ��ʱ���ж�
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          end
          else   //ûԼ����
          begin
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
        end
      end;
    end;
1:

  end;

  for A := 1 to n_guimo do
  begin
    if (jiepop[ind].gongxu[A].fangxiang = 1) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //������ʱ��Լ��
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
      begin
        if (kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 2; //������
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //���һ̨վ��ʱ���ж�
      begin
        if (kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          end
          else   //ûԼ����
          begin
            begin
              LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
            end
          end;
        end
        else
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
        end
      end;
    end;
2:

  end;

  begin   //ѡ
    L_NUM := 0;
    R_NUM := 0;
    for B := 1 to n_guimo do
    begin
      if (jiepop[ind].gongxu[B].xu in LA1) and (jiepop[ind].gongxu[B].fangxiang = -1) then
        Inc(L_NUM)
      else if (jiepop[ind].gongxu[B].xu in LA2) and (jiepop[ind].gongxu[B].fangxiang = 1) then
        Inc(R_NUM);

    end;
    if L_NUM > R_NUM then
    begin
      Result := -1;
    end
    else if L_NUM < R_NUM then
    begin
      Result := 1;
    end
    else if (L_NUM = R_NUM) and (R_NUM <> 0) then
    begin
      L_BSET := [];
      R_BSET := [];
      for B := 1 to n_guimo do
      begin
        if (jiepop[ind].gongxu[B].xu in LA1) and (jiepop[ind].gongxu[B].fangxiang = -1) then
        begin
          L_BSET := L_BSET + jiepop[ind].gongxu[B].bnearset;
        end
        else if (jiepop[ind].gongxu[B].xu in LA2) and (jiepop[ind].gongxu[B].fangxiang = 1) then
        begin
          R_BSET := R_BSET + jiepop[ind].gongxu[B].bnearset;
        end;
      end;

      for C in L_BSET do
        Inc(L_NUM);
      for C in R_BSET do
        Inc(L_NUM);

      if L_NUM >= R_NUM then    //��һ��Ĭ���
      begin
        Result := -1;
      end
      else if L_NUM < R_NUM then
      begin
        Result := 1;
      end
    end;
  end;
end;

procedure TForm1.bas_decode(var ind: Integer; dev: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //���ĸ�����
  direction: string; //����
begin
  x := 1;
  kexingjiepop[ind] := kexingjiepop[300];  //���ȥһ�����õ�����
  oldkexingjiepop[ind] := kexingjiepop[ind];
  for zhan := 1 to zhannumber do
  begin
    indexBack := 1;
    LCANT := 0;  //��ʼ��վ��״̬
    RCANT := 0;
    gx_L := 1;   //�¿���վ �������0
    gx_R := 1;   //��¼վ�Ϲ���ĵ����
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        Time_d := Abs(L_R);  //����ʱ��
        if ((L_R < 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          Time_d := 10000; //���һ̨��ʱ��Լ��
          direction := 'L';
          BAS_L(ind, zhan, Time_d);  //����  ������  ����  0  �Ų���
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
          end;
        end
        else if (RCANT = 0) then
        begin
          direction := 'R';
          BAS_R(ind, zhan, Time_d);  //����  ������  ����  0  �Ų���
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end
    else    //���һ��վ֮ǰ
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        Time_d := Abs(L_R);  //����ʱ��
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          direction := 'L';
          BAS_L(ind, zhan, Time_d);  //����  ������  ����  0  �Ų���
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
          end;
        end
        else if (RCANT = 0) then
        begin
          direction := 'R';
          BAS_R(ind, zhan, Time_d);  //����  ������  ����  0  �Ų���
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end;
  end;
  for A := 0 to n_guimo do
    for B := 0 to n_guimo do
    begin
      Local_Matrix[A, B] := TwoMatrix[A, B];
    end;
  for A := 1 to n_guimo do    //�ָ���������ʣ�״̬������ǰ��
  begin
    jiepop[300].gongxu[A] := jiepop[299].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;
//[δ���]

procedure TForm1.Deviation_decode(var ind: Integer; dev: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //���ĸ�����
  direction: string; //����
  deviation: Integer;  //�ۼ�ƫ��
  p: Integer;  //����p
begin
  deviation := 0;  //�ۼ�ƫ��
  x := 1;
  kexingjiepop[ind] := kexingjiepop[201];
  oldkexingjiepop[ind] := kexingjiepop[ind];

  for zhan := 1 to zhannumber do
  begin
    indexBack := 1;
    LCANT := 0;  //��ʼ��վ��״̬
    RCANT := 0;
    gx_L := 1; //�¿���վ �������0
    gx_R := 1; //��¼վ�Ϲ���ĵ����
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        Time_d := Abs(L_R);  //����ʱ��
        if ((L_R < 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          Time_d := 10000; //���һ̨��ʱ��Լ��
          direction := 'L';
          BAS_L(ind, zhan, Time_d);  //����  ������  ����  0  �Ų���
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
          end;
        end
        else if (RCANT = 0) then
        begin
          direction := 'R';
          BAS_R(ind, zhan, Time_d);  //����  ������  ����  0  �Ų���
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end
    else    //���һ��վ֮ǰ
    begin
      repeat
        begin
          Copykexingjiepop[ind] := kexingjiepop[ind];  //����վ����Ϣ
          for A := 1 to n_guimo do         //ֻ������һ��
          begin
            copy_Matrix[A, x] := Local_Matrix[A, x];            //����ѡ�����
          end;
        end;
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        Time_d := Abs(L_R);  //����ʱ��

        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          direction := 'L';

          p := BAS_L(ind, zhan, Time_d);  //����  ������  ����  0  �Ų���
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
            //ֻ�зŵ��²Ż����ƫ��
            deviation := deviation + kexingjiepop[ind].zuoBianzhan[zhan].gxEndTime[gx_L - 1] - kexingjiepop[ind].zuoBianzhan[zhan].gxEndTime[gx_L - 2] - jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[zhan].kexingGongxu[gx_L - 1]].shijian;
            if deviation > dev then    //����������Χ  ÿ��վֻ��dev  �и�bug �᲻�����Ž���ĳ��վdev�ܴ�   ����Ϊ0
            begin                     //��ֻ����վ��dev  ��վ������
              deviation := deviation - (kexingjiepop[ind].zuoBianzhan[zhan].gxEndTime[gx_L - 1] - kexingjiepop[ind].zuoBianzhan[zhan].gxEndTime[gx_L - 2] - jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[zhan].kexingGongxu[gx_L - 1]].shijian);
              x := x - 1;     //ѡ����󷵻�һ��(��������һ��)
              gx_L := gx_L - 1;
              kexingjiepop[ind] := Copykexingjiepop[ind];  //�ָ�վ����Ϣ
              jiepop[ind].gongxu[p].zhuangtai := 1;
              for B := 1 to n_guimo do                //�ָ������е���Ϣ
              begin
                if jiepop[ind].gongxu[p].xu in jiepop[199].gongxu[B].aset then   //��ԭ����ǰ��״̬
                begin
                  jiepop[ind].gongxu[B].aset := jiepop[ind].gongxu[B].aset + [jiepop[ind].gongxu[p].xu];
                end;
              end;
              //����ǲ�����·��  ���ѡ����󲻿��е�
              Local_Matrix[p, x] := 0;
            end
            else


          end;
        end
        else if (RCANT = 0) then
        begin
          direction := 'R';
          BAS_R(ind, zhan, Time_d);  //����  ������  ����  0  �Ų���
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end;
  end;
  for A := 0 to n_guimo do
    for B := 0 to n_guimo do
    begin
      Local_Matrix[A, B] := TwoMatrix[A, B];
    end;
  for A := 1 to n_guimo do    //�ָ���������ʣ�״̬������ǰ��
  begin
    jiepop[200].gongxu[A] := jiepop[199].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;
//�Ľ����룺�����ұ�ʱ����ͬ

procedure TForm1.DABC_decode_up(var ind: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //���ĸ�����
  direction: string; //����
begin
  oldkexingjiepop[ind] := kexingjiepop[ind];
  kexingjiepop[ind] := kexingjiepop[197]; //���վ��Ϣ
  zhan := 1;
  repeat
    indexBack := 1;
    LCANT := 0;  //��ʼ��վ��״̬
    RCANT := 0;
    gx_L := 1; //�¿���վ �������0
    gx_R := 1; // ��¼վ�Ϲ���ĵ����
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if L_R = 0 then
        begin
          L_R := choose_direction(ind, zhan);
        end;  //����һ������
        if ((L_R < 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          Lre_arr_back(ind, zhan);  //����  ������  ����  0  �Ų���
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
          end;
        end
        else if (RCANT = 0) then
        begin
          Rre_arr_back(ind, zhan);  //����  ������  ����  0  �Ų���
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end
    else    //���һ��վ֮ǰ
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if L_R = 0 then
        begin
          L_R := choose_direction(ind, zhan);
        end;  //����һ������
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          direction := 'L';
          Lre_arr_back(ind, zhan);  //����  ������  ����  0  �Ų���
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
          end;
        end
        else if (RCANT = 0) then
        begin
          Rre_arr_back(ind, zhan);  //����  ������  ����  0  �Ų���
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;

        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end;
    zhan := zhan + 1;
  until zhan > zhannumber;
  for A := 1 to n_guimo do    //�ָ���������ʣ�״̬������ǰ��
  begin
    jiepop[ind].gongxu[A] := jiepop[199].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;

procedure TForm1.DABC_re_bestInd(var key: string);
var
  ind: Integer;
  MINCT:Integer;
  L2:Double;
begin
  minCT:=JIEPOP[1].CTp;
  L2:=JIEPOP[1].DABC_L2;
  for ind := 1 to popsize do
  begin
    if MINCT >= jiepop[ind].CTp then
    begin
      MINCT := jiepop[ind].CTp;
      DABC_CT:=jiepop[ind].CTp;
      L2:=JIEPOP[IND].DABC_L2;
      DABC_SI:=JIEPOP[IND].LSI;
      if L2<JIEPOP[IND].DABC_L2 then
      begin
        MINCT := jiepop[ind].CTp;
        DABC_CT:=jiepop[ind].CTp;
        L2:=JIEPOP[IND].DABC_L2;
        DABC_SI:=JIEPOP[IND].LSI;
      end;
    end;
  end;
end;

procedure TForm1.calculation_SI();
var
  a: Integer;
  MAXTIME: Integer;
  sumsqr: Integer;
begin
  MAXTIME := kexingjiepop[bestind].Station[1].OverTime;
  for a := 1 to zhannumber - 1 do
  begin
    if kexingjiepop[bestind].Station[a].OverTime > kexingjiepop[bestind].Station[a + 1].OverTime then
    begin
      MAXTIME := kexingjiepop[bestind].Station[a + 1].OverTime;
    end;
  end;
  sumsqr := 0;
  for a := 1 to zhannumber do
  begin
    sumsqr := sumsqr + Sqr(MAXTIME - kexingjiepop[bestind].Station[a].OverTime);
  end;
  SI := 0;
  SI := Sqrt(sumsqr);
end;
//վ���ع����ԵĽ������
//�����������Լ��
//��Ϊ���Ż�SI  ����������CT

procedure TForm1.Restructure_decode(var ind: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //���ĸ�����
  direction: string;    //����
label
  1;  //�ظ���������
begin
  oldjiepop[ind] := jiepop[ind];
  oldkexingjiepop[ind] := kexingjiepop[ind];
  kexingjiepop[ind] := kexingjiepop[201]; //���վ��Ϣ
  zhan := 1;
  indexBack := 1;
  LCANT := 0;  //��ʼ��վ��״̬
  RCANT := 0;
  gx_L := 1;   //�¿���վ �������0
  gx_R := 1;   // ��¼վ�Ϲ���ĵ����
  zhan := 1;   //ֻ�õ�һ��վ�Ϳ�����
  repeat
    L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
    Time_d := Abs(L_R);  //����ʱ��
    if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
    begin
      direction := 'L';
      Reconstruction_process_L(ind, zhan, Time_d);  //����  ������  ����  0  �Ų���
      if LCANT = 0 then
      begin
        RCANT := 0; //��һ���¹����ͷŶ���
      end;
    end
    else if (RCANT = 0) or (LCANT = 1) then
    begin
      direction := 'R';
      Reconstruction_process_R(ind, zhan, Time_d);  //����  ������  ����  0  �Ų���
      if RCANT = 0 then
      begin
        LCANT := 0;
      end;
    end;

    if (LCANT = 1) and (RCANT = 1) then
    begin
      indexBack := 0;
    end;
  until indexBack = 0;
  Refactoring_error := 0;
  for A := 1 to Number_operations do
  begin
    if jiepop[198].gongxu[A].zhuangtai = 1 then
    begin
      Refactoring_error := 1;
    end;
  end;

  for A := 1 to Number_operations do    //�ָ���������ʣ�״̬������ǰ��
  begin
    B := 1;
    repeat
      if jiepop[ind].gongxu[A].xu = Backup_process.gongxu[B].xu then
      begin
        jiepop[ind].gongxu[A] := Backup_process.gongxu[B];
        goto 1;
      end;
      B := B + 1;
    until Backup_process.gongxu[B].xu = 0;  //���ҵ�ĩβ
1:

  end;
end;
//DABC���߰汾����

procedure TForm1.DABC_decode(var ind: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //���ĸ�����
  direction: string; //����
begin
  rtime := rtime + 1;
  kexingjiepop[ind] := kexingjiepop[201]; //���վ��Ϣ
  zhan := 1;
  repeat
    indexBack := 1;
    LCANT := 0;  //��ʼ��վ��״̬
    RCANT := 0;
    gx_L := 1; //�¿���վ �������0
    gx_R := 1; // ��¼վ�Ϲ���ĵ����
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          Lre_arr_back(ind, zhan);
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          Rre_arr_back(ind, zhan);
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end
    else    //���һ��վ֮ǰ
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          Lre_arr_back(ind, zhan);  //����  ������  ����  0  �Ų���
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          Rre_arr_back(ind, zhan);  //����  ������  ����  0  �Ų���
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end;
    zhan := zhan + 1;
  until zhan > zhannumber;
  for A := 1 to n_guimo do    //�ָ���������ʣ�״̬������ǰ��
  begin
    jiepop[ind].gongxu[A] := jiepop[199].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;
//�򻯽���

procedure TForm1.EDA_decode(var ind: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //���ĸ�����
  direction: string; //����
  Total_idle_time:Integer;  //�����õ��ܿ���ʱ��
  label 1;
begin
  Total_idle_time:=zhannumber*2*trunc(CT)-Total_process_time;//�ȼ�����CT����δ�ﵽ���¿��õĿ���ʱ��
  Quick_evaluation:=0; //����=0
  Acc_idle_time:=0;  //�ۼƿ���ʱ��=0

  rtime := rtime + 1;
  kexingjiepop[ind] := kexingjiepop[297]; //���վ��Ϣ
  zhan := 1;
  repeat
    indexBack := 1;
    LCANT := 0;  //��ʼ��վ��״̬
    RCANT := 0;
    gx_L := 1; //�¿���վ �������0
    gx_R := 1; // ��¼վ�Ϲ���ĵ����
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          EDA_CHOOSE_L_P(ind, zhan);
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          EDA_CHOOSE_R_P(ind, zhan);
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
      until indexBack = 0;
    end
    else    //���һ��վ֮ǰ
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          EDA_CHOOSE_L_P(ind, zhan);  //����  ������  ����  0  �Ų���
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          EDA_CHOOSE_R_P(ind, zhan);  //����  ������  ����  0  �Ų���
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
        if (iteration>0)and(Acc_idle_time>=Total_idle_time) then
        begin
          Quick_evaluation:=1;
          goto  1;
        end;
      until indexBack = 0;
      Acc_idle_time:=Acc_idle_time+(trunc(CT)-kexingjiepop[ind].zuoBianzhan[zhan].zongshijian);
      Acc_idle_time:=Acc_idle_time+(Trunc(CT)-kexingjiepop[ind].youBianzhan[zhan].zongshijian);
    end;
    zhan := zhan + 1;
  until zhan > zhannumber;
  1:  //������������
  for A := 1 to n_guimo do    //�ָ���������ʣ�״̬������ǰ��
  begin
    jiepop[ind].gongxu[A] := jiepop[299].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;
//��ͨ����
procedure TForm1.EDA_decode2(var ind: Integer);
var
  A, B, C, D: Integer;
  zhan: Integer;
  p_zuo, p_you: Integer;
  L_gongxu, R_gongxu: Integer;
  L_R: Integer;
  Time_d: Integer;
  choose_num: Integer;  //���ĸ�����
  direction: string; //����
  Total_idle_time:Integer;  //�����õ��ܿ���ʱ��
  label 1;
begin
  Total_idle_time_ind:=zhannumber*2*trunc(jiepop[ind].CTp)-Total_process_time;//
  Quick_evaluation_ind:=0; //����=0
  Acc_idle_time_ind:=0;  //�ۼƿ���ʱ��=0

  rtime := rtime + 1;
  kexingjiepop[ind] := kexingjiepop[297]; //���վ��Ϣ
  zhan := 1;
  repeat
    indexBack := 1;
    LCANT := 0;  //��ʼ��վ��״̬
    RCANT := 0;
    gx_L := 1; //�¿���վ �������0
    gx_R := 1; // ��¼վ�Ϲ���ĵ����
    if zhan = zhannumber then
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          EDA_CHOOSE_L_P(ind, zhan);
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          EDA_CHOOSE_R_P(ind, zhan);
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
        if (iteration>0)and(Acc_idle_time_ind>=Total_idle_time_ind) then
        begin
          Quick_evaluation_ind:=1;
          goto  1;
        end;
      until indexBack = 0;
    end
    else    //���һ��վ֮ǰ
    begin
      repeat
        L_R := kexingjiepop[ind].zuoBianzhan[zhan].zongshijian - kexingjiepop[ind].youBianzhan[zhan].zongshijian;
        if ((L_R <= 0) and (LCANT = 0)) or (RCANT = 1) then
        begin
          EDA_CHOOSE_L_P(ind, zhan);  //����  ������  ����  0  �Ų���
          if LCANT = 0 then
          begin
            RCANT := 0; //��һ���¹����ͷŶ���
          end;
        end
        else if (RCANT = 0) or (LCANT = 1) then
        begin
          EDA_CHOOSE_R_P(ind, zhan);  //����  ������  ����  0  �Ų���
          if RCANT = 0 then
          begin
            LCANT := 0;
          end;
        end;
        if (LCANT = 1) and (RCANT = 1) then
        begin
          indexBack := 0;
        end;
        if (iteration>0)and(Acc_idle_time_ind>=Total_idle_time_ind) then
        begin
          Quick_evaluation_ind:=1;
          goto  1;
        end;
      until indexBack = 0;
      Acc_idle_time_ind:=Acc_idle_time_ind+(trunc(jiepop[ind].CTp)-kexingjiepop[ind].zuoBianzhan[zhan].zongshijian);
      Acc_idle_time_ind:=Acc_idle_time_ind+(Trunc(jiepop[ind].CTp)-kexingjiepop[ind].youBianzhan[zhan].zongshijian);
    end;
    zhan := zhan + 1;
  until zhan > zhannumber;
  1:
  for A := 1 to n_guimo do    //�ָ���������ʣ�״̬������ǰ��
  begin
    jiepop[ind].gongxu[A] := jiepop[299].gongxu[jiepop[ind].gongxu[A].xu];
  end;
end;
procedure TForm1.Lre_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //״̬���ѷ���
  for b := 1 to n_guimo do              //���ں����ǰ�򼯺����޳���ǰ��
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //վ��ʱ��
  if (kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian < kexingjiepop[ind].youBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then  //���ص㡿
  begin
    back := gx_R - 1;
    repeat
      if kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //ûԼ����
    begin
      endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
    kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
  end;

  kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L] := endtime; //��¼ÿ��λ�õ�ʱ��
  kexingjiepop[ind].zuoBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //վĩβ��������
  kexingjiepop[ind].zuoBianzhan[Pzhan].gxset := kexingjiepop[ind].zuoBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //���򼯺�
  kexingjiepop[ind].zuoBianzhan[Pzhan].kexingGongxu[gx_L] := jiepop[ind].gongxu[a].xu; //վ�����й����ۼ�
  gx_L := gx_L + 1;
  //**������Ҫ�ɾ��в���****
end;
//��¼�ۼƿ���ʱ��

procedure TForm1.EDA_Refre_Lstation(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //״̬���ѷ���
  for b := 1 to n_guimo do              //���ں����ǰ�򼯺����޳���ǰ��
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //վ��ʱ��
  if (kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian < kexingjiepop[ind].youBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then  //���ص㡿
  begin
    back := gx_R - 1;
    repeat
      if kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //ûԼ����
    begin
      endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
    kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
  end;
  kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L] := endtime; //��¼ÿ��λ�õ�ʱ��
  kexingjiepop[ind].zuoBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //վĩβ��������
  kexingjiepop[ind].zuoBianzhan[Pzhan].gxset := kexingjiepop[ind].zuoBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //���򼯺�
  kexingjiepop[ind].zuoBianzhan[Pzhan].kexingGongxu[gx_L] := jiepop[ind].gongxu[a].xu; //վ�����й����ۼ�
  Acc_idle_time:= Acc_idle_time+ (endtime- kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L-1])-jiepop[ind].gongxu[a].shijian;
  Acc_idle_time_ind:= Acc_idle_time_ind+ (endtime- kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L-1])-jiepop[ind].gongxu[a].shijian;

  gx_L := gx_L + 1;
  //**������Ҫ�ɾ��в���****


end;
procedure TForm1.EDA_Refre_Rstation(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //״̬���ѷ���
  for b := 1 to n_guimo do              //���ں����ǰ�򼯺����޳���ǰ��
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //վ��ʱ��
  if (kexingjiepop[ind].youBianzhan[Pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then
  begin
    back := gx_L - 1;
    repeat
      if kexingjiepop[ind].ZUOBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //ûԼ����
    begin
      endtime := kexingjiepop[ind].youBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := jiepop[ind].gongxu[a].shijian + kexingjiepop[ind].youBianzhan[Pzhan].zongshijian;
    kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
  end;
  kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R] := endtime; //��¼ÿ��λ�õ�ʱ��
  kexingjiepop[ind].youBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //վĩβ��������
  kexingjiepop[ind].youBianzhan[Pzhan].gxset := kexingjiepop[ind].youBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //���򼯺�
  kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[gx_R] := jiepop[ind].gongxu[a].xu; //վ�����й����ۼ�
  Acc_idle_time:= Acc_idle_time+ (endtime- kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R-1])-jiepop[ind].gongxu[a].shijian;
  Acc_idle_time_ind:= Acc_idle_time_ind+ (endtime- kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R-1])-jiepop[ind].gongxu[a].shijian;

  gx_R := gx_R + 1;
  //**������Ҫ�ɾ��в���****
end;

//�ع�վ����Ϣ����

procedure TForm1.Refactoring_information_update_L(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //״̬���ѷ���
  for b := 1 to Number_operations do              //���ں����ǰ�򼯺����޳���ǰ��
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //վ��ʱ��
  if (kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian < kexingjiepop[ind].youBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then  //���ص㡿
  begin
    back := gx_R - 1;
    repeat
      if kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //ûԼ����
    begin
      endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
    kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
  end;

  kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L] := endtime; //��¼ÿ��λ�õ�ʱ��
  kexingjiepop[ind].zuoBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //վĩβ��������
  kexingjiepop[ind].zuoBianzhan[Pzhan].gxset := kexingjiepop[ind].zuoBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //���򼯺�
  kexingjiepop[ind].zuoBianzhan[Pzhan].kexingGongxu[gx_L] := jiepop[ind].gongxu[a].xu; //վ�����й����ۼ�
  gx_L := gx_L + 1;
  //**������Ҫ�ɾ��в���****
end;

procedure TForm1.Rre_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //״̬���ѷ���
  for b := 1 to n_guimo do              //���ں����ǰ�򼯺����޳���ǰ��
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //վ��ʱ��
  if (kexingjiepop[ind].youBianzhan[Pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then
  begin
    back := gx_L - 1;
    repeat
      if kexingjiepop[ind].ZUOBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //ûԼ����
    begin
      endtime := kexingjiepop[ind].youBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := jiepop[ind].gongxu[a].shijian + kexingjiepop[ind].youBianzhan[Pzhan].zongshijian;
    kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
  end;
  kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R] := endtime; //��¼ÿ��λ�õ�ʱ��
  kexingjiepop[ind].youBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //վĩβ��������
  kexingjiepop[ind].youBianzhan[Pzhan].gxset := kexingjiepop[ind].youBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //���򼯺�
  kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[gx_R] := jiepop[ind].gongxu[a].xu; //վ�����й����ۼ�
  gx_R := gx_R + 1;
  //**������Ҫ�ɾ��в���****
end;

procedure TForm1.Refactoring_information_update_R(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //״̬���ѷ���
  for b := 1 to Number_operations do              //���ں����ǰ�򼯺����޳���ǰ��
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //վ��ʱ��
  if (kexingjiepop[ind].youBianzhan[Pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then
  begin
    back := gx_L - 1;
    repeat
      if kexingjiepop[ind].ZUOBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //ûԼ����
    begin
      endtime := kexingjiepop[ind].youBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := jiepop[ind].gongxu[a].shijian + kexingjiepop[ind].youBianzhan[Pzhan].zongshijian;
    kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
  end;
  kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R] := endtime; //��¼ÿ��λ�õ�ʱ��
  kexingjiepop[ind].youBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //վĩβ��������
  kexingjiepop[ind].youBianzhan[Pzhan].gxset := kexingjiepop[ind].youBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //���򼯺�
  kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[gx_R] := jiepop[ind].gongxu[a].xu; //վ�����й����ۼ�
  gx_R := gx_R + 1;
  //**������Ҫ�ɾ��в���****
end;

procedure TForm1.BAS_L_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[101].gongxu[a].zhuangtai := 0;  //״̬���ѷ���
  for b := 1 to n_guimo do              //���ں����ǰ�򼯺����޳���ǰ��
  begin
    if jiepop[101].gongxu[a].xu in jiepop[101].gongxu[b].aset then
    begin
      jiepop[101].gongxu[b].aset := jiepop[101].gongxu[b].aset - [jiepop[101].gongxu[a].xu];
    end;
  end;                                   //վ��ʱ��
  if (kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian < kexingjiepop[ind].youBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[Pzhan].gxset * jiepop[101].gongxu[a].anearset <> []) then  //���ص㡿
  begin
    back := gx_R - 1;
    repeat
      if kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[back] in jiepop[101].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] + jiepop[101].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //ûԼ����
    begin
      endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[101].gongxu[a].shijian;
      kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian + jiepop[101].gongxu[a].shijian;
    kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian := endtime;
  end;

  kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[gx_L] := endtime; //��¼ÿ��λ�õ�ʱ��
  kexingjiepop[ind].zuoBianzhan[Pzhan].lastx := jiepop[101].gongxu[a].xu; //վĩβ��������
  kexingjiepop[ind].zuoBianzhan[Pzhan].gxset := kexingjiepop[ind].zuoBianzhan[Pzhan].gxset + [jiepop[101].gongxu[a].xu]; //���򼯺�
  kexingjiepop[ind].zuoBianzhan[Pzhan].kexingGongxu[gx_L] := jiepop[101].gongxu[a].xu; //վ�����й����ۼ�
  gx_L := gx_L + 1;
  //**������Ҫ�ɾ��в���****
end;

procedure TForm1.BAS_R_jiepop_and_kexingjiepop(var ind: Integer; a: Integer; Pzhan: Integer);
var
  b: Integer;
  back: Integer;
  endtime: Integer;
begin
  endtime := 0;
  jiepop[ind].gongxu[a].zhuangtai := 0;  //״̬���ѷ���
  for b := 1 to n_guimo do              //���ں����ǰ�򼯺����޳���ǰ��
  begin
    if jiepop[ind].gongxu[a].xu in jiepop[ind].gongxu[b].aset then
    begin
      jiepop[ind].gongxu[b].aset := jiepop[ind].gongxu[b].aset - [jiepop[ind].gongxu[a].xu];
    end;
  end;                                   //վ��ʱ��
  if (kexingjiepop[ind].youBianzhan[Pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[Pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[Pzhan].gxset * jiepop[ind].gongxu[a].anearset <> []) then
  begin
    back := gx_L - 1;
    repeat
      if kexingjiepop[ind].ZUOBianzhan[Pzhan].kexingGongxu[back] in jiepop[ind].gongxu[a].anearset then
      begin
        endtime := kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] + jiepop[ind].gongxu[a].shijian;
      end;
      back := back - 1;
    until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[Pzhan].gxEndTime[back] <= kexingjiepop[ind].youBianzhan[Pzhan].zongshijian);
    if (endtime <> 0) then
    begin
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end
    else   //ûԼ����
    begin
      endtime := kexingjiepop[ind].youBianzhan[Pzhan].zongshijian + jiepop[ind].gongxu[a].shijian;
      kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
    end;
  end
  else
  begin
    endtime := jiepop[ind].gongxu[a].shijian + kexingjiepop[ind].youBianzhan[Pzhan].zongshijian;
    kexingjiepop[ind].youBianzhan[Pzhan].zongshijian := endtime;
  end;
  kexingjiepop[ind].youBianzhan[Pzhan].gxEndTime[gx_R] := endtime; //��¼ÿ��λ�õ�ʱ��
  kexingjiepop[ind].youBianzhan[Pzhan].lastx := jiepop[ind].gongxu[a].xu; //վĩβ��������
  kexingjiepop[ind].youBianzhan[Pzhan].gxset := kexingjiepop[ind].youBianzhan[Pzhan].gxset + [jiepop[ind].gongxu[a].xu]; //���򼯺�
  kexingjiepop[ind].youBianzhan[Pzhan].kexingGongxu[gx_R] := jiepop[ind].gongxu[a].xu; //վ�����й����ۼ�
  gx_R := gx_R + 1;
  //**������Ҫ�ɾ��в���****
end;

function TForm1.BAS_L(var ind: Integer; pzhan: Integer; TIME_D: Integer): Integer;
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  earlytimeset := [];
  earlytime := -1;  //����3
  for A := 1 to n_guimo do
  begin        //������ǰ��Ϊ��&δ����          //δ����  ����ǰ���ѷ���
    if Local_Matrix[A, x] <> 0 then
    begin
      jiepop[ind].gongxu[A].earlytime := 0;  //����3��
      endtime := 0;
      if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[101].gongxu[A].aset = []) then
      begin              //������ʱ��Լ��
        if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
        begin
          if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //���ص㡿
          begin
            BACK := gx_R - 1;
            repeat
              if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
              begin
                if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                  endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
                else
                  goto 1; //������
              end;
              BACK := BACK - 1;
            until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
            if (endtime <> 0) and (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
            else   //ûԼ����
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
              if (endtime <= CT) then
              begin
                LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
                jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
              end
            end;
          end
          else
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
          end
        end
        else if pzhan = zhannumber then    //���һ̨վ��ʱ���ж�
        begin
          if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //���ص㡿
          begin
            BACK := gx_R - 1;
            repeat
              if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
              begin
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
              end;
              BACK := BACK - 1;
            until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
            if (endtime <> 0) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
            else   //ûԼ����
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
              begin
                LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
                jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
              end
            end;
          end
          else
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
          end
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //����2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //����3
        begin
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //����4
        begin
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
        end;
      end;
1:

    end;
  end;

  if LA4 <> [] then
  begin
    A := choose_procedure(ind, LA4);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA3 <> [] then
  begin
    A := choose_procedure(ind, LA3);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA2 <> [] then
  begin
    A := choose_procedure(ind, LA2);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA1 <> [] then
  begin
    A := choose_procedure(ind, LA1);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end;

  if LA1 = [] then
  begin
    LCANT := 1;
  end
  else
  begin
    result := A;
  end;
end;

procedure TForm1.RE_MATRIXandJie(var ind: integer; p: Integer);
var
  B: Integer;
begin
  for B := 1 to n_guimo do
  begin
    Local_Matrix[p, B] := 0;
    if jiepop[ind].gongxu[B].aset <> [] then
    begin
      Local_Matrix[B, x + 1] := 0;  //��һ��û��Լ���Ŀ�Ϊ0
    end;
  end;
  x := x + 1;
end;

function TForm1.BAS_R(var ind: Integer; pzhan: Integer; TIME_D: Integer): Integer;
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  earlytimeset := [];
  earlytime := 0;  //����3
  for A := 1 to n_guimo do
  begin        //������ǰ��Ϊ��&δ����          //δ����  ����ǰ���ѷ���
    if Local_Matrix[A, x] <> 0 then
    begin
      jiepop[ind].gongxu[A].earlytime := 0;  //����3��
      endtime := 0;
      if ((jiepop[ind].gongxu[A].fangxiang = 1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
      begin              //������ʱ��Լ��
        if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
        begin
          if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
          begin
            BACK := gx_L - 1;
            repeat
              if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
              begin
                if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                  endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
                else
                  goto 1;
              end;
              BACK := BACK - 1;
            until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
            if (endtime <> 0) and (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
            else   //ûԼ����
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
              if (endtime <= CT) then
              begin
                LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
                jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
              end
            end;
          end
          else
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
          end
        end
        else if pzhan = zhannumber then
        begin
          if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
          begin
            BACK := gx_L - 1;
            repeat
              if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
              begin
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
              end;
              BACK := BACK - 1;
            until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
            if (endtime <> 0) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
            else   //ûԼ����
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
              begin
                LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
                jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
              end
            end;
          end
          else
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
          end
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //����2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //����3
        begin
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //����4
        begin
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
        end;
      end;
1:  //��ΪCT������

    end;
  end;
  if LA4 <> [] then
  begin
    A := choose_procedure(ind, LA4);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA3 <> [] then
  begin
    A := choose_procedure(ind, LA3);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA2 <> [] then
  begin
    A := choose_procedure(ind, LA2);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end
  else if LA1 <> [] then
  begin
    A := choose_procedure(ind, LA1);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    RE_MATRIXandJie(ind, A);
  end;
  if LA1 = [] then
  begin
    RCANT := 1;
  end
  else
  begin
    result := A;
  end;
end;

procedure TForm1.Lre_arr_back(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  arr1, arr2, arr3, arr4: array[1..100] of Integer;
  R1, R2, R3, R4: Integer;
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
label
  3;
begin
  LCANT := 0;   //������־
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  R1 := 1;
  R2 := 1;
  R3 := 1;
  R4 := 1;
  earlytimeset := [];
  earlytime := -1;  //����3
  for A := 1 to n_guimo do
  begin        //������ǰ��Ϊ��&δ����          //δ����  ����ǰ���ѷ���
    jiepop[ind].gongxu[A].earlytime := 0;  //����3��
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //������ʱ��Լ��
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //������
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //���һ̨վ��ʱ���ж�
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then   // �Ż�
      begin
        if (endtime >= BCT) and (endtime <= CT) then                              //����2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          arr2[R2] := jiepop[ind].gongxu[A].xu;
          R2 := R2 + 1;
        end;
        if (jiepop[ind].gongxu[A].earlytime = 0) then                 //����3
        begin
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
          arr3[R3] := jiepop[ind].gongxu[A].xu;
          R3 := R3 + 1;
        end;
        if (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //����4
        begin
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
          arr4[R4] := jiepop[ind].gongxu[A].xu;
          R4 := R4 + 1;
        end;
      end;
    end;
1:

  end;
  if LA1 <> [] then   //�Ż�ʱ��
  begin
    if LA4 <> [] then     // ѡ����һ���������  ��Ȼ��������û������
    begin               //ѡ���ҵ����׸�   ��Ȼ�����ڴ˴����ӹ���
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr4[1];
      Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA3 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr3[1];
      Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA2 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr2[1];
      Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA1 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr1[1];
      Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end;
  end
  else if LA1 = [] then
  begin
    LCANT := 1;
  end;
end;

procedure TForm1.Rre_arr_back(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  arr1, arr2, arr3, arr4: array[1..100] of Integer;
  R1, R2, R3, R4: Integer;
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  R1 := 1;
  R2 := 1;
  R3 := 1;
  R4 := 1;
  earlytimeset := [];
  earlytime := 0;  //����3
  for A := 1 to n_guimo do
  begin        //������ǰ��Ϊ��&δ����          //δ����  ����ǰ���ѷ���
    jiepop[ind].gongxu[A].earlytime := 0;  //����3��
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = 1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //������ʱ��Լ��
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then   // �Ż�
      begin
        if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //����2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          arr2[R2] := jiepop[ind].gongxu[A].xu;
          R2 := R2 + 1;
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //����3
        begin
          arr3[R3] := jiepop[ind].gongxu[A].xu;
          R3 := R3 + 1;
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //����4
        begin
          arr4[R4] := jiepop[ind].gongxu[A].xu;
          R4 := R4 + 1;
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
        end;
      end;
    end;
1:  //��ΪCT������

  end;
  if LA1 <> [] then
  begin
    if LA4 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr4[1];
      Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA3 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr3[1];
      Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA2 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr2[1];
      Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
    else if LA1 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr1[1];
      Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
    end
  end
  else if LA1 = [] then
  begin
    RCANT := 1;
  end;
end;

procedure TForm1.EDA_CHOOSE_L_P(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  arr1, arr2, arr3, arr4: array[1..100] of Integer;
  R1, R2, R3, R4: Integer;
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
label
  3;
begin
  LCANT := 0;   //������־
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  R1 := 1;
  R2 := 1;
  R3 := 1;
  R4 := 1;
  earlytimeset := [];
  earlytime := -1;  //����3
  for A := 1 to n_guimo do
  begin        //������ǰ��Ϊ��&δ����          //δ����  ����ǰ���ѷ���
    jiepop[ind].gongxu[A].earlytime := 0;  //����3��
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //������ʱ��Լ��
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //������
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //���һ̨վ��ʱ���ж�
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then   // �Ż�
      begin
        if (endtime >= BCT) and (endtime <= CT) then                              //����2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          arr2[R2] := jiepop[ind].gongxu[A].xu;
          R2 := R2 + 1;
        end;
        if (jiepop[ind].gongxu[A].earlytime = 0) then                 //����3
        begin
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
          arr3[R3] := jiepop[ind].gongxu[A].xu;
          R3 := R3 + 1;
        end;
        if (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //����4
        begin
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
          arr4[R4] := jiepop[ind].gongxu[A].xu;
          R4 := R4 + 1;
        end;
      end;
    end;
1:

  end;
  if LA1 <> [] then   //�Ż�ʱ��
  begin
    if LA4 <> [] then     // ѡ����һ���������  ��Ȼ��������û������
    begin               //ѡ���ҵ����׸�   ��Ȼ�����ڴ˴����ӹ���
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr4[1];
      EDA_Refre_Lstation(ind, A, pzhan);
    end
    else if LA3 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr3[1];
      EDA_Refre_Lstation(ind, A, pzhan);
    end
    else if LA2 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr2[1];
      EDA_Refre_Lstation(ind, A, pzhan);
    end
    else if LA1 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr1[1];
      EDA_Refre_Lstation(ind, A, pzhan);
    end;
  end
  else if LA1 = [] then
  begin
    LCANT := 1;
  end;
end;

procedure TForm1.EDA_CHOOSE_R_P(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  arr1, arr2, arr3, arr4: array[1..100] of Integer;
  R1, R2, R3, R4: Integer;
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  R1 := 1;
  R2 := 1;
  R3 := 1;
  R4 := 1;
  earlytimeset := [];
  earlytime := 0;  //����3
  for A := 1 to n_guimo do
  begin        //������ǰ��Ϊ��&δ����          //δ����  ����ǰ���ѷ���
    jiepop[ind].gongxu[A].earlytime := 0;  //����3��
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = 1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //������ʱ��Լ��
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            arr1[R1] := jiepop[ind].gongxu[A].xu;
            R1 := R1 + 1;
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              arr1[R1] := jiepop[ind].gongxu[A].xu;
              R1 := R1 + 1;
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          arr1[R1] := jiepop[ind].gongxu[A].xu;
          R1 := R1 + 1;
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then   // �Ż�
      begin
        if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //����2
        begin
          LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
          arr2[R2] := jiepop[ind].gongxu[A].xu;
          R2 := R2 + 1;
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //����3
        begin
          arr3[R3] := jiepop[ind].gongxu[A].xu;
          R3 := R3 + 1;
          LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
        end;
        if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //����4
        begin
          arr4[R4] := jiepop[ind].gongxu[A].xu;
          R4 := R4 + 1;
          LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
        end;
      end;
    end;
1:  //��ΪCT������

  end;
  if LA1 <> [] then
  begin
    if LA4 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr4[1];
      EDA_Refre_Rstation(ind, A, pzhan);
    end
    else if LA3 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr3[1];
      EDA_Refre_Rstation(ind, A, pzhan);
    end
    else if LA2 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr2[1];
      EDA_Refre_Rstation(ind, A, pzhan);
    end
    else if LA1 <> [] then
    begin
      A := 0;
      repeat
        A := A + 1;
      until jiepop[ind].gongxu[A].xu = arr1[1];
      EDA_Refre_Rstation(ind, A, pzhan);
    end
  end
  else if LA1 = [] then
  begin
    RCANT := 1;
  end;
end;
//�ع�����  ����������

procedure TForm1.Reconstruction_process_L(var ind: Integer; pzhan: Integer; TIME_D: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�

  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];

  earlytimeset := [];
  earlytime := -1;  //����3
  for A := 1 to Number_operations do
  begin        //������ǰ��Ϊ��&δ����          //δ����  ����ǰ���ѷ���
    jiepop[ind].gongxu[A].earlytime := 0;  //����3��
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //������ʱ��Լ��
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT + 1) then    //����1      �ŵ���
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT + 1 then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //������
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT + 1) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT + 1) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else
      begin
        goto 1;
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT + 1) then                              //����2
      begin
        LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //����3
      begin

        LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //����4
      begin
        LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
      end;
    end;
1:

  end;
  if LA4 <> [] then
  begin
    num := 0;
    for A in LA4 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //��ֹԽ��
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA4 then  //���ѡ�񼯺�������
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_L(ind, A, pzhan);
  end
  else if LA3 <> [] then
  begin
    num := 0;
    for A in LA3 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //��ֹԽ��
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA3 then  //���ѡ�񼯺�������
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_L(ind, A, pzhan);
  end
  else if LA2 <> [] then
  begin
    num := 0;
    for A in LA2 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //��ֹԽ��
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA2 then  //���ѡ�񼯺�������
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_L(ind, A, pzhan);
  end
  else if LA1 <> [] then
  begin
    num := 0;
    for A in LA1 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //��ֹԽ��
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA1 then  //���ѡ�񼯺�������
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_L(ind, A, pzhan);
  end;
  if LA1 = [] then
  begin
    LCANT := 1;
  end;
end;
//�ع��������  �ұ�

procedure TForm1.Reconstruction_process_R(var ind: Integer; pzhan: Integer; TIME_D: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  num: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  earlytimeset := [];
  earlytime := 0;  //����3
  for A := 1 to Number_operations do
  begin        //������ǰ��Ϊ��&δ����          //δ����  ����ǰ���ѷ���
    jiepop[ind].gongxu[A].earlytime := 0;  //����3��
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = 1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //������ʱ��Լ��
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end;

      if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //����2
      begin
        LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].earlytime = 0) then                 //����3
      begin

        LA3 := LA3 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //����4
      begin
        LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
      end;
    end;
1:  //��ΪCT������

  end;
  if LA4 <> [] then
  begin
    num := 0;
    for A in LA4 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //��ֹԽ��
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA4 then  //���ѡ�񼯺�������
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_R(ind, A, pzhan);
  end
  else if LA3 <> [] then
  begin
    num := 0;
    for A in LA3 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //��ֹԽ��
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA3 then  //���ѡ�񼯺�������
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_R(ind, A, pzhan);
  end
  else if LA2 <> [] then
  begin
    num := 0;
    for A in LA2 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //��ֹԽ��
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA2 then  //���ѡ�񼯺�������
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_R(ind, A, pzhan);
  end
  else if LA1 <> [] then
  begin
    num := 0;
    for A in LA1 do
      inc(num);
    C := RandomRange(1, num);
    A := 0;
    repeat
      if A = n_guimo + 1 then //��ֹԽ��
      begin
        A := 1;
      end;
      A := A + 1;
      if jiepop[ind].gongxu[A].xu in LA1 then  //���ѡ�񼯺�������
      begin
        C := C - 1;
      end;
    until C = 0;
    Refactoring_information_update_R(ind, A, pzhan);
  end;
  if LA1 = [] then
  begin
    RCANT := 1;
  end;
end;

procedure TForm1.Lre_arr_back_1(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  earlytimeset := [];
  earlytime := -1;  //����3
  for A := 1 to n_guimo do
  begin        //������ǰ��Ϊ��&δ����          //δ����  ����ǰ���ѷ���
    jiepop[ind].gongxu[A].earlytime := 0;  //����3��
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = -1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //������ʱ��Լ��
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1; //������
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then    //���һ̨վ��ʱ���ж�
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian > kexingjiepop[ind].youBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].youBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset = []) then  //���ص㡿
        begin
          BACK := gx_R - 1;
          repeat
            if kexingjiepop[ind].youBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].youBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //����2
      begin
        LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then                 //����3
      begin
        if earlytime = -1 then
        begin
          earlytime := jiepop[ind].gongxu[A].earlytime;
          earlytimeset := earlytimeset + [jiepop[ind].gongxu[A].xu];
        end
        else
        begin
          if jiepop[ind].gongxu[A].earlytime < earlytime then
          begin
            earlytimeset := [];
            earlytimeset := [jiepop[ind].gongxu[A].xu];
            earlytime := jiepop[ind].gongxu[A].earlytime;
          end
          else if jiepop[ind].gongxu[A].earlytime = earlytime then
          begin
            earlytimeset := earlytimeset + [jiepop[ind].gongxu[A].xu];
          end;
        end;
        LA3 := earlytimeset;
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //����4
      begin
        LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
      end;
    end;
1:

  end;
  if LA4 <> [] then
  begin
    A := choose_procedure(pzhan, LA4);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA3 <> [] then
  begin
    A := choose_procedure(pzhan, LA3);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA2 <> [] then
  begin
    A := choose_procedure(pzhan, LA2);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA1 <> [] then
  begin
    A := choose_procedure(pzhan, LA1);
    Lre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end;
  if LA1 = [] then
  begin
    LCANT := 1;
  end;
end;

procedure TForm1.Rre_arr_back_1(var ind: Integer; pzhan: Integer);
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
label
  1;
begin
  LCANT := 0;
  LA1 := [];
  LA2 := [];
  LA3 := [];
  LA4 := [];
  earlytimeset := [];
  earlytime := 0;  //����3
  for A := 1 to n_guimo do
  begin        //������ǰ��Ϊ��&δ����          //δ����  ����ǰ���ѷ���
    jiepop[ind].gongxu[A].earlytime := 0;  //����3��
    endtime := 0;
    if ((jiepop[ind].gongxu[A].fangxiang = 1) or (jiepop[ind].gongxu[A].fangxiang = 0)) and (jiepop[ind].gongxu[A].zhuangtai = 1) and (jiepop[ind].gongxu[A].aset = []) then
    begin              //������ʱ��Լ��
      if (jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian <= CT) and (pzhan < zhannumber) then    //����1      �ŵ���
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              if jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= CT then
                endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian
              else
                goto 1;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) and (endtime <= CT) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            if (endtime <= CT) then
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end
      else if pzhan = zhannumber then
      begin
        if (kexingjiepop[ind].youBianzhan[pzhan].zongshijian < kexingjiepop[ind].zuoBianzhan[pzhan].zongshijian) and (kexingjiepop[ind].zuoBianzhan[pzhan].gxset * jiepop[ind].gongxu[A].anearset <> []) then
        begin
          BACK := gx_L - 1;
          repeat
            if kexingjiepop[ind].zuoBianzhan[pzhan].kexingGongxu[BACK] in jiepop[ind].gongxu[A].anearset then
            begin
              endtime := kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] + jiepop[ind].gongxu[A].shijian;
            end;
            BACK := BACK - 1;
          until (endtime <> 0) or (kexingjiepop[ind].zuoBianzhan[pzhan].gxEndTime[BACK] <= kexingjiepop[ind].youBianzhan[pzhan].zongshijian);
          if (endtime <> 0) then
          begin
            LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
            jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
          end
          else   //ûԼ����
          begin
            endtime := kexingjiepop[ind].youBianzhan[pzhan].zongshijian + jiepop[ind].gongxu[A].shijian;
            begin
              LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
              jiepop[ind].gongxu[A].earlytime := endtime - jiepop[ind].gongxu[A].shijian;
            end
          end;
        end
        else
        begin
          LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
          endtime := jiepop[ind].gongxu[A].shijian + kexingjiepop[ind].youBianzhan[pzhan].zongshijian
        end
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (endtime >= BCT) and (endtime <= CT) then                              //����2
      begin
        LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) then                 //����3
      begin
        if earlytime = 0 then
        begin
          earlytime := jiepop[ind].gongxu[A].earlytime;
          earlytimeset := earlytimeset + [jiepop[ind].gongxu[A].xu];
        end
        else
        begin
          if jiepop[ind].gongxu[A].earlytime < earlytime then
          begin
            earlytimeset := [];
            earlytimeset := [jiepop[ind].gongxu[A].xu];
            earlytime := jiepop[ind].gongxu[A].earlytime;
          end
          else if jiepop[ind].gongxu[A].earlytime = earlytime then
          begin
            earlytimeset := earlytimeset + [jiepop[ind].gongxu[A].xu];
          end;
        end;
        LA3 := earlytimeset;
      end;
      if (jiepop[ind].gongxu[A].xu in LA1) and (jiepop[ind].gongxu[A].xu in LA2) and (jiepop[ind].gongxu[A].xu in LA3) then                               //����4
      begin
        LA4 := LA4 + [jiepop[ind].gongxu[A].xu];
      end;
    end;
1:  //��ΪCT������

  end;
  if LA4 <> [] then
  begin
    A := choose_procedure(pzhan, LA4);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA3 <> [] then
  begin
    A := choose_procedure(pzhan, LA3);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA2 <> [] then
  begin
    A := choose_procedure(pzhan, LA2);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end
  else if LA1 <> [] then
  begin
    A := choose_procedure(pzhan, LA1);
    Rre_jiepop_and_kexingjiepop(ind, A, pzhan);
  end;
  if LA1 = [] then
  begin
    RCANT := 1;
  end;
end;

//��������뷽���ֲ��ѡ��Թ۷䡿
procedure TForm1.DABC_VNS();
var
  point1, point2, flag: Integer;
  a, b: Integer;
  Point3: Integer;
  scout: Integer;
  BCTin: Integer;
  coCTp: Integer;
  select: Integer;
label
  7;
begin
  select := RandomRange(1, popsize);
  coCTp := jiepop[select].CTp; //��һ�β���
  repeat
    point1 := RandomRange(1, n_guimo);
    point2 := RandomRange(1, n_guimo);
    if point1 > point2 then //point1 ����  1��2
    begin
      flag := point1;
      point1 := point2;
      point2 := flag;
    end;
  until point1 <> point2;
  Copyjiepop[1].gongxu[1] := jiepop[select].gongxu[point1];  //��������ȡ��
  for b := point1 to point2 - 1 do  //��Ƭ��Ǩ�ơ�
  begin
    jiepop[select].gongxu[b] := jiepop[select].gongxu[b + 1];
  end;
  jiepop[select].gongxu[point2] := Copyjiepop[1].gongxu[1]; //�����롿
  Copyjiepop[2] := jiepop[select]; //������ٴβ���
  DABC_decode(select);
  DABC_evaluate(select);
  if jiepop[select].CTp < BestCTP then
  begin
    BestCTP:= jiepop[select].CTp;
    CT:=bestCTp-1;
  //  Memo1.Lines.Add('�Թ�1find��' + inttostr(jiepop[select].CTp));
    DABC_SI := jiepop[select].LSI;
    DABC_CT := jiepop[select].CTp;
  end;
  if jiepop[select].CTp = coCTp then  //�ڶ��β���
  begin
    jiepop[select] := Copyjiepop[2];
    point1 := point2;
    while point1 = point2 do
    begin
      point1 := RandomRange(1, n_guimo);
      point2 := RandomRange(1, n_guimo);
    end;
    if point1 > point2 then
    begin
      a := point1;
      point1 := point2;
      point2 := a;
    end;
    begin
      Copyjiepop[1].gongxu[1] := jiepop[select].gongxu[point1];  //��������ȡ��
      for b := point1 to point2 - 1 do  //��Ƭ��Ǩ�ơ�
      begin
        jiepop[select].gongxu[b] := jiepop[select].gongxu[b + 1];
      end;
      jiepop[select].gongxu[point2] := Copyjiepop[1].gongxu[1]; //�����롿
      Copyjiepop[2] := jiepop[select]; //������ٴβ���
      DABC_decode(select);
      DABC_evaluate(select);   //���۹���  //̰��ѡ�����
    end;
    if jiepop[select].CTp < BestCTP then
    begin
      BestCTP:= jiepop[select].CTp;
      CT:=bestCTp-1;
   //   Memo1.Lines.Add('�Թ�2find��' + inttostr(jiepop[select].CTp));
      DABC_SI := jiepop[select].LSI;
      DABC_CT := jiepop[select].CTp;
    end;
  end;
end;
//���̶�ѡ���Թ۷䡿  [��Ч]

function TForm1.RouletteWheelSelection(): integer;
var
  b: Integer;
  CTpSum: Integer;
  Q: array[1..200] of Double;
  select, r, max: Integer;
begin
  //����CTP����
  CTpSum := 0;
  for b := 1 to popsize do
    CTpSum := CTpSum + kexingjiepop[b].CTp;

  for b := 1 to popsize do
    kexingjiepop[b].PCTp := (1 / (kexingjiepop[b].CTp)) / (1 / CTpSum); //ȡ���������

  for b := 1 to popsize do
    if b = 1 then
      Q[b] := kexingjiepop[b].PCTp
    else
      Q[b] := Q[b - 1] + kexingjiepop[b].PCTp;

  max := Round(Q[popsize]); //ȡ��

  r := RandomRange(1, max);
  for b := 1 to popsize do
    if Q[b] > r then
      Break;

  select := b;
  result := select;
end;

function TForm1.choose_procedure(var ind: Integer; LA: my_set): Integer;
var
  A, B, C: Integer;
  LA1, LA2, LA3, LA4: set of 1..255;  //���𼯺�
  endtime: Integer;
  BACK: Integer;
  earlytimeset: set of 1..255;
  LA1num: Integer;
  earlytime: Integer;
  L_NUM, R_NUM: Integer;
  L_BSET, R_BSET: set of 1..255;
  ceshi1: integer;
begin
  LA1 := [];
  LA2 := [];
  for A := 1 to n_guimo do
  begin
    if jiepop[ind].gongxu[A].xu in LA then
    begin
      if jiepop[ind].gongxu[A].fangxiang <> 0 then
      begin
        LA1 := LA1 + [jiepop[ind].gongxu[A].xu];
      end
      else
      begin
        LA2 := LA2 + [jiepop[ind].gongxu[A].xu];
      end;
    end;
  end;
  if LA1 <> [] then
  begin
    A := 0;
    repeat
      A := A + 1;
    until jiepop[ind].gongxu[A].xu in LA1;
    result := A;
  end
  else if LA2 <> [] then
  begin
    A := 0;
    repeat
      A := A + 1;
    until (jiepop[ind].gongxu[A].xu in LA2);
    result := A;
  end;
  if (LA1 = []) and (LA2 = []) then
  begin
    ceshi1 := 1;
  end;
  jiepop[1].gongxu[x] := jiepop[101].gongxu[A];  //�������������·��
end;

procedure TForm1.DABC_TP_PMX();
var
  flag1, flag2: Integer;
  a, b: Integer;
  s1, s2: Integer;  //ѡ����
  p1, p2, mid: Integer;  //ѡ����λ��
  set1, set2: set of 1..255;
  lab2: integer;
  flag: Integer;
  times: Integer;
begin

  s1 := 1;
  s2 := 1;
  while s1 = s2 do
  begin
    s1 := RandomRange(1, popsize);
    s2 := RandomRange(1, popsize);
  end;
  p1 := 1;
  p2 := 1;
  set1 := [];
  set2 := [];

  copyjiepop[1] := jiepop[s1];
  Copyjiepop[2] := jiepop[s2];
  begin
    while p1 = p2 do             //ѡ����λ��
    begin
      p1 := RandomRange(1, n_guimo);
      p2 := RandomRange(1, n_guimo);
    end;
    if p1 > p2 then  //����p1<p2
    begin
      mid := p1;
      p1 := p2;
      p2 := mid;
    end;
    set1 := [];
    set2 := [];
    for a := p1 to p2 do
    begin
      set1 := set1 + [jiepop[s1].gongxu[a].xu];
    end;
    for a := p1 to p2 do
    begin
      set2 := set2 + [jiepop[s2].gongxu[a].xu];
    end;
    for times := 1 to n_guimo do  //������
    begin
      for a := p1 to p2 do
      begin
        if (not (jiepop[s1].gongxu[a].xu in set2)) or (not (jiepop[s2].gongxu[a].xu in set1)) then
        begin
          set1 := set1 - [jiepop[s1].gongxu[a].xu];
          set1 := set1 - [jiepop[s2].gongxu[a].xu];
          set2 := set2 - [jiepop[s1].gongxu[a].xu];
          set2 := set2 - [jiepop[s2].gongxu[a].xu];
        end;
      end;
    end;
    for a := p1 to p2 do
    begin
      if (jiepop[s1].gongxu[a].xu in set2) and (jiepop[s2].gongxu[a].xu in set1) then
      begin
        Temporary_storage := jiepop[s1].gongxu[a];
        jiepop[s1].gongxu[a] := jiepop[s2].gongxu[a];
        jiepop[s2].gongxu[a] := Temporary_storage;
      end;
    end;
  end;

  if (set1 <> []) and (set2 <> []) then
  begin
    //�����ظ�
    for a := 1 to n_guimo do
    begin
      b := a;
      repeat
        b := b + 1;
      until (b = n_guimo + 1) or (jiepop[s1].gongxu[a].xu = jiepop[s1].gongxu[b].xu);
      if (jiepop[s1].gongxu[a].xu = jiepop[s1].gongxu[b].xu) then
      begin
        flag1 := 1;
      end;
    end;
    DABC_decode(s1);
    DABC_evaluate(s1);
    if jiepop[s1].CTp <= CT then
    begin
      CT := jiepop[s1].CTp - 1;
      Memo1.Lines.Add('��Ӷfind��' + inttostr(jiepop[s1].CTp));
    end;
    DABC_decode(s2);
    DABC_evaluate(s2);
    if jiepop[s2].CTp <= CT then
    begin
      CT := jiepop[s2].CTp - 1;
      Memo1.Lines.Add('��Ӷfind��' + inttostr(jiepop[s2].CTp));
    end;
  end
  else
  begin
    jiepop[s1] := Copyjiepop[1];
    jiepop[s2] := Copyjiepop[2];
  end;
end;

procedure TForm1.DABC_PMX();
var
  flag1, flag2: Integer;
  a, b, c: Integer;
  s1, s2: Integer;  //ѡ����
  p1, p2, mid: Integer;  //ѡ����λ��
  set1, set2: set of 1..255;
  lab2: integer;
  flag: Integer;
  times: Integer;
label
  1;
label
  2;
begin
  s1 := 1;
  s2 := 1;
  while s1 = s2 do
  begin
    s1 := RandomRange(1, popsize);
    s2 := RandomRange(1, popsize);
  end;
  p1 := 1;
  p2 := 1;
  copyjiepop[1] := jiepop[s1];
  Copyjiepop[2] := jiepop[s2];
  while p1 = p2 do             //ѡ����λ��
  begin
    p1 := RandomRange(1, n_guimo);
    p2 := RandomRange(1, n_guimo);
  end;
  if p1 > p2 then  //����p1<p2
  begin
    mid := p1;
    p1 := p2;
    p2 := mid;
  end;
  set1 := [];
  set2 := [];
  for a := 1 to p1 - 1 do     //s1��ǰ�˺�˼���
  begin
    set1 := set1 + [jiepop[s1].gongxu[a].xu];
  end;
  for a := p2 + 1 to n_guimo do
  begin
    set1 := set1 + [jiepop[s1].gongxu[a].xu];
  end;
  for a := 1 to p1 - 1 do     //s2��ǰ�˺�˼���
  begin
    set2 := set2 + [jiepop[s2].gongxu[a].xu];
  end;
  for a := p2 + 1 to n_guimo do
  begin
    set2 := set2 + [jiepop[s2].gongxu[a].xu];
  end;
  for a := p1 to p2 do   //������
  begin
    gongxu := jiepop[s1].gongxu[a];
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[a];
    jiepop[s2].gongxu[a] := gongxu;
  end;
  for a := p1 to p2 do  //������
  begin
    b := p1;
    repeat
      if jiepop[s1].gongxu[b].xu in set1 then //��⵽�ظ�
      begin
        gongxu := jiepop[s1].gongxu[b];
        goto 1;
      end;
      b := b + 1;
    until b = p2 + 1;   //�ܹؼ�
1:
    c := p2;           //�Ӻ���ǰ  ��Ȼ�仯����
    repeat
      if jiepop[s2].gongxu[c].xu in set2 then //��⵽�ظ�
      begin
        jiepop[s1].gongxu[b] := jiepop[s2].gongxu[c];
        jiepop[s2].gongxu[c] := gongxu;
        goto 2;
      end;
      c := c - 1;
    until c = p1 - 1;   //�ܹؼ�
2:

  end;
  begin
    //�����ظ�
    for a := 1 to n_guimo do
    begin
      b := a;
      repeat
        b := b + 1;
      until (b = n_guimo + 1) or (jiepop[s1].gongxu[a].xu = jiepop[s1].gongxu[b].xu);
      if (jiepop[s1].gongxu[a].xu = jiepop[s1].gongxu[b].xu) then
      begin
        flag1 := 1;
      end;
    end;
    DABC_decode(s1);
    DABC_evaluate(s1);
    if jiepop[s1].CTp <= CT then
    begin
      CT := jiepop[s1].CTp - 1;
      Memo1.Lines.Add('��Ӷfind��' + inttostr(jiepop[s1].CTp));
      DABC_CT := jiepop[s1].CTp;
      DABC_SI := JIEPOP[s1].LSI;
    end;
    DABC_decode(s2);
    DABC_evaluate(s2);
    if jiepop[s2].CTp <= CT then
    begin
      CT := jiepop[s2].CTp - 1;
      Memo1.Lines.Add('��Ӷfind��' + inttostr(jiepop[s2].CTp));
      DABC_CT := jiepop[s1].CTp;
      DABC_SI := JIEPOP[s1].LSI;
    end;
  end;
end;

//OX��������  �ƻ���̫��
procedure TForm1.DABC_OX();
var
  flag1, flag2: array[1..200] of integer;
  a: Integer;
  s1, s2: Integer;  //ѡ����
  p1, p2, mid: Integer;  //ѡ����λ��
  set1: set of 1..255;
  lab2: integer;
begin
  s1 := 1;
  s2 := 1;
  while s1 = s2 do
  begin
    s1 := RandomRange(1, popsize);
    s2 := RandomRange(1, popsize);
  end;
  p1 := 1;
  p2 := 1;
  while p1 = p2 do             //ѡ����λ��
  begin
    p1 := RandomRange(1, n_guimo);
    p2 := RandomRange(1, n_guimo);
  end;
  if p1 > p2 then  //����s1<s2
  begin
    mid := p1;
    p1 := p2;
    p2 := mid;
  end;
  set1 := [];
  for a := p1 to p2 do  //������1�Ĳ���Ƭ��  ���뼯�� ��������2���ж�
  begin
    set1 := set1 + [jiepop[s1].gongxu[a].xu];
  end;
  lab2 := 0;  //��2�ı����±�
  for a := 1 to (p1 - 1) do     //�Ӹ�2��ѡ�������1ǰ��
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  for a := p2 + 1 to n_guimo do     //�Ӹ�2��ѡ�������1ǰ��
  begin
    repeat
      lab2 := lab2 + 1;
    until not (jiepop[s2].gongxu[lab2].xu in set1);
    jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
  end;
  DABC_decode(s1);
  DABC_evaluate(s1);
  if jiepop[s1].CTp < bestCTp then //����CT
  begin
//    Memo1.Lines.Add('OX��Ӷfind��' + inttostr(jiepop[s1].CTp));
    bestind := S1;
    bestCTp:=jiepop[s1].CTp;
    CT:=bestCTp-1;
    DABC_SI := jiepop[s1].LSI;
    DABC_CT := jiepop[s1].CTp;
  end;
end;

procedure TForm1.EDA_OX();
var
  flag1, flag2: array[1..200] of integer;
  a,b: Integer;
  s1, s2: Integer;  //ѡ����
  p1, p2, mid: Integer;  //ѡ����λ��
  set1: set of 1..255;
  lab2: integer;
  label 1;
begin
  for b := 1 to popsize do
  begin
    s1:=B;
    s2:=s1;
    while s1=s2 do
    begin
      randomize ;
      s2:=RandomRange(1,popsize) ;
    end;
    p1 := 1;
    p2 := 1;
    while p1 = p2 do             //ѡ����λ��
    begin
      randomize ;
      p1 := RandomRange(1, n_guimo);
      p2 := RandomRange(1, n_guimo);
    end;
    if p1 > p2 then  //����s1<s2
    begin
      mid := p1;
      p1 := p2;
      p2 := mid;
    end;
    set1 := [];
    for a := p1 to p2 do  //������1�Ĳ���Ƭ��  ���뼯�� ��������2���ж�
    begin
      set1 := set1 + [jiepop[s1].gongxu[a].xu];
    end;
    lab2 := 0;  //��2�ı����±�
    for a := 1 to (p1 - 1) do     //�Ӹ�2��ѡ�������1ǰ��
    begin
      repeat
        lab2 := lab2 + 1;
      until not (jiepop[s2].gongxu[lab2].xu in set1);
      jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
    end;
    for a := p2 + 1 to n_guimo do     //�Ӹ�2��ѡ�������1ǰ��
    begin
      repeat
        lab2 := lab2 + 1;
      until not (jiepop[s2].gongxu[lab2].xu in set1);
      jiepop[s1].gongxu[a] := jiepop[s2].gongxu[lab2];
    end;
    EDA_decode2(s1);
    EDA_evaluate2(s1);
    if (jiepop[s1].CTp < bestjie.CTp)OR ((jiepop[s1].CTp = bestjie.CTp)AND(jiepop[s1].LSI < bestjie.LSI) )then //����CT
    begin
     // Memo1.Lines.Add('OX find��' + inttostr(jiepop[s1].CTp)+IntToStr(s1)+'  SI: '+floatTOSTR(bestjie.LSI));
      if (jiepop[s1].CTp < bestjie.CTp) then
      begin
        CT := bestjie.CTp - 1;
      end;
      bestjie:=jiepop[s1];
      bestkexingjie:=kexingjiepop[s1];
      EDA_SI := bestjie.LSI;
      EDA_CT := bestjie.CTp;
      EDA_update_M;
    end
  end;
end;
//����ʽ+���ʽ��ʼ����Ⱥ
//Ĭ��30+70
procedure  TForm1.savebestdate();
var
  a,b,c:integer;
begin
  ExcelApp.Cells[line_sb, crow_sb].Value :=inttostr(bestjie.CTp);
  ExcelApp.Cells[line_sb, crow_sb+1].Value :=floattostr(bestjie.LSI);
  line_sb:=line_sb+1;

end;
procedure TForm1.EDA_Createpop_Intial();
var
  Wp: array[1..250] of double; //�����Ȩ������
  C1, C2: double;
  i: integer;
  t: array[1..250] of Integer; //ÿ�������ʱ��

  totalT: integer;
  a, b, c, d: integer;
  number: integer;
  TotalHouxu: integer;
  ind: Integer;
label
  1;
begin
  totalT := 0;  //ָ��1   ʱ��
  for i := 1 to n_guimo do
    totalT := totalT + jiepop[299].gongxu[i].shijian;

  TotalHouxu := 0;
  for a := 1 to n_guimo do//�����ܵĺ�������[�̶�ֵ]
    TotalHouxu := TotalHouxu + jiepop[299].gongxu[a].bnum;

  for d := 1 to popsize do
  begin
    C1 := random(10) / 10;
    C2 := 1 - C1;  //Ȩ��֮�� 1
    jiepop[300] := jiepop[299];
    for i := 1 to N_guimo do
    begin
      jiepop[300].gongxu[i].Wp := C1 * jiepop[300].gongxu[i].shijian / totalT + C2 * jiepop[300].gongxu[i].bnum / TotalHouxu//���ÿ�������Ȩ��
    end;
    maopao();
    jiepop[d] := jiepop[300];
    jiepop[300] := jiepop[299];
  end;
 // RandomCreateJie(  );// ����� // 70��
  for ind := 1 to popsize do //��������
  begin
    EDA_decode(ind);
    EDA_evaluate(ind);
  end;
end;
//����ʽ+���ʽ��ʼ����Ⱥ
//Ĭ��30+70

procedure TForm1.DABC_CreateJIEpop();
var
  Wp: array[1..250] of double; //�����Ȩ������
  C1, C2: double;
  i: integer;
  t: array[1..250] of Integer; //ÿ�������ʱ��

  totalT: integer;
  a, b, c, d: integer;
  number: integer;
  TotalHouxu: integer;
label
  1;
begin
  totalT := 0;  //ָ��1   ʱ��
  for i := 1 to n_guimo do
    totalT := totalT + jiepop[200].gongxu[i].shijian;

  for a := 1 to n_guimo do//�����ܵĺ�������[�̶�ֵ]
    TotalHouxu := TotalHouxu + jiepop[200].gongxu[a].bnum;

  for d := 1 to Trunc(0.3 * popsize) do        //30��
  begin
    Randomize;
    C1 := random(10) / 10;
    C2 := 1 - C1;  //Ȩ��֮�� 1
    jiepop[200] := jiepop[199];   //102һֱ����ԭ������
    for i := 1 to N_guimo do
    begin
      jiepop[200].gongxu[i].Wp := C1 * jiepop[200].gongxu[i].shijian / totalT + C2 * jiepop[200].gongxu[i].bnum / TotalHouxu//���ÿ�������Ȩ��
    end;
    //��������  ������Ϊʲô��ʽ��
    maopao();
    jiepop[d] := jiepop[200];
    jiepop[200] := jiepop[199];
  end; //����ʽ�������ɳ�ʼ��
  RandomCreateJie()// ����� // 70��
end;
//ð������  ///�ų�ʼ����   //����

procedure TForm1.maopao();
var
  i, j, k: integer;
  temp: structure_gongxu;
begin
  for i := (n_guimo - 1) downto 1 do
  begin
    for j := 1 to i do
    begin                          //����
      if jiepop[300].gongxu[j].Wp < jiepop[300].gongxu[j + 1].Wp then
      begin
        temp := jiepop[300].gongxu[j];
        jiepop[300].gongxu[j] := jiepop[300].gongxu[j + 1];
        jiepop[300].gongxu[j + 1] := temp;
      end;
    end;
  end;
end;
//�������ۺ���
//����:INDIVIAL  [����������Ч]

procedure TForm1.DABC_evaluate(var ind: integer);
var
  b: Integer;
  MaxT: Integer; //�����ߵ����CTpʱ��
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..200] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
  FLAG:Integer;
begin
  MaxT := 0;
  for A := 1 to zhannumber do  // ����ÿ��վ���깤ʱ��CTp
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //�������վ�깤ʱ��
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  kexingjiepop[ind].CTp := MaxT;   //�õ�һ������վ����CTp
  jiepop[ind].CTp := kexingjiepop[ind].CTp;
 //����ƽ��ָ��SI
  for A := 1 to zhannumber do //����ÿ��վ��ʵ�ʹ���ʱ��
  begin
    Light[A] := 0;
    Right[A] := 0;
    b := 1;   //���
    repeat
      Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Light[A] > Light_max) then
    begin
      Light_max := Light[A];
    end;
    b := 1;   //�ұ�
    repeat
      Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Right[A] > Right_max) then
    begin
      Right_max := Right[A];
    end;
  end;
  MAX_T := max(Light_max, Right_max);
  LSI := 0;
  for A := 1 to zhannumber do
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;
  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;
  //DABC��������(����ĩβ����)
  if (iteration > 0) and (jiepop[ind].CTp = oldjiepop[ind].CTp) then//DABC��������
  begin
    compare1 := 0;
    compare2 := 0;
    for b := 1 to zhannumber do//Ȩ�ؽ��ԽСԽ��
    begin                       //��վ�Ľ��Ĵ�ŵ����վ����ģ�ֱ�Ӹ������
      compare1 := compare1 + (zhannumber - b) * (max(0, kexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (Bct + jiepop[ind].CTp) / 2) + max(0, BCT - (jiepop[ind].CTp - BCT) / 2 - kexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
      compare2 := compare2 + (zhannumber - b) * (max(0, oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (BCT + jiepop[ind].CTp) / 2) + max(0, BCT - (jiepop[ind].CTp - BCT) / 2 - oldkexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
    end;
    jiepop[ind].DABC_L2:=compare1;
    if compare2 <= compare1 then  //ԭ���Ľ�����򣬻���ȥ
    begin
      jiepop[ind] := oldjiepop[ind];
      kexingjiepop[ind] := oldkexingjiepop[ind];
    end
    else   //�½����  ����old
    begin
      jiepop[ind].DABC_L2:=compare1;
      oldjiepop[ind] := jiepop[ind];
      oldkexingjiepop[ind] := kexingjiepop[ind];
    end;
  end
  else
  if (iteration > 0) and (oldjiepop[ind].CTp < jiepop[ind].CTp) then  //����ȥ
  begin
    jiepop[ind] := oldjiepop[ind];
    kexingjiepop[ind] := oldkexingjiepop[ind];
  end
  else   //�½����  ����old
  if (iteration > 0) and (oldjiepop[ind].CTp > jiepop[ind].CTp) then
  begin
    oldjiepop[ind] := jiepop[ind];
    oldkexingjiepop[ind] := kexingjiepop[ind];
  end;
end;
procedure TForm1.DABC_evaluate_ini(var ind: Integer);
var
  b: Integer;
  MaxT: Integer; //�����ߵ����CTpʱ��
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..200] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  MaxT := 0;
  for A := 1 to zhannumber do  // ����ÿ��վ���깤ʱ��CTp
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //�������վ�깤ʱ��
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  if MaxT = 0 then
  begin
    MaxT := 0;
  end;
  kexingjiepop[ind].CTp := MaxT;   //�õ�һ������վ����CTp
  jiepop[ind].CTp := kexingjiepop[ind].CTp;
  for b := 1 to zhannumber do//Ȩ�ؽ��ԽСԽ��
  begin                       //��վ�Ľ��Ĵ�ŵ����վ����ģ�ֱ�Ӹ������
    compare1 := compare1 + (zhannumber - b) * (max(0, kexingjiepop[ind].zuoBianzhan[b].ZhanCTp - (Bct + CT) / 2) + max(0, BCT - (CT - BCT) / 2 - kexingjiepop[ind].zuoBianzhan[b].ZhanCTp));
  end;
  jiepop[ind].DABC_L2:=compare1;
 //����ƽ��ָ��SI
  for A := 1 to zhannumber do //����ÿ��վ��ʵ�ʹ���ʱ��
  begin
    Light[A] := 0;
    Right[A] := 0;
    b := 1;   //���
    repeat
      Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Light[A] > Light_max) then
    begin
      Light_max := Light[A];
    end;
    b := 1;   //�ұ�
    repeat
      Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Right[A] > Right_max) then
    begin
      Right_max := Right[A];
    end;
  end;

  MAX_T := max(Light_max, Right_max);
  LSI := 0;
  for A := 1 to zhannumber do
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;

  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;
end;
//�ع�վ������
//�õ�LSIƽ��ָ��
//������ʹ���ع��Ľ��

procedure TForm1.Restructure_evaluate(var ind: integer);
var
  b: Integer;
  MaxT: Integer; //�����ߵ����CTpʱ��
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  Light, Right: array[1..20] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  MaxT := 0;
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  kexingjiepop[ind].CTp := MaxT;   //�õ�һ������վ����CTp
  jiepop[ind].CTp := kexingjiepop[ind].CTp;
  //����վ��ʵ�ʹ���ʱ����ΪĿ����ƽ�� //����ƽ��ָ��SI
  Light[A] := 0;
  Right[A] := 0;
  b := 1;   //���
  Light_max := jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
  repeat
    if jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian > Light_max then
    begin
      Light_max := jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
    end;
    Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
    b := b + 1;
  until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
  b := 1;   //�ұ�
  Right_max := jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
  repeat
    if jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian > Right_max then
    begin
      Right_max := jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
    end;
    Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
    b := b + 1;
  until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;

  MAX_T := max(Light_max, Right_max);     //ֻ����һ��վ�����ұ�ƫ��
  LSI := 0;                              //��ֵ��С˵��������
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;

  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;    //198����  ֻ���ع�վ����Ϣ
  //����SI ����
end;
//IG���ۺ���

procedure TForm1.IG_evaluate(var ind: integer);
var
  b: Integer;
  MaxT: Integer; //�����ߵ����CTpʱ��
  evaluate2: Integer;
  compare1, compare2: double;
  A: Integer;
  T_Right, T_Light: Integer;
  pzhan: Integer;
  NewSI: Double;
  freet1: Integer;
  freet2: Integer;
  freet3: Integer;
  freet4: Integer;
  freet4_1: Integer;
  w1, w2, w3, w4: Integer;
  Light, Right: array[1..20] of Integer;
  Light_max, Right_max: Integer;
  MAX_T: Integer;
  LSI: Double;
begin
  MaxT := 0;
  for A := 1 to zhannumber do  // ����ÿ��վ���깤ʱ��CTp
  begin
    if (kexingjiepop[ind].zuobianzhan[A].zongshijian >= kexingjiepop[ind].youbianzhan[A].zongshijian) then
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].zuobianzhan[A].zongshijian
    else
      kexingjiepop[ind].zuobianzhan[A].ZhanCTp := kexingjiepop[ind].youbianzhan[A].zongshijian;
  end;
  MaxT := kexingjiepop[ind].zuoBianzhan[1].ZhanCTp;
  for b := 2 to zhannumber do      //�������վ�깤ʱ��
  begin
    if kexingjiepop[ind].zuoBianzhan[b].ZhanCTp > MaxT then
    begin
      MaxT := kexingjiepop[ind].zuoBianzhan[b].ZhanCTp;
    end;
  end;
  kexingjiepop[ind].CTp := MaxT;   //�õ�һ������վ����CTp
  jiepop[ind].CTp := kexingjiepop[ind].CTp;
  //����SI
 //����ƽ��ָ��SI
  for A := 1 to zhannumber do //����ÿ��վ��ʵ�ʹ���ʱ��
  begin
    Light[A] := 0;
    Right[A] := 0;
    b := 1;   //���
    repeat
      Light[A] := Light[A] + jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Light[A] > Light_max) then
    begin
      Light_max := Light[A];
    end;
    b := 1;   //�ұ�
    repeat
      Right[A] := Right[A] + jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian;
      b := b + 1;
    until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
    if (A = 1) or (Right[A] > Right_max) then
    begin
      Right_max := Right[A];
    end;
  end;

  MAX_T := max(Light_max, Right_max);
  LSI := 0;
  for A := 1 to zhannumber do
  begin
    LSI := LSI + Sqr(MAX_T - Light[A]);
    LSI := LSI + Sqr(MAX_T - Right[A]);
  end;

  LSI := Sqrt((LSI) / (2 * zhannumber));
  jiepop[ind].LSI := LSI;

  begin  //��SIΪ����  ������
    if (BEST_LSI > jiepop[ind].LSI) and (jiepop[ind].LSI <= ct) and (ITERATION > 0) then
    begin
      BEST_LSI := LSI;
      BEST_LSI_jiepop := jiepop[ind];
      BEST_LSI_kexingjiepop := kexingjiepop[ind];
    end;
  end;
  //����SI����
  if (iteration = 0) or (jiepop[ind].CTp = oldjiepop[ind].CTp) then
  begin
    freet1 := 0;
    freet2 := 0;
    freet3 := 0;
    freet4 := 0;
    w1 := 10;  //����
    w2 := 5;
    w3 := 1;
    w4 := 1;
    for A := 1 to zhannumber do  //ĩβ����
    begin             //���һ̨վ�ĳ������ܲ�������  ����û˵��  ����ȡ����ֵ
      freet1 := (Trunc(freet1 + abs(CT - kexingjiepop[ind].zuoBianzhan[A].zongshijian) + abs(CT - kexingjiepop[ind].youBianzhan[A].zongshijian)));
    end;
    freet1 := Trunc(w1 * freet1 / (2 * zhannumber));

    for A := 1 to zhannumber do   //�м����
    begin
      b := 1;
      repeat
        freet2 := freet2 + (jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian);
        b := b + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
      freet2 := freet2 + kexingjiepop[ind].zuoBianzhan[A].zongshijian - freet2; //�õ����վ�ڿ���

      b := 1;
      repeat
        freet2 := freet2 + (jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian);
        b := b + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
      freet2 := freet2 + kexingjiepop[ind].youBianzhan[A].zongshijian - freet2; //�õ����վ�ڿ���
    end;
    freet2 := Trunc(w2 * freet2 / (2 * zhannumber));

    for A := 1 to zhannumber do  //ĩβ���� ����
    begin
      freet3 := Trunc(freet3 + sqr(CT - kexingjiepop[ind].zuoBianzhan[A].zongshijian) + sqr(CT - kexingjiepop[ind].youBianzhan[A].zongshijian));
    end;
    freet3 := Trunc(w3 * sqrt(freet3 / (2 * zhannumber)));

    for A := 1 to zhannumber do   //�м����
    begin
      b := 1;
      freet4_1 := 0;
      repeat
        freet4_1 := freet4_1 + (jiepop[199].gongxu[kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b]].shijian);
        b := b + 1;
      until kexingjiepop[ind].zuoBianzhan[A].kexingGongxu[b] = 0;
      freet4 := freet4 + sqr(kexingjiepop[ind].zuoBianzhan[A].zongshijian - freet4_1); //�õ����վ�ڿ���

      b := 1;
      freet4_1 := 0;
      repeat
        freet4_1 := freet4_1 + (jiepop[199].gongxu[kexingjiepop[ind].youBianzhan[A].kexingGongxu[b]].shijian);
        b := b + 1;
      until kexingjiepop[ind].youBianzhan[A].kexingGongxu[b] = 0;
      freet4 := freet4 + sqr(kexingjiepop[ind].youBianzhan[A].zongshijian - freet4_1); //�õ����վ�ڿ���
    end;
    freet4 := Trunc(w4 * sqrt(freet4 / (2 * zhannumber)));

    jiepop[ind].IG_indexCT := freet1 + freet2 + freet3 + freet4; //��Ȩ����ָ��
    if iteration > 0 then  //iteration��ֻ���㲻�Ƚ�
    begin
      if jiepop[ind].IG_indexCT <= oldjiepop[ind].IG_indexCT then
      begin
        oldjiepop[ind] := jiepop[ind];               //����
        oldkexingjiepop[ind] := kexingjiepop[ind];
      end
      else if jiepop[ind].IG_indexCT > oldjiepop[ind].IG_indexCT then
      begin  //����
        jiepop[ind] := oldjiepop[ind];               //����
        kexingjiepop[ind] := oldkexingjiepop[ind];
      end;

    end;
  end
  else if (iteration > 0) and (jiepop[ind].CTp < oldjiepop[ind].CTp) then  //�¸���
  begin
    oldjiepop[ind] := jiepop[ind];               //����
    oldkexingjiepop[ind] := kexingjiepop[ind];
  end
  else if (iteration > 0) and (jiepop[ind].CTp > oldjiepop[ind].CTp) then //�½����
  begin
    jiepop[ind] := oldjiepop[ind];               //����
    kexingjiepop[ind] := oldkexingjiepop[ind];
  end;
end;

function TForm1.comp_SI(var ind: Integer): Double;
var
  a: Integer;
  MAXTIME: Integer;
  sumsqr: Integer;
begin
  MAXTIME := kexingjiepop[ind].Station[1].OverTime;
  for a := 1 to zhannumber - 1 do
  begin
    if kexingjiepop[ind].Station[a].OverTime > kexingjiepop[ind].Station[a + 1].OverTime then
    begin
      MAXTIME := kexingjiepop[ind].Station[a + 1].OverTime;
    end;
  end;
  sumsqr := 0;
  for a := 1 to zhannumber do
  begin
    sumsqr := sumsqr + Sqr(MAXTIME - kexingjiepop[ind].Station[a].OverTime);
  end;
  SI := 0;
  SI := Sqrt(sumsqr);
  Result := SI;
end;
//CT������С
//���룺��ǰ��������,��ǰCT
//�������CT��ֵ

procedure TForm1.DABC_ReCT();
begin
  CT := CT - Trunc(max(1, IndexD * (iterationMAX - 2 * iteration) / iterationMax) + 1); //10  ��  100
end;

procedure TForm1.DABC_ReCT1();
begin
  CT := BestCT - 1;
end;

//�����
procedure TForm1.RandomCreateJie();
var
  b: structure_gongxu;
  a, c: integer;
  weizhi1, weizhi2: integer;
begin
  for a := (Trunc(popsize * 0.3) + 1) to popsize do
  begin
    jiepop[200] := jiepop[199];
    for c := 1 to n_guimo do //������Ҵ���
    begin
      weizhi1 := random(n_guimo) + 1;
      weizhi2 := random(n_guimo) + 1;
      b := jiepop[200].gongxu[weizhi1];
      jiepop[200].gongxu[weizhi1] := jiepop[200].gongxu[weizhi2];
      jiepop[200].gongxu[weizhi2] := b;
    end;
    jiepop[a] := jiepop[200];
    jiepop[200] := jiepop[199];
  end;
end;
//�������õļ��Ͻ�

procedure TForm1.DABC20set(var scout_number: Integer);
var
  b: structure_gongxu;
  a, c: integer;
  weizhi1, weizhi2: integer;
begin
  for a := 1 to scout_number do
  begin
    jiepop[200] := jiepop[199];
    for c := 1 to n_guimo do //������Ҵ���  //
    begin
      weizhi1 := 1;
      weizhi2 := 1;
      while (weizhi1 = weizhi2) do //ѡȡ������ͬ�ĵ�
      begin
        randomize ;
        weizhi1 := RandomRange(1, n_guimo);
        weizhi2 := RandomRange(1, n_guimo);
      end;
      b := jiepop[200].gongxu[weizhi1];
      jiepop[200].gongxu[weizhi1] := jiepop[200].gongxu[weizhi2];
      jiepop[200].gongxu[weizhi2] := b;
    end;
    Scoutjiepop[a] := jiepop[200];
  end;
end;
//EDA����ͼ



end.
