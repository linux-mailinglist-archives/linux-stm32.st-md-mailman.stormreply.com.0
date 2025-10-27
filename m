Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD357C0F06F
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 16:45:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86885C60493;
	Mon, 27 Oct 2025 15:45:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A6B6C60496
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:45:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47710acf715so7049215e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579914; x=1762184714;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+F6l0oreG7JTFMb6Sz6ExSU/mU3oVRcsO804GwDbowo=;
 b=WGtET/j/UpV+p3+8yfDBVVuDUQ3PrP06ZgUB1Di9pthEdPN6wnqNBLft/nKKnjIs4q
 rkfW0+UXQ2H6eHwfn0g1UrHKhz7I/j2W4YjdFTXse5iffiN9pd5Zb4dzc3lp/t6abZav
 zc7D175pTp/q4ethtpelyhND6MBtds6SZFVKZEcqT113l7dOsU4KfTfPxJkiWz67GAB2
 TBa4CmaCXTBpXN4B6OWdSA2U/81aAN63hbNab8b9fHGZB14GJecik46FjXd6n+nLTPdB
 AoDrRiqb/EEMSYrv20U5kFsCqFHivYGiq2RBVVaXi3WsQZkoYk428sSctbpExQHkLrrx
 hgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761579914; x=1762184714;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+F6l0oreG7JTFMb6Sz6ExSU/mU3oVRcsO804GwDbowo=;
 b=kbCP8WWX+BIal8dHn96EZ9bB7NGiN6wSuSFhHAb6vdEdvIWhSvCb4PzXRLQiZwRKv7
 1U+to6uJIZiwzJ4MynEs0avu2AaSd5Y6XF4fMqjaUY7KB/7dOBsbWji7mWfsdi0vGBXB
 diaU98/Rpn5red269braODcrvK9bGOxRGp1cpdN+hpnFNnsP2lqsSXS7pbRkLuT8J/nM
 5AyGxcN4fqikaZh4F2OHnZ3pIlgPZMQCdS7xmzIub7hCx/zK8cZq2A1E7b+IykMb74le
 59Wwv4cXl5BfmPRf41sQ9es19xCgPxswrJzpq+c8sjL88voKC8nzmypOfdcAUbBwnnng
 ejmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4rQrese2xit3PNx6RLjqKPkYcZccwJR0zqRC6pQtUMVLzDE4t1TMuQhAORRY68aKLZvPTX++vaREnNA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjevHEPzMl4I5+rTrhBei9J7VWfGihlGoxix8i/lZff7FvKi1H
 IEYycGoU5asn/+UIYuLXi2WJo2yfswrl1s7EbQ2SzEe4RZdxJ7MfU2RaQX/gl3IjsEE=
X-Gm-Gg: ASbGncsZqv66ZzUkeTOqW1hss7xxn+FK4kI+7DFXJvVKslSXOTB0heKPKFvcaB/PY4w
 nihjCVsyfaN+n+gU1ev/zsnT/PVl+ZHMjZ5yCeSLRBCqvCfeWiifcLK7J3TPiUdIKcSCW8TrQNW
 PDJBHS02GBTQjKafE3oR2mxIKhB1c/boNjzRhxQej8zsRII1yZc/PY4qb90Ag9l4W6nqaD/dVUB
 T+lMjNfQzktZc2JBYpbKnDds2hLwk5LOx0oijzoCurrf+rQqYQs5arXHcpBvYag3biripVnaBSW
 ZEcrMmlkgbvuE77aeCvdqWK0uqbq8EwNM4LVVyE94VAO1M+bp9PPaew3Y2oBuoSydt7BSCNQlQ4
 /TISGH28T7M6C1u0RcMCBdmzGdiWwnfm4HzncG8LbXxRvsZ2SgXWgqSphKIGfFtHoUHvpA0w=
X-Google-Smtp-Source: AGHT+IHRGKVi5MN0KlmP/QWn9GK7Gt4IncDu1UnMNHIlVsLNKr3cmM9451HaPofTrSWpTuM98bmS9w==
X-Received: by 2002:a05:600c:45c7:b0:471:6f4:601f with SMTP id
 5b1f17b1804b1-47717e30926mr964515e9.19.1761579914067; 
 Mon, 27 Oct 2025 08:45:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:45:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:55 +0100
MIME-Version: 1.0
Message-Id: <20251027-qcom-sa8255p-emac-v3-7-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5Gxjb/17qAbEtiGjyBW7mjBpKziLG21U9VH1r3QiV6U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N8BBE1xELlKYS4ZKFTuPBcaEPIPgSxudZ/m
 3UORCOMzZyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TfAAKCRARpy6gFHHX
 cmQWEADIxpsG6tmx74j0WRSxVrRH/JRNVBzM4zS/ZdSdSlQ4LxTy1mCDLEtm4Fi/6+WZ/SZiWXI
 1ZzMvymBFVn2D0iZPoYzpkAabamHrQrlQJe6noPUboVYrfR9EeQ+RKSVikMZ98pad0NLj2bT/Nd
 4a0XI3jAoeBjMPegufW4igZP+WeYXpxgIdkxP5b55+7iDHEpWwzDMAFklDLzMcQumr/YYWTAzD9
 mjGM4WGouN/jtGgNHac0Avwd5CJ704zorc5h0XENpiBH/YXCdg1xhJw5RkIUVk9lsQyWS86Hv/H
 P4OSHiq/vBYXZusrl6cMzGlolvc0S0PB4476vZC77MyWRhAzxLtSxRuM6CPLFVxDh7QLA3/kdmT
 iGGSDxGcgn6lvKEQGropggTfrMvRcxtQCSyScQ02aEw92XnTUtqE5sF/4o8R4DYIS6o2sd/RYFA
 eXK4HuFvPXD9fc3ykTGCtnvw+fkq35yCAxUFpNBpB3vgsIaRb3WV5CIS/o+IukZkU8YGX0bXfVu
 J3Plra45gnO0uIBzIJAGgU8uIyRtlqQM+BPBboMu/B9Mmm1UmgksrUDEMv3y36cJ74CwygQcivF
 fbOG3nv0FvGk6hBfzztxguJORGBB4Cepg2dnoMFUVeJK20HwbhY5inwbdsKL5uGhXchr63VTOD/
 KOj+W54h3X1BhaQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 7/8] net: stmmac: qcom-ethqos: define a
 callback for setting the serdes speed
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

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index c25b4b4581f9cea6107a39f0bc6165be6955cc1b..840d44f052786a79b85d25d2181467aa96102ec8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -124,6 +124,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -644,11 +645,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -879,6 +885,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
