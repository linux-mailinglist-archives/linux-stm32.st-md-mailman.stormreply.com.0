Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A84724ABA
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 20:01:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60A3EC6A5E7;
	Tue,  6 Jun 2023 18:01:26 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEBC0C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 18:01:25 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 849A085BC7;
 Tue,  6 Jun 2023 20:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686074484;
 bh=ZkrXtW7QXzDGiDCI1hv3GtHU5o9XqNlgPIISeVGTLJY=;
 h=From:To:Cc:Subject:Date:From;
 b=krHPc8w9DpiMpw6oWX2aYaHd+/GhJyHD2uS06pATYZ08fMyH3HJcVToh+FzoHpiGY
 U2RSdo1l+NUpu4Ay0btWu0G/jp6a9gMhu965H/Y47pQnuNO6KPTyH6n0We3R5vCusU
 xkWTFE2YU8DeCHHb7hdbumOfmQ2NSZRt0VbfBrOBoGGu8A+ItoM/GFKEbROxCe1oBk
 GwvTOAHeZ6LpkMqaOncE4YZ0ROvcHQQ+sEgbbIMotqZHVtg9JjpCjCjFRtDAmM+1nm
 8Cf6XjRGiZ8v6w4WYfvDN3RwXucaSrWjoXb5rUu2Z4a5awFjlZgenkMzxan5iEifpg
 GNYLnLTGJFelQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue,  6 Jun 2023 20:01:12 +0200
Message-Id: <20230606180112.215896-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix audio routing on
	STM32MP15xx DHCOM PDK2
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

The audio routing flow is not correct, the flow should be from source
(second element in the pair) to sink (first element in the pair). The
flow now is from "HP_OUT" to "Playback", where "Playback" is source
and "HP_OUT" is sink, i.e. the direction is swapped and there is no
direct link between the two either.

Fill in the correct routing, where "HP_OUT" supplies the "Headphone Jack",
"Line In Jack" supplies "LINE_IN" input, "Microphone Jack" supplies "MIC_IN"
input and "Mic Bias" supplies "Microphone Jack".

Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index 4709677151aac..46b87a27d8b37 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -137,10 +137,13 @@ reg_panel_supply: regulator-panel-supply {
 
 	sound {
 		compatible = "audio-graph-card";
-		routing =
-			"MIC_IN", "Capture",
-			"Capture", "Mic Bias",
-			"Playback", "HP_OUT";
+		widgets = "Headphone", "Headphone Jack",
+			  "Line", "Line In Jack",
+			  "Microphone", "Microphone Jack";
+		routing = "Headphone Jack", "HP_OUT",
+			  "LINE_IN", "Line In Jack",
+			  "MIC_IN", "Microphone Jack",
+			  "Microphone Jack", "Mic Bias";
 		dais = <&sai2a_port &sai2b_port>;
 		status = "okay";
 	};
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
