Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAAF36B557
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Apr 2021 17:00:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8D34C57182;
	Mon, 26 Apr 2021 15:00:33 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07691C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 15:00:24 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9FEE182AF3;
 Mon, 26 Apr 2021 17:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1619449223;
 bh=Mxh9RUhBI3ONp51golwVY4tQLALPIY7NZe3mYabYvk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0XEmFeI83QLGKZNRv6ux2rbPpqwTF7O4mYRJyri6b9RBwaJCvEFdh7CyZbCGixsBN
 LyWhTyKEEmjRKm2UZX0xtp4al/c36P4Czz3BvhVK5SM3M7zeEEZldWj/Mgojn+tbTh
 Znmd2Y1FA5QZgjsOnnBvgcs+D3Qelv6g6uLynpAvHFgLT3XjbrtNNfKLuTO7XNqt80
 XNr75ewH54yD92+bjQ3iBwxYQmx3yjtKI1ku0kXWhEop9WjLY8ZZjiAEyS9lvLVFqb
 U7KJC4u5V08nyTL200rTgRRSY0dhvdObaIPPluy4kMo/TuOo8QIuG/Tq1G3hlVkhP6
 y14kNgu83TXKw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 26 Apr 2021 17:00:13 +0200
Message-Id: <20210426150013.121406-2-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210426150013.121406-1-marex@denx.de>
References: <20210426150013.121406-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: Fix touchscreen node
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

Fix make dtbs_check warning:
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml:0:0: /soc/i2c@40015000/polytouch@38: failed to match any schema with compatible: ['edt,edt-ft5x06']

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index 0fbf9913e8df..b8c8f0b284c3 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -182,8 +182,8 @@ sgtl5000_rx_endpoint: endpoint@1 {
 
 	};
 
-	polytouch@38 {
-		compatible = "edt,edt-ft5x06";
+	touchscreen@38 {
+		compatible = "edt,edt-ft5406";
 		reg = <0x38>;
 		interrupt-parent = <&gpiog>;
 		interrupts = <2 IRQ_TYPE_EDGE_FALLING>; /* GPIO E */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
