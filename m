Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 049FC773A00
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 14:03:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A16E3C6B469;
	Tue,  8 Aug 2023 12:03:08 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0902C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 12:03:06 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-31751d7d96eso4189754f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Aug 2023 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691496186; x=1692100986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ie3WcAqbCuJwn+bSe+8uiPLhrE9XYV8epIzLQ3pbcL4=;
 b=1fO8HtnVKi35e//6KYE+HJ4EBCNIy4ZSnNw2nISTh5Q8eplnrPEKpbjbm6nlmeKh+T
 HvxCjWZ1/4Ln4x0Va1UeAm+byOL4lMIPCxu/ISYfBdLuWWbfBroA/C0PnEWujlBEhE4j
 txzQVb8sn+KbtFoGMge7ATRRig61xJaSDJwkFT9Uk2x3JIeVc9lc7X8LYLFsQwWzgPzY
 IMwp3DSs2kMQuovrw4ustqZBooiINCnAGrfoJHBAZmLB/Keqt4+DHzfc7+6fT76kJn4b
 NVsko35jwDTttbI1e/izd+NgepzYB3FQM1mzKMT1W02+oqdh+JCq2nuAdHRkpVxdJJg6
 UHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691496186; x=1692100986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ie3WcAqbCuJwn+bSe+8uiPLhrE9XYV8epIzLQ3pbcL4=;
 b=Zzc58PJHA82OX21Ov8q5S1k7nA0l2JfpGj0OdMfKTKh8Ml60cHOdN8EMImqvnxt/48
 48LeioG9P7lEemwcEYiI1FYSsuzRSxt/BkzZaxlmzFC1i6qE5FpbcjQ9Wwkye8ulD0FV
 3mymWwhTAy5tZYtOFj6VyfBV+zOHzF218WbCZnDWR6cTlBtcEe6eW2+7aokASzqsgmLH
 3rMF4AECQaYW6icYIAtatbNXbSnNGiRdz5pJH01qFN25G2qGqCWv6+TrKWsCOnPfMeqW
 Fu0rxB07j9WCzD8EGcqRkHtm+niLoTxkef8vS6ttUWthrPAek+WMBYXKuE/yqJWIE8mx
 n89Q==
X-Gm-Message-State: AOJu0YyDXdHtwBbQ/jR/K/GOCmSQImSCKPC/memCZMIojp9mwqYaA27S
 V0i/jf/++1LKtUhRJZX/SUSyvw==
X-Google-Smtp-Source: AGHT+IGUZorkCi64YkQRQ50LyONGuQyCaMkyjeEos2tgFQ6faizt7lG2rcTuyHFQW//RTS5PrFhblA==
X-Received: by 2002:adf:ea11:0:b0:313:f1c8:a968 with SMTP id
 q17-20020adfea11000000b00313f1c8a968mr8055326wrm.2.1691496185883; 
 Tue, 08 Aug 2023 05:03:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6a08:bcc0:ae83:e1dc])
 by smtp.gmail.com with ESMTPSA id
 v8-20020adfe4c8000000b00317046f21f9sm13499726wrm.114.2023.08.08.05.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 05:03:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alex Elder <elder@linaro.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>
Date: Tue,  8 Aug 2023 14:02:54 +0200
Message-Id: <20230808120254.11653-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: don't create the MDIO
	bus if there's no mdio node on DT
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

The stmmac_dt_phy() function that parses the device-tree node of the MAC
and allocates the MDIO and PHY resources misses one use-case: when the
MAC doesn't have a fixed link but also doesn't define its own mdio bus
on the device tree and instead shares the MDIO lines with a different
MAC with its PHY phandle reaching over into a different node.

As this function could also use some more readability, rework it to
handle this use-case and simplify the code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index be8e79c7aa34..91844673df43 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -320,12 +320,14 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
 			 struct device_node *np, struct device *dev)
 {
-	bool mdio = !of_phy_is_fixed_link(np);
 	static const struct of_device_id need_mdio_ids[] = {
 		{ .compatible = "snps,dwc-qos-ethernet-4.10" },
 		{},
 	};
 
+	if (of_phy_is_fixed_link(np))
+		return 0;
+
 	if (of_match_node(need_mdio_ids, np)) {
 		plat->mdio_node = of_get_child_by_name(np, "mdio");
 	} else {
@@ -340,20 +342,18 @@ static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
 		}
 	}
 
-	if (plat->mdio_node) {
-		dev_dbg(dev, "Found MDIO subnode\n");
-		mdio = true;
-	}
+	if (!plat->mdio_node)
+		return 0;
 
-	if (mdio) {
-		plat->mdio_bus_data =
-			devm_kzalloc(dev, sizeof(struct stmmac_mdio_bus_data),
-				     GFP_KERNEL);
-		if (!plat->mdio_bus_data)
-			return -ENOMEM;
+	dev_dbg(dev, "Found MDIO subnode\n");
 
-		plat->mdio_bus_data->needs_reset = true;
-	}
+	plat->mdio_bus_data = devm_kzalloc(dev,
+					   sizeof(struct stmmac_mdio_bus_data),
+					   GFP_KERNEL);
+	if (!plat->mdio_bus_data)
+		return -ENOMEM;
+
+	plat->mdio_bus_data->needs_reset = true;
 
 	return 0;
 }
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
