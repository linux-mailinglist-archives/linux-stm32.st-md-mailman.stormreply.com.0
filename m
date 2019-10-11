Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC5FD40CA
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 15:15:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05DF8C36B0C;
	Fri, 11 Oct 2019 13:15:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D5CFC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 13:15:39 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9BD6lxu021879; Fri, 11 Oct 2019 15:15:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=2OJ63JRDHcE35+LH+1/BTSgThb8JET2V1q7cuqnG+F0=;
 b=uIUnsRMlUIA++sDY+nCBcDNNH3YlJtiiOVOt88abPsuDz0wB4V8cMuAvWxiNr8gvmhxi
 9JbYbEt9W5/ZPNOT5MwG5dr9hDJkuTKzTpt5epXeDRv8YKRFeKYGgZ4EqcvsYdPQTWKA
 d9rIqaKqB49S0Vd4TVRJgdYwnK5t6OssiS0n5SCbScCRiOVcA+pjbv7GL8tHnbh+fdlA
 fm902q1QSvLjSFtbW6QB4WSxefLFgvsr+9O5sj+iAMp2zSquHsnmStl4CZiOPxALkr5H
 bZ+UgYGGNN7bVY+JlUxN52NlvhotyLvTAKd5pEEiFb2PUqHMNIvVqKv9a17svKRncnpr +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegxw9yag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 15:15:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA71310002A;
 Fri, 11 Oct 2019 15:15:29 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5F6B2BEC72;
 Fri, 11 Oct 2019 15:15:29 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct
 2019 15:15:29 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct
 2019 15:15:29 +0200
From: Ludovic Barre <ludovic.Barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 11 Oct 2019 15:15:00 +0200
Message-ID: <20191011131502.29579-1-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_08:2019-10-10,2019-10-11 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] mmc: add unstuck function if host is in
	deadlock state
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

From: Ludovic Barre <ludovic.barre@st.com>

As discussed in this thread: https://patchwork.kernel.org/patch/10786421/
After a request, the host could be in deadlock state, and waiting
for a specific action to unstuck the hardware block before
resending a new command. This series adds mmc_hw_unstuck
callback (structure mmc_host_ops) before resending a new command
(call in mmc_blk_mq_rw_recovery, mmc_wait_for_req_done).

Ludovic Barre (2):
  mmc: add unstuck function if host is in deadlock state
  mmc: mmci: add unstuck feature

 drivers/mmc/core/block.c | 11 +++++++++++
 drivers/mmc/core/core.c  | 35 +++++++++++++++++++++++++++++++++--
 drivers/mmc/host/mmci.c  | 23 +++++++++++++++++++++--
 include/linux/mmc/core.h |  1 +
 include/linux/mmc/host.h |  7 +++++++
 5 files changed, 73 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
