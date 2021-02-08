Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 687BF313676
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 16:13:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0F95C57189;
	Mon,  8 Feb 2021 15:13:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A8F1C5717D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 15:13:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A23664EBF;
 Mon,  8 Feb 2021 15:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612797182;
 bh=/Izv91zcxQEaeZ1igCpWGrDY2izGsbwaRvgM/JEiTOQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UWbqLLhC9EsopaZHbfrZHsIlJNmbHnm70XcdIppEtkJQoy+szghh1+H19gm94dCA9
 5afWOemRuZ8DMilPfARuW9XtlgXNb0jZWWSiJdXWSkl6xKbiBmLJiCw7IZl65Aogzy
 FeyeWbGMISPhsJ6gOs0HLG3aUAmRNkWAGlyiFro8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Mon,  8 Feb 2021 16:00:07 +0100
Message-Id: <20210208145819.207162197@linuxfoundation.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208145818.395353822@linuxfoundation.org>
References: <20210208145818.395353822@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Patrice Chotard <patrice.chotard@st.com>, stable@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 5.10 020/120] ARM: dts: stm32: Fix polarity of
	the DH DRC02 uSD card detect
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

[ Upstream commit a0572c0734e4926ac51a31f97c12f752e1cdc7c8 ]

The uSD card detect signal on the DH DRC02 is active-high, with
a default pull down resistor on the board. Invert the polarity.

Fixes: fde180f06d7b ("ARM: dts: stm32: Add DHSOM based DRC02 board")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
--
Note that this could not be tested on prototype SoMs, now that it is
tested, this issue surfaced, so it needs to be fixed.
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
index 62ab23824a3e7..3299a42d80633 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
@@ -104,7 +104,7 @@
 	 * are used for on-board microSD slot instead.
 	 */
 	/delete-property/broken-cd;
-	cd-gpios = <&gpioi 10 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	cd-gpios = <&gpioi 10 GPIO_ACTIVE_HIGH>;
 	disable-wp;
 };
 
-- 
2.27.0



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
