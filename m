Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 191E23B313F
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jun 2021 16:26:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0A6AC57196;
	Thu, 24 Jun 2021 14:26:02 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BA9AC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=daRFBCA9iRpEHBee51ZqEeUZ2hHxuMUcehyqzo51cKE=; b=Y+DaKI+AJ2acjklMtCkCgeKtFx
 y/BDgTdvQOihy8YSuq/2Go1I29pHdu1CMXmzld0D3NcaN9vTNN1HKBy4ITf3ZaWSiVKzo9V9gWxeJ
 12ZhsEIo1S31bew7wKL7shzLdXIIqGxclsA8k6Sm9SHFoQIRgmBCUmXaW7HLQ5Lxie5U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lwQIf-00AzBN-7M; Thu, 24 Jun 2021 16:25:49 +0200
Date: Thu, 24 Jun 2021 16:25:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yang Li <yang.lee@linux.alibaba.com>
Message-ID: <YNSV7caeVBNnxr1S@lunn.ch>
References: <1623811148-11064-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623811148-11064-1-git-send-email-yang.lee@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] net: stmmac: Fix an error code in
	dwmac-ingenic.c
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

On Wed, Jun 16, 2021 at 10:39:08AM +0800, Yang Li wrote:
> When IS_ERR(mac->regmap) returns true, the value of ret is 0.
> So, we set ret to -ENODEV to indicate this error.
> 
> Clean up smatch warning:
> drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:266
> ingenic_mac_probe() warn: missing error code 'ret'
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 60984c1..f3950e0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -263,6 +263,7 @@ static int ingenic_mac_probe(struct platform_device *pdev)
>  	mac->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "mode-reg");
>  	if (IS_ERR(mac->regmap)) {
>  		dev_err(&pdev->dev, "%s: Failed to get syscon regmap\n", __func__);
> +		ret = -ENODEV;

mac->regmap is a ERR_PTR(), containing an error code. Please use that
error code, not ENODEV.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
