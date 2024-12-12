Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEDE9EE39A
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2024 11:02:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6B54C7128A;
	Thu, 12 Dec 2024 10:02:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35CD2C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733994723; x=1765530723;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kzBsT3F4zajJH9Dt3PQh+yS4Aot+6eJwHXS8DSaNzEE=;
 b=K2yAuuIx3b9HsOhKQ/aNnx6gVoAH6QGVHDOgKzY+9E8BLnZAUz2AQwfD
 6msMKaVKzDzego3Vu6QfyAsMdn83ij7mg7K05hw8CF6rDe1I4xVIxtJ3F
 NP+m8r70PHMbDArrPIJOcMOn8QwXVrUYjJ++eTxcdDQB4HArMVjEWhIcZ
 WAqHoZExkHWI3WVl7C//HUkZClk2iNctUn/7uK08i/79WdXmKXfkGzAKU
 pm6tqzV93bBYFBwVfGW4Yt5BWTiG0MSifhHiJT4i3QASYF5CJwt8i4J/8
 bptHGBrsUc8XbFU0IxDRR7DrpgTEcFOjuP0hLSAAE+kn/l2jgM3vuIGVC w==;
X-CSE-ConnectionGUID: 43nKxJo6SI+c7tamSijpuw==
X-CSE-MsgGUID: X6iNshhxSi6lBLsK955zyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="21994112"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="21994112"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 01:11:54 -0800
X-CSE-ConnectionGUID: uq2AS8WyRZyEF+62XFXmDg==
X-CSE-MsgGUID: tvTJ04EgSRmLHfZCdFa8dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="96256863"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 01:11:51 -0800
Date: Thu, 12 Dec 2024 10:08:49 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <Z1qoITwRF9QLkZq/@mev-dev.igk.intel.com>
References: <20241212033325.282817-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241212033325.282817-1-0x1207@gmail.com>
X-Mailman-Approved-At: Thu, 12 Dec 2024 10:02:09 +0000
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Drop redundant
 dwxgmac_tc_ops variable
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

On Thu, Dec 12, 2024 at 11:33:25AM +0800, Furong Xu wrote:
> dwmac510_tc_ops and dwxgmac_tc_ops are completely identical,
> keep dwmac510_tc_ops to provide better backward compatibility.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/hwif.c      |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/hwif.h      |  1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 11 -----------
>  3 files changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 4bd79de2e222..31bdbab9a46c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -267,7 +267,7 @@ static const struct stmmac_hwif_entry {
>  		.hwtimestamp = &stmmac_ptp,
>  		.ptp = &stmmac_ptp_clock_ops,
>  		.mode = NULL,
> -		.tc = &dwxgmac_tc_ops,
> +		.tc = &dwmac510_tc_ops,
>  		.mmc = &dwxgmac_mmc_ops,
>  		.est = &dwmac510_est_ops,
>  		.setup = dwxgmac2_setup,
> @@ -290,7 +290,7 @@ static const struct stmmac_hwif_entry {
>  		.hwtimestamp = &stmmac_ptp,
>  		.ptp = &stmmac_ptp_clock_ops,
>  		.mode = NULL,
> -		.tc = &dwxgmac_tc_ops,
> +		.tc = &dwmac510_tc_ops,
>  		.mmc = &dwxgmac_mmc_ops,
>  		.est = &dwmac510_est_ops,
>  		.setup = dwxlgmac2_setup,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index e428c82b7d31..2f7295b6c1c5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -685,7 +685,6 @@ extern const struct stmmac_dma_ops dwmac410_dma_ops;
>  extern const struct stmmac_ops dwmac510_ops;
>  extern const struct stmmac_tc_ops dwmac4_tc_ops;
>  extern const struct stmmac_tc_ops dwmac510_tc_ops;
> -extern const struct stmmac_tc_ops dwxgmac_tc_ops;
>  
>  #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
>  #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index 6a79e6a111ed..694d6ee14381 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -1284,14 +1284,3 @@ const struct stmmac_tc_ops dwmac510_tc_ops = {
>  	.query_caps = tc_query_caps,
>  	.setup_mqprio = tc_setup_dwmac510_mqprio,
>  };
> -
> -const struct stmmac_tc_ops dwxgmac_tc_ops = {
> -	.init = tc_init,
> -	.setup_cls_u32 = tc_setup_cls_u32,
> -	.setup_cbs = tc_setup_cbs,
> -	.setup_cls = tc_setup_cls,
> -	.setup_taprio = tc_setup_taprio,
> -	.setup_etf = tc_setup_etf,
> -	.query_caps = tc_query_caps,
> -	.setup_mqprio = tc_setup_dwmac510_mqprio,
> -};

LGTM
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

Thanks
> -- 
> 2.34.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
