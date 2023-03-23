Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3896C69BF
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 14:43:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67FB0C6A602;
	Thu, 23 Mar 2023 13:43:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AABFCC6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 13:43:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32NDMIE6002590; Thu, 23 Mar 2023 14:42:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=sQzBCRwn0PSkTfpCL6fVZArvZ3V559r88ED5L6dkNfQ=;
 b=sqOIOV98qbB4h7wX5dg1HQXu19ud+16zOv7nLWSQqlHRQn8oNqxDRDNDMGs5nMylCzoo
 0yK/DNmtCZaCrxxz9ALjY8ISZ38DHXOflq2ZsG05NdpKw79HpCbxJBhJBgQO6wOqGA+5
 6FBvL5QRUIeKLwt6ID4bjNEp4gCH7j6cVjNhQ4D7kBERx7dgLkDJphgiUpvTdKxVT5Ju
 DO/BKFB/HmDD6pGfiQWWykmxnASsNFhOE5oyocC7lDcqZvAeMdBDZwf3QilxTh8KhCc5
 JHUXuzilnOpESAjJwrWQ3GEaPhks0KhO3WMbmpuva+edHaRGDna9ssE7mMr/SxTqqYFi mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pfwcu2bb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 14:42:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C0938100040;
 Thu, 23 Mar 2023 14:42:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B20242171F3;
 Thu, 23 Mar 2023 14:42:03 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 23 Mar
 2023 14:42:03 +0100
Date: Thu, 23 Mar 2023 14:41:56 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230323134156.GA4017557@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Peter Rosin <peda@axentia.se>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20230322173530.3971676-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-i2c@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 Sven Peter <sven@svenpeter.dev>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Peter Rosin <peda@axentia.se>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c: Drop unneeded quotes
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

On Wed, Mar 22, 2023 at 12:35:29PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 4 ++--
>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml          | 4 ++--
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-
>  Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 4 ++--
>  Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml       | 4 ++--
>  Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++--
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

>  .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 ++--
>  8 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> index 199a354ccb97..26bed558c6b8 100644
> --- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> @@ -2,8 +2,8 @@
>  # Copyright 2019 BayLibre, SAS
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/amlogic,meson6-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Amlogic Meson I2C Controller
>  
> diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> index 4ac61fec90e2..243da7003cec 100644
> --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/i2c/apple,i2c.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Apple/PASemi I2C controller
>  
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index ea2303c0e143..6adedd3ec399 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -75,7 +75,7 @@ required:
>    - clocks
>  
>  allOf:
> -  - $ref: "i2c-controller.yaml"
> +  - $ref: i2c-controller.yaml
>    - if:
>        properties:
>          compatible:
> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> index 2e95cda7262a..7a675aa08c44 100644
> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/cdns,i2c-r1p10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Cadence I2C controller
>  
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> index 6e0a5686af04..f34cc7ad5a00 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> @@ -45,7 +45,7 @@ properties:
>  
>    i2c-parent:
>      description: phandle of the I2C bus that this multiplexer's master-side port is connected to
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>    mux-gpios:
>      description: list of GPIOs used to control the muxer
> @@ -55,7 +55,7 @@ properties:
>    idle-state:
>      description: Value to set the muxer to when idle. When no value is given, it defaults to the
>        last value used.
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>  
>  allOf:
>    - $ref: i2c-mux.yaml
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 0e88c85985b5..9f66a3bb1f80 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Qualcomm Geni based QUP I2C Controller
>  
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index bf396e9466aa..94b75d9f66cd 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -90,7 +90,7 @@ properties:
>    st,syscfg-fmp:
>      description: Use to set Fast Mode Plus bit within SYSCFG when Fast Mode
>        Plus speed is selected by slave.
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
>        - items:
>            - description: phandle to syscfg
> diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> index 1b598638d457..658ae92fa86d 100644
> --- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> +++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Xilinx IIC controller
>  
> -- 
> 2.39.2
> 
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

Regards,
Alain

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
