package data.inter;

import java.util.List;
import java.util.Map;

import data.dto.RecipeDto;

public interface RecipeServiceInter {
	public int getTotalCount(); //모든 레시피의 갯수
	
	//레시피 출력 관련
	public List<RecipeDto> getAllRecipe(); // 모든 레시피를 읽어온다
	public List<RecipeDto> getRecipeList(int startnum, int limit); //startnum부터 limit 개의 레시피를 읽어온다 (
	public RecipeDto getRecipe(int idx); // RECIPE_IDX가 idx인 레시피 하나를 읽어온다
	public int getRecipeRec(int idx); //레시피의 평가 추천수 반환
	public int getRecipeRate(int idx); // 레시피의 평점 반환
	public int getRecipeVolunteer(int idx); //레시피의 평가 인원 수 반환
	
	//업데이트 관련
	public void addRecommend(int idx); // RECIPE_IDX가 idx인 레시피의 추천수 1 증가
	public void addRate(int idx, int rate); // RECIPE_IDX가 idx인 레시피에 평점 전달
	public void addView(int idx); //RECIPE_IDX가 idx인 레시피의 조회수 1 증가
	
	//수정, 삭제
	public void updateRecipe(RecipeDto dto);	// 레시피 수정
	public void deleteRecipe(int idx); // 레시피 삭제
	
	//검색 관련
	public List<RecipeDto> findCategory(String category); //Category이 category인 레시피 검색
	public List<RecipeDto> findCooking(String cooking); // Cooking이 cooking인 레시피 검색
	
	//랭킹 관련

	public List<RecipeDto> getRankingList(int startnum, int limit); //랭킹순으로 startnum부터 limit개의 레시피를 읽어온다

	//검색 관련
	public List<Integer> searchRecipe (String searchWord);
	public List<RecipeDto> getViewRankingList(int startnum, int limit); //조회수 랭킹순으로
	public List<RecipeDto> getNewRankingList(int startnum, int limit); //최신순으로

	//컬렉션 관련
	public List<RecipeDto> getCategoryList(String category, String item, int startnum, int limit);
	public int getCategoryCount(String category, String item);

}
