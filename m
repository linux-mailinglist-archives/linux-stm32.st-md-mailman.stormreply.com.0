Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LVjCDCe6OmqfFAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 18:53:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC13A6B8E37
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 18:53:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=XYQ+4qmb;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65530C9AE46;
	Tue, 23 Jun 2026 16:53:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4152BC6C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 16:53:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 31747C6B397;
 Tue, 23 Jun 2026 16:54:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6AF8A601C2;
 Tue, 23 Jun 2026 16:53:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BEDE3106C8382; 
 Tue, 23 Jun 2026 18:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1782233635; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=z14O1Oxv2MwpgYnEYsps2OBdWGQ1E7SU6CsxbrKj0vc=;
 b=XYQ+4qmbXXeldrcn9HdaF60+1YlbI4oqajGsTyoZ3GOmFLAk8mbo9eEIGW387IITgwp/hh
 sqIzohPg5uC0vvhiKcYRo8zkzFRQsYknDD2eT7TO+scjLzEFnPc8LPi/gNX20DcCygj/2L
 DkZW5Jz6kME6LbEAxUP9N2MtjWGNdnSLCfDgqr9VZAl1LxqjihK2+PgWtmsctPyufJta+Z
 QaT31nsU1MLJNsHy7rVPnN4FCwhnegT/9XFBInRwmknfuZicE6kKrdYCYFuDLg9kfMDUkX
 j3K43D2pE51iCCQbjxEOjIFe9DKSg7BNrxq57syQNtK0zTAmUq9APdcO9jHM9Q==
Message-ID: <12bb1713-d620-4db4-b240-fbc911be5ea3@bootlin.com>
Date: Tue, 23 Jun 2026 18:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yixun Lan
 <dlan@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <20260623074637.503864-1-inochiama@gmail.com>
 <20260623074637.503864-2-inochiama@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260623074637.503864-2-inochiama@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/2] net: stmmac: dwmac-spacemit:
 Fix wrong phy interface definition
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:inochiama@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dlan@kernel.org,m:rmk+kernel@armlinux.org.uk,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,foss.st.com,armlinux.org.uk];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gentoo.org,vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC13A6B8E37

Hello,

On 6/23/26 09:46, Inochi Amaoto wrote:
> The current MII interface register definition from the vendor is wrong,
> use the right number for the macro. Also, correct the interface mask
> in spacemit_set_phy_intf_sel() so it can update the register with the
> right number
> 
> Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> index 223754cc5c79..3bfb6d49be6c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> @@ -18,8 +18,10 @@
>  #include "stmmac_platform.h"
>  
>  /* ctrl register bits */
> -#define CTRL_PHY_INTF_RGMII		BIT(3)
> -#define CTRL_PHY_INTF_MII		BIT(4)
> +#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
> +#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
> +#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
> +#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
>  #define CTRL_WAKE_IRQ_EN		BIT(9)
>  #define CTRL_PHY_IRQ_EN			BIT(12)
>  
> @@ -118,7 +120,7 @@ static void spacemit_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
>  
>  static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
>  {
> -	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII;
> +	unsigned int mask = CTRL_PHY_INTF_MODE;
>  	struct spacmit_dwmac *dwmac = bsp_priv;
>  	unsigned int val = 0;
>  
> @@ -128,6 +130,7 @@ static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
>  		break;
>  
>  	case PHY_INTF_SEL_RMII:
> +		val = CTRL_PHY_INTF_RMII;

This isn't strictly-speaking necessary as this is 0 and val is already 0, maybe
compilers can figure it out and this leaves us with more self-documenting code ?

So I'm ok with that personally,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


>  		break;
>  
>  	case PHY_INTF_SEL_RGMII:

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
