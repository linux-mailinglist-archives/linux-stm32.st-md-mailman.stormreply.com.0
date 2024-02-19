Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910B85A937
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 17:46:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55AE2C6B460;
	Mon, 19 Feb 2024 16:46:15 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30426C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 16:46:14 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-563c2b2bddbso6174429a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 08:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708361174; x=1708965974;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RNjiIU+MnMIcoYvV35lNchbg525xkgaHmjWjHQnrgAI=;
 b=UM2ZjqaCEkJSvHP6KksLZbDK35dqogs7COCnbHoB5HCZgO4hXQsJ+oI9Dx459kN6hV
 eZudAgBXKxJM1951yZy7mmWF3wBn/uDa4dmTjdFLtPPEUpPz3qMG8kFcMp0iq/Rway1a
 lT07Wjqc3Eleh04tnUiq9VW9klg8aR7WzpzxlfR48Sn0KM7poxcAzNte1lwhaEPIheYW
 MKpCHIuNIgdxihmlf8VXRIUPKTM4UqqiaauzEblwFhMqqrSJGDc1Ja8yMLSQT/81FjJm
 7JmbXynBF5Hfs2hYL2Qf/fbJ4skbEANoiBV0M/Gu2fek6iBFS9Vz1paLhIBWjaY16Fvu
 B7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708361174; x=1708965974;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RNjiIU+MnMIcoYvV35lNchbg525xkgaHmjWjHQnrgAI=;
 b=QmhzB1zdTbt36YeHwX75d2ZTvLXHiXhFidoabmDH9L1cLXu5t7/iYltvPCzJ5bBXos
 epeMnizdRvowo42lALwF9lRKp7haWJJVnvUYTGjMz45t5A0LF7tvS+IEJaWjWommMyn6
 Djpa9e6xiKvuDZbyJVZya4BISBg7Aq5ODr/2Vf74MocWqAlP51uk0yXO1S4fm1Lp0x4S
 jtTCt1LuqzOnFT1e/pXQ/VU7G01+OyklbVPvrqSQzzPkFwkG5swJ65iQlC2NZJFa0VF5
 qRhsiK6BOjr+ImEktcRDv6Rne6byZ2Kqd4kH/MQ6aoIGUkfO0boxaq+HsvEFYr0i38Nk
 nv9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR4GS6JxyIihFaSf27ZzUTtGBilayUdk0QlZj/Au5ePiIjaOUxEFCcmGuq4SmF6oNYl/VJRS0yxQMX9UkIOlJLQxngSZWNqU6OWThraVHF8Q7pxUao/pBA
X-Gm-Message-State: AOJu0Yw02soNNywCAJauJaZ9gFLgGnlD0nKwdFBaOQfFsx4A/CGOY7wC
 EGQofDmh5jhD3Z9abL+WW5zWpEwyO8VlxWkAl4ybLKxh2Iwot0UANOwmKqAM
X-Google-Smtp-Source: AGHT+IFeILrgwOmdxu67ncHUZUE4nXhvuhlNOkspzkSZnFXnnQtvp7fWPgo27EPTD8QyCHtOOaECPw==
X-Received: by 2002:a05:6402:2696:b0:564:15b:9f57 with SMTP id
 w22-20020a056402269600b00564015b9f57mr5925624edd.11.1708361173701; 
 Mon, 19 Feb 2024 08:46:13 -0800 (PST)
Received: from localhost
 (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 fd11-20020a056402388b00b0056104738371sm2837765edb.65.2024.02.19.08.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 08:46:13 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 19 Feb 2024 17:46:06 +0100
MIME-Version: 1.0
Message-Id: <20240219-stmmac-axi-config-v3-3-fca7f046e6ee@nvidia.com>
References: <20240219-stmmac-axi-config-v3-0-fca7f046e6ee@nvidia.com>
In-Reply-To: <20240219-stmmac-axi-config-v3-0-fca7f046e6ee@nvidia.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=treding@nvidia.com;
 h=from:subject:message-id; bh=FahNwLbVWpd8t2eBaIzLF59MdYIoMLjB5FhApvU3UBw=;
 b=owEBbQKS/ZANAwAIAd0jrNd/PrOhAcsmYgBl04XQ/0uAEXnL2R0DFCkdbK7AgOwWu4oUXANiH
 26R0FoU+QeJAjMEAAEIAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCZdOF0AAKCRDdI6zXfz6z
 obeRD/0WpBZm0htLrSxWNAacexNdC3abLvhbs3ndyfACIDGwCU53kDkEqlMbz0gv3HT04VBGnie
 9cn8oWrdmfouSWku3KZy0B13uPUOlZigCDOixje6BB+14wxnEDra8af9OGSLO+v0VjlG5rFs5Nk
 0vMV2SH9hkJ0ArDHFp+9H3KSKRaBMIgkGn1ANcMDot8V44Lz03euWWGvbtcIyyxXo7vGSF8IObM
 tklx3v3obPjVPA1jyof873G2DD59ijCxSklfDDdBDvpev1lxeodCgDHV/kDZKDrCFrmiFIJTbJ0
 TVG7qT/3/xoO1yC0ANtVm5Id8GxUD08oZggVpGmqC4yTWnGC05uzRdvugwgD1AX+zG4GNrx7YMD
 5w0KO0faOnQxjv3H8zUDIKh1r4HlpDgSgTea8auvPSKMRhTJTbk9iNxO+jhumrSAQ4NctSnRFOV
 B89KrwJXZN/qxNYQCudhwmbGzzPg3w1Ii+CK/a6H1ZX3SEVjy0aaPFkiPkbMtHZNbOF6us+FDpD
 6orf236g/m4kNRitVuG9Ss0pwjprbjcQL3NgzVnZP1TTVF4fFFIV6PvHAIMBPlxj/WdJZYPFzh+
 gUgPfQeYNAH0UQrm3bWbEDlvjgskdXTPftihd8CBZUjkl3GvE0J2/678V9IpD/iQplM6l9LP6y0
 kZKxN/nhE4NHGTg==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semit <fancer.lancer@gmail.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Configure AXI on
 Tegra234 MGBE
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

From: Thierry Reding <treding@nvidia.com>

Allow the device to use bursts and increase the maximum number of
outstanding requests to improve performance. Measurements show an
increase in throughput of around 5x on a 1 Gbps link.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
index bab57d1675df..b6bfa48f279d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
@@ -199,6 +199,12 @@ static void mgbe_uphy_lane_bringup_serdes_down(struct net_device *ndev, void *mg
 	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
 }
 
+static const struct stmmac_axi tegra234_mgbe_axi = {
+	.axi_wr_osr_lmt = 63,
+	.axi_rd_osr_lmt = 63,
+	.axi_blen = { 256, },
+};
+
 static int tegra_mgbe_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat;
@@ -284,6 +290,9 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto disable_clks;
 
+	/* setup default AXI configuration */
+	res.axi = &tegra234_mgbe_axi;
+
 	plat = devm_stmmac_probe_config_dt(pdev, &res);
 	if (IS_ERR(plat)) {
 		err = PTR_ERR(plat);

-- 
2.43.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
