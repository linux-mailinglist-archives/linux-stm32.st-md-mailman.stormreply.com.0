Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE95A55CFC
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 02:17:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35EF9C78F85;
	Fri,  7 Mar 2025 01:17:11 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9E53C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 01:17:09 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6e41e17645dso12137796d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Mar 2025 17:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741310229; x=1741915029;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=;
 b=VPI8nzxf2fZPHimKvBXZrGGXzF0m5EG7WvuktfWhLbJaol9dDVs63UoqtuYMlGeaFU
 pUOpILR6o34R6qR+L6DKmQb2P/BvbMlV+DuZ7RnXlcd35IZxJGOUEeYovaf5PxtQ5m6u
 93Ll8UdWwTOKnokMP21xDpnIGjepIu5fBRaIb+ytSalMnib3PIVxgxhzlVXjhtF1Qzcs
 nLKqSSv/Y8bHaXgfAamWj8NZPwjB8OJkeWHDkfePhfiwPQ/Y/fnpih36g4+zVp2fCEr0
 eNQ7DkTUhOD1hzcvGun7N3l/wWqE/Tr+mKafnPfe0p/KNf0FYlqKI9DHOPUCGBbjDxC7
 NSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741310229; x=1741915029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=;
 b=NxDpMP90V+JAc0D07P9bv/uYUgbIXT/1+KFUuUzfGFIFTv4YqITdOxQjr4dmOI96Oy
 ICR2onjtne6VAPtTSKMhw6ffUwRkWilxIA/c788yKhyYuJdbXCj22ybHya/AOejZbV36
 nBm7DN1t/YCd7KvohnPQybNK8EiLfrUkyeKoAnhwPFoibig+aQWHquBPAJnuvJlCh3ep
 yCrsPuQB51lFM5tNLy1Rfki4+rs2jFVD/BH0P3ohx3KPECy0wJd8ffHc32dhXznNB7zN
 ZXt2IDHtF4i/r/jdYaY1UCS0DE7Mq+xUDsDkIOzLl/rDhy1Yf8jHHh4RBR/BHaonHseY
 GzLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhFRLA/+Qe4XsmOEOCx44Go0o0anxD7Qsj/BfRcWkfiGTCaqXUf9hd/LociFesauq0v6928zPSX5x9yQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyRfAASMTmT0ezcWZiCeMPY/9A/u5YR63u/w6s2YgyMy5KzBHoz
 tjQT8Xdw1/n53ne/j592GeDm9zTw0gmG8dQzk7BIzUb6Gr8KZGqd
X-Gm-Gg: ASbGnct3y4TvkmjKNlZJz2+Kk+CA/YM+J/nuGsqim1PNXNWjNPn1QDpKY6yXs+iSe9N
 6r8MYtaURadgDRlnMcexqI9baSuZyvHEt1EVd3YDj6Et2y3tQQANiqD6mxzXIV2hNSe0dK67hg7
 Iv7yGR9RnGLZht2e0hbh2jytLNYs5F/K2mRjOVdlfWxUnJ6/J1ju3PI4d9SpXMIS0ybjvHsxJ+V
 xsAVM+n7eWALnO2f2XgNXLT8lRWdnY3LIEZiRT1gNxHSMlWctVcd4lsckMSdnDW6hZwwG/c4N0I
 eFL/miqx788S7KysfH2e
X-Google-Smtp-Source: AGHT+IEnrSWy5fjmLrRLRXpT+vxP0RMfjP0l1E+1UYAsKLj6QeQ3FFyDDhycz4+StwMi79ZnygBHvA==
X-Received: by 2002:a05:6214:2428:b0:6e6:698f:cb00 with SMTP id
 6a1803df08f44-6e9006942bamr20372866d6.42.1741310228685; 
 Thu, 06 Mar 2025 17:17:08 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6e8fa5cff36sm10687056d6.68.2025.03.06.17.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 17:17:08 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Fri,  7 Mar 2025 09:16:16 +0800
Message-ID: <20250307011623.440792-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307011623.440792-1-inochiama@gmail.com>
References: <20250307011623.440792-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 3/4] net: stmmac: platform: Add
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 4a3fe44b780d..8dc3bd6946c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -412,6 +412,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-4.20a",
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
+	"snps,dwmac-5.30a",
 	NULL
 };
 
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
