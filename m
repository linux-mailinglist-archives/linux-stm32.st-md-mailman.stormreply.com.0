Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EEB9AE504
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D45CFC78F63;
	Thu, 24 Oct 2024 12:39:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A52BFC78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 10:36:54 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-71e79f73aaeso2994531b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 03:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729507013; x=1730111813;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObJWQqbamWQLgW3lRvM1Wb6QskCzdsvaBlS+OW3U2H4=;
 b=mx3J1GBbV7vfWIchdgIq49eGl3w2e9PndmGv15U7aSwNblZq+O1DPb52qQnbxG192C
 yO7fiuKlyuTt6xFrxEBB/wZlQTnI4rLZ0PayyMWMzaxLh7xpguy7fxLGITvp+nn9dynN
 Cy+Ld8JmamO1QrkXLFHT1VZUsWLhriKz0JRU8l3EjKgq+bTHrHMA88G36yO1etZIAimG
 jsdT8sVv5nvedAwXajEunKlH9/te0ancTcGnnqbdNacaD6M361MpKeffhVNOxsxXYP8G
 ZovQZ9SFol3mrCsiLAsct8cG8hw9z6O4iz87RJJwFbzszAs2F/IlDIchj+/cmjWvr2aI
 sg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729507013; x=1730111813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ObJWQqbamWQLgW3lRvM1Wb6QskCzdsvaBlS+OW3U2H4=;
 b=UjspzUDGNCaxjKfUgrpo/vFLqiwq6LPnLru9UNShZ4dCUt9/zb1PG6m4lIBRtaH1RA
 CnOO94o0ISPyB8DM8eeArTAuFXY3fIAx/W7MUlUa/C8lC7J4Z3wuzg/GfOtYQr75wS8i
 +DTJ5l5rtB508X5AMIHThd4GPeOo+DsBn8vxNy/kxTHdGL87I84wg/rdTEg0AnOQwROp
 IANzD44j1VXPE/Kyx/HbBVLyMT1ByB0Qu9q3MXFw9G+0HfFu8jweD9/64a4L6YdbujhW
 t+Z6gFFoVdbCnV6mJpjLqqb/c40Z1tQsf8kGQHKBuh9AFl6C3qp0fZR9KBrIjmKnur+Y
 AYFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYhlwsUYStFrL7CKFmu7hrOd2No4U1dctkhiZ/YPmLRWddUZBzqYBK9vBN4PlTdfJsrm7lBb03Jg+zfg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5VsmU7xSNmnGv9QtG50teRzqMnsTn0wpYN1h5qz/quQKsPjKc
 BexAOIy3rEe54wjIE5wCHH6+Mn2RkDYIxV23TUntk1WAymktvIC9
X-Google-Smtp-Source: AGHT+IH92yYXC4eqDoteqMVnaKaZwnewH6U4taRuuS75GAekpZY3rtWoFcqSB+3PqyFf4WP9/QcVHw==
X-Received: by 2002:a05:6a00:23d1:b0:71e:6f63:f076 with SMTP id
 d2e1a72fcca58-71ea31927d8mr16089602b3a.5.1729507013033; 
 Mon, 21 Oct 2024 03:36:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71ec132ffc3sm2556008b3a.62.2024.10.21.03.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 03:36:52 -0700 (PDT)
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
Date: Mon, 21 Oct 2024 18:36:16 +0800
Message-ID: <20241021103617.653386-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021103617.653386-1-inochiama@gmail.com>
References: <20241021103617.653386-1-inochiama@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:39:11 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/4] net: stmmac: platform: Add snps,
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
