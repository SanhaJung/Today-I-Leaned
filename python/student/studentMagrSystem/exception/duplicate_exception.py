class DuplicateExeption(Exception):
    def __init__(self, message):
        super().__init__(message+": 등록된 ID")
