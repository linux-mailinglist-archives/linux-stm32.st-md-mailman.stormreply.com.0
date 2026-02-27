Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLmCMnRpoWkUsgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:52:52 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BA01B5947
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:52:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0772C87EC5;
	Fri, 27 Feb 2026 09:52:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A38BC1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 09:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G4AOdtDSBTVKcUGqRwL58Pt4pHFgHiIpoKmDb5710ZY=; b=CAHh7uFXnhy7PVKqbwANdh3hnP
 HJFpuvTH9l+NloCx5hJ7jBicJQnI9RpafLAVn0lxbbX/7DkSPzi0+AxOBd6Og0EFekz+tuuvOKidC
 GCU5+FG17cCUzKT1OBx+Tc/2XzSwV4Rz/2IMQC61U65nRev47kaNE4/YdlUq4DPtJDVoGHNT+t5nZ
 CLp+A2awkOrFqDx8CBnkSaeWfHphTx1rlYemr6dqG1di185JbE/SedWEyiJsdwds185H+DCBNdW7m
 zfQ/C+wt+b4CjXBA3xDMiLPK9cpSNXwY5o7/++0/9DbTZdrh3qe7Xwzz9PhFizozbraP20EdQXEvH
 qcgWPQgQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45912)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vvuWY-000000000bc-3D2O;
 Fri, 27 Feb 2026 09:52:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vvuWV-000000002z1-0ab9; Fri, 27 Feb 2026 09:52:39 +0000
Date: Fri, 27 Feb 2026 09:52:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/14] net: stmmac: further cleanups
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url]
X-Rspamd-Queue-Id: 65BA01B5947
X-Rspamd-Action: no action

Hi,

Yet another bunch of patches cleaning up the stmmac driver.

We start off by cleaning up the formatting for stmmac_mac_finish(). Then
remove a plat_dat->port_node which is redundant, followed by several
descriptor methods that aren't called.

We then remove useless dwmac4 interrupt definitions, and realise that
v4.10 definitions are the same as v4.0, so get rid of those as well.
We also remove the write-only priv->hw->xlgmac member.

Next, we change priv->extend_desc and priv->chain_mode to be a boolean
and document what each of these are doing. Also do the same for
dma_cfg->fixed_burst and dma_cfg->mixed_burst.

Then, move the initialisation of dma_cfg->atds into stmmac_hw_init()
as this is where we have all the dependencies for this known, and
simplify its initialisation. Also comment what this is doing.

Finally, move the check that priv->plat->dma_cfg is present and the
programmable burst limit is set into the driver probe rather than
checking it each time we are just about to reset the dwmac core.
It is unnecessary to keep checking this. This makes a platform glue
driver fail early when it hasn't setup everything that's required
rather than when attempting to bring the netdev up for the first time.

 drivers/net/ethernet/stmicro/stmmac/common.h       |  1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |  4 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 19 -----------
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   |  8 -----
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   | 36 +++-----------------
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c   | 18 ----------
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c     | 18 ----------
 drivers/net/ethernet/stmicro/stmmac/hwif.c         |  9 +----
 drivers/net/ethernet/stmicro/stmmac/hwif.h         | 11 ------
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c    | 18 ----------
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  9 +++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 39 +++++++++++-----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  |  7 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  3 --
 include/linux/stmmac.h                             |  5 ++-
 16 files changed, 37 insertions(+), 170 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
