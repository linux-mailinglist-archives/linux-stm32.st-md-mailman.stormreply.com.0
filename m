Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 718D89C4F5E
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 08:25:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E410C78F79;
	Tue, 12 Nov 2024 07:25:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 112BFC78F76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731396327; x=1762932327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=56zf3pdeCoar/wx2RuHyLAS0nUbRU/jxT75R9EzS8qE=;
 b=CW3A1a924Yfs2P3HX8GrqYpikaoH/ngKgIdFzCbvIlJp8ilAhz/ZJmrW
 yPRfp0/42Q+QYII3wUNr0/dUmUzdTkeP1FyhT9vABdSLPqjJuPuxl+7Rv
 OJC/sNQSZ/Hc3evASPT43p6AKcfr6EwzyZm3RqH/0NLcCjIoWnRQaFJU5
 dD3mr1wcnY6kOViW9wmj0yxZK15/5rttwnKhWK1REj19BRfYeem/iuxkt
 P2qooST9b7XkUJRqdsvAZPLJw9llKWcY/henJG6P83h6tuzCU8uMaj2Pn
 NnfVkWfOOOgqeB0UeWorl0h8VbLCwrJtSkOfXNo4CEvTrV42T+cY6JdHa A==;
X-CSE-ConnectionGUID: NVZi5kbVQ8Cm59wgWOG+6Q==
X-CSE-MsgGUID: 42UHlGvMQFCAl/YBLI4dhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31387800"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31387800"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 23:25:23 -0800
X-CSE-ConnectionGUID: 91fhFG1uRTKNRrYsEhwh5Q==
X-CSE-MsgGUID: ig6CV1xeS4qYl8WbXmtpAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="87074232"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com)
 ([10.88.229.33])
 by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2024 23:25:20 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 12 Nov 2024 15:24:46 +0800
Message-Id: <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net v1 1/2] net: phy: Introduce
	phy_update_eee() to update eee_cfg values
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

The commit fe0d4fd9285e ("net: phy: Keep track of EEE configuration")
introduced eee_cfg, which is used to check the existing settings against
the requested changes. When the 'ethtool --show-eee' command is issued,
it reads the values from eee_cfg. However, the 'show-eee' command does
not show the correct result after system boot-up, link up, and link down.

For system boot-up, the commit 49168d1980e2
("net: phy: Add phy_support_eee() indicating MAC support EEE") introduced
phy_support_eee to set eee_cfg as the default value. However, the values
set were not always correct, as after autonegotiation or speed changes,
the selected speed might not be supported by EEE.

phy_update_eee() was introduced to update the correct values for eee_cfg
during link up and down, ensuring that 'ethtool --show-eee' shows
the correct status.

Fixes: fe0d4fd9285e ("net: phy: Keep track of EEE configuration")
Cc: <stable@vger.kernel.org>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/phy_device.c | 24 ++++++++++++++++++++++++
 include/linux/phy.h          |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 499797646580..94dadf011ca6 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3016,6 +3016,30 @@ void phy_support_eee(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_support_eee);
 
+/**
+ * phy_update_eee - Update the Energy Efficient Ethernet (EEE) settings
+ * @phydev: target phy_device struct
+ * @tx_lpi_enabled: boolean indicating if Low Power Idle (LPI) for
+ * transmission is enabled.
+ * @eee_enabled: boolean indicating if Energy Efficient Ethernet (EEE) is
+ * enabled.
+ * @tx_lpi_timer: the Low Power Idle (LPI) timer value (in microseconds) for
+ * transmission.
+ *
+ * Description:
+ * This function updates the Energy Efficient Ethernet (EEE) settings for the
+ * specified PHY device. It is typically called during link up and down events
+ * to configure the EEE parameters according to the current link state.
+ */
+void phy_update_eee(struct phy_device *phydev, bool tx_lpi_enabled,
+		    bool eee_enabled, u32 tx_lpi_timer)
+{
+	phydev->eee_cfg.tx_lpi_enabled = tx_lpi_enabled;
+	phydev->eee_cfg.eee_enabled = eee_enabled;
+	phydev->eee_cfg.tx_lpi_timer = tx_lpi_timer;
+}
+EXPORT_SYMBOL(phy_update_eee);
+
 /**
  * phy_support_sym_pause - Enable support of symmetrical pause
  * @phydev: target phy_device struct
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a98bc91a0cde..6c300ba47a2d 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2004,6 +2004,8 @@ void phy_advertise_eee_all(struct phy_device *phydev);
 void phy_support_sym_pause(struct phy_device *phydev);
 void phy_support_asym_pause(struct phy_device *phydev);
 void phy_support_eee(struct phy_device *phydev);
+void phy_update_eee(struct phy_device *phydev, bool tx_lpi_enabled,
+		    bool eee_enabled, u32 tx_lpi_timer);
 void phy_set_sym_pause(struct phy_device *phydev, bool rx, bool tx,
 		       bool autoneg);
 void phy_set_asym_pause(struct phy_device *phydev, bool rx, bool tx);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
