Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F41861B3E7F
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2020 12:29:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B61A8C36B0B;
	Wed, 22 Apr 2020 10:29:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B693EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 10:29:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MASQ2q005974; Wed, 22 Apr 2020 12:29:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=vQkeoE76rBPKloDNcJgTTXfaQgVxBlx3RLBb7ovXc8k=;
 b=Y8XWGA98J3xPyW/eIsQk9ygDZWdawKRSfYio+swui0AiC6SpFpp8cpPWZUnTBlBtnNZh
 6hKcjgxVlW5dHtgK/UB21EPoAwyxJT0cultqFUipXBYDQm3QTYgFdvpvwX1IA1M2h9q8
 hSycRVFBRw4vnqhXnrpe38Z1On8XSSBh184g5pW5lVkPVcq16o65XGYhNRiYVHuqw9fW
 3FwERQeJBvShyTWyUL8gcE57gPm4qGV1hQORtHTg3yrsn0bzl7sgc3AfbcXW5tEcHmj0
 p6THGMF+WbaCg/VgkEJghUHMXgZqGM915WED2aYHOWFVLPM2VOxdlovL+jWcu49AzR8R Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregnra1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 12:29:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7A3710002A;
 Wed, 22 Apr 2020 12:29:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2CB92A9560;
 Wed, 22 Apr 2020 12:29:12 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 Apr 2020 12:29:12
 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Dan
 Williams <dan.j.williams@intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Wed, 22 Apr 2020 12:29:02 +0200
Message-ID: <20200422102904.1448-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pierre-Yves Mordret <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] STM32 DMA Direct mode
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

By default, the driver compute if the FIFO must operate in direct mode or with
FIFO threshold. Direct mode is allowed only if computed source burst and
destination burst are disabled. But with memory source or destination, burst
is always > 0.
Direct mode is useful when the peripheral requires an immediate and single
transfer to or from the memory after each DMA request.
This patchset adds a way to force Direct mode through device tree.

Amelie Delaunay (2):
  dt-bindings: dma: add direct mode support through device tree in
    stm32-dma
  dmaengine: stm32-dma: direct mode support through device tree

 .../devicetree/bindings/dma/st,stm32-dma.yaml |  5 +++
 drivers/dma/stm32-dma.c                       | 41 ++++++++++++++-----
 2 files changed, 36 insertions(+), 10 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
