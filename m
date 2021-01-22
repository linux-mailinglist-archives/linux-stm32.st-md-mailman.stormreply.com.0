Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2D8300320
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jan 2021 13:34:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63FFFC5663B;
	Fri, 22 Jan 2021 12:34:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8468AC424BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jan 2021 10:51:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10MAlTsr011262; Fri, 22 Jan 2021 11:51:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=fjN6svtjO74tNZ1Ok1Ake2zcQjDu374eT+xfJTpGg3k=;
 b=nrv1/d7njRbg8g6mGRJpe5HMuC/r73jnzhbkd2faZeNconTfC7BpQNDBNYD80cF9Ez0O
 MeAIPB5/CfGTP3wjwHPJSmzMd7GqE2etQDQxVZ2z0Ck8Nn7uV4R0ugd4BO20Enkv+F+M
 RloLlMktV6+kj8eTeqbfUMFSlPpgauXGKg1d8Skf8E92eegN8bGPYlWUdWiEIzAd8gcF
 SmtsctrWwOBFn5Vp93AiBoxRAClofjhJFDUhPC3X8aEVkAL4qbVYSMgCLb39nsD6Ttn9
 EdfAFQGyCWHhK4suZgA/MhLWeywlBFMjC/SWNkS0fHELso7YuSOrP3+18XFJMahUiTbc Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pe1e16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 11:51:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 777B210002A;
 Fri, 22 Jan 2021 11:51:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5248122DBCA;
 Fri, 22 Jan 2021 11:51:16 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Jan 2021 11:51:15
 +0100
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Etienne Carriere
 <etienne.carriere@st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 22 Jan 2021 11:50:47 +0100
Message-ID: <20210122105101.27374-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_06:2021-01-21,
 2021-01-22 signatures=0
X-Mailman-Approved-At: Fri, 22 Jan 2021 12:34:42 +0000
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 00/14] Introduce STM32MP1 RCC in secured mode
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

Platform STM32MP1 can be used in configuration where some clocks and
IP resets can relate as secure resources.
These resources are moved from a RCC clock/reset handle to a SCMI
clock/reset_domain handle.

The RCC clock driver is now dependant of the SCMI driver, then we have
to manage now the probe defering.

Gabriel Fernandez (14):
  clk: stm32mp1: merge 'clk-hsi-div' and 'ck_hsi' into one clock
  clk: stm32mp1: merge 'ck_hse_rtc' and 'ck_rtc' into one clock
  clk: stm32mp1: remove intermediate pll clocks
  clk: stm32mp1: convert to module driver
  clk: stm32mp1: move RCC reset controller into RCC clock driver
  reset: stm32mp1: remove stm32mp1 reset
  dt-bindings: clock: add IDs for SCMI clocks on stm32mp15
  dt-bindings: reset: add IDs for SCMI reset domains on stm32mp15
  dt-bindings: reset: add MCU HOLD BOOT ID for SCMI reset domains on
    stm32mp15
  clk: stm32mp1: new compatible for secure RCC support
  ARM: dts: stm32: define SCMI resources on stm32mp15
  ARM: dts: stm32: move clocks/resets to SCMI resources for stm32mp15
  dt-bindings: clock: stm32mp1 new compatible for secure rcc
  ARM: dts: stm32: introduce basic boot include on stm32mp15x board

 .../bindings/clock/st,stm32mp1-rcc.yaml       |   3 +-
 arch/arm/boot/dts/stm32mp15-no-scmi.dtsi      | 158 ++++++
 arch/arm/boot/dts/stm32mp151.dtsi             | 127 +++--
 arch/arm/boot/dts/stm32mp153.dtsi             |   4 +-
 arch/arm/boot/dts/stm32mp157.dtsi             |   2 +-
 arch/arm/boot/dts/stm32mp15xc.dtsi            |   4 +-
 drivers/clk/Kconfig                           |  10 +
 drivers/clk/clk-stm32mp1.c                    | 495 +++++++++++++++---
 drivers/reset/Kconfig                         |   6 -
 drivers/reset/Makefile                        |   1 -
 drivers/reset/reset-stm32mp1.c                | 115 ----
 include/dt-bindings/clock/stm32mp1-clks.h     |  27 +
 include/dt-bindings/reset/stm32mp1-resets.h   |  15 +
 13 files changed, 702 insertions(+), 265 deletions(-)
 create mode 100644 arch/arm/boot/dts/stm32mp15-no-scmi.dtsi
 delete mode 100644 drivers/reset/reset-stm32mp1.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
