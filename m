Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HM9KGpanGmzEgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 14:47:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDCD17739A
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 14:47:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E572CC36B3E;
	Mon, 23 Feb 2026 13:47:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ECFEC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tGF/G9VZgwv5uDw1cDEKac6MbcUJTCMmbChRNc3rhyU=; b=YKXr/1uLiFlLjtTWx/94BTDEY4
 PWsXqFPZ7hzVbsvDV7OwZxL5gRAoeagWEG42AaxNXU+5yidUIQn9+u+/bgcF6yQq1kYNDR/Cx7Ak5
 HYmm2mo41VFEAdLt4bROjOQiy5gBryfzrOjk4Zl37LTPBCIc1QdUq3GF5fdFCbFVFL49d/vDJ2D/4
 Tfh+JXbDsNAEstdP2O1B1W6Q1Zxz8Mrevd3ESMmND+XeZbUD0ktAOSdGYpvZXiij7w+UzmxmtxlTS
 Buk39hdi/nTKDPZiRXqlj279EVslGoFr2NqsJdatWYOe1FtjvB0Hl+FfT+uiRyYaDbML6lisqL/TR
 vAvBIC4g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50878)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vuWH2-0000000049Y-3Ilb;
 Mon, 23 Feb 2026 13:46:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vuWGw-000000007QI-0wgd; Mon, 23 Feb 2026 13:46:50 +0000
Date: Mon, 23 Feb 2026 13:46:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Message-ID: <aZxaSq1mrfInWClI@shell.armlinux.org.uk>
References: <20260223124102.120432-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260223124102.120432-1-ovidiu.panait.rb@renesas.com>
Cc: linux-kernel@vger.kernel.org, kim.tatt.chuah@intel.com,
 hayashi.kunihiko@socionext.com, vee.khee.wong@intel.com,
 vladimir.oltean@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 rohan.g.thomas@altera.com, andrew+netdev@lunn.ch, edumazet@google.com,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 boon.leong.ong@intel.com, kuba@kernel.org, pabeni@redhat.com,
 matthew.gerlach@altera.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/4] net: stmmac: Fix VLAN
 handling when interface is down
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ovidiu.panait.rb@renesas.com,m:linux-kernel@vger.kernel.org,m:kim.tatt.chuah@intel.com,m:hayashi.kunihiko@socionext.com,m:vee.khee.wong@intel.com,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:rohan.g.thomas@altera.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:boon.leong.ong@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:matthew.gerlach@altera.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,socionext.com,nxp.com,st-md-mailman.stormreply.com,altera.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.978];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 3BDCD17739A
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:40:58PM +0000, Ovidiu Panait wrote:
> VLAN register accesses on the MAC side require the PHY RX clock to be
> active. When the network interface is down, the PHY is suspended and
> the RX clock is unavailable, causing VLAN operations to fail with
> timeouts.
> 
> The VLAN core automatically removes VID 0 after the interface goes down
> and re-adds it when it comes back up, so these timeouts happen during
> normal interface down/up:
> 
>     # ip link set end1 down
>     renesas-gbeth 15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
>     renesas-gbeth 15c40000.ethernet end1: failed to kill vid 0081/0
> 
> Adding VLANs while the interface is down also fails:
> 
>     # ip link add link end1 name end1.10 type vlan id 10
>     renesas-gbeth 15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
>     RTNETLINK answers: Device or resource busy
> 
> Patches 3-4 address this by deferring hardware writes when the
> interface is down and reconfiguring the VLAN state on interface up.
> 
> Patches 1-2 fix some issues in the existing VLAN implementation.

First point to make is that when the netdev supports
NETIF_F_VLAN_FEATURES, receive clock stop is disabled. In stmmac:

        /* Disable EEE RX clock stop to ensure VLAN register access works
         * correctly.
         */
        if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI) &&
            !(priv->dev->features & NETIF_F_VLAN_FEATURES))
                config->eee_rx_clk_stop_enable = true;

in phylink:

        if (pl->mac_supports_eee_ops) {
                /* Explicitly configure whether the PHY is allowed to stop it's
                 * receive clock.
                 */
                ret = phy_eee_rx_clock_stop(phy,
                                            pl->config->eee_rx_clk_stop_enable);

and also in phylink's phylink_rx_clk_stop_block():

        /* Disable PHY receive clock stop if this is the first time this
         * function has been called and clock-stop was previously enabled.
         */
        if (pl->mac_rx_clk_stop_blocked++ == 0 &&
            pl->mac_supports_eee_ops && pl->phydev &&
            pl->config->eee_rx_clk_stop_enable)
                phy_eee_rx_clock_stop(pl->phydev, false);

So, given that when stmmac supports VLAN, eee_rx_clk_stop_enable will be
false, so phylink_rx_clk_stop_block() does nothing useful and receive
clock stop at the PHY will be disabled.


So a few questions:

1) when the network interface is opened or resumed, a DMA reset is
performed which resets all hardware state, including VLAN state. On
resume, we call stmmac_restore_hw_vlan_rx_fltr(), but to me it looks
like that is incomplete, and bits of the VLAN configuration don't get
restored on resume. Please can you look at this and confirm whether
this is indeed the problem.

2) If we can fully restore the VLAN configuration on resume, I suspect
the driver will be doing the same work at resume as at open time, so
this code should be shared.

Please can you look at both of these points.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
