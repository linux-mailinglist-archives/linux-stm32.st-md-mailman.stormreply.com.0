Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B113777E00
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 18:21:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBA12C6B469;
	Thu, 10 Aug 2023 16:21:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 336A4C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 16:21:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07B54661B4;
 Thu, 10 Aug 2023 16:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88910C43395;
 Thu, 10 Aug 2023 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691684475;
 bh=wg+muEbAujbbh2zXEVrmvAEGXX2IY9xlbeZCgjf7UGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SSGYTStsitdriIpN4kdKLnkJcGo4quBuINyYRroCoy6YF+BVm5FbF9U/kci+GVKmC
 V8zxoYzJ/0fj0/0JR7+gP4wZFD4iSGmBUs0U3sl3HIc+7Yz3s7vORWSkpq32OeoAd0
 Ro4IfgNTLwCKZh1MvZ9fpti7RLw3jntgo8i5DSH8mWOqG/G0u+lfpoX9OGu+QPP6xA
 zE0K+dPsbWvS/gAWN76XebdzQD2dvJwy6fjEcJ3KFytEh0ypL1WkDBia9ZYfHM49Tl
 QiCyz0l2LgqHbXH56K91KPhblXV0zEDH9uK1DjMEt1pJvzsFw81eeCEkPlFfzHav0x
 LcxHnaVgL7LHA==
Date: Fri, 11 Aug 2023 00:09:32 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <ZNULvNhWbRyOUDci@xhacker>
References: <20230809165007.1439-1-jszhang@kernel.org>
 <20230809165007.1439-11-jszhang@kernel.org>
 <43ea0060-ed69-4efe-4a39-224aa67ae9b8@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43ea0060-ed69-4efe-4a39-224aa67ae9b8@foss.st.com>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 10/10] net: stmmac: platform:
 support parsing per channel irq from DT
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

On Thu, Aug 10, 2023 at 04:57:00PM +0200, Alexandre TORGUE wrote:
> On 8/9/23 18:50, Jisheng Zhang wrote:
> > The snps dwmac IP may support per channel interrupt. Add support to
> > parse the per channel irq from DT.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++----
> >   .../ethernet/stmicro/stmmac/stmmac_platform.c | 23 +++++++++++++++++++
> >   2 files changed, 29 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 4ed5c976c7a3..245eeb7d3e83 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3612,7 +3612,7 @@ static int stmmac_request_irq_multi(struct net_device *dev)
> >   	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
> >   		if (i >= MTL_MAX_RX_QUEUES)
> >   			break;
> > -		if (priv->rx_irq[i] == 0)
> > +		if (priv->rx_irq[i] <= 0)
> 
> What do you fix here ?

No bug to fix, but adjust for parsing optional channel irqs from DT:
rx_irq[i] and tx_irq[i] may come from platform_get_irq_byname_optional()
so for !STMMAC_FLAG_PERCH_IRQ_EN platforms, they can be < 0. Before

Thanks
> 
> >   			continue;
> >   		int_name = priv->int_name_rx_irq[i];
> > @@ -3637,7 +3637,7 @@ static int stmmac_request_irq_multi(struct net_device *dev)
> >   	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
> >   		if (i >= MTL_MAX_TX_QUEUES)
> >   			break;
> > -		if (priv->tx_irq[i] == 0)
> > +		if (priv->tx_irq[i] <= 0)
> 
> same here
> >   			continue;
> >   		int_name = priv->int_name_tx_irq[i];
> > @@ -7278,8 +7278,10 @@ int stmmac_dvr_probe(struct device *device,
> >   	priv->plat = plat_dat;
> >   	priv->ioaddr = res->addr;
> >   	priv->dev->base_addr = (unsigned long)res->addr;
> > -	priv->plat->dma_cfg->perch_irq_en =
> > -		(priv->plat->flags & STMMAC_FLAG_PERCH_IRQ_EN);
> > +	if (res->rx_irq[0] > 0 && res->tx_irq[0] > 0) {
> > +		priv->plat->flags |= STMMAC_FLAG_PERCH_IRQ_EN;
> > +		priv->plat->dma_cfg->perch_irq_en = true;
> > +	}
> >   	priv->dev->irq = res->irq;
> >   	priv->wol_irq = res->wol_irq;
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index 29145682b57b..9b46775b41ab 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -705,6 +705,9 @@ EXPORT_SYMBOL_GPL(stmmac_remove_config_dt);
> >   int stmmac_get_platform_resources(struct platform_device *pdev,
> >   				  struct stmmac_resources *stmmac_res)
> >   {
> > +	char irq_name[8];
> > +	int i;
> > +
> >   	memset(stmmac_res, 0, sizeof(*stmmac_res));
> >   	/* Get IRQ information early to have an ability to ask for deferred
> > @@ -738,6 +741,26 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
> >   		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
> >   	}
> > +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> > +		snprintf(irq_name, sizeof(irq_name), "rx%i", i);
> > +		stmmac_res->rx_irq[i] = platform_get_irq_byname_optional(pdev, irq_name);
> > +		if (stmmac_res->rx_irq[i] < 0) {
> > +			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
> > +				return -EPROBE_DEFER;
> > +			break;
> > +		}
> > +	}
> > +
> > +	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
> > +		snprintf(irq_name, sizeof(irq_name), "tx%i", i);
> > +		stmmac_res->tx_irq[i] = platform_get_irq_byname_optional(pdev, irq_name);
> > +		if (stmmac_res->tx_irq[i] < 0) {
> > +			if (stmmac_res->tx_irq[i] == -EPROBE_DEFER)
> > +				return -EPROBE_DEFER;
> > +			break;
> > +		}
> > +	}
> > +
> >   	stmmac_res->sfty_ce_irq = platform_get_irq_byname_optional(pdev, "sfty_ce");
> >   	if (stmmac_res->sfty_ce_irq < 0) {
> >   		if (stmmac_res->sfty_ce_irq == -EPROBE_DEFER)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
