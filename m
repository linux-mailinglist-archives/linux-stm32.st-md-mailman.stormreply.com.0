Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B614A026
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 09:54:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 060A1C36B17;
	Mon, 27 Jan 2020 08:54:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C95C3C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 08:54:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00R8rEEk011479; Mon, 27 Jan 2020 09:53:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MMDeiSg4L1Vk9AfJFcs4IZMV1l1esEisuYa4GJvczRM=;
 b=GTic1X4CIVQuiEJY+OIES3bgmZGaApZn77hpKM7mFtrs7h4DFqA6ZhN6UTJgYUEtm24Y
 OBUSuoCcVhcaW2jhj2DfJ+Uwu0Bi92I5GrZZCpiWP+YVMFWxb4Q6RjgOnwR2S69oksqI
 hHDbZTXqxvFbMwWKDvx4J2dNySJJvBtd5gy3H9y3mQgiftsaMMar3e5TqkNcFxtE2Uwt
 DoibHBS+Qp1RzNjJRvXScoiPrVy9pyKIXOFMYI+4u72BKxOuN/mpWbrjEu48sLb+mZCJ
 5jRyqYMYizQhp0xBQ0hnJjtjkhdCOlVEhQgq6kq6FNmo7+C4tfGH8n/gJo3OcDIszdn0 sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpar4t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 09:53:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 26FA9100044;
 Mon, 27 Jan 2020 09:53:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A7E421CA6A;
 Mon, 27 Jan 2020 09:53:46 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 Jan 2020 09:53:45
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Mon, 27 Jan 2020 09:53:34 +0100
Message-ID: <20200127085334.13163-7-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127085334.13163-1-amelie.delaunay@st.com>
References: <20200127085334.13163-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_02:2020-01-24,
 2020-01-27 signatures=0
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/6] dmaengine: stm32-mdma: use
	vchan_terminate_vdesc() in .terminate_all
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

To avoid race with vchan_complete, use the race free way to terminate
running transfer.

Move vdesc->node list_del in stm32_mdma_start_transfer instead of in
stm32_mdma_xfer_end to avoid another race in vchan_dma_desc_free_list.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/dma/stm32-mdma.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index f2043f47ae9e..5469563703d1 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1126,6 +1126,8 @@ static void stm32_mdma_start_transfer(struct stm32_mdma_chan *chan)
 		return;
 	}
 
+	list_del(&vdesc->node);
+
 	chan->desc = to_stm32_mdma_desc(vdesc);
 	hwdesc = chan->desc->node[0].hwdesc;
 	chan->curr_hwdesc = 0;
@@ -1241,8 +1243,10 @@ static int stm32_mdma_terminate_all(struct dma_chan *c)
 	LIST_HEAD(head);
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
-	if (chan->busy) {
-		stm32_mdma_stop(chan);
+	if (chan->desc) {
+		vchan_terminate_vdesc(&chan->desc->vdesc);
+		if (chan->busy)
+			stm32_mdma_stop(chan);
 		chan->desc = NULL;
 	}
 	vchan_get_all_descriptors(&chan->vchan, &head);
@@ -1330,7 +1334,6 @@ static enum dma_status stm32_mdma_tx_status(struct dma_chan *c,
 
 static void stm32_mdma_xfer_end(struct stm32_mdma_chan *chan)
 {
-	list_del(&chan->desc->vdesc.node);
 	vchan_cookie_complete(&chan->desc->vdesc);
 	chan->desc = NULL;
 	chan->busy = false;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
