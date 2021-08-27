Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4593F9A8E
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Aug 2021 16:03:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 547C3C597B3;
	Fri, 27 Aug 2021 14:02:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0DC8C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Aug 2021 14:02:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D25C760F25;
 Fri, 27 Aug 2021 14:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630072959;
 bh=9KVL338uZU2WstNlPctg6BYMhKgoDAyusOTsEn/ouuM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CASqYK4WvoeOw7f6syajt3xV0idVa1b4L0oQ4JtnOFWpZqjTSaZmZcx+zbzhe+qB9
 ixjl3hCW1sWlfD6NbuUgZXHNiy6pnMM/SG//ANdPM1FAI+ij2zCUbsgoMcdhVqLGjL
 k5BWgJNi7B988nnPscyVug5z4gppxLKvKNgA/PMtj8F+BWll7nu2WuILM6yTfHP9P0
 H7ZO5kRrUvstQTPNbDlxFc7SYtUcGz6/YiiRGuPXrjotg//y94Bne/NtZ058zAhBna
 xBOhU/xYrd5sGhFEG695Fez4ULsInXSzQejMBC/CQJwOWPQjQ8B3HvCqZm2cv7Dplq
 QBpUkFpsQ63ww==
Date: Fri, 27 Aug 2021 07:02:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: zhaoxiao <zhaoxiao@uniontech.com>
Message-ID: <20210827070238.7586fb11@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210827085550.13519-1-zhaoxiao@uniontech.com>
References: <20210827085550.13519-1-zhaoxiao@uniontech.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: dwmac-loongson: change the
 pr_info() to dev_err() in loongson_dwmac_probe()
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

On Fri, 27 Aug 2021 16:55:50 +0800 zhaoxiao wrote:
> - Change the pr_info/dev_info to dev_err.
> - Add the dev_err to improve readability.
> 
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c  | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index 4c9a37dd0d3f..495c94e7929f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -54,20 +54,21 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  	bool mdio = false;
>  
>  	np = dev_of_node(&pdev->dev);
> -
>  	if (!np) {
> -		pr_info("dwmac_loongson_pci: No OF node\n");
> +		dev_err(&pdev->dev, "dwmac_loongson_pci: No OF node\n");
>  		return -ENODEV;
>  	}
>  
>  	if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
> -		pr_info("dwmac_loongson_pci: Incompatible OF node\n");
> +		dev_err(&pdev->dev, "dwmac_loongson_pci: Incompatible OF node\n");
>  		return -ENODEV;
>  	}
>  
>  	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
> -	if (!plat)
> +	if (!plat) {
> +		dev_err(&pdev->dev, "memory allocation failed\n");

Please don't add error messages after allocation failures. OOM will
produce a lot of kernel messages and a stack trace already.

>  		return -ENOMEM;
> +	}
>  
>  	if (plat->mdio_node) {
>  		dev_err(&pdev->dev, "Found MDIO subnode\n");
> @@ -109,8 +110,10 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  		plat->bus_id = pci_dev_id(pdev);
>  
>  	phy_mode = device_get_phy_mode(&pdev->dev);
> -	if (phy_mode < 0)
> +	if (phy_mode < 0) {
>  		dev_err(&pdev->dev, "phy_mode not found\n");
> +		return phy_mode;

You're adding a return here, it should be a separate patch with its own
justification.

> +	}
>  
>  	plat->phy_interface = phy_mode;
>  	plat->interface = PHY_INTERFACE_MODE_GMII;
> @@ -130,7 +133,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  
>  	res.wol_irq = of_irq_get_byname(np, "eth_wake_irq");
>  	if (res.wol_irq < 0) {
> -		dev_info(&pdev->dev, "IRQ eth_wake_irq not found, using macirq\n");
> +		dev_err(&pdev->dev, "IRQ eth_wake_irq not found, using macirq\n");

Why upgrade to an error, isn't wol_irq optional?

>  		res.wol_irq = res.irq;
>  	}
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
