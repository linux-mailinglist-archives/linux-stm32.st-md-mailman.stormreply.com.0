Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 676CE3C8EB2
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:46:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E38AC597B2;
	Wed, 14 Jul 2021 19:46:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5272C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:46:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7135613D9;
 Wed, 14 Jul 2021 19:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291963;
 bh=nG1mHoVKB7GDuXbwFhRAqAY4A8bWHVWSz5k1Uq7o26g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iRiFeQU55HPuj/IjadjOGmrjkN6AsvCRDXUOnCYWhnfJ3b5L+6z3fNFee9qbfUR+3
 8nI/isjtZ2bXidEqE3nFGRAT2bJy0yuVXNdCUe8VjBe3yknhnkwkWA+W3xGAkaZphg
 o0GW4573lhLBcOGOi7xwbVWDQHT3aFXYp7tQ/Fj6PXRWPKlYhs7sBavgi/ssvv9a67
 oT7ja76T3AFXuwt1Dx4kg5uGUgdRFHyIjy5XT9T9o78oQiTKrbqVxloqQSOEjgg7F8
 /EJEg002AXb8anc1hu5+Rg7b0uqSBUG4c9mf3B7dvP2ufXPkU0EGtbSNjHMw6KjRk0
 Hf/U2P3jQsWOw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:44:57 -0400
Message-Id: <20210714194513.54827-35-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194513.54827-1-sashal@kernel.org>
References: <20210714194513.54827-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH AUTOSEL 5.4 35/51] ARM: dts: stm32: fix i2c
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
index 974dc71b2fe3..60680fcf8eb3 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -362,9 +362,9 @@ i2c2: i2c@40005800 {
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
