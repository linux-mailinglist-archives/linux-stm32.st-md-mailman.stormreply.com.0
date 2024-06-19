Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A12290F64C
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 20:46:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98A1FC78002;
	Wed, 19 Jun 2024 18:46:09 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54483C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 18:46:06 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-363bbd51050so75212f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 11:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822766; x=1719427566;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4DXl1d4Y8Fq/VGE/ZlCIrTHLlhnzc/4anlmd+PrIAuk=;
 b=UOM2qPN6/Pbl9PDEqoazW4eEJS0bWHc1oyQVYt5lvm4fgqwXhipUVd133zh3MJruap
 Ke+L9hPsiguF4DKLrZN97neiUtDCCxfi+1Pf72zjRbWb8ywc3nq5eBol8GnXz6bPjYHD
 3QhCrsD9IVz75YADSCP1DTqsSbtEjmVcDYfUtU0GVMy0qhhbHlSZnFnf7GCwaCSYTrca
 BUJ6RAsDH6i7lvlVSNOuHi17o9V7B8uF6W7yL3aIEhxuI0LUnBYllNlx213w8Lo+6eSx
 Rswr9oS5sgoZLGo6iCLVGUBkckuINBWbkPHk4JMxh7UVwkHVc7ZUdCy/1+9svlRqcDKf
 uJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718822766; x=1719427566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4DXl1d4Y8Fq/VGE/ZlCIrTHLlhnzc/4anlmd+PrIAuk=;
 b=en4d8U//AwjYBDe9Z/cDMUj63RIsKVRTimRSY4bpvkD3sHj1ggeY00rm/JiYmvttSY
 lTrvD+kVibDXfNZj60APudVSimFEtLo4/SwW4E9g/7mQZoG8EQJkSysGSICLYYFxr01I
 FJrzswPNvpPAjznSJgHS+fCka4ONzwjtRdka1AdC5sV48s564wv9bkDoEKtrm64Q8Y2n
 2ei/Xg3bQSb8yM9tYxcRSEHA1nw4UPnkHZDgnByKH4pzfY734Z2wNCoZzhIj4YmXD9zn
 c9HVxqlWg5QU2QmCR3h+FYyqRF5ImmCyjNIoHY4QHRBkBBk9Oe8qn/apkI658j9JHSm3
 Z0Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEF2/1DlQutaZrPBvxu5CWX0ofwrsPar+I3/6x2JEztoPVNeNVuK55LCjnYv4iCXTPlbA8pAtReN81rq7xsIEle/hNV7r4FJAxltef26BRAkc5v6EBQ2Ij
X-Gm-Message-State: AOJu0YwUJJvuQutXrXGkgdGOgyY7UxCmD8k+35qezuDKytlMZss6t0j7
 rP+zvDe3bH74D4YdCanGPM2LBZLLaTHkUpqTunWo059gA6gl3vfXEQEtc2eXj5M=
X-Google-Smtp-Source: AGHT+IFnMG2uKDWMS0ODk8knrpOgQWkYuhtlFvM28oyZAff20pv5uomTc+TbnoChW8iQa/KMF1tSDw==
X-Received: by 2002:a5d:5269:0:b0:362:4b65:1cd2 with SMTP id
 ffacd0b85a97d-36317d7311fmr2276902f8f.38.1718822766449; 
 Wed, 19 Jun 2024 11:46:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 11:46:06 -0700 (PDT)
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
Date: Wed, 19 Jun 2024 20:45:45 +0200
Message-ID: <20240619184550.34524-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619184550.34524-1-brgl@bgdev.pl>
References: <20240619184550.34524-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/8] net: phy: aquantia: add support
	for aqr115c
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

Add support for a new model to the Aquantia driver. This PHY supports
Overlocked SGMII mode with 2.5G speeds.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/phy/aquantia/aquantia_main.c | 41 ++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index 6c14355744b7..11da460698b0 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -29,6 +29,7 @@
 #define PHY_ID_AQR113	0x31c31c40
 #define PHY_ID_AQR113C	0x31c31c12
 #define PHY_ID_AQR114C	0x31c31c22
+#define PHY_ID_AQR115C	0x31c31c33
 #define PHY_ID_AQR813	0x31c31cb2
 
 #define MDIO_PHYXS_VEND_IF_STATUS		0xe812
@@ -111,7 +112,6 @@ static u64 aqr107_get_stat(struct phy_device *phydev, int index)
 	int len_h = stat->size - len_l;
 	u64 ret;
 	int val;
-
 	val = phy_read_mmd(phydev, MDIO_MMD_C22EXT, stat->reg);
 	if (val < 0)
 		return U64_MAX;
@@ -368,7 +368,7 @@ static int aqr107_read_status(struct phy_device *phydev)
 		phydev->interface = PHY_INTERFACE_MODE_RXAUI;
 		break;
 	case MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII:
-		phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
+		phydev->interface = PHY_INTERFACE_MODE_OCSGMII;
 		break;
 	default:
 		phydev->interface = PHY_INTERFACE_MODE_NA;
@@ -721,6 +721,18 @@ static int aqr113c_config_init(struct phy_device *phydev)
 	return aqr107_fill_interface_modes(phydev);
 }
 
+static int aqr115c_config_init(struct phy_device *phydev)
+{
+	/* Check that the PHY interface type is compatible */
+	if (phydev->interface != PHY_INTERFACE_MODE_SGMII &&
+	    phydev->interface != PHY_INTERFACE_MODE_OCSGMII)
+		return -ENODEV;
+
+	phy_set_max_speed(phydev, SPEED_2500);
+
+	return 0;
+}
+
 static int aqr107_probe(struct phy_device *phydev)
 {
 	int ret;
@@ -999,6 +1011,30 @@ static struct phy_driver aqr_driver[] = {
 	.led_hw_control_get = aqr_phy_led_hw_control_get,
 	.led_polarity_set = aqr_phy_led_polarity_set,
 },
+{
+	PHY_ID_MATCH_MODEL(PHY_ID_AQR115C),
+	.name           = "Aquantia AQR115C",
+	.probe          = aqr107_probe,
+	.get_rate_matching = aqr107_get_rate_matching,
+	.config_init    = aqr115c_config_init,
+	.config_aneg    = aqr_config_aneg,
+	.config_intr    = aqr_config_intr,
+	.handle_interrupt = aqr_handle_interrupt,
+	.read_status    = aqr107_read_status,
+	.get_tunable    = aqr107_get_tunable,
+	.set_tunable    = aqr107_set_tunable,
+	.suspend        = aqr107_suspend,
+	.resume         = aqr107_resume,
+	.get_sset_count = aqr107_get_sset_count,
+	.get_strings    = aqr107_get_strings,
+	.get_stats      = aqr107_get_stats,
+	.link_change_notify = aqr107_link_change_notify,
+	.led_brightness_set = aqr_phy_led_brightness_set,
+	.led_hw_is_supported = aqr_phy_led_hw_is_supported,
+	.led_hw_control_set = aqr_phy_led_hw_control_set,
+	.led_hw_control_get = aqr_phy_led_hw_control_get,
+	.led_polarity_set = aqr_phy_led_polarity_set,
+},
 {
 	PHY_ID_MATCH_MODEL(PHY_ID_AQR813),
 	.name		= "Aquantia AQR813",
@@ -1042,6 +1078,7 @@ static struct mdio_device_id __maybe_unused aqr_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(PHY_ID_AQR113) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_AQR113C) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_AQR114C) },
+	{ PHY_ID_MATCH_MODEL(PHY_ID_AQR115C) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_AQR813) },
 	{ }
 };
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
