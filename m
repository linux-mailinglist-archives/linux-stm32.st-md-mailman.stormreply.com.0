Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0AC47B436
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Dec 2021 21:07:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8636DC5EC55;
	Mon, 20 Dec 2021 20:07:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB14EC5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Dec 2021 20:07:47 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D434F8369E;
 Mon, 20 Dec 2021 21:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1640030867;
 bh=+3qpjUt+GDs5ylQBvaqPpnxB29sxAVnO393MXB5xCCQ=;
 h=From:To:Cc:Subject:Date:From;
 b=q23QL+JkMDT2mzj2t7zjknBdyWFfJ9a5+pTeVSPnEuH1mPaY/9Md2ufQP4Vf3sl4o
 8UQfHQmYFuIoFgY9pt8uIwNc/FGJG6iVL66oFaiRLPhICKi15klH4qBRfzSkLfU8J5
 xeIhcWDNIQ986P9HHD+DoWyUEhMw0VHuR8Gs8VHomJ02WayFRWz0oMHr1bU1e8hSdh
 AY9QnrW6ekfm8hk7V3HjeLM8c493J01OLVk0i5sOrFUi6MC+Q977Rm8PEnhsi3NN/H
 cVJuT8uswSPo/1/k1T7TNNrsqPVRHRdZGrtbKBjG2vetjAMu6q2LdIMXWoqLp9+GNJ
 SExSz6Gbbc3ZA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 20 Dec 2021 21:07:33 +0100
Message-Id: <20211220200733.1391088-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Drop duplicate status okay
	from DHCOM gpioc node
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

The stm32mp15xxaa-pinctrl.dtsi included in stm32mp15xx-dhcom-som.dtsi
already sets status = "okay" in gpioc: gpio@50004000 node, drop the
duplicate from stm32mp15xx-dhcom-som.dtsi . No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: kernel@dh-electronics.com
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 724feba8a3df..4cb626b636cb 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -226,7 +226,6 @@ &gpioc {
 			  "", "", "DHCOM-E", "",
 			  "", "", "", "",
 			  "", "", "", "";
-	status = "okay";
 };
 
 &gpiod {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
