Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4872BC17
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:24:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5E6DC6B458;
	Mon, 12 Jun 2023 09:24:46 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6EB0C6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:24:45 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4f658a17aa4so3797483e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561885; x=1689153885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jrHnz846sKSAurRWEc8dAdWpKHrp05uQC5lgmZ9ncs=;
 b=Wv5XrDDvy4LtM5L7MWCbVK9pWAo3LoUNOvZQEasGmTIxOi38BcIRca8Fde80aXxOwM
 aXfV6t3++WM8D2t43nXQPbThzdlcHTowM1+1hywltCEBkdLNk5WIBKbHdgnFrbTu6NN6
 G7hD3xTxSxdg2OJyJhkZKd/bIlY8HQYl9S3d+OKQOv7jN/dCgI9Jja2/dN9fpneUfi06
 MbuoGh0EvHikS8mSs/EC9zdBr5OUOZtHEXtCxm4XNW8D1WYAC2ZSXNjfDklDyA/HF1uk
 rv1AHJwKXY2AlZUFovyBCJwKKAz5+/DTFFMP1V3lPGCXMSQIXrZnHCpFQWA4YSRq5Alp
 0QbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561885; x=1689153885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jrHnz846sKSAurRWEc8dAdWpKHrp05uQC5lgmZ9ncs=;
 b=llm/GazOgUQRyNsvAw9wt5rU3bJE8NT1xFYdJMYEOJCWJyK+0mNKzWMtUjhX5nIo3G
 9kwsKEjfk8D0coBmBVnSMV7rwxmxy/myPHXYXZbfe6lVf1xUGMl+JVvSY+g+eJ7c1/QC
 S8cfMr6+P4wJI1/2GhqtnQdfjFV041+PqgyVsxzutZwVBIqAp2NnDtIri9+AEyX0piXC
 +hMv5h0lYHJWhNZmcrp+pd8KutXNq11hLHaAGesJNIqD0295PztvSxeHQ8PTK6M1NHbW
 kLUgMxnI0Gq0UlC1+I+Lkc2wHYsPury3cayCb3Ig7QLBSHYIZDAzNHvpMNsz60GPo49D
 /J3w==
X-Gm-Message-State: AC+VfDy4SglSuzDVJSjl+ygwa+rDGzOZn7LNAW4gtRDRy6mUYX0LD+2J
 iHR/ju6x+RL+yUZVekVBTA/QTA==
X-Google-Smtp-Source: ACHHUZ6uIGRfB9PUuO1IdV3Ad+qQfGck8wohxMrNY4KVFcykXH7H2id2cyMCwfjwU4a96k2jo3xMxA==
X-Received: by 2002:a19:6706:0:b0:4f4:2b83:f4a3 with SMTP id
 b6-20020a196706000000b004f42b83f4a3mr3564114lfc.51.1686561885364; 
 Mon, 12 Jun 2023 02:24:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:24:44 -0700 (PDT)
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
Date: Mon, 12 Jun 2023 11:23:42 +0200
Message-Id: <20230612092355.87937-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 13/26] net: stmmac: dwmac-qcom-ethqos: make
	the rgmii clock optional
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

On sa8775p there's no RGMII clock so make it optional in the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3438b6229351..252dca400071 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -663,7 +663,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
 	ethqos->has_emac3 = data->has_emac3;
 
-	ethqos->rgmii_clk = devm_clk_get(dev, "rgmii");
+	ethqos->rgmii_clk = devm_clk_get_optional(dev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_clk)) {
 		ret = PTR_ERR(ethqos->rgmii_clk);
 		goto out_config_dt;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
