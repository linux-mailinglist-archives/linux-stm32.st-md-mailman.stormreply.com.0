Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF5CAD1927
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jun 2025 09:41:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C578CC3F94D;
	Mon,  9 Jun 2025 07:41:22 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A38FEC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jun 2025 10:21:03 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-606b6dbe316so3596425a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jun 2025 03:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749205263; x=1749810063;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MiiOBFHtT5ZtQA/f0RodEb62SyXtn3/Wda9R6Uedtxg=;
 b=l6Mds30YmkElKBcDHD3yX96DJ8hPL5aie2GiKRHn6U9gANuqlrIlcy6lFKf6vn+neV
 sl7HbKdVMC10Uac4qfy08ftNnBGNN0UnVN5zI5DRAVxmEH3fV32UpVZb1iPY3Ojwu298
 EvgMj2f6G8Q2hACbQp8Mxs0oiMAZSX+k+HEJY99u91pj9UoSZl3YrBsEuphT5AEJEUzt
 uvWyYr18mGFjHIknou/nvq1es8LUcPMQMNEjdZjTbqC8FMV2yel577Qcfjlp1VOLWT+N
 GR44ntR/3d75dV4p7aEMSOL3okRz/K/Ddb+JD2O3Qq61m1VIlMNFPC0DC1fPtY5OMygR
 ZfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749205263; x=1749810063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MiiOBFHtT5ZtQA/f0RodEb62SyXtn3/Wda9R6Uedtxg=;
 b=H42wH4my50o0tZaWuRwBC4IGH9ZXQNurf/LGlOzIG/XHTRwX//g5sjVKJeUCDcZpp3
 USFWdDq3s694awBeSj5H1KjWUI8vqfvqZchAv8Qxw2t87CZTi5aKIMRODGZz5rsUA2DN
 C2W64xlOodNf3RwdzN+U6n5wPLi0HdMlrfHI/tB0bQnw++95nuhI4pEV4yQK+MuTi0b/
 a+/ClkgOnY7FubZa1mNPZYjQXmCEE51LlljT39NDOeBOC0Lf9d/ic1Fj+ZwaRqYNqruD
 EuZaH71njDgN3LG6yUdHal5kNBfHjGQQuRATgAxCXc6YTAWsy4LGIagMpIePh7fOD5e6
 VD7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAxw/5ZR0VYyPGGbupwjnydQ4xkyE63e7lz6ZhyZvdoun9p4KdP2WDLYprZ//IIh91hVysLx+SP6Gj8A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwfmdkkIhZVbCeAl65I4DtnFnrpCJmkw2qb20Q6FMwat33owIvM
 M8Gvs+Ix84cmQJ4K+O2gPaooDQcH+yRVnLuQeilsDmqEN+2DbJauQDXt
X-Gm-Gg: ASbGncv/ZTTXzA3TIYrR7zrimxq1k1AIrUO5AyEF0fEhvf5uG1z5ruL7PNNkXbq95vj
 +faSkDUCfbosdPU/wPYY61RC+CSPizb+6OeCn8LLYx9M/SwDUqToayVGyMTqPUNF0rKrLlghAyg
 MAAyTz7AySaxZE9ShY+XPZyYwo/uCE/XzbGyZDiOxkWh5z+YTjNbpX5axtjcqfEctjbySRtdBOR
 rLJKzFoYcVi8BRThJo2tEBG8XFG5XNHPmju90+GhGqnV/r5tnB/nudP7PbKkr89IBjjZh/AArjY
 9mvsuUOX9WPN9BixJsM47Pfyn32MP1bQpgVenkH2mzLsmHdz4BrDJWHIVWmjPtS7nNVzPiCkfZA
 =
X-Google-Smtp-Source: AGHT+IEhapm1K8w4bky257wfwPuqvgCoQuQfxgO95l+/hUIeSvoPyiy84rQ6sHS7x6VE6POMwqilxg==
X-Received: by 2002:a05:6402:1d4b:b0:606:f836:c666 with SMTP id
 4fb4d7f45d1cf-60774a856bemr2463366a12.30.1749205262677; 
 Fri, 06 Jun 2025 03:21:02 -0700 (PDT)
Received: from archlinux.ad.harman.com ([212.133.80.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-607783dd3c5sm809256a12.57.2025.06.06.03.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 03:21:02 -0700 (PDT)
From: Bartlomiej Dziag <bartlomiejdziag@gmail.com>
To: 
Date: Fri,  6 Jun 2025 12:19:49 +0200
Message-ID: <20250606102100.12576-1-bartlomiejdziag@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Jun 2025 07:41:20 +0000
Cc: Wojciech Drewek <wojciech.drewek@intel.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
 bartlomiejdziag@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Change the busy-wait loops timing
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

After writing a new value to the PTP_TAR or PTP_STSUR registers,
the driver waits for the addend/adjust operations to complete.
Sometimes, the first check operation fails, resulting in
a 10 milliseconds busy-loop before performing the next check.
Since updating the registers takes much less than 10 milliseconds,
the kernel gets stuck unnecessarily. This may increase the CPU usage.
Fix that with changing the busy-loop interval to 5 microseconds.
The registers will be checked more often.

Signed-off-by: Bartlomiej Dziag <bartlomiejdziag@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index e2840fa241f2..f8e1278a1837 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -144,11 +144,11 @@ static int config_addend(void __iomem *ioaddr, u32 addend)
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present addend update to complete */
-	limit = 10;
+	limit = 10000;
 	while (limit--) {
 		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSADDREG))
 			break;
-		mdelay(10);
+		udelay(5);
 	}
 	if (limit < 0)
 		return -EBUSY;
@@ -187,11 +187,11 @@ static int adjust_systime(void __iomem *ioaddr, u32 sec, u32 nsec,
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present system time adjust/update to complete */
-	limit = 10;
+	limit = 10000;
 	while (limit--) {
 		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSUPDT))
 			break;
-		mdelay(10);
+		udelay(5);
 	}
 	if (limit < 0)
 		return -EBUSY;
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
