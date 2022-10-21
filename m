Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF06B607499
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Oct 2022 12:01:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 532B8C64116;
	Fri, 21 Oct 2022 10:01:12 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACFB5C64108
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Oct 2022 10:01:10 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9C0C384EE8;
 Fri, 21 Oct 2022 12:01:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666346470;
 bh=rmKMCcD02VdY8tEcdbcQZiXwzojlj5rfjG1bmJTo2gE=;
 h=From:To:Cc:Subject:Date:From;
 b=vTk5MMQz8UibzvxPSCjGlYjsJlNB+iNS3dOCGUzJW8BNUwogbcugRhtXGGudg+ZKt
 vO9j3aPchNpAP5uuP7ZzZxM8jhOEntyr0qDVnE66/4pIfqMgRQMxSeC8DJOsYDCc3k
 uEpSFIHvQ/pxoUovtDdYvBxuUipIiS3THb8H10VDNueyb06QS/PDaPDQC0j8oacjr3
 JtO5Uf5Zr1gfoRl/gs6hPnSKlwHbaAt1YnP9MCl+L+UUnf1wbAH0iVEx3l3sxOHfEA
 yNAMTNM5y4D003imXQE54NoO2tmafxOQl6ttB7SDD0lglnLU4HC8ijORQgRBLAJbiw
 LdS+m238h1dHw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 21 Oct 2022 12:00:57 +0200
Message-Id: <20221021100057.10759-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix AV96 WLAN regulator gpio
	property
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

The WLAN regulator uses 'gpios' property instead of 'gpio' to specify
regulator enable GPIO. While the former is also currently handled by
the Linux kernel regulator-fixed driver, the later is the correct one
per DT bindings. Update the DT to use the later.

Fixes: 7dd5cbba42c93 ("ARM: dts: stm32: Enable WiFi on AV96")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
index 305f9ae2fcebf..50af4a27d6be4 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -99,7 +99,7 @@ wlan_pwr: regulator-wlan {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpios = <&gpioz 3 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpioz 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
