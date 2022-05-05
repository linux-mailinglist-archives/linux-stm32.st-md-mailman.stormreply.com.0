Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D629851BDCF
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 13:14:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 764A6C60467;
	Thu,  5 May 2022 11:14:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D61DDC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 11:14:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458PiUc018222;
 Thu, 5 May 2022 13:14:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=U6Bf9hl5wzM7Kpw0BRIGT7+zxjqmU+6MCbiv78o43HQ=;
 b=dOf1A+WtxrzUgzdLRybaAOOrqFpo4fxfsBqMi3/7hNj/4wVYl1bcUwwn4C/1YRprRbbO
 O0Lfr9S8FEWHAfGHJhAeEaDnNpiqriPbkldrvkRKJFU+Xo09tEAw/5K/fzVf9DcmvU4z
 re2OKzk3sfM8RoBa9Rw9MjMrCbJsvkUoTzBhgLtqFkF+vasjzwbqWC+Cgpk6oXXb8l7y
 BA9yhiHWY0RyyVbl483578VqvXitvsi31T/OFuHuxZq3leLT19kmVgCC3gOrKuayik9a
 lcBNVhMuMXU2+K438XUxyDw9r8UXVsAbDVeyKZU9OV5ha2t+wvMBcLVBI0wctG4BMiJd +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthk2143-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 13:14:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A67D8100034;
 Thu,  5 May 2022 13:14:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A076C21A200;
 Thu,  5 May 2022 13:14:36 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 5 May 2022 13:14:36
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 5 May 2022 13:14:30 +0200
Message-ID: <20220505111434.37274-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/4] STM32 DMA pause/resume support
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

This patchset introduces pause/resume support in stm32-dma driver.
[1/4], [2/4] and [3/4] ease the introduction of device_pause/device_resume
ops management in [4/4].

Amelie Delaunay (4):
  dmaengine: stm32-dma: introduce stm32_dma_sg_inc to manage
    chan->next_sg
  dmaengine: stm32-dma: pass DMA_SxSCR value to
    stm32_dma_handle_chan_done()
  dmaengine: stm32-dma: rename pm ops before dma pause/resume
    introduction
  dmaengine: stm32-dma: add device_pause/device_resume support

 drivers/dma/stm32-dma.c | 311 ++++++++++++++++++++++++++++++++++------
 1 file changed, 268 insertions(+), 43 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
