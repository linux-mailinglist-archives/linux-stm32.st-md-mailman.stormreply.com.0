Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2051AA4F743
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 07:40:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D662AC78F81;
	Wed,  5 Mar 2025 06:40:05 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38026CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 06:40:04 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7c07b65efeeso570935885a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Mar 2025 22:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741156803; x=1741761603;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=;
 b=J6Q85R0R6OGUQYRG99mB+CAMvPKAFSAI5PqB6fgL1VN24bESCiLfJI6vi/ItfWb7B/
 3IUsu63PnT13w+QQ2HCiWItSN/6akBLezhGrcbqDePy07rxJOqxnuuhBd0YWS3+gH9sF
 9gjoxsuptv0DJA5DBgVNOIc6UJzrZOPvCm1InAoPIp2MrRMz1hM7vDPKzYTL0qUeDM2F
 bJD4+ybEXAojLx9Ss6MXbuwCnsrv9jYqg6SFcEhZhPyQOOXg60aBrgjyerSA+ulG7qjo
 kh7Y0gq7vCSpm0ORRE0ihnr9bNl0NRbxXwBDOyOgLPFgwi5jnEBjltQh/AQV7IRUEk9S
 XOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741156803; x=1741761603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=;
 b=G8zZJBFx6QvGxsgPxY5Wl+YVY1uDeo95YsbvLkgns7s5AKGECvBlc5lbZFxyjJjdDg
 YLk35BuCUNp2+T6piRZX5R9bkjnraCrZe4Ke7Aa8q+S7TViG8aXh0gcobSQDk5Xt5qtj
 whICvnswfmqp7DpFW8OfhBvW5Ic/dCUQblRs7hl67iOfOPjkDtN0r+fCf8VnnTWXXlE1
 CFJ3S13P7mimfSAXbexSdA2DzKiOiwEmtfiY/OXF4xSXX9iClbo3PLZxp7aUdJPXUJUU
 5HRsb8LIyI5Wzb6GHnGJCidnC1xvcETlU73RiWSg90zRdrEFOn6Y5iTgQai862oAQ6sX
 7y0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUp7iBuirGzrgBdSC5TpSbTMPDwlGngHpzaMwgaS2o8I+U1NrXtO3Nxd4GEvh83FXuHTD3NYauG56fJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywh/tTcHTrydbVWSKux1TeMaHSfE2f/KNGQdk52AYD+BN9SKKSI
 UUdDrBFM8Y9NwWK54aYPmj3wMuymXujCMcU6YZ4hHUtn6IIjm/Rg
X-Gm-Gg: ASbGncvWpwV3+9la4N8nGybg29glB+vTbzg1x6O2SpjE4g5Kn1qCjRP20OFBoE5HRXO
 JdiN8NWuC27HM8kaWhnkf1wOBa8WzPoBmiGSirbR9x/dSUonchuVUKIJtaJkg4kwMI/TswpERd5
 HTySZXS09fK0kI24Msp/2t6mbADheREKl8/RK0JG6tBe4dtb8kP5V17zeBvNIgmkpy56Aaj4YIZ
 i1y/Q/j6S3CFdjVSVDv6ACSgmcpcYirF9XguVknFDVpKGrxn5KBlB4QHS/HvWuSqj5XiGoqebtG
 J/DAhWkEYOt4lQB+5zKS
X-Google-Smtp-Source: AGHT+IHvjwxT5WbMC7jnX9jkcACdhgQLJENaJZs+PW3Nv5C/K/7SkZFAn2aK/Z5GNbzrtFbbjPi8Rw==
X-Received: by 2002:a05:620a:6288:b0:7c0:c2d7:5f2d with SMTP id
 af79cd13be357-7c3d8e7b411mr307853585a.28.1741156803205; 
 Tue, 04 Mar 2025 22:40:03 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c3b67458e0sm409029085a.57.2025.03.04.22.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 22:40:02 -0800 (PST)
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
Date: Wed,  5 Mar 2025 14:39:15 +0800
Message-ID: <20250305063920.803601-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305063920.803601-1-inochiama@gmail.com>
References: <20250305063920.803601-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 3/4] net: stmmac: platform: Add
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
