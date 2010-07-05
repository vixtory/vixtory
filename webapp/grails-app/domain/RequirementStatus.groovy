enum RequirementStatus {
    OPEN("requirement.open"),
    RESOLVED("requirement.resolved");

    String translationKey;
    private RequirementStatus(String translationKey) {
        this.translationKey = translationKey
    }

    public String getTranslationKey() {
        return this.translationKey
    }
}