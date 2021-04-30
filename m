Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9B236F7E5
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Apr 2021 11:26:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5F57C58D7A;
	Fri, 30 Apr 2021 09:26:56 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73F7ECFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Apr 2021 09:14:38 +0000 (UTC)
Date: Fri, 30 Apr 2021 09:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dopsi.ch;
 s=protonmail; t=1619774077;
 bh=h+LIb02du4NZiCmv0vgjPEtZ8Dn+Xx1YkEjN6c5ZM9c=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Mu71hlJuiDj+fP26Z7TkrGzwOFtaAk57YcpkwJ7/VyitTCGIa6s7Dsjhl7ufW/pkf
 71cGAK1EKAMP/YYUlGK06JzJ3zytpGmANrl1N0Mg7mvSDcCpzXsFoIj2yomqnKzawV
 NWwPZbhlLXHPhBno+FzBBGryM8uiuWduzEStI0efQfMmw6m/cFvVWz8D252Oqwkd/j
 n+YbZw+EhYnOPllNALjTjpFBN0/DzQrNJ656VpgSKClF5Jcz1SBUx4cn0BCrrMhXvn
 y4ebdzhTa0j3O8+wqb93hH0IOpYYLrbXBgwUUuTxrrmdB52HCVbB4/XBhCrNk79+YV
 eZ6crt6z4ttiQ==
To: linux-stm32@st-md-mailman.stormreply.com
From: Simon Doppler <dopsi@dopsi.ch>
Message-ID: <20210430091244.1697182-1-dopsi@dopsi.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Fri, 30 Apr 2021 09:26:56 +0000
Cc: robh+dt@kernel.org, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: set stm32mp157c-odyssey MMC1
	detection to polling
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
Reply-To: Simon Doppler <dopsi@dopsi.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The SDMMC1_CD net is not routed on the Seeed STM32MP157C-SoM
(see https://files.seeedstudio.com/wiki/Seeed-NPi-STM32MP157C/Hardware/Seeed%20SoM%20-%20STM32MP157C%20v1.0_191212.pdf)

Signed-off-by: Simon Doppler <dopsi@dopsi.ch>
---
 arch/arm/boot/dts/stm32mp157c-odyssey.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey.dts b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
index a7ffec8f1516..1ef94b0d3067 100644
--- a/arch/arm/boot/dts/stm32mp157c-odyssey.dts
+++ b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
@@ -64,7 +64,7 @@ &sdmmc1 {
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
 	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
-	cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	broken-cd;
 	disable-wp;
 	st,neg-edge;
 	bus-width = <4>;
--
2.25.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
