codeunit 86100 "GenerateDemoData"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        if not IsFirstInstall() then exit;

        CreateItems();
        CreateEmpties();
        AttachItemsToEmpties();
    end;

    local procedure CreateItems()
    begin
        CreateItem('Cola20ml', 'Cola 20 ml', 1);
        CreateItem('Cola33ml', 'Cola 33 ml', 1.3);
        CreateItem('Cola50ml', 'Cola 50 ml', 1.4);
        CreateItem('Sprite20ml', 'Sprite 20 ml', 1.2);
        CreateItem('Sprite33ml', 'Sprite 33 ml', 1.3);
        CreateItem('Sprite50ml', 'Sprite 50 ml', 1.4);
    end;

    local procedure CreateEmpties()
    begin
        CreateEmpty('Bottle20ml', 'Bottle 20 ml', 0);  // price 0 is not allowed
        CreateEmpty('Bottle33ml', 'Bottle 33 ml', 0.03);
        CreateEmpty('Bottle50ml', 'Bottle 50 ml', 0.04);
        createEmpty('Cont_24_20ml', 'Bottle Container 24x20ml', 1);
        createEmpty('Cont_20_33ml', 'Bottle Container 20x33ml', 1.2);
        createEmpty('Cont_18_50ml', 'Bottle Container 18x50ml', 1.5);
    end;

    local procedure AttachItemsToEmpties()
    begin
        AttachItemToEmpty('Cola20ml', 'Bottle20ml', 0); // Qty pr = 0 is not allowed
        AttachItemToEmpty('Cola33ml', 'Bottle33ml', 1);
        AttachItemToEmpty('Cola50ml', 'Bottle50ml', 1);
        AttachItemToEmpty('Sprite20ml', 'Bottle20ml', 1);
        AttachItemToEmpty('Sprite33ml', 'Bottle33ml', 1);
        AttachItemToEmpty('Sprite50ml', 'Bottle50ml', 1);

        AttachItemToEmpty('Cola20ml', 'Cont_24_20ml', 24);
        AttachItemToEmpty('Cola33ml', 'Cont_20_33ml', 20);
        AttachItemToEmpty('Cola50ml', 'Cont_18_50ml', 18);
        AttachItemToEmpty('Sprite20ml', 'Cont_24_20ml', 24);
        AttachItemToEmpty('Sprite33ml', 'Cont_20_33ml', 20);
        AttachItemToEmpty('Sprite50ml', 'Cont_18_50ml', 18);
    end;

    local procedure CreateItem(ItemNo: Code[20]; ItemDescription: Text[50]; ItemPrice: Decimal)
    var
        Item: Record Item;
        ConfigTemplateHeader: Record "Config. Template Header";
        ItemTemplate: Record "Item Template";
    begin
        with Item do begin
            if get(ItemNo) then exit;

            Init();

            validate("No.", ItemNo);
            validate(Description, ItemDescription);
            validate("Unit Price", ItemPrice);

            if GetFirstItemTempl(ConfigTemplateHeader) then
                ItemTemplate.InsertItemFromTemplate(ConfigTemplateHeader, Item)
            else
                Insert(true);
        end;
    end;

    local procedure GetFirstItemTempl(var ConfigTemplateHeader: Record "Config. Template Header"): Boolean
    begin
        ConfigTemplateHeader.SETRANGE("Table ID", DATABASE::Item);
        ConfigTemplateHeader.SETRANGE(Enabled, TRUE);
        exit(ConfigTemplateHeader.FindFirst());
    end;

    local procedure CreateEmpty(EmptyCode: Code[20]; EmptyDescription: Text[50]; EmptyPrice: Decimal)
    var
        Empty: Record Empty;
    begin
        With Empty do begin
            Init();

            Validate("Code", EmptyCode);
            Validate(Description, EmptyDescription);
            Validate(Price, EmptyPrice);

            insert(true);
        end;
    end;

    local procedure AttachItemToEmpty(ItemNo: Code[20]; EmptyCode: Code[20]; QtyPer: Decimal)
    var
        ItemEmpty: Record "Item Empty";
    begin
        with ItemEmpty do begin
            Init();

            validate("Item No.", ItemNo);
            validate("Empty Code", EmptyCode);
            validate("Qty. Per", QtyPer);

            Insert(true);
        end;
    end;

    local procedure IsFirstInstall(): Boolean
    var
        ThisApp: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(ThisApp);

        exit((ThisApp.DataVersion().Major() = 0)
                and (ThisApp.DataVersion().Minor() = 0)
                and (ThisApp.DataVersion().Build() = 0)
                and (ThisApp.DataVersion().Revision() = 0))
    end;

}
