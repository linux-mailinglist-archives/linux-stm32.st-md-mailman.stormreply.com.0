Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87890301DD7
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Jan 2021 18:13:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27D08C57181;
	Sun, 24 Jan 2021 17:13:30 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFAEFC5717F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Jan 2021 17:13:29 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DP02K1vZFz1qsk3;
 Sun, 24 Jan 2021 18:13:29 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DP02K1cTnz1tYWg;
 Sun, 24 Jan 2021 18:13:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 4XR0D610cEHm; Sun, 24 Jan 2021 18:13:28 +0100 (CET)
X-Auth-Info: P6HiCJfvbKDGSqqk0x9soHRpqk71jMyhCup4E8zRpaM=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 24 Jan 2021 18:13:28 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 24 Jan 2021 18:13:25 +0100
Message-Id: <20210124171325.33328-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: use exti 19 as main
	interrupt to support RTC wakeup on stm32mp157
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

From: Alexandre Torgue <alexandre.torgue@st.com>

Link between GIC and exti line is now done inside EXTI driver. So in order
to be wake up source exti irqchip has to be used.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 0d4db78ae255..169b7bdd832e 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1541,7 +1541,7 @@ rtc: rtc@5c004000 {
 			reg = <0x5c004000 0x400>;
 			clocks = <&rcc RTCAPB>, <&rcc RTC>;
 			clock-names = "pclk", "rtc_ck";
-			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts-extended = <&exti 19 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
