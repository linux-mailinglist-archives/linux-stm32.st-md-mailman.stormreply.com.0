Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C96D7C69C3C
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 15:00:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96440C628CF;
	Tue, 18 Nov 2025 14:00:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9335AC1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 14:00:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 38FD4C1267E;
 Tue, 18 Nov 2025 13:59:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5EF33606FE;
 Tue, 18 Nov 2025 14:00:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E891010371DD3; Tue, 18 Nov 2025 15:00:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763474412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=1T9L6GNFxVeySHO4fK7pztQOaxOzwYo2ILkJ3QC3pyY=;
 b=GwVHwhM0ZXmBzkSyBjZN/AiXpiutG2xbKiY+F25x3Vc8hAaL8BUxv9fCOApJM+edWzt8mH
 MUqOlKjs4IAh/IpCxP/Kg8k+aE8TYWAtuyVjtQTVdLs3+E5WlvAgAAf5thKL5fJdUGhfnt
 xPJJtNJzsX2PR/Jln0+oRXIpRrrjftSacS558PssKLG2Z7FC4ILyvoOA5KThBv72YTxDl6
 0sLDe6Nafd6FapcU6BfDYV0R0IpOSSaF7pgkcciW6PsJHAhvuUuqAFC8fMgflGpnq4e7fe
 Ud0r7ycdege9sLBCX6q+LsFUIMKYoKeYkWU1Yl0x3HoWdkDIy7J1V5vAMdhoog==
Message-ID: <ec621eb4-8a4f-47fd-a544-44d8130fcbb8@bootlin.com>
Date: Tue, 18 Nov 2025 15:00:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
 <E1vLIWW-0000000Ewkl-21Ia@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vLIWW-0000000Ewkl-21Ia@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac:
 stmmac_is_jumbo_frm() returns boolean
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



On 18/11/2025 11:01, Russell King (Oracle) wrote:
> stmmac_is_jumbo_frm() returns whether the driver considers the frame
> size to be a jumbo frame, and thus returns 0/1 values. This is boolean,
> so convert it to return a boolean and use false/true instead. Also
> convert stmmac_xmit()'s is_jumbo to be bool, which causes several
> variables to be repositioned to keep it in reverse Christmas-tree
> order.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/chain_mode.c  | 9 ++++-----
>  drivers/net/ethernet/stmicro/stmmac/hwif.h        | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/ring_mode.c   | 9 ++-------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
>  4 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> index d14b56e5ed40..120a009c9992 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> @@ -83,14 +83,13 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  	return entry;
>  }
>  
> -static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
> +static bool is_jumbo_frm(unsigned int len, bool enh_desc)
>  {
> -	unsigned int ret = 0;
> +	bool ret = false;
>  
>  	if ((enh_desc && (len > BUF_SIZE_8KiB)) ||
> -	    (!enh_desc && (len > BUF_SIZE_2KiB))) {
> -		ret = 1;
> -	}
> +	    (!enh_desc && (len > BUF_SIZE_2KiB)))
> +		ret = true;
>  
>  	return ret;
>  }
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 4953e0fab547..f257ce4b6c66 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -541,7 +541,7 @@ struct stmmac_rx_queue;
>  struct stmmac_mode_ops {
>  	void (*init) (void *des, dma_addr_t phy_addr, unsigned int size,
>  		      unsigned int extend_desc);
> -	unsigned int (*is_jumbo_frm)(unsigned int len, int ehn_desc);
> +	bool (*is_jumbo_frm)(unsigned int len, bool enh_desc);
>  	int (*jumbo_frm)(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  			 int csum);
>  	int (*set_16kib_bfsize)(int mtu);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> index 039903c424df..382d94a3b972 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> @@ -91,14 +91,9 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  	return entry;
>  }
>  
> -static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
> +static bool is_jumbo_frm(unsigned int len, bool enh_desc)
>  {
> -	unsigned int ret = 0;
> -
> -	if (len >= BUF_SIZE_4KiB)
> -		ret = 1;
> -
> -	return ret;
> +	return len >= BUF_SIZE_4KiB;
>  }
>  
>  static void refill_desc3(struct stmmac_rx_queue *rx_q, struct dma_desc *p)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index db68c89316ec..12fc31c909c4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4579,18 +4579,18 @@ static bool stmmac_has_ip_ethertype(struct sk_buff *skb)
>   */
>  static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  {
> -	unsigned int first_entry, tx_packets, enh_desc;
> +	bool enh_desc, has_vlan, set_ic, is_jumbo = false;
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	unsigned int nopaged_len = skb_headlen(skb);
> -	int i, csum_insertion = 0, is_jumbo = 0;
>  	u32 queue = skb_get_queue_mapping(skb);
>  	int nfrags = skb_shinfo(skb)->nr_frags;
> +	unsigned int first_entry, tx_packets;
>  	int gso = skb_shinfo(skb)->gso_type;
>  	struct stmmac_txq_stats *txq_stats;
>  	struct dma_edesc *tbs_desc = NULL;
>  	struct dma_desc *desc, *first;
>  	struct stmmac_tx_queue *tx_q;
> -	bool has_vlan, set_ic;
> +	int i, csum_insertion = 0;
>  	int entry, first_tx;
>  	dma_addr_t des;
>  	u32 sdu_len;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
