enum Iframe {
    FIRST("1600px"),
    SECOND("1200px"),
    THIRD("1000px"),
    FOURTH("800px");

    String size;
    private Iframe(String size) {
        this.size = size
    }

    public String getSize() {
        return this.size
    }
}