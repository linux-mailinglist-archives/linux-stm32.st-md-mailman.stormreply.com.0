Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E88729E8417
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Dec 2024 08:02:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93DABC78011;
	Sun,  8 Dec 2024 07:02:24 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAA51C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Dec 2024 07:02:16 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-215810fff52so36906445ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Dec 2024 23:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733641335; x=1734246135;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KXUKUf+0SF76THFk57e33zgLbiORDIy5CN/un9OCYYM=;
 b=kVS7UmvwcH4/QJB13Pol9t5S/b3A4XjgBrGBOWja6DbDh0fkMgTK4Kn5Vic4Bga5/K
 MgQkLp56SmSU0esCQ7Y3cuwBk2QtrHjmmbYILBbimJEhPHTPglR+7MvEB8Avq6SszXj7
 UQYJ+/XB9cCdDyEv7YUNmy6FO4HQ0OMk+jmfFSSDOdx69Xu26BM5/7ilNVnAudjxgzIT
 XrwqZfg2+rryHx7iGtMraktKWnuFoHqUDBaYJvk7vSbD62K5FHA7I7gnG8BakzWsUSOp
 NBgz/2RLpLWhHOaG2kjtrpc0kZfFfCjqQeRfX/Y2RnY1bzy6ZQU3Q1F4iT/KtcDxcWwG
 TSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733641335; x=1734246135;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KXUKUf+0SF76THFk57e33zgLbiORDIy5CN/un9OCYYM=;
 b=S1pMR0bEYDQj+O7Gx2JRzjAJi97ybaobR6sjtTdFTfsRhkOEFVXPf59weBlUUyvXSE
 5JwhrbzNPDgNavu61XGpB0cA5FujFIDy75w7Lgxi8oqDQ5ib7bLF5PAdBSDK6lwekkEb
 PQ0ehb+ZU8i4D/HMg7253F+DlzojomQ51Msoz4oOokjZJ8ZsJf6U2XBGd5nQcckWuhNE
 KsdY+CAED9ygmizgSz4hBpQWXos04J6JYnytdCZV3HfJrlOHbDELS8sNut/B0DSkDhhI
 bEBL0lo+5/Ac736gEY16NQ6LujDcjNCD9ZnCsmnIt3O6ecgMNhGzZuozhf0RtivYUbDF
 9tyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKcP+b5ICEafWGZxvDkDk+lzFvv7P0Qy9mDPFz+PTzDF+06fnpmEqFlTpSo7VJm0dFR+ytfywzpy4aJQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSTBoEhA0bmXl9M/lZRvLPw23cwZNSAL/W7a4zglgQYk/i2JIK
 gNyTrMXjTB2a96c6aGQ+enAGCoDrdzpDEkoIF0g14RFTU5gCzAcJ
X-Gm-Gg: ASbGnctdSiGsqTrAUE4p+bECBdKIXCwhZ1UDaTmS6vDKr+Mah73cviJR6YnZTsO2J3m
 +5lMfgOy3RXY9gCWxeH58co6wSukCCOjBY+wf5d6jHoCRcuO6Api5TsLtsLAnPD5uZX8QHFHvhX
 uuViNRGYw1TzBSFmFtA9ozJUtTYt0cLkVPvutZ6XuiAs3r1z3GZnMS8WwteyG979V/LEpXdsckT
 ZFBzsqHk6OBoSeT+pBh02WDhccP2AQXx6EjcatZO6hSGf0y2iDUX54uIESISEI=
X-Google-Smtp-Source: AGHT+IEEcAin+aWPC3AV5wr/aZQOsP3NZQnwUgmYE78w2zS/hoJm9C12M0otPQyTvLsXpbG5GY7beQ==
X-Received: by 2002:a17:903:41cc:b0:215:a18c:88fa with SMTP id
 d9443c01a7336-21614da3f4dmr143381415ad.38.1733641335193; 
 Sat, 07 Dec 2024 23:02:15 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-215f8f08f8bsm52521675ad.179.2024.12.07.23.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 23:02:14 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun,  8 Dec 2024 15:02:02 +0800
Message-Id: <20241208070202.203931-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: Relocate extern
	declarations in common.h and hwif.h
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

The extern declarations should be in a header file that corresponds to
their definition, move these extern declarations to its header file.
Some of them have nowhere to go, so move them to hwif.h since they are
referenced in hwif.c only.

dwmac100_* dwmac1000_* dwmac4_* dwmac410_* dwmac510_* stay in hwif.h,
otherwise you will be flooded with name conflicts from dwmac100.h,
dwmac1000.h and dwmac4.h if hwif.c try to #include these .h files.

