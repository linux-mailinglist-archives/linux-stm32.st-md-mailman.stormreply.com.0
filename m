Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E148A83075E
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jan 2024 14:54:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4B64C6DD74;
	Wed, 17 Jan 2024 13:54:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48AD5C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 13:54:37 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40HAKAxm021553; Wed, 17 Jan 2024 14:54:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=jvHYq2x6zb50rq4RigAEIEBXsievUeNuiAAuc8GiJqM=; b=E4
 +PyAMsEQbMQZOxx9+rWKVqs54WNys23M4hU3APNaXxk2bpER3mbA1MD/sULO9TCE
 r3E5kK2awFE3j+Qku0h1nwS8cbwkiZUCbVLZqWJHNmAXIQ0AO0H5MZkLUDE1jW1F
 xAzQDyyQlc/lUB3Tz9bI/jC4EqmZcwDUujaHmQOJqoACyh35qer34LzWqE8vnrP7
 u9BRJ2tgfTagaKl4vVn+xFoBPjAT23Lo4Q3bq3NtTwW2QkZ8qvKIHeuBLW9l6eAs
 g1QaRwkF8YKD4kmdDn1Qjtfz474/83iKkGLESCFSyEIFUg2ZXHVXbQJLdnEHVPT3
 o5o+00VEN16LZhgUXQmw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vm4y51rt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 14:54:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AD7B100079;
 Wed, 17 Jan 2024 14:54:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F87F209ED7;
 Wed, 17 Jan 2024 14:54:32 +0100 (CET)
Received: from localhost (10.252.22.63) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 17 Jan
 2024 14:54:31 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Wed, 17 Jan 2024 14:53:11 +0100
Message-ID: <20240117135312.3381936-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240117135312.3381936-1-arnaud.pouliquen@foss.st.com>
References: <20240117135312.3381936-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.22.63]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_08,2024-01-17_01,2023-05-22_02
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/2] remoteproc: stm32: Fix incorrect type in
	assignment for va
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

The sparse tool complains about the attribute conversion between
a _iomem void * and a void *:

stm32_rproc.c:122:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
stm32_rproc.c:122:12: sparse:     expected void *va
stm32_rproc.c:122:12: sparse:     got void [noderef] __iomem *

Add '__force' to explicitly specify that the cast is intentional.
This conversion is necessary to cast to virtual addresses pointer,used,
by the remoteproc core.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312150052.HCiNKlqB-lkp@intel.com/
Fixes: 13140de09cc2 ("remoteproc: stm32: add an ST stm32_rproc driver")
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/stm32_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 4f469f0bcf8b..2c28635219eb 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -120,7 +120,7 @@ static int stm32_rproc_mem_alloc(struct rproc *rproc,
 	void *va;
 
 	dev_dbg(dev, "map memory: %pad+%zx\n", &mem->dma, mem->len);
-	va = ioremap_wc(mem->dma, mem->len);
+	va = (__force void *)ioremap_wc(mem->dma, mem->len);
 	if (IS_ERR_OR_NULL(va)) {
 		dev_err(dev, "Unable to map memory region: %pad+0x%zx\n",
 			&mem->dma, mem->len);
@@ -137,7 +137,7 @@ static int stm32_rproc_mem_release(struct rproc *rproc,
 				   struct rproc_mem_entry *mem)
 {
 	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
-	iounmap(mem->va);
+	iounmap((__force __iomem void *)mem->va);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
