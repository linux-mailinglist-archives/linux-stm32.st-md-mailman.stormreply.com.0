Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA1190F64E
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 20:46:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5095C78014;
	Wed, 19 Jun 2024 18:46:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B473C7128E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 18:46:07 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-35f2c9e23d3so828225f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822767; x=1719427567;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8OMC48GmXgiPxob9K29Y+tXmIST97gKgb0MYszQ6f4=;
 b=CyEsC541r1MEEEgVLBIncJAt/4DCIN6SxPjScZX+n4foLuaBtt6N57yAEFLRiNB1CC
 vBM+msCzUl2QtFqF5GwStnlzvnWSLpEh2dD8TOr6ehVexEX3aOVvFM2o3n9x6QsDdMrb
 Dhx1S+ivi5QuK92Db6Qpqq7GF7koSi8UPvbtSG2guykxUE+mLUNFgGFhGIoIu+2JEAyD
 ANfEITV0xJky5EfogzAsOQHhJvqjswlPjAOmabvCkSn0D/IQe/Etf84IjYnNfdgI78n9
 yamMmw2k5PMkk5tVWthgFR55aVl9bAJXYiaez9Fok/Cx2Xgfy/cEYoYxkLuuyQFQKBfG
 sMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718822767; x=1719427567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m8OMC48GmXgiPxob9K29Y+tXmIST97gKgb0MYszQ6f4=;
 b=c00Ii8RcXwruH8427DlYWfdyYpuIj43kQETtzW/cxKpKeE50GlCCOx4Gyt1LikxZPR
 gF4o10ppqZuKJ2+zw1SIsUR714PxDefp1Mxx6UVWff2etBqtQ1abhipheXUMXQ4dae61
 6ATQO0QjcHI23nytMM0tpBN4vueHwmwF/yuh+gzExH1NrjgqJJHi4GOXDfMexRcL+aYs
 jswF66KIKk0k9SknHSSf7yxApnZGOwdo6Gv8grGBWWwXzpp0mN+wvPwZkrKQ/g6u+TPj
 rmsaCjDp1axTCmUpUj3aqLiFOhT8FIa6ANfxUmvZOtUTzhpXDn6zKBpC2nuKo0doDVcI
 a47Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZoXX50jTBZAtxu7Q2nRrbE2hdDgjMUbJ71AcfHwh1Ylicd2YWlWIQX5XepAtZLjt8kK5InwU+OFdPyjQGyBhsGSHcNfgja/GtKa7b9SrntmxikyN4qG/K
X-Gm-Message-State: AOJu0YycFaYn4qkZR5ahcG3m335LOaR62UQ6HsFtcvKLKpFiheIXDE9I
 Ma0PiUymLjSkV3Wq7tV3tsJeJvDSLtL4KZ+TBFy3Ym+Fp0ii1FpII/fkpsulWYM=
X-Google-Smtp-Source: AGHT+IHPbftWUm712EVMDPWc9/FAfLxNDa5SAVUKIsk+n79gLzuNi7krxSeOn0v4Ewzob/JdZzx81g==
X-Received: by 2002:a5d:6d4c:0:b0:360:7856:fa62 with SMTP id
 ffacd0b85a97d-3609ea6c58emr6800607f8f.15.1718822767356; 
 Wed, 19 Jun 2024 11:46:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 11:46:07 -0700 (PDT)
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
Date: Wed, 19 Jun 2024 20:45:46 +0200
Message-ID: <20240619184550.34524-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619184550.34524-1-brgl@bgdev.pl>
References: <20240619184550.34524-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 5/8] net: phy: aquantia: wait for FW
	reset before checking the vendor ID
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

Checking the firmware register before it boots makes no sense, it will
report 0 even if FW is loaded. Always wait for FW to boot before
continuing.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/phy/aquantia/aquantia.h          | 1 +
 drivers/net/phy/aquantia/aquantia_firmware.c | 4 ++++
 drivers/net/phy/aquantia/aquantia_main.c     | 6 +++---
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/aquantia/aquantia.h b/drivers/net/phy/aquantia/aquantia.h
index b8502793962e..2465345081f8 100644
--- a/drivers/net/phy/aquantia/aquantia.h
+++ b/drivers/net/phy/aquantia/aquantia.h
@@ -201,5 +201,6 @@ int aqr_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 int aqr_phy_led_active_low_set(struct phy_device *phydev, int index, bool enable);
 int aqr_phy_led_polarity_set(struct phy_device *phydev, int index,
 			     unsigned long modes);
+int aqr_wait_reset_complete(struct phy_device *phydev);
 
 #endif /* AQUANTIA_H */
diff --git a/drivers/net/phy/aquantia/aquantia_firmware.c b/drivers/net/phy/aquantia/aquantia_firmware.c
index 0c9640ef153b..524627a36c6f 100644
--- a/drivers/net/phy/aquantia/aquantia_firmware.c
+++ b/drivers/net/phy/aquantia/aquantia_firmware.c
@@ -353,6 +353,10 @@ int aqr_firmware_load(struct phy_device *phydev)
 {
 	int ret;
 
+	ret = aqr_wait_reset_complete(phydev);
+	if (ret)
+		return ret;
+
 	/* Check if the firmware is not already loaded by pooling
 	 * the current version returned by the PHY. If 0 is returned,
 	 * no firmware is loaded.
diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index 11da460698b0..eab779db225c 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -441,7 +441,7 @@ static int aqr107_set_tunable(struct phy_device *phydev,
  * The chip also provides a "reset completed" bit, but it's cleared after
  * read. Therefore function would time out if called again.
  */
-static int aqr107_wait_reset_complete(struct phy_device *phydev)
+int aqr_wait_reset_complete(struct phy_device *phydev)
 {
 	int val;
 
@@ -494,7 +494,7 @@ static int aqr107_config_init(struct phy_device *phydev)
 	WARN(phydev->interface == PHY_INTERFACE_MODE_XGMII,
 	     "Your devicetree is out of date, please update it. The AQR107 family doesn't support XGMII, maybe you mean USXGMII.\n");
 
-	ret = aqr107_wait_reset_complete(phydev);
+	ret = aqr_wait_reset_complete(phydev);
 	if (!ret)
 		aqr107_chip_info(phydev);
 
@@ -522,7 +522,7 @@ static int aqcs109_config_init(struct phy_device *phydev)
 	    phydev->interface != PHY_INTERFACE_MODE_2500BASEX)
 		return -ENODEV;
 
-	ret = aqr107_wait_reset_complete(phydev);
+	ret = aqr_wait_reset_complete(phydev);
 	if (!ret)
 		aqr107_chip_info(phydev);
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
