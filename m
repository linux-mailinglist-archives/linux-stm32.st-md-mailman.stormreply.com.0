Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F73136E86
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2020 14:49:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC779C36B0C;
	Fri, 10 Jan 2020 13:49:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C84CBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 13:49:06 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00ADlvUT031939; Fri, 10 Jan 2020 14:48:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=zLvBdV8AvZgbP8WkIebIBG/cvEHM5DSXs1Wl2vg4MqU=;
 b=y/QdE59gExw45tdziCH74wFRu+2KDn4J9MOVkfswTMKwWYC+YpiqaGkeel7xrc9ShTbg
 SqbJq3oqD69ZhyxLnLJ1lKuYwddUYPJxnebal/jJPcTr4TlmS9ifrJPRO00VSrJppAUg
 VjXompE+cid1rUC/dJgwL5iCB+UfvbK57zWt4QzjvLiaH0Nb+skscxPkVWLOgJObtEES
 HJd+alHc8uekj4MBtlzLCKMtaXUnA8PJ/B1CEZuFsSfhYoUTcbF7znleMrQ4teZ0vVBb
 MOW0HQ8InFYFL2MRNDge1GPV6nvRGpYkUT7TEHRhXY2mK2M5o/dbtXB2VMcvwjTPnbOq BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakur7dt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2020 14:48:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7DE2100034;
 Fri, 10 Jan 2020 14:48:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C46BC2BC7C9;
 Fri, 10 Jan 2020 14:48:56 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Jan 2020 14:48:56 +0100
From: Ludovic Barre <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 10 Jan 2020 14:48:14 +0100
Message-ID: <20200110134823.14882-1-ludovic.barre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_01:2020-01-10,
 2020-01-09 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/9] mmc: mmci: sdmmc: add sdr104 support
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

To support the sdr104 mode, sdmmc variant needs:
-Hardware delay block support for sdmmc variant
 with tuning procedure
-Voltage switch callbacks
-sdmmc revision 2.0

Ludovic Barre (9):
  mmc: mmci: sdmmc: replace sg_dma_xxx macros
  mmc: mmci: sdmmc: rename sdmmc_priv struct to sdmmc_idma
  mmc: mmci: add a reference at mmc_host_ops in mmci struct
  mmc: mmci: add private pointer for variant
  dt-bindings: mmc: mmci: add delay block base register for sdmmc
  mmc: mmci: sdmmc: add execute tuning with delay block
  mmc: mmci: add volt_switch callbacks
  mmc: mmci: sdmmc: add voltage switch functions
  mmc: mmci: add sdmmc variant revision 2.0

 .../devicetree/bindings/mmc/mmci.txt          |   2 +
 drivers/mmc/host/mmci.c                       |  39 ++++
 drivers/mmc/host/mmci.h                       |   8 +
 drivers/mmc/host/mmci_stm32_sdmmc.c           | 199 +++++++++++++++++-
 4 files changed, 241 insertions(+), 7 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
