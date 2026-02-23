Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GVNAxQfnGkZ/wMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:34:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AE2173F20
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:34:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 262B6C36B3E;
	Mon, 23 Feb 2026 09:34:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDA12C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 09:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jYLQAmS2V5vH5hD2lJBwU5t9ZdEBHgF8ZElCbh4Vl38=; b=KqTMupwg9pYja1LrDQB6IHXOgf
 nMKlIz/G73+crJNsBegu4iKfDndmFaAg8ZxegYlGob+Wmq14kOgydAtMmWReeV3lPjU0m/obpOCzv
 wk5Pt4ig1LUxoIeqnyZ1Fgprt0Os7TAeYYJ484oRSDlbombqK53ahPv+tzhe79izF8HuyW5MvoCPu
 bg+UwVKp682N6FBHyDHPzOYBieoyGr/eceMPZIivAQLoMDs5G/TcPAdeyTwU9UuUwSWisKozf2N76
 vvlPGbTBdADqCY53pQ37qQ/1Ntja6rm0Pi8GSl1+uohnold+g0j7V9WGoEU+SxC7IYrYN1ra7pswA
 dU20lQgg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47704)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vuSKD-000000003lh-2rgk;
 Mon, 23 Feb 2026 09:33:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vuSK9-000000007Fx-0IGw; Mon, 23 Feb 2026 09:33:53 +0000
Date: Mon, 23 Feb 2026 09:33:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: imx@lists.linux.dev, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/10] net: stmmac: qcom-ethqos:
 cleanups and re-organise SerDes handling
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
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:imx@lists.linux.dev,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.951];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,armlinux.org.uk:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 89AE2173F20
X-Rspamd-Action: no action

Hi,

As the last series had issues with stability, I've changed the approach
in this series to concentrate on keeping much of the SerDes related
code within the qcom-ethqos driver rather than trying to move it out at
this stage. This means it should be possible to bisect these patches and
pinpoint exactly the code movement that causes any instability.

This series starts with various cleanups to qcom-ethqos (the first four
patches) before beginning to move code, passing phylink's phy interface
(which will change) to the fix_mac_speed() method, and then using that
to configure the serdes and inband setting before moving the SerDes
code.

This patch set has been tested.

Thanks.

Changes since RFC:
- add set_clk_tx_rate() conversion as that was also tested.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  11 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 135 ++++++++++++---------
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  11 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
 include/linux/stmmac.h                             |   3 +-
 8 files changed, 101 insertions(+), 71 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
