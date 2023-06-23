Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F249673B46F
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:04:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B65D1C6B45C;
	Fri, 23 Jun 2023 10:04:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EADCDC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:04:33 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-3fa71db41b6so5308695e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514673; x=1690106673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6sVXJ2cleHMEi/0WcOIV4n/ZjjS+cQY293Qzlx7CXQ=;
 b=zuGv3jqXPXNst6BYdlNOz5i7R06BMmZUVLJVX6sdqiNUSMSJA2TAJOvJxpPq7poHFl
 FHr5u/kNtB7MlgZf+OWwoWxJ6Jxu8gW0lGRZwQY8yPD1iznE9mpGFEjJM3mAoU7ZRbRK
 MRYVo7oR/4TUl7HvpOZsCmJ5nu7qLJus9x9vo5gmUfvUhlC4qJsBa63p2GNLpiliJdH8
 hV88Vin4HqHWY3tNDp3gTuszcYIIA1WEyz4n9c4yXp62IKJ36mBCCsXKu1PmbJQ1p11J
 atLvDgsPjPDAdkzCsH3ErVKInQek3T5Hapaa49UXesn9QL4rWhG7caUsMcQi5XO7qFTV
 xk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514673; x=1690106673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6sVXJ2cleHMEi/0WcOIV4n/ZjjS+cQY293Qzlx7CXQ=;
 b=HUCdzmVMKmBjZ2UWCWJ5S2N7KplOsXvrCTGPFXqtLMsBmywygTV4bCG3aZuU5ub4KA
 9z1ecmSnPLOLDKn8iQzO0RyoH82pBRo3gXLr37Ep7SmXyNNntyczESa9DzzeA8Kyg2tJ
 Xkc/ME3XjwFOrkIZ6v94oGf8+1S8q9A3Y6/qRb76e4jdHkg/SZnyuEadJUM3WC5khLCa
 523rYP3s8rEXT0E0M8q3qJy5m1ecMsOKJm4GMWtc3E78yPkxHseZEvNne2Eg/8AgvZTx
 N/BE4Ijfb8Aef4Aw9n2xEkgcjlO21evbeQDfGDSuMXJNjy2mLUvCORxq7xXCXyxnPLyS
 HF9w==
X-Gm-Message-State: AC+VfDwT97sHZvImSFaw55IExxdzQCh9wD0wyuox+FC8qHvKnK7HubvV
 n7iwiUGQDKdsYPNpsCbhWLJmSA==
X-Google-Smtp-Source: ACHHUZ6QwnIxjXMCCySl+cTuiFkXSm9Z1C26KrzkHt/AtwA5hawwYsHJNk48HZyL8sHOloJRl0dkvw==
X-Received: by 2002:a7b:cd10:0:b0:3f9:b79b:e74e with SMTP id
 f16-20020a7bcd10000000b003f9b79be74emr7799589wmj.22.1687514673633; 
 Fri, 23 Jun 2023 03:04:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b0030fae360f14sm9079360wrv.68.2023.06.23.03.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:04:33 -0700 (PDT)
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
Date: Fri, 23 Jun 2023 12:04:17 +0200
Message-Id: <20230623100417.93592-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100417.93592-1-brgl@bgdev.pl>
References: <20230623100417.93592-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 11/11] net: stmmac:
	dwmac-qcom-ethqos: use devm_stmmac_pltfr_probe()
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

Use the devres variant of stmmac_pltfr_probe() and finally drop the
remove() callback entirely.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 7b9fbcb8d84d..e62940414e54 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -787,7 +787,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}
 
-	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
@@ -801,7 +801,6 @@ MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
 
 static struct platform_driver qcom_ethqos_driver = {
 	.probe  = qcom_ethqos_probe,
-	.remove_new = stmmac_pltfr_remove_no_dt,
 	.driver = {
 		.name           = "qcom-ethqos",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
