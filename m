Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPArNVSJw2m2rQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD41320698
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A9AAC8F289;
	Wed, 25 Mar 2026 07:05:56 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7078C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 18:28:58 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-358e3cc5e7eso3159662a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 11:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774376937; x=1774981737;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2MPILU45gcDsKK8jp+8jqoirIZBgcXX7ZY0CuqSl9cY=;
 b=WplFqZ1CgYjxHvlBtJQQ96tEp1J8DS47m8hWaMD7CEWrEuVaQ4OPK0sxdd7ehMncpn
 ILkAETeBN+XLchdxq1LM5zqViPYfNEPljtkabQGmenweMRTxWHn2Il7PROgXvauwyYYp
 lrlgTX7F7AsY7dkveJjJYT+K+W2dvPfXx40VwlFG+n5Up/WKrDEfKeOceRohRUA/bERs
 ZiynbW4cEbYH3xhMO/+xZ2mxW1GFcJp2eIcFSfydLkoqa+SvbpY+euYvoV8XwLg134gn
 VdhUczzhjP9Gm+GA0JSAGJGYEBaBYysLlgUl8ZnYFWDmqLBeN3DoD/GjLML65Gu6Dnjg
 lsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774376937; x=1774981737;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2MPILU45gcDsKK8jp+8jqoirIZBgcXX7ZY0CuqSl9cY=;
 b=eGL3+edNdCmtdvo00jtjSCS7qXUPC4BX1AKI1vw5ZiEn2YPYG2zGoJltiVKx+Tft4Q
 kjI12OA9QLz32FPsN4oZlb+a+ApIWZ6mC+qA4FDLNrshrMaDw8Uw60f48AFgEFJLf8SD
 0WFV0F322ADqVTx5e4POoEHXEeA60iuBjMEBarZVThUfIZ1FKFEYQfPPoDMRrpuM6fA7
 J3xKT/yTu6UaiuKcuwLz7cKhoyeZoavnWTT+b4sQhxhsuAdv2DN+Tdr1zE5CHXYmnQJC
 QKfTch9e+ZU3VwxRsX7mZsnZ5J8dPlS6UxL9JMBaHzsGhV7e24fGQksmrq3nRXeYiiyi
 dthQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3PZOXbdFAM15sH2WpnE45n1AnWnXCl7iLxXu/3a0Eksk19vkbsY/9L7HKjeL/d9rtX7slamTW3Bs/NQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx/G8cCu1vQq80+tASaqzPBmPyZwYUXgdxh+m4QJxRF7ier6WIn
 mIJhlL2Qry9lZoWT4NrVzb0sEWlfKTl9GrpqHhBA6LT+GHELiB6nSvU3
X-Gm-Gg: ATEYQzwhdS5zqQ7eXLojRNgAqGj00ouaQdRqmCZGMn5ygKsMOX7gNAyl1BsJo5r3+N5
 JpWOfHKQviiBbcdyeq6IeT+rqO7WOW7H4xDb4sf/i2S201SxHrwy8tTjJM32ptFxUkxP8GXoHpq
 1nQ2ahxsoiSp8cxaqz5TTqk3Ua7ueiqf/4jLGOQPdB1ncEKNCUucNHiqKu4enzQrlBOq9Xk6Dhx
 xq3Nr7t5h6RCKbIypAifb0IPJe5+VU1oOyhS/rjzyfsAkZ2k/RZ2xIXfjrM8OON+zrkR+e3PvBw
 MtPE+AXU3TFmv1oZxn9YchgQGp85ZXRm34/f8wf27FYIdKIUmaOAUIcdUTu1Y7JXOfB4IVQ3qSy
 aqnX9VNl09NMlJZEn2UPIZv3ypfupZvzqLXtTAjEtIMrGJAWSKNyS4NWgPpWSFwh8gZQ/8XYiIh
 eNik4lFaGIz/MOHTYAWUCM2F7xig==
