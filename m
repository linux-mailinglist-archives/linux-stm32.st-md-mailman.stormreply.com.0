Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id n2GcFQmQfmniagIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Feb 2026 00:28:09 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BECECC4548
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Feb 2026 00:28:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46462C0693F;
	Sat, 31 Jan 2026 23:28:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD865C0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jan 2026 23:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kIes9y28tS53Qgsq8mlA/hmeh5zQSe+vuQTcGCaQLH4=; b=SnP/VPBuH22KxGVfdB2UJKAixc
 XVM2hHoezwF+JSBRIjcXee6VRY+f2A2Dt8SxHuoKhtphXFXjaLuHEqKGOmAlW/LGPuas7yAWsp0Jv
 +q112L2P5WjDSye8Mkp2L6t+G6inKJkalVVwZ74B6RKQkUb5AvfLngK0Ml7yFtERFVPgNhxWIKQdy
 Bn6PBryzaRjkQ+NZDn0lTUQTo/xfRl5SUmchU/R2jQqCdkRGsuOCXhSNKhJu432u4NrePBebZNL2k
 qd8fHOJ6Bl025nTCABmPilcoTvfFB1h3eR/tOP1xHq14+tUNIiMBeNtu2p9w4c7cQpMxrL4yMMsel
 rfFTFUlQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55010)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vmKNe-000000002aH-2I5S;
 Sat, 31 Jan 2026 23:27:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vmKNY-000000001sG-1Jn3; Sat, 31 Jan 2026 23:27:48 +0000
Date: Sat, 31 Jan 2026 23:27:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <aX6P9D99Xi4PnI2J@shell.armlinux.org.uk>
References: <aXyPK9rlMt8h_fze@shell.armlinux.org.uk>
 <E1vlmEY-00000006znn-0N0Q@rmk-PC.armlinux.org.uk>
 <20260131140850.3c35f95a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260131140850.3c35f95a@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,armlinux.org.uk:url,shell.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: BECECC4548
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 02:08:50PM -0800, Jakub Kicinski wrote:
> On Fri, 30 Jan 2026 11:00:14 +0000 Russell King (Oracle) wrote:
> > +	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	intf = ret;
> > +
> >  	ret = gmac_clk_enable(bsp_priv, true);
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (bsp_priv->gmac_phy_intf_sel_mask ||
> > +	    bsp_priv->gmac_rmii_mode_mask) {
> > +		/* If defined, encode the phy_intf_sel value */
> > +		val = rk_encode_wm16(intf, bsp_priv->gmac_phy_intf_sel_mask);
> > +
> > +		/* If defined, encode the RMII mode mask setting. */
> > +		val |= rk_encode_wm16(intf == PHY_INTF_SEL_RMII,
> > +				      bsp_priv->gmac_rmii_mode_mask);
> > +
> > +		ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
> > +		if (ret < 0)
> 
> missing
> 	gmac_clk_enable(bsp_priv, false);
> here?

Opinions vary on whether errors from regmap_write() should be handled.
See the recent thread:

https://lore.kernel.org/r/aXh9lcfw6D6KouI_@stanley.mountain

Seems that if regmap_write() fails, it's "buy a new computer" realms.
If that's case, is it worth cleaning up resources, or even checking the
return code from regmap_write() ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
