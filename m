Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5293ADFCE
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Jun 2021 20:54:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3DE3C57B53;
	Sun, 20 Jun 2021 18:54:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AD11C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Jun 2021 18:54:45 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A43CF80563;
 Sun, 20 Jun 2021 20:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624215285;
 bh=pEwAkkdSjOHyQs489xfSDtYybs4YRZoL2vz4J9Z+crM=;
 h=From:To:Cc:Subject:Date:From;
 b=Zm8gIWEs8XxNHlXBe+BATziK6fKRnej+slr5VAA+fwa06IFBkm+qergqwKv8hlfTQ
 tFSrNp8DSGEzGDXqXe/V5Fv2Gy3rQAY3prdvp3nDPPwiY0M1yXdhJvCaoqn426CMZE
 8wMq0C2NbzknZPGJBhN5ct08y4jyv2kyenCyIybqYmr8+zQLDLAbvDOju4fyK12dbh
 WVtjsZD6idvWiE1NSiY4Qg5yOEwUPoIWa5WCRVnE28QdXKMdeSr+N2jAwfrtMzp9mI
 p/fQwBJ3qMxc4yQ2jrS3Bhhojqlmf33bbx5Cd7aXnZO4uDcWQVtXxDGWNW12siNjSY
 9OM+l0VGzyHJg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 20 Jun 2021 20:54:21 +0200
Message-Id: <20210620185421.89967-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Prefer HW RTC on DHCOM SoM
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

The DHCOM SoM has two RTC, one is the STM32 RTC built into the SoC
and another is Microcrystal RV RTC. By default, only the later has
battery backup, the former does not. The order in which the RTCs
are probed on boot is random, which means the kernel might pick up
system time from the STM32 RTC which has no battery backup. This
then leads to incorrect initial system time setup, even though the
HW RTC has correct time configured in it.

Add DT alias entries, so that the RTCs get assigned fixed IDs and
the HW RTC is always picked by the kernel as the default RTC, thus
resulting in correct system time in early userspace.

Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 2af0a6752674..8349c9099e30 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -12,6 +12,8 @@ / {
 	aliases {
 		ethernet0 = &ethernet0;
 		ethernet1 = &ksz8851;
+		rtc0 = &hwrtc;
+		rtc1 = &rtc;
 	};
 
 	memory@c0000000 {
@@ -248,7 +250,7 @@ &i2c4 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
 
-	rtc@32 {
+	hwrtc: rtc@32 {
 		compatible = "microcrystal,rv8803";
 		reg = <0x32>;
 	};
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
