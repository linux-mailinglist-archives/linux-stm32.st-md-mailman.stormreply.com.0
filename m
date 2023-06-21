Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8186E738998
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 17:37:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 494AFC6B454;
	Wed, 21 Jun 2023 15:37:12 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C886AC6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 15:37:09 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-4f87592ecaeso4665302e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 08:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687361829; x=1689953829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jabdaiTACMvGCMLJ1hwhPAwP261O3guFNIkOypEaFEs=;
 b=iG7OfDCk3JDXJMpMe5FwY7oS1o3s1Nvx9x2APRVXDEve97G6AYWW8S/2RDRZtlP4b/
 aDrsWqVsROpv7zXRW9DWRTmH1qqcyVjNN2Xhyjmz3PBMs0AlQHlyfhiACVgiVQQyKWDi
 OObFeo1/781gyvg+8LOciR+e1zqcDmI+umqnmkJLnPHvRvqn2r2LfA92wrJDvxt37lW0
 GX+uGFlJQhc0SLqQ70RUt7kJiR9PZYlesbkhkhLGmOJ5Zk0K7+hQ6IjBUcIT7seW8Jui
 0yqngOHSp0/CYOv0+ORCvbaYwqkzPV9ZuXxXlmAHOup61KLjOSUSY8CVF7APhwWZyq5D
 jfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361829; x=1689953829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jabdaiTACMvGCMLJ1hwhPAwP261O3guFNIkOypEaFEs=;
 b=jIBx13E3ndCPrpOxcSt6COmLKykAoLLIRADg7caeGrtxVhMZrQflaw8W8tD47dX+9r
 9NkPPfImrL8pp7wPpMDt4TWrRv8cPwnl6nBVy6aA+y1kwtjGvv1t2gNziWqDnxUGHArw
 wwlSDibGD62sjd8Q4OipP6SAkfxyXAClArHJi5lW3fwtsbOOIAQHJvBEFY/ssWIZcdS5
 ambhkhx9Ns1nSuKTNdhTvKJ2ANHFG8ZupITgi9bCU83T+iRcHanheMx7bjVbRD9aiHQj
 Hrs2x31ketxtszoXvvf1fBC4kw7YZ2qVAhnW6lJH8WmxYD/CG1KAZl5sj1ERNrl9FYM4
 PKlw==
X-Gm-Message-State: AC+VfDx6GE4GRREYQeFsBXzq4W0e1GyFfuYYY/rYamguk2osCjO5RsDT
 dPSZ8lL9PImIfIgEaEDggTwOzA==
X-Google-Smtp-Source: ACHHUZ7O6m3NitPkltuHDknRSK9sSvm6K9sSsjvlHBt+9Nc1zRq0igP7Yk0EiNzUJ+83oxpIYhIKTg==
X-Received: by 2002:a19:ab12:0:b0:4f8:cd67:88e6 with SMTP id
 u18-20020a19ab12000000b004f8cd6788e6mr3668244lfe.44.1687361829235; 
 Wed, 21 Jun 2023 08:37:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1c790d000000b003f7ed463954sm5322491wme.25.2023.06.21.08.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:37:08 -0700 (PDT)
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
Date: Wed, 21 Jun 2023 17:36:46 +0200
Message-Id: <20230621153650.440350-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153650.440350-1-brgl@bgdev.pl>
References: <20230621153650.440350-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 07/11] net: stmmac: platform: provide
	stmmac_pltfr_remove_no_dt()
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

Add a variant of stmmac_pltfr_remove() that only frees resources
allocated by stmmac_pltfr_probe() and - unlike stmmac_pltfr_remove() -
does not call stmmac_remove_config_dt().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 20 +++++++++++++++++--
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  1 +
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index df417cdab8c1..58d5c5cc2269 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -762,6 +762,23 @@ int stmmac_pltfr_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_probe);
 
+/**
+ * stmmac_pltfr_remove_no_dt
+ * @pdev: pointer to the platform device
+ * Description: This undoes the effects of stmmac_pltfr_probe() by removing the
+ * driver and calling the platform's exit() callback.
+ */
+void stmmac_pltfr_remove_no_dt(struct platform_device *pdev)
+{
+	struct net_device *ndev = platform_get_drvdata(pdev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct plat_stmmacenet_data *plat = priv->plat;
+
+	stmmac_dvr_remove(&pdev->dev);
+	stmmac_pltfr_exit(pdev, plat);
+}
+EXPORT_SYMBOL_GPL(stmmac_pltfr_remove_no_dt);
+
 /**
  * stmmac_pltfr_remove
  * @pdev: platform device pointer
@@ -774,8 +791,7 @@ void stmmac_pltfr_remove(struct platform_device *pdev)
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct plat_stmmacenet_data *plat = priv->plat;
 
-	stmmac_dvr_remove(&pdev->dev);
-	stmmac_pltfr_exit(pdev, plat);
+	stmmac_pltfr_remove_no_dt(pdev);
 	stmmac_remove_config_dt(pdev, plat);
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index f968e658c9d2..af52d5aa2b9a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -27,6 +27,7 @@ void stmmac_pltfr_exit(struct platform_device *pdev,
 int stmmac_pltfr_probe(struct platform_device *pdev,
 		       struct plat_stmmacenet_data *plat,
 		       struct stmmac_resources *res);
+void stmmac_pltfr_remove_no_dt(struct platform_device *pdev);
 void stmmac_pltfr_remove(struct platform_device *pdev);
 extern const struct dev_pm_ops stmmac_pltfr_pm_ops;
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
