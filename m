Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE243E7FBD
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Aug 2021 19:43:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BB23C5A4CF;
	Tue, 10 Aug 2021 17:43:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2487FC5A4CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Aug 2021 17:43:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EA4B61353;
 Tue, 10 Aug 2021 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628617385;
 bh=H61AsbX+klO8h8ZimImvpr0iHwB9YclTk4dIgaVlVcI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GVk2lk0G1eN9Uc26vSy6QcXbanwCjXpJ0CUwqLJ5vbhgOk+7SSJWpLgPX+Iim94Xk
 YG9eIpayu1uKCvlLQs/Pru1zNgAeUkCYBJusZU1arFQnGTddDSl7afi9u+OqvAlyGr
 5WEGYJaKrlSSo5ah0xyC3Paab4bIQtHf7fPw/bVA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Tue, 10 Aug 2021 19:29:04 +0200
Message-Id: <20210810173002.144730926@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810173000.928681411@linuxfoundation.org>
References: <20210810173000.928681411@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Linux-stm32] [PATCH 5.13 036/175] ARM: dts: stm32: Prefer HW RTC
	on DHCOM SoM
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

From: Marek Vasut <marex@denx.de>

[ Upstream commit 3a0670824979a986a2314c921aa092e60730eeae ]

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
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 2af0a6752674..8349c9099e30 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -12,6 +12,8 @@
 	aliases {
 		ethernet0 = &ethernet0;
 		ethernet1 = &ksz8851;
+		rtc0 = &hwrtc;
+		rtc1 = &rtc;
 	};
 
 	memory@c0000000 {
@@ -248,7 +250,7 @@
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
