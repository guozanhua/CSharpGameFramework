story(battle_main)
{
  local
  {
  	@pt(0);
  };
  onmessage("start")
  {   
    wait(1000);
    publishgfxevent("loading_complete", "ui");
    wait(1000);    
    createnpc(1000,vector3(65,1000,70),0,3,1,"ai_player",stringlist("Ai/ailogic_player.dsl"));
    setleaderid(unitid2objid(1000));
    npcsetformation(1000,0);
    loop(4){
      createnpc(1001+$$,vector3(55+rndint(0,10),1000,65+rndint(0,10)),0,3,$$+2,"ai_member",stringlist("Ai/ailogic_member.dsl"),getleaderid());
      npcsetformation(1001+$$,$$+1);
    };
    camerafollow(1000);
    sendgfxmessage("Main Camera", "LightScreen", 3000);
    log("scene2");
    loop(26){
    	@pt = getposition("pt"+($$%3));
      createnpc(1006+$$,rndvector3(@pt,10),0,4,$$+6,"ai_normal",stringlist("Ai/ailogic_normal.dsl"));
    };
    wait(1000);
    publishgfxevent("ui_show_paopao","ui",getleaderid(),"鼠标点击地面短暂改变主角的移动目的地。");
    //firemessage("push_tip_info", "史前，或许还没有人类或者不能称之为人类的时候，最早降临地球的那些智慧生物，被称为神");
    wait(5000);
    publishgfxevent("ui_show_paopao","ui",getleaderid(),"todo:技能与战斗数值实验");
    
    startstory("auto_battle");
  };
  onmessage("move_to")
  {
  	npcmove(1000,vector3($0,$1,$2));
  };
  onmessage("all_killed")
  {
  	firemessage("show_dlg",998);
  	clearmessage("show_dlg");
  };
  onmessage("npc_killed:1000")
  {
    firemessage("show_dlg",999);
    clearmessage("show_dlg");
  };
  onmessage("dialog_over",998)
  {
    terminate();
    closebattle(10001);
  };
  onmessage("dialog_over",999)
  {
    terminate();
    closebattle(10001);
  };
};