Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3365741F8
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jul 2022 05:39:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4338AC640FE;
	Thu, 14 Jul 2022 03:39:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 357D6C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jul 2022 03:39:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B6F161DC4;
 Thu, 14 Jul 2022 03:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA429C34114;
 Thu, 14 Jul 2022 03:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657769952;
 bh=zopjln99q1rxFvM6ak58aizazSshf28UHBqgM18CFvY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O17AZt/AeHkPn061iiEgqkpCxr/6kBkYFumRDxFpzpRDC0oakyZZ3XRGmfmEY6Ei9
 3ywnUmTLEXIsHlVvHMGqzUgTIpER87EFYeXOUR4n/d6QlwlK/L0Qmk8IRQ32aEqWdO
 +TRWuSukauk6OJIVXPhjRbYzN8zLn+pXZ1FOgs/Md9SffssjYPWH+RzvTOOR3XEm+K
 7vnP1QnI8vnpRqzgkdhK1tFUJDN0trTKm+UI85RlhJTRLnmpf6th0iuPXZsZGNsfNr
 KrJuGiYy2WyUx3ImBk01c8POD00qj2MivZaDPDLEOrZHOJZ1icPv4DjGAl3WhPv/OR
 ppqEbKU1SP4kA==
Date: Wed, 13 Jul 2022 20:39:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <20220713203910.74d36732@kernel.org>
In-Reply-To: <20220713101002.10970-4-biao.huang@mediatek.com>
References: <20220713101002.10970-1-biao.huang@mediatek.com>
 <20220713101002.10970-4-biao.huang@mediatek.com>
MIME-Version: 1.0
Cc: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net v4 3/3] net: stmmac: fix unbalanced
 ptp clock issue in suspend/resume flow
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

On Wed, 13 Jul 2022 18:10:02 +0800 Biao Huang wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 197fac587ad5..c230b8b9aab1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -839,14 +839,6 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
>  	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
>  		return -EOPNOTSUPP;
>  
> -	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
> -	if (ret < 0) {
> -		netdev_warn(priv->dev,
> -			    "failed to enable PTP reference clock: %pe\n",
> -			    ERR_PTR(ret));
> -		return ret;
> -	}
> -
>  	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
>  	priv->systime_flags = systime_flags;
>  


drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:837:6: warning: unused variable 'ret' [-Wunused-variable]
        int ret;
            ^
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
