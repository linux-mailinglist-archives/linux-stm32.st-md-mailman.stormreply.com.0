Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNx7COvmcGk+awAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 15:47:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B61EC58A70
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 15:47:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6650CC349C4;
	Wed, 21 Jan 2026 14:47:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFBC4C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iStF1+0UpaSNBxFtH2LAPTY4dVGLGH3AvGpTjjJnIHU=; b=e9bH30XyD6pkMJHTgoZwJ7SBsQ
 0CLCJyQaHxcYuc61vX87CjlwIjH755e5RfCQJ0Wfv4lNRlzSX2yX9k/kwo8QWMtpWhfVnPgANvDB9
 kl123aZe/rSEj8KpIBeh0lPIAMVOWTc19dGF+NdztKgvvnA+5BX7opil0piY56CwJO20tSmz1Xlko
 pzBMbMVUUyaGXSsIrFSc5JdeRIYiwiAV1GpaVlXdZ0VTRxn+jcebBR5roWfde62EU7wcfzvg9tR3Q
 9GmdzF0i47FizmPYPrE1/KUuNR/fwPn0E/d24rqa7i7R6bhkesWWIr0GN+RCRzFGiFUEkdThXAtTj
 trX0GOiA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36082)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1viZTt-000000007c8-10Ub;
 Wed, 21 Jan 2026 14:46:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1viZTm-0000000005o-2xDz; Wed, 21 Jan 2026 14:46:42 +0000
Date: Wed, 21 Jan 2026 14:46:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <aXDm0jVOYOZ9l6Wu@shell.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120081844.7e6aq2urhxrylywi@skbuf>
 <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
 <20260120121114.2aedgu42i2wax3yp@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120121114.2aedgu42i2wax3yp@skbuf>
Cc: neil.armstrong@linaro.org, mohd.anwar@oss.qualcomm.com, vkoul@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, andrew@lunn.ch,
 mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next,
	05/14] net: stmmac: add stmmac core serdes support
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
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:olteanv@gmail.com,m:neil.armstrong@linaro.org,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:andrew@lunn.ch,m:mcoquelin.stm32@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,lists.infradead.org,redhat.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: B61EC58A70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:11:14PM +0200, Vladimir Oltean wrote:
> On Tue, Jan 20, 2026 at 10:12:46AM +0000, Russell King (Oracle) wrote:
> > First, I'll say I'm on a very short fuse today; no dinner last night,
> > at the hospital up until 5:30am, and a fucking cold caller rang the door
> > bell at 10am this morning. Just fucking our luck.
> 
> Sorry to hear that.
> 
> > On Tue, Jan 20, 2026 at 10:18:44AM +0200, Vladimir Oltean wrote:
> > > Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
> > > after calling pcs_disable(), though?
> >
> > No. We've already called mac_prepare(), pcs_pre_config(),
> > pcs_post_config() by this time, we're past the point of being able to
> > unwind.
> 
> I'm set out to resolve a much smaller problem.
> 
> Calling it a full "unwind" is perhaps a bit much, because pcs_pre_config()
> and pcs_post_config() don't have unwinding equivalents, unlike how
> pcs_enable() has pcs_disable(). I don't see what API convention would be
> violated if phylink decided to drop a PCS whose enable() returned an error.

While pcs_pre_config() and pcs_post_config() do not have unwinding
equivalents (what would they be?) the issue here is that these could
have changed any state that isn't simply undone by calling
pcs_disable().

For example, pcs_pre_config() could have reprogrammed signal routing,
clocking, or power supplies to blocks.

This already applies to Marvell DSA pcs-639x.c, where the pre/post
config hooks change the power state of the PCS block (for errata
handling), and the only way that gets undone is via a call to
pcs_disable() which explicitly disables IRQs and power for the PCS. Its
pcs_disable() isn't a strict reversal of pcs_enable(), it does more.

We already declare the interface to be dead on pcs_post_config()
failure, but we don't do that for pcs_enable() failure.

Maybe I need to explicitly state that pcs_disable() does not directly
balance pcs_enable(), but that _and_ the effects of pcs_pre_config()
and pcs_post_config(). However, that itself will add to the problems.
What if pcs_pre_config() and pcs_post_config() succeed but not
pcs_enable()? pcs-639x needs pcs_disable() to be called, but if we
require pcs_disable() to be balanced with a successful call to
pcs_enable(), that messes up that driver, and pretty much makes it
impossible to work around the errata.

If you feel strongly about this, then the only thing I can think of
doing is to move this SerDes support out of stmmac and into phylink
(which is a point I already raised in the cover message) so that
its failure can be dealt with at the higher level, where we can
ensure that phy_power_off() is balaced with phy_power_on(). However,
that means pushing even more of the stmmac specific "we need the
clocks running to access registers XYZ or reset" weirdness into
phylink.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
