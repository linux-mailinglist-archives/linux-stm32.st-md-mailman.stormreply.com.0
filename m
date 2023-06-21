Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D25738EA5
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 20:26:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E723C6B455;
	Wed, 21 Jun 2023 18:26:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF4F9C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 18:26:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-3f9b4bf99c2so30969125e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 11:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687371988; x=1689963988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ds8NiiaWx7S6UP8O9D/ooCMxtDTCkVYtSDsiDSpfu8=;
 b=HL85Tufcp3fRrygkYMd0TVOflu/rc70QpIsmTi6ffrRAQyZbi4wqOz8kH8us4ieUHr
 Hu6SIvmaFDT+2zQ7cJWGJXPq/sFTXjEM7EXfuopbvY6WZ9nij1MwKB4UsI1O7bG4JA9V
 j0jM8Qbh0JEFgIbDY/dqUhjwBz3BjNJ0LkEKz1MsC4wTOcmQhsdex7nSA//2ZWUlVfyU
 /PiU1dQVxsJF+CMrQpsNulRf1DPoramDDii2FlRcI/fe5Tyvdm/vhvk65w2pWjjxpKNh
 dpPnVVZNM4cbWVYtWmOX0gcOssUw7nZdVG4uyKl3PQ1MbTieo64ihbQibdCqjc9l0Qzl
 VuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687371988; x=1689963988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ds8NiiaWx7S6UP8O9D/ooCMxtDTCkVYtSDsiDSpfu8=;
 b=Ne/S8CVmMZwkjtUUBh/UklXQnQZb003UoI+1jDiVCF56nQzRo6iJ3aGBzcY9h5KHS2
 vExoRLimXx4S45sZ9SKKpGHtA2nUqceQvmPy1HzZGloYRaG3gBQYLm3cWHHJV9AeVpFX
 xp8qSFTybMT8x6qAC3ah2aYnJkloBe08cP2421/RSDEP/Zq+/ixh5NJnbLpd6CsVqHle
 d+Wr7aV3vajlLtBG8ldWmOxByIYdqZsBV+x5k1lndbhXvrI0BoegHbvUmgJLavLZGYe1
 NNaa+rOW1JExL7GxPjSwV/mzbsdz/imdtZ59uItvT0TysByEk3CaTJsf3JESABkfD9la
 yaQQ==
X-Gm-Message-State: AC+VfDwDiySyWK7cqOlJh+J6TEMRYtrul+Z2DwgrwJzEHEmBSo4VU4JP
 1PBfwuPwpT47QOhrKyH3GSX86Q==
X-Google-Smtp-Source: ACHHUZ4lLdaAdUOFO06bSwskKbze5TICqWInKMtVygi44QZUdBPafa+94OQU2ihmZOLwJTfHpXjiyA==
X-Received: by 2002:a5d:6685:0:b0:30f:bc92:a537 with SMTP id
 l5-20020a5d6685000000b0030fbc92a537mr10988495wru.33.1687371988168; 
 Wed, 21 Jun 2023 11:26:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
 by smtp.gmail.com with ESMTPSA id
 z13-20020adff74d000000b0030af15d7e41sm5176994wrp.4.2023.06.21.11.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 11:26:27 -0700 (PDT)
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
Date: Wed, 21 Jun 2023 20:25:58 +0200
Message-Id: <20230621182558.544417-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621182558.544417-1-brgl@bgdev.pl>
References: <20230621182558.544417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 12/12] net: stmmac: replace the
	en_tx_lpi_clockgating field with a flag
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 4 ++--
 include/linux/stmmac.h                                | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2d68a6e84b0e..efe85b086abe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -421,7 +421,7 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
 	/* Check and enter in LPI mode */
 	if (!priv->tx_path_in_lpi_mode)
 		stmmac_set_eee_mode(priv, priv->hw,
-				priv->plat->en_tx_lpi_clockgating);
+			priv->plat->flags & STMMAC_FLAG_EN_TX_LPI_CLOCKGATING);
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5a67af4526c7..0be3113197b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -465,8 +465,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	plat->force_sf_dma_mode =
 		of_property_read_bool(np, "snps,force_sf_dma_mode");
 
-	plat->en_tx_lpi_clockgating =
-		of_property_read_bool(np, "snps,en-tx-lpi-clockgating");
+	if (of_property_read_bool(np, "snps,en-tx-lpi-clockgating"))
+		plat->flags |= STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
 
 	/* Set the maxmtu to a default of JUMBO_LEN in case the
 	 * parameter is not present in the device tree.
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index c3769dad8238..ef67dba775d0 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -215,6 +215,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
 #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
 #define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
+#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -280,7 +281,6 @@ struct plat_stmmacenet_data {
 	int has_gmac4;
 	int rss_en;
 	int mac_port_sel_speed;
-	bool en_tx_lpi_clockgating;
 	int has_xgmac;
 	u8 vlan_fail_q;
 	unsigned int eee_usecs_rate;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
