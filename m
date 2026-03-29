Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2iNeJzxuyWkxyAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Mar 2026 20:23:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C2035395C
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Mar 2026 20:23:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88EABC8F269;
	Sun, 29 Mar 2026 18:23:55 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82052C87ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Mar 2026 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qGzDB+BbAy2UxWoOKWueCLa/Ve0k5Xt432NyksbrD1U=; b=OI9CE+1jdkOigebK4UrGva7oIH
 3kb6rNiaKlWyPv2pDJn6V1iQL+x3Xtk85WTKuiPDyEx6wH4eVUKwm1tQU6SUbEkj2LpFy75BYdzXI
 ij5MXbjcz8hCG+Nkh+/BOZUT8UpGncxn5isVX7KDE8IIEyltT21JtcHm9VLbkg/JD4+wwEr+bL3fc
 0vmnLgqW07tzcvAL090WEePlhMqKqWKqBvYvGtpvt95cdj2thxGnqttJjOTydf0ENTF0IxPYP0Dts
 +49KfUhFq9JwHkJnQACDdjYh6cLKTSuBsyROp4wJcEQJ6VYOfckxw1Zp6zWc9PyDBYOhot1H7uaJH
 tX13naQg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49410)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w6unc-000000008Ak-0F8p;
 Sun, 29 Mar 2026 19:23:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w6unY-000000001vr-31Tz; Sun, 29 Mar 2026 19:23:44 +0100
Date: Sun, 29 Mar 2026 19:23:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <acluMCDdWFPSw_Zr@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
 <E1w6bKj-0000000ELtf-3md9@rmk-PC.armlinux.org.uk>
 <acjzmxY9xmBInSwm@shell.armlinux.org.uk>
 <20260329104223.358351ee@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260329104223.358351ee@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 01/10] net: stmmac: fix TSO
 support when some channels have TBS available
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
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.leong.ong@intel.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.850];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 25C2035395C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 10:42:23AM -0700, Jakub Kicinski wrote:
> On Sun, 29 Mar 2026 10:40:43 +0100 Russell King (Oracle) wrote:
> > On Sat, Mar 28, 2026 at 09:36:41PM +0000, Russell King (Oracle) wrote:
> > > According to the STM32MP25xx manual, which is dwmac v5.3, TBS (time
> > > based scheduling) is not permitted for channels which have hardware
> > > TSO enabled. Intel's commit 5e6038b88a57 ("net: stmmac: fix TSO and
> > > TBS feature enabling during driver open") concurs with this, but it
> > > is incomplete.
> > > 
> > > This commit avoids enabling TSO support on the channels which have
> > > TBS available, which, as far as the hardware is concerned, means we
> > > do not set the TSE bit in the DMA channel's transmit control register.
> > > 
> > > However, the net device's features apply to all queues(channels), which
> > > means these channels may still be handed TSO skbs to transmit, and the
> > > driver will pass them to stmmac_tso_xmit(). This will generate the
> > > descriptors for TSO, even though the channel has the TSE bit clear.
> > > 
> > > Fix this by checking whether the queue(channel) has TBS available,
> > > and if it does, fall back to software GSO support.  
> > 
> > This is sufficient for the immediate issue of fixing the patch below,
> > but I think there's another issue that also needs fixing here.
> > 
> > TSO requires the hardware to support checksum offload, and there is
> > a comment in the driver:
> > 
> >         /* DWMAC IPs can be synthesized to support tx coe only for a few tx
> >          * queues. In that case, checksum offloading for those queues that don't
> >          * support tx coe needs to fallback to software checksum calculation.
> >          *
> >          * Packets that won't trigger the COE e.g. most DSA-tagged packets will
> >          * also have to be checksummed in software.
> >          */
> > 
> > So, it seems at the very least we need to add a check (in a subsequent
> > patch) for priv->plat->tx_queues_cfg[queue].coe_unsupported to
> > stmmac_channel_tso_permitted().
> > 
> > I'm also wondering about the stmmac_has_ip_ethertype() thing, which
> > checks whether the skb can be checksummed by the hardware, and how that
> > interacts with TSO, and whether that's yet another hole that needs
> > plugging.
> 
> If the driver "un-advertises" checksum offload accordingly the core
> should automatically clear TSO feature.

Ah, yes, it's in harmonize_features().

However, I think that stmmac_has_ip_ethertype() is tighter than the
checks that harmonize_features() does.

stmmac_has_ip_ethertype():
        int depth = 0;
        __be16 proto;

        proto = __vlan_get_protocol(skb, eth_header_parse_protocol(skb),
                                    &depth);

        return (depth <= ETH_HLEN) &&
                (proto == htons(ETH_P_IP) || proto == htons(ETH_P_IPV6));

If I'm reading this correctly, then eth_header_parse_protocol(skb)
will return the contents of the ethernet header protocol field.

__vlan_get_protocol() will then return:

 - that protocol if it is not a vlan (0x8100 or 0x88A8)
   with depth set to skb->mac_len, which should be ETH_HLEN here.
 - the protocol below the vlan headers, in which case depth
   will be > ETH_HLEN

Unless I've missed something, that basically means that the 
__vlan_get_protocol() is pointless there, and the entire function
could just be checking that eth_header_parse_protocol(skb) returns
IP or IPv6.

Isn't it the case that skb->protocol should be the same as
eth_header_parse_protocol(skb) for a packet being transmitted at the
point that .ndo_features_check() or .ndo_start_xmit() is called?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
