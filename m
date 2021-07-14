Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 458763C8EBB
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:47:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BF70C597B1;
	Wed, 14 Jul 2021 19:47:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE178C597B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:47:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5BAE613F0;
 Wed, 14 Jul 2021 19:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626292026;
 bh=CNuEaQCmb4bVkEAtz8mCGDynVJ90OcZXO7bRNRVHUew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mACD6XUGh1hHYFUo6ShaoaBxnnKI02pfURVFGgD3y34vbD/h9GVeXwTK1DF2vxdLd
 qIsUTFJV2OQZYlameHKLHkvSgYW2Skqb+fbiuS4/Wa0VPJFj4lHxaMy6UvGnL1mFuG
 9/xTymWcXKgs1Io+NtKR6snyTZ3iil1WtnaSbueeek91r2onN5dL/vPvn6PV5LuSVg
 sUjxyrgQj+FtBHi9YaN9mlzRaK3rQt6+vqEdOPdtZpN1wsrW9l564K7HuAjpcnW7q/
 Ibh61BVu0nUQFW2HvAeby+jDqHF5Kg+/oOisItcvxI7FtCyeU8qiA34XDrH5hZJnUu
 MHE2kysF3+CVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:46:13 -0400
Message-Id: <20210714194625.55303-28-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194625.55303-1-sashal@kernel.org>
References: <20210714194625.55303-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH AUTOSEL 4.19 28/39] ARM: dts: stm32: fix i2c
	node name on stm32f746 to prevent warnings
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

From: Alexandre Torgue <alexandre.torgue@foss.st.com>

[ Upstream commit ad0ed10ba5792064fc3accbf8f0341152a57eecb ]

Replace upper case by lower case in i2c nodes name.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32f746.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index ccd87e833049..be62d9091e03 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -353,9 +353,9 @@ i2c2: i2c@40005800 {
 			status = "disabled";
 		};
 
-		i2c3: i2c@40005C00 {
+		i2c3: i2c@40005c00 {
 			compatible = "st,stm32f7-i2c";
-			reg = <0x40005C00 0x400>;
+			reg = <0x40005c00 0x400>;
 			interrupts = <72>,
 				     <73>;
 			resets = <&rcc STM32F7_APB1_RESET(I2C3)>;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
