Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIYLO+zTfGlbOwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 16:53:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DC4BC427
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 16:53:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 306BBC56603;
	Fri, 30 Jan 2026 15:53:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2BD5C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 15:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HXe//ENorTTfM0niimm1e9yrY55w/0fMrZ/qt/A7EwM=; b=aS+ac/s20VY5WOMnOTrrKTXkqw
 CvUccuNW8erl31P/A6aO0RTRQyLv9VkiYGK0m6u5zBmV5IGGnas6fK1PiuUMqhkUiFn72vVs+igMx
 xwSPo1it4HcrWcdKwA5gPvudx5huDaj0jFHempG5JHTFClIelb5fWTlgXb4/b0yC+EKGOZVzfurK5
 q/ocekDnstsspNsC+ZRwBg6LMMu5lSaCp+ifYdpEwxVhOFwbEPKScaDUTp5xfiPfKaUWos/tLpPXE
 UnDVNlFvJNhhae9c26rIO/ItRBMJQ9ASIMNaYrFECF/CamkXwyvk8uSGl9oVu+kqqAgGkkVSappfI
 40fVGUlw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55186)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vlqnq-000000001Fc-0kyn;
 Fri, 30 Jan 2026 15:52:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vlqnl-000000000dd-2qfp; Fri, 30 Jan 2026 15:52:53 +0000
Date: Fri, 30 Jan 2026 15:52:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marek Vasut <marex@nabladev.com>
Message-ID: <aXzT1UCpG4kN-dQv@shell.armlinux.org.uk>
References: <20260114081809.12758-1-marex@nabladev.com>
 <aWfEXX1iMHy3V5sK@shell.armlinux.org.uk>
 <aWfOYf_YmJFUakvP@shell.armlinux.org.uk>
 <6c9cadc2-67b7-4bfe-9cf7-2b102a0a3c21@nabladev.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c9cadc2-67b7-4bfe-9cf7-2b102a0a3c21@nabladev.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzk@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH] net: stmmac: stm32: Do not suspend downed interface
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:linux-kernel@vger.kernel.org,m:horms@kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:krzk@kernel.org,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@dh-electronics.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,st-md-mailman.stormreply.com,davemloft.net,lunn.ch,google.com,dh-electronics.com,gmail.com,redhat.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 73DC4BC427
X-Rspamd-Action: no action

On Thu, Jan 15, 2026 at 12:27:05AM +0100, Marek Vasut wrote:
> On 1/14/26 6:12 PM, Russell King (Oracle) wrote:
> > I think I'm going to start over, trying to figure out what happened.
> > 
> > c7308b2f3d0d net: stmmac: stm32: convert to suspend()/resume() methods
> > 
> > Did the conversion, and it always called stm32_dwmac_clk_disable() and
> > where it exists, dwmac->ops->suspend() on suspend, provided
> > stmmac_suspend() returns zero (which it will do, even if the interface
> > is down. On resume, it always calls dwmac->ops->resume() and
> > stm32_dwmac_init() before calling stmmac_resume().
> > 
> > The conversion added hooks into ny new ->suspend() and ->resume()
> > methods to handle the stm32_dwmac_clk_disable(), dwmac->ops->suspend(),
> > dwmac->ops->resume() and stm32_dwmac_init() steps.
> > 
> > However, in 07bbbfe7addf I failed to realise that, in order to keep
> > things compatible with how stuff works, we need to call
> > priv->plat->suspend() even if the interface is down. This is where
> > the bug is, not in your glue driver.
> > 
> > Please try this:
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index a8a78fe7d01f..2acbb0107cd3 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -8066,7 +8066,7 @@ int stmmac_suspend(struct device *dev)
> >   	u32 chan;
> >   	if (!ndev || !netif_running(ndev))
> > -		return 0;
> > +		goto suspend_bsp;
> >   	mutex_lock(&priv->lock);
> > @@ -8106,6 +8106,7 @@ int stmmac_suspend(struct device *dev)
> >   	if (stmmac_fpe_supported(priv))
> >   		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
> > +suspend_bsp:
> >   	if (priv->plat->suspend)
> >   		return priv->plat->suspend(dev, priv->plat->bsp_priv);
> This works too, thank you.
> 
> Will you send this fix ?

Sorry, I appear to have dropped this patch on the floor, and just
tripped over it. I'm just build testing it and will send it later
today.

This problem affects every user of the platform ->suspend/resume()
stuff, so is not just a stm32 issue.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
