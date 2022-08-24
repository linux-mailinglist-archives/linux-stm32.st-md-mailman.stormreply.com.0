Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A85FE59F508
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Aug 2022 10:21:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7109FC6410E;
	Wed, 24 Aug 2022 08:21:36 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7D65C640FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=k1; bh=ZA6NZznO17pPAf
 YQn+ZaPqoOw1BDdgUMYqc4V7ZjXXg=; b=LkNpW3WqCHqPoO8EInfjd3/x72/QnH
 4Zj6qMFpQjV9YIR/mgRhoWukUl98f8JiXBunAC1mj7eyTbbRBFeNxB3zPgopeunJ
 JRakwpUwx9Qm3iZW0mKMkGGWOZuc0vGaNgld9Q7Aij4yNZLqPLhxxTVuRj2B600+
 qXWfeSHwgXXbs=
Received: (qmail 2131806 invoked from network); 24 Aug 2022 10:21:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 24 Aug 2022 10:21:32 +0200
X-UD-Smtp-Session: l3s3148p1@SHFQXvjm5OcgAwDPXxw3AFlguiwjsjwa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-spi@vger.kernel.org
Date: Wed, 24 Aug 2022 10:21:28 +0200
Message-Id: <20220824082130.21934-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220824082130.21934-1-wsa+renesas@sang-engineering.com>
References: <20220824082130.21934-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Reinhold Mueller <reinhold.mueller@emtrion.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: argon: remove spidev node
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

Commit 956b200a846e ("spi: spidev: Warn loudly if instantiated from DT
as "spidev"") states that there should not be spidev nodes in DTs.
Remove this non-HW description. There won't be a regression because it
won't bind since 2015 anyhow.

Fixes: 16e3e44c5b87 ("ARM: dts: stm32: Add support for the emtrion emSBC-Argon")
Cc: Reinhold Mueller <reinhold.mueller@emtrion.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Please take it via your platform tree.

 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
index ac53ee3c496b..30156b7546ed 100644
--- a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
@@ -435,12 +435,6 @@ &spi1 {
 	pinctrl-0 = <&spi1_pins_a>;
 	cs-gpios = <&gpioz 3 0>;
 	status = "disabled";
-
-	spidev@0  {
-		compatible = "spidev";
-		reg = <0>;
-		spi-max-frequency = <100000>;
-	};
 };
 
 &timers1 {
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
