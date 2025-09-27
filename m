Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF4DBA8098
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Sep 2025 07:57:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6522AC3F93C;
	Mon, 29 Sep 2025 05:57:46 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FD7FC349C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Sep 2025 08:10:53 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-42480cb42e9so13477545ab.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Sep 2025 01:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758960652; x=1759565452;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lQUetzEQMP4LAhqW9E/G21GQbOBqRaYhD1bJwLd7FZQ=;
 b=juOGKlzvveZq64v60i1MGFobjAN+/dOR6ZBFkXga0Vz4F61TA9FbcVY3bKVZV/jz9y
 /gqOD6DchvKWyiOTcKsA1n014VP5q/ID+k+XIvjJ9UZrc4qbSntG722ESsGVQJKIBhx9
 UGwNEtE7pjc0GLkA4Uv6ipfRtTovdqH7SIXM7bVZGCxfs+NLIC6MNv8zYbDsKou6kvDG
 yRUF/SpDQoAc4LFW0XkCGeNGdkGM9mmPo9k3AO9mmkBRZNuNFPAVaZQXJphCkLAQNZpP
 +Pb0/J7To00EcBprkamJvzrwtqgp2PeSQOUbt393xXsHfW89hlGctkxcEyDwYyUVHFvk
 8xVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758960652; x=1759565452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lQUetzEQMP4LAhqW9E/G21GQbOBqRaYhD1bJwLd7FZQ=;
 b=HGeA3yVPe2JNH3cz6YQdB9asxn346IAy93W5tUCV2us9pNGuPCh3rW4fnba5y4Il/g
 GR7Vcrbq47tXA+HMrCQUoOpxRxfgiZz/yqNvs5xeBg/i3rAZ/Tsw1WugKbaKSMBJ+HZ5
 ngVT8Lx6/CM5vqPyVsujfw3uXowHqacO16xjKJ1zBF0vTXpPri+fdhP24OtSDeiq/blM
 XPTqpi3K7dQqAJJ9vjbAhTyNldp8b2MbTuNIA+JCuevX3TlIyqI+6W1JlAsEi7H3p2oF
 pBssiii+Lv/IpQKVGBaFaZ9CmrNnN5YV8MauiTBJosfqGf/rKVzLrXp5yZtN8lb7/6gT
 m40Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYvOrd+RU6A1phfjY8/fKmsg3IKBVGcFuHvfOmcQAfYj0EExcuCBGHToeJsdgAbFJFyWxg6LflCRI+SA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzjRSiqhWXk4YBiAlnQWscTEUfTHMmtMFT4yjXUMC0gUOlvNOcK
 AoI63EIpTDd+P98vy2G2AtfjpcrDms5xR70pcAlKKJvOCz8tjsAaiuCl
X-Gm-Gg: ASbGncv2Enj+6+XtwpuFPNLmr7u7Trh1isHlX82BO59h7bFkgGAI7ONGsCIYiG8/YPE
 vqggMOw4m2Oi400N065s0QjUUbaOTKHokrsNbbLROYZt9ZJZu/mjdX8/3/qMFEtzi264f+ypxaF
 NLHv8YVOyc4gGcw60IVw1MAT+DQVEUSRSDV2xTbsckEg3LovCIDDVl1O08IYUlibBAfLWWJVtJq
 pmmVYYb367oQv6A+mHcfnmiQkdhalCmXY1VtFOg1dW+7JhD1P/ZSOK9fm4g/LC4W2iSG2SGG4Xc
 Hk/dAfAvt4WLsE31JxVdA9/wALxBhxkBH2WDcLL046eq6a2ANvsnJrvYYHH8OmK3MS8DmqfEIJ/
 pESPzuVYAprBY1SCET3iMsClJZ6H2YCo1d4KDOQ==
X-Google-Smtp-Source: AGHT+IH0IVO5vzLeRO4V6lWOrPlzDHkhJS4CVNTknktDnTu3FcBbSqcFVPYeFHLy8GA/XY52U+1p6w==
X-Received: by 2002:a05:6e02:1a27:b0:426:5a34:77ec with SMTP id
 e9e14a558f8ab-4265a347968mr138432705ab.11.1758960651856; 
 Sat, 27 Sep 2025 01:10:51 -0700 (PDT)
Received: from orangepi5-plus.lan ([144.24.43.60])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-4282de12fc8sm10852155ab.3.2025.09.27.01.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 01:10:51 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 27 Sep 2025 16:10:36 +0800
Message-ID: <20250927081036.10611-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Sep 2025 05:57:42 +0000
Cc: Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: Convert open-coded
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

Also adjust the delay time to 10us which seems more reasonable.

Tested on NXP i.MX8MP and ROCKCHIP RK3588 boards,
the break condition was met right after the first polling,
no delay involved at all.
So the 10us delay should be long enough for most cases.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
V1 -> V2: fix code alignment, update commit message
V1: https://lore.kernel.org/all/20250924152217.10749-1-0x1207@gmail.com/
---
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 28 ++++---------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index e2840fa241f2..bb110124f21e 100644
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
+					 !(value & PTP_TCR_TSADDREG),
+					 10, 100000);
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
+					 !(value & PTP_TCR_TSUPDT),
+					 10, 100000);
 }
 
 static void get_systime(void __iomem *ioaddr, u64 *systime)
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
