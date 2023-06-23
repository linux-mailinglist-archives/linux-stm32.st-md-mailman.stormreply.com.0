Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BD273B46E
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:04:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4566C6B45B;
	Fri, 23 Jun 2023 10:04:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1A4EC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:04:32 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-3f9bff0a543so5897185e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514672; x=1690106672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ii2x6MMLssuPPDNgYZGKvPLHM+c/zKC3YPgF49rTzdU=;
 b=xSDCg+lQUTIDMHwkxHAv0qmSrhP3TF+2Q+0dynApoIaSJ5GIQM6boUZKpmYDJLDuIP
 BOEE/sQ2caNPKZ1VaFG7OZwGiPYnsN9M90ejDCYrmbZJTTCLS/jfL3VuASK7IbdgtUm8
 6PpCE0fAhax4EJ36dRSkksMuIH/rHPH7J1PBgvNevC22JeNI4uq1L9CEtfIUlw0Iaq30
 WBH3cUDzzwurXlrJIDqzk3Vfd2W9XovQSWzJ+KylTKtr79sm7p8zwZZ4jw5WHgFoQLXT
 ORDkSaDF2Xep9pqXC8oU4uxnl3oy3wSOhvV8X/TirT9j0K6ocU4LZH7IT1DirOgPUW9k
 35fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514672; x=1690106672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ii2x6MMLssuPPDNgYZGKvPLHM+c/zKC3YPgF49rTzdU=;
 b=Zb77p/ISwtDMlqxXIB4jKWnN29BrRMb7I8GyZHZhvzxOpYAsJBdZYZFXFC4lVB+eZ1
 JgJZF+8PV5225JSXSEo/x3WSS5TaZZNtyYx1UKMN//0MAfipYp1du9aCCSs/ssBJrqv+
 swMd6t9azNzrF4WSWSWAgT810TmGU24GPrEtkR3vLFAxqIkQdFxhijoaPxB6pLEP+9GH
 AHxWYYIJL3kdKbkPOxJtYFQ1+oyDfsQRyFMWNmxnA95BoGYrYPbP0nYANfy4o6gwHuHy
 ojMREaEgtOMXIFra+Zy5TGROZtP82zsp8n9ED37Y3QGtCKEDriLfla3Bq5iXJnk+9i2i
 idAg==
X-Gm-Message-State: AC+VfDw7W7Cufmq3TfUbUyRDkhMfGOglv3fe6k9dfm1gP72jFVoNFdxT
 hSKwY5mfqL0LXA/L+W+KvLx4Bg==
X-Google-Smtp-Source: ACHHUZ4zkuuP4XLvWsf7VK9/F+8V9/cJeGdLNhhFXFsK0B4wOm3wwwI0PE3dMoROI9fRkKxT0tyIbw==
X-Received: by 2002:a5d:6ad1:0:b0:2f5:d3d7:7af4 with SMTP id
 u17-20020a5d6ad1000000b002f5d3d77af4mr16354365wrw.63.1687514672396; 
 Fri, 23 Jun 2023 03:04:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b0030fae360f14sm9079360wrv.68.2023.06.23.03.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:04:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date: Fri, 23 Jun 2023 12:04:16 +0200
Message-Id: <20230623100417.93592-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100417.93592-1-brgl@bgdev.pl>
References: <20230623100417.93592-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 10/11] net: stmmac: platform:
	provide devm_stmmac_pltfr_probe()
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

Provide a devres variant of stmmac_pltfr_probe() which allows users to
skip calling stmmac_pltfr_remove() at driver detach.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 30 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  3 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 82d8a1c76476..231152ee5a32 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -803,6 +803,36 @@ int stmmac_pltfr_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_probe);
 
+static void devm_stmmac_pltfr_remove(void *data)
+{
+	struct platform_device *pdev = data;
+
+	stmmac_pltfr_remove_no_dt(pdev);
+}
+
+/**
+ * devm_stmmac_pltfr_probe
+ * @pdev: pointer to the platform device
+ * @plat: driver data platform structure
+ * @res: stmmac resources
+ * Description: Devres variant of stmmac_pltfr_probe(). Allows users to skip
+ * calling stmmac_pltfr_remove() on driver detach.
+ */
+int devm_stmmac_pltfr_probe(struct platform_device *pdev,
+			    struct plat_stmmacenet_data *plat,
+			    struct stmmac_resources *res)
+{
+	int ret;
+
+	ret = stmmac_pltfr_probe(pdev, plat, res);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(&pdev->dev, devm_stmmac_pltfr_remove,
+					pdev);
+}
+EXPORT_SYMBOL_GPL(devm_stmmac_pltfr_probe);
+
 /**
  * stmmac_pltfr_remove_no_dt
  * @pdev: pointer to the platform device
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index 8c1e5b2e9dae..c5565b2a70ac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -29,6 +29,9 @@ void stmmac_pltfr_exit(struct platform_device *pdev,
 int stmmac_pltfr_probe(struct platform_device *pdev,
 		       struct plat_stmmacenet_data *plat,
 		       struct stmmac_resources *res);
+int devm_stmmac_pltfr_probe(struct platform_device *pdev,
+			    struct plat_stmmacenet_data *plat,
+			    struct stmmac_resources *res);
 void stmmac_pltfr_remove_no_dt(struct platform_device *pdev);
 void stmmac_pltfr_remove(struct platform_device *pdev);
 extern const struct dev_pm_ops stmmac_pltfr_pm_ops;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
