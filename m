Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 066AD29D104
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Oct 2020 17:33:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD4C0C3FADA;
	Wed, 28 Oct 2020 16:33:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9CF5C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 16:33:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SGQuGg022296; Wed, 28 Oct 2020 17:33:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=PhjbGo6AT3h6pHeNt+TM7wcroVWuKNsQjXY6gfKNQnY=;
 b=PxtuVq7cjMr2dNJPMjoZSNpAc/83lfRFA0LI0VoQstyU753bcH78gWxlu+1BTXqmgJ7T
 QRWN12FuZnYoevl9uNGnfQO+Yaj3WgWHeeXC7lV0dk6BXWgGG7H4hyf8buhKvSKLfJot
 Y0zKKlojeE80WkrWqIIm8iTW0qnijza3unrDQnlHl43RIgQEkVnNvWBS6QarAg1fPOEU
 BtUmXk3xV3kEziTvBaZm8zNsAz6a1hwz+C7K0HcIs9Szs05uqkt/a0noONIpejJ5h91f
 2vhE+mo/VUpF1SEiv92WNtax8PPJN63Q3sJx2nTRjlqFjkXAxYf1GbORC3Eing85G/yV Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccf3tu0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 17:33:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8DAC610002A;
 Wed, 28 Oct 2020 17:33:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3AF91250433;
 Wed, 28 Oct 2020 17:33:08 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct 2020 17:33:07
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>
Date: Wed, 28 Oct 2020 17:33:09 +0100
Message-ID: <20201028163309.12878-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_08:2020-10-28,
 2020-10-28 signatures=0
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/1] usb: typec: stusb160x: fix signedness
	comparison issue with enum variables
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

chip->port_type and chip->pwr_opmode are enums and when GCC considers them
as unsigned, the conditions are never met.
This patch takes advantage of the ret variable and fixes the following
warnings:
drivers/usb/typec/stusb160x.c:548 stusb160x_get_fw_caps() warn: unsigned 'chip->port_type' is never less than zero.
drivers/usb/typec/stusb160x.c:570 stusb160x_get_fw_caps() warn: unsigned 'chip->pwr_opmode' is never less than zero.

Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
v2: Remove blank line
---
 drivers/usb/typec/stusb160x.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index da7f1957bcb3..2c6636e8535d 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -544,11 +544,10 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
 	 */
 	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
 	if (!ret) {
-		chip->port_type = typec_find_port_power_role(cap_str);
-		if ((int)chip->port_type < 0) {
-			ret = chip->port_type;
+		ret = typec_find_port_power_role(cap_str);
+		if (ret < 0)
 			return ret;
-		}
+		chip->port_type = ret;
 	}
 	chip->capability.type = chip->port_type;
 
@@ -565,16 +564,13 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
 	 */
 	ret = fwnode_property_read_string(fwnode, "power-opmode", &cap_str);
 	if (!ret) {
-		chip->pwr_opmode = typec_find_pwr_opmode(cap_str);
+		ret = typec_find_pwr_opmode(cap_str);
 		/* Power delivery not yet supported */
-		if ((int)chip->pwr_opmode < 0 ||
-		    chip->pwr_opmode == TYPEC_PWR_MODE_PD) {
-			ret = (int)chip->pwr_opmode < 0 ? chip->pwr_opmode :
-							  -EINVAL;
-			dev_err(chip->dev, "bad power operation mode: %d\n",
-				chip->pwr_opmode);
-			return ret;
+		if (ret < 0 || ret == TYPEC_PWR_MODE_PD) {
+			dev_err(chip->dev, "bad power operation mode: %d\n", ret);
+			return -EINVAL;
 		}
+		chip->pwr_opmode = ret;
 	}
 
 	return 0;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
