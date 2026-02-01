Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id r5aaO9uhfmmybgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Feb 2026 01:44:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6C1C4849
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Feb 2026 01:44:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1806C0693F;
	Sun,  1 Feb 2026 00:44:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1752EC0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Feb 2026 00:44:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8F6E744285;
 Sun,  1 Feb 2026 00:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC401C4CEF1;
 Sun,  1 Feb 2026 00:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769906648;
 bh=OA7Q9YrHL2xoPfi2sklWNonwOgZc4d+Wx+DZIdbyklo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kvX99E3vssMYn5lQzJFdI61X61d3TmyvBziTkrjluG/VMSY5VbfgfqWvh7Dr/T2qv
 79LiipB/GXy/Z2Aj0XufJ2mmkQf4se1bK7Euv6n0KD2WKuuluVHJKp0LMXXP80v9fc
 1y7Da4yNqlUeXIcAieuPuzScx8WJOqa38oDGJSC15IixczeiWbRDJRAlJ5ScQttPcJ
 E2a0CUd5EeFHwV3uhfh9hgdwN5TRMUko5hSPRDtltc+xcaE3vsV1ReA0+1p81LpQCp
 5sQxBW/SIkA5PTMWeW3v2mmWD4EWoSZ7xA9ZDeOIbVqOBykw5djtK6SeSXir2HRYpo
 TlHHX1+CQHmSg==
Date: Sat, 31 Jan 2026 16:44:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260131164406.3c90587f@kernel.org>
In-Reply-To: <aX6P9D99Xi4PnI2J@shell.armlinux.org.uk>
References: <aXyPK9rlMt8h_fze@shell.armlinux.org.uk>
 <E1vlmEY-00000006znn-0N0Q@rmk-PC.armlinux.org.uk>
 <20260131140850.3c35f95a@kernel.org>
 <aX6P9D99Xi4PnI2J@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 01/10] net: stmmac: rk: convert
 to mask-based interface mode configuration
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 7A6C1C4849
X-Rspamd-Action: no action

On Sat, 31 Jan 2026 23:27:48 +0000 Russell King (Oracle) wrote:
> > > +	if (bsp_priv->gmac_phy_intf_sel_mask ||
> > > +	    bsp_priv->gmac_rmii_mode_mask) {
> > > +		/* If defined, encode the phy_intf_sel value */
> > > +		val = rk_encode_wm16(intf, bsp_priv->gmac_phy_intf_sel_mask);
> > > +
> > > +		/* If defined, encode the RMII mode mask setting. */
> > > +		val |= rk_encode_wm16(intf == PHY_INTF_SEL_RMII,
> > > +				      bsp_priv->gmac_rmii_mode_mask);
> > > +
> > > +		ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
> > > +		if (ret < 0)  
> > 
> > missing
> > 	gmac_clk_enable(bsp_priv, false);
> > here?  
> 
> Opinions vary on whether errors from regmap_write() should be handled.
> See the recent thread:
> 
> https://lore.kernel.org/r/aXh9lcfw6D6KouI_@stanley.mountain
> 
> Seems that if regmap_write() fails, it's "buy a new computer" realms.
> If that's case, is it worth cleaning up resources, or even checking the
> return code from regmap_write() ?

I don't feel strongly, happy for you to make the call.

Just wanted to flag this now rather than Monday when it can be applied.
(I try to give reviewers 24h of "non-weekend" time before applying so
this series would have to wait until Mon, anyway.)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
