Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD/MIvyq22mzEwkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Apr 2026 16:23:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1B03E43AA
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Apr 2026 16:23:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 710D6C8F266;
	Sun, 12 Apr 2026 14:23:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DFC6C87ED1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2026 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/bZQaaA9y+PfxKdKkmD3Tt08LTFDotVPzB4Utjfybes=; b=1uwnsKge/Xsow/UXYATYTv5+JC
 4eEi/y/HAERoQHiG6FCixsZYLHu2e5FE/sVGKVh4pfwa5iy3BrAj5hDU78KtkIL9ljgZM07lFbJj5
 OIxZ8+d52hzEcdEewFgX0MMWvarxyXDkld3wN9mJH52UTJjlbZpyPpY6LPbW0EtX+Q2xVLymxdJUk
 +FGc0wedZufgbPy0v9yirPNdM9w9b8soAgiRLxsoyGqVOpVsGc0JcQepZqG+yyYWbWGP+39qy7KDV
 hcehgKYkkmtlnEAgAL1I9QV5+GCVTW9KZqg0xJL8v2dzC70n5zQozupnsRKg86PTlb08T94nskf+9
 TI26aymQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34374)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wBviy-000000007GH-0wVq;
 Sun, 12 Apr 2026 15:23:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wBviu-000000007iS-2XGL; Sun, 12 Apr 2026 15:23:40 +0100
Date: Sun, 12 Apr 2026 15:23:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aduq7Lvkfrz971Rb@shell.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <266998d8-7e38-4bae-a4df-2f889538fe88@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <266998d8-7e38-4bae-a4df-2f889538fe88@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Sam Edwards <cfsworks@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: enable RPS and RBU
	interrupts
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:cfsworks@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,vger.kernel.org,st-md-mailman.stormreply.com,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.656];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,armlinux.org.uk:url,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 1F1B03E43AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 04:01:59PM +0200, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 10/04/2026 15:07, Russell King (Oracle) wrote:
> > Enable receive process stopped and receive buffer unavailable
> > interrupts, so that the statistic counters can be updated.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > Since we are seeing receive buffer exhaustion on several platforms,
> > let's enable the interrupts so the statistics we publish via ethtool -S
> > actually work to aid diagnosis. I've been in two minds about whether
> > to send this patch, but given the problems with stmmac at the moment,
> > I think it should be merged.
> 
> Looks like my reply to your original RFC was lost in limbo as the review/test tags are missing.

Thanks. Unfortunately, I can't run iperf3 against stmmac on the Jetson
NX because stmmac just totally screws itself (at the first RBU, the
receive side irrevocably collapses.)

Against i.MX6 (which is limited to around 480Mbps,) it's recoverable by
taking the interface down and back up a couple of times.

Against x86 (which will saturate the link) its pretty much
irrecoverable without entire system reboot - if one tries the down+up,
we then get arm-smmu errors because it seems that, despite stmmac being
reset, it still attempts to access a previous receive buffer from
before the down/up sometime after the up. Moreover, transmit stops
working - packets get queued but they are never processed by the
hardware. This is a scenario that I can only rarely test myself (as
it depends on my physical location.)

As the dwmac 5.0 core receive path seems to lock up after the first
RBU, I never see more than one of those at a time.

Right now, I consider this pretty much unsolvable - I've spent quite
some time looking at it and trying various approaches, nothing seems
to fix it. However, adding dma_rmb() in the descriptor cleanup/refill
paths does seem to improve the situation a little with the 480Mbps
case, because I think it means that we're reading the descriptors in
a more timely manner after the hardware has updated them.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
