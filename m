Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6759C69C30
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 14:59:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E106C628CF;
	Tue, 18 Nov 2025 13:59:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00D43C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 13:59:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3C561C1267D;
 Tue, 18 Nov 2025 13:59:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3C183606FE;
 Tue, 18 Nov 2025 13:59:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC53E10371DD3; Tue, 18 Nov 2025 14:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763474378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=MLKf1QB8zzifyWM44fyRAxO5E+WCOo3I8lg4wmBAeoM=;
 b=RHkFEYAgyvVY3y1++cyuIhzJKbhWpST/loRXeeznyalkCTe1lwAelo6gzFkKb9dYN7mMOM
 TSsAHdZy9s7j1/t9e8LMYeBqkViUbelLRJiaAboYCgeYZeqe7OpZCVu8QEnnpEakFEkr+v
 FlJFNKN5x5mCPTHY0RHqx36K6wL5E5dnD1KeItl0tAe2hTFZOwtdD0EOEH5umBO59V9xtm
 /HQM74ZMXuLLNPG9rWEJZ2O7XVLF9FGfHagICoxkB2yme2HA4OaS+X4l0Kf9/56WoJLoEd
 icnAGgfTMmTKtgMe9ijDg8HvL5D8n1T03/3iLb0GX+7mthKc6S+LrqUKIBcTKQ==
Message-ID: <a1f1ad21-fb73-4f30-b428-8cec5ff53ed6@bootlin.com>
Date: Tue, 18 Nov 2025 14:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
 <E1vLIWR-0000000Ewkf-1Tdx@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vLIWR-0000000Ewkf-1Tdx@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac:
 stmmac_is_jumbo_frm() len should be unsigned
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
> stmmac_is_jumbo_frm() and the is_jumbo_frm() methods take skb->len
> which is an unsigned int. Avoid an implicit cast to "int" via the
> method parameter and then incorrectly doing signed comparisons on
> this unsigned value.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/chain_mode.c | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/ring_mode.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> index fb55efd52240..d14b56e5ed40 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
> @@ -83,7 +83,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  	return entry;
>  }
>  
> -static unsigned int is_jumbo_frm(int len, int enh_desc)
> +static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
>  {
>  	unsigned int ret = 0;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index d359722100fa..4953e0fab547 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -541,7 +541,7 @@ struct stmmac_rx_queue;
>  struct stmmac_mode_ops {
>  	void (*init) (void *des, dma_addr_t phy_addr, unsigned int size,
>  		      unsigned int extend_desc);
> -	unsigned int (*is_jumbo_frm) (int len, int ehn_desc);
> +	unsigned int (*is_jumbo_frm)(unsigned int len, int ehn_desc);
>  	int (*jumbo_frm)(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  			 int csum);
>  	int (*set_16kib_bfsize)(int mtu);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> index d218412ca832..039903c424df 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> @@ -91,7 +91,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  	return entry;
>  }
>  
> -static unsigned int is_jumbo_frm(int len, int enh_desc)
> +static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
>  {
>  	unsigned int ret = 0;
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
