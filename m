Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10473B465
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:04:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2A7FC6B442;
	Fri, 23 Jun 2023 10:04:25 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AB8CC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:04:25 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-307d20548adso443324f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514664; x=1690106664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fwzdC7/KLQBqsNQ9Z3vvCuyrSfrs5l5gzbo6Rxb7/UU=;
 b=MZzt3xHdJawMjIK2dNuZKH1MQAxlWe/r3rUMF7qW6PE/PRdd83nOCHtiSYTzTXRTZ8
 DfOMKIIuYCA6SbO8krzJuZyLEsx0eVPqghCXPV+sPuNm+1HPkve4i02Da+6rBpO85y/U
 rAdHs49OjoVJ3tZNdwKgQ1kUPXnK0ApbjXvXPWTz1dHPYiI3DO0f6+ZtfK7izZev9wkF
 PzKEunjLx4Vz3uIvjNBVRPvV/vP1u4Xqy8DsZWnsOpKdwZthRS7FxV88/w3hXWX7XAZD
 IqKK82p2schhSdroYHKUEzX13ZeE6Tw1/zETkCK/zS9zBVC/kTT4RgzP3yzWBrjB17kO
 1fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514664; x=1690106664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fwzdC7/KLQBqsNQ9Z3vvCuyrSfrs5l5gzbo6Rxb7/UU=;
 b=HNrS3GJJ5UmkGiq6GX1ts1lgxEWtAph2ELpUYd+6M91s6kj3USPb9ROT8DlGEax0u8
 SHtU9zc/3kVQ0rvKR8jzQKz5u+g5CXZrpQpiHjI3c1HXsDgVWJrRuucmlIQNms7yZCY3
 M6pcMgeAJFFZxXiu67Ip4a39BWModfdFMfUs8keAf6jrUcfbnrpT6oh8YuWVtbSZ6Yzv
 pLXO4KNh2rI9Y+38XWT8j+l+JNXdhoTp/WKiK044X9mzQTwXq3bBM7nWVWQ2jymt5Soc
 wtafLYDRq7KWhAOVKMGyX+Ull/wtQkDH6R3oBtD+We1fukY5XScsS0Fjth05NOTAWAkV
 XwHQ==
X-Gm-Message-State: AC+VfDxYfYsbYOkMwke5XIRm+3sZ0VVsW+Yrh3iZ8CMRUwFa+05gDlfD
 SaMHF6Te4YJxPQFxtICSX3KP2w==
X-Google-Smtp-Source: ACHHUZ6X6W97yIjboRztdBubzybbieSu4zcX8uLRfqburrXXcSEhYItvMiMQsetiDQMMc/Ow/qJ8uQ==
X-Received: by 2002:adf:f650:0:b0:2d1:3eb9:c3c2 with SMTP id
 x16-20020adff650000000b002d13eb9c3c2mr3471562wrp.54.1687514664694; 
 Fri, 23 Jun 2023 03:04:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b0030fae360f14sm9079360wrv.68.2023.06.23.03.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:04:24 -0700 (PDT)
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
Date: Fri, 23 Jun 2023 12:04:09 +0200
Message-Id: <20230623100417.93592-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100417.93592-1-brgl@bgdev.pl>
References: <20230623100417.93592-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 03/11] net: stmmac: platform:
	provide stmmac_pltfr_exit()
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

Provide a helper wrapper around calling the platform's exit() callback.
This allows users to skip checking if the callback exists.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 22 ++++++++++++++-----
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  2 ++
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 41ca4fc9f863..5b2bc129cd85 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -720,6 +720,20 @@ int stmmac_pltfr_init(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_init);
 
+/**
+ * stmmac_pltfr_exit
+ * @pdev: pointer to the platform device
+ * @plat: driver data platform structure
+ * Description: Call the platform's exit callback (if any).
+ */
+void stmmac_pltfr_exit(struct platform_device *pdev,
+		       struct plat_stmmacenet_data *plat)
+{
+	if (plat->exit)
+		plat->exit(pdev, plat->bsp_priv);
+}
+EXPORT_SYMBOL_GPL(stmmac_pltfr_exit);
+
 /**
  * stmmac_pltfr_remove
  * @pdev: platform device pointer
@@ -733,10 +747,7 @@ void stmmac_pltfr_remove(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat = priv->plat;
 
 	stmmac_dvr_remove(&pdev->dev);
-
-	if (plat->exit)
-		plat->exit(pdev, plat->bsp_priv);
-
+	stmmac_pltfr_exit(pdev, plat);
 	stmmac_remove_config_dt(pdev, plat);
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
@@ -756,8 +767,7 @@ static int __maybe_unused stmmac_pltfr_suspend(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 
 	ret = stmmac_suspend(dev);
-	if (priv->plat->exit)
-		priv->plat->exit(pdev, priv->plat->bsp_priv);
+	stmmac_pltfr_exit(pdev, priv->plat);
 
 	return ret;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index 6a2cd47fedcd..e79134cc1d3d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -21,6 +21,8 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 
 int stmmac_pltfr_init(struct platform_device *pdev,
 		      struct plat_stmmacenet_data *plat);
+void stmmac_pltfr_exit(struct platform_device *pdev,
+		       struct plat_stmmacenet_data *plat);
 
 void stmmac_pltfr_remove(struct platform_device *pdev);
 extern const struct dev_pm_ops stmmac_pltfr_pm_ops;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
