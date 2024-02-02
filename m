Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0156846F80
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 12:53:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F780C71284;
	Fri,  2 Feb 2024 11:53:48 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84DA8C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 11:53:47 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a370e7e1e02so56677066b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Feb 2024 03:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706874827; x=1707479627;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Np7u1hXKM5rI6U/dlseYWouqV6C4YX8LzVJmyooXeU4=;
 b=H0RFBu4rUYDwYeVN+Re3FSbMEM3mKjwYAPnvYfqCEb/UENw59bIRK3l5uc7s3rNj3c
 kyT4jx1Yn1+V0T0lypwBu3JeOnRPOdCgXkjCIpvskLclk3PIUR9NCFh4c+dhnGx5lA+Y
 NMoNB7+J4PzD5HqBPb59UpgVtGpRv2qEHSSRVcCTUqTHY7177vVUyBWe2dDSK+7l0m2u
 oswo9k03+YSQPO8bAY6scKMXYJkajBZfLqb993BjlNWoyx6fJwhXo0zrlpb0YlcGRKqR
 divDV65vmZ8EP8Fa2FOH495hZEoOMiU7J5zbr390tSqA2sRfM0baAhJ8fu69sdiz1Q6l
 mZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706874827; x=1707479627;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Np7u1hXKM5rI6U/dlseYWouqV6C4YX8LzVJmyooXeU4=;
 b=eVMmPdvM8eI/8QwTG4N2T1aI0oEoSsRX160wQvkpZeXnsgXFXFarFTjPx9XgEhspeb
 z1lToDo5qJJcRskKctwT38eRKyWwDNe3b/VtYYKUFzALiTX9f9y84vVdID55Yqa8qwF/
 rujuVDy9R51RF1w6q+BlF10SGXCOPm3BPXRZ1Uiqky/DFUV2/W3+CS2c4sUEE/z2I+/1
 CmbuKXbzpBwGFDjFB7eFCG/mc89C+oBaVoUC7X36m1bbyqo+jFlyP7G/E8C+WcGRY8dn
 cBbewsyFHL1SGiAg3W9uqT97mba+2MZs9TyP2X7xNtYrtMt6McQMdkg1OGxH14iDhN4R
 vksQ==
X-Gm-Message-State: AOJu0YzDBxd5hwJNVTuZ51aamuBrrU8Jcx1Z5yjId54ctLQiPIR+cezJ
 trhDBIO4H09IsW4BVUMfZ7JMUdYbyVkFJAONMFhiTCL4ltTpRO8TId+xF+qm
X-Google-Smtp-Source: AGHT+IGXAB7OY/9527WOWDw2boh21DlXg5QEgxoOS1s+t4s7jiOUM+xbeT+3S9LvGOjj9dd43wl4og==
X-Received: by 2002:a17:906:1d6:b0:a36:fe5f:12ea with SMTP id
 22-20020a17090601d600b00a36fe5f12eamr1466409ejj.11.1706874826621; 
 Fri, 02 Feb 2024 03:53:46 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUbHjgqn6OGJaSZiz/MJvW0xJGgV3YaTmVkJX/pkkcbMdNTxXe26Hrt4N2J5+Che02N4EpBAowTrg/h1CuORkWetUIul9fPIjxlHVVNDLtTdgUaO+37E/4qOr99TE7Vx/QgH/JFsIK3zyt8siy9jjxb8zxVzYH2W/MlMXDWPu4RMgsUiDGOIXxFxMTwHqrECx9EXzN3pV1FrI78j1BqqYGifuvecUkYbzXgIridLMUdN/upU0+UV/LRjTZG/0BPDzL6EWuVjmYo8426b6/rPkRV/Te2zWdMzyVNW+HO1Rwnwt5LfMy8o01tU2CueLzz2JRxV/sPoQ14rp1x47CfVACOLMXpR3nQQRAzRoC+15tg93Bj1ZH/VVDUV4bUo/s=
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 jy13-20020a170907762d00b00a2b1a20e662sm815025ejc.34.2024.02.02.03.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 03:53:45 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 02 Feb 2024 12:53:34 +0100
MIME-Version: 1.0
Message-Id: <20240202-stmmac-axi-config-v2-2-64eab2bab17b@nvidia.com>
References: <20240202-stmmac-axi-config-v2-0-64eab2bab17b@nvidia.com>
In-Reply-To: <20240202-stmmac-axi-config-v2-0-64eab2bab17b@nvidia.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3804; i=treding@nvidia.com;
 h=from:subject:message-id; bh=jjLbVkcITf7A0bBP/JxRfOK9o0PWmiljex/57VdQidQ=;
 b=owEBbQKS/ZANAwAIAd0jrNd/PrOhAcsmYgBlvNfFukeArHXtXK5OpnuugX7cDo941KJypi4WA
 a1km2kECCeJAjMEAAEIAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCZbzXxQAKCRDdI6zXfz6z
 oW7HEADClKBGhWi0Zx82nAXZaCzfIVvZNrfpOpy9Xdz4gFT11/y3rXDPXfVfO73YI2/V/FFnPD9
 hEW1+UOH8m3qBULTMjf6ngVg2Cb7Xy8Tgn3Xsq9KUjxr7itXUu7PYgeSR7Xry6+k8RXkTHdXK5R
 VoXBd1nxwfnd6WnUQSs2WQg/eOeZ5xGrownugVu8ZyULrhOuu7muz5w1ajr4YETqhohzxNNi9af
 UB+iNF+xPK2D8y3g8HZVA8rr1/q7f3dtjWziHxIpyorqIls/pnF7yoR4edqSF2ZcPhJ9R1S3UA+
 auSS8mwh+G7jbclrVkxryIgm8QwxmhKSV2yq6pAwoC15zyf0bYmOpyIpngKf7QWNe/+zDz6o19k
 eJoqb8LPHb9hekU7JDhiB/hSu1MZiFJvWrqm7rNnrXM92KCUgPEOCfA9wLw2ao30QvQvYQP0g8h
 sreziZZcVIoEEq8b7xAJ/Qhw3C8xdOxAviulQ3MoFTizTzLJZ8S/agdAkyl6KeItQ7XYn4siWFR
 AoQqlMshTZJ6x0rARbMfitzM/hcsMHvjvJo5UVYzJkqo5+wS4Qc5f8y8lKNxdHDKnnL337oKMcg
 B3sPTHlcfbX8MUU9UscLGCkmak/0e+b5/+vcGxeXGoKTRuUSOx+IDMf33Tno05tQAYgdpoIgGuY
 ZmwCXzrtIFLcjNA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Cc: linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac: Allow drivers to
 provide a default AXI configuration
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

