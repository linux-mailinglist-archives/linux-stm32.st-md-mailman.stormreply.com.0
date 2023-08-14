Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF4077B110
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 08:05:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95DC0C6B472;
	Mon, 14 Aug 2023 06:05:32 +0000 (UTC)
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64EA9C6B45F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 06:05:30 +0000 (UTC)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37E5dnKn028174; Sun, 13 Aug 2023 23:04:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pfpt0220; bh=2e/DgbPH5Z735BTpVc79AFms8kX4Gp8CjDRy+gF54Og=;
 b=E/8P5/+jNOFDXnIeAK6eLktq00L60xiKYdb2qKHYNE+xCpg5uzwBma5HNeeDm5+xDr/z
 PtUPN2CVxipoL7xIRglPjHM0nr73ebcCfiBNHKO+ejsrYpyGT1z5owXlVZBvcqnjQTMi
 xVpi7MTLbBxFyMgVXN2gotRa8b8ZGbhZzCnaie9FgVwAx0KVLDEe3Z0Hs/va3cj30eI3
 bQep63FV2AJCT9K2ToAglpvTN/WgrwwX8gb7FG8I4boMHs0BV/6m7+XurB6k5AN7oOOW
 iqus7BoMwgqKR+ia384IF8M69kir+dL0CX57DDgO8auPhc0KzwAXvTjo5NFnI/q/asdB kQ== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
 by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3se9kj4xs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sun, 13 Aug 2023 23:04:52 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48;
 Sun, 13 Aug 2023 23:04:50 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Sun, 13 Aug 2023 23:04:50 -0700
Received: from marvell-OptiPlex-7090.marvell.com (unknown [10.28.36.165])
 by maili.marvell.com (Postfix) with ESMTP id A95D13F707E;
 Sun, 13 Aug 2023 23:04:25 -0700 (PDT)
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 14 Aug 2023 11:34:11 +0530
Message-ID: <20230814060411.2401817-1-rkannoth@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-GUID: aFZU2RAx_UAE8R4K6KZZzbh7PQU3_GNE
X-Proofpoint-ORIG-GUID: aFZU2RAx_UAE8R4K6KZZzbh7PQU3_GNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-13_24,2023-08-10_01,2023-05-22_02
Cc: yonghong.song@linux.dev, kys@microsoft.com, horatiu.vultur@microchip.com,
 wei.liu@kernel.org, longli@microsoft.com, joabreu@synopsys.com,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, Mark-MC.Lee@mediatek.com,
 linux@roeck-us.net, jdelvare@suse.com, hawk@kernel.org,
 linux-omap@vger.kernel.org, ilias.apalodimas@linaro.org,
 linux-wireless@vger.kernel.org, oleksandr_tyshchenko@epam.com,
 linyunsheng@huawei.com, jolsa@kernel.org, shayne.chen@mediatek.com,
 linux-hyperv@vger.kernel.org, simon.horman@corigine.com, song@kernel.org,
 edumazet@google.com, sdf@google.com, rkannoth@marvell.com,
 shradhagupta@linux.microsoft.com, leon@kernel.org, davem@davemloft.net,
 john.fastabend@gmail.com, andrii@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, yisen.zhuang@huawei.com,
 richardcochran@gmail.com, maciej.fijalkowski@intel.com, sean.wang@mediatek.com,
 jaswinder.singh@linaro.org, linux-arm-kernel@lists.infradead.org,
 haoluo@google.com, UNGLinuxDriver@microchip.com, jiawenwu@trustnetic.com,
 mcoquelin.stm32@gmail.com, wei.fang@nxp.com, error27@gmail.com,
 alexanderduyck@fb.com, ast@kernel.org, sbhatta@marvell.com,
 daniel@iogearbox.net, linux-rdma@vger.kernel.org, decui@microsoft.com,
 shenwei.wang@nxp.com, mengyuanlou@net-swift.com, lorenzo@kernel.org,
 grygorii.strashko@ti.com, haiyangz@microsoft.com, kpsingh@kernel.org,
 broonie@kernel.org, john@phrozen.org, michael.chan@broadcom.com,
 linux-hwmon@vger.kernel.org, salil.mehta@huawei.com, pabeni@redhat.com,
 lgirdwood@gmail.com, yang.lee@linux.alibaba.com, gakula@marvell.com,
 vladimir.oltean@nxp.com, thomas.petazzoni@bootlin.com,
 gerhard@engleder-embedded.com, ryder.lee@mediatek.com, linux@armlinux.org.uk,
 xiaoning.wang@nxp.com, kuba@kernel.org, sgoutham@marvell.com, kvalo@kernel.org,
 sstabellini@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mw@semihalf.com,
 angelogioacchino.delregno@collabora.com, jgross@suse.com, saeedm@nvidia.com,
 aleksander.lobakin@intel.com, hkelam@marvell.com, p.zabel@pengutronix.de,
 martin.lau@linux.dev, nbd@nbd.name
Subject: [Linux-stm32] [PATCH v1 net] page_pool: Cap queue size to 32k.
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

Clamp to 32k instead of returning error.

Please find discussion at
https://lore.kernel.org/lkml/
CY4PR1801MB1911E15D518A77535F6E51E2D308A@CY4PR1801MB1911.
namprd18.prod.outlook.com/T/

Fixes: ff7d6b27f894 ("page_pool: refurbish version of page_pool code")
Signed-off-by: Ratheesh Kannoth <rkannoth@marvell.com>

---
ChangeLog:
v0 -> v1: Rebase && commit message changes
---
 net/core/page_pool.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index a3e12a61d456..e9dc8d8966ad 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -171,9 +171,10 @@ static int page_pool_init(struct page_pool *pool,
 	if (pool->p.pool_size)
 		ring_qsize = pool->p.pool_size;
 
-	/* Sanity limit mem that can be pinned down */
+	/* Cap queue size to 32k */
 	if (ring_qsize > 32768)
-		return -E2BIG;
+		ring_qsize = 32768;
+
 
 	/* DMA direction is either DMA_FROM_DEVICE or DMA_BIDIRECTIONAL.
 	 * DMA_BIDIRECTIONAL is for allowing page used for DMA sending,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
