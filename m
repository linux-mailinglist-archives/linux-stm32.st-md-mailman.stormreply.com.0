Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8AA3A6C66
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jun 2021 18:50:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80540C597B4;
	Mon, 14 Jun 2021 16:50:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FD77C597B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jun 2021 16:50:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EGmDJW015215; Mon, 14 Jun 2021 18:50:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=/9D3/0H3bHA9sU2AK/C1nUebkqDvEpgx+D4YIfVFv5s=;
 b=KvkMyXtJRXZMcLaPnOzP5r1xVlPZv81gXFTvMuN6BIdhP5clixs7x+xB2gjdqk5inIjs
 TY6VTB9E9uFPKutcvLNtSJrqJFe30MLW9UUAXIoPcvZxVZLHnOK1eOLki956UlguXFBR
 x4fDRtMRppp+aIndW+8XiDRHIvptum2XNMlwWr/n/R796B4BPd4eVhDtVm5JFjvwTrYZ
 u1U81vE6582HxHwqpVMdU3xWsXBHdF+sm3CdnU2f2ILoee05v9VKrV9cQfPmbC1wB7eM
 5qskzf3jo/6GqY1cVR9uV112QbA0sZjc5IxSfhpYszhKOMD2sBfMuUaNtPTQVJhuSGXX dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3963682q6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 18:50:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DF70100034;
 Mon, 14 Jun 2021 18:50:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B58221CE24;
 Mon, 14 Jun 2021 18:50:42 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Jun 2021 18:50:41
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 14 Jun 2021 18:49:38 +0200
Message-ID: <20210614164940.27153-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_10:2021-06-14,
 2021-06-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] Add new IPCC mailbox to support the
	coprocessor detach on some stm32mp15x boards
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

Purpose:
  Add the IPCC channel 4 as "detach" mailbox to support the remoteproc the feature added in [1].

  The enable of this feature is a design choice. As consequence, the new mbox is declared
  only for stm32mp157c-ed1 & stm32mp15x-dkx boards maintained by ST Microelectronics.

Aim:
  Allow to send to the remote processor a HW signal on IPCC channel 4 when user space requests
  to detach the main processor from the remote processor (e.g. a reboot of the  Linux processor
  on a crash).

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/cover/20210331073347.8293-1-arnaud.pouliquen@foss.st.com/

Arnaud Pouliquen (2):
  ARM: dts: stm32: Add coprocessor detach mbox on stm32mp157c-ed1 board
  ARM: dts: stm32: Add coprocessor detach mbox on stm32mp15x-dkx boards

 arch/arm/boot/dts/stm32mp157c-ed1.dts  | 4 ++--
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
