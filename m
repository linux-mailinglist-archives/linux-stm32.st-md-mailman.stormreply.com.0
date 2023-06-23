Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0403E73B49C
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:09:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD2C3C6B459;
	Fri, 23 Jun 2023 10:09:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FC31C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:09:00 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3129c55e1d1so539810f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514939; x=1690106939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZwW4TXAaWjhQ6+iv6Z0bS3QoIIROteF83Ru7jzSEKU=;
 b=b4BnAz9AgIa8cRDsXI7XVVQICTNqShRa9vwMstK6i0g8rPRmA3CWyR2hShEo3PfQmZ
 e0rTai/P9+k1b/GyEX5PijoV5z7aycHL46dJSLgUW3sYtG9k1V7x5ZQOB3QogwQHUIZw
 sUoF7cEgiY3HBhfOlanrRYjRXpFWSEqWh8hk1PMIT1m2ZzCjCDoG7vMEhb9ASoK8aT78
 GY5zMJdiiex8t2dD3gF+kxx/eS519FmDMii9luQ52HIPhpD9QNtFuYqlMbgx01Hk7gSC
 /Jmr68O6wzpM/Pj+3oelDd3ozq3XJiOVV8xnYfvhqVM22hLPNLa8qNPCSD6TRLNTnmfF
 K8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514939; x=1690106939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pZwW4TXAaWjhQ6+iv6Z0bS3QoIIROteF83Ru7jzSEKU=;
 b=M+ps4M9evqkhrV3Eg5J3TL882qzy1bl8j5Sg8wne8NBfCVjRX+VoDz3x/T+aTcLRS1
 cflE5pIM24AZtmpZb8gCsiO0LL2/AU3qWvMWjC70xlJ1IoL2s8nxaKq4Nrp1qi/kPEoU
 IQ9oGX9OldO0koByp8Fb0anEkz+zlOxyWs8ric5VzZcwOIPCTlerXoSWE4UsVnSLDoWx
 DtiUQLR6UDSAsXgwhegQkFQxp3vpYcHp5nhP9F1RvvDla6PCFoLkW86dFobv2WfkUMiW
 C0vlxPc8gCHhSv4AC3ERkPDxGptdsm+EzVE1EAuFbjW8iDQroRqc2s2teS1bpQO94sfp
 CceA==
X-Gm-Message-State: AC+VfDwgb7ALWcOTfAB58VfspyFQ54dGTiI+EiXYnp1tXIRJpwNEB3RP
 liMGif6q3u6CfYr0k36NnsRYrw==
X-Google-Smtp-Source: ACHHUZ5cQMYgA+a66IvH2oDyzLAzxnXVlujRNPaYGzeoN3umDltOfp3oFofbTPNYH4cSZgTOfTJfSw==
X-Received: by 2002:a5d:5684:0:b0:311:1bd3:6c7b with SMTP id
 f4-20020a5d5684000000b003111bd36c7bmr17405269wrv.32.1687514939730; 
 Fri, 23 Jun 2023 03:08:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 k18-20020adfe8d2000000b0030ae3a6be4asm9278100wrn.72.2023.06.23.03.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:08:59 -0700 (PDT)
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
Date: Fri, 23 Jun 2023 12:08:41 +0200
Message-Id: <20230623100845.114085-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100845.114085-1-brgl@bgdev.pl>
References: <20230623100845.114085-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 08/12] net: stmmac: replace the
	multi_msi_en field with a flag
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++---
 include/linux/stmmac.h                            | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 1f1bc99571a5..d8bcf9452197 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -953,7 +953,7 @@ static int stmmac_config_single_msi(struct pci_dev *pdev,
 
 	res->irq = pci_irq_vector(pdev, 0);
 	res->wol_irq = res->irq;
-	plat->multi_msi_en = 0;
+	plat->flags &= ~STMMAC_FLAG_MULTI_MSI_EN;
 	dev_info(&pdev->dev, "%s: Single IRQ enablement successful\n",
 		 __func__);
 
@@ -1005,7 +1005,7 @@ static int stmmac_config_multi_msi(struct pci_dev *pdev,
 	if (plat->msi_sfty_ue_vec < STMMAC_MSI_VEC_MAX)
 		res->sfty_ue_irq = pci_irq_vector(pdev, plat->msi_sfty_ue_vec);
 
-	plat->multi_msi_en = 1;
+	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
 	dev_info(&pdev->dev, "%s: multi MSI enablement successful\n", __func__);
 
 	return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c5763f60c6ef..ebe82e7b50fc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3711,7 +3711,7 @@ static int stmmac_request_irq(struct net_device *dev)
 	int ret;
 
 	/* Request the IRQ lines */
-	if (priv->plat->multi_msi_en)
+	if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN)
 		ret = stmmac_request_irq_multi_msi(dev);
 	else
 		ret = stmmac_request_irq_single(dev);
@@ -5954,7 +5954,7 @@ static void stmmac_poll_controller(struct net_device *dev)
 	if (test_bit(STMMAC_DOWN, &priv->state))
 		return;
 
-	if (priv->plat->multi_msi_en) {
+	if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN) {
 		for (i = 0; i < priv->plat->rx_queues_to_use; i++)
 			stmmac_msi_intr_rx(0, &priv->dma_conf.rx_queue[i]);
 
@@ -7169,7 +7169,8 @@ int stmmac_dvr_probe(struct device *device,
 	priv->plat = plat_dat;
 	priv->ioaddr = res->addr;
 	priv->dev->base_addr = (unsigned long)res->addr;
-	priv->plat->dma_cfg->multi_msi_en = priv->plat->multi_msi_en;
+	priv->plat->dma_cfg->multi_msi_en =
+		(priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN);
 
 	priv->dev->irq = res->irq;
 	priv->wol_irq = res->wol_irq;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 155cb11b1c8a..3365b8071686 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -211,6 +211,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_TSO_EN			BIT(4)
 #define STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP	BIT(5)
 #define STMMAC_FLAG_VLAN_FAIL_Q_EN		BIT(6)
+#define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -286,7 +287,6 @@ struct plat_stmmacenet_data {
 	int ext_snapshot_num;
 	bool int_snapshot_en;
 	bool ext_snapshot_en;
-	bool multi_msi_en;
 	int msi_mac_vec;
 	int msi_wol_vec;
 	int msi_lpi_vec;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
