Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1747C9FA8D0
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Dec 2024 01:59:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0C3FC7803B;
	Mon, 23 Dec 2024 00:59:29 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0C30C7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 00:59:28 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7b1601e853eso310543485a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Dec 2024 16:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734915568; x=1735520368;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AiKcNAywK5Cmu1NkwsGA/Qh6M5B4fnjylkQgAEZo09A=;
 b=El31OkdCcdHaIZvwiRblylD5op6D3o+BZHgO5yLR4AXW0/uQRMHpf4jBk5ku/lDYDE
 deOU/becswVW8k270V7PvDm1bt8/Ibn3ebWE2BFhBqc6ia1KjfQ3I+TMAnyBzjnI7ULb
 Z/9IV8UFqK4aL+XYIEEPPu/F+c8f23wAEOs1woOnvV1MlhbkevSUqSfR7Yidr1bB2laE
 TMrwQx+OZfzAuLMH+Gzi3llX1lgWhThQR/m4KrVQQY+6PkAWRIxMfDBmWFyrZRB7ZbJ4
 GYBF49xNpa7mn/BnbparZEpsPBG3OPi2Jx2gLF3qQhRUjHG4wKWJK9d9QMnV0jHxzOiF
 SCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734915568; x=1735520368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AiKcNAywK5Cmu1NkwsGA/Qh6M5B4fnjylkQgAEZo09A=;
 b=KFvrsbEm7Uj6CgRJWxV5kgJUY6/8cqRtxoL0WYjB03llAQKCPHejknYziBIexAU8Xl
 2633pr31pABanvw8bswT0Zon/nXSEkpoTd0rvbC06AA2hNDVAdd/PPukfhVKgPbA8gTS
 qQMF8LDFsXhidCLV22HT2afTnA//Dwgd2XSbZCi0dDc+8FcEM9CfCDv1Gq1Y86SVDcLw
 mxnQIjEtNL+FTLL1PjOdg0g8+pdlnXjOpDgkIzAKi/9FTWVmdNQ+thjhUGBNyydg3XhD
 v5uLNf0cUT8oafogSahuiLHmHJUBSpRIZNaHBu9mKwx3kxrMnfYWary0fxqHF4NP9ZTC
 o4Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIN+SWgvisKKBDzh22hX+9VGCqlvjhJoEKnwbLZii3WzYI+cc+W5UB0ohZJVfcGm3MiwYZjfLKQIIjXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwG4qmK13adj+tqvKxpdgop6FT0vpr5VuYmcyJpo5NXY0tLwHRR
 G1Zc4Bq9qqObJY8CGgJeaJG7lCByow9qdZQLK36KvfqB+NaTVpwl
X-Gm-Gg: ASbGncvTsX3SyZTCU4P/kA+RhbkEm9Blwsi+oM//snzp/STVG1pCtXnyJN5ObvaXpGg
 0/8+Ttv7Rq/L+H4MNYr9jONYaCkZzFNQgtUzBzPICJ0g6E3zF3K5CJhIFicuvvC/wCsUo+48mQo
 3SL6L7DCZ/oH3QOR0QYuNeA7Yjy0kZm0EXladIIj0kLb4SiqQUBk4zKRY3UladdWSReQFAVGMrZ
 LY3l/kYl5h6i1BUN3319Ogqs2Qw7ETj
X-Google-Smtp-Source: AGHT+IHmWT1/Ptgcfo0yRcOfYVL7jRnYrWxtKz1ZxEcSoQyLNTugTUWefuWbPDDlyPnGLBEXiIHxDA==
X-Received: by 2002:a05:620a:394a:b0:7b6:d710:2282 with SMTP id
 af79cd13be357-7b9ba80ebc6mr1941528985a.49.1734915567731; 
 Sun, 22 Dec 2024 16:59:27 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b9ac2bd0b9sm341784485a.23.2024.12.22.16.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 16:59:27 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Mon, 23 Dec 2024 08:58:38 +0800
Message-ID: <20241223005843.483805-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241223005843.483805-1-inochiama@gmail.com>
References: <20241223005843.483805-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: platform: Add
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
index 3ac32444e492..6ce3e538ce0a 100644
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
@@ -552,11 +563,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
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
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
