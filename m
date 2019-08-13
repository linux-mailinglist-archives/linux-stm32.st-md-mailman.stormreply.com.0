Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AC28B4C2
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Aug 2019 12:00:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D450C35E08;
	Tue, 13 Aug 2019 10:00:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F3C8C35E03
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 10:00:29 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7D9vEqw021952; Tue, 13 Aug 2019 12:00:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=aoyRokR5kzUkomjm7Ywbps3L0Afaxia9MCls/Ada1gA=;
 b=Cs9uCuurKtt/S7y9CqRY/NdQTCF7vinymf4wbVL/pujdLkggXqyEmfaCYq7NlKa7vieG
 3m6H9UQdeNE2MjSEf6fM1OTqS3pNFAi20VJfo6vaCO0lH6CySonZqnccBEfz2cSmRgLq
 v9wFE4fod6B5bJUJBlieoZWe+9paVL+Xgu2jj2ktY5HpVK32l9NGMA0ko4ACjC0LMMMn
 mz04VOllLb2iq5m/0V7iVvkPLLO3557lDgQl7PnX95nYzbrz6O3VxWnmp89+FtxRyIul
 MDDnmiUQqQc8+/a6h+B2KveWZQlN5kIg9awAseoBtv1RflULRJ1GmaPqzxHsP52K9kME GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u9kpuqdd0-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 13 Aug 2019 12:00:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B79C42;
 Tue, 13 Aug 2019 10:00:11 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 163D52CC9D1;
 Tue, 13 Aug 2019 12:00:11 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 13 Aug
 2019 12:00:10 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 13 Aug
 2019 12:00:07 +0200
From: Ludovic Barre <ludovic.Barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 13 Aug 2019 11:59:48 +0200
Message-ID: <20190813095951.26275-1-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-13_04:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V5 0/3] mmc: mmci: add busy detect for stm32
	sdmmc variant
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

This patch series adds busy detect for stm32 sdmmc variant.
Some adaptations are required:
-On sdmmc the data timer is started on data transfert
and busy state, so we must add hardware busy timeout support.
-Add busy_complete callback at mmci_host_ops to allow to define
a specific busy completion by variant.
-Add sdmmc busy_complete calback.

V5:
-Replaces !cmd->data to !host->mrq->data to avoid overwrite
 of datatimer register by the first command (cmd23, without data) of
 SBC request.

V4:
-Re-work with busy_complete callback
-In series, move "mmc: mmci: add hardware busy timeout feature" in
first to simplify busy_complete prototype with err_msk parameter.

V3:
-rebase on latest mmc next
-replace re-read by status parameter. 

V2:
-mmci_cmd_irq cleanup in separate patch.
-simplify the busy_detect_flag exclude
-replace sdmmc specific comment in
"mmc: mmci: avoid fake busy polling in mmci_irq"
to focus on common behavior

Ludovic Barre (3):
  mmc: mmci: add hardware busy timeout feature
  mmc: mmci: add busy_complete callback
  mmc: mmci: sdmmc: add busy_complete callback

 drivers/mmc/host/mmci.c             | 178 +++++++++++++++++-----------
 drivers/mmc/host/mmci.h             |   7 +-
 drivers/mmc/host/mmci_stm32_sdmmc.c |  38 ++++++
 3 files changed, 151 insertions(+), 72 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
