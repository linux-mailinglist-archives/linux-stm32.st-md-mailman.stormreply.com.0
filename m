Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E211CD669
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2020 12:21:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1AC5C36B26;
	Mon, 11 May 2020 10:21:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7C97C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 10:21:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BAI1NJ017907; Mon, 11 May 2020 12:21:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=HYIucn+K7P4IZIxEJitoqQ+kIYFvDpyLmXWqjyGXEpg=;
 b=Jhwm4G3t4wSW5c97351Ap3of9lmNawd9/Ya+JqvlnP9d5MDXETNHV+DjLAuOv4Pzg1q3
 gv+9lS6iODHmf1xdUgdINI1n+cKBvOvUSCpAR0YV+tiFj8DSgOgQsxl90LayHMRRcxvP
 tjSHhfa7pIykiiMZlLSVUl9Cp1ypVrLGn2ihzzrqIr8D+ILwpnAs8yJeuLWQklCO3xov
 a1Cr0bsk2RZCjbzfrJfE46/P/aGkNsTSKoh+Mw4AyNJX6LsG2GZVLjt/A6FfiFnTvu1q
 YSv1lc7zCm5SJoDTE+2RLl4+2po2Fu2Iz//6m/Xmo9sPcwMhRIy6D/QQ0x4HSSG2Vdif 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30whn99t5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 12:21:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BA1D10002A;
 Mon, 11 May 2020 12:21:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 438C32C38B8;
 Mon, 11 May 2020 12:21:06 +0200 (CEST)
Received: from [10.211.5.64] (10.75.127.49) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 11 May
 2020 12:21:04 +0200
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-11-git-send-email-christophe.kerello@st.com>
 <20200511111855.48216940@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <3377adc6-3e5e-b9b7-12be-c7aa44bfac82@st.com>
Date: Mon, 11 May 2020 12:21:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200511111855.48216940@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_04:2020-05-11,
 2020-05-11 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 10/10] mtd: rawnand: stm32_fmc2: get
 resources from parent node
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Miquel,

On 5/11/20 11:18 AM, Miquel Raynal wrote:
> Hi Christophe,
> 
> Christophe Kerello <christophe.kerello@st.com> wrote on Wed, 6 May 2020
> 11:11:19 +0200:
> 
>> FMC2 EBI support has been added. Common resources (registers base
>> and clock) are now shared between the 2 drivers. It means that the
>> common resources should now be found in the parent device when EBI
>> node is available.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
> 
> [...]
> 
>> +
>> +static bool stm32_fmc2_nfc_check_for_parent(struct platform_device *pdev)
>> +{
>> +	u32 i;
>> +	int nb_resources = 0;
>> +
>> +	/* Count the number of resources in reg property */
>> +	for (i = 0; i < pdev->num_resources; i++) {
>> +		struct resource *res = &pdev->resource[i];
>> +
>> +		if (resource_type(res) == IORESOURCE_MEM)
>> +			nb_resources++;
>> +	}
>> +
>> +	/* Each CS needs 3 resources defined (data, cmd and addr) */
>> +	if (nb_resources % 3)
>> +		return false;
>> +
>> +	return true;
>> +}
> 
> This function looks fragile. Why not just checking the compatible
> string of the parent node?
> 

Yes, it is another way to check that we have an EBI parent node.

In this implementation, I was checking the number of reg tuples.
In case we have 6, it means that the register base address is defined in 
the parent node (EBI node).
In case we have 7, it means that the register base address is defined in 
the current node (NFC node).

>> +
>>   static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> @@ -1824,8 +1865,8 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
>>   	struct resource *res;
>>   	struct mtd_info *mtd;
>>   	struct nand_chip *chip;
>> -	void __iomem *mmio;
>>   	int chip_cs, mem_region, ret, irq;
>> +	int num_region = 1;
>>   
>>   	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
>>   	if (!nfc)
>> @@ -1834,23 +1875,19 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
>>   	nfc->dev = dev;
>>   	nand_controller_init(&nfc->base);
>>   	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
>> +	nfc->has_parent = stm32_fmc2_nfc_check_for_parent(pdev);
>> +	if (nfc->has_parent)
>> +		num_region = 0;
>>   
>>   	ret = stm32_fmc2_nfc_parse_dt(nfc);
>>   	if (ret)
>>   		return ret;
>>   
>> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	mmio = devm_ioremap_resource(dev, res);
>> -	if (IS_ERR(mmio))
>> -		return PTR_ERR(mmio);
>> -
>> -	nfc->regmap = devm_regmap_init_mmio(dev, mmio, &stm32_fmc2_regmap_cfg);
>> -	if (IS_ERR(nfc->regmap))
>> -		return PTR_ERR(nfc->regmap);
>> -
>> -	nfc->io_phys_addr = res->start;
>> +	ret = stm32_fmc2_nfc_set_regmap_clk(pdev, nfc);
>> +	if (ret)
>> +		return ret;
> 
> Are you sure this driver sill works without the EBI block?
> 
> This change looks suspect.
> 

Yes, the driver works fine with current bindings and with EBI bindings.
In case we have an EBI parent node, it means that the register base 
address and the clock are defined in the parent node.
Without any EBI parent node, it means that the register base address and 
the clock are defined in the NFC node.

The new function stm32_fmc2_nfc_set_regmap_clk is looking for these 2 
resources in the NFC node or in the parent node.
static int stm32_fmc2_nfc_set_regmap_clk(struct platform_device *pdev,
					 struct stm32_fmc2_nfc *nfc)
{
	struct device *dev = &pdev->dev;
	struct resource res;
	int ret;

	if (nfc->has_parent)
		dev = dev->parent;

	ret = of_address_to_resource(dev->of_node, 0, &res);
	if (ret)
		return ret;

	nfc->io_phys_addr = res.start;

	nfc->regmap = device_node_to_regmap(dev->of_node);
	if (IS_ERR(nfc->regmap))
		return PTR_ERR(nfc->regmap);

	nfc->clk = devm_clk_get(dev, NULL);
	if (IS_ERR(nfc->clk))
		return PTR_ERR(nfc->clk);

	return 0;
}

Regards,
Christophe Kerello.

>>   
>> -	for (chip_cs = 0, mem_region = 1; chip_cs < FMC2_MAX_CE;
>> +	for (chip_cs = 0, mem_region = num_region; chip_cs < FMC2_MAX_CE;
>>   	     chip_cs++, mem_region += 3) {
>>   		if (!(nfc->cs_assigned & BIT(chip_cs)))
>>   			continue;
>> @@ -1888,10 +1925,6 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
>>   
>>   	init_completion(&nfc->complete);
>>   
>> -	nfc->clk = devm_clk_get(dev, NULL);
>> -	if (IS_ERR(nfc->clk))
>> -		return PTR_ERR(nfc->clk);
>> -
> 
> Same here
> 
>>   	ret = clk_prepare_enable(nfc->clk);
>>   	if (ret) {
>>   		dev_err(dev, "can not enable the clock\n");
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
