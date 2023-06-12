Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A772BC0D
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:24:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 435D2C6B455;
	Mon, 12 Jun 2023 09:24:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79BB0C6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:24:35 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3f7368126a6so27898015e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561875; x=1689153875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IGA9dmnWHTO9MZBMILRr3rONKWHes12eMbHxxU5rYjo=;
 b=VJH/EqnpVIY9A4wdvuanh+zRJFMHoqtN9KlHUE4TXf8pfiMb7wFsH2Rj+361K8lWVj
 iK7LWDPTaXeD0dwIS2hHMT1FGQVyG7CkfGyoZjPt3BdhoFANevsCA4Mo5a8ppPcQhgdp
 SP9IO3RNxz+n007apXXHJ9NyObniN2jtUwd+h0QRHR2Bm+AD+4TYdaz+x15cqvuNjqJK
 +/B9tZ8/5bhK+Bt/im5KT0ddam05HuhL9bBrYeCt+Ua0bWcnkwuK/2cTvUpJFUP7Np4F
 TVwOCy8t2WTgdeXbdqUP2tULpIEZK61tC7Mi6OK+2RsGopFURjr79xtR0s8fMNOjKYNi
 Hzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561875; x=1689153875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IGA9dmnWHTO9MZBMILRr3rONKWHes12eMbHxxU5rYjo=;
 b=kz7nBJ/Obz9VkBTk3BgaGQjRjF9dVZiebD8R321eRlNXLY7hpoJSygL+OC7XgxigIU
 IdR4OGl6zxGPHuP5iEGuHgJv9wtNv6SepnPE1tjckJwtXFmktGtMvgBM6DXx8CF62TBE
 XU9I/GMNys58Y1J0DRrNNkYXSrhTSklYLhrTIuuWBdvzlyvpVL3T6bPwMdJm4BoCMwxD
 5hs3HtgHTPLyFpjZBcLadRwfAnjDvWmYcrE+3VZVG6D8L8JLAlDdTJeBUY+KrtOTlEej
 OSyMhsftlLKeFyc/5EDV3WMa3UR3KcljQScbcQT1+AmQCY75fjh9zoTCOPiNRjNa52xx
 6xmA==
X-Gm-Message-State: AC+VfDyVTis76gMYisjNHIpFAt3g2OLlFzOmMRsHgQJr0rDWjfZXLhw+
 vVJn3hW8TMLVN98axKd/A9UHiw==
X-Google-Smtp-Source: ACHHUZ7q94E48lRzMF+w4RCtrzBLHXU/FPZYndcOaNII7cQ7K4Csdfi3e8CIsHRyLnxHiNiEqwfIkw==
X-Received: by 2002:a1c:f718:0:b0:3f7:3526:d96f with SMTP id
 v24-20020a1cf718000000b003f73526d96fmr5606394wmh.27.1686561874950; 
 Mon, 12 Jun 2023 02:24:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:24:34 -0700 (PDT)
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
Date: Mon, 12 Jun 2023 11:23:35 +0200
Message-Id: <20230612092355.87937-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 06/26] net: stmmac: dwmac-qcom-ethqos: rename
	a label in probe()
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

The err_mem label's name is unclear. It actually should be reached on
any error after stmmac_probe_config_dt() succeeds. Name it after the
cleanup action that needs to be called before exiting.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2da0738eed24..16e856861558 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -615,14 +615,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos = devm_kzalloc(&pdev->dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos) {
 		ret = -ENOMEM;
-		goto err_mem;
+		goto out_config_dt;
 	}
 
 	ethqos->pdev = pdev;
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_base)) {
 		ret = PTR_ERR(ethqos->rgmii_base);
-		goto err_mem;
+		goto out_config_dt;
 	}
 
 	data = of_device_get_match_data(&pdev->dev);
@@ -634,16 +634,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_clk)) {
 		ret = PTR_ERR(ethqos->rgmii_clk);
-		goto err_mem;
+		goto out_config_dt;
 	}
 
 	ret = ethqos_clks_config(ethqos, true);
 	if (ret)
-		goto err_mem;
+		goto out_config_dt;
 
 	ret = devm_add_action_or_reset(&pdev->dev, ethqos_clks_disable, ethqos);
 	if (ret)
-		goto err_mem;
+		goto out_config_dt;
 
 	ethqos->speed = SPEED_1000;
 	ethqos_update_rgmii_clk(ethqos, SPEED_1000);
@@ -662,11 +662,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-		goto err_mem;
+		goto out_config_dt;
 
 	return ret;
 
-err_mem:
+out_config_dt:
 	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
