package com.ars.dao;

import com.ars.entity.Transaction;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface TransactionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Transaction record);

    int insertSelective(Transaction record);

    Transaction selectByPrimaryKey(Integer id);

    ArrayList<Transaction> selectByFlightIdQueue(Integer id);

    ArrayList<Transaction> selectByUserIdQueue(Integer id);

    int updateByPrimaryKeySelective(Transaction record);

    int updateByPrimaryKey(Transaction record);
}