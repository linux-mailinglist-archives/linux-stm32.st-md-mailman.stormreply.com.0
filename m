Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1241ACD18
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 18:14:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 049EAC36B0A;
	Thu, 16 Apr 2020 16:14:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33B70C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 16:14:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GGDE3h005331; Thu, 16 Apr 2020 18:14:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=VGuKiENXB4g+nYignzR0Sc0mT76eLrYMZJujuuwAYk4=;
 b=cGpXFzqALuH/em3ROP3/sU2rUi2hfvi7KYTKvUWHLHRKD3TMfG6SFw8pVa+fSEXy4EKj
 3BqqcqARJ+5CmK5K9+uqpQB7eTwewNMfY1rNkZwCltkUCEO7t8DTzK4H3Qcso+GRkfCK
 FKK1AcNK6PCfJi14BggVr7IZ+EfAFBss2Daq3YJbiIVd/ElsGoJbV/Y+cM4+AM8aHO13
 hB68f9qN4zRkqT9cxBtm7WeNGp3vx6fZl+Sp465fqBvi+io1/fMCUOBKInm3T4NUakoO
 Fuqk0XKCka/fsWhic1AirP2uS73O+3O+FmoQAtcHFxrxnXRyOuxRRNhL9GjzIALz9SHo jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn6t3ndb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 18:14:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB503100034;
 Thu, 16 Apr 2020 18:14:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D00AD2B2D2A;
 Thu, 16 Apr 2020 18:14:28 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr 2020 18:14:28
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 16 Apr 2020 18:13:27 +0200
Message-ID: <20200416161331.7606-15-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_06:2020-04-14,
 2020-04-16 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC 14/18] remoteproc: Add pa to da translation API
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

Add remote proc API to allow IPC client to translate address from
local to device paradigm.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 24 ++++++++++++++++++++++++
 include/linux/remoteproc.h           |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f9d04e59081c..72fb97f28048 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1939,6 +1939,30 @@ int rproc_add(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_add);
 
+/**
+ * rproc_pa_to_da() - memory translation from local physical address to
+ * remote device address
+ * @rproc: the remote processor handle to register
+ * @pa: local physical address
+ * @da: remote device address
+ *
+ * Return the device address associated to the physical address
+ * The translation is delegated to the platform driver if the ops is
+ * implemented. By default this function returns the physical address.
+ *
+ * Returns 0 on success and an appropriate error code otherwise.
+ */
+int rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
+{
+	if (!rproc->ops->pa_to_da) {
+		*da = pa;
+		return 0;
+	}
+
+	return rproc->ops->pa_to_da(rproc, pa, da);
+}
+EXPORT_SYMBOL(rproc_pa_to_da);
+
 /**
  * rproc_type_release() - release a remote processor instance
  * @dev: the rproc's device
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index d7235f7356e2..7b8a6c3ef519 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -359,6 +359,7 @@ enum rsc_handling_status {
  * @stop:	power off the device
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @pa_to_da:	optional platform hook to perform address translations
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
  * RSC_HANDLED if resource was handled, RSC_IGNORED if not handled and a
@@ -375,6 +376,7 @@ struct rproc_ops {
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
+	int (*pa_to_da)(struct rproc *rproc, phys_addr_t pa, u64 *da);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
@@ -618,6 +620,8 @@ struct rproc_mem_entry *
 rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
 			     u32 da, const char *name, ...);
 
+int rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da);
+
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
