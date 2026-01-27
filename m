Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPRaL6AJeGk2ngEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 01:41:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4D8E83F
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 01:41:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E690C36B30;
	Tue, 27 Jan 2026 00:41:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 161DFC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 00:41:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B434644344;
 Tue, 27 Jan 2026 00:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076F2C116C6;
 Tue, 27 Jan 2026 00:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769474461;
 bh=E6r83GJEejdqNv42ad0axn2xC3bNIulFB7d/X0R4UEw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VqvsPB4XnXGAUSGtfXM2BLjW83pb+dmu9z0syFGF8qUO1beyR72ZsCuSiTzwgd3Ph
 k/7VdLhJE+r0StwGC8QI1B+2qrRCNui/70imSiNwX9P0x57syOIGjpqh4hfVhL6QKF
 z/XHx/6+Qjat2sO/QsNbSQFvqLTTGg3R4BNuADKsmYLBiNHgIyciMtYcOMa6xDGAUz
 AQxAT1AsH2Ee6O7npCq6v2jhv71XmkIm3vCTcPsh6i8Qaoomosfn9xvBNgr4Nm6Z56
 D+TQiaN7q19e7krhexQtow5GAan+Ug4W839LIxc336jnecHq/ZgZeO+3FTxm4jBudz
 7lZcUee/VmbsA==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Date: Mon, 26 Jan 2026 16:41:00 -0800
Message-ID: <20260127004100.3785792-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vkL2I-00000005usu-42Hy@rmk-PC.armlinux.org.uk>
References: <E1vkL2I-00000005usu-42Hy@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 edumazet@google.com, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next, v2,
	08/22] net: stmmac: rk: convert rk3588 to mask-based interface mode
	config
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,linux.dev:url]
X-Rspamd-Queue-Id: ABE4D8E83F
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: rk: convert rk3588 to mask-based interface mode config

This patch adds a gmac_grf_reg_in_php flag and a rk_write_gmac_grf_reg()
helper to write to either php_grf or grf depending on the SoC. It also
adds an init function for rk3588 to set up the interface mode mask.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 35836ffdfc1d..5bbdcc963430 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -126,6 +127,18 @@ static u32 rk_encode_wm16(u16 val, u16 mask)
>  	return reg_val;
>  }
>
> +static int rk_write_gmac_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
> +{
> +	struct regmap *regmap;
> +
> +	if (bsp_priv->ops->gmac_grf_reg_in_php)
> +		regmap = bsp_priv->php_grf;
> +	else
> +		regmap = bsp_priv->grf;
> +
> +	return regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
                          ^^^^^^^^^^^^^^

The regmap variable is computed based on gmac_grf_reg_in_php but then not
used - the call always writes to bsp_priv->grf instead of regmap. For
rk3588 where gmac_grf_reg_in_php is true, this writes to the wrong
register bank. Should this be regmap_write(regmap, ...) instead?

> +}

[ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
