package multicampus.connect.billy.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MemberDAO {

    public List<MemberDTO> memberlist();
}
