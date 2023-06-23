Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3C873B49F
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:09:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6818C6B457;
	Fri, 23 Jun 2023 10:09:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4315EC6B455
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:09:04 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-31272fcedf6so433283f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514944; x=1690106944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AXLmQoTjoeXO9UdxG4BxiuLilLfncmL1ryydj7qwo7o=;
 b=iuwXz7mi6f6iU0NcWp3IDb41yk29667vEnsshk9+azB14/0XRb4tvgzz6w39k3UTHI
 j2vrD+bdyXkKEaao49viU132lD8XiB25y1YMMpENHRdDdLKEcum9oFqEvdbKjP9y8da5
 X52/sVYz4RUXsng3XhH2hPu2lKWOiqKCGdDn3pRVnL98PbYqq/rf9NPcW/5o2btPrvg+
 Sk8hWAQFTveGNcA6uCue2YXhwwf96LNTNp+YupxiQO05jM9DUMnk2sR6heUMz7ev+uyV
 /ynJkqHrj/9s+iRGxHi8vNNiaP50BFq9jrS8Dd1LpWOdRl60B/CABBpBNcsavWpemlVF
 h5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514944; x=1690106944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AXLmQoTjoeXO9UdxG4BxiuLilLfncmL1ryydj7qwo7o=;
 b=A8w5abIy68sqxhWWE+EIuw1OqaxtjWje6j9B9JZX7IguwfoqBYj6HrwKlBLRE7l3kL
 w4UP0ULAFR3RvSro0s5VQQ3d1XSeBNJQxpLPvzLdAHiD1gmWXiPRpBf69+TZjSuKVjxf
 bMx4EH/ke68hGqF5R24DzbK0XpwuJHLVo9n/gG7jEyqwxj1/h8h+vpLSQrJV/X9VjRtt
 TMmj+SsOdErTfaDDQ058dNUCFiI4dgXSGUdYOjugAnk4HDWWzXA08kkZOXNXCXsME1ou
 jWJI3T330RGh679xUaCPt+WcIwXgBzygSfqKDfj6V5DJjnmCrCMegy83MwRIXL6akYln
 7RaA==
X-Gm-Message-State: AC+VfDzai93f2Mw7Rl8e0M/zK62k3CB2r9vAR+Is0aV9e7GkLI4Kp+nJ
 +BOfWkjy5IilDDfzNOula+IFWg==
X-Google-Smtp-Source: ACHHUZ5/NdwcI1og4z221h8R95D/JxwEhxGIovnZLwKRI0b3FDhihpgtidabzJtIHqcrQZ259Ayzyg==
X-Received: by 2002:a05:6000:8d:b0:311:db0:8aff with SMTP id
 m13-20020a056000008d00b003110db08affmr3377766wrx.70.1687514943901; 
 Fri, 23 Jun 2023 03:09:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 k18-20020adfe8d2000000b0030ae3a6be4asm9278100wrn.72.2023.06.23.03.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:09:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>
Date: Fri, 23 Jun 2023 12:08:43 +0200
Message-Id: <20230623100845.114085-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100845.114085-1-brgl@bgdev.pl>
References: <20230623100845.114085-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 10/12] net: stmmac: replace the
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
