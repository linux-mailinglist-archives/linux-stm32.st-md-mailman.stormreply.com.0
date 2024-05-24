Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F668CEB9A
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2024 23:03:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12EC7C6DD9A;
	Fri, 24 May 2024 21:03:29 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43450C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 21:03:23 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-523b20e2615so10633753e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 14:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716584603; x=1717189403;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxT1J6TEpAgvO5DZP/UxXlPe1jaIeEw8wHuXNfn0DlA=;
 b=cEK5qmUHJTVjmWcT5GsWGDDDFdivMSATAsj9Xnb7w6CJeSsYYkv8LT0HWN/Z0FJ0aj
 Jn8lrwRbL47G6z7gPP3A0lfoJsXNeSrMUZryMAEV6jmhl3vRKuhkkI8kvHlqf3OCnDN+
 /NAQOwpM2mB4aLACR9bT0Fe3qAUlszLT0R3XmiyEBunkHulrEV20jl5tUXVZZ8egVq8h
 BUljlqjHMoip5DjZVrY85AfTLUopNswDD3ftndIW/RlU3WWesGwCUbANqXXz119aBvmF
 hyHeCEZs5UP7HkbpMaYH6Vs62hkNJiePhQKnQj9t6aVuTKlmaZgLKtmrOljBXpGbUzGA
 s2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716584603; x=1717189403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxT1J6TEpAgvO5DZP/UxXlPe1jaIeEw8wHuXNfn0DlA=;
 b=BgLhMGjMnKCF1fDySijjvxDOU9I82Kl3QIBKCzD6XgXxDq0sjrCmanyczSKDHK2rSK
 RA1gcj07BmJxGUy0oKQvLWk+zOuxwOrIzi4dNKrjphbevBPGELadjGA0bpDJQJB0jcH7
 0v6IFE4pS3xC3yBQJkubnV3lnyf63IbKoAuFRI6sXixhs3kPvp5GBJy8LX6vTUhZDNV1
 ej6eJXtaz/DHlP9ByNOMNkucHs1cabF+4JWoPUCKLncXxpuiu+KKvSMPIGYeetC2i3Z2
 mjDmrqrXFq31vsr6hPLhGHMiHHLnnm5hW/zOGgRklf4T8ArJoSjum6ax/5CR0kiLAjf1
 E5MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSFq7uVlMJ4wM5ndwP+Szg8kkUzAxJ2Eqks0TJiwHV/mmbBez/dp2K2uDBG5/maDTytMN9uOsbyPOgjn1xEiA7Y3mkSjzH2yOD87PL/q2f8PeI5ZHUuWiJ
X-Gm-Message-State: AOJu0Yzh8rYfuOfOkrC+sAqzvUb8oIVlvtLtTaqYWR+YdQannQ4N4kK/
 vN4x7X96uNUWhNY9j9NmbpLS/LUc4L0A+EY2puY6AC+4tQ44G0fX
X-Google-Smtp-Source: AGHT+IHiFHbJSkm3a+YnVrAqiEBUxqU0zl1zz3q7VRqSYd34a0x8WLy+5xT5KHOoe8SsJpqmPTpH8g==
X-Received: by 2002:a05:6512:3b86:b0:51e:2282:63cf with SMTP id
 2adb3069b0e04-529666db5f9mr2844583e87.45.1716584602922; 
 Fri, 24 May 2024 14:03:22 -0700 (PDT)
Received: from localhost ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4aa90sm241351e87.92.2024.05.24.14.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 14:03:22 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Byungho An <bh74.an@samsung.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>
Date: Sat, 25 May 2024 00:02:58 +0300
Message-ID: <20240524210304.9164-2-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240524210304.9164-1-fancer.lancer@gmail.com>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <20240524210304.9164-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 2/3] net: stmmac: Activate
	Inband/PCS flag based on the selected iface
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

The HWFEATURE.PCSSEL flag is set if the PCS block has been synthesized
into the DW GMAC controller. It's always done if the controller supports
at least one of the SGMII, TBI, RTBI PHY interfaces. If none of these
interfaces support was activated during the IP-core synthesize the PCS
block won't be activated either and the HWFEATURE.PCSSEL flag won't be
set. Based on that the RGMII in-band status detection procedure
implemented in the driver hasn't been working for the devices with the
RGMII interface support and with none of the SGMII, TBI, RTBI PHY
interfaces available in the device.

Fix that just by dropping the dma_cap.pcs flag check from the conditional
statement responsible for the In-band/PCS functionality activation. If the
RGMII interface is supported by the device then the in-band link status
detection will be also supported automatically (it's always embedded into
the RGMII RTL code). If the SGMII interface is supported by the device
then the PCS block will be supported too (it's unconditionally synthesized
into the controller). The later is also correct for the TBI/RTBI PHY
interfaces.

Note while at it drop the netdev_dbg() calls since at the moment of the
stmmac_check_pcs_mode() invocation the network device isn't registered. So
the debug prints will be for the unknown/NULL device.

Fixes: e58bb43f5e43 ("stmmac: initial support to manage pcs modes")
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 90c065920af2..6c4e90b1fea3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1146,18 +1146,10 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 {
 	int interface = priv->plat->mac_interface;
 
-	if (priv->dma_cap.pcs) {
-		if ((interface == PHY_INTERFACE_MODE_RGMII) ||
-		    (interface == PHY_INTERFACE_MODE_RGMII_ID) ||
-		    (interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
-		    (interface == PHY_INTERFACE_MODE_RGMII_TXID)) {
-			netdev_dbg(priv->dev, "PCS RGMII support enabled\n");
-			priv->hw->pcs = STMMAC_PCS_RGMII;
-		} else if (interface == PHY_INTERFACE_MODE_SGMII) {
-			netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
-			priv->hw->pcs = STMMAC_PCS_SGMII;
-		}
-	}
+	if (phy_interface_mode_is_rgmii(interface))
+		priv->hw.pcs = STMMAC_PCS_RGMII;
+	else if (interface == PHY_INTERFACE_MODE_SGMII)
+		priv->hw.pcs = STMMAC_PCS_SGMII;
 }
 
 /**
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
