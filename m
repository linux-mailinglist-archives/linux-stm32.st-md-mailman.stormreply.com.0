Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB63CB71C
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jul 2021 14:07:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE61EC597B2;
	Fri, 16 Jul 2021 12:07:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9F69C597B0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 12:07:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GBunYK013521; Fri, 16 Jul 2021 14:07:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=lzRYPr1+vdXF7JK12aAka1IrqHrsAt6uJeFasViIaO0=;
 b=fHvgmXEalhhGnJdzHWPl9ouTGzXmENkj3TGscD0/74AE6sjD7C4jBL1r+GQ4Vw1sgW/C
 LuyYHrrwW6uhDHOKLIY8d2+qNdaE3gKgJ+s6CWn/qwV7v74/LQxF5urx/pSVFK09033r
 KDvVrmO+H0WO2G1WRNLqOF70yWI7BSMhKgmofI8tG8Sz9eEp8IM3FtwEnmsYy+a/1Zme
 OxrmR3LqnQmjclfjBMriJ+tDQd1N0/uEVlSTPb+UBfWBkccXcFJsh9wMw4SyNO4GMpih
 IsVUq8VKSYvKSv0TIM0r1ZcrEg1RowXdmc2S6mz4QG9twF/7v0wkaOMk0avkM1tWP3ro zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1ubpc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 14:07:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A3A910002A;
 Fri, 16 Jul 2021 14:07:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A6FD226FCD;
 Fri, 16 Jul 2021 14:07:34 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul 2021 14:07:33
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>
Date: Fri, 16 Jul 2021 14:07:18 +0200
Message-ID: <20210716120718.20398-3-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716120718.20398-1-amelie.delaunay@foss.st.com>
References: <20210716120718.20398-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_04:2021-07-16,
 2021-07-16 signatures=0
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] usb: typec: stusb160x: Don't block
	probing of consumer of "connector" nodes
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

Similar as with tcpm this patch lets fw_devlink know not to wait on the
fwnode to be populated as a struct device.

Without this patch, USB functionality can be broken on some previously
supported boards.

Fixes: 28ec344bb891 ("usb: typec: tcpm: Don't block probing of consumers of "connector" nodes")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/usb/typec/stusb160x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index 3d3848e7c2c2..e7745d1c2a5c 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -685,6 +685,15 @@ static int stusb160x_probe(struct i2c_client *client)
 	if (!fwnode)
 		return -ENODEV;
 
+	/*
+	 * This fwnode has a "compatible" property, but is never populated as a
+	 * struct device. Instead we simply parse it to read the properties.
+	 * This it breaks fw_devlink=on. To maintain backward compatibility
+	 * with existing DT files, we work around this by deleting any
+	 * fwnode_links to/from this fwnode.
+	 */
+	fw_devlink_purge_absent_suppliers(fwnode);
+
 	/*
 	 * When both VDD and VSYS power supplies are present, the low power
 	 * supply VSYS is selected when VSYS voltage is above 3.1 V.
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
