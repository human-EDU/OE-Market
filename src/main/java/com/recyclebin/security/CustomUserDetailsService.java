package com.recyclebin.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.recyclebin.domain.CustomUser;
import com.recyclebin.domain.MemberVO;
import com.recyclebin.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Autowired @Setter
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn(username);
		log.warn(mapper.read(username));
		MemberVO vo = mapper.read(username);
		return vo != null && vo.isEnabled() ? new CustomUser(vo) : null;
	}

}
