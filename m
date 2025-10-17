Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 029EDBE606D
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 03:18:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E000C57B64;
	Fri, 17 Oct 2025 01:18:54 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CFFBC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 01:18:53 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b62ed9c3e79so920921a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 18:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760663932; x=1761268732;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2WufNMZZ/3kF+kxCtpxLWUmoQMaWHtLSOKhsUHckblc=;
 b=Y7MnBcqrO6/02LyJihuMLs/7RuPHMMPETsT3vT1eLogkeV5SS6+HWGNjsbhIztwjCn
 zO4atYgq29qk1VZFn3MCrBJ04PD7cKmimnhs6QE2kH8wL8FAgYgQR6JO9RBvRzz1hi6b
 8B/HcoJC7BUYb3RGCn9gHC7MGnQW+ApqRbYID0C1wDmTP7ToN4SEHkTRwXFIAEkb76O4
 4edPwIcvw8DTelaGJxwyiV2E9+7tvGbmoPOCJfZ1fw3ulIjhbBmBbAz+hFHn07hNWZOM
 kyYIxC+Tkq+oKBf/2WW/zr8rf/twJsuxy9kA3hNr0CLdurk7NsEOlnmtjJPB2ScefZwY
 TIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760663932; x=1761268732;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2WufNMZZ/3kF+kxCtpxLWUmoQMaWHtLSOKhsUHckblc=;
 b=dopaDaU1uBAQaT988Pi0QQSZyl45/6Gn7k3XNLo55vvAlaH7Q1JLNa9UlUNSR7tXNN
 Dz0UXnuuyxUIpqghME71iVCo8Aa5WBuOZRDgdMmdJtXgeTt85mE9OSXgY0iKyyB3Ev/Q
 nKFkNde/zk8mZfLSJFtyGfuOISOboLsTbzp13UKs0TXjvxeuco79Mf4lHRVePjzWqEWg
 Tyx/+a6dc5VZJsAv9uEZT1bdHzXDyDf/f0kvqTfjTGYuWFFGkw2q0rmRuiJHSMJZQwD2
 Xf60WAB/JGTYJ0iupGNW5PfsFHQv4mIcVQ4BF6boRzPHsL5IftKTdM93o1rUks5o1l6z
 zElw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTPCG8LOJw3JaHplj39nbnkFs3sviviisigITsRY4ClmQEgNVjEC4bP8sU9GTOe4FkNV0XAN+oQPFrGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YywqFfqhyRKljj/Bej3+p09cg7x4npZ+12qK8jmvIdG549Ct1sw
 QjnOWE0IFvK/bRr1fmRlVvCA0UfBbKAM0hQMgyq+y/5KDjjRQtJ+gVp2
X-Gm-Gg: ASbGnctAILvEODZ21MPlYzUuMuIHu0optNTXLx1yFsRMDMIdGSVWZ7NoCblC1nCQs7j
 bmttaXAulR8UzMgnD4Aa2hQf7LmxufjHGDE5byljET8UW6n1eEzI/3GrKqniiP59LQwIsre/HWS
 TbJonxuJkV4wb8LvLDpL1PunbbgfwXxhGlxbtAS7H+m1qEKX0BbwDpUDBkxqRbSPky67zCt0awL
 XdjY87gFxJR9v64n2yzu86QnCh+Orkr39/dlT/njitQ46uYP6TAJFbr7KQIaEp0BlYUPA7aCO3/
 pvrirMKhw6bXcG7a8oTqJycQwq+6kzOWZ6UW8Ldv/eIxbaYH3f01lRTRYjJTAZGpBWhAvmwcJ4d
 7cnqWQ9mkzjfGtMZJ8Wov8+ULfCh2vvS/yYyRPjebDEpPpYTLxfiFWepCbheoDQgHORFyZpeZg5
 k=
X-Google-Smtp-Source: AGHT+IGCscuN23O1/GUCRY7mt5g8A0uy7Km3DMtv6zREsA54udw0SWdK9cRyXK5d1lQXl3K9mp81rA==
X-Received: by 2002:a17:902:ce0f:b0:269:8d1b:40c3 with SMTP id
 d9443c01a7336-290c9cf344bmr22801155ad.12.1760663931864; 
 Thu, 16 Oct 2025 18:18:51 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29099a7b032sm44355765ad.63.2025.10.16.18.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 18:18:51 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>
Date: Fri, 17 Oct 2025 09:18:01 +0800
Message-ID: <20251017011802.523140-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-sophgo: Add phy interface
	filter
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

As the SG2042 has an internal rx delay, the delay should be remove
when init the mac, otherwise the phy will be misconfigurated.

Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3b7947a7a7ba..b2dee1399eb0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -7,6 +7,7 @@

 #include <linux/clk.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>

@@ -29,8 +30,23 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 	return 0;
 }

+static int sophgo_sg2042_set_mode(struct plat_stmmacenet_data *plat_dat)
+{
+	switch (plat_dat->phy_interface) {
+	case PHY_INTERFACE_MODE_RGMII_ID:
+		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
+		return 0;
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int sophgo_dwmac_probe(struct platform_device *pdev)
 {
+	int (*plat_set_mode)(struct plat_stmmacenet_data *plat_dat);
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -50,11 +66,18 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;

+	plat_set_mode = device_get_match_data(&pdev->dev);
+	if (plat_set_mode) {
+		ret = plat_set_mode(plat_dat);
+		if (ret)
+			return ret;
+	}
+
 	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
 }

 static const struct of_device_id sophgo_dwmac_match[] = {
-	{ .compatible = "sophgo,sg2042-dwmac" },
+	{ .compatible = "sophgo,sg2042-dwmac", .data = sophgo_sg2042_set_mode },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
--
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
