package bankingsystem.backend.dao;

import bankingsystem.backend.entity.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Long> {

    List<Transaction> findByTransferFrom(String transferFrom);

    List<Transaction> findByTransferTo(String transferTo);

}