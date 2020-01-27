Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC1814A025
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 09:54:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E72D2C36B14;
	Mon, 27 Jan 2020 08:54:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC869C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 08:54:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00R8rFdF011482; Mon, 27 Jan 2020 09:53:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ph4w8wTNIFAH7Lv1cHY+WCanej56MAlJja9BHKFQag4=;
 b=XxLDSW/oMTYlYGoDFhaCAy0QhI/ticramibopIUoEDsXm9T+L44NWf9NMnd8LcysTRkB
 xExnoMz9HiLgattMBBjlbHX5AmoTxGJjYZlDeFebU5uIoMtuS2akMUYbx9njCWlQyhVh
 rCuTdkB/HgCowGLe6WjRUfIWreG4fdq6IGL4ABVAZbhWW9ukVkiiCIHbKzINuN9+pxgG
 zJVae9Wosv6CbGwBsB3TqUUdqRTCKw9G2lA/TZkn/9xfMafPhsAaAKhcAR4dJp2wUfdi
 0bWPx17GvXi6j945h3g5/JXcL1cMM4Ur+l3Ug00UzJDAaMALDLQkG9Dkuzb3+gC+x+y2 bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpar4st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 09:53:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 604B6100038;
 Mon, 27 Jan 2020 09:53:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F7ED21CA6A;
 Mon, 27 Jan 2020 09:53:42 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 Jan 2020 09:53:41
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Mon, 27 Jan 2020 09:53:28 +0100
Message-ID: <20200127085334.13163-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_02:2020-01-24,
 2020-01-27 signatures=0
Cc: linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] STM32 MDMA driver fixes and improvements
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

This series brings improvements to the MDMA driver, with support of power
management and descriptor reuse. Probe function gets a cleanup and to avoid
a race with vchan_complete, driver now adopts vchan_terminate_vdesc().

Amelie Delaunay (2):
  dmaengine: stm32-mdma: driver defers probe for clock and reset
  dmaengine: stm32-mdma: use vchan_terminate_vdesc() in .terminate_all

Etienne Carriere (2):
  dmaengine: stm32-mdma: use reset controller only at probe time
  dmaengine: stm32-mdma: disable clock in case of error during probe

Pierre-Yves MORDRET (2):
  dmaengine: stm32-mdma: add suspend/resume power management support
  dmaengine: stm32-mdma: enable descriptor_reuse

 drivers/dma/stm32-mdma.c | 78 +++++++++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 16 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
