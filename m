Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B8404BA6
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Sep 2021 13:52:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF02EC5A4F6;
	Thu,  9 Sep 2021 11:52:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5537EC5A4D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Sep 2021 11:52:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B6FF61B40;
 Thu,  9 Sep 2021 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188363;
 bh=WO6ADGGSO99avQrDWRk0pqj7iOZKqfl96hWXBYYzfcE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SyCXJZ/V0vbcDoYM+nDFOqitDaKRpJE4oP5i6HngzVV/TzcVuvym5qQnH7lvVgjs5
 3vdzIaLKgf1DeePEMIYl7QqIu0Cp+/QL6wXKxXhlA3qlN4QXqiZWO/ik6AtxgBP1BG
 WK7dmrqCYcZDsO79wxevZhJoQhr2dCmRSB5gxbZsrfVL8E9SekeI4NsuFLgzeg9GBe
 i9vkLQBU8NmGa/3D9FO+PUJFJ/EHAwSbhMw0fblxAp9QlqIZa8nbquJGa01jgTRil1
 MhG4gqDmbLoraH3PEsUSTvP4ZSb+6BaNWk6KeGhGvSoG86Rb7cku4T2LtAqCTRc+3h
 6d6Ts+5smf9Fw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 07:49:28 -0400
Message-Id: <20210909115118.146181-66-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115118.146181-1-sashal@kernel.org>
References: <20210909115118.146181-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.10 066/176] ARM: dts: stm32: Update
	AV96 adv7513 node per dtbs_check
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

[ Upstream commit 1e6bc5987a5252948e3411e5a2dbb434fd1ea107 ]

Swap reg and reg-names order and drop adi,input-justification
and adi,input-style to fix the following dtbs_check warnings:
arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dt.yaml: hdmi-transmitter@3d: adi,input-justification: False schema does not allow ['evenly']
arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dt.yaml: hdmi-transmitter@3d: adi,input-style: False schema does not allow [[1]]
arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dt.yaml: hdmi-transmitter@3d: reg-names:1: 'edid' was expected
arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dt.yaml: hdmi-transmitter@3d: reg-names:2: 'cec' was expected

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
index ec02cee1dd9b..944d38b85eef 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -185,8 +185,8 @@ &i2c2 {	/* X6 I2C2 */
 &i2c4 {
 	hdmi-transmitter@3d {
 		compatible = "adi,adv7513";
-		reg = <0x3d>, <0x2d>, <0x4d>, <0x5d>;
-		reg-names = "main", "cec", "edid", "packet";
+		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
+		reg-names = "main", "edid", "cec", "packet";
 		clocks = <&cec_clock>;
 		clock-names = "cec";
 
@@ -204,8 +204,6 @@ hdmi-transmitter@3d {
 		adi,input-depth = <8>;
 		adi,input-colorspace = "rgb";
 		adi,input-clock = "1x";
-		adi,input-style = <1>;
-		adi,input-justification = "evenly";
 
 		ports {
 			#address-cells = <1>;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
