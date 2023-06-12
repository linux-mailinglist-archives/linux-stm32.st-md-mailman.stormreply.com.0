Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C12E72BC18
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:24:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3C09C6B455;
	Mon, 12 Jun 2023 09:24:47 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46070C6B455
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:24:47 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4f62cf9755eso4670675e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561886; x=1689153886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3HXmWBI5xLrWbOkueODzJ5MVGSA4Kc5TK/lazRH0B0=;
 b=kzgUUkMC5jsWR5xW0+ANRcf2btdakfoFVSpYBSE9CikTfQlpt+AqLN7zdBbZJFtLme
 xv5/N8+XHKqeOLiYheLN/vH4zRYHi9T6pytx/a+feZ6Ar+vvWiN0Eku+dctJjFBED96f
 y6dlmLfFclU/1M8/Dkh0s6PVP4tPSxlThdgfNA1wtRmX3AYoPWL+galeUX+z96THhp9l
 eoKOC7/6cBKs8NL0f/gd6xfgLidEidiAmfGdioadvL+hjOWjmHTAkyP/TtqA63cg+m8E
 1Ro1pxSPqRZ/FZLWuM9+n+8mX+utAr5AZu5GwTebLop+/HDkLST5jFVWE05M/IewJtwh
 TSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561886; x=1689153886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3HXmWBI5xLrWbOkueODzJ5MVGSA4Kc5TK/lazRH0B0=;
 b=XmPYsNwLh/BieVxjC8AiQXbXLhlbrkme0gMPGKFN5J3ggq/V0qQvjka2rGX3RnhYtV
 lEwa6WXgvVc2/eI+USuUJefyqp1q+ylze4rdGBPTLuLhH7bvdXLgsqtxGugxIYdpssX1
 H7yQgW0XHNINrmbXmDo4+KNhBZ9x1cwsa/XFBp1KQwMKUfinAvMu2MEwMrGF8KaZSCjg
 HWEayJF0V0tiybZ580jU8bAILTnJWFUnDwG3YTkOvY+4NGosRPwlcoN1OmhCqbEdcVjx
 N4FZQp3hm5yHGlnG3F5JfqjNrk3T10I8kOo3f3X32YaUp1VB1ZhX6RmQd9p0GWVwBsG8
 Xyew==
X-Gm-Message-State: AC+VfDyXh9o/g/2KmRQXeZhOyHIYklPsGDpaOCnS/yLkgF5FCW+MBHb4
 i0VsV27OIkIV005sy9D4Y03bkw==
X-Google-Smtp-Source: ACHHUZ5ccKjNrjHtWSXeFcXvi6pGIDd0bXqsgL6lZowErwFAW975a65dQyiL/g71vDQz5+NfmBtGXA==
X-Received: by 2002:a05:6512:615:b0:4f2:5d38:2c37 with SMTP id
 b21-20020a056512061500b004f25d382c37mr3795687lfe.15.1686561886665; 
 Mon, 12 Jun 2023 02:24:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:24:46 -0700 (PDT)
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
Date: Mon, 12 Jun 2023 11:23:43 +0200
Message-Id: <20230612092355.87937-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 14/26] net: stmmac: dwmac-qcom-ethqos: add
	optional phyaux clock
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

On sa8775p we don't use the RGMII clock but have an additional PHYAUX
clock so add support for it to the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 252dca400071..2f6b9b419601 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -94,6 +94,7 @@ struct qcom_ethqos {
 
 	unsigned int rgmii_clk_rate;
 	struct clk *rgmii_clk;
+	struct clk *phyaux_clk;
 	struct phy *serdes_phy;
 	unsigned int speed;
 
@@ -604,6 +605,13 @@ static int ethqos_clks_config(void *priv, bool enabled)
 			return ret;
 		}
 
+		ret = clk_prepare_enable(ethqos->phyaux_clk);
+		if (ret) {
+			clk_disable_unprepare(ethqos->rgmii_clk);
+			dev_err(&ethqos->pdev->dev, "phyaux enable failed\n");
+			return ret;
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
@@ -611,6 +619,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
+		clk_disable_unprepare(ethqos->phyaux_clk);
 		clk_disable_unprepare(ethqos->rgmii_clk);
 	}
 
@@ -669,6 +678,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		goto out_config_dt;
 	}
 
+	ethqos->phyaux_clk = devm_clk_get_optional(dev, "phyaux");
+	if (IS_ERR(ethqos->phyaux_clk)) {
+		ret = PTR_ERR(ethqos->phyaux_clk);
+		goto out_config_dt;
+	}
+
 	ret = ethqos_clks_config(ethqos, true);
 	if (ret)
 		goto out_config_dt;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
