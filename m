Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B4C9AF671
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 03:10:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F39C1C78F6E;
	Fri, 25 Oct 2024 01:10:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 518C8C7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 01:10:33 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20c805a0753so14393445ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 18:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729818632; x=1730423432;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObJWQqbamWQLgW3lRvM1Wb6QskCzdsvaBlS+OW3U2H4=;
 b=R9LQEn4rO5Nd61xZS7BjJ5o7C4Lr/2LDFxvS66ll3ZDlsFIE+hh7QcND7pOKFty157
 5KLzQR2do2bV+mJ4Ux5vX8xqu2m9913l/XgvLV4Eg3G6tksIp6MnagaRmEAzh6caf5r8
 JFi2fFzLdUV52wDNf6qLJH/wwRTzPFigEYvD+5hR1mRQuaBRDOUfflcbWE9rD1mZrgrZ
 vJYgOZ3BGwECZeikeS2zhBDCq/sk3GMZ/fq7L3sHPnY9FBcHVbx3QOOZz2chLBsRkXTw
 DSGaPuy/bEn3sgq0ut0ezyuB170j6OI9M43jKQWrXxtCN9cdoFJPTvXqUWCVOCDS6RzU
 eGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729818632; x=1730423432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ObJWQqbamWQLgW3lRvM1Wb6QskCzdsvaBlS+OW3U2H4=;
 b=KJIVw6e89y5xC/t8Hv6CzUaLusl+0A+m6SbLgZev0r1rS3lbUsQ5EFcW6MHhgt1FXG
 383KXcDiTwVe1LVQVhWU5ePIPdO9XoBbJFr01cwQmSYsoAYM+GfGUgb6jBB3l5vfz6aN
 P1weVYIgRaqRXI33uEp2JAQBQR2btHoQE9PW73V+9vKkSN5zgUe78M4IvGDizPmQe4BA
 HzXqUOFlDgxGuICyRSlw7AWXFJ34p3qMWQ54UcrRqen6cQZNXEDAGE2RWiqWn40jmPK6
 Ot0RO10hl5e8ivdkrQVIyeRZbHoY/CeKGkJ4mFYjfYNEiAoH5nmjOjOiy72OYAg0N+wS
 AUBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG0yPBZK9sevmRppXo4f/rQlEm2qHjkNdfUp0Nun3jo4hJFYrHnLCBhJefXES/qccwLEVxJ1N8S5dLQw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwCZfy/AzQd4jgozgd+lz1lYebjMOcIf+7FxBO/0AxPQnf/QPn/
 Lg6Vr7T5w7NwRzdSzghZMgAPMyJlJdvuujJuYEuZhXFd6y9lkmOT
X-Google-Smtp-Source: AGHT+IFk4pp3atZr9i1HsCbtkP4FZ9g8J17pYJBoFXxA6qZJ156yPX2XT6nPSSu7qjRYC7DcVFlOKg==
X-Received: by 2002:a17:902:cf10:b0:20c:3d9e:5f2b with SMTP id
 d9443c01a7336-20fb9b382a7mr56934405ad.57.1729818631749; 
 Thu, 24 Oct 2024 18:10:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc04b201sm559595ad.272.2024.10.24.18.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 18:10:31 -0700 (PDT)
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
Date: Fri, 25 Oct 2024 09:09:59 +0800
Message-ID: <20241025011000.244350-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025011000.244350-1-inochiama@gmail.com>
References: <20241025011000.244350-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/4] net: stmmac: platform: Add snps,
	dwmac-5.30a IP compatible string
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index ad868e8d195d..3c4e78b10dd6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -555,7 +555,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
 	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
 	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
+	    of_device_is_compatible(np, "snps,dwmac-5.20") ||
+	    of_device_is_compatible(np, "snps,dwmac-5.30a")) {
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
