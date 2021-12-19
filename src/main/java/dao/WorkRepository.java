package dao;
import java.util.ArrayList;
import dto.Work;
public class WorkRepository {
	
    private ArrayList<Work>listOfWorks = new ArrayList<Work>();
    private static WorkRepository instance = new WorkRepository();
    
    public static WorkRepository getInstance() {
    	return instance;
    }
    
    public ArrayList<Work> getAllWorks(){
        return listOfWorks;
    }
    
    public void addWork(Work work)
	{
		listOfWorks.add(work);
	}
	
	public Work getWorkById(String workId) {
		Work workById = null;
		
		for(int i=0; i<listOfWorks.size(); i++) {
			Work work = listOfWorks.get(i);
			if(work != null && work.getWorkId() != null
				&& work.getWorkId().equals(workId)){
					workById = work;
					break;
			}
		}
		
		return workById;
	}
	
    public WorkRepository(){
        
    	Work work01 = new Work("2021110101", "마구마구 16th Aniv : THE SWING", 1650000);
    	work01.setDescription("마구마구 오픈 16주년을 기념하는 원화 이미지.");
    	work01.setCategory("스포츠");
    	work01.setWorker("마구마구");
    	work01.setUnitsInStock(25);
    	work01.setReleaseDate("2021/ 11");
    	work01.setCondition("new");
    	work01.setFilename("NFT_magumagu01.PNG");

    	Work work02 = new Work("2021110301", "aespa - black mamba", 250000);
    	work02.setDescription("SM엔터테인먼트의 4인조 걸그룹 aespa의 데뷔 앨범 자켓사진.");
    	work02.setCategory("K-Pop");
    	work02.setWorker("SM ent");
    	work02.setUnitsInStock(30);
    	work02.setReleaseDate("2020/ 11");
    	work02.setCondition("new");
    	work02.setFilename("NFT_aespa01.PNG");
        
    	Work work03 = new Work("2021110501", "Mona Lisa", 10000000);
    	work03.setDescription("레오나르도 다빈치의 대표작이자 현재 프랑스 파리 루브르 박물관에 전시되어있는 작품을 NFT로 만나보세요.");
    	work03.setCategory("Art");
    	work03.setWorker("레오나르도 다빈치");
    	work03.setUnitsInStock(5);
    	work03.setReleaseDate("1503년");
    	work03.setCondition("new");
    	work03.setFilename("NFT_monalisa01.PNG");
		
        listOfWorks.add(work01);
        listOfWorks.add(work02);
        listOfWorks.add(work03);
    }
    
    
    
}
 
