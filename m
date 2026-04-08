Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDfgFlYf1mklBQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:26:46 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE513B9DD3
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 11:26:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D10AEC08D19;
	Wed,  8 Apr 2026 09:26:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0FBEC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=thoDyULEy80xUszvwV4YGikQLccE3AIuTyWYUwIhVXg=; b=W0wsZ9dB0ETevNMVK+H1yRd9hH
 0aInVnNI8+yuUzJaT7Vb8dekviS61nnKO2XOY2XL+f3bVvaKlw6lADcP+rK0b3pTDpEG+20EVTLZv
 ymF20IB4S3hIcVu7rL4GG8U/bAgIeqrpri3ISbzRCj2DQhsAn3c2nPO4VET++vxctzFxVfbyNvXpo
 ZSacx8uHAk7dAsHeAZ0WAvWKVcp08uNvTKYkZ+uWoJcbhjVdt+aAgVXyrfeTEokif0l3B8PeFvTvy
 E74o+PiL/MaoNof6/VE6HTKqOjetxSUhmPlndM2K+jaL4l7OU+tcZdyT+UHVYIJclsJcwzm3b0l2I
 p5/6iM9A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47356)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wAPB4-0000000022Z-27Wj;
 Wed, 08 Apr 2026 10:26:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wAPAy-000000003Df-2tfK; Wed, 08 Apr 2026 10:26:20 +0100
Date: Wed, 8 Apr 2026 10:26:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 00/10] net: stmmac: clean up /
 fix synopsys IP version checks
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:jitendra.vegiraju@broadcom.com,m:kuba@kernel.org,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	NEURAL_SPAM(0.00)[0.390];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 3EE513B9DD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Oh lookie, another relatively large stmmac patch series as a result of
reviewing Jitendra Vegiraju's patch series! Yay! :(

This series cleans up and in some cases fixes the Synopsys IP version
checks, which is a per-core numberspace.

For example, for dwmac1000 and dwmac4, we have versions such as v3.4 to
up v5.2, which are represented by two BCD digits. For XGMAC, we have
versions  v2.1 and v2.2 represented by 0x21 and 0x22 respectively. For
XLGMAC, we have v2.0, which is 0x20.

Note that hwif.c supports GMAC4 core type with the IP version in the
range 0..0x40, which overlaps with the GMAC core type.

Thus, testing the Synopsys IP version for <= v4.0 will match dwmac1000,
potentially some dwmac4, and all xgmac and xlgmac cores. In some cases,
the latter two are provably incorrect.

The Synopsys IP version is named "synopsys_id" in the driver - as
stated, it is the Synopsys IP version, and the register field is called
snpsver. Use this name throughout the driver to avoid confusion. Also,
dev_id seems to actually be userver.

The first decision making change is for dche, which is only looked at
by the dwmac4 DMA code which requires core_type == DWMAC_CORE_GMAC4.
Thus, it makes no sense to merely look at the IP version. Since setting
this to true makes no sense for non-GMAC4 cores, force it to false for
non-DWMAC_CORE_GMAC4 cores.

The MAC .debug() method is only populated by the dwmac1000 and dwmac4
cores, yet the test checks only for the IP version >= v3.5. While this
works today, it may not work in the future given the different version
numberspaces. Make this conditional on DWMAC_CORE_GMAC or GMAC4 core
types to limit the version check. Ideally, it would be better to
move the version check inside the .dwbug() method implementation, but
that would require the method signature to change.

As getting to that point involved quite a bit of research, add comments
into stmmac_get_ethtool_stats() so others don't have to re-analyse the
code.

Clean up the resulting code in stmmac_get_ethtool_stats() given the
complexity, adding documentation for each test.

Address the rx_coe handling, which checks for IP version >= v4.0 or
the XGMAC core type. However, the members being printed are only
present in the GMAC4 and XGMAC core type in one path, and GMAC in
the other. There is an odd-ball which is sun8i, but we preserve its
current behaviour. Also, given the research, add documentation in
appropriate places. Note that priv->plat->rx_coe (and also
priv->hw->rx_csum) has different value spaces depending on the core
type - which is not nice.

Lastly, make the printing of the COE type, which as identified above,
depend on the GMAC core type.

This leaves four locations unaddressed:

1) PTP filter code:
                case HWTSTAMP_FILTER_PTP_V2_EVENT:
                        /* PTP v2/802.AS1 any layer, any kind of event packet */
                        config->rx_filter = HWTSTAMP_FILTER_PTP_V2_EVENT;
                        ptp_v2 = PTP_TCR_TSVER2ENA;
                        snap_type_sel = PTP_TCR_SNAPTYPSEL_1;
                        if (priv->snpsver < DWMAC_CORE_4_10)
                                ts_event_en = PTP_TCR_TSEVNTENA;

I don't yet have an answer for this one, but it does mean that
PTP_TCR_TSEVNTENA will be set for XGMAC cores for
HWTSTAMP_FILTER_PTP_V2_EVENT... if they have PTP support.

2) riwt watchdog:
        /* Rx Watchdog is available in the COREs newer than the 3.40.
         * In some case, for example on bugged HW this feature
         * has to be disable and this can be done by passing the
         * riwt_off field from the platform.
         */
        if ((priv->snpsver >= DWMAC_CORE_3_50 ||
             priv->plat->core_type == DWMAC_CORE_XGMAC) &&
            !priv->plat->riwt_off) {
                priv->use_riwt = 1;

This to me looks like the version check is only really applicable for
the DWMAC_CORE_GMAC core type. So, I'm thinking that:

	if (priv->plat->core_type >= DWMAC_CORE_GMAC4 ||
	    (priv->plat->core_type == DWMAC_CORE_GMAC &&
	     priv->snpsver >= DWMAC_CORE_3_50)) {
		if (!priv->plat->rwit_off) {
		...

would be clearer (note the splitting of the if() conditions which seems
to me would be more readable than trying to munge it all into one
expression.)

3) max_mtu setup:
        /* Set the maximum MTU.
         *  For XGMAC cores, 16KiB.
         *  For cores using enhanced descriptors or GMAC cores >= v4.00, 9kB.
         *  For everything else, PAGE_SIZE - NET_SKB_PAD - NET_IP_ALIGN -
         *   aligned skb_shared_info.
         */
        if (priv->plat->core_type == DWMAC_CORE_XGMAC)
                ndev->max_mtu = XGMAC_JUMBO_LEN;
        else if (priv->plat->enh_desc || priv->snpsver >= DWMAC_CORE_4_00)
                ndev->max_mtu = JUMBO_LEN;
        else
                ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);

which I've previously identified is very buggy, and I'm not sure what
the real tests here should be. I'm quite certain that the max_mtu
values are basically completely wrong, especially in the last case.
This needs a lot of analysis and comparing with documentation to get
to the bottom of what the tests and resulting max_mtu values should
actually be.

 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c         | 54 +++++++++++-----------
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 51 +++++++++++---------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 24 ++++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  |  8 ++--
 include/linux/stmmac.h                             |  7 +++
 9 files changed, 85 insertions(+), 67 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
