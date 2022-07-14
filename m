Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEFA5742C5
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jul 2022 06:26:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB4E2C640FF;
	Thu, 14 Jul 2022 04:26:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CBE1C640FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jul 2022 04:26:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76AE661EB3;
 Thu, 14 Jul 2022 04:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DECEC34114;
 Thu, 14 Jul 2022 04:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772793;
 bh=V6P26LKaoY+s/uH/UpwZvUT+yMADP3QDL1u+uK6ZV2o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ot4n6QEN/hu5Ce8z3w9PRAvgIIvYAntWHBy7H21grcvueQOy3qfEe1CyazdsQSOxv
 Kjo5+ZjeQYNE3owXRFd4ECcssnb5QNC69sorPU7UpdUVae+JPaRu2HpDVD5UJFyU/5
 LtWnZ+E+l7sirC1PBzwpbPG0wduZJKe2BwIKCeUYAmtEd8Wzmt3wLpvTHdiLdPEdP3
 Xbg/+aM0RP8FRUeLODdD1nTGYaooOb/9wCoVw3nTfKsX5WMKPSZzF9Vy4l8hRHh0QA
 GcHUHqXE5lqy3QqzHB3uwt9o9bY21GitVPH2q+PB/oDeR8BSKisOK9BOcl6MCr/axS
 wkYzcvt7wYtTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 14 Jul 2022 00:26:11 -0400
Message-Id: <20220714042612.282378-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042612.282378-1-sashal@kernel.org>
References: <20220714042612.282378-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.4 09/10] ARM: dts: stm32: use the
	correct clock source for CEC on stm32mp151
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

[ Upstream commit 78ece8cce1ba0c3f3e5a7c6c1b914b3794f04c44 ]

The peripheral clock of CEC is not LSE but CEC.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index a687c024daa9..0e9e930c60f0 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -515,7 +515,7 @@ cec: cec@40016000 {
 			compatible = "st,stm32-cec";
 			reg = <0x40016000 0x400>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc CEC_K>, <&clk_lse>;
+			clocks = <&rcc CEC_K>, <&rcc CEC>;
 			clock-names = "cec", "hdmi-cec";
 			status = "disabled";
 		};
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
