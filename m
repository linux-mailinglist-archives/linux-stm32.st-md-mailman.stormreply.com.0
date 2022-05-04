Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B93AA51A48E
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 17:53:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 715DCC628C3;
	Wed,  4 May 2022 15:53:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34F27C628AA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 15:53:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244EghZP001510;
 Wed, 4 May 2022 17:53:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=mzzwNarX6y/uXSlhjavJ8tl8qTIckcIr1Wld2u6gD7I=;
 b=Oy5HHofgB19KxswbY1DM0SRBCX3W4aKIrv/JHpB3oCMB+K15LVs8mz/3J03PrPd0wdi8
 NXNxtWx176SxFvxUpXn3xTkqm8jeOP9uchRH1UH5Mo0WzJi841GNf7kHGTThJGVj9bDB
 MwxnanbmY4RB0r9w0EjpI+We+l4laLndbdA4PHnu8WXjgiJK14t7OKZ+Ym7Y/esMzLKY
 YAMlNc2qrsHDqHT1HefW970F3KiFf9/xyTLshVeTEPNkTGIFhw6CxsOkvjSNicnRqF3C
 VFV5rz0yjk5tYTjK4L0mILNzj1dcFi5UrQfPXp6fxy0WjK1zzAtvxjQOShOjIk7Br8Mz Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frv0gecft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 17:53:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 900D810002A;
 Wed,  4 May 2022 17:53:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8987D22A6E3;
 Wed,  4 May 2022 17:53:40 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 4 May 2022 17:53:39
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 4 May 2022 17:53:22 +0200
Message-ID: <20220504155322.121431-4-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504155322.121431-1-amelie.delaunay@foss.st.com>
References: <20220504155322.121431-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_04,2022-05-04_02,2022-02-23_01
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/3] dmaengine: stm32-mdma: use dev_dbg on
	non-busy channel spurious it
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

If interrupt occurs while !chan->busy, it means channel has been disabled
between the raise of the interruption and the read of status and ien, so,
spurious interrupt can be silently discarded.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32-mdma.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index a5cbfbbb93d1..caf0cce8f528 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1345,9 +1345,12 @@ static irqreturn_t stm32_mdma_irq_handler(int irq, void *devid)
 
 	if (!(status & ien)) {
 		spin_unlock(&chan->vchan.lock);
-		dev_warn(chan2dev(chan),
-			 "spurious it (status=0x%04x, ien=0x%04x)\n",
-			 status, ien);
+		if (chan->busy)
+			dev_warn(chan2dev(chan),
+				 "spurious it (status=0x%04x, ien=0x%04x)\n", status, ien);
+		else
+			dev_dbg(chan2dev(chan),
+				"spurious it (status=0x%04x, ien=0x%04x)\n", status, ien);
 		return IRQ_NONE;
 	}
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
