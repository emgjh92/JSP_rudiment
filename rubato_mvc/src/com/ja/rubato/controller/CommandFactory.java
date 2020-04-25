package com.ja.rubato.controller;

import java.util.HashMap;

import com.ja.rubato.controller.command.WriteContentProcessHandler;
import com.ja.rubato.controller.command.*;

public class CommandFactory {
private HashMap<String,CommandHandler> commandMap;
	
	public CommandFactory() {
		commandMap = new HashMap<String,CommandHandler>();
		commandMap.put("/index.do", new IndexPageHandler());
		//commandMap.put("/board_list.do", new BoardListPageHandler());
		//commandMap.put("/board_view.do", new BoardViewPageHandler());
		//commandMap.put("/board_write.do", new BoardWritePageHandler());
		commandMap.put("/join_member_page.do", new JoinMemberPageHandler());
		commandMap.put("/join_member_process.do", new JoinMemberProcessHandler());
		commandMap.put("/logout_process.do", new LogoutProcessHandler());
		commandMap.put("/login_process.do", new LoginProcessHandler());
		commandMap.put("/board_list.do", new MainPageHandler());
		commandMap.put("/board_view.do", new ReadContentPageHandler());
		commandMap.put("/delete_content_process.do", new DeleteContentProcessHandler());
		commandMap.put("/write_content_process.do", new WriteContentProcessHandler());
		commandMap.put("/board_write.do", new WriteContentPageHandler());
		commandMap.put("/update_read_count_process.do", new UpdateCountProcessHandler()); //조회수 플러스
		commandMap.put("/board_modify_process.do", new UpdateContentProcessHandler());
		commandMap.put("/board_modify_page.do", new UpdateContentPageHandler());
		//commandMap.put("/pagingProcess.do",new MainPageHandler());
		//pagingProcess.do 를 /board_list.do(MainPageHandler) 하나로 일괄 처리 하게 합침
		
	}
	
	
	public CommandHandler getCommandHandler(String command) {
		
		return commandMap.get(command);
		
	}
}
