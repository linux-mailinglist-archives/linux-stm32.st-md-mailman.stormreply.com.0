Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E28E6CFF8E
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Mar 2023 11:15:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0955C6A5EF;
	Thu, 30 Mar 2023 09:15:07 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 921F7C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Mar 2023 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680167706; x=1711703706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EQDSnthQ5cFmTJaAo9m1vejrcveOKhLU44+A2MCijjk=;
 b=IU+xXSPO8jFKukukEWvc05+KmhcAFyhSR4GlFgqA4/2NGPvtS5CJbVDb
 fbu0pEimQsyppcoK1F+r82Rh3uktQ3xIlMF1lE2teC6RkeK8i0vWVcl3a
 5lQfX3KCHCvoa27JY2FBOuRP+xxXaNHnW1GcTxf3D8AfK+lTl53LnJIwM
 b1i1k8wMquFwWWjiZTD5XmqeTTsZuFOPKd3H82YeV1hIw8sL+Rsw4gPOM
 PAtnTT26okLSdRyVmEj1L16n7WZ/bV0NDFuomnBvq6/FAuhSgzPbFVjjQ
 8zUyuEXenOdbBHxhzFEXsHAwHNiKmH54bcqZE8xFi7sz/XKLeOUL8jDQM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="325038869"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="325038869"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 02:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="678125408"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; d="scan'208";a="678125408"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 02:14:52 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, hkallweit1@gmail.com, andrew@lunn.ch
Date: Thu, 30 Mar 2023 17:14:02 +0800
Message-Id: <20230330091404.3293431-2-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230330091404.3293431-1-michael.wei.hong.sit@intel.com>
References: <20230330091404.3293431-1-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH net v5 1/3] net: phylink: add
	phylink_expects_phy() method
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

Provide phylink_expects_phy() to allow MAC drivers to check if it
is expecting a PHY to attach to. Since fixed-linked setups do not
need to attach to a PHY.

Provides a boolean value as to if the MAC should expect a PHY.
Returns true if a PHY is expected.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
---
 drivers/net/phy/phylink.c | 19 +++++++++++++++++++
 include/linux/phylink.h   |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1a2f074685fa..30c166b33468 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1586,6 +1586,25 @@ void phylink_destroy(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
 
+/**
+ * phylink_expects_phy() - Determine if phylink expects a phy to be attached
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * When using fixed-link mode, or in-band mode with 1000base-X or 2500base-X,
+ * no PHY is needed.
+ *
+ * Returns true if phylink will be expecting a PHY.
+ */
+bool phylink_expects_phy(struct phylink *pl)
+{
+	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
+	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
+	     phy_interface_mode_is_8023z(pl->link_config.interface)))
+		return false;
+	return true;
+}
+EXPORT_SYMBOL_GPL(phylink_expects_phy);
+
 static void phylink_phy_change(struct phy_device *phydev, bool up)
 {
 	struct phylink *pl = phydev->phylink;
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index c492c26202b5..637698ed5cb6 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -574,6 +574,7 @@ struct phylink *phylink_create(struct phylink_config *, struct fwnode_handle *,
 			       phy_interface_t iface,
 			       const struct phylink_mac_ops *mac_ops);
 void phylink_destroy(struct phylink *);
+bool phylink_expects_phy(struct phylink *pl);
 
 int phylink_connect_phy(struct phylink *, struct phy_device *);
 int phylink_of_phy_connect(struct phylink *, struct device_node *, u32 flags);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
