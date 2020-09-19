package com.expence_tracking.app.services.category;

import com.expence_tracking.app.domain.Category;
import com.expence_tracking.app.dto.bindings.category.CategoryCreateForm;
import com.expence_tracking.app.dto.bindings.category.CategoryEditForm;
import com.expence_tracking.app.dto.view.Message;
import com.expence_tracking.app.repostiories.CategoryRepository;
import com.expence_tracking.app.repostiories.UserRepository;
import graphql.kickstart.tools.GraphQLMutationResolver;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
@RequiredArgsConstructor
public class CategoryMutationService implements GraphQLMutationResolver
{
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;
    private final ModelMapper modelMapper;

    public Message createNewCategory(CategoryCreateForm form)
    {
        Category category = this.modelMapper.map(form, Category.class);
        category.setBalance(BigDecimal.valueOf(0));
        category.setOwner(this.userRepository.getOne(form.getUserId()));
        this.categoryRepository.save(category);
        return new Message("Successfully added a new Category");
    }

    public Message editCategory(CategoryEditForm form)
    {
        this.categoryRepository.editCategory(form.getName(), form.getType(), form.getCategoryId());
        return new Message("Successfully added a new Category");
    }
}