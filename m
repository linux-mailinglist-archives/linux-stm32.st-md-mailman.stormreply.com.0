Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3226A558AA
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 22:21:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CF17C78F83;
	Thu,  6 Mar 2025 21:21:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F540C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 21:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9H78NGtDgrJN8almAooGMPfIHicQD7QyEml+BfISIgg=; b=guMhklL/+BIxtizh+xS6aUCkcs
 xiqV6+jRMkvDCFI1Sdi2vxBbaC8HFPmkFSPNomuM1DaFuR9gXBO5W5pyVze8dw4T1rail/m4jEtUx
 Sl+bfrPyvulBDrN60FqU93ZP8sEOV2aYu0DUfALLj08VQcaukP31Ov9Z/eDXCzgNeMYfJ7JgOoYxm
 LPp2dr+vWeNh/k4dbT3BM/AH62dODYTy86qE4hCFZTafmDcEGEjAArTWjqtWhJCGRgRQU2TGorsuO
 lhbZjQJ6ndCqIFdVoMdRuVoKtIzDJrHoh05ZDgdAg/TKTa1NWtUgxeKTc/aq5QAwqsoVm3sVyDVdT
 vzH1AxrA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44602)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tqIeb-0006Vr-05;
 Thu, 06 Mar 2025 21:21:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tqIeW-00078z-38;
 Thu, 06 Mar 2025 21:21:12 +0000
Date: Thu, 6 Mar 2025 21:21:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <Z8oRyHThun9mLgx8@shell.armlinux.org.uk>
References: <20250306210950.1686713-1-jonas@kwiboo.se>
 <20250306210950.1686713-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250306210950.1686713-3-jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: dwmac-rk: Validate
 rockchip, grf and php-grf during probe
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

On Thu, Mar 06, 2025 at 09:09:46PM +0000, Jonas Karlman wrote:
> @@ -1813,8 +1564,24 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
>  
>  	bsp_priv->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>  							"rockchip,grf");
> -	bsp_priv->php_grf = syscon_regmap_lookup_by_phandle(dev->of_node,
> -							    "rockchip,php-grf");
> +	if (IS_ERR(bsp_priv->grf)) {
> +		ret = PTR_ERR(bsp_priv->grf);
> +		dev_err_probe(dev, ret, "failed to lookup rockchip,grf\n");
> +		return ERR_PTR(ret);

Did you consider using ERR_CAST() for these, which would look like this:

		dev_err_probe(dev, PTR_ERR(bsp_priv->grf),
			      "failed to lookup rockchip,grf\n");
		return ERR_CAST(bsp_priv->grf);

?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
