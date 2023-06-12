Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838372BC1D
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:24:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35155C6B456;
	Mon, 12 Jun 2023 09:24:55 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5B95C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:24:52 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4f64fb05a8aso4792366e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561892; x=1689153892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HRB5rCUQICPP4KdYl/nzNPsexRgByDiqLi2dGSM6LQs=;
 b=wki9pfOT5Rxd5I9FVQ1tRg38zuoF06hGoB1Obw/n5Dat40yAA3EhR9Z0NsWmcyoRqW
 vQyNN2w2lHRcUgiG1L332CkRuWKahCVsNNsrZv5eNwW8gCsYqzw1Thzr5uyHZFzdU2L4
 R7UVTsB1Dp1LYr35Igwj8+TEs389mw3klOojuK2W5JThLmNPLnC3tMYuuLyJ3Gp6zCG/
 qEcP61vcWik5dCgYIOPqXuug1GJFZUuqfw8tCK6B4Pkjc+BH8zPcoLzziPa8F0Qnz+ca
 ViB763l7KUgMeerwWnhj0R3xgWRs8nSt3qCvm/3rh1uZ+miXI5BfQi7gRLCTXh6Ux3Ff
 c3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561892; x=1689153892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRB5rCUQICPP4KdYl/nzNPsexRgByDiqLi2dGSM6LQs=;
 b=RfYYCl1XaHEBjh8s6z/mscjH0RlUq8AIqp2znSsffqtvKaz3m0Tb3u2xXMLFT3U9Gd
 FVrD1zvjU+d5t/Hi9GxNYb9COR8cMqsAS9i4yiyocYJyTnEP4Rpwbdnore+UyMlETwfP
 4mNvnEiqOzndltUmI7Aoed5XV4iiA5AwTcBGXXgQzy6thaZMir8mNEVgPPu7nGx5XgoV
 A0KUVZKmoN+kd5uV5r8rZV1flusid8mu0inTTCpFKuv9b3OQ5KkFZV1494CpqX7VD7H0
 X/z0C0yz8QWCBA4AKB+RADuU5ioIypoowZtToDylnKqR4kJKzQf2llw9C6WluJ4++N9g
 mlpQ==
X-Gm-Message-State: AC+VfDy7U8B9K5Y6xABx3HWOG+XBUcul043XE+27YO8R481UEq4KbESI
 FUYJkcgjfzI9AODvZRHLsqJ9Zw==
X-Google-Smtp-Source: ACHHUZ6MsoAALe/nXViObuQKYmMum7GoTveImC1ZSm+c8DJ1aav0op6ATtx6I9EHAENx6igoyGBseA==
X-Received: by 2002:a05:6512:2e2:b0:4f6:2233:6d27 with SMTP id
 m2-20020a05651202e200b004f622336d27mr3519648lfq.31.1686561892365; 
 Mon, 12 Jun 2023 02:24:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:24:51 -0700 (PDT)
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
Date: Mon, 12 Jun 2023 11:23:47 +0200
Message-Id: <20230612092355.87937-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 18/26] net: stmmac: add new switch to struct
	plat_stmmacenet_data
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

On some platforms, the PCS can be integrated in the MAC so the driver
will not see any PCS link activity. Add a switch that allows the platform
drivers to let the core code know.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 include/linux/stmmac.h                            | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fa07b0d50b46..fdcf1684487c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5793,7 +5793,7 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		}
 
 		/* PCS link status */
-		if (priv->hw->pcs) {
+		if (priv->hw->pcs && !priv->plat->has_integrated_pcs) {
 			if (priv->xstats.pcs_link)
 				netif_carrier_on(priv->dev);
 			else
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 225751a8fd8e..06090538fe2d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -293,5 +293,6 @@ struct plat_stmmacenet_data {
 	bool sph_disable;
 	bool serdes_up_after_phy_linkup;
 	const struct dwmac4_addrs *dwmac4_addrs;
+	bool has_integrated_pcs;
 };
 #endif
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
