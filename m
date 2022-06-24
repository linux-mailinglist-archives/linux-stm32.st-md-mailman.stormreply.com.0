Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C824559682
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jun 2022 11:27:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7D5EC5E2C6;
	Fri, 24 Jun 2022 09:27:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F40AC0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jun 2022 09:27:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25O7qemY003113;
 Fri, 24 Jun 2022 11:27:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=usLNLotBGToCxJsJXsHAoM3bXkIn5CHECuPg1mXKElQ=;
 b=EPRVskc/YVHx0Ckg3qx6WjkgSp1H8a6m2eEErT1aU5At0w36rnxGCZ6Ck7IY1akfMjWQ
 lLxGY5sE5ZAJCC/3EU4ZXnKIFSWvU58VORz9eX+JFY6aYWoStJHHoosHv/DG0CX8Uk3u
 jtf4n7I2TqfCYwXVHPo7uhCWZNF4WUrWi57zoPKTS88q+8D6rORQtAAKiOjzJkcZatJ7
 WRpybOYFt0hNKieVGICag5DaHAjhdDPhGc2ou6Lu4YoGUKgNeDkL+sVG4wfuDjhp2dBN
 stoPY7WQxDEsTQJtO0SG0IcIGjL0eiUqv0i7VfDyf0j152mWnVSskmsOCKDaIPgeU01P fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gvn8s7r4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 11:27:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 367E010002A;
 Fri, 24 Jun 2022 11:27:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 307922138D8;
 Fri, 24 Jun 2022 11:27:18 +0200 (CEST)
Received: from localhost (10.75.127.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 24 Jun
 2022 11:27:17 +0200
From: <gabriel.fernandez@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 24 Jun 2022 11:27:12 +0200
Message-ID: <20220624092715.1397827-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_05,2022-06-23_01,2022-06-22_01
Cc: devicetree@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/3] SCMI Update for STM32MP15 boards
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Update for SCMI version of ST boards:
- delete fixed clocks because there are now provided by SCMI
- add missing SCMI impact for DSI IP on DK1/ED1 STM32 board
- fix peripheral clock for CEC 

Gabriel Fernandez (3):
  ARM: dts: stm32: use the correct clock source for CEC on stm32mp151
  ARM: dts: stm32: DSI should use LSE SCMI clock on DK1/ED1 STM32 board
  ARM: dts: stm32: delete fixed clock node on STM32MP15-SCMI

 arch/arm/boot/dts/stm32mp15-scmi.dtsi      | 6 ++++++
 arch/arm/boot/dts/stm32mp151.dtsi          | 2 +-
 arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts | 4 ++++
 arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts | 4 ++++
 4 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
