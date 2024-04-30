package javabasic.oop;

public class Board {

	private int articleNo;
	private String articleSubjeck;
	private String articleContent;
	private String articleWriter;

	public Board(int articleNo, String articleSubjeck, String articleContent, String articleWriter) {
		super();
		this.articleNo = articleNo;
		this.articleSubjeck = articleSubjeck;
		this.articleContent = articleContent;
		this.articleWriter = articleWriter;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getArticleSubjeck() {
		return articleSubjeck;
	}

	public void setArticleSubjeck(String articleSubjeck) {
		this.articleSubjeck = articleSubjeck;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public String getArticleWriter() {
		return articleWriter;
	}

	public void setArticleWriter(String articleWriter) {
		this.articleWriter = articleWriter;
	}

	@Override
	public String toString() {
		return "Board [articleNo=" + articleNo + ", articleSubjeck=" + articleSubjeck + ", articleContent="
				+ articleContent + ", articleWriter=" + articleWriter + "]";
	}
	
}
