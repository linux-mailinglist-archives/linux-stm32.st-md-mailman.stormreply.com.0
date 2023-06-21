Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C498073899B
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 17:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85395C6B459;
	Wed, 21 Jun 2023 15:37:14 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11153C6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 15:37:13 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3f8f3786f1dso66491495e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 08:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687361832; x=1689953832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGD2YNQo5DCptfM/plxJR3RlHOdJ1opqXIoNZJpMScQ=;
 b=INYNN1dz0gWjscIjzw8UtsEksmuIN5TllH30vYEzWIJjI/XN4mMGeBoiY7Y5XeQ/MV
 dZQdk+Txvg8zLoqET1De3mQ2qah+eU+uv9xFt2U1EVqc7GsUf5cWliGG6gr9Firtaogs
 amX4HCMgtPHjrkoSlqgq2cgHIAr/N6fFv6tkR0CtQDNBNURaXRXGWfIw3+ZcuIKuHXj/
 Q3lU1XAFbedveozvSaSw21nwM8AwPbSp5Ygdo5ska0ouusbn9WCq7tMeoK88rqpM+fPi
 idGAcKQ5SkNkWKICMcZQ5aPNeZY3VmGwrEU1mqdPSI8gCbZzfKf3LSacBZ5mRBQiAfyu
 RzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361832; x=1689953832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oGD2YNQo5DCptfM/plxJR3RlHOdJ1opqXIoNZJpMScQ=;
 b=kbNKvftw3utj3+oF01trf6qy/P5AkYNt4j77cj7YAUiEiDiynt9X8apdFdDUFCsA1B
 rQNn0WCzXiM2KDt3MvbQi+YABnmjlXdlpba4qud9Wu43hMk6Pxxxuyw06ONGcnm8tWo+
 /BfA7Gc2heyxZppSJSktmt8wDSw9V5lJNdAOqos+IvS+zjY+ABsJLWwC56NIs1Gru6PM
 T/BxYhIs/3nbbRU5+mSlyNFV9AX/1VV1H87zx20SFmmz3tRPWO5Pq1iUN46swQ23SQMn
 RucxhJWv/QjTC6GTd0ADPtje4SDNgYvBWrkarjXZD6/8l4duWXaCn0ee92qfl8Bt4yk/
 pNaQ==
X-Gm-Message-State: AC+VfDxLSjUhPseijazHZzA7/dU0NPxd61Uurb3mOGg3D+mb3zQyW7BX
 Ma42quLlQWq/8bvkd2mIhpX1aA==
X-Google-Smtp-Source: ACHHUZ69sgYoTgZluegZ/SRfV86MRMgLoC7Hzm7bkGWZ5zV2hOQoqblgZYilUY5Pkexsl1OEY22JNw==
X-Received: by 2002:a1c:6a1a:0:b0:3f9:b8b1:9d2 with SMTP id
 f26-20020a1c6a1a000000b003f9b8b109d2mr4122895wmc.33.1687361832707; 
 Wed, 21 Jun 2023 08:37:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1c790d000000b003f7ed463954sm5322491wme.25.2023.06.21.08.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:37:12 -0700 (PDT)
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
Date: Wed, 21 Jun 2023 17:36:49 +0200
Message-Id: <20230621153650.440350-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153650.440350-1-brgl@bgdev.pl>
References: <20230621153650.440350-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 10/11] net: stmmac: platform: provide
	devm_stmmac_pltfr_probe()
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
index 043fdfdef6d4..6b0dce6cb661 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -797,6 +797,36 @@ int stmmac_pltfr_probe(struct platform_device *pdev,
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
