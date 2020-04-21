Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB8B1B2624
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2020 14:33:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9E55C36B0F;
	Tue, 21 Apr 2020 12:33:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EDCEC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 12:33:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LCN1G0021757; Tue, 21 Apr 2020 14:33:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=XOcOfmk0mzp2LNDxp8A7DBUhCmQQA1WzS4pxBJFuT4I=;
 b=hnFbBrbhUH6PNx/IwwA4OIARvamZ1ny/0XqEk4W050Jhw7AfGf0n2pb/zLKP5H6Py5zr
 6W0bDRVOZzmQxdERo0OJGVAJ7qpOM/h7mw61EQq6sykm90H/bNuyUPeXn2FC6x4Otpry
 nW/p/ec/MOwE8dF+Lzpas1nARb5JEJCZvSkKTiyjKfxILl0H7g9ph3gVehSE0D3YxmPu
 uAfHdGcVhORGKEJ+WTICmorgngUOnWFKpUKSR3VVQejYeBozTUefsfu/fnxjJkYLcp44
 vG9fvRYULcXgnv0WLuTsxdWMEJSJ4zkWCQqQvMMmKIgQvm9i009923ZZg7o/UxCAzIIf hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqaw81au-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 14:33:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4BE9A10002A;
 Tue, 21 Apr 2020 14:33:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 429112B0FCB;
 Tue, 21 Apr 2020 14:33:15 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 14:33:14 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <hminas@synopsys.com>, <balbi@kernel.org>
Date: Tue, 21 Apr 2020 14:32:21 +0200
Message-ID: <1587472341-17935-5-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587472341-17935-1-git-send-email-fabrice.gasnier@st.com>
References: <1587472341-17935-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 4/4] usb: gadget: f_acm: add suspend resume
	callbacks
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
 drivers/usb/gadget/function/f_acm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/gadget/function/f_acm.c b/drivers/usb/gadget/function/f_acm.c
index 7c152c2..200596e 100644
--- a/drivers/usb/gadget/function/f_acm.c
+++ b/drivers/usb/gadget/function/f_acm.c
@@ -723,6 +723,20 @@ static void acm_free_func(struct usb_function *f)
 	kfree(acm);
 }
 
+static void acm_resume(struct usb_function *f)
+{
+	struct f_acm *acm = func_to_acm(f);
+
+	gserial_resume(&acm->port);
+}
+
+static void acm_suspend(struct usb_function *f)
+{
+	struct f_acm *acm = func_to_acm(f);
+
+	gserial_suspend(&acm->port);
+}
+
 static struct usb_function *acm_alloc_func(struct usb_function_instance *fi)
 {
 	struct f_serial_opts *opts;
@@ -750,6 +764,8 @@ static struct usb_function *acm_alloc_func(struct usb_function_instance *fi)
 	acm->port_num = opts->port_num;
 	acm->port.func.unbind = acm_unbind;
 	acm->port.func.free_func = acm_free_func;
+	acm->port.func.resume = acm_resume;
+	acm->port.func.suspend = acm_suspend;
 
 	return &acm->port.func;
 }
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
