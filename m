Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F8991A573
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 13:40:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BD0AC78002;
	Thu, 27 Jun 2024 11:40:04 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2715CC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 11:39:57 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ec58040f39so53343031fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 04:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719488397; x=1720093197;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sxu9SpdSTVz3ebvxMLh70e0y0HDyyRtIxZX5+1VZmbE=;
 b=WcaTdwaGH++hZ44syVgzuAcTX9VjzLfJxmnrrJb525hWzvmr6NB05OuZKBn+ZkrSco
 HYthw8xqgmDg9R6V+kmU3ImnLS3V5R/5lLiyAhb402ecNweJiEcWXBFJgxzq6T82kWMt
 bFwfQrgkiuy9/2VQ5Py6JQzo9Z2q4rIwK2raJrJPlite/rxNmpr4OZXppxZNZhn52X+Q
 6R3qkYbte4Ntf16z+W06kBoFcA4zp6M1yesGGxmalFKdTvLTtYfuayYEiAIzXzDTxzgB
 3G1t9or9RXPg+WZcWbixgqnEpofP68uNwYazR117p9cT50ogEo7Zoy+BPDir0EOUgwNV
 cXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719488397; x=1720093197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxu9SpdSTVz3ebvxMLh70e0y0HDyyRtIxZX5+1VZmbE=;
 b=BDFq89uoDZCZtSGiDNzc8aNMsam9ghkJEye7wgdYIiOUq2YH9A2B/jnmVOrfNZGG4m
 OcZQv1wC5N+v+jzbYI6yGPLu0dwwxkjuv3Z+m/JDMlYytval2zEqMcAI5AUJp/k7RJSj
 pWyypo+qZk6T8rTgH8hxn5Mth3Yufdad5ySkm4ZRVZ2qfsB6VyvsE4j22U6CIkqOq9Lk
 GpvgtovJ6Gk9fKgeE6uYHnvwZ1/Md0CvOkg2q+zC8x4B8y158078N6NW0iLXAKt30NuR
 4TFnA8ZKG3jt/CAe6/mViDNbwam2GRAwA2+zoI7CTzdiEy1LAgEDlvLrFrYiJpbG3pTG
 5kQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUam6mClPoMGmnzaf1ITFX8ztCi1PEZPQ5G8dfitbTMlFKeQTcw1Txs6iB+TVuzHrxSvvVKMe/TlakXcJvrKVV1LkRu/c/c1eX6DMq1h32wZWqqBCVznRYI
X-Gm-Message-State: AOJu0YzBmsSGhpk1ITK+bKR3p8rPsjmDKxe5unOj/9NpbEHwbHukhGIK
 dcKi7fGPTSKUucylK2qerU/etiA7eOaZ+QduxSYtJty79j5APkP2cHqyzCdYzCc=
X-Google-Smtp-Source: AGHT+IEX942vNvyHTmy9tspQQQL/qKLX+sbQ4RkDTe+pTb3TOEUopxyuIw7WbECrr/t329Hui5TQGA==
X-Received: by 2002:a2e:8047:0:b0:2eb:ed3a:9c65 with SMTP id
 38308e7fff4ca-2ec593d93a0mr77254481fa.15.1719488397179; 
 Thu, 27 Jun 2024 04:39:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7fe5:47e9:28c5:7f25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8468613sm62081815e9.39.2024.06.27.04.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 04:39:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 27 Jun 2024 13:39:46 +0200
Message-ID: <20240627113948.25358-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627113948.25358-1-brgl@bgdev.pl>
References: <20240627113948.25358-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 1/2] net: stmmac: qcom-ethqos: add
	support for 2.5G BASEX mode
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

Add support for 2.5G speed in 2500BASEX mode to the QCom ethqos driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 80eb72bc6311..91fe57a3e59e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -665,6 +665,14 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 	return val;
 }
 
+static void qcom_ethqos_speed_mode_2500(struct net_device *ndev, void *data)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	priv->plat->max_speed = 2500;
+	priv->plat->phy_interface = PHY_INTERFACE_MODE_2500BASEX;
+}
+
 static int ethqos_configure(struct qcom_ethqos *ethqos)
 {
 	return ethqos->configure_func(ethqos);
@@ -787,6 +795,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		ethqos->configure_func = ethqos_configure_rgmii;
 		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
+		plat_dat->speed_mode_2500 = qcom_ethqos_speed_mode_2500;
+		fallthrough;
 	case PHY_INTERFACE_MODE_SGMII:
 		ethqos->configure_func = ethqos_configure_sgmii;
 		break;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
