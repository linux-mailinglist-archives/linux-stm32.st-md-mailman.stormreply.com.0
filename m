Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF1F73B463
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:04:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4DE2C65E42;
	Fri, 23 Jun 2023 10:04:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F301FC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:04:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-3f9ede60140so5338165e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514662; x=1690106662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cfAhAsug9ufzHE7mkap9OTTt62MSzJGSWiVrEWzAwlU=;
 b=vlo7MECE6WT8irpc++QJKIGj2qAwuykW75HaE87JgC6WhZ4YtwBXnSss/nC8/z1pvI
 hjPF5qA4MGdqEiG7FBROddqvRiVXtio+8xH2wHemsUhm1mlCdrg4RhSn+4YID921UF/Q
 5TlcSD1WgwuqPAKcfVs9noiQ7Y4rNAiKBUnCVjJOrJL50KuwnGSC7Ny2bHov2cl70MTD
 0tyXOElThG+N8HVivMT3MrZndyva1w1s5TVe2fxvBt4jq97h41cOaPi1YI0DIjGKQuAV
 3VYTPlAYxeyP2m2J3+0QNroKNUe0KRqYhGo163XT4Lpz8Y20c/hTnxchH9Ztn6BtX7g0
 f62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514662; x=1690106662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfAhAsug9ufzHE7mkap9OTTt62MSzJGSWiVrEWzAwlU=;
 b=b82Ceot8Xjd4SA2jIM1QnnGg8mSaWE1yzdFgP/VKk7a0yWm4nntDN70UfUrc8WALI6
 jed0JmbrIuwHEfO04KRMQCzQQ20WonZkH0nsTnMfmqWz1vL0rk8sb8M9HpgkoafBZHik
 lyJ+3z4TsXLU90ndjg1tWOOjR8UmYTd1cJALYbTS+dnjUldtndGcUHPp12r4UlIWcOHf
 UVJcW6jC0L/kcsJ7v1Rr0JUsSqHr/7mZBbauxGyd8xEehIiIic7pJRCtrGzJ+muk6J6P
 Xmfd1P4hiBIEHFAih7BRyXLWx8hQruKmHGP39sEHk/LrC+2HjOuYFJksmrioAOiSp5md
 F4eQ==
X-Gm-Message-State: AC+VfDz9c8YhkUuoZheRnf5oWAsDoW19nW0CU1pd09WXkF1uqxII7GFN
 t0YctVCghhetTh3/Q+OJNN2WTQ==
X-Google-Smtp-Source: ACHHUZ7yBYg7767eJ6l0yNyjOWhD+B1pFOg8mtipHqxiEFN19KDOEVQ4rtrMgdPufUYXQ2uhXSvwnA==
X-Received: by 2002:adf:f203:0:b0:311:19df:dac7 with SMTP id
 p3-20020adff203000000b0031119dfdac7mr15154776wro.28.1687514662647; 
 Fri, 23 Jun 2023 03:04:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b0030fae360f14sm9079360wrv.68.2023.06.23.03.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:04:22 -0700 (PDT)
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
Date: Fri, 23 Jun 2023 12:04:07 +0200
Message-Id: <20230623100417.93592-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100417.93592-1-brgl@bgdev.pl>
References: <20230623100417.93592-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 01/11] net: stmmac: platform:
	provide stmmac_pltfr_init()
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

Provide a helper wrapper around calling the platform's init() callback.
This allows users to skip checking if the callback exists.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 25 +++++++++++++++++--
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  3 +++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 3c6b55b60461..41ca4fc9f863 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -701,6 +701,25 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(stmmac_get_platform_resources);
 
+/**
+ * stmmac_pltfr_init
+ * @pdev: pointer to the platform device
+ * @plat: driver data platform structure
+ * Description: Call the platform's init callback (if any) and propagate
+ * the return value.
+ */
+int stmmac_pltfr_init(struct platform_device *pdev,
+		      struct plat_stmmacenet_data *plat)
+{
+	int ret = 0;
+
+	if (plat->init)
+		ret = plat->init(pdev, plat->bsp_priv);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(stmmac_pltfr_init);
+
 /**
  * stmmac_pltfr_remove
  * @pdev: platform device pointer
@@ -755,9 +774,11 @@ static int __maybe_unused stmmac_pltfr_resume(struct device *dev)
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct platform_device *pdev = to_platform_device(dev);
+	int ret;
 
-	if (priv->plat->init)
-		priv->plat->init(pdev, priv->plat->bsp_priv);
+	ret = stmmac_pltfr_init(pdev, priv->plat->bsp_priv);
+	if (ret)
+		return ret;
 
 	return stmmac_resume(dev);
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index f7e457946681..6a2cd47fedcd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -19,6 +19,9 @@ void stmmac_remove_config_dt(struct platform_device *pdev,
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res);
 
+int stmmac_pltfr_init(struct platform_device *pdev,
+		      struct plat_stmmacenet_data *plat);
+
 void stmmac_pltfr_remove(struct platform_device *pdev);
 extern const struct dev_pm_ops stmmac_pltfr_pm_ops;
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
