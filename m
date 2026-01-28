Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP6QGsgUemlS2QEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 14:53:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6628A252E
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 14:53:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87326C56612;
	Wed, 28 Jan 2026 13:53:11 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1137FC56603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 13:53:09 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1vl5yd-000670-RO; Wed, 28 Jan 2026 14:52:59 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1vl5yc-002vZ3-1y;
 Wed, 28 Jan 2026 14:52:57 +0100
Received: from pza by lupine with local (Exim 4.98.2)
 (envelope-from <p.zabel@pengutronix.de>) id 1vl5yb-00000000BPZ-3Yu7;
 Wed, 28 Jan 2026 14:52:57 +0100
Message-ID: <52ea6b98b27235f10008406de45cdcecc2a7b105.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Date: Wed, 28 Jan 2026 14:52:57 +0100
In-Reply-To: <aXn-7LWRk5cZjno8@shell.armlinux.org.uk>
References: <aXnrzIbZN-gaZTia@shell.armlinux.org.uk>
 <E1vl3Fv-00000006v3L-215v@rmk-PC.armlinux.org.uk>
 <c8a10b5355b750cfc83a7f746347175ab40b64d7.camel@pengutronix.de>
 <aXn-7LWRk5cZjno8@shell.armlinux.org.uk>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: rk: fix missing
 reset_control_put()
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
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[p.zabel@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email]
X-Rspamd-Queue-Id: D6628A252E
X-Rspamd-Action: no action

On Mi, 2026-01-28 at 12:19 +0000, Russell King (Oracle) wrote:
> On Wed, Jan 28, 2026 at 01:04:21PM +0100, Philipp Zabel wrote:
> > On Mi, 2026-01-28 at 10:58 +0000, Russell King (Oracle) wrote:
> > > rk_gmac_setup() delves into the PHY's DT node to retrieve its reset
> > > control using of_reset_control_get(). However, it never releases it
> > > when the driver is removed. Add reset_control_put() to rk_gmac_exit()
> > > to clean this up.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > index 5f8d2031b97c..bc69cbb5a7d4 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > @@ -1784,6 +1784,8 @@ static void rk_gmac_exit(struct device *dev, void *bsp_priv_)
> > >  
> > >  	if (priv->plat->phy_node && bsp_priv->integrated_phy)
> > >  		clk_put(bsp_priv->clk_phy);
> > > +
> > > +	reset_control_put(bsp_priv->phy_reset);
> > >  }
> > >  
> > >  static int rk_gmac_probe(struct platform_device *pdev)
> > 
> > This is fine because the driver sets plat_dat->suspend, and so
> > rk_gmac_exit() is never called via stmmac_pltfr_exit() during suspend.
> > 
> > It does look a bit sketchy to release resources in the rk_gmac_exit()
> > counterpart to rk_gmac_init(), which never requested the resources,
> > though. Maybe use devm_add_action_or_reset() to register the release of
> > the reset during remove?
> 
> Thanks, but I think a sense of proportion is required here. This
> patch is the result of introducing the ->init() method, and AI
> noticing that there was no cleanup of this resource. This was the
> simplest way to implement that cleanup.
> 
> However, your review commit also applies to bsp_priv->clk_phy which
> has the same problem - this also isn't obtained in rk_gmac_init(),
> but in rk_gmac_clk_init().
>

> Given that, and the fact that this entire series is already
> considerably big (it was 21 patches, then 22, now 23, and with this
> it's going to become 24 patches) I'm going to say that this issue
> can be addressed at a later time.

No objection,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
