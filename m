Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69723BF0560
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 11:56:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A930C5A4E4;
	Mon, 20 Oct 2025 09:56:19 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FE19C5A4E3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 09:56:17 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b556284db11so3598404a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 02:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760954176; x=1761558976;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dZEu6atp1wquusXB2V3FIm0pgDgjjEvvFZHTGTlW15k=;
 b=mY55xWU4csD8IJehA4v7GlZ8TIMyTTqAJpgHb2q5pqOGf3jsLHp+AUWYaPuYOcqzn4
 IzN3zidUis7kx5jPcUWNqhzuigMPoE90oYRrvv5fZe6+7vzDpSsTjb7nT00QLCpaj3FE
 NtcxQXZSDGGydDeQK/87KrIPQfSOl/+boTDREgVQJ8cB+sTBeREecJx5rHb0Lvb5R1dH
 crf7ZI9jpzA2+s2kCqBlskXq48FUv4zbEmuK+h354ySr5wuNeTbtLP4tmeE4lYsAkHr4
 /n8U1ha+5NAv3Gjazweu5iw5qY7EvzMRk5n+QefJ/xOT5947aOjsFN0K1YtX/2Djk0RW
 rZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760954176; x=1761558976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dZEu6atp1wquusXB2V3FIm0pgDgjjEvvFZHTGTlW15k=;
 b=AFzmJu8dqOs+/KRC+k8LGRkCmjM+Mx/gDXQn4oroz+zz54UwEQXv6rKcjGWJ/vaDjq
 J/XY4JRTpzctNkC3y3naClGX5pUmVaAKLGRVc9PqvUrDjrMRdA6mycZ96EbyIfq+3uTA
 +sGuUiB4B9rrjlgH1MT15iO1nmlW/ZnAecqfrl/rW/AeinL+cxm078uap1SKu44jcPbx
 z75363o6Hsq85jPlle+1gOSLE14mnlK/VqXJAqsAQErgR0Z2HjKLjOvg1MT2Yn+ggkFn
 H+JTVDfNIbmfXbQXEsclnE0p5neyV5iZ3oqRQZ2WPrmiwKdaGv/OxQiMlPJX9hp5iPRK
 pQzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCViCQdU2zUCpwUMjrlETWAisS0KUUQvJr65Td0GdpwNvu4yHRKasoRUWrflsHeWZhxb9U/2faXUHrAqxw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwJkpdKCpD1AGjYWVA5MjJC/m2LW2bqFC28liZrbszDxOyRGBsY
 /xw3fGFxTpE6WWJNahWlNtmX0oJ95iQ3jFZ7zTPgiL7uHxzlCVd80hZx
X-Gm-Gg: ASbGncuw1Ql0YlMdOFq7QkJ/RVAQkMAb3cWxXELoXtxxQW5mN3drd8M1LQZjSBC9ZdD
 FE96M+JrswpsutrDR0iWH1r80qfL+MhKhhqySHtzAk729Jo9xJF2W/y/7TBb6Fllk42MDRBMlPZ
 /py9UvnqQeRLMLjO9bKy8dp5boLMKRUscbEMAzs9KwWj0SzQV/KJl0vRXXWo4jRgPCUwihfo+MK
 JeNVg3hMbC9TfVNzbPaom60I4LxptKck4Dwf1rmz/rrh04kISUsijB9xtbuQAPK8qs9Puy0wSiK
 wq/xehek7eJwdB/ImqV2NNJi0rS1k2KWRdCqutkZAJQAy3A+x60psjkbYuDpM+WoWjDE2xAHINZ
 a3oV/60Qqovfz41EoVR64lw6Ky3VBkIpGCtt5aKjdJXpziB4IN5OSwV9SqHzhG2gaNcKl3sXUnc
 w=
X-Google-Smtp-Source: AGHT+IGGbVMAvLRNPJzY/dwiHRiAXKBM0roNWAjS8uuWlxmmRK+1VU9M3wcXUApOTf5kLg4NLvhkzA==
X-Received: by 2002:a17:902:eccb:b0:28e:80d7:662d with SMTP id
 d9443c01a7336-290cbb483demr161050105ad.58.1760954175971; 
 Mon, 20 Oct 2025 02:56:15 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471d5794sm74880555ad.53.2025.10.20.02.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 02:56:15 -0700 (PDT)
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
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>
Date: Mon, 20 Oct 2025 17:54:59 +0800
Message-ID: <20251020095500.1330057-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020095500.1330057-1-inochiama@gmail.com>
References: <20251020095500.1330057-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/3] net: stmmac: dwmac-sophgo: Add phy
	interface filter
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
 .../net/ethernet/stmicro/stmmac/dwmac-sophgo.c  | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3b7947a7a7ba..960357d6e282 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -7,11 +7,16 @@

 #include <linux/clk.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>

 #include "stmmac_platform.h"

+struct sophgo_dwmac_data {
+	bool has_internal_rx_delay;
+};
+
 static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 				    struct plat_stmmacenet_data *plat_dat,
 				    struct stmmac_resources *stmmac_res)
@@ -32,6 +37,7 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 static int sophgo_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
+	const struct sophgo_dwmac_data *data;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -50,11 +56,20 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;

+	data = device_get_match_data(&pdev->dev);
+	if (data && data->has_internal_rx_delay)
+		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
+									  false, true);
+
 	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
 }

+static struct sophgo_dwmac_data sg2042_dwmac_data = {
+	.has_internal_rx_delay = true,
+};
+
 static const struct of_device_id sophgo_dwmac_match[] = {
-	{ .compatible = "sophgo,sg2042-dwmac" },
+	{ .compatible = "sophgo,sg2042-dwmac", .data = &sg2042_dwmac_data },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
--
2.51.1.dirty

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
