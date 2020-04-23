Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF72A1B5AD8
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Apr 2020 13:56:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99015C36B0E;
	Thu, 23 Apr 2020 11:56:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA011C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 11:56:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NBqGu4011758; Thu, 23 Apr 2020 13:56:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=kO+cRwxzp6MTRP0BhgQn00h4Jvgtw6HO9Mccuab6nNs=;
 b=qxwHDk0ExnFWEj2F13qUb5wya0rN/Z7YLuXfBDgrs75yI/lxTJNO0A4qIFLCxC6yoTLM
 OeQOAPCf+WwbjMepYh9WMFMA4oh7ipuAtx6sh164zwkdhmUYrpKKVRFkXZm504zxcGzm
 QG1SOgQFB7VGQLdOj2DTyD20EOwfiEQGg+ylF0pHVs/TdjRj/1vBivuVW5tHJeheOYQy
 ZodCGEValfk2GwJ0/0WleRqGqNULu1ipIAR4rhXuuUMQ4Y1UvsAsLEddpM6yX9qbfYDA
 KWagl6piIsvVib3BX7EXFkvsrcLpWNN/DBAcMZGVEmO1dsrhuiwwATjmRMcG4dAfyuKz lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11vjj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 13:56:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 316F110002A;
 Thu, 23 Apr 2020 13:56:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 27C1F2B8A00;
 Thu, 23 Apr 2020 13:56:18 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 23 Apr 2020 13:56:17 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <balbi@kernel.org>
Date: Thu, 23 Apr 2020 13:55:55 +0200
Message-ID: <1587642956-8157-4-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587642956-8157-1-git-send-email-fabrice.gasnier@st.com>
References: <1587642956-8157-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_07:2020-04-22,
 2020-04-23 signatures=0
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 3/4] usb: gadget: f_serial: add suspend
	resume callbacks
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

Add suspend resume callbacks to notify u_serial of the bus suspend/resume
state.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/usb/gadget/function/f_serial.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/gadget/function/f_serial.c b/drivers/usb/gadget/function/f_serial.c
index 1406255..e627138 100644
--- a/drivers/usb/gadget/function/f_serial.c
+++ b/drivers/usb/gadget/function/f_serial.c
@@ -348,6 +348,20 @@ static void gser_unbind(struct usb_configuration *c, struct usb_function *f)
 	usb_free_all_descriptors(f);
 }
 
+static void gser_resume(struct usb_function *f)
+{
+	struct f_gser *gser = func_to_gser(f);
+
+	gserial_resume(&gser->port);
+}
+
+static void gser_suspend(struct usb_function *f)
+{
+	struct f_gser *gser = func_to_gser(f);
+
+	gserial_suspend(&gser->port);
+}
+
 static struct usb_function *gser_alloc(struct usb_function_instance *fi)
 {
 	struct f_gser	*gser;
@@ -369,6 +383,8 @@ static struct usb_function *gser_alloc(struct usb_function_instance *fi)
 	gser->port.func.set_alt = gser_set_alt;
 	gser->port.func.disable = gser_disable;
 	gser->port.func.free_func = gser_free;
+	gser->port.func.resume = gser_resume;
+	gser->port.func.suspend = gser_suspend;
 
 	return &gser->port.func;
 }
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
