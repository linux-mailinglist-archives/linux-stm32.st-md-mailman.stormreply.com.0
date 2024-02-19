Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD085A936
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 17:46:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D15AC6C83C;
	Mon, 19 Feb 2024 16:46:14 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23DE9C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 16:46:13 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a3c1a6c10bbso586815866b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 08:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708361172; x=1708965972;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hvQx/ZWr1fmONRjsP3PMsf6y/RwS/zsUlWEFNTxP3t4=;
 b=KNG4b6khiMiE6PQHKPrCkrLed7tUuKrWbyKzjm18cUZYAjh2V5wf2z2sA28OOhdfAg
 GqN6TE7ICydpuQpCVPwhnH0xMwzOothW2YxFKVC6v/WGebxE45IkVF4TwqT0OWH934Bp
 Q+plhHylpLRXnGa6FpWvlhyYIu3guahEbA71JNCNEb0K4MefVZGFIM+4OmtzHqlOUk7K
 +bovlLHi1G9uE9ZIXsNmrbiat3l8nRFjdhOXBXfSoyhjHTHXU6823nd0Hs37rewVPvnk
 IhvkQZtMwI7HNa9Zca0REmoeN3LyQx2p56GvAfhb8TsH1VG766RVyJ729PBsmdrJxILT
 pRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708361172; x=1708965972;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hvQx/ZWr1fmONRjsP3PMsf6y/RwS/zsUlWEFNTxP3t4=;
 b=cJvlDMrOwdugYXk18QZf6z3t/7mq76lZq90UmBkJxialIplgJSWDdj5r4YX1W2EqTX
 qzI6s4+Gy5B2CEdvfsaBq3SFPw7AadQu2oHKcxDqq5R2+AMJnpsbV6XKb/LSM7ZJ3X4R
 WTQL+ExUrTbIeHXEr7nYBLzq6HAVS0H5K55MV6ch8UHJOj9bvQ6kEtjTF29gzPULXjYo
 gy9H+Y7r+sP+tUuk5LzvoBxGxYmHefZfPO6/peU9Q1f8QhV4yXS4i5ZFTi6W7PaoiQDD
 XtJWzM87MWrv5eBq3yCSuS3Zvsws81SO2MPpTQrAerRJJAckHIhM25Wsu+bWfl0O5iL7
 OORQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW75/lfd5tJS2kEaMYtytEYhjHzCfYwV/ZKirTSMdJb8ydMJ/cD4Kw8H1SS2JJlvw2P0XcxN4IfLKg8pFpIh7VHApJj4OPa2nKw8iDhV+Ouc1dDSuWkhVTT
X-Gm-Message-State: AOJu0YzFjwo5ktPPZ7RV8A6kjbxzABtrPFMWEgvOEMeaTCHIQfhyX632
 8DoWLyfs7qVkDInSzwWkJptBbbcjJ0ZmX80nNrkzgQormahI078F
X-Google-Smtp-Source: AGHT+IGMrTXFePHwGK0f6Gfcanrxom7RdEshhcX0lXB5XyndiBsQwJpHCJ0fUqxOBqv59BYd5yg1Cw==
X-Received: by 2002:a17:906:8c4:b0:a3d:b6c2:fc58 with SMTP id
 o4-20020a17090608c400b00a3db6c2fc58mr7225638eje.2.1708361172613; 
 Mon, 19 Feb 2024 08:46:12 -0800 (PST)
