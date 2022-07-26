Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B909580E8B
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jul 2022 10:08:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE4C7C640F6;
	Tue, 26 Jul 2022 08:08:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38004C035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jul 2022 08:08:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q6Sr0C009503;
 Tue, 26 Jul 2022 10:07:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=wykgcm3rpVJzx0JgCZYDSV88n+ZA/29qgoVr5hSuSn4=;
 b=zuQdBAu6C3WqhE8LbMzGsCk7mpfm5F8vzcmUlGnC91oWOUdfN1NC9UraCqnoNUZPKPhN
 DxNnn7Uj7kSLM8O26+JM9J4DgjJt7GIcv4KKaMkSkWxKuBPLHdHxCm8x8IT64lmItW9p
 ZNw/BNbspLv0YYhKbxqPdEJnnxkEJNTfyacQJZrxr08I52a73kal8p4J4rTaaF+SGNvB
 E0ib3dmni8ZocKnMKCufZZmzSocAWEZfe1dWD/bmFfrYXAxO02SlksEUwbeU/tjSolm4
 0n028o3QV+LSDIVXWDsIhvenJnJfQZGKMtliRm0le4Tl/VoEDyPoBXSTDRAR0/7gfsv+ 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hhp6aq1rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 10:07:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E5216100039;
 Tue, 26 Jul 2022 10:07:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DFAC62128A3;
 Tue, 26 Jul 2022 10:07:33 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 26 Jul
 2022 10:07:31 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>, <mka@chromium.org>,
 <alexandre.torgue@foss.st.com>
Date: Tue, 26 Jul 2022 10:07:06 +0200
Message-ID: <20220726080708.162547-3-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726080708.162547-1-fabrice.gasnier@foss.st.com>
References: <20220726080708.162547-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_02,2022-07-25_03,2022-06-22_01
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/4] usb: misc: onboard-hub: add support
	for Microchip USB2514B USB 2.0 hub
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

Add support for Microchip USB2514B USB 2.0 hub to the onboard usb hub
driver. Adopt the generic usb-device compatible ("usbVID,PID").
Some STM32MP1 boards have this hub on-board, with a supply that needs to
be enabled for proper operation.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- Sort vendor ids in alphabetic order as commented by Matthias.
- Sort compatible list in alphanumeric order, e.g. by vendor ids as
  commented by Matthias (but keep PIDs grouped for a HUB chip).
- Update commit message to remove earlier reference on usbVID,PID.
---
 drivers/usb/misc/onboard_usb_hub.c | 2 ++
 drivers/usb/misc/onboard_usb_hub.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 6b9b949d17d30..de3627af3c84a 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -309,6 +309,7 @@ static struct platform_driver onboard_hub_driver = {
 
 /************************** USB driver **************************/
 
+#define VENDOR_ID_MICROCHIP	0x0424
 #define VENDOR_ID_REALTEK	0x0bda
 
 /*
@@ -383,6 +384,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
 }
 
 static const struct usb_device_id onboard_hub_id_table[] = {
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index d3a5b6938582e..3820669eb98ce 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -7,6 +7,7 @@
 #define _USB_MISC_ONBOARD_USB_HUB_H
 
 static const struct of_device_id onboard_hub_match[] = {
+	{ .compatible = "usb424,2514" },
 	{ .compatible = "usbbda,411" },
 	{ .compatible = "usbbda,5411" },
 	{ .compatible = "usbbda,414" },
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
