Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96130D714B
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2019 10:42:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5825FC36B0B;
	Tue, 15 Oct 2019 08:42:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C935C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 08:42:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9F8fLfY022078; Tue, 15 Oct 2019 10:41:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=VcswSaQgjwVPJKQoYkqU+reFn99J6VbQH4Gn2WoEbg4=;
 b=wOJ7FvhBt0tKm13YE/KziypjLfgScNJumVeh9zev23ZAbAQjnszYIi6qKLuZypqCx+14
 Y+8eY8/UY1WbhXEpfgOGbmDdMu0LvhkGlp/LGYCKg0wrgYsihDxx1+vxMhyrWOGGRAvI
 KcLEs6XaogPQCe4XZDFeYo7Vrr0yCOdKGAPhp1c8zi2xz5lu6EyuHEWuKcfNYFqQIJoQ
 xHPrKi1v5FrWdEE03xZpxiiaUmshtMvbHS2XOL2OYNxXGTTe2vxUXde7JFwIu4HeyaZ9
 3F8Hjo6ZenpA2iSOAnja6zpvbq5Iemdu0OtsNEPUd+9PWkRT0Kjbj93i8DDz9wwkiPHx NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vk4a1728e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Oct 2019 10:41:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6D4D100039;
 Tue, 15 Oct 2019 10:41:42 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9118D2B758D;
 Tue, 15 Oct 2019 10:41:42 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct
 2019 10:41:42 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct 2019 10:41:41
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <linux@armlinux.org.uk>, <tglx@linutronix.de>, <gregkh@linuxfoundation.org>
Date: Tue, 15 Oct 2019 10:41:39 +0200
Message-ID: <20191015084139.8510-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-15_04:2019-10-15,2019-10-15 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] arm: kernel: initialize broadcast hrtimer
	based clock event device
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

On platforms implementing CPU power management, the CPUidle subsystem
can allow CPUs to enter idle states where local timers logic is lost on power
down. To keep the software timers functional the kernel relies on an
always-on broadcast timer to be present in the platform to relay the
interrupt signalling the timer expiries.

For platforms implementing CPU core gating that do not implement an always-on
HW timer or implement it in a broken way, this patch adds code to initialize
the kernel hrtimer based clock event device upon boot (which can be chosen as
tick broadcast device by the kernel).
It relies on a dynamically chosen CPU to be always powered-up. This CPU then
relays the timer interrupt to CPUs in deep-idle states through its HW local
timer device.

Having a CPU always-on has implications on power management platform
capabilities and makes CPUidle suboptimal, since at least a CPU is kept
always in a shallow idle state by the kernel to relay timer interrupts,
but at least leaves the kernel with a functional system with some working
power management capabilities.

The hrtimer based clock event device is unconditionally registered, but
has the lowest possible rating such that any broadcast-capable HW clock
event device present will be chosen in preference as the tick broadcast
device.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
Note:
- The same reasons lead to same patch than for arm64 so I have copy the
  commit message from: 9358d755bd5c ("arm64: kernel: initialize broadcast
  hrtimer based clock event device")
 arch/arm/kernel/time.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/kernel/time.c b/arch/arm/kernel/time.c
index b996b2cf0703..dddc7ebf4db4 100644
--- a/arch/arm/kernel/time.c
+++ b/arch/arm/kernel/time.c
@@ -9,6 +9,7 @@
  *  reading the RTC at bootup, etc...
  */
 #include <linux/clk-provider.h>
+#include <linux/clockchips.h>
 #include <linux/clocksource.h>
 #include <linux/errno.h>
 #include <linux/export.h>
@@ -107,5 +108,6 @@ void __init time_init(void)
 		of_clk_init(NULL);
 #endif
 		timer_probe();
+		tick_setup_hrtimer_broadcast();
 	}
 }
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