In many cases the AXI configuration can be derived from the compatible
string, so there's no need to add the configuration to DT. Allow drivers
to pass in the default AXI configuration so they can be properly set up
without extra data in DT.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- fix bisectability
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 47 ++++++++++++++--------
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index f155e4841c62..07706e7b3cfc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -35,6 +35,8 @@ struct stmmac_resources {
 	int sfty_ue_irq;
 	int rx_irq[MTL_MAX_RX_QUEUES];
 	int tx_irq[MTL_MAX_TX_QUEUES];
+
+	const struct stmmac_axi *axi;
 };
 
 enum stmmac_txbuf_type {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 650ec8d2f5d7..0d5f2cebd6fc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -91,34 +91,49 @@ static int dwmac1000_validate_ucast_entries(struct device *dev,
  * if required, from device-tree the AXI internal register can be tuned
  * by using platform parameters.
  */
-static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
+static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev,
+					   struct stmmac_resources *res)
 {
 	struct device_node *np;
 	struct stmmac_axi *axi;
 
 	np = of_parse_phandle(pdev->dev.of_node, "snps,axi-config", 0);
-	if (!np)
+	if (!np && !res->axi)
 		return NULL;
 
 	axi = devm_kzalloc(&pdev->dev, sizeof(*axi), GFP_KERNEL);
 	if (!axi) {
-		of_node_put(np);
+		if (np)
+			of_node_put(np);
+
 		return ERR_PTR(-ENOMEM);
 	}
 
-	axi->axi_lpi_en = of_property_read_bool(np, "snps,lpi_en");
-	axi->axi_xit_frm = of_property_read_bool(np, "snps,xit_frm");
-	axi->axi_kbbe = of_property_read_bool(np, "snps,kbbe");
-	axi->axi_fb = of_property_read_bool(np, "snps,fb");
-	axi->axi_mb = of_property_read_bool(np, "snps,mb");
-	axi->axi_rb =  of_property_read_bool(np, "snps,rb");
+	if (res->axi)
+		*axi = *res->axi;
+
+	if (np) {
+		axi->axi_lpi_en = of_property_read_bool(np, "snps,lpi_en");
+		axi->axi_xit_frm = of_property_read_bool(np, "snps,xit_frm");
+		axi->axi_kbbe = of_property_read_bool(np, "snps,kbbe");
+		axi->axi_fb = of_property_read_bool(np, "snps,fb");
+		axi->axi_mb = of_property_read_bool(np, "snps,mb");
+		axi->axi_rb =  of_property_read_bool(np, "snps,rb");
+
+		if (of_property_read_u32(np, "snps,wr_osr_lmt", &axi->axi_wr_osr_lmt)) {
+			if (!res->axi)
+				axi->axi_wr_osr_lmt = 1;
+		}
+
+		if (of_property_read_u32(np, "snps,rd_osr_lmt", &axi->axi_rd_osr_lmt)) {
+			if (!res->axi)
+				axi->axi_rd_osr_lmt = 1;
+		}
+
+		of_property_read_u32_array(np, "snps,blen", axi->axi_blen, AXI_BLEN);
 
-	if (of_property_read_u32(np, "snps,wr_osr_lmt", &axi->axi_wr_osr_lmt))
-		axi->axi_wr_osr_lmt = 1;
-	if (of_property_read_u32(np, "snps,rd_osr_lmt", &axi->axi_rd_osr_lmt))
-		axi->axi_rd_osr_lmt = 1;
-	of_property_read_u32_array(np, "snps,blen", axi->axi_blen, AXI_BLEN);
-	of_node_put(np);
+		of_node_put(np);
+	}
 
 	return axi;
 }
@@ -606,7 +621,7 @@ stmmac_probe_config_dt(struct platform_device *pdev,
 
 	of_property_read_u32(np, "snps,ps-speed", &plat->mac_port_sel_speed);
 
-	plat->axi = stmmac_axi_setup(pdev);
+	plat->axi = stmmac_axi_setup(pdev, res);
 
 	rc = stmmac_mtl_setup(pdev, plat);
 	if (rc) {

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
