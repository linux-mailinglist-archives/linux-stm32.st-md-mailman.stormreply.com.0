Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6D28E0C6
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 14:55:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 343A6C424BD;
	Wed, 14 Oct 2020 12:55:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 611BFC3FADE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 12:55:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09ECqvba015323; Wed, 14 Oct 2020 14:55:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=dnkYwDz5SS1iDJhEQKZPv8UZFz9BDhGoeNxvfvCK17U=;
 b=oJf4wMO7MTpOWr0vouC5My5miUW9zEpWngcncd3sQaAZyzVMK8z9awfWZBEKAM8SoJ0u
 XsNTEG3cWj6gALuT7/NiGj0c8zJOrdcLk56fIrM04kHGT/5+2S+H8tA173CKnN0eZv95
 y5j5T4AH8Pz4dMr2WBaAy6TH5oRtIxeCSJRR1NP3zUq1QgjQILBkUQIATA2Vzq76ki5F
 v4Y0aCIEkpatPNwQiquiBxVllDtZVvl/sMt7WbUC0EINvnZd04W8uZWXEv8C38f8CpRi
 y1JsHdAP2Q3A3n26/4k/GpYP+RT2ophjJBS0uyAPUueTiye5UTEmelPGAmCeP/IRrjh9 Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3455c8hqqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 14:55:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09480100034;
 Wed, 14 Oct 2020 14:55:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E93D32DA529;
 Wed, 14 Oct 2020 14:55:06 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 14:55:06
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Rob Herring <robh@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Wed, 14 Oct 2020 14:54:37 +0200
Message-ID: <20201014125441.2457-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_07:2020-10-14,
 2020-10-14 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] ARM: stm32: add DT properties for
	remote proc synchronisation
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

This series implements the DT part associated to the commit 9276536f455b3
("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")

Delta vs V1 [1]
- add Rob acked-by on patch 1/4
- simplify yaml descriptions and align other syscon descriptions

[1]https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=339339

Arnaud Pouliquen (4):
  dt-bindings: arm: stm32: Add compatible for syscon tamp node
  dt-bindings: remoteproc: stm32_rproc: update for firmware
    synchronization
  dt-bindings: remoteproc: stm32_rproc: update syscon descriptions
  ARM: dts: stm32: update stm32mp151 for remote proc synchronization
    support

 .../bindings/arm/stm32/st,stm32-syscon.yaml   |  1 +
 .../bindings/remoteproc/st,stm32-rproc.yaml   | 21 +++++++++++++------
 arch/arm/boot/dts/stm32mp151.dtsi             |  7 +++++++
 3 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
