Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B80AF1F525
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2019 15:12:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82975C54B0F
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2019 13:12:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53A6EC54B08
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2019 13:12:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4FDBhEL004299; Wed, 15 May 2019 15:12:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=PcTbp14GM3Mxz+zqvEsn1niPCjuTf8GT2tk2Gi5qUTg=;
 b=FzMUmPhVtN3V7xWPWMIQFZ2K5RRaZ9Mds6q2QX7/CVbbkbMqOAZiIdU3jOARwXWPL/LF
 TYZs/0XC9FHMssVln+N2OFjtMNQIl566Jc/gT7FhnDFJuNTizqFh/1sTKVgY1HxLD+w1
 FiIhxxBKKqxVAhunOUq0QH4ALvmBcHV7MXSdqD0VQ8nYg9eIMRdLE7+gfJ0m0nef1lLE
 UHy0oDjWNeGEG7HQVayfsY1twGOVagl3SYdZKy8eVZOnEzcdqNM85v/uLFxnqVrSkQ3/
 FxMctpbgO8SsTIMtZ4d0EkYRmu8qlGqkrccN2xV6XHwnmeVBJvdsO3pDhclCi/8strA6 QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sdn9g0yex-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 15 May 2019 15:12:11 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8A1731;
 Wed, 15 May 2019 13:12:04 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B480127F6;
 Wed, 15 May 2019 13:12:04 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May
 2019 15:12:04 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May 2019 15:12:04
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <rafael.j.wysocki@intel.com>, <dmitry.torokhov@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <hadess@hadess.net>,
 <frowand.list@gmail.com>, <m.felsch@pengutronix.de>, <agx@sigxcpu.org>,
 <arnd@arndb.de>
Date: Wed, 15 May 2019 15:11:52 +0200
Message-ID: <20190515131154.18373-4-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190515131154.18373-1-benjamin.gaignard@st.com>
References: <20190515131154.18373-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-15_07:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 3/5] input: edt-ft5x06 - Call
	of_device_links_add() to create links
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

Add a call to of_device_links_add() to create links with suspend
dependencies at probe time.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 702bfda7ee77..65053be10d4e 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1167,6 +1167,8 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, tsdata);
 
+	of_device_links_add(&client->dev);
+
 	irq_flags = irq_get_trigger_type(client->irq);
 	if (irq_flags == IRQF_TRIGGER_NONE)
 		irq_flags = IRQF_TRIGGER_FALLING;
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
