Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 060B6A3742C
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Feb 2025 13:40:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB665C7802E;
	Sun, 16 Feb 2025 12:40:33 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3AD8C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 12:40:31 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7c0892e4b19so191091285a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 04:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739709631; x=1740314431;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbqdsXVR3N15jF5g1M1GQwDGOPgdER4+dFi3kR5bHSs=;
 b=mi6OSaW2V5bT9nMnT4Km0YMr0ZTLn5h0zPGM4bHqpyjZgl7flOGlU9tG7azoJpco87
 0AQk8WAnjxnb7kX6laxGLBPq4itCmDa3CudjNfdAx9YRh8EKdOOXChEoCLbvKRTSS9SF
 8PX3N9Td1pszrPSHj7P7FU6O+v6OoG2qg8j2w3cx1aeyEVYM81TYLeJnMZaQWvPHcA1q
 z+GxDwmX+6qhUaKkkWcMgPFVRGp4JmdX8bXXBgYBV8MkeTnLAjNTJ+aPXrWcpaol+MqK
 hrYAnAXXPv8ogQzVgcKoCkvJoVX8v7dRb+zhYQPwMf75oJmaXY4EInd/ZqTiqh+QgFfF
 t+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739709631; x=1740314431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LbqdsXVR3N15jF5g1M1GQwDGOPgdER4+dFi3kR5bHSs=;
 b=YK+px2XsmYRyOfEDIbNAwK+S0JzZzi/b9J9ow5hqpzd8r0QzXqTxKjciDYr4IHZUoE
 Iqbj7frLPqVSubYTA7mz4bcSzarfplwY3oUTUmR37Up3Lum8pBgIlfPJ+yNtO/QOgkbj
 7+WGHsNMipNesO5mbXSVVdq3BbICB44QI6L+RtqmJ/tMiKdpmUO8IUFFIaN0fC6V526n
 h7kR8LckLco9qdAKEKA9NTAtxPRvX5dn3QgN4BUBolsjwQPPoG4a098n1UDhsp0oeSnG
 MI3b974oeqasQAhPpcb4GgjFebuhYYtgJN3FWOWtB1KqQjHqbItSB9WSJEm6Mjo9svV5
 Vp5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+4gTc2kRJ6PCYeh3qO5PqWrT/tU1jDTlbzzPfnxt9tWBjFWCbogsVUG+/kEFA4UgkPSYwO/Z41tHxNA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9HwIUQQLAgu7G9mMDkUVs2Qc6/quFK+05jHakUlrgImjcMZ2N
 poX0n61wj8jEtoEwITYvUvq3coZCPTyW/yxcNjvpt8lRvUerwq4f
X-Gm-Gg: ASbGnctr9f4GBR7swofG64fc/z5voFICYjNIudMWZW3rPhVhWWZChCVJWkGvtI7BbQ7
 qmlM6UMi6MiIyRsJP0NNGj7jqJEsFBFqX9y5NxsPX4jU+iBo+iy1k2wwGeZFPZMPvUljQI8CMsc
 xwZBxnH4XqTPM9SW0oyPfCJdY34jhlL2QfgjoBh9xREjIcuz+THLUgDl3VWxQuJd3Kmulh0snOw
 yakbYxY4rABPTizcGzKPRxfNsI1YDkLuQzWno4dNjLgkmJgNCWzJ/t3EW7ttVPIcKs=
X-Google-Smtp-Source: AGHT+IF5XSuhiI2P5QLx2nsbWyypxYdcETy3LCJ+aCkIcrEcibIXS/f4XBYvlBrBHEwSP+ZxkyRe4w==
X-Received: by 2002:a05:620a:4010:b0:7bf:fffb:5818 with SMTP id
 af79cd13be357-7c08aaa2cc8mr943249585a.57.1739709630750; 
 Sun, 16 Feb 2025 04:40:30 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c09a14d45dsm31099185a.10.2025.02.16.04.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 04:40:30 -0800 (PST)
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
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Hariprasad Kelam <hkelam@marvell.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Drew Fustini <dfustini@tenstorrent.com>, Furong Xu <0x1207@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Serge Semin <fancer.lancer@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Sun, 16 Feb 2025 20:39:50 +0800
Message-ID: <20250216123953.1252523-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216123953.1252523-1-inochiama@gmail.com>
References: <20250216123953.1252523-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 2/3] net: stmmac: platform: Add
	snps, dwmac-5.30a IP compatible string
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

Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c   | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index d0e61aa1a495..8dc3bd6946c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -405,6 +405,17 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 	return -ENODEV;
 }
 
+/* Compatible string array for all gmac4 devices */
+static const char * const stmmac_gmac4_compats[] = {
+	"snps,dwmac-4.00",
+	"snps,dwmac-4.10a",
+	"snps,dwmac-4.20a",
+	"snps,dwmac-5.10a",
+	"snps,dwmac-5.20",
+	"snps,dwmac-5.30a",
+	NULL
+};
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -538,11 +549,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
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
