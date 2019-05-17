Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CD22157B
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2019 10:42:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65C7FC5F1F6
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2019 08:42:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20F56C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2019 08:42:29 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4H8cNMc032499; Fri, 17 May 2019 10:42:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=uSLvWJ3dEGW9QdGxFgJ/sUFT5ymEF6rJMqGW79HtTfo=;
 b=c5frr6oN8I07Ij66WW1SwP7W+JMkiOvn2oHcDxNbqFXNQFTKOzSA8ohbncXhKnF0Pqns
 sKt4RrIiz7GFMLawIFZkqABUaWFlB4WYl2EuVmVZqUHsDyMPFXOFLX37kOLr9BuRByEe
 rdoj0EAM40DNxUJhSijlHRYS6UKkHj6nRHjirZFhOF27NXNEhgyHHActJR1zaadetisD
 gtcTBBTjNaYjmjtD0ROTqeYHmMMGyL6GpjFzK5qWoz0tfV4lYcgJ+fcdPMmHSwK1woql
 Px0PNZ6r+XOuJFIjyQSItIOy0Y37nwnwF6C3c1cXN8zuAJPSq14ICeAFtsqi5Nj/SWXn tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sg0anjddj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 17 May 2019 10:42:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8179342;
 Fri, 17 May 2019 08:42:12 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1116B246F;
 Fri, 17 May 2019 08:42:12 +0000 (GMT)
Received: from localhost (10.75.127.51) by SFHDAG5NODE2.st.com (10.75.127.14)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 17 May 2019 10:42:11 +0200
From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Lucas Stach <l.stach@pengutronix.de>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 17 May 2019 10:42:05 +0200
Message-ID: <1558082528-12889-1-git-send-email-pierre-yves.mordret@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_04:, , signatures=0
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [Linux-stm32] [RESEND v2 0/3] Add Vivante GPU support on STM32MP157c
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

Add and enable Vivante GPU on stm32mp157c for ED1, DK1 and DK2 boards.
---
  Version history:
    v2:
       * move GPU reserved memeory out of bottom DDR to let free this area for
         U-Boot
    v1:
       * Initial
---
Pierre-Yves MORDRET (3):
  ARM: dts: stm32: Add Vivante GPU support on STM32MP157c
  ARM: dts: stm32: enable Vivante GPU support on stm32mp157c-ed1 board
  ARM: dts: stm32: enable Vivante GPU support on stm32mp157a-dk1 board

 arch/arm/boot/dts/stm32mp157a-dk1.dts | 16 ++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 16 ++++++++++++++++
 arch/arm/boot/dts/stm32mp157c.dtsi    | 10 ++++++++++
 3 files changed, 42 insertions(+)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
