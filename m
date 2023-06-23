Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD5073B46B
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:04:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 520C9C6B458;
	Fri, 23 Jun 2023 10:04:31 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AD89C6B455
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:04:29 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso496232f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514669; x=1690106669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jabdaiTACMvGCMLJ1hwhPAwP261O3guFNIkOypEaFEs=;
 b=eqSeo+sjCAKrN1PhWFnU8m2bX62dkk//RSa+mhdep5Am2/hvnd1c/spwgUf7UT8S+J
 DMn1c4hnrsC9dhMXtA0DGjXjpUQ+EzJkHb6xwKO4k/sfxR/S91g9f34oXkXhrF167u/a
 jKCk4PQUr/+LGiVH9h9X1QwBzqmB1WBEs/zOwuJ76DOfi5n8R8lSBPuhqI4SpVs6y+lT
 W1JLncUby2C0RfAB0uN/ZzltRPnuX4MSo87iEt4e5dFWx7jeVNPoBowuo+iDuXQiqRjL
 RSYchx2ZVcrvpGzaugbS+4n2XUtIJnVCsBPHlyYLvjawalaYX37MftDL87DI6V7A9611
 XlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514669; x=1690106669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jabdaiTACMvGCMLJ1hwhPAwP261O3guFNIkOypEaFEs=;
 b=idy0On833RazOhm1xfPazYXLlV50EL0bX/gbTPBOtfShNRi2BMV9F/MiEKMitX8v1e
 KX6/VvdqiM7Za+aw6BCfXCNjNFD6lNoGbpxqzBqP9QxztX+soncuyEXcupYxbEP+9WfV
 wJq8bVscU9f70CGWgc+gP6tdIoXkZUlC0FdCUAufo5UqBCfu3amVRHIHHvPEuV15RaxZ
 g02MAoIv1b3P01p430RATWxsDDR1q3A/yYEyw4XHddrezcB6hC0cUVvtK3bHS7km50Bg
 mKd/uQwnRcXK81j73Kq1riqDctVkChODdE8m+UxFSRggcmloyAflfgg+4dMm6JquLSxE
 msMA==
X-Gm-Message-State: AC+VfDxatOwsjS1LH+H8VhqkOKXFHzlPxbImfRS4pcaM9aAQt/6NKUBZ
 zaRZVXpWO+DUzz7U6B2Qi4nVEA==
X-Google-Smtp-Source: ACHHUZ4bVCpHhUCnxYiI3JTV0LWY7FqHqFM5Tihm/PAqtSEUDYD7cm5xfHqQ00GaUxgHhpUKVF5oaw==
X-Received: by 2002:adf:f844:0:b0:311:f28:c65b with SMTP id
 d4-20020adff844000000b003110f28c65bmr14808026wrq.23.1687514669140; 
 Fri, 23 Jun 2023 03:04:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b0030fae360f14sm9079360wrv.68.2023.06.23.03.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:04:28 -0700 (PDT)
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
Date: Fri, 23 Jun 2023 12:04:13 +0200
Message-Id: <20230623100417.93592-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100417.93592-1-brgl@bgdev.pl>
References: <20230623100417.93592-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 07/11] net: stmmac: platform:
	provide stmmac_pltfr_remove_no_dt()
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
