enum RequirementPriority {
    BLOCKER("requirement.blocker"),
    CRITICAL("requirement.critical"),
    MAJOR("requirement.major"),
    MINOR("requirement.minor"),
    TRIVIAL("requirement.trivial");

    String translationKey;
    private RequirementPriority(String translationKey) {
        this.translationKey = translationKey
    }

    public String getTranslationKey() {
        return this.translationKey
    }
}