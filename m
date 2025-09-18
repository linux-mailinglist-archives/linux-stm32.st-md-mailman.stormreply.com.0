Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F57B862EC
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Sep 2025 19:17:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88DAFC349C6;
	Thu, 18 Sep 2025 17:17:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 133D9C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Sep 2025 17:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gy/Z85EpA6PtugEQo7tOjG3wD8Ws/VL623KxkN4uUxg=; b=eCd8PvGiIcC61VFrTKq+rfWTo4
 gXilCPqrrdDWsaBvaiItkZCGj7Q1Za0o8TQFPU3zmt5Kt4H8rpVqqWNoU/LIZ8BeatYHkJI+w5DsC
 IhX/tepsPjuCWaV5amxVMQX+HvAQZexJwq9qOAimbFI7GgaIQovNbXow32YnHE//WnlH67UPT9+4x
 L4oyXn8ciroToLCc5xN8Gs648B02kcw759/Kr1ONF2jXe123CVwvTL44+O26XGC2rfrfMqrofk/AM
 aIG3nx5MfhxEURDQ1stujVejjeWdTFVEdsHskp4QxNDPRsVd8WdCKAAGFOLFfqRJFq6r8plyJaERq
 rNd8F/aQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51190)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uzIFS-000000001Vp-1DNL;
 Thu, 18 Sep 2025 18:16:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uzIFL-000000001Lm-0Tdb; Thu, 18 Sep 2025 18:16:39 +0100
Date: Thu, 18 Sep 2025 18:16:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: weishangjuan@eswincomputing.com
Message-ID: <aMw-dgNiXgPeqeSz@shell.armlinux.org.uk>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918090026.3280-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250918090026.3280-1-weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, edumazet@google.com, anthony.l.nguyen@intel.com,
 jszhang@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, inochiama@gmail.com, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v7 2/2] ethernet: eswin: Add eic7700
	ethernet driver
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

On Thu, Sep 18, 2025 at 05:00:26PM +0800, weishangjuan@eswincomputing.com wrote:
> +	plat_dat->clk_tx_i = stmmac_pltfr_find_clk(plat_dat, "tx");
> +	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> +	plat_dat->bsp_priv = dwc_priv;
> +	plat_dat->clks_config = eic7700_clks_config;
> +	dwc_priv->plat_dat = plat_dat;
> +
> +	ret = eic7700_clks_config(dwc_priv, true);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev,
> +				ret,
> +				"error enable clock\n");
> +
> +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> +	if (ret) {
> +		eic7700_clks_config(dwc_priv, false);
> +		return dev_err_probe(&pdev->dev,
> +				ret,
> +				"Failed to driver probe\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static void eic7700_dwmac_remove(struct platform_device *pdev)
> +{
> +	struct eic7700_qos_priv *dwc_priv = get_stmmac_bsp_priv(&pdev->dev);
> +
> +	stmmac_pltfr_remove(pdev);
> +	eic7700_clks_config(dwc_priv, false);

It would be nice to see the above code cleaned up like I did for all
the other stmmac glue drivers recently.

However, this is not to say this shouldn't be merged - but please
consider this if you do another rework of these patches, if not as
a follow-up patch.

Essentially, you can use devm_stmmac_pltfm_probe(), populate the
plat_dat->init() and plat_dat->exit() methods to call the
clks_config function, but as you don't want these methods to be
called during suspend/resume (because plat_dat->clks_config() is
already called there), provide empty plat_dat->suspend() and
plat_dat->resume() methods.

Bonus points if you include a patch which provides this functionality
as library functions in stmmac_platform.c which can be used to
initialise ->init() and ->exit() for this behaviour, and check other
stmmac platform glue drivers to see if they would benefit from using
these.

Of course, it would be nice not to have to go to the extent of
adding empty functions for ->suspend() and ->resume(), but stmmac has
a lot of weirdo history, and there was no easy way to maintain
compatibility without doing that when I added these two new methods.

Lastly, please consider using "net: stmmac: <shortened-glue-name>: blah"
as the subject so there's a consistent style for stmmac patches.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
