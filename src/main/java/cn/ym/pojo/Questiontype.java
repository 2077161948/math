package cn.ym.pojo;

import java.util.Date;

public class Questiontype {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column questiontype.id
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column questiontype.createInfo
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    private String createinfo;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column questiontype.createTime
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    private Date createtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column questiontype.name
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column questiontype.status
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    private String status;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column questiontype.teacher_id
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    private Integer teacherId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column questiontype.id
     *
     * @return the value of questiontype.id
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column questiontype.id
     *
     * @param id the value for questiontype.id
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column questiontype.createInfo
     *
     * @return the value of questiontype.createInfo
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public String getCreateinfo() {
        return createinfo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column questiontype.createInfo
     *
     * @param createinfo the value for questiontype.createInfo
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public void setCreateinfo(String createinfo) {
        this.createinfo = createinfo == null ? null : createinfo.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column questiontype.createTime
     *
     * @return the value of questiontype.createTime
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column questiontype.createTime
     *
     * @param createtime the value for questiontype.createTime
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column questiontype.name
     *
     * @return the value of questiontype.name
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column questiontype.name
     *
     * @param name the value for questiontype.name
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column questiontype.status
     *
     * @return the value of questiontype.status
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public String getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column questiontype.status
     *
     * @param status the value for questiontype.status
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column questiontype.teacher_id
     *
     * @return the value of questiontype.teacher_id
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public Integer getTeacherId() {
        return teacherId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column questiontype.teacher_id
     *
     * @param teacherId the value for questiontype.teacher_id
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }
}