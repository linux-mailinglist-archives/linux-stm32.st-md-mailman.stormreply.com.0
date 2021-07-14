Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F33C8DCE
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:44:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0EF4C597B4;
	Wed, 14 Jul 2021 19:44:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C143BC597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:44:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E623613E3;
 Wed, 14 Jul 2021 19:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291856;
 bh=Ed0Pg0OWGIFlFZrx0tiPa85Dhwh9kL6vU+lJKFjwC0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GO4vjwFErIr1RObemCrFfdEoX1rWpsxbq6s9YUCtMrWfIRf/wXpghMd4W1Yc2Q8ys
 fabUZluVmS21x/55u3X0grBkilLtq1H0kFPu+pxsoqv6z0PVXVOfkkxDpGhxipBfl6
 dJkC72W/zF0rrV5+xlI7hkx+42U2ViBXrQUGgJ4Hqbs/moW+flhSCQaw6dbgCn0dNc
 4lCB5BIz5ZXaaWkorpMQQDRh0u3/aeS4GKnJpCidqsO+ycRTawgl9OGwgYHAFlT2T6
 AwhiepSXwAZ6Ztiv8dduc5lgKgfl0sYsR/WUMvtop9DEfIPT82gID5S4F82Dh29pUI
 IU+UHvLalKTpw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:42:23 -0400
Message-Id: <20210714194303.54028-48-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194303.54028-1-sashal@kernel.org>
References: <20210714194303.54028-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.10 48/88] ARM: dts: stm32: Fix
	touchscreen node on dhcom-pdk2
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

[ Upstream commit 4b5fadef3fc2ab8863ffdf31eed6a745b1bf6e61 ]

Fix make dtbs_check warning:
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml:0:0: /soc/i2c@40015000/polytouch@38: failed to match any schema with compatible: ['edt,edt-ft5x06']

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index 180a0187a956..a2d903c0d57f 100644
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
