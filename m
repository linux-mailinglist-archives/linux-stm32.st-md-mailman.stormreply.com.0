Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EBF1ACD19
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 18:14:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17475C36B10;
	Thu, 16 Apr 2020 16:14:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74C2BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 16:14:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GGCFEW010375; Thu, 16 Apr 2020 18:14:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vcBb3r+viNdyKV64k5Eo4jYHRVkTS6JjhvXLvx/2TH8=;
 b=SoBzXXW/u/aE2SWP3JwtzkUOQ+sPDRadWKLF9Gz5UhHA4quSzVHdetdyKoeHnUarJVdQ
 peJEEcO32DQ9TwMqgC7hHYB7NIe4fUpu/E6jJiGfzBQvefesaVG9CJmY6tsHdlf9wePv
 l9L+P4LLpZZlWKpOmuU/tc7sja6caj1xmrd6RZxktms6ZVaX6v7TNTL9mUAIVpQ/vU6T
 vJiMj8ZSGwXK9fIvIr2EhUyEYrREIDNFTDwD/+ng0u4HaKmg9EQrizq4UL9bpUn5hXn2
 y/st/+DLF8CmmS0G9uzQFg67yAV1nrl82rjz1GFrVPisLsAMJEF9j7GlvodnrVJZiwEQ Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn94kmx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 18:14:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37B8010002A;
 Thu, 16 Apr 2020 18:14:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 206082B2D2C;
 Thu, 16 Apr 2020 18:14:30 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr 2020 18:14:29
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 16 Apr 2020 18:13:28 +0200
Message-ID: <20200416161331.7606-16-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_06:2020-04-14,
 2020-04-16 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC 15/18] remoteproc: associate memory entry to a
	device
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

mem entry could be registered at different levels, platform driver
or virtio device itself.
Add device information in rproc_mem_entry struct to retrieve a memory
region registered by another device.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c   | 2 ++
 drivers/remoteproc/remoteproc_virtio.c | 2 +-
 include/linux/remoteproc.h             | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 72fb97f28048..e72d681033d3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -892,6 +892,7 @@ rproc_mem_entry_init(struct device *dev,
 	if (!mem)
 		return mem;
 
+	mem->dev = dev;
 	mem->va = va;
 	mem->dma = dma;
 	mem->da = da;
@@ -932,6 +933,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
 	if (!mem)
 		return mem;
 
+	mem->dev = dev;
 	mem->da = da;
 	mem->len = len;
 	mem->rsc_offset = FW_RSC_ADDR_ANY;
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 4634cd63d547..0fd938afd146 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -439,7 +439,7 @@ static int rproc_vitio_start(struct rproc_subdev *subdev)
 		phys_addr_t pa;
 
 		if (mem->of_resm_idx != -1) {
-			struct device_node *np = rproc->dev.parent->of_node;
+			struct device_node *np = mem->dev->of_node;
 
 			/* Associate reserved memory to vdev device */
 			ret = of_reserved_mem_device_init_by_idx(dev, np,
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 7b8a6c3ef519..36abc9bc4def 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -331,6 +331,7 @@ struct rproc_mem_entry {
 	dma_addr_t dma;
 	int len;
 	u32 da;
+	struct device *dev;
 	void *priv;
 	char name[32];
 	struct list_head node;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
