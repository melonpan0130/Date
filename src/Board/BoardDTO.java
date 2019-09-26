package Board;

import java.sql.Timestamp;

public class BoardDTO {
	private int userid;
	private int boardid;
	private String title;
	private String content;
	private Timestamp starttime;
	private Timestamp endtime;
	private byte[] mainimg;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getBoardid() {
		return boardid;
	}
	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getStarttime() {
		return starttime;
	}
	public void setStarttime(Timestamp starttime) {
		this.starttime = starttime;
	}
	public Timestamp getEndtime() {
		return endtime;
	}
	public void setEndtime(Timestamp endtime) {
		this.endtime = endtime;
	}
	public byte[] getMainimg() {
		return mainimg;
	}
	public void setMainimg(byte[] mainimg) {
		this.mainimg = mainimg;
	}
	
}
