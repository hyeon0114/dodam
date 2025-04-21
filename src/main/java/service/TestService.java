package service;

import repository.DodamRepository;

public class TestService {
    private final DodamRepository dodamRepository;
    private final DodamService dodamService;

    public TestService(DodamRepository dodamRepository, DodamService dodamService) {
        this.dodamRepository = dodamRepository;
        this.dodamService = dodamService;
    }
}
