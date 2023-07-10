Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B454E74D0CF
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 11:00:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C8D8C6B463;
	Mon, 10 Jul 2023 09:00:24 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2C7AC6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 09:00:23 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82de7so30731945e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979623; x=1691571623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=arDDTzx7rlx99hkVbX8UgR21nnOMmWn5Zowe4OJD140=;
 b=2iSQcnqhNfZiZIZ/3gO2EIjwl/BFEdHSROCid1fU6iH8aQLxCkkQMVY13xb3zb/Vns
 +kvNsQMGcKU2c8K/sGMchwkBRNUSXyoV3JdKBe6H1LVWusD+eXI8SOmjnuo4wpIXPbFh
 0pGn/f6M49ssgJlDnCVRvYhmtvSYEGEIE37T58u098IQOj6j0bIqZKrTPrBnYsmWw7OO
 1+ogD6HVxQ1OaouOZ3x4ZNW8764zqhxNSLS2rr/e1mGc2QkvJ37cX0U5Mia/CihNyVf9
 jdZpe8LVPbGIkdLjNTxbtDCams/nhzSprJA8m/pxEDEy3DnvUR9cAnjProXIkTK8TK+D
 lRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688979623; x=1691571623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=arDDTzx7rlx99hkVbX8UgR21nnOMmWn5Zowe4OJD140=;
 b=dNW4lcTp2nGitjq0bVT4N2ej09+adnaAqUZ7MOVPVxQ/6nJzxfK3q3XnMYArvkjh73
 eCH7VXX5V0EnBcyQXkS92eNeTbToOAXcmqN9SUKvBcVe2cjH+PR17ZO7k1y6MSgzGBWF
 +BvCtSlNgWh9YUEAvLJT1Oy68m1UyJ4Pzq0OcFIMBTYJhRgwafsFZJAacC0rtcOakPTW
 Tc2H0Obs9LRfTguOQdh0UlJByyQsAO1KVD502HKW+6Pbu5pfc8gWcEdabcYFWZhu0vKz
 w8Arbi58UzA5xZf+RQtuVQMCA5d6mfRmbRaHw75E+lwksOU51vtBT6IN2fAga9XhXN2x
 YW7A==
X-Gm-Message-State: ABy/qLaYjFLr+e/hWQqjsAi+yZ3Qp4c/8pQHHbujI9poH7WJHOkRpT5X
 sZOXcz7P+ro4w6zodI42x1HwZA==
X-Google-Smtp-Source: APBJJlFo6fjKgcdQJbxXJOik5SZgI9KLZeUeclm33D7nrQbeNuwS9n/s+U+8k1vsFtlMk7zw/qxE8Q==
X-Received: by 2002:a05:600c:d4:b0:3fb:af9a:bf30 with SMTP id
 u20-20020a05600c00d400b003fbaf9abf30mr11156882wmm.2.1688979623287; 
 Mon, 10 Jul 2023 02:00:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 02:00:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 10 Jul 2023 10:59:58 +0200
Message-Id: <20230710090001.303225-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v3 09/12] net: stmmac: replace the
	ext_snapshot_en field with a flag
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Drop the boolean field of the plat_stmmacenet_data structure in favor of a
simple bitfield flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c      | 5 ++++-
 include/linux/stmmac.h                                | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index d8bcf9452197..a3d0da4e9e91 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -326,7 +326,7 @@ static int intel_crosststamp(ktime_t *device,
 	/* Both internal crosstimestamping and external triggered event
 	 * timestamping cannot be run concurrently.
 	 */
-	if (priv->plat->ext_snapshot_en)
+	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
 		return -EBUSY;
 
 	priv->plat->int_snapshot_en = 1;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 8b50f03056b7..afd81aac6644 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -195,7 +195,7 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 	 */
 	ts_status = readl(priv->ioaddr + GMAC_TIMESTAMP_STATUS);
 
-	if (!priv->plat->ext_snapshot_en)
+	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
 		return;
 
 	num_snapshot = (ts_status & GMAC_TIMESTAMP_ATSNS_MASK) >>
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index b4388ca8d211..3d7825cb30bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -192,7 +192,10 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 		write_unlock_irqrestore(&priv->ptp_lock, flags);
 		break;
 	case PTP_CLK_REQ_EXTTS:
-		priv->plat->ext_snapshot_en = on;
+		if (on)
+			priv->plat->flags |= STMMAC_FLAG_EXT_SNAPSHOT_EN;
+		else
+			priv->plat->flags &= ~STMMAC_FLAG_EXT_SNAPSHOT_EN;
 		mutex_lock(&priv->aux_ts_lock);
 		acr_value = readl(ptpaddr + PTP_ACR);
 		acr_value &= ~PTP_ACR_MASK;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 3365b8071686..0a77e8b05d3a 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -212,6 +212,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP	BIT(5)
 #define STMMAC_FLAG_VLAN_FAIL_Q_EN		BIT(6)
 #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
+#define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -286,7 +287,6 @@ struct plat_stmmacenet_data {
 	int int_snapshot_num;
 	int ext_snapshot_num;
 	bool int_snapshot_en;
-	bool ext_snapshot_en;
 	int msi_mac_vec;
 	int msi_wol_vec;
 	int msi_lpi_vec;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
