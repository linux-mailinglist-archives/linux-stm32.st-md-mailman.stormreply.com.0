Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE75818746
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 13:20:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5426C6B461;
	Tue, 19 Dec 2023 12:20:39 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00C2BC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 12:20:37 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a1fae88e66eso499250066b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 04:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702988437; x=1703593237;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l6TxmZzSrla4vvXDQC7Cn74njvru9m/j+6El3HghLS4=;
 b=DBqE25ObNI2sSNO5EicO24KsDneRi1w5ybsK20epFT+ZdGEI63/jhgpMLqQPvQh2mO
 RbdRKvVBUzw8FYJeDjLZjxHhX7tWK/MJst2KWYps8YUkpdhZ6yyRFHcKKWxRLYRh36GJ
 BRl0Geo+x00FvfBn11p43W8zGTbLfmRPElVA3cBXizGovjpLJzFHwKKQc2F0mQBUGhys
 BDT/AEJyX9KkP0zE5xWEnD4Uu2sy+gcRzHO6ciaZHAPdG90+Q252MV9g1IOjdFHYJbZI
 I2vd3V8qwWFa4e3B9NkgRM+TJvyYeSENyFAc6Ckw0Qf4/F2NpkwN/8NYinOchWMwl8Gw
 eaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702988437; x=1703593237;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l6TxmZzSrla4vvXDQC7Cn74njvru9m/j+6El3HghLS4=;
 b=J0qOjPQew9kJ8oYJQi5jsDnq0c57ztGQt1lgVcAEa0swsUr9L0QjcqazAguBmLPSRQ
 KrMbAKKPUZ+PQWQSwmXT31NTfrthkAFnYnbgundKZYZP+bVP3ESmnILBReCLYES7LcQK
 PjOtnvnmDzSXh1VRA/iCHWGilOOaO4OCUd45w8OJAEsp72ebGT8QVNK7j1s2o7WvtsMq
 YZx3Kt0WmxQlylXxsDDbgDzEdLvbt7Xl2MUr/iOxU0tLaI2cdXnqYNZ53fuQzLI3pN9k
 Tl0h4Mn9oYYQky/FlemWtFox86IDQxJVRZROG1BPMfXXxgQHeP+QoJ6212tWn+LxhSu3
 Gmfg==
X-Gm-Message-State: AOJu0Yzb8cS0yN72WZcIShzp/GgqbEcckYL2GhlHuwP3uvs4tCOj5e6s
 qnt6ZlKmw552v+j0t25ZYCk=
X-Google-Smtp-Source: AGHT+IEF85zDgPhfMUFpTsLoXGcLUVBLjiYkSXZm9jyM0zEWCF6zNqlV9cTbyQPPvo84zRJXC5qRFg==
X-Received: by 2002:a17:906:b0d4:b0:a1d:7792:cdbe with SMTP id
 bk20-20020a170906b0d400b00a1d7792cdbemr7007558ejb.146.1702988437094; 
 Tue, 19 Dec 2023 04:20:37 -0800 (PST)
Received: from skbuf ([188.27.185.68]) by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm15284866ejc.162.2023.12.19.04.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 04:20:36 -0800 (PST)
Date: Tue, 19 Dec 2023 14:20:34 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20231219122034.pg2djgrosa4irubh@skbuf>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
 <20231218162326.173127-2-romain.gantois@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231218162326.173127-2-romain.gantois@bootlin.com>
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Prevent DSA tags
	from breaking COE
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

Hi Romain,

