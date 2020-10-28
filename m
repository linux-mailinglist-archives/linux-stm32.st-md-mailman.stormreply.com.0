Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1BF29D0DE
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Oct 2020 16:54:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B885DC3FAD5;
	Wed, 28 Oct 2020 15:54:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9BABC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 15:54:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SFkttw015934; Wed, 28 Oct 2020 16:54:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=My//I8tAAL0mcppmcnPGDlZb1Fs1wApvMcb494W8c+M=;
 b=TUdb7FOxztuv9L0bhgSiWpJxFS1o4nX7zdL8NBWrTajSajyJSYyBDrbMVnOa80seVYZk
 5cpUEMBy2n2JuCP/VnpRWW+7o10gsLB4XQB2Iwp9/4Dw5/FuyEhvRED6VCxlA5oaQ18/
 WbUxwmG49XZ9F/aqJ5ZdQg4LikWrvinUe9JpXBio5NQjk8/gUlJINjOgvbuUVmODsgAJ
 blEh6E8AxHiE8mXNxk2RlDWxe1bnMUNt5tq5NBlBOJlMx/i/61qktCtuMsyLfFCicEC4
 +q7UMnASGjjK7CwSAx7UXWsVrsRheGhr9smfdMoXHt6ti7RwA67ugWiTyLLLIJuTxghr 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccffk8hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 16:54:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C78BA100056;
 Wed, 28 Oct 2020 16:54:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 03FF02B8A0E;
 Wed, 28 Oct 2020 16:53:36 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct 2020 16:53:35
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>
Date: Wed, 28 Oct 2020 16:53:37 +0100
Message-ID: <20201028155337.9196-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_07:2020-10-28,
 2020-10-28 signatures=0
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/1] usb: typec: stusb160x: fix signedness
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
 drivers/usb/typec/stusb160x.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index da7f1957bcb3..8519d33bc3e7 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -544,11 +544,11 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
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
+
 	}
 	chip->capability.type = chip->port_type;
 
@@ -565,16 +565,13 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
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
