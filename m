Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF53731367A
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 16:13:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88DECC57189;
	Mon,  8 Feb 2021 15:13:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FD27C57188
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 15:13:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89AD464EAC;
 Mon,  8 Feb 2021 15:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612797194;
 bh=skOZTl6nLcjm1TYWcN3Z1w/d4l+Nm2S3Psvlf9ZHkqk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pOUGaSKuuwnR6GvjcIctEUbnr+pMmzIPzeqPO34i/XjREt8q/w2hd+tfHyBLO3nBc
 MKvAPD+bMAQS8tR4swFf1S0vUOHrSkyeCP6nJARjQ1TVesn0KiCb2HzQUjW8JgB8t8
 3AC8qHHFeQ99qOfxPkTeVxITl2KAOtDb6thjDQzg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Mon,  8 Feb 2021 16:00:11 +0100
Message-Id: <20210208145819.364334269@linuxfoundation.org>
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
Subject: [Linux-stm32] [PATCH 5.10 024/120] ARM: dts: stm32: Fix GPIO hog
	flags on DHCOM DRC02
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

[ Upstream commit 83d411224025ac1baab981e3d2f5d29e7761541d ]

The GPIO hog flags are ignored by gpiolib-of.c now, set the flags to 0.
Since GPIO_ACTIVE_HIGH is defined as 0, this change only increases the
correctness of the DT.

Fixes: fde180f06d7b ("ARM: dts: stm32: Add DHSOM based DRC02 board")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
index 4cabdade6432b..e4d287d994214 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
@@ -35,7 +35,7 @@
 	 */
 	rs485-rx-en {
 		gpio-hog;
-		gpios = <8 GPIO_ACTIVE_HIGH>;
+		gpios = <8 0>;
 		output-low;
 		line-name = "rs485-rx-en";
 	};
@@ -63,7 +63,7 @@
 	 */
 	usb-hub {
 		gpio-hog;
-		gpios = <2 GPIO_ACTIVE_HIGH>;
+		gpios = <2 0>;
 		output-high;
 		line-name = "usb-hub-reset";
 	};
-- 
2.27.0



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
