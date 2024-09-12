Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A57976DE3
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Sep 2024 17:37:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10C8CC78016;
	Thu, 12 Sep 2024 15:37:45 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A699C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2024 15:37:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8D06CA456B0;
 Thu, 12 Sep 2024 15:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB574C4CEC3;
 Thu, 12 Sep 2024 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726155455;
 bh=N/+WNeF+RDLG1ngsWQ16huQXqFJqMaiTBQhwf09Ovlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bbS1dzrJOj5tds7MBnce/FTebHyPXH1Re3Wsx5wcDhTHcThsHGJGnISRw4fyJwaNi
 1xSnsYtZ11ng94GVqnlMpyfivdkC3dOl+sIekye8vD7H14dk/RTmMajsIBR140jGKn
 C9Mols8RTbIXlGeipygGOAb7oQy3DSpLwGGBeeN4XhNw5mtvEB2AksUHNLWOdBQy0u
 oJv8k+/EPQrshEpB7GTL0Fs5+nC9H+4A2beRcsajAL+5j6Crr7wbWYHoWaEEAD16eK
 qIHNYWrefsyKEQFZNgxWQMaIv2qEnUkeJKsXg23ratJRIjvDXnsoW/VXj9B8DlQ0kC
 gvais+ESwUuZA==
Date: Thu, 12 Sep 2024 16:37:30 +0100
From: Simon Horman <horms@kernel.org>
To: KhaiWenTan <khai.wen.tan@linux.intel.com>
Message-ID: <20240912153730.GN572255@kernel.org>
References: <20240912015541.363600-1-khai.wen.tan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240912015541.363600-1-khai.wen.tan@linux.intel.com>
Cc: Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Khai Wen <khai.wen.tan@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Fix zero-division
 error when disabling tc cbs
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

On Thu, Sep 12, 2024 at 09:55:41AM +0800, KhaiWenTan wrote:
> The commit b8c43360f6e4 ("net: stmmac: No need to calculate speed divider
> when offload is disabled") allows the "port_transmit_rate_kbps" to be
> set to a value of 0, which is then passed to the "div_s64" function when
> tc-cbs is disabled. This leads to a zero-division error.
> 
> When tc-cbs is disabled, the idleslope, sendslope, and credit values the
> credit values are not required to be configured. Therefore, adding a return
> statement after setting the txQ mode to DCB when tc-cbs is disabled would
> prevent a zero-division error.
> 
> Fixes: b8c43360f6e4 ("net: stmmac: No need to calculate speed divider when offload is disabled")
> Cc: <stable@vger.kernel.org>
> Co-developed-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index 996f2bcd07a2..2c3fd9c66d14 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -392,10 +392,10 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
>  	} else if (!qopt->enable) {
>  		ret = stmmac_dma_qmode(priv, priv->ioaddr, queue,
>  				       MTL_QUEUE_DCB);
> -		if (ret)
> -			return ret;
> +		if (!ret)
> +			priv->plat->tx_queues_cfg[queue].mode_to_use = MTL_QUEUE_DCB;
>  
> -		priv->plat->tx_queues_cfg[queue].mode_to_use = MTL_QUEUE_DCB;
> +		return ret;
>  	}

Thanks,

I agree with your analysis. But I think it would
be more idomatic to write it such that the main thread
of execution is the non-error path (in any case,
it makes it easier for me to understand the intent of the code.

What I am suggesting is this (extra context provided for clarity):

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 996f2bcd07a2..308ef4241768 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -392,14 +392,15 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
 	} else if (!qopt->enable) {
 		ret = stmmac_dma_qmode(priv, priv->ioaddr, queue,
 				       MTL_QUEUE_DCB);
 		if (ret)
 			return ret;
 
 		priv->plat->tx_queues_cfg[queue].mode_to_use = MTL_QUEUE_DCB;
+		return 0;
 	}
 
 	/* Final adjustments for HW */
 	value = div_s64(qopt->idleslope * 1024ll * ptr, port_transmit_rate_kbps);
 	priv->plat->tx_queues_cfg[queue].idle_slope = value & GENMASK(31, 0);
 
 	value = div_s64(-qopt->sendslope * 1024ll * ptr, port_transmit_rate_kbps);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
