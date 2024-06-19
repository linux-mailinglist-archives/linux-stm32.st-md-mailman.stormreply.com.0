Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DE290F649
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 20:46:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73A8DC6B47A;
	Wed, 19 Jun 2024 18:46:09 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55F98C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 18:46:04 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-35f23f3da44so94092f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822764; x=1719427564;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJn78QxgCMJZC/Bt30akmrrLqCYwQcxiOnm8hqmwEKA=;
 b=ef0asPw/nQ6asdMp9qTMmQMnSfFwLqKOP0E6o6bAhWh9PT4i/3ylIXyC2c9aWK4Bwd
 Q9vuievDm4z+y7wPV35VZHn6EAFDwX+Z0Ijr8PHa6Val1FhLx9mrl0RFKu9q+ovOlO+C
 EshTNkLD6ZitllXjGZJl8v89Ttvf9LfRkYqbO7ItPWu3c9BdbMk8nFJL+jG9wQ97XwFo
 OAN2De7HvRoet492z4kgErh4aat4zhN3Khr/1W8GxPzq+3i95wpxVVio4IPmaFFB9OcW
 NKInHuV3IFwJzyVAaa6wWAV5M1/k0vqePLngqUOJfReVA4NNQVyX/Cu9O6p2En2Bpu3G
 9Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718822764; x=1719427564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SJn78QxgCMJZC/Bt30akmrrLqCYwQcxiOnm8hqmwEKA=;
 b=QiDSSe0jJ9pCNn4KaR74Tylh0cC+ptdqTOegLS5tvegBkEsrBo+YOEKAG0iRisJUwh
 ce/86VgFdCTjniDlMgXzMng4lUVcnzhYooaajT04XkAKCP0Boxs11jPy3FSMqSDPdXQw
 rizS8iRY99+6oQdR1DLmcFogLrsZ3KUVRrJnUajyyCZ2mgZhszXlhOlu+pohGJeR03VN
 xalZhvFraV2azNGqJTAuEEsITOats1irlp4ekv2UDMjr0X+B6pUsPaYVQLOcGeBX8HlZ
 1vZ91gr3g8EJ2EQu1fMzzwMBUUCDwQ7vPfLX5WOCvAiUdiHosK+UVtz8ksQ7y5UtRp0E
 7kZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSoJUNfaqdEhHU2DcznlfaTGqjqRdYIcZKVyfFpmJ1rEIalhsU92NnZyfaHLUCIHfuw2viqBIRkGGsWucVO9yksAazJUMZ5QGxryvkLc1xUSv+EU0saGnK
X-Gm-Message-State: AOJu0YyU0vUwpIEsM+cJ4hlBMD/L7yOYRn1ydR609CYZso7TS1xNij7y
 g8xdeN05J+nHuap6f/A0XBD1d3buWLswOEax2k9woINKCwXmHbuGOjIYjbT5Ul4=
X-Google-Smtp-Source: AGHT+IGvNKdudrDJsFCz+vta1snIK9cUncMqGFnepCueFTkJUGgeHU0mX5Ge8h1gAZtVNK+LZc9FoA==
X-Received: by 2002:a05:6000:1363:b0:362:dbc2:9486 with SMTP id
 ffacd0b85a97d-36319c6f86emr2312112f8f.68.1718822764283; 
 Wed, 19 Jun 2024 11:46:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 11:46:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Date: Wed, 19 Jun 2024 20:45:43 +0200
Message-ID: <20240619184550.34524-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619184550.34524-1-brgl@bgdev.pl>
References: <20240619184550.34524-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/8] net: stmmac: qcom-ethqos: add
	support for 2.5G overlocked SGMII mode
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

Add support for 2.5G speed in Overclocked SGMII mode to the QCom ethqos
driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 80eb72bc6311..dac91bc72070 100644
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
+	priv->plat->phy_interface = PHY_INTERFACE_MODE_OCSGMII;
+}
+
 static int ethqos_configure(struct qcom_ethqos *ethqos)
 {
 	return ethqos->configure_func(ethqos);
@@ -787,6 +795,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		ethqos->configure_func = ethqos_configure_rgmii;
 		break;
+	case PHY_INTERFACE_MODE_OCSGMII:
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
