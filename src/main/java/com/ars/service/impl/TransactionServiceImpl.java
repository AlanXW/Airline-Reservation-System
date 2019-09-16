package com.ars.service.impl;

import com.ars.dao.TransactionMapper;
import com.ars.entity.Transaction;
import com.ars.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    TransactionMapper mapper;

    @Override
    public int insert(Transaction record) {
        return mapper.insert(record);
    }

    @Override
    public ArrayList<Transaction> selectByFlightIdQueue(Integer id) {
        return mapper.selectByFlightIdQueue(id);
    }

    @Override
    public ArrayList<Transaction> selectByUserIdQueue(Integer id) {
        return mapper.selectByUserIdQueue(id);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }
}