Compile tested only.
No functional change intended.

Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h     | 14 --------------
 .../net/ethernet/stmicro/stmmac/dwmac4_descs.h   |  3 +++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   |  5 +++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c       |  2 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.h       | 16 +++++++++-------
 drivers/net/ethernet/stmicro/stmmac/mmc.h        |  3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h |  3 +++
 8 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 1367fa5c9b8e..fbcf07d201cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -543,18 +543,8 @@ struct dma_features {
 #define STMMAC_VLAN_INSERT	0x2
 #define STMMAC_VLAN_REPLACE	0x3
 
-extern const struct stmmac_desc_ops enh_desc_ops;
-extern const struct stmmac_desc_ops ndesc_ops;
-
 struct mac_device_info;
 
-extern const struct stmmac_hwtimestamp stmmac_ptp;
-extern const struct stmmac_hwtimestamp dwmac1000_ptp;
-extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
-
-extern const struct ptp_clock_info stmmac_ptp_clock_ops;
-extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;
-
 struct mac_link {
 	u32 caps;
 	u32 speed_mask;
@@ -641,8 +631,4 @@ void stmmac_dwmac4_set_mac(void __iomem *ioaddr, bool enable);
 
 void dwmac_dma_flush_tx_fifo(void __iomem *ioaddr);
 
-extern const struct stmmac_mode_ops ring_mode_ops;
-extern const struct stmmac_mode_ops chain_mode_ops;
-extern const struct stmmac_desc_ops dwmac4_desc_ops;
-
 #endif /* __COMMON_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
index 1ce6f43d545a..806555976496 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
@@ -144,4 +144,7 @@
 /* TDS3 use for both format (read and write back) */
 #define RDES3_OWN			BIT(31)
 
+extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
+extern const struct stmmac_desc_ops dwmac4_desc_ops;
+
 #endif /* __DWMAC4_DESCS_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index a04a79003692..20027d3c25a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -493,4 +493,9 @@
 #define XGMAC_RDES3_TSD			BIT(6)
 #define XGMAC_RDES3_TSA			BIT(4)
 
+extern const struct stmmac_ops dwxgmac210_ops;
+extern const struct stmmac_ops dwxlgmac2_ops;
+extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
+extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
+
 #endif /* __STMMAC_DWXGMAC2_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index a72d336a8350..4bd79de2e222 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -9,6 +9,8 @@
 #include "stmmac_fpe.h"
 #include "stmmac_ptp.h"
 #include "stmmac_est.h"
+#include "dwmac4_descs.h"
+#include "dwxgmac2.h"
 
 static u32 stmmac_get_id(struct stmmac_priv *priv, u32 id_reg)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 64f8ed67dcc4..e428c82b7d31 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -665,6 +665,15 @@ struct stmmac_regs_off {
 	u32 est_off;
 };
 
+extern const struct stmmac_desc_ops enh_desc_ops;
+extern const struct stmmac_desc_ops ndesc_ops;
+
+extern const struct stmmac_hwtimestamp stmmac_ptp;
+extern const struct stmmac_hwtimestamp dwmac1000_ptp;
+
+extern const struct stmmac_mode_ops ring_mode_ops;
+extern const struct stmmac_mode_ops chain_mode_ops;
+
 extern const struct stmmac_ops dwmac100_ops;
 extern const struct stmmac_dma_ops dwmac100_dma_ops;
 extern const struct stmmac_ops dwmac1000_ops;
@@ -677,13 +686,6 @@ extern const struct stmmac_ops dwmac510_ops;
 extern const struct stmmac_tc_ops dwmac4_tc_ops;
 extern const struct stmmac_tc_ops dwmac510_tc_ops;
 extern const struct stmmac_tc_ops dwxgmac_tc_ops;
-extern const struct stmmac_ops dwxgmac210_ops;
-extern const struct stmmac_ops dwxlgmac2_ops;
-extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
-extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
-extern const struct stmmac_mmc_ops dwmac_mmc_ops;
-extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
-extern const struct stmmac_est_ops dwmac510_est_ops;
 
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc.h b/drivers/net/ethernet/stmicro/stmmac/mmc.h
index 5d1ea3e07459..1cba39fb2c44 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc.h
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc.h
@@ -139,4 +139,7 @@ struct stmmac_counters {
 	unsigned int mmc_rx_fpe_fragment_cntr;
 };
 
+extern const struct stmmac_mmc_ops dwmac_mmc_ops;
+extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
+
 #endif /* __MMC_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
index 7a858c566e7e..d247fa383a6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
@@ -62,3 +62,5 @@
 #define EST_SRWO			BIT(0)
 
 #define EST_GCL_DATA			0x00000034
+
+extern const struct stmmac_est_ops dwmac510_est_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
index 4cc70480ce0f..3fe0e3a80e80 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
@@ -104,4 +104,7 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 void dwmac1000_get_ptptime(void __iomem *ptpaddr, u64 *ptp_time);
 void dwmac1000_timestamp_interrupt(struct stmmac_priv *priv);
 
+extern const struct ptp_clock_info stmmac_ptp_clock_ops;
+extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;
+
 #endif	/* __STMMAC_PTP_H__ */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
