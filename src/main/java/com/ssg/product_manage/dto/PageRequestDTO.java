package com.ssg.product_manage.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;
import java.time.LocalDate;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {

    @Builder.Default
    @Min(value = 1)
    @Positive
    private int page = 1;

    @Builder.Default
    @Min(value = 10)
    @Max(value = 100)
    private int size = 10;

    public int getSkip() {
        return (page - 1) * 10;
    }

    private String link;  // 링크 정보를 저장하는 필드
    private String[] types;  // 타입 정보를 저장하는 배열 필드
    private String keyword;  // 검색 키워드를 저장하는 필드
    private boolean finished;  // 완료 여부를 저장하는 필드
    private LocalDate from;  // 시작 날짜를 저장하는 필드
    private LocalDate to;  // 종료 날짜를 저장하는 필드

    // 링크 정보를 반환하는 메서드
    public String getLink() {
        if(link == null){  // 링크가 없는 경우
            StringBuilder builder = new StringBuilder();  // StringBuilder 객체 생성
            builder.append("page=" + this.page);  // 페이지 정보 추가
            builder.append("&size=" + this.size);  // 크기 정보 추가
            link = builder.toString();  // 링크 생성
        }
        return link;  // 링크 반환
    }

    // 해당하는 타입이 존재하는지 확인하는 메서드
    public boolean checkType(String type) {
        if (types != null) {  // 타입 배열이 비어있지 않은 경우
            for (String t : types) {  // 모든 타입에 대해 반복
                if (t.equals(type)) {  // 해당 타입이 존재하는 경우
                    return true;  // true 반환
                }
            }
        }
        return false;  // 타입이 존재하지 않는 경우 false 반환
    }
}

