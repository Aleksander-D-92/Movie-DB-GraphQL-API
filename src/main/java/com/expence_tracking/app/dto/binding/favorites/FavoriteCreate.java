package com.expence_tracking.app.dto.binding.favorites;

import com.expence_tracking.app.domain.enums.FavoriteType;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
public class FavoriteCreate
{
    @NotNull
    private Long userId;
    @NotNull
    private FavoriteType favoriteType;
    @NotNull
    private Long movieDBId;
}
