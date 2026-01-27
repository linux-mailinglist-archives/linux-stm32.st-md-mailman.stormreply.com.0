Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sENfFpoMeGl3ngEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 01:53:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF98A8E90A
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 01:53:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AF99C36B13;
	Tue, 27 Jan 2026 00:53:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F63DC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 00:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gOelw5A+TDHV0v/cJbYEPVYXwn43626zGv3kYC/dxwE=; b=AzjxNU6h42QGqLhgZkUoGP5Rxq
 dyyBenXI5avgGV0jK3U+tRAL4OGup9CV04oCHWYYBVYQFlvAhg3nVFQNZgb7qiWMzgQdFqbcuyF+0
 owixY3bTixCW+Ql2jGQFP4RjWbfLXA+A+ttTm/fRbbGF4wLbEfGhmo1G5cwLTn0HEcXcUKmk3M1XJ
 YNF2P2pz31mQiWC7PcuCyL2jObC99lbG+ktJ9zqlnmbeH00LN05irT3JtbyA/mVB/lzV5wKuLwvj/
 +6nBxgacMDkB8b5LFcLrHFrQYqr1pAn9sP/2E4aVSwe674QpFgdUBq8jcLmHJhtctDp3U4uHhCE2M
 C+x9oelQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55834)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vkXKv-000000005Tw-3ER2;
 Tue, 27 Jan 2026 00:53:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vkXKt-000000005Qo-2p86; Tue, 27 Jan 2026 00:53:39 +0000
Date: Tue, 27 Jan 2026 00:53:39 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <aXgMkyo3UhuEnnjG@shell.armlinux.org.uk>
References: <E1vkL2D-00000005uso-3W6y@rmk-PC.armlinux.org.uk>
 <20260127004057.3785761-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260127004057.3785761-1-kuba@kernel.org>
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 edumazet@google.com, pabeni@redhat.com,
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,stormreply.com:url,stormreply.com:email,shell.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns,armlinux.org.uk:url]
X-Rspamd-Queue-Id: EF98A8E90A
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 04:40:57PM -0800, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: rk: convert to mask-based interface mode configuration
> 
> This commit consolidates PHY interface mode configuration into common
> infrastructure by introducing mask fields for phy_intf_sel and rmii_mode,
> moving the register writes from SoC-specific functions into the common
> rk_gmac_powerup() function.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > index 4117f6863ff0..35836ffdfc1d 100644
> 
> [ ... ]
> 
> > @@ -1654,7 +1685,9 @@ static int rk_gmac_check_ops(struct rk_priv_data *bsp_priv)
> >  static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
> >  {
> >  	struct device *dev = bsp_priv->dev;
> > +	u32 val;
> >  	int ret;
> > +	u8 intf;
> >
> >  	ret = rk_gmac_check_ops(bsp_priv);
> >  	if (ret)
> > @@ -1664,6 +1697,26 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
> >  	if (ret)
> >  		return ret;
> >
> > +	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
> > +	if (ret < 0)
> > +		return ret;
> 
> Should this error path call gmac_clk_enable(bsp_priv, false) before
> returning? The clocks were enabled just above, and the existing error
> handling for rk_phy_powerup() later in this function disables the
> clocks on failure:
> 
>     ret = rk_phy_powerup(bsp_priv);
>     if (ret) {
>         gmac_clk_enable(bsp_priv, false);
>         return ret;
>     }

This piecemeal review by AI is like death by a thousand cuts. Can we
please either stop using it, or find some way to have _all_ the
problems discovered at once.

I fix one problem in this patch, and the bloody AI reports another.
And with the 10 sodding hour turn-around time, this is beyond a joke.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
