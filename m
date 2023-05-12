Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F4B700403
	for <lists+linux-stm32@lfdr.de>; Fri, 12 May 2023 11:39:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2708BC6A608;
	Fri, 12 May 2023 09:39:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5314C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 May 2023 09:39:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C82PwY015048; Fri, 12 May 2023 11:39:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=3cg3EVB9ewH286o8slPPUl1HT2sepf8ePI6K7LlsZTk=;
 b=Bnz/gsasrj/TaS8+u/rC2ZjFtOBNRBURDfpwDLM19uzxH2yggqpkSYMZuwr/W/DoCKpI
 U4xPWZ42lRH9kQJLG7WGx9gCrR4Zm6UXcyKGnpKZMw6ZEpSceYvPNJAF1YycFB6OA8y6
 KX1AV+yrSQPi7NV9J3W/mixaUEJ6J5BZCTaUgfiZ/KTrbBCWhNUqUvnCjv5f+TAZreHY
 CAMbUxtzuvAM7hj5F/HQA/GPAVn/gbZg2d50Dq+f6lhlwieY62YdJZzPRgEEwyzWeCmg
 1zSQZW61vaFQhSdbTPHM1/wcDJt/A09PITR7D7hXxEazjLlj9kgx7C0rGvecfM+DNP1q KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qg90px1xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 11:39:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A276C10002A;
 Fri, 12 May 2023 11:39:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79DE12248B0;
 Fri, 12 May 2023 11:39:29 +0200 (CEST)
Received: from localhost (10.201.21.213) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 12 May
 2023 11:39:29 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Fri, 12 May 2023 11:39:22 +0200
Message-ID: <20230512093926.661509-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_06,2023-05-05_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/4] stm32mp15: update remoteproc to
	support SCMI Device tree
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

Update vs V2[1]:
---------------
- update yaml to remove label in examples
- fix error management for  devm_reset_control_get_optional(dev, "hold_boot")
- rebased on commit ac9a78681b92 ("Linux 6.4-rc1")

[1]https://lore.kernel.org/lkml/20230504094641.870378-1-arnaud.pouliquen@foss.st.com/T/


Description:
-----------
This series updates the stm32_rproc driver and associated DT node to
support device tree configuration with and without SCMI server. 
The impact is mainly on the MCU hold boot management.

Three configurations have to be supported:

1) Configuration without OP-TEE SCMI (legacy): Trusted context not activated
- The MCU reset is controlled through the Linux RCC reset driver.
- The MCU HOLD BOOT is controlled through The RCC sysconf.

2) Configuration with SCMI server: Trusted context activated
- The MCU reset is controlled through the SCMI reset service.
- The MCU HOLD BOOT is no more controlled through a SMC call service but
  through the SCMI reset service.

3) Configuration with OP-TEE SMC call (deprecated): Trusted context activated
- The MCU reset is controlled through the Linux RCC reset driver.
- The MCU HOLD BOOT is controlled through The SMC call.

In consequence this series:
- adds the use of the SCMI reset service to manage the MCU hold boot,
- determines the configuration to use depending on the presence of the
  "reset-names" property
  if ( "reset-names" property contains "hold_boot")
  then use reset_control services
  else use regmap access based on "st,syscfg-holdboot" property.
- set the DT st,syscfg-tz property as deprecated

Arnaud Pouliquen (4):
  dt-bindings: remoteproc: st,stm32-rproc: Rework reset declarations
  remoteproc: stm32: Allow hold boot management by the SCMI reset
    controller
  ARM: dts: stm32: Update reset declarations
  ARM: dts: stm32: fix m4_rproc references to use SCMI

 .../bindings/remoteproc/st,stm32-rproc.yaml   | 44 +++++++++--
 arch/arm/boot/dts/stm32mp151.dtsi             |  2 +-
 arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts    |  6 +-
 arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts    |  6 +-
 arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts    |  6 +-
 arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts    |  6 +-
 drivers/remoteproc/stm32_rproc.c              | 76 ++++++++++++++-----
 7 files changed, 111 insertions(+), 35 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
