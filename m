Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C76C16FE874
	for <lists+linux-stm32@lfdr.de>; Thu, 11 May 2023 02:20:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77201C6A60A;
	Thu, 11 May 2023 00:20:12 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5815C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 00:20:10 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C6EF1860B5;
 Thu, 11 May 2023 02:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683764410;
 bh=cMWsdqqR/k7zantlDh1d1yj4kxNqX+XUZVoR17bWKo8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ch+8Y/AjeEeKXxuF3ahse8H8zIlH4LQJJUSTLe4Y/vZusBqGliN/ODbZhRN0WCNj6
 WsEQ1l1h00UlJWwqlEumSx4LSgetYoDmJT2kylxtI0baZYtUy5M6LrbXEQiZM5iM/w
 s0ACHA9TVZzk4/3lUjKH1Xub1KJAPV0mGfJwUAFRevJwUsb64TWN5S5SdmJInwjKZY
 9QXd6jyYWM5J7+yNHFd6m7lodcIAjWVhQlhJpU7rwR9v2GT5YS8Yjb2jHPqVrmD920
 tphfAg1IeN12JsW3MMfrLaLJDFuLWzeWjQ+XcLO9tf+FXnDlR9fHMvgEy1CfMudjqt
 NVgAGNBLfGduA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 11 May 2023 02:19:49 +0200
Message-Id: <20230511001949.179521-3-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230511001949.179521-1-marex@denx.de>
References: <20230511001949.179521-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: Add IWDG2 EXTI interrupt
	mapping and mark as wakeup source
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

The IWDG2 is capable of generating pre-timeout interrupt, which can be used
to wake the system up from suspend to mem. Add the EXTI interrupt mapping
and mark the IWDG2 as wake up source.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-watchdog@vger.kernel.org
---
 arch/arm/boot/dts/stm32mp151.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 63f4c78fcc1dc..792324b6f9b6a 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1541,6 +1541,8 @@ iwdg2: watchdog@5a002000 {
 			reg = <0x5a002000 0x400>;
 			clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
 			clock-names = "pclk", "lsi";
+			interrupts-extended = <&exti 46 IRQ_TYPE_LEVEL_HIGH>;
+			wakeup-source;
 			status = "disabled";
 		};
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
