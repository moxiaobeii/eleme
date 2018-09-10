package eleme.entity;

/**
 * Created by moxiaobei on 2018/9/9.
 **/
public class Collection {

    private int collectionBusiness_id;
    private int bid;
    private int userId;
    private int status;

    public int getCollectionBusiness_id() {
        return collectionBusiness_id;
    }

    public void setCollectionBusiness_id(int collectionBusiness_id) {
        this.collectionBusiness_id = collectionBusiness_id;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
