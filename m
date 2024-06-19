Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A28B90F64D
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 20:46:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A741CC78012;
	Wed, 19 Jun 2024 18:46:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57BFEC71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 18:46:03 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4217990f997so943175e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 11:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822763; x=1719427563;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Of1uWBxSEjvKTQJleea6ZxhN8mHuCcwxXxdGI9uF93A=;
 b=ERcxQ+3QAj1Z9DByv+Mrkr+MEDaqTbPubkDLw0AYNaveJmC9qGrTwHcnBy4szzn7Ax
 PvoIBsuHN8xBbDi04vwyR1S9gLigiUwhOENzt+LP7WW0LXRxM7GS9Lq6YlXvOUDdkhGx
 xM5YXIpzJnnsoUf44AKlKxl0V1leOxLR6T6sIL3f/oh0zmfgC5rtjLi2AyqaKWVYWzLV
 0nPpzLbENCcFRM5tvRmaPimGHvvpMBWRdgRqPdRdQqV5q3aU73uBU+RKPFjePXClQWva
 SxFe7UPTJnVPVkQ96gA8BZe5WH9D37a5QImm7X0P6hOojvj1SIzqb0liac9wA24HlllE
 9S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718822763; x=1719427563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Of1uWBxSEjvKTQJleea6ZxhN8mHuCcwxXxdGI9uF93A=;
 b=NMlFm/dwcVh1UE65T9ZXfQnCP83eCUDePny3MRoGRS2Yz0I+ZLJjf8jt7vzgKTkvgR
 hFflqg0XRxQQLmbpWGWi+NuCaiadpVJgW8wDXs/PJXvas9BOQevqh7hkd+A/5IWF9QKo
 syZjkWqen7MxfeG31nxJYPwirqdfo8PYUqAbuSr7bYAViz9/vnmpNpwzYa0eisqabvxg
 mzMFu817wHiBa+0r6vcqWeaQPshH4ZggneusePgYsosJyzv1UucIQUlKq4eejp6QnMO6
 b46D7lw11dHRSS6J79qtBewimHKURnbMU1YSmsycohPj7Qts/oM0MfDI1aluDZWqDEu0
 pmLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDJZPj77vUDIi+HivmcBYwlMYPUDW1vBCv75hH/tvSGVqApO3m0GEjGm6tbFwxVWqjS0Zp5K3m2QG0wG7gwbfnDDLxFRjk+m2xmVOHJK7FJ0cEfTaabM9e
X-Gm-Message-State: AOJu0YxmGO4B6Pj/WSfcbxe274Blj9h9gtwBXa1BPqCQ5AqlHamUhqxf
 VwCcSUzQOAv6eCPaGjltwCj0mMZaJhkgYrRrzHzQgRVcczjSLeTtd8kBZiyBLYQ=
X-Google-Smtp-Source: AGHT+IG94KmlBI+1kAFW/XzI6UK2YpoCtdBNr/zZ39tySmt8Nx0B1Rz4PfJT6D+Bu6Uwl7ILTiqtkg==
X-Received: by 2002:a7b:cc13:0:b0:424:784c:b13b with SMTP id
 5b1f17b1804b1-424784cb209mr15137645e9.13.1718822763293; 
 Wed, 19 Jun 2024 11:46:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 11:46:02 -0700 (PDT)
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
Date: Wed, 19 Jun 2024 20:45:42 +0200
Message-ID: <20240619184550.34524-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619184550.34524-1-brgl@bgdev.pl>
References: <20240619184550.34524-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/8] net: phy: add support for
	overclocked SGMII
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

The Aquantia AQR115C PHY supports the Overlocked SGMII mode. In order to
support it in the driver, extend the PHY core with the new mode bits and
pieces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/phy/phy-core.c |  1 +
 drivers/net/phy/phylink.c  | 13 ++++++++++++-
 include/linux/phy.h        |  4 ++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 15f349e5995a..7cf87cae11f0 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -138,6 +138,7 @@ int phy_interface_num_ports(phy_interface_t interface)
 	case PHY_INTERFACE_MODE_RXAUI:
 	case PHY_INTERFACE_MODE_XAUI:
 	case PHY_INTERFACE_MODE_1000BASEKX:
+	case PHY_INTERFACE_MODE_OCSGMII:
 		return 1;
 	case PHY_INTERFACE_MODE_QSGMII:
 	case PHY_INTERFACE_MODE_QUSGMII:
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 02427378acfd..ce07d41a233f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -128,6 +128,7 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 	PHY_INTERFACE_MODE_5GBASER,
 	PHY_INTERFACE_MODE_2500BASEX,
 	PHY_INTERFACE_MODE_SGMII,