X-Received: by 2002:a17:90b:3dc4:b0:35b:929f:7e8f with SMTP id
 98e67ed59e1d1-35c0dd1000bmr297824a91.13.1774376937217; 
 Tue, 24 Mar 2026 11:28:57 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 11:28:56 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:58 +0530
MIME-Version: 1.0
Message-Id: <20260324-deverr-v1-10-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=2804;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=nhsfDSLdFe3nGX23EexwATKRFgvnwZsN/uRkVIgsfDc=;
 b=MfTL2nua2/UaTOkuHox/mofQ9uGkaQFwD4ef2QTeyEIJWKrK1affTlrqYL2fD+dQbiqZ2kQf1
 368O9MeLyraCsNY7XiqbLSbdhihgwtkeZhLhsjgkAnvnbcpMTIg+zrj
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-Mailman-Approved-At: Wed, 25 Mar 2026 07:05:52 +0000
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 Atharv Dubey <atharvd440@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Enrico Zanda <e.zanda1@gmail.com>
Subject: [Linux-stm32] [PATCH 10/10] i2c: sis630: Replace dev_err() with
 dev_err_probe() in probe function
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:till@harbaum.org,m:andi.shyti@kernel.org,m:ldewangan@nvidia.com,m:digetx@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:pierre-yves.mordret@foss.st.com,m:alain.volmat@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrice.chotard@foss.st.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:jdelvare@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-i2c@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:atharvd440@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:e.zanda1@gmail.com,m:thierryreding@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:ezanda1@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[harbaum.org,kernel.org,nvidia.com,gmail.com,sholland.org,foss.st.com,linux.alibaba.com,suse.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.978];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,sis630_driver.name:url]
X-Rspamd-Queue-Id: 7FD41320698
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sis630.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index a19c3d251804..3d0638c2bc51 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -431,24 +431,23 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	   in acpi io space and read acpi base addr
 	*/
 	if (pci_read_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, &b)) {
-		dev_err(&sis630_dev->dev, "Error: Can't read bios ctl reg\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't read bios ctl reg\n");
 		goto exit;
 	}
 	/* if ACPI already enabled , do nothing */
 	if (!(b & 0x80) &&
 	    pci_write_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, b | 0x80)) {
-		dev_err(&sis630_dev->dev, "Error: Can't enable ACPI\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't enable ACPI\n");
 		goto exit;
 	}
 
 	/* Determine the ACPI base address */
 	if (pci_read_config_word(sis630_dev,
 				 SIS630_ACPI_BASE_REG, &acpi_base)) {
-		dev_err(&sis630_dev->dev,
-			"Error: Can't determine ACPI base address\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't determine ACPI base address\n");
 		goto exit;
 	}
 
@@ -469,11 +468,10 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	/* Everything is happy, let's grab the memory and set things up. */
 	if (!request_region(smbus_base + SMB_STS, SIS630_SMB_IOREGION,
 			    sis630_driver.name)) {
-		dev_err(&sis630_dev->dev,
-			"I/O Region 0x%04x-0x%04x for SMBus already in use.\n",
-			smbus_base + SMB_STS,
-			smbus_base + SMB_STS + SIS630_SMB_IOREGION - 1);
-		retval = -EBUSY;
+		retval = dev_err_probe(&sis630_dev->dev, -EBUSY,
+				       "I/O Region 0x%04x-0x%04x for SMBus already in use.\n",
+				       smbus_base + SMB_STS,
+				       smbus_base + SMB_STS + SIS630_SMB_IOREGION - 1);
 		goto exit;
 	}
 
@@ -511,12 +509,9 @@ static int sis630_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int ret;
 
-	if (sis630_setup(dev)) {
-		dev_err(&dev->dev,
-			"SIS630 compatible bus not detected, "
-			"module not inserted.\n");
-		return -ENODEV;
-	}
+	if (sis630_setup(dev))
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "Compatible bus not detected, module not inserted.\n");
 
 	/* set up the sysfs linkage to our parent device */
 	sis630_adapter.dev.parent = &dev->dev;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
