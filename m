Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 687CEB3DAE4
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Sep 2025 09:16:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C25F3C3F94D;
	Mon,  1 Sep 2025 07:16:16 +0000 (UTC)
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 100F9C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Aug 2025 11:05:28 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1756551927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y6eUtUQ02u5rezVEVOgcTxRprhXqjnk3WqB6i5j0+DI=;
 b=dsyx5OLaLkbGBVOV2cA+VO323Uaoo28CF7YowEEWLL1EjbStcsce8x4ke/e+jbvOo4uQBb
 IfWce4okynDccVnJ4+9cRL2wmuIpzvEnC4jVdtTxUBNPYULxpwPrlSmWYZcLOXJXp4cGTj
 aZeUNFxEevxjH2FacO90OYwhw26VAoI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fedor Pchelkin <boddah8794@gmail.com>,
 "Christian A. Ehrhardt" <lk@c--e.de>, Al Viro <viro@zeniv.linux.org.uk>
Date: Sat, 30 Aug 2025 13:04:20 +0200
Message-ID: <20250830110426.10007-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:16:14 +0000
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Thorsten Blum <thorsten.blum@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] usb: ucsi: stm32: Use min() to improve
	ucsi_stm32g0_fw_cb()
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

Use min() to improve ucsi_stm32g0_fw_cb() and avoid calculating
'end - data' twice.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/usb/typec/ucsi/ucsi_stm32g0.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index 57ef7d83a412..838ac0185082 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -10,6 +10,7 @@
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/unaligned.h>
@@ -523,11 +524,7 @@ static void ucsi_stm32g0_fw_cb(const struct firmware *fw, void *context)
 	data = fw->data;
 	end = fw->data + fw->size;
 	while (data < end) {
-		if ((end - data) < STM32G0_I2C_BL_SZ)
-			size = end - data;
-		else
-			size = STM32G0_I2C_BL_SZ;
-
+		size = min(end - data, STM32G0_I2C_BL_SZ);
 		ret = ucsi_stm32g0_bl_write(g0->ucsi, addr, data, size);
 		if (ret) {
 			dev_err(g0->dev, "Write failed %d\n", ret);
-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
