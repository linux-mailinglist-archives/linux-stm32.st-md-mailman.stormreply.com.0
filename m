Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 118CFA4F740
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 07:40:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8703C78F6E;
	Wed,  5 Mar 2025 06:40:01 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD662CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 06:39:59 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6e892e0eb74so50177206d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Mar 2025 22:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741156799; x=1741761599;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fnUFYilpgj+lApe/lLMUPIRjzjwA/TjaOromIwsEgpY=;
 b=g9nsN7o4WMyLUnym7sLz2z8VsFoniqrSRtHTjT/ykcipCGdUjl6Xt3SzX63VE/O0xE
 NcqQokXkIE6aZS8EPCqTgGTiz14VrMKM/JTGJiQ2ToZd5sd9guNIECgHkclYImQeJkju
 w3mMiynLCAM4OqhqBhcqGZT1FysC0gy74IH4Hzx2eVmXFdFI0jj5Q9d0rZmJfoB8iUc+
 yleQOp0HWWyBRCir1En9FhcREa9ICveZrYExuVikVzc6QQnFcGkk7fSzCFhmrPiouof0
 PlMpKRJXPzq+MGkemK4ZF2lj5TiaVDG3nc7vZpYlRN2K5nPMTpizTy1AL4PSXSBTjhcx
 E2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741156799; x=1741761599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fnUFYilpgj+lApe/lLMUPIRjzjwA/TjaOromIwsEgpY=;
 b=Jmt0MqBqqyq50XLYAbuID+52sP4I7lIRpTtAwrAVrQBgvXo0lAcud1H6Pn8TwauOmc
 2/2NqRvhmz7fhQ8JCSD0G37/RkbR2aTEirvrZ92TlptAehPDLXajpr2kVfU4Sz7ETKQK
 h2lylPlG/ViIwXMfk8CPfR6PSb0ykRztIna3Y2HnmjDqfxudeiCHYEn8IWLuyI1hkATS
 KYMIjATByUSpqU4vLqVpvp+qZ9DStKbOlF1610BH8cQ9Z/vEXgAnSXNzpfgmnsY0JYth
 +UkaHlmp2viM30h6xMs5eo0DW/5HfyJwXdxQ0cOsgiliWhvbmqXbuq/l291yyHHx+D7i
 pGxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW+2nuY6y5zU7qtpxw4GVEaZdheJWqme5scVp852eT2SCvCqEVRPJ8Dq2iO5Ac9uZbVyAn4jNT61/q4A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxcItEKEyHFSOPm/JWypTCLtJYpXBrlVll50mP/6n6q0ZTxep7/
 rKv1a3HbhdHvLmDCLrJFYEa+mbp1bHApVyMnBE66CfTKur8ggA6X
X-Gm-Gg: ASbGncvR4VhM02qSy7F0V+g8dBnUeeOSZQ6UjLMx1UPbxQT1l/pSfW6kyCzkJXdHRC/
 PPm6M+D2Xcs/R3UeYxt3adKigleDSLQpj2lrZrqXpplBR/0TK4M56sZLUkTNTwl3rYcVA5sOA3M
 ILvhEsMCdA8VpHVNvVdnmbQmJSO28/CWcJPTiZuI3RqpMMwhoA8Tb56MRGmlkMjIOzZqTe9HxX+
 /r+WEWu4nGaEJDUYj/sYsAOhTIFcTL1Q0OxUEeSvr31PUkZzWxzXd2GuwwHpmC/JOeUk1lxL+rp
 sw2smburmxQXopB3qrxB
X-Google-Smtp-Source: AGHT+IEuoOgEWieVXYXs/BnBGn13ST7tq7MLg2Te/z0E0W/Uw2i3Q/8qgPco6xeoeTBuGR6vTw3lBg==
X-Received: by 2002:a05:6214:500f:b0:6e6:5e21:3b20 with SMTP id
 6a1803df08f44-6e8e6da9f4emr26434836d6.35.1741156798831; 
 Tue, 04 Mar 2025 22:39:58 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 d75a77b69052e-4750aee9694sm7883261cf.36.2025.03.04.22.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 22:39:58 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Hariprasad Kelam <hkelam@marvell.com>, Jisheng Zhang <jszhang@kernel.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Wed,  5 Mar 2025 14:39:14 +0800
Message-ID: <20250305063920.803601-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305063920.803601-1-inochiama@gmail.com>
References: <20250305063920.803601-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 2/4] net: stmmac: platform: Group
	GMAC4 compatible check
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

Use of_device_compatible_match to group existing compatible
check of GMAC4 device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c    | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index d0e61aa1a495..4a3fe44b780d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -405,6 +405,16 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 	return -ENODEV;
 }
 
+/* Compatible string array for all gmac4 devices */
+static const char * const stmmac_gmac4_compats[] = {
+	"snps,dwmac-4.00",
+	"snps,dwmac-4.10a",
+	"snps,dwmac-4.20a",
+	"snps,dwmac-5.10a",
+	"snps,dwmac-5.20",
+	NULL
+};
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -538,11 +548,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 	}
 
-	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
+	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
