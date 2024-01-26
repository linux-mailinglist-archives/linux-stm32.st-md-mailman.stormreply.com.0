Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 126E083E351
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 21:24:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6551C6DD70;
	Fri, 26 Jan 2024 20:24:39 +0000 (UTC)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99B2AC6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 20:24:38 +0000 (UTC)
Message-ID: <9f8343c3-7403-4346-9973-1b4421e3ad7d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706300677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8oebQaftQNT6LeEHr7TKK0RzE3dlOdRvYdiT9hpg60=;
 b=J64cU7AZQmfIOteP1Arx1fIFb/l+unLnQLiVc+IckZodSv/fH3ql/JCtI81f4qbE5AsP17
 ROb9SXlR92gYbuPHBDIXPDL4wxR3Cc1Y+h0jmiucTF/uSLsONdhB3B3JNMj2k5jl50vCpa
 hT3rq4jcrGqua93Dtgvvn4I1yp+6Ll4=
Date: Fri, 26 Jan 2024 20:24:29 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Esben Haabendal <esben@geanix.com>, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <cover.1706256158.git.esben@geanix.com>
 <379f79687ca4a7d0394a04d14fb3890ce257e706.1706256158.git.esben@geanix.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <379f79687ca4a7d0394a04d14fb3890ce257e706.1706256158.git.esben@geanix.com>
X-Migadu-Flow: FLOW_OUT
Cc: Rohan G Thomas <rohan.g.thomas@intel.com>,
 "Abhishek Chauhan \(ABC\)" <quic_abchauha@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: dwmac-imx: set
 TSO/TBS TX queues default settings
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

On 26/01/2024 09:10, Esben Haabendal wrote:
> TSO and TBS cannot coexist. For now we set i.MX Ethernet QOS controller to
> use the first TX queue with TSO and the rest for TBS.
> 
> TX queues with TBS can support etf qdisc hw offload.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> index 8f730ada71f9..6b65420e11b5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -353,6 +353,10 @@ static int imx_dwmac_probe(struct platform_device *pdev)
>   	if (data->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
>   		plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY;
>   
> +	/* Default TX Q0 to use TSO and rest TXQ for TBS */
> +	for (int i = 1; i < plat_dat->tx_queues_to_use; i++)
> +		plat_dat->tx_queues_cfg[i].tbs_en = 1;
> +
>   	plat_dat->host_dma_width = dwmac->ops->addr_width;
>   	plat_dat->init = imx_dwmac_init;
>   	plat_dat->exit = imx_dwmac_exit;

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
