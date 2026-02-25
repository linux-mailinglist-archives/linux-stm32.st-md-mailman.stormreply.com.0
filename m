Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI64G4rOnmnwXQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 11:27:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BD6195C10
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 11:27:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81B68C8F281;
	Wed, 25 Feb 2026 10:27:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6874ACFAC40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MS2C1+DWOJkYiCXagfDbmCgTOM+diuI355eHVdbYXXk=; b=iMEGM5uApadFg7FMmgibdnXkbS
 7nJCsVc9yb4juYDjZ4yXPpqgJ1LlwQX8GHxOGAsUlG4ePOuPiuOpCatUKUrkzLZB0G0iD2Pq0r9Hj
 +jkPIJ7csHDEyBf2lP/uRMWwdRByUR55j2Lutq17Mu/RSJcNtAeVFmKo9bFbntgPM6nFTCsTJ4BLC
 ycFJFy6/OKIRL8SzRs9fKcuuuvj0GUqpNAkClu+uoJMIg6Hb4QnIsZxr2aixCtQxnixvy9il8Hv+w
 Flu/sVF+roC9WMXGjzZV0LkXGTOmY3FxjJXv8ZkUWrOIAnH2DMBJsn//vRoq0OVJRVP8U9jJOYDgD
 ZEtwKC9g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41072)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vvC6q-000000006Qz-33W0;
 Wed, 25 Feb 2026 10:27:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vvC6n-000000000rp-2lXH; Wed, 25 Feb 2026 10:27:09 +0000
Date: Wed, 25 Feb 2026 10:27:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <aZ7Ofd7O0xUDh7YG@shell.armlinux.org.uk>
References: <E1vuU3X-0000000Ae9G-1Er8@rmk-PC.armlinux.org.uk>
 <20260224173037.7871e5ac@kernel.org>
 <aZ6xqig4zh_Un8R7@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZ6xqig4zh_Un8R7@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix
	.ndo_fix_features()
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
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.852];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 13BD6195C10
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 08:24:10AM +0000, Russell King (Oracle) wrote:
> On Tue, Feb 24, 2026 at 05:30:37PM -0800, Jakub Kicinski wrote:
> > On Mon, 23 Feb 2026 11:24:51 +0000 Russell King (Oracle) wrote:
> > > netdev features documentation requires that .ndo_fix_features() is
> > > stateless: it shouldn't modify driver state. Yet, stmmac_fix_features()
> > > does exactly that, changing whether GSO frames are processed by the
> > > driver.
> > > 
> > > Move this code to stmmac_set_features() instead, which is the correct
> > > place for it. We don't need to check whether TSO is supported; this
> > > is already handled via the setup of netdev->hw_features, and we are
> > > guaranteed that if netdev->hw_features indicates that a feature is
> > > not supported, .ndo_set_features() won't be called with it set.
> > 
> > No lies detected, but is this enough? The whole TSO enablement 
> > looks quite wobbly (as you mentioned in another email IIRC). 
> > 
> > Only stmmac_hw_setup() actually calls stmmac_enable_tso(). 
> > And stmmac_set_features() does not call stmmac_hw_setup().
> 
> Looking deeper, dwmac4_enable_tso() has two paths depending on the "en"
> flag, both of which are commented as "enable TSO".
> 
> Then, looking at the "Enable TSO" block of code in stmmac_hw_setup(),
> it looks to me like we can end up with some queues that have TSO
> enabled, and others which don't (because TBS has been enabled on the
> queue.) As far as I'm aware, the network layer doesn't support
> per-queue TSO.
> 
> We can't call stmmac_hw_setup() from any path that we care about any
> state being preserved - it issues a software reset which causes
> everything, including the PTP clock, to be reset and all state then
> needs to be reloaded.
> 
> Lastly, we don't need to disable the TSE bit (via stmmac_enable_tso()
> when we disable TSO, because there's a bit in the descriptors that
> also needs to be set for the packet to undergo TSO. However, if the
> system undergoes a suspend/resume with TSO disabled by the user, we'll
> call stmmac_hw_setup(), which as I note in the previous paragraph will
> reset all state, including the TSE bit. stmmac_enable_tso() won't be
> called, and thus the TSE bit will remain clear. If the user
> subsequently re-enables TSO, then we'll queue packets for TSO but
> the hardware won't have that enabled...
> 
> That's a problem today. So, while you're right to point this out (I
> had missed it) it's a separate problem to the one being addressed
> in this patch. In fact, I think there's two new issues that have now
> been identified here.
> 
> 1. The lack of setting TSE on resume if TSO is supported but but has
>    been disabled by the user.
> 2. The interaction of TBS and TSO feature where some channels can
>    support TSO and others not, which I don't think can be supported.
>    So, I think if we have _any_ channel with TBS enabled, we have to
>    disable TSO on the entire netdev.

With the assumption that TBS + TSO is not supported, then the following
drivers have a problem:

dwmac-intel.c: intel_mgbe_common_data() sets TBS for tx queues other
 than the first, but also sets STMMAC_FLAG_TSO_EN.

dwmac-qcom-ethqos.c: same as dwmac-intel for TBS, but TSO depends on a
 DT property.

dwmac-socfpga.c: always sets STMMAC_FLAG_TSO_EN, but configures queues
 6 and 7 for TBS.

stmmac_pci.c: snps_gmac5_default_data() sets STMMAC_FLAG_TSO_EN and
 enables TBS for tx queues other than the first.

In each of these cases, we end up with some transmit queues that can
support TSO, and others that can't (because TBS is enabled.)

What a nice can of worms...

The options as I see it are:
1. scan the transmit queue configuration, if any have TBS enabled,
   disable TSO support for the entire interface.

or

2. rip out TSO support, making the code simpler, and thereby removing
   the need to try and fix the problems here, and making this patch
   unnecessary.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
