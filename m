Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A9A6DFB16
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 18:18:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DB73C69063;
	Wed, 12 Apr 2023 16:18:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD014C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 16:18:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CCK5sT012362; Wed, 12 Apr 2023 18:17:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=qoweobMCw9OjMJIGG9Oluh4CWDKdRBeAll2gFaHrPyY=;
 b=VZ1F0Bi1Q+9bJySmGN3Dizmwbi7b+vmqMIMIDGFTcW+Ryki2GUbGCgF+/l0pewNECfwk
 UZBtMP3dREJsSC2G5oUSXHBTZ9+QIdKFqmusw++eQSzQ4GbIiCHrzEC6F6bzKJewZycT
 MT28TZvLIShZKuHfSLgalbH+LICMtPUH0QKRaxgXbEJ+JBdY7zk5BZjymlW/+Zqk1qIE
 kcGrig0NOiLUC0SOs9FvM48AgvCnOJ94GWUIEyRqmIvZ9wmNE8mNNFc3MEXcNUN5Q1RD
 RNKcT1+OJmwyY8ktBOh7fgpp4KmjyvG7CWnDYCw2SXXtKOjqQfavZcC8H67FWwBwv9kr dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pw7wp0exg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 18:17:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 804B410002A;
 Wed, 12 Apr 2023 18:17:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5414021A221;
 Wed, 12 Apr 2023 18:17:44 +0200 (CEST)
Received: from localhost (10.48.1.102) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 12 Apr
 2023 18:17:43 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
Date: Wed, 12 Apr 2023 18:17:34 +0200
Message-ID: <20230412161734.3425090-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_08,2023-04-12_01,2023-02-09_01
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] usb: typec: ucsi: don't print PPM init
	deferred errors
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

ucsi_init() may be deferred as usb_role_sw may be deferred in
ucsi_register_port(). This results in several PPM init failed (-517)
messages maybe printed several times upon boot, like on stm32mp135f-dk
board, until the role_switch driver gets probed.

[   19.880945] dwc2 49000000.usb: supply vusb_d not found, using dummy regulator
[   19.887136] dwc2 49000000.usb: supply vusb_a not found, using dummy regulator
[   19.975432] ucsi-stm32g0-i2c 0-0053: PPM init failed (-517)
[   20.155746] dwc2 49000000.usb: EPs: 9, dedicated fifos, 952 entries in SPRAM
[   20.175429] ucsi-stm32g0-i2c 0-0053: PPM init failed (-517)
[   20.184242] dwc2 49000000.usb: DWC OTG Controller

Adopt dev_err_probe() instead of dev_err(), to only print other errors.
Also print an error in case the wait count has expired.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f632350f6dcb..4d809e0d7761 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1447,11 +1447,13 @@ static void ucsi_init_work(struct work_struct *work)
 
 	ret = ucsi_init(ucsi);
 	if (ret)
-		dev_err(ucsi->dev, "PPM init failed (%d)\n", ret);
+		dev_err_probe(ucsi->dev, ret, "PPM init failed\n");
 
 	if (ret == -EPROBE_DEFER) {
-		if (ucsi->work_count++ > UCSI_ROLE_SWITCH_WAIT_COUNT)
+		if (ucsi->work_count++ > UCSI_ROLE_SWITCH_WAIT_COUNT) {
+			dev_err(ucsi->dev, "PPM init failed, stop trying\n");
 			return;
+		}
 
 		queue_delayed_work(system_long_wq, &ucsi->work,
 				   UCSI_ROLE_SWITCH_INTERVAL);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
