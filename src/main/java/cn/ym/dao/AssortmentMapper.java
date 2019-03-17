package cn.ym.dao;

import cn.ym.pojo.Assortment;
import cn.ym.pojo.AssortmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AssortmentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table assortment
     *
     * @mbggenerated Sat Dec 22 15:26:15 CST 2018
     */
    int countByExample(AssortmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table assortment
     *
     * @mbggenerated Sat Dec 22 15:26:15 CST 2018
     */
    int deleteByExample(AssortmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table assortment
     *
     * @mbggenerated Sat Dec 22 15:26:15 CST 2018
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table assortment
     *
     * @mbggenerated Sat Dec 22 15:26:15 CST 2018
     */
    int insert(Assortment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table assortment
     *
     * @mbggenerated Sat Dec 22 15:26:15 CST 2018
     */
    int insertSelective(Assortment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table assortment
     *
     * @mbggenerated Sat Dec 22 15:26:15 CST 2018
     */
    List<Assortment> selectByExample(AssortmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table assortment
     *
     * @mbggenerated Sat Dec 22 15:26:15 CST 2018
     */
    Assortment selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table assortment
     *
     * @mbggenerated Sat Dec 22 15:26:15 CST 2018
     */
    int updateByExampleSelective(@Param("record") Assortment record, @Param("example") AssortmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table assortment
     *
     * @mbggenerated Sat Dec 22 15:26:15 CST 2018
     */
    int updateByExample(@Param("record") Assortment record, @Param("example") AssortmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table assortment
     *
     * @mbggenerated Sat Dec 22 15:26:15 CST 2018
     */
    int updateByPrimaryKeySelective(Assortment record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table assortment
     *
     * @mbggenerated Sat Dec 22 15:26:15 CST 2018
     */
    int updateByPrimaryKey(Assortment record);
}