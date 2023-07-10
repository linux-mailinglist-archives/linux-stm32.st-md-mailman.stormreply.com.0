Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8AD74D0D0
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 11:00:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8ACD2C6B463;
	Mon, 10 Jul 2023 09:00:26 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 071B0C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 09:00:25 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742bso47075825e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 02:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979624; x=1691571624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JCzrmvkrxX95lDclfxkC13FB8OPqOuOJRmb8eYD2LXk=;
 b=lzmr5H2JyLJZFSR1HX8BP7gWgcc1XuSawLvPgFsX4qK5Gqn6JS9jVHG/vDnDsGGqVF
 PVQZTidPzwIWrJoUPjxRWKGmZN+Wn/csnu/odgbtP/oYq9sAk3U8Yry1oZur8//i1Q/H
 K6d1DTHJbDwvkxTxxYYtp+6Q6zAffKPvCOOX9joq/lrd1GG0hq+vTF6eJ+0fG6v0vKua
 41OxPANg6SG5hItVLVOEH9rmn2CODLbJdeqfjkIfbylHZIh2Q0qjCec8Ci5P6jhxAKgL
 kCvsFHUq0Bm4GieP8DKKy3ub4kVYiYau3eKzXZ8gomEEqh5RJ2RbsGVFaIYtT5j8okSq
 TpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688979624; x=1691571624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JCzrmvkrxX95lDclfxkC13FB8OPqOuOJRmb8eYD2LXk=;
 b=QTJbN7wUu3AQCY1LsA0kuFAbarIeBDK/2yI459n6WN5R4HrphzlTCqU0t3INclqZJg
 446GxBEsGjgu8f359FABz2ejx0ttqVOBFHF6XXcFteNn21K0abe9n7jobKkE+0f4TlYj
 o01WidguvLX8RmOpsWsO76vwPl17chX7CAzrKoJswDcn9YV+GJmkowKFps8vF1nxSObx
 SJyZogE86oZdoLaB6JFj2GIyqahYLvwDf3MLuCTUfVrTINAJSAC0hzgT21JX9/FhLbYd
 2X3VwlHS+O/7nBqVJjcoJA1aX1YzxOMxOImNcsHfejvCNlwcxjVjfmb6L1EAmqacAOnE
 GmeA==
X-Gm-Message-State: ABy/qLY7kh6Z25P1Tt4ir1hI5yUjfYLnXegAMoRW8J6YIj6oja540J3j
 7HAcld1wAJXhFi8qOTFRroNtvg==
X-Google-Smtp-Source: APBJJlE6D/TZ+GjwSXOMj+kecMOl3xY1WK0EcS6qAygHxCOclG4KnpRd6znUpyJJke/KJpWrsx3UJA==
X-Received: by 2002:a1c:7416:0:b0:3fb:b3aa:1c88 with SMTP id
 p22-20020a1c7416000000b003fbb3aa1c88mr6693201wmc.26.1688979624591; 
 Mon, 10 Jul 2023 02:00:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 02:00:24 -0700 (PDT)
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
Date: Mon, 10 Jul 2023 10:59:59 +0200
Message-Id: <20230710090001.303225-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v3 10/12] net: stmmac: replace the
	int_snapshot_en field with a flag
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 10 +++++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c |  2 +-
 include/linux/stmmac.h                                |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index a3d0da4e9e91..0ffae785d8bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -329,7 +329,7 @@ static int intel_crosststamp(ktime_t *device,
 	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
 		return -EBUSY;
 
-	priv->plat->int_snapshot_en = 1;
+	priv->plat->flags |= STMMAC_FLAG_INT_SNAPSHOT_EN;
 
 	mutex_lock(&priv->aux_ts_lock);
 	/* Enable Internal snapshot trigger */
@@ -350,7 +350,7 @@ static int intel_crosststamp(ktime_t *device,
 		break;
 	default:
 		mutex_unlock(&priv->aux_ts_lock);
-		priv->plat->int_snapshot_en = 0;
+		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 		return -EINVAL;
 	}
 	writel(acr_value, ptpaddr + PTP_ACR);
@@ -376,7 +376,7 @@ static int intel_crosststamp(ktime_t *device,
 	if (!wait_event_interruptible_timeout(priv->tstamp_busy_wait,
 					      stmmac_cross_ts_isr(priv),
 					      HZ / 100)) {
-		priv->plat->int_snapshot_en = 0;
+		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 		return -ETIMEDOUT;
 	}
 
@@ -395,7 +395,7 @@ static int intel_crosststamp(ktime_t *device,
 	}
 
 	system->cycles *= intel_priv->crossts_adj;
-	priv->plat->int_snapshot_en = 0;
+	priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 
 	return 0;
 }
@@ -609,7 +609,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->ext_snapshot_num = AUX_SNAPSHOT0;
 
 	plat->crosststamp = intel_crosststamp;
-	plat->int_snapshot_en = 0;
+	plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 
 	/* Setup MSI vector offset specific to Intel mGbE controller */
 	plat->msi_mac_vec = 29;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index afd81aac6644..fa2c3ba7e9fe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -180,7 +180,7 @@ static void timestamp_interrupt(struct stmmac_priv *priv)
 	u64 ptp_time;
 	int i;
 
-	if (priv->plat->int_snapshot_en) {
+	if (priv->plat->flags & STMMAC_FLAG_INT_SNAPSHOT_EN) {
 		wake_up(&priv->tstamp_busy_wait);
 		return;
 	}
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 0a77e8b05d3a..47708ddd57fd 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -213,6 +213,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_VLAN_FAIL_Q_EN		BIT(6)
 #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
 #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
+#define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -286,7 +287,6 @@ struct plat_stmmacenet_data {
 	struct pci_dev *pdev;
 	int int_snapshot_num;
 	int ext_snapshot_num;
-	bool int_snapshot_en;
 	int msi_mac_vec;
 	int msi_wol_vec;
 	int msi_lpi_vec;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
