Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22232A2DA35
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Feb 2025 02:31:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C66A0C78F93;
	Sun,  9 Feb 2025 01:31:10 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49BD9C7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Feb 2025 01:31:10 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-46fcbb96ba9so40984141cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Feb 2025 17:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739064669; x=1739669469;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8qd0y+cEEGSMDbTU6v7Sk4WhfgrAmRd2NDHVF935DK4=;
 b=GlTOorpO/0vzlufaH1l3Xyx670AhqLBdAgzeoLuoiQuVXQreNMR4obCHX2djQHwlFO
 YXuYJA8XKTXYyKfZk7mouv9l6aJUeU95TntEq3Zo/K9U81XFed6tM3lrUJBpqvx/11KK
 Y7vhM0hmOQtYOFOtvaVrUm6pfuDZxdgBPYgDVhOOcDgMNnonkvt4oiShZeBAA/6HIBnL
 fIjbnufbZ2CgU0V1ZT5h272vyRN3SWqeZQItXB0hgjcpnxiQX7Obdc99VN/bcH5mLMvr
 ro8vTrq37M8hiyZ3PyaOXTiWxx/haadw88MvKnMCxMC3I3UUVD8ASDGCmCno1VI7xYUu
 TJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739064669; x=1739669469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8qd0y+cEEGSMDbTU6v7Sk4WhfgrAmRd2NDHVF935DK4=;
 b=aTGMn/Nwp53tb8Swo2bsloOobWiC3wQBNuYmuZDmV3VZcdXRr5rY6H0KqY3nwwW2xR
 xpvsx1oQpCYAuy3a4B+bBaqeBIetuH6a+psGg0gSfdwOfsLm4uZsOipwsduardP4/wH5
 fKlX4Z4XKSjAy7EzzehztfCG4XmqQ07UVLBFWl+7Zak8L85Ich9RV+N7cb4ukRbia5yx
 8moOgbFO9rsUEHuYGCLPUW4v2iZzmGF6CA8yV0FnUFRomTir0VHoqOv4t+TpcfjWHrwJ
 qwpOZHLixAuwEthtZTs6LdncbWvA9IGT/961u7nSN1+xLiI9XdK5djTiBfNpHjZTFLYm
 UGeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsNEDJUzWfNGiueIn2EiPhmh7ySueaCC/du0gGdHDDbggTU0lXGvNgJVUdC43GqvZDpUI8Un4FwBMcug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxY3MWa1+7FfV8TptyTYVi2RL8EFZNjwdwYHiBOseeCLmkNY3P6
 N7ghEEROD0JS1DjvaClNdUdJIBwu9FBGe5V/+q/Bdu5uRRCQdNZS
X-Gm-Gg: ASbGncuGoOY89IuBANa4a7sdyBO9gAGmaeGFxc80+m6wb0llO2Hy2GLvsyusY3SfREJ
 k9gTnxwkj3WvpkuOmE+gVORBQk814QbHT/UyLgNgEn5A4/iJp49f1tdXQnQcnSLvEkuEycUbO6Y
 +VVKUR3SUaR29nzw7EAWS/o2c99reGnajTEQOijP8/UW4elgvR7JJ3YI8zwdITvFJQwBRNu1Mbx
 lxrDAeT/SPn5qx4MJZ1CMd7wqOtTg7SZoSpTbhyYTZ1byKzJaEBa0t1ISQHw3Hcc3o=
X-Google-Smtp-Source: AGHT+IH5+7+WkkExgAKmn9GKbPwQMm+ZPXl5sXT9N8Ac3xNoPPbBjTifXy61nquwVLVZDKiyddYDZA==
X-Received: by 2002:a05:6214:1bcc:b0:6d4:27fd:a99d with SMTP id
 6a1803df08f44-6e44564bad9mr147118886d6.19.1739064669217; 
 Sat, 08 Feb 2025 17:31:09 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6e43ba36d5csm31699576d6.26.2025.02.08.17.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 17:31:08 -0800 (PST)
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
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Sun,  9 Feb 2025 09:30:51 +0800
Message-ID: <20250209013054.816580-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209013054.816580-1-inochiama@gmail.com>
References: <20250209013054.816580-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 2/3] net: stmmac: platform: Add
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