+	PHY_INTERFACE_MODE_OCSGMII,
 	PHY_INTERFACE_MODE_1000BASEX,
 	PHY_INTERFACE_MODE_100BASEX,
 };
@@ -180,6 +181,7 @@ static unsigned int phylink_interface_signal_rate(phy_interface_t interface)
 	switch (interface) {
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_1000BASEX: /* 1.25Mbd */
+	case PHY_INTERFACE_MODE_OCSGMII:
 		return 1250;
 	case PHY_INTERFACE_MODE_2500BASEX: /* 3.125Mbd */
 		return 3125;
@@ -231,6 +233,7 @@ static int phylink_interface_max_speed(phy_interface_t interface)
 		return SPEED_1000;
 
 	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_OCSGMII:
 		return SPEED_2500;
 
 	case PHY_INTERFACE_MODE_5GBASER:
@@ -515,6 +518,10 @@ static unsigned long phylink_get_capabilities(phy_interface_t interface,
 		caps |= MAC_1000HD | MAC_1000FD;
 		fallthrough;
 
+	case PHY_INTERFACE_MODE_OCSGMII:
+		caps |= MAC_2500FD;
+		fallthrough;
+
 	case PHY_INTERFACE_MODE_REVRMII:
 	case PHY_INTERFACE_MODE_RMII:
 	case PHY_INTERFACE_MODE_SMII:
@@ -929,6 +936,7 @@ static int phylink_parse_mode(struct phylink *pl,
 		case PHY_INTERFACE_MODE_10GKR:
 		case PHY_INTERFACE_MODE_10GBASER:
 		case PHY_INTERFACE_MODE_XLGMII:
+		case PHY_INTERFACE_MODE_OCSGMII:
 			caps = ~(MAC_SYM_PAUSE | MAC_ASYM_PAUSE);
 			caps = phylink_get_capabilities(pl->link_config.interface, caps,
 							RATE_MATCH_NONE);
@@ -1357,7 +1365,8 @@ static void phylink_mac_initial_config(struct phylink *pl, bool force_restart)
 
 	case MLO_AN_INBAND:
 		link_state = pl->link_config;
-		if (link_state.interface == PHY_INTERFACE_MODE_SGMII)
+		if (link_state.interface == PHY_INTERFACE_MODE_SGMII ||
+		    link_state.interface == PHY_INTERFACE_MODE_OCSGMII)
 			link_state.pause = MLO_PAUSE_NONE;
 		break;
 
@@ -3640,6 +3649,7 @@ void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
 		break;
 
 	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_OCSGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 		phylink_decode_sgmii_word(state, lpa);
 		break;
@@ -3715,6 +3725,7 @@ int phylink_mii_c22_pcs_encode_advertisement(phy_interface_t interface,
 			adv |= ADVERTISE_1000XPSE_ASYM;
 		return adv;
 	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_OCSGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 		return 0x0001;
 	default:
diff --git a/include/linux/phy.h b/include/linux/phy.h
index e6e83304558e..73da0983d631 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -128,6 +128,7 @@ extern const int phy_10gbit_features_array[1];
  * @PHY_INTERFACE_MODE_10GKR: 10GBASE-KR - with Clause 73 AN
  * @PHY_INTERFACE_MODE_QUSGMII: Quad Universal SGMII
  * @PHY_INTERFACE_MODE_1000BASEKX: 1000Base-KX - with Clause 73 AN
+ * @PHY_INTERFACE_MODE_OCSGMII: Overclocked SGMII
  * @PHY_INTERFACE_MODE_MAX: Book keeping
  *
  * Describes the interface between the MAC and PHY.
@@ -168,6 +169,7 @@ typedef enum {
 	PHY_INTERFACE_MODE_10GKR,
 	PHY_INTERFACE_MODE_QUSGMII,
 	PHY_INTERFACE_MODE_1000BASEKX,
+	PHY_INTERFACE_MODE_OCSGMII,
 	PHY_INTERFACE_MODE_MAX,
 } phy_interface_t;
 
@@ -289,6 +291,8 @@ static inline const char *phy_modes(phy_interface_t interface)
 		return "100base-x";
 	case PHY_INTERFACE_MODE_QUSGMII:
 		return "qusgmii";
+	case PHY_INTERFACE_MODE_OCSGMII:
+		return "ocsgmii";
 	default:
 		return "unknown";
 	}
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
