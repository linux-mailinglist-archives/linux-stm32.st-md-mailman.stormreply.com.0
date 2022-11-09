Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F93622464
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Nov 2022 08:05:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34B0EC65054;
	Wed,  9 Nov 2022 07:05:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49819C65041
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Nov 2022 02:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667962455; x=1699498455;
 h=from:to:cc:subject:date:message-id;
 bh=LcPwnMOvNXd8EfDVDs6NwQk1HFjCWGuocIdZbaknvaM=;
 b=lh5vJ6CE6whjrWrmM3PsmPZsM+ekafzG3cYujWuBbbVrt4DAwPOM7RUu
 8GNf++TyblyYXyRoCDSM9mYs7xG/UUj2HDXnwvn6dsOijcR+pRu4gx/iJ
 pbhJoqCsQSl3b1vO4xHJANxRMD+eXjuU9cWl8+JvItlhGw17eY8fI6q4B
 7Lm/QBjKE2LwQ+DV9ttPYVUSZwmf+pENFiPJaZdsdBEFSJq+6jkQ6HjFA
 mvy3BJtyP1hu6bhyoJsOPnMsz7fcOtlvHMm3Ebq6cJi4BC3j4WhjgQ/jo
 NMETdCdPPZjBophsNnoRN11CcdC4cdEs9vyptibR1ifil6l78m4Mz4tl3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="294243958"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; d="scan'208";a="294243958"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 18:54:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="669789208"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; d="scan'208";a="669789208"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 08 Nov 2022 18:54:12 -0800
Received: from noorazur1-iLBPG12.png.intel.com
 (noorazur1-iLBPG12.png.intel.com [10.88.229.87])
 by linux.intel.com (Postfix) with ESMTP id 25A0F580AE3;
 Tue,  8 Nov 2022 18:54:08 -0800 (PST)
From: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@linux.intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
Date: Wed,  9 Nov 2022 10:43:29 +0800
Message-Id: <20221109024329.15805-1-noor.azura.ahmad.tarmizi@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 09 Nov 2022 07:05:30 +0000
Cc: Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Looi Hong Aun <hong.aun.looi@intel.com>,
 Tan Tee Min <tee.min.tan@intel.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: add check for supported
	link mode before mode change
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>

Currently, change for unsupported speed and duplex are sent to the phy,
rendering the link to unknown speed (link state down). Plus, advertising
settings are also passed down directly to the phy. Additional test is
now added to compare new speed and duplex settings and advertising
against current supported settings by attached phy.
Non-supported new settings(speed/duplex and advertising) will be rejected.

Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index f453b0d09366..d40cf7908eaa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -390,6 +390,21 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
 				  const struct ethtool_link_ksettings *cmd)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	struct ethtool_link_ksettings link_ks = {};
+
+	/* Get the current link settings */
+	stmmac_ethtool_get_link_ksettings(dev, &link_ks);
+
+	/* Check if the speed and duplex are supported by phy */
+	if (!phy_lookup_setting(cmd->base.speed, cmd->base.duplex,
+				link_ks.link_modes.supported, true))
+		return -EINVAL;
+
+	/* Check if the advertising request is supported */
+	if (!bitmap_subset(cmd->link_modes.advertising,
+			   link_ks.link_modes.supported,
+			   __ETHTOOL_LINK_MODE_MASK_NBITS))
+		return -EINVAL;
 
 	if (priv->hw->pcs & STMMAC_PCS_RGMII ||
 	    priv->hw->pcs & STMMAC_PCS_SGMII) {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
