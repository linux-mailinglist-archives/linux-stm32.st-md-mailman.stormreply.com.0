Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3CE72BC15
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:24:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A37D2C6B456;
	Mon, 12 Jun 2023 09:24:43 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64546C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:24:42 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-3f739ec88b2so29382855e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561882; x=1689153882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zNG+hKxvwpveqfTw49rcUFiC9HYNGdqxVXCMwf/CgoQ=;
 b=Sjg97FxEsWi1+NhQKvwlVEh51XvKpb7L8qjO3eSPmnCp+RHYjPs6m0g4elcX7e4Gmk
 q3U1vLjkmrqHZnROyBs/n7xJkk00XMII9dTC69A/BMsdgUAKh6CQ1iVENWho3ieFJxOn
 kpyrUeEyJN+JmDe79C2O+6cXxwvHb2t7vltcUEEX9l5t3wSl7DONd9L87ujMUkqnmc3f
 QLazLkrv1GDOV/9vOl0n3uQDl7CvHNk+dcol5Iwbbh8SCOOuXpQsG0n4CHEkKYj0lKtl
 KjhlWUbdcnrDvJneJ/NH/roITps7vNV+XakPuvBg42ntql0DPxtDl5zempMyWZOl9HON
 Bzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561882; x=1689153882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zNG+hKxvwpveqfTw49rcUFiC9HYNGdqxVXCMwf/CgoQ=;
 b=f5vNi8mtUd6yRR4+g/W+3F/qYPfIQNOJaULJFS12nvfBoz77lqync+wIvL6w1GJJXR
 ckIg79+0MQRoVhA+D6EUFr9FCngHjM+32RXvS1MZuvSDdm6Pt8qY4IESeeXA5V3Xzgks
 26TsvinWnNA+ojU5tstbHujOXlzxBZjX7+0W37KhpIKDgR1r5Zcsi7msIELXWk1bVGHs
 VOfzzvX12nGDlyzY2HrL6Pm13jnVeF8z9prXvU2rt6mRAt7fXkb+a8a/KjHnJZre2gSj
 g9R6TyTHj9Z0zV+O/kP9WRn12f72MtExAwKhLaUEmWVlXt1AXwwvMf1xeLMvtvfRPkpo
 R/KA==
X-Gm-Message-State: AC+VfDyViViXAl8DWgUHhW3aNONv/q9btoE4ZCOpupEC3PoXEtOHY2+g
 JlrhaEj/ixRPe+B1plb+D0e7xw==
X-Google-Smtp-Source: ACHHUZ7VSDx8D3GXZ4VcJcb/TSs+3b96OTltaJznbz319l8jyj/BU/MtAxrNF5k8MF/YomUni4Onnw==
X-Received: by 2002:a1c:4c0c:0:b0:3f7:3699:c294 with SMTP id
 z12-20020a1c4c0c000000b003f73699c294mr5458505wmf.29.1686561882035; 
 Mon, 12 Jun 2023 02:24:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:24:41 -0700 (PDT)
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
Date: Mon, 12 Jun 2023 11:23:40 +0200
Message-Id: <20230612092355.87937-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 11/26] net: stmmac: dwmac-qcom-ethqos: remove
	stray space
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

There's an unnecessary space in the rgmii_updatel() function, remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 5b56abacbf6b..8ed05f29fe8b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -117,7 +117,7 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos,
 {
 	unsigned int temp;
 
-	temp =  rgmii_readl(ethqos, offset);
+	temp = rgmii_readl(ethqos, offset);
 	temp = (temp & ~(mask)) | val;
 	rgmii_writel(ethqos, temp, offset);
 }
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
