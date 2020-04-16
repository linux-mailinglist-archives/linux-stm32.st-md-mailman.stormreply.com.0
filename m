Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA121ACD0B
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 18:14:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55ED1C36B0C;
	Thu, 16 Apr 2020 16:14:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 005FCC36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 16:14:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GGDXZ9026476; Thu, 16 Apr 2020 18:14:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KXRIrH9Ae0pX/k70Vo3qC2ZlR604P+0OK1B0a7N8Gos=;
 b=S5BoDHi7XiofvM6AZHQ0HGIgOEuixNf2v4oh9upneAfUoeFvzUulh1c15J+1ON3QS7/e
 K77ud9wrpRUtOauhZZqYIXVCwTIHEg46jKUsBrdazCY0B+wvutPL3nsyfRZuigiLlHIp
 YNzp2q/iY5jC0rc4dn8Se9Pq/OqHTUcghhjWjjUGFTgYCHlH/W4mtNRWhZ1jVH/1jBpT
 OYdMIa6qrp7NLRdEZaOExZz8NGgvk8LpC/4H/ZccDUvIn+r5Pvf8qr8DsYBps7RM/Nfn
 LjFj7qK6X8v+0oCGFv9ECFVIPxtbmBF3d+DQ5Sav8TFu+wTw35amzhbrxQdHzH/oQDaJ yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn8s3kma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 18:14:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ECA4A10002A;
 Thu, 16 Apr 2020 18:14:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDD2F2B2D2A;
 Thu, 16 Apr 2020 18:14:11 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr 2020 18:14:11
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 16 Apr 2020 18:13:17 +0200
Message-ID: <20200416161331.7606-5-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_06:2020-04-14,
 2020-04-16 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC 04/18] remoteproc: Add rproc_get_by_node helper
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

Allow to retrieve the rproc structure from a rproc platform
child declared in the device tree.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 14 ++++++--------
 include/linux/remoteproc.h           |  7 ++++++-
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 4fcd685cbfd8..32056449bb72 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1739,10 +1739,10 @@ void rproc_shutdown(struct rproc *rproc)
 EXPORT_SYMBOL(rproc_shutdown);
 
 /**
- * rproc_get_by_phandle() - find a remote processor by phandle
- * @phandle: phandle to the rproc
+ * rproc_get_by_node() - find a remote processor by device node
+ * @np: device tree node
  *
- * Finds an rproc handle using the remote processor's phandle, and then
+ * Finds an rproc handle using the remote processor's node, and then
  * return a handle to the rproc.
  *
  * This function increments the remote processor's refcount, so always
@@ -1751,12 +1751,10 @@ EXPORT_SYMBOL(rproc_shutdown);
  * Returns the rproc handle on success, and NULL on failure.
  */
 #ifdef CONFIG_OF
-struct rproc *rproc_get_by_phandle(phandle phandle)
+struct rproc *rproc_get_by_node(struct device_node *np)
 {
 	struct rproc *rproc = NULL, *r;
-	struct device_node *np;
 
-	np = of_find_node_by_phandle(phandle);
 	if (!np)
 		return NULL;
 
@@ -1781,12 +1779,12 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 	return rproc;
 }
 #else
-struct rproc *rproc_get_by_phandle(phandle phandle)
+struct rproc *rproc_get_by_node(struct device_node *np)
 {
 	return NULL;
 }
 #endif
-EXPORT_SYMBOL(rproc_get_by_phandle);
+EXPORT_SYMBOL(rproc_get_by_node);
 
 /**
  * rproc_add() - register a remote processor
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a78e28bda962..ab9762563ae0 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -586,9 +586,14 @@ struct rproc_vdev {
 	u32 index;
 };
 
-struct rproc *rproc_get_by_phandle(phandle phandle);
+struct rproc *rproc_get_by_node(struct device_node *np);
 struct rproc *rproc_get_by_child(struct device *dev);
 
+static inline struct rproc *rproc_get_by_phandle(phandle phandle)
+{
+	return rproc_get_by_node(of_find_node_by_phandle(phandle));
+}
+
 struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const struct rproc_ops *ops,
 			  const char *firmware, int len);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
