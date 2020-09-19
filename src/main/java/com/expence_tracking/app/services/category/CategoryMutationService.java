package com.expence_tracking.app.services.category;

import com.expence_tracking.app.domain.Category;
import com.expence_tracking.app.dto.bindings.category.CategoryCreateForm;
import com.expence_tracking.app.dto.bindings.category.CategoryEditForm;
import com.expence_tracking.app.dto.bindings.category.SubCategoryCreateForm;
import com.expence_tracking.app.dto.bindings.category.SubCategoryEditForm;
import com.expence_tracking.app.dto.view.Message;
import com.expence_tracking.app.repostiories.CategoryRepository;
import com.expence_tracking.app.repostiories.UserRepository;
import com.expence_tracking.app.configuration.exceptions.SubCategoryAllReadyExistException;
import graphql.kickstart.tools.GraphQLMutationResolver;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

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

    public Message createNewSubCategory(SubCategoryCreateForm form) throws SubCategoryAllReadyExistException
    {
        Category category = this.categoryRepository.findByCategoryId(form.getCategoryId());
        if (!category.getSubCategories().contains(form.getName()))
        {
            category.getSubCategories().add(form.getName());
        } else
        {
            throw new SubCategoryAllReadyExistException("Subcategory with this name all ready exists");
        }
        this.categoryRepository.save(category);
        return new Message("Successfully added a new SubCategory");
    }

    public Message editSubCategory(SubCategoryEditForm form)
    {
        Category category = this.categoryRepository.findByCategoryId(form.getCategoryId());
        List<String> subCategories = category.getSubCategories();
        for (int i = 0; i < subCategories.size(); i++)
        {
            if (subCategories.get(i).equals(form.getOldName()))
            {
                subCategories.set(i, form.getNewName());
                break;
            }
        }
        this.categoryRepository.save(category);
        return new Message("Successfully edited SubCategory");
    }
}
