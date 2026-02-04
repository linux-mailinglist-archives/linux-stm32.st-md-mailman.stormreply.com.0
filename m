Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKsqNp7Hg2k/uQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 23:26:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36BECFAE
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 23:26:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF4FDC87ECD;
	Wed,  4 Feb 2026 22:26:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 367F2C87EC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 22:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YBb76XbTs10K5UGRcrXyjymL5gOXGKQMYpuyBZHPFXk=; b=jOu0LD/BkldhAJq+u9wKjguWef
 ZFm0IBCkNyDdOBVt1B85H0vb/6JVrJokFjjKGrVtPS/tf0atzMvL338oM4gQxhlDjOYN4k5YSa9it
 qxkGwKlGFdcYmCQob7xbVtFvLgf+peJ7cXRsXHKfNckjQJ4PJcyCFhfeiHsaM9HXVPdWMXwLEoldk
 E7wl/EHPCIf274H7XC+Iz6Po0crHg96G/2YPm0m8wIsEfidXx2p/ewWAFyEKxZmbmzySZ/fizE2eC
 /7jxc8HtUx2VLYG0C/wBm8mJKrGoNVUl1mcZDBVYXwGFtNrrmdqzGAkR2pFUxEJEpaUVoee6VHk2J
 ZlsAPnUA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56420)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vnlKN-000000006kE-07W2;
 Wed, 04 Feb 2026 22:26:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vnlKI-000000005kv-0AB7; Wed, 04 Feb 2026 22:26:22 +0000
Date: Wed, 4 Feb 2026 22:26:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Message-ID: <aYPHjS0wrtXlRb1a@shell.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <E1vnYy6-00000007hp9-1AJM@rmk-PC.armlinux.org.uk>
 <20297648.sWSEgdgrri@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20297648.sWSEgdgrri@diego>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 5/6] net: stmmac: rk: use
 rk_encode_wm16() for clock selection
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:andrew@lunn.ch,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,sntech.de:email,armlinux.org.uk:url,armlinux.org.uk:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 7A36BECFAE
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 11:03:51PM +0100, Heiko St=FCbner wrote:
> Am Mittwoch, 4. Februar 2026, 10:14:38 Mitteleurop=E4ische Normalzeit sch=
rieb Russell King (Oracle):
> > Use rk_encode_wm16() for RMII clock gating control, and also for the
> > io_clksel bit used to select the transmit clock between CRU-derived
> > and IO-derived clock sources.
> > =

> > Both of these were configured via the "set_clock_selection" method in
> > the SoC specific operations, but there is no requirement to change the
> > io_clksel except when enabling clocks.
> > =

> > It is also possible that we don't need to ungate the RMII clock if we
> > are operating in RGMII mode, but this commit makes no change there.
> > =

> > Split up the configuration of these as separate functions, and remove
> > the set_clock_selection() method. Since these clocking bits are in the
> > same register that we call the "speed" register, move the logic for
> > writing that register into rk_write_speed_grf_reg().
> > =

> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 174 ++++++++----------
> >  1 file changed, 75 insertions(+), 99 deletions(-)
> > =

> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac-rk.c
> > index 4099cbc5d0de..ed9adac70f0a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > @@ -27,8 +27,17 @@
> >  struct rk_priv_data;
> >  =

> >  struct rk_clock_fields {
> > +	/* io_clksel_cru_mask - io_clksel bit in clock GRF register which,
> > +	 * when set, selects the tx clock from CRU.
> > +	 */
> > +	u16 io_clksel_cru_mask;
> > +	/* io_clksel_io_mask - io_clksel bit in clock GRF register which,
> > +	 * when set, selects the tx clock from IO.
> > +	 */
> =

> nit: comment stile does not seem to follow the kernel coding style
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst#n622

netdev has historically had this style which is separate from the rest
of the kernel. The file already uses this comment style, so it is
entirely correct to keep to the style which already exists in this
file, rather than mixing styles and turning it into a mess.

> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de> #px30,rk3328,rk3568,rk3588

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
