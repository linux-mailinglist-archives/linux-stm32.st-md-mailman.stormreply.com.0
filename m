Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HELCRLk4GlhnAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 15:28:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 432C340ED23
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 15:28:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E39BEC8F264;
	Thu, 16 Apr 2026 13:28:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB473C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2026 10:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776336538; x=1807872538;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wXkfIYpS6b/Rm6RISVw0uD+Z7OPzR8Gm6AByQPr0xkc=;
 b=g4MWWEAN3tWJyCKNJVnra8Ll8fNrWtGAF8DkhBNFqyRgAHwNK1pc4dla
 XvvdyD7qhPN0SjEpTrSzbo3T9R/Gt2kT977ItGuuJtc78yhggO6mBE7Tf
 7QmE8zmEjdSCoArQhVdUWTC36cUqErbUckjmzPgLPFaXQ0ZA7jnvOK8VB
 h9XwQCcw3LiCE2iVxX94pTdfiFdCdi0kw/RAviU+d/lQt6GBV63VrbGgr
 phhZslTGB0djsVvJXxuW5k3vfhWxb4BVjAf1EKJG0WtxD/qAM/plqz2Fl
 88gk8CjPmuhCLIrJ9TnLYPhLqhhf7bnGhw/Lu0lcDPFG3Ztv/CTXl0P5J A==;
X-CSE-ConnectionGUID: jp8hc4QhSPeL6rowOFhn3A==
X-CSE-MsgGUID: lV7uzotkTZuKbaUHiP7S9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88410755"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88410755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 03:48:56 -0700
X-CSE-ConnectionGUID: EuPlTi58RSGNxq0lcRmGWQ==
X-CSE-MsgGUID: imgnVKh1QGqItlImdg15EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235076890"
Received: from unknown (HELO localhost.png.intel.com) ([10.107.255.31])
 by orviesa004.jf.intel.com with ESMTP; 16 Apr 2026 03:48:52 -0700
From: KhaiWenTan <khai.wen.tan@intel.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com
Date: Thu, 16 Apr 2026 18:26:09 +0800
Message-ID: <20260416102609.7953-1-khai.wen.tan@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Apr 2026 13:28:48 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 hong.aun.looi@intel.com, KhaiWenTan <khai.wen.tan@linux.intel.com>,
 yoong.siang.song@intel.com, khai.wen.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net,
	v3 1/1] net: stmmac: Update default_an_inband before passing value
	to phylink_config
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hong.aun.looi@intel.com,m:khai.wen.tan@linux.intel.com,m:yoong.siang.song@intel.com,m:khai.wen.tan@intel.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[khai.wen.tan@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[khai.wen.tan@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.607];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,stormreply.com:url,stormreply.com:email,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 432C340ED23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: KhaiWenTan <khai.wen.tan@linux.intel.com>

get_interfaces() will update both the plat->phy_interfaces and
mdio_bus_data->default_an_inband based on reading a SERDES register. As
get_interfaces() will be called after default_an_inband had already been
read, dwmac-intel regressed as a result with incorrect default_an_inband
value in phylink_config.

Therefore, we moved the priv->plat->get_interfaces() to be executed first
before assigning priv->plat->default_an_inband to config->default_an_inband
to ensure default_an_inband is in correct value.

Fixes: d3836052fe09 ("net: stmmac: intel: convert speed_mode_2500() to get_interfaces()")
Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v3:
  - rebase on the latest net tree (Paolo Abeni)

v2: https://patchwork.kernel.org/project/netdevbpf/patch/20260413020339.68426-1-khai.wen.tan@linux.intel.com/
  - update commit message for better understanding (Russell King)
  - corrected the blamed commit (Russell King)

v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260410020735.327590-1-khai.wen.tan@linux.intel.com/
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 01a983001ab4..ca68248dbc78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1410,8 +1410,6 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 	priv->tx_lpi_clk_stop = priv->plat->flags &
 				STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
 
-	config->default_an_inband = priv->plat->default_an_inband;
-
 	/* Get the PHY interface modes (at the PHY end of the link) that
 	 * are supported by the platform.
 	 */
@@ -1419,6 +1417,8 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 		priv->plat->get_interfaces(priv, priv->plat->bsp_priv,
 					   config->supported_interfaces);
 
+	config->default_an_inband = priv->plat->default_an_inband;
+
 	/* Set the platform/firmware specified interface mode if the
 	 * supported interfaces have not already been provided using
 	 * phy_interface as a last resort.
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
