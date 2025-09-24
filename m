Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C064BB9D86A
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 08:07:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D755EC3F94D;
	Thu, 25 Sep 2025 06:07:38 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53342C36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 15:22:26 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-4258bd8c19bso10192105ab.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758727345; x=1759332145;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GpJzLeRv3JvJ6Rn4+qItSuKPl8oje1EaG6ybTvv5B8g=;
 b=C4RpiLW92s9HPDSNfBDD2PykZ0dWU2RF6jqiGGBIEx3Yf25zj+S9tD1TF4iPAulcvL
 tNqOpdNdKks7PUwVQ0E8XQYMx6h5wtyC/d3unE6Qxclrc7vlPEdY/5fWWV0bIi51gurB
 y2vo1Q9EEWONyGKy9cwzGhzAay/4MsScJJ1XKTc7MnpU9NGnWYvFsIjGXXB3B05nhgL5
 0sJrkyNmwSeq7pgDz8ZutT2P79iDrJ4Rk44nD94z2RVMVkfRLIiBR3J7W2icB171l/li
 wO8N99VwH0aQ+f3Tdo9Pjo3Y4Qu2H28nwQCkS3uBMuDEF8zpZytGchYXLMuV5knD4H5d
 2w+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758727345; x=1759332145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GpJzLeRv3JvJ6Rn4+qItSuKPl8oje1EaG6ybTvv5B8g=;
 b=cP/xZNNhDYqbktnaKvoJ6nWgXzRKThTvvv/9TqTkmGsVPsDQE3DNT0g26+mEb9PQ1P
 lzijat4/pC4yxbZD7MOVwDf7Z+dyNn+NGOlZIXiv9HsJRaXco1MPmt9pJ7nfjnOBjb96
 DT33cAbuEjd8Qscjo/g2vHd0JQQfKprmatQaALIgmiU++fYqdJM0a+SuVMvgDC/lx3us
 CalqKS8W68hcIkQuVaY6WwpJUK78f5Slm9SPlZ/1FjkAfSPsGL1QYROLlJxbuESUmj4F
 QU16dcpLdp9Hgb87bnvT/khu4y6xcyg0keD8yah01dnn/N2PWZ10JnhPJ8uhx1Eo4jlP
 tlEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHWx+b6BPaQq0DQpLFPEYOiDXXPa/NOTTNcloOhnOCnDksDEeZaJFeDaGOjR8/7u+H/+SDDXq8euizhg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy7Cty7L0kia94Dl7AvoG4XONpngRdgKlaTxwmkkjgfpry3V1Pe
 LY7sDH7Ff5gLSBvl6iASYPQTpWbSAIDyammm+IpA/FDt73UEONdTHKRz
X-Gm-Gg: ASbGnctHKF204vQXmLJGHpnZloHWpcZCHQgPjBu+5EdYPnUxJhQu6nFxYdLbi8yyuin
 oaNj6LkZCnyFpmWjsGRyUw52hMwEhqnvvWUtK6G0xUg3odax+sAmFP9YwmLSu237ghZlWTxjc9a
 DAZ5uxNQkz0YM41Zk/5/ptveWNTLlDc/oakqRmwpNu6CNj/8Ubv5KMOBVb1UsCGEq0r8C/4I3G2
 mPs/8T2vpK0tlW1EaGHMlxaiz9EPw3GS2sAkuyuaPAspb4X9rIBRDQmdlR3bJz2n+oNF49nzceM
 8kYoIYZkqtYR29OuHBD+9gCnVMLXA0KdVkRRc7o90LJC5vcsartH3czmOholg4MZ/LEYBt5hyjN
 wuik1/u6MiK9e63gtMYv5VQDiG20=
X-Google-Smtp-Source: AGHT+IGIwXjPAbpzXy2+r7fwj/06ZO4SrCKju2WlzvWmjdH68NQxMQU95BaeD2UiUHkahmoqPGREIw==
X-Received: by 2002:a05:6e02:228f:b0:3e5:4e4f:65df with SMTP id
 e9e14a558f8ab-42581e0fb6emr107166725ab.9.1758727344790; 
 Wed, 24 Sep 2025 08:22:24 -0700 (PDT)
Received: from orangepi5-plus.lan ([144.24.43.60])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-56150787e91sm2786797173.51.2025.09.24.08.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 08:22:24 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 24 Sep 2025 23:22:17 +0800
Message-ID: <20250924152217.10749-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Sep 2025 06:07:35 +0000
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: Convert open-coded
	register polling to helper macro
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

Drop the open-coded register polling routines.
Use readl_poll_timeout_atomic() in atomic state.

Compile tested only.
No functional change intended.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 28 ++++---------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index e2840fa241f2..9e445ad1aa77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -135,7 +135,6 @@ static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
 static int config_addend(void __iomem *ioaddr, u32 addend)
 {
 	u32 value;
-	int limit;
 
 	writel(addend, ioaddr + PTP_TAR);
 	/* issue command to update the addend value */
@@ -144,23 +143,15 @@ static int config_addend(void __iomem *ioaddr, u32 addend)
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present addend update to complete */
-	limit = 10;
-	while (limit--) {
-		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSADDREG))
-			break;
-		mdelay(10);
-	}
-	if (limit < 0)
-		return -EBUSY;
-
-	return 0;
+	return readl_poll_timeout_atomic(ioaddr + PTP_TCR, value,
+				!(value & PTP_TCR_TSADDREG),
+				10, 100000);
 }
 
 static int adjust_systime(void __iomem *ioaddr, u32 sec, u32 nsec,
 		int add_sub, int gmac4)
 {
 	u32 value;
-	int limit;
 
 	if (add_sub) {
 		/* If the new sec value needs to be subtracted with
@@ -187,16 +178,9 @@ static int adjust_systime(void __iomem *ioaddr, u32 sec, u32 nsec,
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present system time adjust/update to complete */
-	limit = 10;
-	while (limit--) {
-		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSUPDT))
-			break;
-		mdelay(10);
-	}
-	if (limit < 0)
-		return -EBUSY;
-
-	return 0;
+	return readl_poll_timeout_atomic(ioaddr + PTP_TCR, value,
+				!(value & PTP_TCR_TSUPDT),
+				10, 100000);
 }
 
 static void get_systime(void __iomem *ioaddr, u64 *systime)
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
