Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC241312D1
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2020 14:29:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99211C36B14;
	Mon,  6 Jan 2020 13:29:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 484FCC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2020 13:29:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006DRPL1006050; Mon, 6 Jan 2020 14:29:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=AI7zr+DJogbnJyM7WwYjfDpAv8ZqvsAx0EghXGtiEsY=;
 b=mW6/WIqFXADnLAu0PCBTTdooe37M1DzS5V01SqY+DseFqDMXh6d+ncN2Xgd8bzz2XqJB
 04igZi1dhtUAa7wgvQjcBRHTShX1t7AL7+qRmcElptat874d1QsS10OiIrxRgMJq55B2
 FGg6GrCW2G6DhwB+eFgpUGdomQ8FFZkX2ZzfQgZYl5onFZ2E2bQUPhqfW5+/NwZvHlRj
 gQOv/fgWxO/+jypEwItk9qmDk+lzvFEIc8qSfxE9kIieCHWAabcQm1dg9LcbEjZUOERW
 aJLLeFe8HcB1OmvmKbG7MSLLUa/6wRQHyE4k5tpImFXFMh3S6lxTAtmqNeU0PEsbAtN2 Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakm584u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 14:29:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D6B3100034;
 Mon,  6 Jan 2020 14:29:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 760DA2D378B;
 Mon,  6 Jan 2020 14:29:41 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 6 Jan 2020 14:29:41
 +0100
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@the-dreams.de>, <robh+dt@kernel.org>
Date: Mon, 6 Jan 2020 14:28:28 +0100
Message-ID: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_04:2020-01-06,2020-01-06 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] i2c-stm32f7: support suspend/resume &
	wakeup
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

This serie replaces the previously sent serie "stm32: i2c: Add suspend/resume & add sleep pinctrls".

This serie adds support for pm sleep suspend / resume and allow I2C slave to be
a wakeup-source for the system.

Alain Volmat (6):
  ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp15xx-dkx
  ARM: dts: stm32: add i2c2/i2c5 sleep pinctrl on stm32mp157c-ev1
  ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp157c-ed1
  i2c: i2c-stm32f7: add PM_SLEEP suspend/resume support
  i2c: i2c-stm32f7: allow controller to be wakeup-source
  ARM: dts: stm32: add wakeup-source in all I2C nodes of stm32mp157c

 arch/arm/boot/dts/stm32mp151.dtsi      |   6 ++
 arch/arm/boot/dts/stm32mp157c-ed1.dts  |   3 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts  |   6 +-
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi |   3 +-
 drivers/i2c/busses/i2c-stm32f7.c       | 187 ++++++++++++++++++++++++++++++++-
 5 files changed, 196 insertions(+), 9 deletions(-)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
