Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 570D52C07ED
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 13:45:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14F33C56632;
	Mon, 23 Nov 2020 12:45:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93970C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 12:45:46 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6846220732;
 Mon, 23 Nov 2020 12:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606135545;
 bh=Zy9LRgXlILLBgJeB07EwnTixff22Rl88EKTueagoGh0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PqIM/XyK3Govmc7XInHq6QFedlk6LM+Mx2UL7LAlNzy67jm444fw/C7+VEGHSel7X
 fz3HT+4YPULL2M9OSdKiTbNrn8d9/YiLR6Fkw9xteFGNXTYrdqqD3GAlib/H9TbKBa
 +Ug55iSED770Yzr0AungUjjTebCcVSHJIU9tH3yw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2020 13:20:56 +0100
Message-Id: <20201123121840.702662257@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123121835.580259631@linuxfoundation.org>
References: <20201123121835.580259631@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 5.9 106/252] ARM: dts: stm32: Fix TA3-GPIO-C
	key on STM32MP1 DHCOM PDK2
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

[ Upstream commit 52d9edbe6efc5042cf57fae6a25d07572ddf398b ]

On the prototype DHCOM, the TA3-GPIO-C button was connected to pin PI11 of
the STM32MP15xx, however on the production SoM this was changed to pin PG0
to free up the IRQ line 11 for LAN8710i PHY IRQ. Update the connection in
the DT. Since the IRQ line 0 is used for PMIC as well and cannot be shared
with the button, make the button polled.

Fixes: 87cabf9405cb ("ARM: dts: stm32: Add GPIO keys for STM32MP1 DHCOM PDK2")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index e4e3c92eb30d3..7cddeb1a545a3 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -46,6 +46,16 @@
 			linux,code = <KEY_A>;
 			gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
 		};
+
+		/*
+		 * The EXTi IRQ line 0 is shared with PMIC,
+		 * so mark this as polled GPIO key.
+		 */
+		button-2 {
+			label = "TA3-GPIO-C";
+			linux,code = <KEY_C>;
+			gpios = <&gpiog 0 GPIO_ACTIVE_LOW>;
+		};
 	};
 
 	gpio-keys {
@@ -59,13 +69,6 @@
 			wakeup-source;
 		};
 
-		button-2 {
-			label = "TA3-GPIO-C";
-			linux,code = <KEY_C>;
-			gpios = <&gpioi 11 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
-
 		button-3 {
 			label = "TA4-GPIO-D";
 			linux,code = <KEY_D>;
-- 
2.27.0



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
