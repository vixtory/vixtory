enum WorkStatus {
    IN_PROGRESS("common.inprogress"),
    CLOSED("common.closed");

    String translationKey;
    private WorkStatus(String translationKey) {
        this.translationKey = translationKey
    }

    public String getTranslationKey() {
        return this.translationKey
    }
}