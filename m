Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD2D83D4B3
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 09:31:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D61C2C6B476;
	Fri, 26 Jan 2024 08:30:59 +0000 (UTC)
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0041BC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 17:11:17 +0000 (UTC)
Message-ID: <081af630-ab5d-4502-a29a-a8577d414809@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706202677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwiSZZSX/ApevLiEYXtfnRTxSGnWM9HwOp5AgT3owUs=;
 b=N0U7gxV4MpRvXxZcKiNEOu7DcT42hPeaN/Y2U6qOFPHSWeUEx4AgFNLBjp7qqagQPL5Oin
 vS/FcFfWwyVinSJlI1TWDI/1iwAtorxSkT5HS1mkvoDa4w5K36G+wEdbCJp+CO7+M+5p6Y
 yxIDgy4Ne25i2rLOl8VrcxMTq+AfUn4=
Date: Thu, 25 Jan 2024 17:11:08 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Esben Haabendal <esben@geanix.com>, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
References: <cover.1706184304.git.esben@geanix.com>
 <5606bb5f0b7566a20bb136b268dae89d22a48898.1706184304.git.esben@geanix.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <5606bb5f0b7566a20bb136b268dae89d22a48898.1706184304.git.esben@geanix.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 26 Jan 2024 08:30:58 +0000
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: dwmac-imx: set TSO/TBS
 TX queues default settings
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 25/01/2024 12:34, Esben Haabendal wrote:
> TSO and TBS cannot coexist. For now we set i.MX Ethernet QOS controller to use
> TX queue with TSO and the rest for TBS.
> 
> TX queues with TBS can support etf qdisc hw offload.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> index 8f730ada71f9..c42e8f972833 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -353,6 +353,12 @@ static int imx_dwmac_probe(struct platform_device *pdev)
>   	if (data->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
>   		plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY;
>   
> +        for (int i = 0; i < plat_dat->tx_queues_to_use; i++) {
> +                /* Default TX Q0 to use TSO and rest TXQ for TBS */
> +                if (i > 0)
> +                        plat_dat->tx_queues_cfg[i].tbs_en = 1;
> +        }
> +

Just wonder why don't you start with i = 1 and remove 'if' completely?
Keeping comment in place will make it understandable.

>   	plat_dat->host_dma_width = dwmac->ops->addr_width;
>   	plat_dat->init = imx_dwmac_init;
>   	plat_dat->exit = imx_dwmac_exit;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
