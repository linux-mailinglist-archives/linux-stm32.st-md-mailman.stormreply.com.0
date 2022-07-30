Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A10D585C05
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jul 2022 22:18:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5854C03FE0;
	Sat, 30 Jul 2022 20:18:07 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1970C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jul 2022 20:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659212286; x=1690748286;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cd3syrwIXsSarb0bdUv6tHAADb63fWwB5Q5t7g/Spnw=;
 b=GfS2bFmXURtLKRVNsKEh6RB6A5HDh1IWCO9MVJwlzzITdW0Ocqh7pAhp
 AlBbzQ2APRhdISGRobaaJBNrnQCc/pY++6IGplNMZuKVT3zHzMr1RrUXg
 MaiQKPa4/ROc3TqByIXtgQtVICZrtfoX0Ea1rWsDLc0p5gZT2kTP+BcBi
 NowsxK2jSm/BrhC3MYKUPKfZy+QATADP0yIYnt72dFDiZPeat/MR5RYI/
 uigV6a26dn5h1C38WSZA1UQoBMuGDC11AYBqsP3h3irMndOBmzu29YAPg
 DWl6+k8RK+3JKibEWZruvofemtegi9YUA+cJikez0IYSHK4UICu6Wp4Td Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="289715737"
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; d="scan'208";a="289715737"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2022 13:18:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; d="scan'208";a="728059168"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2022 13:18:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oHsuK-001fXT-16; Sat, 30 Jul 2022 23:17:56 +0300
Date: Sat, 30 Jul 2022 23:17:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <YuWR9I8y9cWlLG3O@smile.fi.intel.com>
References: <b5b44a0c025d0fdddd9b9d23153261363089a06a.1659204745.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5b44a0c025d0fdddd9b9d23153261363089a06a.1659204745.git.christophe.jaillet@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, linux-stm32@st-md-mailman.stormreply.com,
 weifeng.voon@intel.com, vee.khee.wong@intel.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] stmmac: intel: Add a missing
 clk_disable_unprepare() call in intel_eth_pci_remove()
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

On Sat, Jul 30, 2022 at 08:19:47PM +0200, Christophe JAILLET wrote:
> Commit 09f012e64e4b ("stmmac: intel: Fix clock handling on error and remove
> paths") removed this clk_disable_unprepare()
> 
> This was partly revert by commit ac322f86b56c ("net: stmmac: Fix clock
> handling on remove path") which removed this clk_disable_unprepare()
> because:
> "
>    While unloading the dwmac-intel driver, clk_disable_unprepare() is
>    being called twice in stmmac_dvr_remove() and
>    intel_eth_pci_remove(). This causes kernel panic on the second call.
> "
> 
> However later on, commit 5ec55823438e8 ("net: stmmac: add clocks management
> for gmac driver") has updated stmmac_dvr_remove() which do not call
> clk_disable_unprepare() anymore.
> 
> So this call should now be called from intel_eth_pci_remove().

The correct way of fixing it (which might be very well end up functionally
the same as this patch), is to introduce ->quit() in struct stmmac_pci_info
and assign it correctly, because not all platforms enable clocks.

Perhaps, we may leave this patch as is (for the sake of easy backporting) and
apply another one as I explained above to avoid similar mistakes in the future.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 5ec55823438e8 ("net: stmmac: add clocks management for gmac driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> /!\     This patch is HIGHLY speculative.     /!\
> 
> The corresponding clk_disable_unprepare() is still called within the pm
> related stmmac_bus_clks_config() function.
> 
> However, with my limited understanding of the pm API, I think it that the
> patch is valid.
> (in other word, does the pm_runtime_put() and/or pm_runtime_disable()
> and/or stmmac_dvr_remove() can end up calling .runtime_suspend())
> 
> So please review with care, as I'm not able to test the change by myself.
> 
> 
> If I'm wrong, maybe a comment explaining why it is safe to have this
> call in the error handling path of the probe and not in the remove function
> would avoid erroneous patches generated from static code analyzer to be
> sent.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> index 52f9ed8db9c9..9f38642f86ce 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> @@ -1134,6 +1134,7 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
>  
>  	stmmac_dvr_remove(&pdev->dev);
>  
> +	clk_disable_unprepare(plat->stmmac_clk);
>  	clk_unregister_fixed_rate(priv->plat->stmmac_clk);
>  
>  	pcim_iounmap_regions(pdev, BIT(0));
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
