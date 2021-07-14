Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E22AA3C8D68
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:42:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A881DC597B1;
	Wed, 14 Jul 2021 19:42:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8727C597B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:42:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68814613F5;
 Wed, 14 Jul 2021 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291740;
 bh=Qlm1sNsuMP1SYmQKkz1C6jynodpO46XtBgAG0H8zmfw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UPn8EVKSX3zteMW0YJahiAseOSKvpfi8oBKaGbufilBsW14GVMI2b/bXchBVccfdj
 9nZLwMK+KzhQy3d1F2jyO9DTQQe1A4hXFmx85XjlVk1ak8TFZ7p4dyVjZl98ykpYiH
 KEbEmmVwMTazXx4ADvoXFMYqxwhIBd4C1p0MGxstiHf6eB5VkqyQlpiB84T82rNqqh
 mJmebD6sR397znapSfQLSjseV4Ou+C2+Svtp4fyR/3G+G9MIZS9qDaKICo7VJpSiJr
 j6rRctCZT/NO8j3+Wa4UJKtrGmU5DwhbPDEvFknTmvwE+NB1UZO1vY2pwq4Tpdt6Iz
 mZg8OrttqEIXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:40:06 -0400
Message-Id: <20210714194036.53141-73-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194036.53141-1-sashal@kernel.org>
References: <20210714194036.53141-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 kernel@dh-electronics.com, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.12 073/102] ARM: dts: stm32: Rename
	eth@N to ethernet@N on DHCOM SoM
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

[ Upstream commit b586250df24226f8a257e11e1f5953054c54fd35 ]

Fix the following dtbs_check warning:
eth@1,0: $nodename:0: 'eth@1,0' does not match '^ethernet(@.*)?$'

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: kernel@dh-electronics.com
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 2617815e42a6..1c1c4198f2c1 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -140,7 +140,7 @@ &fmc {
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
