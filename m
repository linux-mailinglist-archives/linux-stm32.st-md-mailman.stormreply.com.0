Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7EC595FEB
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Aug 2022 18:14:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B69DBC5E2C2;
	Tue, 16 Aug 2022 16:14:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFA60C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Aug 2022 16:14:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GBKpBO005831;
 Tue, 16 Aug 2022 18:14:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=qP/LM/Dp36sWiV7fPSfYlt7cCniRU3gHuTlVC1r1NOE=;
 b=RTegEcAAzmmoY9zSO5EATPkVE04GpF/UCgUAGO3N750Ac1wp5WRH7tKo6oqGiM7wn+NE
 05e95KYE0f1I0U3mhqvsJMW49nWsh7Nc3if6bCuqYBughVAFwpTYVU29SY9OCCGo5aqQ
 IE4Z3ye61g/uwbjbSgq/He0NkVH1qxDmqBX5ef+tV+pBzXkR3OZ8qpdqzOKGF7/3aS9Z
 VrVgoz2gzNOJzutVzG/ZPc7kUvj7vq/hQGrjG44pEpC4LGQADM/hHJM4T1hfSayh8CFE
 ryNofU47rZLL3QjUZ/BRrqf1yNhzgSalsgqS2u0ZHvRY44bq9ftbinFgqwFhvJ7iqQV5 ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hx2uhfpq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 18:14:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F220410002A;
 Tue, 16 Aug 2022 18:14:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68C1123BE1A;
 Tue, 16 Aug 2022 18:14:02 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 16 Aug
 2022 18:14:02 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Tue, 16 Aug 2022 18:13:42 +0200
Message-ID: <20220816161344.2599908-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/2] spi: stm32_qspi: use QSPI bus as 8
	lines communication channel
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

The goal of this series is to allow to use QSPI bus as a 8 lines communication 
channel for specific purpose.

The QSPI block offers the possibility to communicate with 2 flashes in 
parrallel using the dual flash mode, 8 data lines are then used.
Usage of cs-gpios populated and spi-tx-bus-width / spi-rx-bus-width both set to 8,
is needed to enable dual flash mode.

The addition of the legacy transfer_one_message() spi callback is also needed
as currently the stm32-qspi driver only supports spi_controller_mem_ops API.

Patrice Chotard (2):
  ARM: dts: stm32: Create separate pinmux for qspi cs pin in
    stm32mp15-pinctrl.dtsi
  spi: stm32_qspi: Add transfer_one_message() spi callback

 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi |  50 ++++++---
 arch/arm/boot/dts/stm32mp157c-ev1.dts    |  12 ++-
 drivers/spi/spi-stm32-qspi.c             | 125 +++++++++++++++++++++--
 3 files changed, 159 insertions(+), 28 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
