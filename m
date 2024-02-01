Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5EE84604B
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Feb 2024 19:49:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12936C6DD9D;
	Thu,  1 Feb 2024 18:49:20 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27B62C71283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Feb 2024 18:49:18 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a364b5c5c19so217483266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Feb 2024 10:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706813357; x=1707418157;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AqDWY8wmk/fnuJTUL0gf+MfJA0JNC72CzhLE0DV6ueU=;
 b=f9m0CUGk+7TvDlnV26aNxJpY/z9Sbp0EkswZt/Ib7Og+dpKR3+VcA+vyYD8SOn7r7f
 ToOXuC+ECC4Nq3vN00RumqpdXCxXcrn8a+TjkNxfvfeWEf4vq9iZnfUCHYknw4leim3F
 JFDBoblyk+sbAC93VNt05EFDdUy5gMhavMgccpzWqz/TccvpSVFpucox1SV2752bMY30
 /MuBJ4pfAB7bOcsztD3T52sUD9wUHD5UY199xgQGrZ3yQ51nR9B4la0iVLUgad9PwjmT
 JBgo/hGZzT0bl05EgmXMc/SYVfk9bNWNr8Z9oGrqw2QEknQPRH9eK2IhjA7g0/K4i7cm
 PdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706813357; x=1707418157;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AqDWY8wmk/fnuJTUL0gf+MfJA0JNC72CzhLE0DV6ueU=;
 b=pN23kwuuAd22HMJUlqNczL4tMABpQsPLK78Z/KFDcPOdYXB/LILP2mWqfCsBWXQ8qn
 5SN1avyBDCII3ZBggLNJYJ28aSwoomFM/gYfTCUmWye5Bmu3Ops/xAOShETm1cem6fbr
 rZEi7yjHG4J88joheSJfoR9aoXFCs24pXzQIknB9VW0jB5RMMdpuxz225YIBPr7PxxvW
 4iLOSlgHaT6DoAKfdoGb052iHpCF85/qomXVp6b8gCFJB7XKC+z/2O3uCNY5xFTX0FH6
 AEcTa98masOOoP2swJQtCwwdEPATuDTUGawmk5jJRAkGM8mY5rRegswummYIRSAjMFRZ
 +pIg==
X-Gm-Message-State: AOJu0Yw18R4SreH2KldSLFanuxL94XtrhcSz5CzlxVKUwiTKteT8Ej3B
 DtV/+iJitRsrb/YZrn7qB3/IB5OEr5icwLplHfwRi/agdB6WQgvW
X-Google-Smtp-Source: AGHT+IGlCSjy95AXH4mYJjWbk+DnMRTrJeOc6/n32vxw6jslXvR6wtcmhksIMqv5Ku85ONcTVpRJIA==
X-Received: by 2002:a17:906:4f0a:b0:a35:43d8:a297 with SMTP id
 t10-20020a1709064f0a00b00a3543d8a297mr4200860eju.0.1706813357648; 
 Thu, 01 Feb 2024 10:49:17 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXg0D4fOjs5HYilBzZpjxO0yJ3sjv2MuAzioOusiL3HyFcWt+sLiMfzeT8BjpFfqnacv7Yby1XXcVHHzOR/xpT+QEskLx0mC9QT+ACNiFR8yS9HHWB6kjXFIf1xkgamzvKGPTfpUs0nFT/kIie32a/YjaeOKyyLcF//DAoNDQ0g1dQBVsH9hcu+yJzPruQUZxhC7Xav6Ephswrty10jq6fjYgREh11U2HnZfz8BZnXDBs9DMt1ZR8BYLGXRKH3kgoM4waLf50/Xdb+S1apLl5R86GarCVapWXen6MCZAmT+n2cB1wva3iCIJnoIa8mFWBLUl+i6mD6AT355vz+L2dGnOZ3hbScsotx818w9xNBhAjfoI7M7GfmX0a9Zb4GxyM9etfoacWRMkVLXALUZMLlDWg==
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 va11-20020a17090711cb00b00a36894739bbsm64066ejb.88.2024.02.01.10.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 10:49:16 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 01 Feb 2024 19:49:06 +0100
MIME-Version: 1.0
Message-Id: <20240201-stmmac-axi-config-v1-2-822e97b2d26e@nvidia.com>
References: <20240201-stmmac-axi-config-v1-0-822e97b2d26e@nvidia.com>
In-Reply-To: <20240201-stmmac-axi-config-v1-0-822e97b2d26e@nvidia.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3475; i=treding@nvidia.com;
 h=from:subject:message-id; bh=w0xggOKS1PGq0kFbzfjy2DAd3e5snbUxtXdb8/CdR8M=;
 b=owEBbQKS/ZANAwAIAd0jrNd/PrOhAcsmYgBlu+eo4do/ibRD22vEaMX4s5Ja/xO0RyvXT1Cnc
 RiSCmMpHyKJAjMEAAEIAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCZbvnqAAKCRDdI6zXfz6z
 ocs5EACceS9fQZ3tL3oUiof4CHxmR+8LkFehtBa+PFf8289m6QSjXlUa+U6BmQYDYO82XRAQSWp
 sWLqVLFl+P06C9lS55li+177xc31OTwMkmTFPz6Flz/JkLkTx1IbZ7ECWXI3JObwAzAW7KAcDK2
 FFEdopjouSg8ZFMuREYFowuyHiQq8clPeHRitwdByxW7rmtfb6Y7nJ5PZ+T6+0fI40v9GV6GA+M
 Ru97tkDMOVKGYkBf1PP1NR8YhZGv0x/rusw8SxU0uTzEvIbLsBahNtM0MrJtHIJ/NM0oC3e4/se
 Z+WWE7wBuxGoMSx/rhvwS/XtHmpneR8RxdZQEZZuqTXsb2jN/wLcW1XYwCdsALuMMqnrRf7l/yj
 GVS/0N2rbCt9oQqoXxWcCnbSS5qnBuo3cc0cQKBnQRe8hsfX2YATDtGCnY753qymvwtM3XqKndx
 4Q9j5Q2ZgAeIc75t1Mozsaj5oFbjXLnNOZZKkiIjnwbnwgb215Gi7Y0bqKCoSH51v7H5LaX2Z+2
 fFdp5oBoKyfxJmy3ue0dkohWH3alIPb0JzF7/iawpgLCeQcv4r6HycHubcU3QPR5HedcNDoP5rv
 7FTWnqy4tAoriipDpD3G9VfWF747TP5EvjvkZkCeU9qmNDwMKWEeNvKZVdegLqn+BKPL5gMsKu8
 j5QK3IU/pg3yO1g==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: Allow drivers to
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
index 8ec2ac28a775..0d5f2cebd6fc 100644
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
-
-	if (of_property_read_u32(np, "snps,wr_osr_lmt", &axi->axi_wr_osr_lmt))
-		axi->axi_wr_osr_lmt = 1;
-	if (of_property_read_u32(np, "snps,rd_osr_lmt", &axi->axi_rd_osr_lmt))
-		axi->axi_rd_osr_lmt = 1;
-	of_property_read_u32_array(np, "snps,blen", axi->axi_blen, AXI_BLEN);
-	of_node_put(np);
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
+
+		of_node_put(np);
+	}
 
 	return axi;
 }

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
