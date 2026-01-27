Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JmnKp4JeGk2ngEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 01:41:02 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D348E837
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 01:41:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5885FC3F945;
	Tue, 27 Jan 2026 00:41:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29E94C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 00:41:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3FE7C60097;
 Tue, 27 Jan 2026 00:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A547C116C6;
 Tue, 27 Jan 2026 00:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769474459;
 bh=gyfB6CxCcjmjjILeS0ZovfjbSMTZXSuR0XjS5SBThoA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UFVT0ozS7FgYPwaFDGZ2cfWG/YY0qi0V4LPQU40c0jX9fImWwrtpWlxdnt49l6rRY
 IfaHAQPPFc2RZ3JGvCuM6tTpBHcmYxktxedE/mHEKiddEqF+eze1T163nqc3edvZr9
 tLFBLabXkQx/jpHgkNRSyWj5bNQCdae0z82Fe82+jD/f2IAHUA316GeuWuXskcT1Ka
 Uog7VArapPEvIuXcXCR2XDRq+qr9Jeo30IMKCFiMSveEG4V5hM3ORrzG3GYjYOomrC
 tq7dKlnF8YodLJXlXUGc0LR18mW/bZZqglo4aEp9xO68iBwamtVrN1jdqfTM92wHjT
 L5XbbISIqMQbw==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Date: Mon, 26 Jan 2026 16:40:57 -0800
Message-ID: <20260127004057.3785761-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vkL2D-00000005uso-3W6y@rmk-PC.armlinux.org.uk>
References: <E1vkL2D-00000005uso-3W6y@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 edumazet@google.com, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next, v2,
	07/22] net: stmmac: rk: convert to mask-based interface mode
	configuration
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,linux.dev:url,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 97D348E837
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: rk: convert to mask-based interface mode configuration

This commit consolidates PHY interface mode configuration into common
infrastructure by introducing mask fields for phy_intf_sel and rmii_mode,
moving the register writes from SoC-specific functions into the common
rk_gmac_powerup() function.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 4117f6863ff0..35836ffdfc1d 100644

[ ... ]

> @@ -1654,7 +1685,9 @@ static int rk_gmac_check_ops(struct rk_priv_data *bsp_priv)
>  static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  {
>  	struct device *dev = bsp_priv->dev;
> +	u32 val;
>  	int ret;
> +	u8 intf;
>
>  	ret = rk_gmac_check_ops(bsp_priv);
>  	if (ret)
> @@ -1664,6 +1697,26 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  	if (ret)
>  		return ret;
>
> +	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
> +	if (ret < 0)
> +		return ret;

Should this error path call gmac_clk_enable(bsp_priv, false) before
returning? The clocks were enabled just above, and the existing error
handling for rk_phy_powerup() later in this function disables the
clocks on failure:

    ret = rk_phy_powerup(bsp_priv);
    if (ret) {
        gmac_clk_enable(bsp_priv, false);
        return ret;
    }

> +
> +	intf = ret;
> +
> +	if (bsp_priv->gmac_phy_intf_sel_mask ||
> +	    bsp_priv->gmac_rmii_mode_mask) {
> +		/* If defined, encode the phy_intf_sel value */
> +		val = rk_encode_wm16(intf, bsp_priv->gmac_phy_intf_sel_mask);
> +
> +		/* If defined, encode the RMII mode mask setting. */
> +		val |= rk_encode_wm16(intf == PHY_INTF_SEL_RMII,
> +				      bsp_priv->gmac_rmii_mode_mask);
> +
> +		ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
> +		if (ret < 0)
> +			return ret;

Same question here - should this also disable clocks before returning?

> +	}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
