package com.expence_tracking.app.dto.bindings.user;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class AdminChangeAuthorityForm
{
    private Long userId;
    private Long authorityId;
}
