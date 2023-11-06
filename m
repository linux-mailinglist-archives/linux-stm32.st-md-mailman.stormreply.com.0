Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F37A97E2603
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 14:48:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E35CC6B460;
	Mon,  6 Nov 2023 13:48:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5904AC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Nov 2023 13:48:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3A6C4JCu000561; Mon, 6 Nov 2023 14:48:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=Vexw1pM
 NsxV4L+zqMyWZmWeII8r5bD8hhKoly+cx7vg=; b=Zl0xJ/1qDPheRcpJFz2E5Fh
 Ap7nez2oMUGyn2tQI9ehrgGUmIdE3OUSVmH+Mmk+PkYTEsGaPfzZH4vz36iZ+7nd
 aPS/tE0i53cfR19ptmB0hq626zuQKbJlsTIv0Y89zS9aOwQ1rwEeuOSXW2RHXwZ7
 lQLD54brzL9Hq3ZaUje3Z8Fda6GT7NgKy9kOtS/YMq70ZpDWlhabA/YyIAkaiQtV
 VdfwjhQpfrPKMDTSsqOwEARwKjWBFuIxAFfNPtuM4b3sKoLAdLQCiIFkK7ObTKId
 CCOPGUaliYtco1laBSXkpkeo7zMinru45+ZWCx2rHyUIbOQ3RT+DAIUlA4OvQlA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u5ej0q7kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Nov 2023 14:48:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABAEF100059;
 Mon,  6 Nov 2023 14:48:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 822AD24B890;
 Mon,  6 Nov 2023 14:48:33 +0100 (CET)
Received: from localhost (10.201.20.208) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 6 Nov
 2023 14:48:33 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>, Pierre Yves MORDRET
 <pierre-yves.mordret@st.com>, M'boumba Cedric Madianga
 <cedric.madianga@gmail.com>
Date: Mon, 6 Nov 2023 14:48:32 +0100
Message-ID: <20231106134832.1470305-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.208]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_12,2023-11-02_03,2023-05-22_02
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dmaengine: stm32-dma: avoid bitfield
	overflow assertion
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

stm32_dma_get_burst() returns a negative error for invalid input, which
gets turned into a large u32 value in stm32_dma_prep_dma_memcpy() that
in turn triggers an assertion because it does not fit into a two-bit field:
drivers/dma/stm32-dma.c: In function 'stm32_dma_prep_dma_memcpy':
include/linux/compiler_types.h:354:38: error: call to '__compiletime_assert_282' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:335:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:354:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
   drivers/dma/stm32-dma.c:1237:4: note: in expansion of macro 'FIELD_PREP'
       FIELD_PREP(STM32_DMA_SCR_PBURST_MASK, dma_burst) |
       ^~~~~~~~~~

As an easy workaround, assume the error can happen, so try to handle this
by failing stm32_dma_prep_dma_memcpy() before the assertion. It replicates
what is done in stm32_dma_set_xfer_param() where stm32_dma_get_burst() is
also used.

Fixes: 1c32d6c37cc2 ("dmaengine: stm32-dma: use bitfield helpers")
Fixes: a2b6103b7a8a ("dmaengine: stm32-dma: Improve memory burst management")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311060135.Q9eMnpCL-lkp@intel.com/
---
Updated from v1: https://lore.kernel.org/lkml/20230214103222.1193307-1-arnd@kernel.org/T/
- change dma_burst from u32 to int, and check for negative value, as done
in stm32_dma_set_xfer_param()
- Add 'Cc:', 'Reported-by:' and 'Closes:' tags
---
 drivers/dma/stm32-dma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 0b30151fb45c..9840594a6aaa 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -1249,8 +1249,8 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_memcpy(
 	enum dma_slave_buswidth max_width;
 	struct stm32_dma_desc *desc;
 	size_t xfer_count, offset;
-	u32 num_sgs, best_burst, dma_burst, threshold;
-	int i;
+	u32 num_sgs, best_burst, threshold;
+	int dma_burst, i;
 
 	num_sgs = DIV_ROUND_UP(len, STM32_DMA_ALIGNED_MAX_DATA_ITEMS);
 	desc = kzalloc(struct_size(desc, sg_req, num_sgs), GFP_NOWAIT);
@@ -1268,6 +1268,10 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_memcpy(
 		best_burst = stm32_dma_get_best_burst(len, STM32_DMA_MAX_BURST,
 						      threshold, max_width);
 		dma_burst = stm32_dma_get_burst(chan, best_burst);
+		if (dma_burst < 0) {
+			kfree(desc);
+			return NULL;
+		}
 
 		stm32_dma_clear_reg(&desc->sg_req[i].chan_reg);
 		desc->sg_req[i].chan_reg.dma_scr =
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
