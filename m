Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0F68A6529
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 09:32:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38705C6B45B;
	Tue, 16 Apr 2024 07:32:31 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C46CC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 07:32:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 275042000A;
 Tue, 16 Apr 2024 07:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713252749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d+J9a1XsY9wVIqCw//2fmPUH+b6/wrcvkVKiCmqi9U0=;
 b=GA0sZrWAe9372nqCrt2w7l3ynepzPOSCskMsWstQkbv2DpTvZPxFBHPt7qJ4ExbwTtq4ip
 CrFWLht6zyQ7ZUwa91cwhKzBzmzZJ/kMkknRvUEC++beLzXMd2Xkwkc9HQWcQ3CzyGvIbL
 xJPQyVQJRa3SUg1V8XXeJyu71kDHv5JbYQZeBFFy+1IvQNn93U7ruseGnNfN3kUTJTV7Q3
 WBLULJmsDOZ/h82mvh+w+Il0JRcinK2JiAIYmxgh6puuvM3F7h9QlIiaey91hR/8x/QzKO
 NNK9c6LTOEc0ftlg4mAc8IFuOIuYAXv/OfZFlWyppJh5aPCWzmG3P/goyDrRKg==
Date: Tue, 16 Apr 2024 09:33:04 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
In-Reply-To: <20240412180340.7965-3-fancer.lancer@gmail.com>
Message-ID: <c9b9a88b-f6ab-25ca-74c2-474c2f1c891f@bootlin.com>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
 <20240412180340.7965-3-fancer.lancer@gmail.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, "Gan, Yi Fang" <yi.fang.gan@intel.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Subject: Re: [Linux-stm32] [PATCH net 2/4] net: stmmac: Fix max-speed being
 ignored on queue re-init
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


On Fri, 12 Apr 2024, Serge Semin wrote:

> It's possible to have the maximum link speed being artificially limited on
> the platform-specific basis. It's done either by setting up the
> plat_stmmacenet_data::max_speed field or by specifying the "max-speed"
> DT-property. In such cases it's required that any specific
> MAC-capabilities re-initializations would take the limit into account. In
> particular the link speed capabilities may change during the number of
> active Tx/Rx queues re-initialization. But the currently implemented
> procedure doesn't take the speed limit into account.
> 
> Fix that by calling phylink_limit_mac_speed() in the
> stmmac_reinit_queues() method if the speed limitation was required in the
> same way as it's done in the stmmac_phy_setup() function.
> 
> Fixes: 95201f36f395 ("net: stmmac: update MAC capabilities when tx queues are updated")
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index dd58c21b53ee..b8a1f02398ee 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7328,6 +7328,7 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	int ret = 0, i;
> +	int max_speed;
>  
>  	if (netif_running(dev))
>  		stmmac_release(dev);
> @@ -7343,6 +7344,10 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
>  
>  	stmmac_mac_phylink_get_caps(priv);
>  
> +	max_speed = priv->plat->max_speed;
> +	if (max_speed)
> +		phylink_limit_mac_speed(&priv->phylink_config, max_speed);
> +
>  	stmmac_napi_add(dev);
>  
>  	if (netif_running(dev))
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
