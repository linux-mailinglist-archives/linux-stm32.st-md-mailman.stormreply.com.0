Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EA734245
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2019 10:55:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FE74C544F8
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2019 08:55:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC92DC544F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2019 08:55:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x548tKLL021280; Tue, 4 Jun 2019 10:55:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=aeRZHet8+3ng2HzHWI6D57uf7dMIn0WG1kjDInB0Y8s=;
 b=wiKlCJWMv8lNPSmBz84bvLgrRRzwH7Tdnn57y/e+lH3rwW6YNBFk715p8vQlrG0EeHAj
 P9hJBWBssMTTmBjE7FS8g58EUH4icp+Z5fzOZD3IU4CMNjqInVPxOxp8tWA9P/IpoLyT
 1yxYYI211XVh1IvWTEAhfAOv2ofLBPYfw+S0h03B/93sDS0ecOW0KAWl9hu9pnddQ/1Y
 fUcuMqIe7LitRBXZ836EwKcWGUnoVesQm0SPZPn9rJRV+SJVWiHu75dcERTR6Vfh/v3z
 g6NshufKOarSyR0AszxMPlGgJNcZeChWbEZUQK4xXxQIXmQYtsAzRnwaDcueef4o9Cn5 yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sundryngq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 04 Jun 2019 10:55:28 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34DFA163;
 Tue,  4 Jun 2019 08:55:24 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 066B92507;
 Tue,  4 Jun 2019 08:55:24 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 4 Jun 2019
 10:55:23 +0200
Received: from localhost (10.201.23.31) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 4 Jun 2019 10:55:23
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>
Date: Tue, 4 Jun 2019 10:55:09 +0200
Message-ID: <1559638519-6128-1-git-send-email-erwan.leray@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.31]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-04_07:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Erwan Le Ray <erwan.leray@st.com>, linux-serial@vger.kernel.org, Fabrice
 Gasnier <fabrice.gasnier@st.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/10] STM32 usart power improvements
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

This series delivers power improvements for stm32-usart driver.

Bich Hemon (4):
  dt-bindings: serial: add optional pinctrl states
  serial: stm32: select pinctrl state in each suspend/resume function
  ARM: dts: stm32: Update pin states for uart4 on stm32mp157c-ed1
  ARM: dts: stm32: Update UART4 pin states on stm32mp157a-dk1

Erwan Le Ray (6):
  dt-bindings: serial: stm32: add wakeup option
  serial: stm32: add pm_runtime support
  serial: stm32: Use __maybe_unused instead of #if CONFIG_PM_SLEEP
  serial: stm32: add support for no_console_suspend
  ARM: dts: stm32: update uart4 pin configurations for low power
  ARM: dts: stm32: add wakeup capability on each usart/uart on
    stm32mp157c

 .../devicetree/bindings/serial/st,stm32-usart.txt  | 19 ++++-
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          | 17 +++++
 arch/arm/boot/dts/stm32mp157a-dk1.dts              |  5 +-
 arch/arm/boot/dts/stm32mp157c-ed1.dts              |  5 +-
 arch/arm/boot/dts/stm32mp157c.dtsi                 | 40 ++++++++--
 drivers/tty/serial/stm32-usart.c                   | 88 ++++++++++++++++++++--
 drivers/tty/serial/stm32-usart.h                   |  1 +
 7 files changed, 155 insertions(+), 20 deletions(-)

-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
