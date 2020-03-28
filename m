Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3373C1968DB
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Mar 2020 20:07:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C683BC36B0B;
	Sat, 28 Mar 2020 19:07:34 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD29DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2020 19:07:32 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48qSsH2k4Hz1rn32;
 Sat, 28 Mar 2020 20:07:31 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48qSsH24fvz1qv4p;
 Sat, 28 Mar 2020 20:07:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id p_Vu8Mwqx3Au; Sat, 28 Mar 2020 20:07:30 +0100 (CET)
X-Auth-Info: lUdezXcNti/4NL4eKD6TAmN5/K425B/qcOQRX3w0ulw=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 28 Mar 2020 20:07:30 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sat, 28 Mar 2020 20:07:25 +0100
Message-Id: <20200328190725.68468-1-marex@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable HS200 on AV96
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

Enable MMC HS200 mode on AV96. This needs PLL4P to run at 100 MHz,
as the PLL is limited to 130 MHz and the 100 MHz is most suitable
for dividing the clock down both to 50 MHz for DDR52 and 100 MHz
for HS200.

The performance figures are not that different between DDR52 and
HS200 though:

    $ cat /sys/kernel/debug/mmc2/ios
    clock:          52000000 Hz
    actual clock:   50000000 Hz
    vdd:            7 (1.65 - 1.95 V)
    bus mode:       2 (push-pull)
    chip select:    0 (don't care)
    power mode:     2 (on)
    bus width:      3 (8 bits)
    timing spec:    8 (mmc DDR52)
    signal voltage: 1 (1.80 V)
    driver type:    0 (driver type B)
    $ dd if=/dev/mmcblk2 of=/dev/null bs=128M count=16 conv=sync
    16+0 records in
    16+0 records out
    2147483648 bytes (2.1 GB, 2.0 GiB) copied, 26.3924 s, 81.4 MB/s

    $ cat /sys/kernel/debug/mmc2/ios
    clock:          100000000 Hz
    actual clock:   100000000 Hz
    vdd:            7 (1.65 - 1.95 V)
    bus mode:       2 (push-pull)
    chip select:    0 (don't care)
    power mode:     2 (on)
    bus width:      3 (8 bits)
    timing spec:    9 (mmc HS200)
    signal voltage: 1 (1.80 V)
    driver type:    0 (driver type B)
    $ dd if=/dev/mmcblk2 of=/dev/null bs=128M count=16 conv=sync
    16+0 records in
    16+0 records out
    2147483648 bytes (2.1 GB, 2.0 GiB) copied, 25.2144 s, 85.2 MB/s

Note that if there is a way to run the PLL4P at 200 MHz, this HS200
support might be far more interesting.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp157a-avenger96.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
index 5292d746ab0b..f44511abc6ee 100644
--- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
@@ -520,6 +520,7 @@ &sdmmc2 {
 	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_b>;
 	bus-width = <8>;
 	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
 	no-sd;
 	no-sdio;
 	non-removable;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
