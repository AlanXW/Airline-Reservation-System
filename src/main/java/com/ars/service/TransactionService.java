package com.ars.service;

import com.ars.entity.Transaction;

import java.util.ArrayList;

public interface TransactionService {
    ArrayList<Transaction> selectByFlightIdQueue(Integer id);

    ArrayList<Transaction> selectByUserIdQueue(Integer id);

    int deleteByPrimaryKey(Integer id);

    int insert(Transaction record);
}
