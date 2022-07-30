Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 679C4585BF5
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jul 2022 22:07:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1EECC03FE0;
	Sat, 30 Jul 2022 20:07:26 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99200C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jul 2022 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659211644; x=1690747644;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qVvlkCYGySw576yQ2Em/mAMLb51VdX062dlKlXivK7E=;
 b=LnR2VmcIhXshapE8+fnesUdR75A1wPcUnmBnB2439sqIIPwvgMLcsvi4
 iOXREjLRKm6UDHNEiMC4kBa+UO+2woIYUGPO2wZ1yVsHWrDfmuA6vdTnT
 kE5EFY2dBpzGFZbqFKpz8Rr+qsA5Mug7jXl8Ifxoa/JZt+YjKRwtrZlWZ
 3sA27ILDHb1Iz8uIpI/bYlCYdcQNB9bHJZnpWA3HZ1fblL9mH+ELzwUJJ
 fm3I/O+omUZiuzDrrjH7zuVhXjK1A+0WwFQF6YO0+mD4DHB6Y5ZdlWAG8
 VfFb1qSFFDXJecEfY7LEbg0ddGBfgA/bm6W633yb6At0JvgBPKnlQ+1ej Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="287700445"
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; d="scan'208";a="287700445"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2022 13:07:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; d="scan'208";a="577321545"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2022 13:07:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oHsjz-001fWn-1J; Sat, 30 Jul 2022 23:07:15 +0300
Date: Sat, 30 Jul 2022 23:07:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <YuWPc8Flkpm4Yt/z@smile.fi.intel.com>
References: <b5b44a0c025d0fdddd9b9d23153261363089a06a.1659204745.git.christophe.jaillet@wanadoo.fr>
 <9f82d58aa4a6c34ec3c734399a4792d3aa23297f.1659204745.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f82d58aa4a6c34ec3c734399a4792d3aa23297f.1659204745.git.christophe.jaillet@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: linux-stm32@st-md-mailman.stormreply.com, weifeng.voon@intel.com,
 vee.khee.wong@intel.com, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] stmmac: intel: Simplify
	intel_eth_pci_remove()
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

On Sat, Jul 30, 2022 at 08:20:02PM +0200, Christophe JAILLET wrote:
> There is no point to call pcim_iounmap_regions() in the remove function,
> this frees a managed resource that would be release by the framework
> anyway.

The patch is fully correct in my opinion. The iounmap() is called exactly in
the same order as if it's done implicitly by managed resources handlers, hence
no need to explicitly call it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is speculative.
> Sometimes the order of releasing managed resources is tricky.
> 
> Just a few drivers have this pattern, while many call pcim_iomap_regions().
> If I'm right and this patch is reviewed and merged, I'll look at the
> other files if they also can be simplified a bit.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> index 9f38642f86ce..f68d23051557 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> @@ -1136,8 +1136,6 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
>  
>  	clk_disable_unprepare(plat->stmmac_clk);
>  	clk_unregister_fixed_rate(priv->plat->stmmac_clk);
> -
> -	pcim_iounmap_regions(pdev, BIT(0));
>  }
>  
>  static int __maybe_unused intel_eth_pci_suspend(struct device *dev)
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
