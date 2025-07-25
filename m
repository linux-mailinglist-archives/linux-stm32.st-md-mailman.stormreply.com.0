Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ED6B118EF
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 09:12:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE02C3089D;
	Fri, 25 Jul 2025 07:12:17 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46584C30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 07:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1753427536; x=1784963536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8tMj9FLX+UA66nhFkirMdu8Rq5921p22OMdpvQW5B+o=;
 b=QPqSuewjFm3mkgeCqAxWWW+EjF2hQoAxb0BRBlVRo0mhxfrw7A/y+mdn
 GJ9ovml6lFH0ng0ID/fWUQg9BaZUYnhvPS/jY4p9fuejBzbRDq4N9AZsH
 m+9E6n2v4DHl3WM4a00Gogy1Oa10ZAoStsbIStBUltfvBHhNg3d60qcP+
 NTx97BsevKyKzvo2oRlVzwIYjYglWvxLrlcWav1nT1b10/jwkyhJbZrgw
 lb4UDzHuEIw7ZrGARmpRmVPLN7CYQjHemhimir2M+IVXANAIZoPeF5pDB
 11e+c/rQ0IQxkhf7YbnM4IBq1oHUCkHebxK20CnJcPOalMa5iHz5xq9fE g==;
X-CSE-ConnectionGUID: R6V/ESMKQaqDsJScWh+wlQ==
X-CSE-MsgGUID: aUmYHp5HSDiBtPnuSqOtjg==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; d="scan'208";a="45414813"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:12:15 +0200
X-CheckPoint: {68832E4F-45-BB1FFBB0-EB2CC75E}
X-MAIL-CPID: C5BE8A659E63DAFC652D904DD8B1D1B3_2
X-Control-Analysis: str=0001.0A002107.68832E09.0057, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5F21F1682BB; Fri, 25 Jul 2025 09:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1753427531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tMj9FLX+UA66nhFkirMdu8Rq5921p22OMdpvQW5B+o=;
 b=M0eLX4Ujutss1qZ8GQTyQpXgDYLsPdryClHkoBp6ctET1b5aG0QJjTJaJyzST5lTXYFvDk
 27hPCyCI3SW1GAEfHt1TxudH9tHkq4kDl2WDDSD0v0h+E8lfxmJnDB7L+SYiewXbU3+8QG
 jFBeG0J7U+YODhXr2m9u+BCKvodyG+PuSXivaQGx1HlYqNgvEfuikGTX5WoJfeaPA5TSsJ
 ArTT+Xaq4qj7LwDTYLu+qFslj5Wa2q7A2ezrX+pvOXFWwPxCf0jN1Ov1kC0oXQPqO5TMl8
 3Dglo4NVkghWd6erYHVY02tJcGIRv3r6vMhKBFzOzqLQmD6OgCYvBGwV4Xwr2A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 25 Jul 2025 09:11:51 +0200
Message-ID: <20250725071153.338912-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
References: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/3] mfd: stmpe: Allow building as module
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

Export the core probe and remove function to be used by modules. Add
necessary module information so the driver can be built as a module.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/mfd/Kconfig | 10 +++++-----
 drivers/mfd/stmpe.c |  6 ++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 8f11b2df14704..a58c95e5b8072 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1539,8 +1539,8 @@ config MFD_DB8500_PRCMU
 	  through a register map.
 
 config MFD_STMPE
-	bool "STMicroelectronics STMPE"
-	depends on I2C=y || SPI_MASTER=y
+	tristate "STMicroelectronics STMPE"
+	depends on I2C || SPI_MASTER
 	depends on OF
 	select MFD_CORE
 	help
@@ -1568,14 +1568,14 @@ menu "STMicroelectronics STMPE Interface Drivers"
 depends on MFD_STMPE
 
 config STMPE_I2C
-	bool "STMicroelectronics STMPE I2C Interface"
-	depends on I2C=y
+	tristate "STMicroelectronics STMPE I2C Interface"
+	depends on I2C
 	default y
 	help
 	  This is used to enable I2C interface of STMPE
 
 config STMPE_SPI
-	bool "STMicroelectronics STMPE SPI Interface"
+	tristate "STMicroelectronics STMPE SPI Interface"
 	depends on SPI_MASTER
 	help
 	  This is used to enable SPI interface of STMPE
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index e1165f63aedae..5faf13fd6cf83 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1482,6 +1482,7 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(stmpe_probe);
 
 void stmpe_remove(struct stmpe *stmpe)
 {
@@ -1497,6 +1498,7 @@ void stmpe_remove(struct stmpe *stmpe)
 
 	mfd_remove_devices(stmpe->dev);
 }
+EXPORT_SYMBOL_GPL(stmpe_remove);
 
 static int stmpe_suspend(struct device *dev)
 {
@@ -1520,3 +1522,7 @@ static int stmpe_resume(struct device *dev)
 
 EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmpe_dev_pm_ops,
 			     stmpe_suspend, stmpe_resume);
+
+MODULE_DESCRIPTION("STMPE MFD Core driver");
+MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
