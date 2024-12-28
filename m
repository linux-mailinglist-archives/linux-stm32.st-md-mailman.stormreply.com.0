Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4629FDCAD
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Dec 2024 00:33:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC6A1C78F63;
	Sat, 28 Dec 2024 23:33:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3380C78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 23:32:59 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so82251015e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 15:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735428778; x=1736033578;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DfubF/yufWY092c2cPTjDejWqTWBBJxWn/OStLH2dG0=;
 b=CB8TafQ76U6GLjYzFi6I+mjx/dT0e/ExgXOHOTXTWXGHIXe08qgGacPhAmZ8rIsSXY
 wjpXQv/MHFHCKrVAvowm88M4bL8fFGhHd0FE1OGfUXYRchAXguCwsRBt6qXaMtg4N0V7
 7bjH37P0dIs91lZD8jaZjlX6Y9i7FbLTBs+XmjPlDa5jGe/Y/r+mPzjkjfV2BiEjfR01
 inGdphOu/b0/YyL4H2sHeR8ErrAy6sIblRCmcPmvyQOA82wwMhy/A2baPngC+EzB1113
 oUn9RE1b1PbSmw9V9cllfjkUOwZjodPYXq/9WuwlOLYEOkVcC9NYve/7uHOare098F3f
 Sd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735428778; x=1736033578;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DfubF/yufWY092c2cPTjDejWqTWBBJxWn/OStLH2dG0=;
 b=a0TRr6Pk2TfBXoScguvY1N3oDOy+lJ/VvIfZJSMuki2Li0xPOnJmrZ02hFeSfXrA/8
 sbo3F86FYiKQHe2qoJfoMtZnvT/39rMchmON7mbfo/JKC/MJGozWkeUBy6keIBfqhS1d
 iFABCm+IqIQ1yx+KUsA4akAc3GFEEDZ6xcnkjlo1kQkAm7JQ892stmzwbEDAGaK3UvCl
 bgQrEPnNNd2zDobxHmSdjumTKJZnJWSAjKlx5gBiQe/+7mJX5ufLJTCx9v3dR6V0SC0o
 +Fy9tp8OIrQP1EurWIM++GDSqBYACeF+bK4TGwq/vSmiFw8GRrVP5CEFSqERujgphtBS
 1GlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+RzDFwgL9P4aZ5armG8TmQqqC3KycLJ5B1mMsWzqDk7XJbusqyi4+dapXkx66JXe4DVW1RtdDlEpaQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxgIYYT3ye/3q6X5BBTV5/vBvokL2Q9STqtaDbupk6rDePxYqh0
 +o8w01K3n31l9KvMno5ECuUHLCsW6pSilcJJa7jFya4Vh3L9CdtD
X-Gm-Gg: ASbGncvqNFFXOp2bew2mE5ig6UM2jBfsOVV0hgM6FjIQ+m6JRYePs1Sxr35kyqcT2ey
 wRBcmiw4c8oX8UC2Odj0fLpij+Qq8HItVQ38nBGnIpnrI3LHMT6Bh5d35KqWv87XwbXI/PNGa7S
 vVdS3gYKHJ3nuJgYPZptpPRa8miIE4tfvvmJu1x5H2o/V6tLENQx3vtsju1rF5jcIxjgCj6UgEg
 K7D2sOiUs41mzioERNujZ9bYVGJNdy79RJzA04Ypj2/ubEkMB4B1SwNAw==
X-Google-Smtp-Source: AGHT+IF2ClbgecNehGE5fWNtec9ewXlro34blBIKLgyQx5qEfdd7BFdxq3aJXVLuA8KbNB+TQ/BMPg==
X-Received: by 2002:a05:600c:1c9f:b0:435:32e:8270 with SMTP id
 5b1f17b1804b1-43668642f9dmr262491285e9.14.1735428778151; 
 Sat, 28 Dec 2024 15:32:58 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436612008b1sm307077615e9.15.2024.12.28.15.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 15:32:57 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:43 +0100
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-4-c7d4c4856336@gmail.com>
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
In-Reply-To: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=puiG5xEDdJCtQ8qmQzW/cyD8qGWndW0XH0vnx7xw1nQ=; 
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqkWao0M4f63BMEsxa8BRIQnaXQWygL0phkf
 tdecngcH0aJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpAAKCRDnIYpo1BLC
 tQJWD/9qfpDmwRN6zrCJNqZMU53EqDWlK+stpQdz2PxOgWM3IiMDfRC+jyRnvxeiWM9DBojy3CM
 eVzk/pzBMVdce6RrqEdBvSXEOhqvQtC1rwivdehnng1VXuGW7/WzqQ16lvPoYhaOeOSnH7v4S/Y
 5OJd33Yy8upYHZK+CHEDoRw7Y1JJcLzOGrgX4WjCVSnnCwzlncx6xZwhUkwtvI1FO18X5Jhgjh1
 yX6RZxXVxYc+3wdbKn6W9rDZZlfws37B0DfFdap3GBWMTfkNCgs+DGNgoEuYhZcMQxmwx66wb2o
 0BwEpi5PF9IGK6bHuLEEX2cr4gV9784GayGuaSythX1VMWzo4yVE6o9ETY0gdEdQUx5oxA+R5iZ
 QkPazXjn8VJIjnJgxjrVaVcCjDt/PomoWdeLWNdPtcslOtcTqTWVA3PxK3YuF/r4p+9hHbaizB2
 gnOwVzHIaLIKng0moZCBSHKUejWzwgkT/D692Qnwo1jzezsRFXBAHYBXxYC47FPUqrrNVLZ1IGW
 LSc+5kqpqWoJbf/J6FUi77wzfUAa7wwVSAr/kgt0ep2DMsyTxaWYy8N5KKmBIYr4eXWmdCr5IUv
 4HsYTrNo1Tx7bDH04sfmhHiXxDpwdR5kjuWexjioIGfPKVsju98eeYPPJy1R6MG0pnsXFTTm3AW
 1UCYQhk+nmIQ2hQ==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/6] ahci: st: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Link: https://lore.kernel.org/all/20240716180010.126987-1-rgallaispou@gmail.com
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
index 6b9b4a1dfa15bb6f395cc742f25251376b869a21..4336c8a6e20871fe25b61d6e2043fa15902b3559 100644
--- a/drivers/ata/ahci_st.c
+++ b/drivers/ata/ahci_st.c
@@ -176,7 +176,6 @@ static int st_ahci_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int st_ahci_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -221,9 +220,8 @@ static int st_ahci_resume(struct device *dev)
 
 	return ahci_platform_resume_host(dev);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_suspend, st_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_suspend, st_ahci_resume);
 
 static const struct of_device_id st_ahci_match[] = {
 	{ .compatible = "st,ahci", },
@@ -234,7 +232,7 @@ MODULE_DEVICE_TABLE(of, st_ahci_match);
 static struct platform_driver st_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
-		.pm = &st_ahci_pm_ops,
+		.pm = pm_sleep_ptr(&st_ahci_pm_ops),
 		.of_match_table = st_ahci_match,
 	},
 	.probe = st_ahci_probe,

-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
