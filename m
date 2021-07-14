Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6543C8C74
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:39:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04E52C597B5;
	Wed, 14 Jul 2021 19:39:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62266C597B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:39:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67877613E2;
 Wed, 14 Jul 2021 19:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291588;
 bh=9hKbyRxtO7h+nQGpfz2wwACQPbDfUtvoGjRP807Q/pc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=taKMyJWn+LHB4+Qy+BX6UbRrlNwxkWiNYiHIYuR51xQo0vQtBIYNl0N0VyqYYyGrv
 F01fwewFL/NIPltoFGqvmB4kLExRgjqA9ed0Q15khNLRL7z9Vh5N4xMvB+wrDfLJnH
 MWHAwmrPqK0ydXRASqVWpMh3blahwdFtTnxw69GN3lSZ1N15d9rvgYj8JaRYjGCc+j
 YO0wEQeXr6KzSiqJQU7HAKv5//I8vXsiHSIg5H+ZdkxPq4ZlAZkupEDeEGglC2P730
 48xX6B3kauKa23ujjnJloPT6YCaettckFZPjp43b9jCDEPlKFE9HC8rdJM8gzoYzQj
 lbotDoIOcFbzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:37:26 -0400
Message-Id: <20210714193800.52097-74-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714193800.52097-1-sashal@kernel.org>
References: <20210714193800.52097-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH AUTOSEL 5.13 074/108] ARM: dts: stm32: fix
	ltdc pinctrl on microdev2.0-of7
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

[ Upstream commit 11aaf2a0f8f070e87833775965950157bf57e49a ]

It prevents the following warning:

 pin-controller@50002000: 'ltdc' does not match any of the regexes:
'-[0-9]*$', '^gpio@[0-9a-f]*$', 'pinctrl-[0-9]+'

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
index 674b2d330dc4..5670b23812a2 100644
--- a/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
+++ b/arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
@@ -89,7 +89,7 @@ ltdc_ep0_out: endpoint@0 {
 };
 
 &pinctrl {
-	ltdc_pins: ltdc {
+	ltdc_pins: ltdc-0 {
 		pins {
 			pinmux = <STM32_PINMUX('G', 10, AF14)>,	/* LTDC_B2 */
 				 <STM32_PINMUX('H', 12, AF14)>,	/* LTDC_R6 */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
