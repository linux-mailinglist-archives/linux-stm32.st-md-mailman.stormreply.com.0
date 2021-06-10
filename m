Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 257013A2166
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 02:26:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4ECEC58D5B;
	Thu, 10 Jun 2021 00:26:06 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3818AC57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 00:26:04 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8A83E82D15;
 Thu, 10 Jun 2021 02:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623284763;
 bh=Uvodr9W6RF/9Mddq0YOpdl9tD8kVY4PRpYpuJ4GAmUM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kWyecAsrqUvAThfT1BD93lKkwpqGNLVIIkKWqxfF5vhAgURhgvKfX8yaW8z4XfpC6
 0FxnF+4/of/SuTIDs6tsENJMOX4jgcl2VUvlIVcTN5l8uB73O3gCk9kxurPja3X6UX
 A9ILfgj4SI+e3V+V3FMgirW5A/d+TcYfiTKc7MG83IrqcyqzjwYmzUu2p5Tn0cXdkV
 vHeLpAPsi3nbgYksAy1woKEPaHTbJZ4meuG84eBWTM26q7m5jFrdqqg9aJ6vHoKIs9
 jdSsDR4wBpoqvoBqymVgKmBWmOAZvXgtJnjwY+k/+fX2XeTw4MLbbsS2jWI6Az0gmw
 V38LRz8Afql8Q==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Jun 2021 02:25:51 +0200
Message-Id: <20210610002552.134067-2-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610002552.134067-1-marex@denx.de>
References: <20210610002552.134067-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: Rename eth@N to
	ethernet@N on DHCOM SoM
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

Fix the following dtbs_check warning:
eth@1,0: $nodename:0: 'eth@1,0' does not match '^ethernet(@.*)?$'

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: kernel@dh-electronics.com
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 31d08423a32f..c3e3466dacaa 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -150,7 +150,7 @@ &fmc {
 	pinctrl-1 = <&fmc_sleep_pins_b>;
 	status = "okay";
 
-	ksz8851: ks8851mll@1,0 {
+	ksz8851: ethernet@1,0 {
 		compatible = "micrel,ks8851-mll";
 		reg = <1 0x0 0x2>, <1 0x2 0x20000>;
 		interrupt-parent = <&gpioc>;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
