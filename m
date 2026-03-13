Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC1bNsI8tGmDjQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 17:35:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D528718F
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 17:35:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 141E9C8F29D;
	Fri, 13 Mar 2026 16:35:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FAA7C8F29C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K4UYISWV9qsLkjeT4fVqIPgPQOAh7Ipf/hHHbX4km0c=; b=vyZ719YDZ7x1Wv2Yziaf0ilgd8
 GVAoLBpJyrEPbe/ZVuu4/iCYIeN9QzHcaKjigbe1Z44LRjN4ubkTSVUtWj4wiuRIv4f0UwdTYGwdp
 H2ZBENCKH2+jP4v+/CkRpbantH82zSQVIcpIpUlM1L75V8Aawc1pKeJ5ZZQFOHZtiNkHsCRL3qwAU
 Hx3LNSUvhGGRFKO22eIQi2lDAgRqWOMbZScTQLvCiTUucBwrW2O19RQSwlS/O+CgSMwUaCx+CxiLt
 JqaTPxXl4XY3wp96Js9j8TnBGh1XV/V6H/pIhubXOZh7zkShC5wmh6k4Da0t45rXYwEtkWGT3iYrK
 vPvVrgvA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47814)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w15Td-000000001GI-369L;
 Fri, 13 Mar 2026 16:35:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w15Ta-000000008MN-2V7O; Fri, 13 Mar 2026 16:35:02 +0000
Date: Fri, 13 Mar 2026 16:35:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Message-ID: <abQ8tlRYrU5W4VaK@shell.armlinux.org.uk>
References: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
 <6f4929c3-d727-44a3-abc5-c33923dc69d7@tuxedocomputers.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f4929c3-d727-44a3-abc5-c33923dc69d7@tuxedocomputers.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Christoffer Sandberg <cs@tuxedocomputers.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix dwmac4 transmit
 performance regression
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ggo@tuxedocomputers.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:cs@tuxedocomputers.com,m:wse@tuxedocomputers.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[lunn.ch,vger.kernel.org,tuxedocomputers.com,st-md-mailman.stormreply.com,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,armlinux.org.uk:url,st-md-mailman.stormreply.com:rdns,shell.armlinux.org.uk:mid,et.al:url]
X-Rspamd-Queue-Id: 7F3D528718F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:03:16PM +0100, Georg Gottleuber wrote:
> Am 16.01.26 um 01:49 schrieb Russell King (Oracle):
> > dwmac4's transmit performance dropped by a factor of four due to an
> > incorrect assumption about which definitions are for what. This
> > highlights the need for sane register macros.
> > 
> > Commit 8409495bf6c9 ("net: stmmac: cores: remove many xxx_SHIFT
> > definitions") changed the way the txpbl value is merged into the
> > register:
> > 
> >         value = readl(ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, chan));
> > -       value = value | (txpbl << DMA_BUS_MODE_PBL_SHIFT);
> > +       value = value | FIELD_PREP(DMA_BUS_MODE_PBL, txpbl);
> > 
> > With the following in the header file:
> > 
> >  #define DMA_BUS_MODE_PBL               BIT(16)
> > -#define DMA_BUS_MODE_PBL_SHIFT         16
> > 
> > The assumption here was that DMA_BUS_MODE_PBL was the mask for
> > DMA_BUS_MODE_PBL_SHIFT, but this turns out not to be the case.
> > 
> > The field is actually six bits wide, buts 21:16, and is called
> > TXPBL.
> > 
> > What's even more confusing is, there turns out to be a PBLX8
> > single bit in the DMA_CHAN_CONTROL register (0x1100 for channel 0),
> > and DMA_BUS_MODE_PBL seems to be used for that. However, this bit
> > et.al. was listed under a comment "/* DMA SYS Bus Mode bitmap */"
> > which is for register 0x1004.
> > 
> > Fix this up by adding an appropriately named field definition under
> > the DMA_CHAN_TX_CONTROL() register address definition.
> > 
> > Move the RPBL mask definition under DMA_CHAN_RX_CONTROL(), correctly
> > renaming it as well.
> > 
> > Also move the PBL bit definition under DMA_CHAN_CONTROL(), correctly
> > renaming it.
> > 
> > This removes confusion over the PBL fields.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thank you for this patch, which significantly speeds up the transmit (by
> more than a factor of nine on our devices with Motorcomm yt6801).
> 
> Unfortunately, this patch also causes DMA errors on two of our devices;
> logs from a iperf3 test are attached.
> 
> Strangely enough, a third device with the same Motorcomm yt6801 does not
> appear to be affected by the DMA errors. However, further testing is needed.
> 
> Do you have any ideas for further tests?

I would suggest dumping the contents of these control registers prior
to commit 8409495bf6c9, and after this commit, comparing their values
to identify what has changed. I'm sorry, I don't have the bandwidth to
inspect the patches to see what may have been inadvertently changed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
