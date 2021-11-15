Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9812E450D09
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Nov 2021 18:45:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 492DEC5C82A;
	Mon, 15 Nov 2021 17:45:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CF8FC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 17:45:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74DF4633A5;
 Mon, 15 Nov 2021 17:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636998323;
 bh=rLY4Mke7S36U1O4oppZxQHTcYaUOjDpT7lsAxWlWmoA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i7tNAxdIY4dfVm/M0BDiQu0AC0d4WoltfD5+Myi0imYB+kI2VOcGG0aqIu/iOR59J
 KsH3AdxKBem3S0JwKdYPlwzrunG7s4jxaoUiZhCRoFmkTkq+plpnxvAOSOxNiOWywL
 XVfnsjt7qbcv2zE5TVffaJZgNqu5Fl1Bg+nxtiGE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Mon, 15 Nov 2021 18:02:40 +0100
Message-Id: <20211115165358.816966209@linuxfoundation.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115165343.579890274@linuxfoundation.org>
References: <20211115165343.579890274@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Linux-stm32] [PATCH 5.10 435/575] ARM: dts: stm32: Reduce DHCOR
	SPI NOR frequency to 50 MHz
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

[ Upstream commit 2012579b31293d0a8cf2024e9dab66810bf1a15e ]

The SPI NOR is a bit further away from the SoC on DHCOR than on DHCOM,
which causes additional signal delay. At 108 MHz, this delay triggers
a sporadic issue where the first bit of RX data is not received by the
QSPI controller.

There are two options of addressing this problem, either by using the
DLYB block to compensate the extra delay, or by reducing the QSPI bus
clock frequency. The former requires calibration and that is overly
complex, so opt for the second option.

Fixes: 76045bc457104 ("ARM: dts: stm32: Add QSPI NOR on AV96")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
index a9eb82b2f1704..5af32140e128b 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
@@ -198,7 +198,7 @@
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-rx-bus-width = <4>;
-		spi-max-frequency = <108000000>;
+		spi-max-frequency = <50000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 	};
-- 
2.33.0



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
