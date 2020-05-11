Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA35E1CD4B4
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2020 11:19:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72497C36B23;
	Mon, 11 May 2020 09:19:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 461E4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 09:19:00 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D6943FF80B;
 Mon, 11 May 2020 09:18:57 +0000 (UTC)
Date: Mon, 11 May 2020 11:18:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200511111855.48216940@xps13>
In-Reply-To: <1588756279-17289-11-git-send-email-christophe.kerello@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-11-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Christophe,

Christophe Kerello <christophe.kerello@st.com> wrote on Wed, 6 May 2020
11:11:19 +0200:

> FMC2 EBI support has been added. Common resources (registers base
> and clock) are now shared between the 2 drivers. It means that the
> common resources should now be found in the parent device when EBI
> node is available.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---

[...]

> +
> +static bool stm32_fmc2_nfc_check_for_parent(struct platform_device *pdev)
> +{
> +	u32 i;
> +	int nb_resources = 0;
> +
> +	/* Count the number of resources in reg property */
> +	for (i = 0; i < pdev->num_resources; i++) {
> +		struct resource *res = &pdev->resource[i];
> +
> +		if (resource_type(res) == IORESOURCE_MEM)
> +			nb_resources++;
> +	}
> +
> +	/* Each CS needs 3 resources defined (data, cmd and addr) */
> +	if (nb_resources % 3)
> +		return false;
> +
> +	return true;
> +}

This function looks fragile. Why not just checking the compatible
string of the parent node?

> +
>  static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1824,8 +1865,8 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	struct mtd_info *mtd;
>  	struct nand_chip *chip;
> -	void __iomem *mmio;
>  	int chip_cs, mem_region, ret, irq;
> +	int num_region = 1;
>  
>  	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
>  	if (!nfc)
> @@ -1834,23 +1875,19 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
>  	nfc->dev = dev;
>  	nand_controller_init(&nfc->base);
>  	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
> +	nfc->has_parent = stm32_fmc2_nfc_check_for_parent(pdev);
> +	if (nfc->has_parent)
> +		num_region = 0;
>  
>  	ret = stm32_fmc2_nfc_parse_dt(nfc);
>  	if (ret)
>  		return ret;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	mmio = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(mmio))
> -		return PTR_ERR(mmio);
> -
> -	nfc->regmap = devm_regmap_init_mmio(dev, mmio, &stm32_fmc2_regmap_cfg);
> -	if (IS_ERR(nfc->regmap))
> -		return PTR_ERR(nfc->regmap);
> -
> -	nfc->io_phys_addr = res->start;
> +	ret = stm32_fmc2_nfc_set_regmap_clk(pdev, nfc);
> +	if (ret)
> +		return ret;

Are you sure this driver sill works without the EBI block?

This change looks suspect.

>  
> -	for (chip_cs = 0, mem_region = 1; chip_cs < FMC2_MAX_CE;
> +	for (chip_cs = 0, mem_region = num_region; chip_cs < FMC2_MAX_CE;
>  	     chip_cs++, mem_region += 3) {
>  		if (!(nfc->cs_assigned & BIT(chip_cs)))
>  			continue;
> @@ -1888,10 +1925,6 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
>  
>  	init_completion(&nfc->complete);
>  
> -	nfc->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(nfc->clk))
> -		return PTR_ERR(nfc->clk);
> -

Same here

>  	ret = clk_prepare_enable(nfc->clk);
>  	if (ret) {
>  		dev_err(dev, "can not enable the clock\n");

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
