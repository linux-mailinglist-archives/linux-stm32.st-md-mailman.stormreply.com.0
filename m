Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CED015A4DA
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2020 10:33:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3BA6C36B0B;
	Wed, 12 Feb 2020 09:33:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A4C4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 09:33:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01C9SWFU022722; Wed, 12 Feb 2020 10:33:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=DdUVEUrGvs+eS9mQ0fJ6sl1yRqM3pA5qY8qcjwzMC3Q=;
 b=qnn4pYZSTAtJJHIPupe6LnSrYjYngNXXAt1qJqS0WOsKcLRqOEvmAefhH/Xd7yf8H9at
 HqcAuVIT15hQi2gdQ77zCQD0KtX2EvaaFyobFcugbKWhT6jQ9ZBkb3xs4UwnQQ4jZO0I
 g241kwa+IFGKjZd0HCJwfIHgEKU8sbT5id604e1f5wXdABUMyXNnu6bDq5S2gRq/dg6S
 t7xckYO00+VhxdcL141dud7I2D6KJbdnOgPMXSri1KMDrih4j/DzCNg+NtVdzLLgbz/Q
 eDovpO/bqzKR1jjBbyARRt3+/2TmmOnuQqQvHMf/KsJMPyvw9EccEb04CVFskBVkcW09 oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ud9w7ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 10:33:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CFDD10002A;
 Wed, 12 Feb 2020 10:33:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8E542A667F;
 Wed, 12 Feb 2020 10:33:05 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Feb 2020 10:33:05
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 12 Feb 2020 10:32:11 +0100
Message-ID: <20200212093211.15270-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_04:2020-02-11,
 2020-02-12 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] remoteproc: fix kernel-doc warnings
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

Fix the following warnings when documentation is built:
drivers/remoteproc/remoteproc_virtio.c:330: warning: Function parameter
or member 'id' not described in 'rproc_add_virtio_dev'
drivers/remoteproc/remoteproc_core.c:243: warning: Function parameter
or member 'name' not described in 'rproc_find_carveout_by_name'
drivers/remoteproc/remoteproc_core.c:473: warning: Function parameter
or member 'offset' not described in 'rproc_handle_vdev'
drivers/remoteproc/remoteproc_core.c:604: warning: Function parameter
or member 'offset' not described in 'rproc_handle_trace'
drivers/remoteproc/remoteproc_core.c:678: warning: Function parameter
or member 'offset' not described in 'rproc_handle_devmem'
drivers/remoteproc/remoteproc_core.c:873: warning: Function parameter
or member 'offset' not described in 'rproc_handle_carveout'
drivers/remoteproc/remoteproc_core.c:1029: warning: cannot understand function
prototype: 'rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = '
drivers/remoteproc/remoteproc_core.c:1693: warning: Function parameter
or member 'work' not described in 'rproc_crash_handler_work'

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c   | 9 +++++++--
 drivers/remoteproc/remoteproc_virtio.c | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..5f9a5812505c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -224,7 +224,7 @@ EXPORT_SYMBOL(rproc_da_to_va);
 /**
  * rproc_find_carveout_by_name() - lookup the carveout region by a name
  * @rproc: handle of a remote processor
- * @name,..: carveout name to find (standard printf format)
+ * @name: carveout name to find (standard printf format)
  *
  * Platform driver has the capability to register some pre-allacoted carveout
  * (physically contiguous memory regions) before rproc firmware loading and
@@ -445,6 +445,7 @@ static void rproc_rvdev_release(struct device *dev)
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
  * @rsc: the vring resource descriptor
+ * @offset: offset of the resource entry
  * @avail: size of available data (for sanity checking the image)
  *
  * This resource entry requests the host to statically register a virtio
@@ -587,6 +588,7 @@ void rproc_vdev_release(struct kref *ref)
  * rproc_handle_trace() - handle a shared trace buffer resource
  * @rproc: the remote processor
  * @rsc: the trace resource descriptor
+ * @offset: offset of the resource entry
  * @avail: size of available data (for sanity checking the image)
  *
  * In case the remote processor dumps trace logs into memory,
@@ -652,6 +654,7 @@ static int rproc_handle_trace(struct rproc *rproc, struct fw_rsc_trace *rsc,
  * rproc_handle_devmem() - handle devmem resource entry
  * @rproc: remote processor handle
  * @rsc: the devmem resource entry
+ * @offset: offset of the resource entry
  * @avail: size of available data (for sanity checking the image)
  *
  * Remote processors commonly need to access certain on-chip peripherals.
@@ -853,6 +856,7 @@ static int rproc_release_carveout(struct rproc *rproc,
  * rproc_handle_carveout() - handle phys contig memory allocation requests
  * @rproc: rproc handle
  * @rsc: the resource entry
+ * @offset: offset of the resource entry
  * @avail: size of available data (for image validation)
  *
  * This function will handle firmware requests for allocation of physically
@@ -1022,7 +1026,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
 }
 EXPORT_SYMBOL(rproc_of_resm_mem_entry_init);
 
-/**
+/*
  * A lookup table for resource handlers. The indices are defined in
  * enum fw_resource_type.
  */
@@ -1685,6 +1689,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 
 /**
  * rproc_crash_handler_work() - handle a crash
+ * @work: work treating the crash
  *
  * This function needs to handle everything related to a crash, like cpu
  * registers and stack dump, information to help to debug the fatal error, etc.
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 8c07cb2ca8ba..eb817132bc5f 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -320,6 +320,7 @@ static void rproc_virtio_dev_release(struct device *dev)
 /**
  * rproc_add_virtio_dev() - register an rproc-induced virtio device
  * @rvdev: the remote vdev
+ * @id: the device type identification (used to match it with a driver).
  *
  * This function registers a virtio device. This vdev's partent is
  * the rproc device.
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