Received: from localhost
 (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 qo3-20020a170907874300b00a3e4efbfdacsm2186128ejc.225.2024.02.19.08.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 08:46:11 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 19 Feb 2024 17:46:05 +0100
MIME-Version: 1.0
Message-Id: <20240219-stmmac-axi-config-v3-2-fca7f046e6ee@nvidia.com>
References: <20240219-stmmac-axi-config-v3-0-fca7f046e6ee@nvidia.com>
In-Reply-To: <20240219-stmmac-axi-config-v3-0-fca7f046e6ee@nvidia.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4527; i=treding@nvidia.com;
 h=from:subject:message-id; bh=LdiFXY9cbeHxsNR8EpusW5e+abDEIKHDPw46DFX7qbE=;
 b=owEBbQKS/ZANAwAIAd0jrNd/PrOhAcsmYgBl04XQc+VvRHCQa0rFZHSQK8YQYoyBj0+ZspjNm
 wiF3N9H2gWJAjMEAAEIAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCZdOF0AAKCRDdI6zXfz6z
 oefgD/oDiQVayaGBy3gD68Lgg02XvmyihQ7dQxJr9YR0oiGoOk2gp3rjgUYIzlzCKv72+CHcRSn
 Z2tjumF8g1yKw1DNsAjbldFLiUldaSd1yJxvjB5Mnj+XPAcZU2T82LC7k9e9dP1R0MZhxL63858
 Pkl5ItL3P0HnUJlDTCQYio9QKe0FZa3KoN+YXGp2bOnJzAsmOM/0NHXps/j0Z36V5oKtcc51Qo0
 wLQJivZTpduN7INxBHyVK0MZaGkQOJ3PY++gT78AwujJDbeSd3lXd6esYCesHqVUx6hqMD3t0tG
 iIeYMqzS6sEbYeJVSnO5vawV0yIjitoReFbU/FDLpEQl8rBWNMEI5bRCu7iZjiVULTjvGq6iha2
 e+ExUKqPuN2ShbmnMKPzPHHzfIkG3bqYNuCYuF5+6t+nL7WagNr96PpXvX980dYJGp2W8CiKned
 NbqyN8fITO8FuydmB5Gt+C5igUVCj9ZUN9pd9R6eHLBIEP7sZgkyomnaGK1IqnDpAjWOPGLvCPx
 ptpGh0Z/ZrBlxQsqup77PUdIjQbcvtV7EXLDiY+XSIIJvguDFoskjse27vsMvoc0toj0QtfnCE2
 IMYg87AbH+uXWUqSQjALEgnuzf3o4+SdWnvNIlczWvIGvmTs6V/4mw0nrABpYNNQpMcxXd0j5Ik
 6FVsTp7wlqeiJ6Q==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semit <fancer.lancer@gmail.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: Allow drivers to
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
Changes in v3:
- add comments to help explain override logic
- add missing kerneldoc for new parameter

Changes in v2:
- fix bisectability
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 59 +++++++++++++++-------
 2 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index dddcaa9220cc..573c5d99b4d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -36,6 +36,8 @@ struct stmmac_resources {
 	int sfty_ue_irq;
 	int rx_irq[MTL_MAX_RX_QUEUES];
 	int tx_irq[MTL_MAX_TX_QUEUES];
+
+	const struct stmmac_axi *axi;
 };
 
 enum stmmac_txbuf_type {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 4e2eb54306f9..583f78ae9bb0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -87,38 +87,61 @@ static int dwmac1000_validate_ucast_entries(struct device *dev,
 /**
  * stmmac_axi_setup - parse DT parameters for programming the AXI register
  * @pdev: platform device
+ * @res: driver-specific parameters
  * Description:
- * if required, from device-tree the AXI internal register can be tuned
- * by using platform parameters.
+ * Use driver-specific defaults for the AXI internal registers if available,
+ * or parse them from device tree, if present. Driver-specific defaults can
+ * be overridden by the values from device tree.
  */
-static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
+static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev,
+					   struct stmmac_resources *res)
 {
 	struct device_node *np;
 	struct stmmac_axi *axi;
 
+	/*
+	 * Exit early if the driver hasn't provided any defaults and the
+	 * device tree doesn't specify values for the AXI configuration.
+	 */
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
+	/* copy defaults provided by the driver */
+	if (res->axi)
+		*axi = *res->axi;
+
+	/* override defaults with data from DT */
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
 
-	if (of_property_read_u32(np, "snps,wr_osr_lmt", &axi->axi_wr_osr_lmt))
-		axi->axi_wr_osr_lmt = 1;
-	if (of_property_read_u32(np, "snps,rd_osr_lmt", &axi->axi_rd_osr_lmt))
-		axi->axi_rd_osr_lmt = 1;
-	of_property_read_u32_array(np, "snps,blen", axi->axi_blen, AXI_BLEN);
-	of_node_put(np);
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
@@ -606,7 +629,7 @@ stmmac_probe_config_dt(struct platform_device *pdev,
 
 	of_property_read_u32(np, "snps,ps-speed", &plat->mac_port_sel_speed);
 
-	plat->axi = stmmac_axi_setup(pdev);
+	plat->axi = stmmac_axi_setup(pdev, res);
 
 	rc = stmmac_mtl_setup(pdev, plat);
 	if (rc) {

-- 
2.43.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
