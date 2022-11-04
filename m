Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B56619BAB
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 16:32:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94717C65042;
	Fri,  4 Nov 2022 15:32:29 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20D9EC64104
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=mT0boajW4GkaMWXjn2Ik44yi9m1XKFhaBoFguDvv3vg=; b=0aKDagYd+Mxgi/Pvo5mkjonGNN
 80IH8gS04w8qq49ppCPCtcvQmc2osfp0F7g8wTOnEs1Psnx0T1GX9I8Ds0sw8bAnL6lSw9f1YMt/g
 IhWxsymy8N0NipH+eiJrZn9aVbbtTeGrmkGuCrC8mvoIh1AQ2KtQrTL5AiLr5O9mjqYg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1oqyfw-001RMg-PA; Fri, 04 Nov 2022 16:32:08 +0100
Date: Fri, 4 Nov 2022 16:32:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sriranjani P <sriranjani.p@samsung.com>
Message-ID: <Y2UweBsUDvrU9keT@lunn.ch>
References: <20221104120517.77980-1-sriranjani.p@samsung.com>
 <CGME20221104115854epcas5p4ca280f9c4cc4d1fa564d80016e9f0061@epcas5p4.samsung.com>
 <20221104120517.77980-3-sriranjani.p@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221104120517.77980-3-sriranjani.p@samsung.com>
Cc: linux-kernel@vger.kernel.org, Chandrasekar R <rcsekar@samsung.com>,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 Suresh Siddha <ssiddha@tesla.com>, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] net: stmmac: dwc-qos: Add FSD EQoS
	support
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

> For FSD SoC, a mux switch is needed between internal and external clocks.
> By default after reset internal clock is used but for receiving packets
> properly, external clock is needed. Mux switch to external clock happens
> only when the external clock is present.


> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3831,6 +3831,9 @@ static int __stmmac_open(struct net_device *dev,
>  	netif_tx_start_all_queues(priv->dev);
>  	stmmac_enable_all_dma_irq(priv);
>  
> +	if (priv->plat->rxmux_setup)
> +		priv->plat->rxmux_setup(priv->plat->bsp_priv, true);
> +
>  	return 0;
>  
>  irq_error:
> @@ -3884,6 +3887,9 @@ static int stmmac_release(struct net_device *dev)
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	u32 chan;
>  
> +	if (priv->plat->rxmux_setup)
> +		priv->plat->rxmux_setup(priv->plat->bsp_priv, false);
> +

Is this the code which is deciding if the external clock is present? So when somebody called
'ip link set eth42 up'?

Where is the external clock coming from?

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
