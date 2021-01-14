class IDNotFoundException(Exception):
    def __init__(self, message):
        super().__init__(message+": 존재하지 않는 ID")
