Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 017DC9A2235
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 14:29:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A435C78032;
	Thu, 17 Oct 2024 12:29:49 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 189F8C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 12:29:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2F980A43D65;
 Thu, 17 Oct 2024 12:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E50C4CEC5;
 Thu, 17 Oct 2024 12:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729168180;
 bh=yd5Il7nYS8RK836o00Q0x0vsIfnv7ERNERDNUicu15c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ktuCV2Cgw0lV7EeBTGRZ3xOzke+9u/4WWh6TslyhJJMNwrCvw5axWh/HQdIn/LO+o
 gXVDPwJhQ12qwzNdmnWPoAxMOsAT3fcoEAAdOuZ+9DvmYbQy7zXZ29+TQFBislgAzr
 8rdcC+nAxfpgKDz8ezw+rIFEFCnWfAwDmIry68FoZPstEhuSPQkkWe6HigQHCFhY2Q
 9IlU8ja64MPGj8A8Q1EalGdG4AhEW2v3IT/SoV/di1IQmLPQjGn8HnxocagWVgv8Eo
 3JutdfkML1Z/msj/4Fi590I6q4q/KrT3WHm3Spy3SbAhzYxdUkIMRuNjwiRy3zMLX0
 iDN1kL1H8BxJQ==
Date: Thu, 17 Oct 2024 13:29:36 +0100
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241017122936.GF1697@kernel.org>
References: <cover.1728980110.git.0x1207@gmail.com>
 <7b244a9d6550bd856298150fb4c083ca95b41f38.1728980110.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b244a9d6550bd856298150fb4c083ca95b41f38.1728980110.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 5/5] net: stmmac: xgmac:
	Complete FPE support
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

On Tue, Oct 15, 2024 at 05:09:26PM +0800, Furong Xu wrote:
> FPE implementation for DWMAC4 and DWXGMAC differs only for:
> 1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
> 2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
> 
> Refactor stmmac_fpe_ops callback functions to avoid code duplication
> between gmac4 and xgmac.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Hi Furong Xu,

I think it would be best to split this patch so that the refactor of dwmac4
code is in one patch, and adding xgmac code is in another.

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> index 6060a1d702c6..80f12b6e84e6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> @@ -160,41 +160,54 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
>  	}
>  }
>  
> -static void dwmac5_fpe_configure(void __iomem *ioaddr,
> -				 struct stmmac_fpe_cfg *cfg,
> -				 u32 num_txq, u32 num_rxq,
> -				 bool tx_enable, bool pmac_enable)
> +static void common_fpe_configure(void __iomem *ioaddr,
> +				 struct stmmac_fpe_cfg *cfg, u32 rxq,
> +				 bool tx_enable, bool pmac_enable,
> +				 u32 rxq_addr, u32 fprq_mask, u32 fprq_shift,
> +				 u32 mac_fpe_addr, u32 int_en_addr,
> +				 u32 int_en_bit)

This function now has a lot of parameters. Could we consider another way?
One idea I had was that describes the addresses for different chips.

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index 75ad2da1a37f..6a79e6a111ed 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -1290,8 +1290,8 @@ const struct stmmac_tc_ops dwxgmac_tc_ops = {
>  	.setup_cls_u32 = tc_setup_cls_u32,
>  	.setup_cbs = tc_setup_cbs,
>  	.setup_cls = tc_setup_cls,
> -	.setup_taprio = tc_setup_taprio_without_fpe,
> +	.setup_taprio = tc_setup_taprio,
>  	.setup_etf = tc_setup_etf,
>  	.query_caps = tc_query_caps,
> -	.setup_mqprio = tc_setup_mqprio_unimplemented,
> +	.setup_mqprio = tc_setup_dwmac510_mqprio,
>  };

It is not clear to me how this hunk relates to the rest of the patch.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
