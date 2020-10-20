Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1676029400D
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 17:58:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0614C424B9;
	Tue, 20 Oct 2020 15:58:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30A5EC424B8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 15:58:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09KFftEv008243; Tue, 20 Oct 2020 17:57:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0NhB4w744ex1Ld0LhQH7gI4YdESY0PjtXTk+Jpsh0+k=;
 b=zIqV5ThP10kLzp7eDK8XzS13yQqtsZJBJAD/FCmHZMMyLgO8fGvTpTrNAntXZ3LhLd95
 oIka79m8/OPeHn7bJo+CWEIQti28DOPYiT1PgLLLRPW5X2hYKjgwFGF/ZKXREFvwl6vk
 UbdrOrbos97Q6qQAnbL9rKY1ER8C8d4lR8+MHiOKB6X1ldnR1U+jpPjoHVE+eUakjsHg
 aSuA5oUZjc07ASZuHC7Jn1S2eUhTz9/lx7ShxBfAirdHVgcevWZhK8Ei743Ol0NX+LIA
 IDAOCgkdkj3NgmwsZg/gBrgxluGsqZdpRa4N8OLCTvEcB9JC22Ae4mStLaU5FfpgDP5a ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcwuuwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 17:57:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33FD4100038;
 Tue, 20 Oct 2020 17:57:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22AFF206290;
 Tue, 20 Oct 2020 17:57:15 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 17:57:14
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <robh@kernel.org>,
 <mark.rutland@arm.com>, <olivier.moysan@st.com>
Date: Tue, 20 Oct 2020 17:57:09 +0200
Message-ID: <20201020155709.2621-3-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020155709.2621-1-olivier.moysan@st.com>
References: <20201020155709.2621-1-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-20_08:2020-10-20,
 2020-10-20 signatures=0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] dt-bindings: stm32: dfsdm: remove
	stm32-adfsdm.txt binding
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

Device tree audio configuration for STM32 DFSDM is already
covered in the following binding:
Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
Remove stm32-adfsdm.txt obsolete binding.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 .../bindings/sound/st,stm32-adfsdm.txt        | 63 -------------------
 1 file changed, 63 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt b/Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt
deleted file mode 100644
index 864f5b00b031..000000000000
--- a/Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-STMicroelectronics Audio Digital Filter Sigma Delta modulators(DFSDM)
-
-The DFSDM allows PDM microphones capture through SPI interface. The Audio
-interface is seems as a sub block of the DFSDM device.
-For details on DFSDM bindings refer to ../iio/adc/st,stm32-dfsdm-adc.txt
-
-Required properties:
-  - compatible: "st,stm32h7-dfsdm-dai".
-
-  - #sound-dai-cells : Must be equal to 0
-
-  - io-channels : phandle to iio dfsdm instance node.
-
-Example of a sound card using audio DFSDM node.
-
-	sound_card {
-		compatible = "audio-graph-card";
-
-		dais = <&cpu_port>;
-	};
-
-	dfsdm: dfsdm@40017000 {
-		compatible = "st,stm32h7-dfsdm";
-		reg = <0x40017000 0x400>;
-		clocks = <&rcc DFSDM1_CK>;
-		clock-names = "dfsdm";
-		#interrupt-cells = <1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dfsdm_adc0: filter@0 {
-			compatible = "st,stm32-dfsdm-dmic";
-			reg = <0>;
-			interrupts = <110>;
-			dmas = <&dmamux1 101 0x400 0x00>;
-			dma-names = "rx";
-			st,adc-channels = <1>;
-			st,adc-channel-names = "dmic0";
-			st,adc-channel-types = "SPI_R";
-			st,adc-channel-clk-src = "CLKOUT";
-			st,filter-order = <5>;
-
-			dfsdm_dai0: dfsdm-dai {
-				compatible = "st,stm32h7-dfsdm-dai";
-				#sound-dai-cells = <0>;
-				io-channels = <&dfsdm_adc0 0>;
-				cpu_port: port {
-				dfsdm_endpoint: endpoint {
-					remote-endpoint = <&dmic0_endpoint>;
-				};
-			};
-		};
-	};
-
-	dmic0: dmic@0 {
-		compatible = "dmic-codec";
-		#sound-dai-cells = <0>;
-		port {
-			dmic0_endpoint: endpoint {
-				remote-endpoint = <&dfsdm_endpoint>;
-			};
-		};
-	};
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
