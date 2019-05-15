Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE51F520
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2019 15:12:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B150C54B0A
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2019 13:12:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BC69C54B07
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2019 13:12:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4FDBiB6004311; Wed, 15 May 2019 15:12:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Nushr9Q4ATrGXX1cBhEzuz9GYEidZFGLJO4tbBczcbM=;
 b=Db2STe7UxW1FEPSN2ItGT+VUAYbPjDC1xrsS1tpWJ7Tv2hE3wen+CCsnWMIHe9ShUpqf
 onpkGHkNa/6Yuda/EDs3zbtZxspgLtQtNg12lK2joxVNplB/LtJwOneWk+7sThnXtZAT
 6OGLPg7WXkEFTPPnRKJ5JuUbMlc4dcFB/QwxXKvC3uxGvJqGAr6HbhhZG3y+sJN8moqt
 huIkibREvpjfkJ0lNE/k0dfNkv0m/t2zS7XfECGz0osM1iZBzQ9E4ReAxbO2Ly4JA8Da
 1z9bDngVfndzZBdF+XtTb5ls4RUjtHdUzdBNm0ZYRbPLdIEdGK4937XbD2otIkpd77kf TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sdn9g0yej-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 15 May 2019 15:12:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D352E34;
 Wed, 15 May 2019 13:12:02 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A844127F6;
 Wed, 15 May 2019 13:12:02 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May
 2019 15:12:02 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May 2019 15:12:01
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <rafael.j.wysocki@intel.com>, <dmitry.torokhov@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <hadess@hadess.net>,
 <frowand.list@gmail.com>, <m.felsch@pengutronix.de>, <agx@sigxcpu.org>,
 <arnd@arndb.de>
Date: Wed, 15 May 2019 15:11:50 +0200
Message-ID: <20190515131154.18373-2-benjamin.gaignard@st.com>
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
Subject: [Linux-stm32] [PATCH v2 1/5] of/device: Add of_device_link_add
	function
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

Use 'suspend-dependencies' property from device node to ensure that
the listed devices will suspended after it and resumed before it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
version 2:
- only keep of_device_links_add() and use 
  DL_FLAG_PM_RUNTIME and DL_FLAG_AUTOREMOVE_CONSUMER flags to follow Rafael
  advices
- reword function description
- try to use a more explicit property name
  
 drivers/of/device.c       | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/of_device.h |  7 +++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 3717f2a20d0d..44ec84eee310 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -336,3 +336,40 @@ int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_device_uevent_modalias);
+
+/**
+ * of_device_links_add - Create links between a consumer device
+ * and it listed dependencies from device tree data
+ *
+ * @consumer: consumer device
+ *
+ * Ensure that consumer's dependencies will be suspended after it
+ * and resumed before it.
+ *
+ * Returns 0 on success, < 0 on failure.
+ */
+int of_device_links_add(struct device *consumer)
+{
+	struct device_node *np;
+	struct platform_device *pdev;
+	int i = 0;
+
+	np = of_parse_phandle(consumer->of_node, "suspend-dependencies", i++);
+	while (np) {
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+		if (!pdev)
+			return -EINVAL;
+
+		device_link_add(consumer, &pdev->dev,
+				DL_FLAG_PM_RUNTIME |
+				DL_FLAG_AUTOREMOVE_CONSUMER);
+		platform_device_put(pdev);
+
+		np = of_parse_phandle(consumer->of_node, "suspend-dependencies",
+				      i++);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_device_links_add);
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 8d31e39dd564..83f24c386d51 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -41,6 +41,8 @@ extern int of_device_request_module(struct device *dev);
 extern void of_device_uevent(struct device *dev, struct kobj_uevent_env *env);
 extern int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env);
 
+extern int of_device_links_add(struct device *consumer);
+
 static inline void of_device_node_put(struct device *dev)
 {
 	of_node_put(dev->of_node);
@@ -91,6 +93,11 @@ static inline int of_device_uevent_modalias(struct device *dev,
 	return -ENODEV;
 }
 
+static int of_device_links_add(struct device *consumer)
+{
+	return 0;
+}
+
 static inline void of_device_node_put(struct device *dev) { }
 
 static inline const struct of_device_id *__of_match_device(
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