On Mon, Dec 18, 2023 at 05:23:23PM +0100, Romain Gantois wrote:
> Some stmmac cores have Checksum Offload Engines that cannot handle DSA tags
> properly. These cores find the IP/TCP headers on their own and end up
> computing an incorrect checksum when a DSA tag is inserted between the MAC
> header and IP header.
> 
> Add an additional check on stmmac link up so that COE is deactivated
> when the stmmac device is used as a DSA conduit.
> 
> Add a new dma_feature flag to allow cores to signal that their COEs can't
> handle DSA tags on TX.
> 
> Fixes: 6b2c6e4a938f ("net: stmmac: propagate feature flags to vlan")
> Cc: stable@vger.kernel.org
> Reported-by: Richard Tresidder <rtresidd@electromag.com.au>
> Closes: https://lore.kernel.org/netdev/e5c6c75f-2dfa-4e50-a1fb-6bf4cdb617c2@electromag.com.au/
> Reported-by: Romain Gantois <romain.gantois@bootlin.com>
> Closes: https://lore.kernel.org/netdev/c57283ed-6b9b-b0e6-ee12-5655c1c54495@bootlin.com/
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---

DSA_TAG_PROTO_LAN9303, DSA_TAG_PROTO_SJA1105 and DSA_TAG_PROTO_SJA1110
construct tags with ETH_P_8021Q as EtherType. Do you still think it
would be correct to say that all DSA tags break COE on the stmmac, as
this patch assumes?

The NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM convention is not about
statically checking whether the interface using DSA, but about looking
at each packet before deciding whether to use the offload engine or to
call skb_checksum_help().

You can experiment with any tagging protocol on the stmmac driver, and
thus with the controller's response to any kind of traffic, even if the
port is not attached to a hardware switch. You need to enable the
CONFIG_NET_DSA_LOOP option, edit the return value of dsa_loop_get_protocol()
and the "netdev" field of dsa_loop_pdata. The packets need to be
analyzed on the link partner with a packet analysis tool, since there is
no switch to strip the DSA tag.

>  drivers/net/ethernet/stmicro/stmmac/common.h     |  1 +
>  .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c  |  1 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 +++++++++++++++-
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
> index daf79cdbd3ec..50686cdc3320 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
> @@ -264,6 +264,7 @@ static int dwmac1000_get_hw_feature(void __iomem *ioaddr,
>  	dma_cap->number_tx_channel = (hw_cap & DMA_HW_FEAT_TXCHCNT) >> 22;
>  	/* Alternate (enhanced) DESC mode */
>  	dma_cap->enh_desc = (hw_cap & DMA_HW_FEAT_ENHDESSEL) >> 24;
> +	dma_cap->dsa_breaks_tx_coe = 1;
>  
>  	return 0;
>  }
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a9b6b383e863..733348c65e04 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -42,6 +42,7 @@
>  #include <net/page_pool/helpers.h>
>  #include <net/pkt_cls.h>
>  #include <net/xdp_sock_drv.h>
> +#include <net/dsa.h>
>  #include "stmmac_ptp.h"
>  #include "stmmac.h"
>  #include "stmmac_xdp.h"
> @@ -993,8 +994,11 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  			       int speed, int duplex,
>  			       bool tx_pause, bool rx_pause)
>  {
> -	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
> +	struct net_device *ndev = to_net_dev(config->dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	unsigned int tx_queue_cnt;
>  	u32 old_ctrl, ctrl;
> +	int queue;
>  
>  	if ((priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
>  	    priv->plat->serdes_powerup)
> @@ -1102,6 +1106,16 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  
>  	if (priv->plat->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
>  		stmmac_hwtstamp_correct_latency(priv, priv);
> +
> +	/* DSA tags break COEs on some cores. Disable TX checksum
> +	 * offloading on those cores if the netdevice is a DSA conduit.
> +	 */
> +	if (priv->dma_cap.dsa_breaks_tx_coe && netdev_uses_dsa(ndev)) {
> +		tx_queue_cnt = priv->plat->tx_queues_to_use;
> +		for (queue = 0; queue < tx_queue_cnt; queue++)
> +			priv->plat->tx_queues_cfg[queue].coe_unsupported = true;
> +	}
> +

The DSA switch driver can load after stmmac_mac_link_up() runs.
This implementation is racy anyway.

>  }
>  
>  static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
> -- 
> 2.43.0
> 
> 

pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
