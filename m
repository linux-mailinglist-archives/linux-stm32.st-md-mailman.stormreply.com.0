Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1DB9B88BA
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 02:44:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72C13C78037;
	Fri,  1 Nov 2024 01:44:08 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F344C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 01:44:05 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7206304f93aso1345057b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 18:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730425444; x=1731030244;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AxfricRE7uBgf4L4U+T/hPqm/Ex2rRvslCVlqeVs1RU=;
 b=jvOpXZLPzBUL1MLCxDiak1RkHXzOcp/OeIYE4zCk+EPDPT2pdJz7u04zBQuAaW75B2
 9kHUTaYDpoDKleZiTsgchv1t+Y1NYsL2znsFaJk9hfUFgdakHD2pV+OEAup/wmVJXKpS
 9hJ8f1UzFsSnWXnY5FbLM+FQkFOzVbzurVjyvNqLyADBnpp+kFYpqnnUgCp6NFq5D0KH
 a67EmucwCq/FD0wbg8Ujmlja17iRwffoZlyqMwq4Nmusi6JWi7dYycRfmRGL3vxHavDD
 WASo4Q5Foxo/t5lTqLbCTyYkJd5CjPtIFefh8x4xerWeuLAxxQf2DxClRHv9NfJ6j7qB
 uVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730425444; x=1731030244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AxfricRE7uBgf4L4U+T/hPqm/Ex2rRvslCVlqeVs1RU=;
 b=JqnNmCaHKARFmziW8VL2LvLZDep4R+Higge2slzbpKb0PROUFzClNSnFt+CTRqWzPT
 VrSOgneclUyDytaOChySMUbDUc6cPIwDnxKZVT6ch/xP7Tixwt+pXV+ASfMVCrHkXfe4
 FKttlmF5uGPTW2UmJULlqg6WXo6Nj1kUofGwRuABVb3+sbi0F50vsYhVRtlOQm9NZ1pC
 Zm5TDIcUK0J1++jGZynDS3MYlDpH2aFrUmDCH1byZEMe16ykrW8U1eZCu3My8/lT1pt3
 2AR6O+h1oFtb8VM8crvf4GzxeP8N8IhX8yh4wvMDrlOHcACZ8d6CjXAK6+5BZkRN9+sU
 Dhcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvn9FFAAR7nlDa8W7+G0mf4jDAGZnwer1iUeVSLSqQgJsJ+WzKLtUyNLxHVtQbbmHdq4Rr/QJLSvxATA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzcvcUq84eseM/5oJQU1HYRzsCNWqZHDlQEB9SDD4sYBxLp3BcF
 M6ImIstNxUc9TWXGjVih9MqQgLWgxYglJqbyeltXsQgRYZEXUDms
X-Google-Smtp-Source: AGHT+IHZtCCUDX7mDEeuB8aZyi3qRWI1DKZU0sOe1chkb3X/72NCuBzDYpNglTWXoR6Evrq69uLEFQ==
X-Received: by 2002:a05:6a00:a93:b0:71e:f83:5c00 with SMTP id
 d2e1a72fcca58-720c98a19d4mr2723785b3a.2.1730425442887; 
 Thu, 31 Oct 2024 18:44:02 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc2e95a6sm1834390b3a.145.2024.10.31.18.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 18:44:02 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri,  1 Nov 2024 09:43:26 +0800
Message-ID: <20241101014327.513732-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241101014327.513732-1-inochiama@gmail.com>
References: <20241101014327.513732-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 2/3] net: stmmac: platform: Add
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
index ad868e8d195d..86ca39f89447 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -421,6 +421,17 @@ static void stmmac_remove_config_dt(struct platform_device *pdev,
 	of_node_put(plat->mdio_node);
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
@@ -551,11 +562,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
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
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
