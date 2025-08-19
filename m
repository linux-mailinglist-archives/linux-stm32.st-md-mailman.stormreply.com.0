Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437EB2BA26
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 09:05:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16283C3F942;
	Tue, 19 Aug 2025 07:05:26 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70731C3F940
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 07:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1755587124; x=1787123124;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c1BxtWxFSzVI01nWbBEkqZ/G2VNra/FxRh8DQNAAobM=;
 b=M3a6kawDOJV7cUb84NFuJgyijvDvnbcHs3r5rQ+R64SxKxzHYMPlWC6X
 2bKlXvJwEyaHCw37FjkhUWNh3bdMUQfWUgb/vhc6lk0xQ9yr2j7fKMk/o
 93v4W2ezgk8MBjXswLi0np/7nqAohrN35RZYusC/QMaTl4joNwxHxZJPb
 C+DoA7d1dRvuadcnKTZrkfhK4NHzqnEXQLKQI3w3EAZiZkKe/m4vssd5a
 VgBq+GkWTL4SW3soEaBbRgpOSmwOsxZxMbB7UdnTygEal1eGD4YVNehdG
 lfGAF6aB4SLlKJoMF/yxUClyG1jDrrR6CvcuXY01+ZF1+nLaS2dVkrfC4 w==;
X-CSE-ConnectionGUID: fIwxeDp0R6+2sZww5NY2GQ==
X-CSE-MsgGUID: t4fCMBi3Tzi/l0NmZyvFkA==
X-IronPort-AV: E=Sophos;i="6.17,300,1747692000"; d="scan'208";a="45796382"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 19 Aug 2025 09:05:22 +0200
X-CheckPoint: {68A42232-45-299FBAB0-EF52EDE7}
X-MAIL-CPID: 6C09F7E41B71AA5AEA1F17DECCEFAC1D_5
X-Control-Analysis: str=0001.0A00211B.68A421CD.001A, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B2211632DA; Tue, 19 Aug 2025 09:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1755587118; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=c1BxtWxFSzVI01nWbBEkqZ/G2VNra/FxRh8DQNAAobM=;
 b=ewMRqAntA6oODBtgjE7i+UeOXcV8RT4OzCEikUxqiOoxv+/bpnomoQdCUUxUY4KFKJ8M4o
 muMrUY8YljVX8QI2yYLeFGZ+WfFoBfQXomWuZkm8Wrk0BmrIgjq4qkU+ghN/cNiL5YY6yH
 Q3CGnkDkWFiaG1kvds1i0ECODJy6njRjd65s1Id0fhiLsZTplAf093SncXYwFtVtIIwIcB
 gQMLO1QuNibHEw7KbwdA5EQZmY4deRvS8JRjqFzQErlBTeRNHQn+VkYCHtobxK7yV0IlOi
 d93+CBxrUwfRYDzCUYfphrGX0OcGNSp1epe0CQ/B83RWGfk+vwFdgmqNr6aEtw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 19 Aug 2025 09:04:57 +0200
Message-ID: <20250819070458.1027883-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/1] mfd: stmpe: Allow building as module
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

Export the core probe and remove function to be used by i2c and spi
drivers. Also add necessary module information so the drivers can be built
as modules. This reduces footprint of the driver is enabled but unused.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improved commit message
* Remove superfluous text from module description
* Patch 1/3 and 2/3 already applied in next-20250819

v1: https://lore.kernel.org/all/20250725071153.338912-1-alexander.stein@ew.tq-group.com/

 drivers/mfd/Kconfig | 10 +++++-----
 drivers/mfd/stmpe.c |  6 ++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a403a3daedd52..874fee5681658 100644
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
index e1165f63aedae..3c5c2f157f529 100644
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
+MODULE_DESCRIPTION("STMPE Core driver");
+MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
