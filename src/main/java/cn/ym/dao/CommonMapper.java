package cn.ym.dao;

import cn.ym.pojo.Common;
import cn.ym.pojo.CommonExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommonMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table common
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    int countByExample(CommonExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table common
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    int deleteByExample(CommonExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table common
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table common
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    int insert(Common record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table common
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    int insertSelective(Common record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table common
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    List<Common> selectByExample(CommonExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table common
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    Common selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table common
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    int updateByExampleSelective(@Param("record") Common record, @Param("example") CommonExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table common
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    int updateByExample(@Param("record") Common record, @Param("example") CommonExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table common
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    int updateByPrimaryKeySelective(Common record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table common
     *
     * @mbggenerated Tue Dec 18 10:33:18 CST 2018
     */
    int updateByPrimaryKey(Common record);
}