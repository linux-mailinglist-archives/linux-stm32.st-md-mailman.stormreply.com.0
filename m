Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B00D72BC19
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:24:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1BCCC6B458;
	Mon, 12 Jun 2023 09:24:48 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6125FC6B458
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:24:48 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3f7353993cbso29796895e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561888; x=1689153888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cjVXwVFp50u0PUxr/5pPlG4sgNjLclV10ezIygBZf1w=;
 b=2LxLhnK7e46mui8dhof9QAMYFAXj+RyNY51koDXFIyUq+oeAgfB5Yunm2wkRuj1JMn
 kZaCwUavQC6RW+LqMlWJwEmkbL8jYXkjd+0ANuO3gB4RfugPiO63GVGDem2oaXmUGXY6
 eAlLWzfGQJsrYyk6s/qe+xejpzIL2oEbCV4biO8JIzCtGSZlK2U1RNqppXvdTzoPFYj1
 3uySIa1BuTRWIipEsHrVcQc4yvQ9rYYM8rlnBgv7OYXKE2GKN9SYzVWyi+JBty3FKAs6
 AGFFcXEHyxxr14wTLOjNholiBRGWtf+J2xMsFuYww1sG2cHVlfE8DjukIKEYzRH+nuip
 3ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561888; x=1689153888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cjVXwVFp50u0PUxr/5pPlG4sgNjLclV10ezIygBZf1w=;
 b=c3Zn/Xm3vIp1qTpqfcIn4Z7d4N9H1jVamhkApdQVcQ6qIWKgETZKCCPgD2c7s+eHhG
 krBJ2qwrSyIBWYoKS2R53JrjWeD+P6OZH9DiLaoKPx8nnqcyksBnusfxqu2AjaL5DnyL
 85uIc0Uo0bGFwI58+TvtoipYZLf2XueFLmMvmPxEIudZiTY47NXV1cbvKy+4V/UT/1OR
 nF91VTYHmaRg16IW5f5FQjyQ8vjEfMikN52HFR863pjHRGOVuepXWC6EoQEVwZK3GIF0
 lzu0iqWlIiEOlQ/DG6cz02YVTl8O42ZduA6+qnd9xPhRjGABp59Ls3vGY1Jo4QW/VNC6
 t49g==
X-Gm-Message-State: AC+VfDzrI13aLi9FuwZEmh5vsZlEd7MVND07xh3hwtNyrINh4wOtxpyQ
 psaxznGZthNOTkcvVlZvmuz/1A==
X-Google-Smtp-Source: ACHHUZ5VMYcwm8OhSaptz22TDIOQZKg2qtYe5RLNTkB2yZzQSZhIqFe5Wt+EaJyET4ed5soNUXNxKQ==
X-Received: by 2002:a05:600c:880f:b0:3f7:148b:c310 with SMTP id
 gy15-20020a05600c880f00b003f7148bc310mr8862440wmb.13.1686561888007; 
 Mon, 12 Jun 2023 02:24:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:24:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon, 12 Jun 2023 11:23:44 +0200
Message-Id: <20230612092355.87937-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 15/26] net: stmmac: dwmac-qcom-ethqos: add
	support for the optional phy-supply
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

On sa8775p-ride we need to enable the power supply for the external PHY.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2f6b9b419601..21f329d2f7eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -8,6 +8,7 @@
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -692,6 +693,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_config_dt;
 
+	ret = devm_regulator_get_enable_optional(dev, "phy");
+	if (ret < 0 && ret != -ENODEV)
+		goto out_config_dt;
+
 	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
 	if (IS_ERR(ethqos->serdes_phy)) {
 		ret = PTR_ERR(ethqos->serdes_phy);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
