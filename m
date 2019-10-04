Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53ECB9DF
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 14:07:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D65EC36B0B;
	Fri,  4 Oct 2019 12:07:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C25A7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 12:07:24 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x94C6bWt002807; Fri, 4 Oct 2019 14:07:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9m5QvHje7gSHUoKFWE+CtI72E0kPziiwi8tkIKmKGKQ=;
 b=dW0P/B3penQ+z5oVNoqmsOKp2Wxu6VlxtknN6/ZmuvxadCL69o84FhvPyynWiDrxRVYq
 boFpiWHq8RvkVwcJgmmG3fMIZDnZDF2tETu+GCwsNpH2TiVVRFbzA9ebbHaIBabp9N1l
 mHpW0jV2v8g03YMHmIXguGWFHgTZnKGcp46EcsqXPnCQCMKZWhN4RDlfLgvmKSYZ+D9X
 fblMHZAwjE+a2dhhGVQOmojEStyHFecI0nPkTXtx/QuOQ+RT5ny+kBkdVhUzzn69NvVU
 dzwcAOesEVA/z5XUAAG4+/gvZ1QOlbGsJjIf+Y28JrJ9plVYx9nPOf+YVxWdrPVhwP6A iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w9watb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2019 14:07:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BFD7100038;
 Fri,  4 Oct 2019 14:07:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45CBA2BDA6E;
 Fri,  4 Oct 2019 14:07:15 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 4 Oct
 2019 14:07:14 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Fri, 4 Oct 2019 14:07:14 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "Yannick
 FERTRE" <yannick.fertre@st.com>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>
Thread-Topic: [PATCH] dt-bindings: media: Convert stm32 cec bindings to
 json-schema
Thread-Index: AQHVeTQQzAxXsEKUOU6CWUsiOtV7DKdKRJUA
Date: Fri, 4 Oct 2019 12:07:14 +0000
Message-ID: <c74bae8a-e043-1484-2cd1-a644ad9b164d@st.com>
References: <20191002151410.15306-1-benjamin.gaignard@st.com>
In-Reply-To: <20191002151410.15306-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <16574661833B034C85DD4354A28F4483@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-04_06:2019-10-03,2019-10-04 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: media: Convert stm32 cec
 bindings to json-schema
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

+ Hans

On 10/2/19 5:14 PM, Benjamin Gaignard wrote:
> Convert the STM32 cec binding to DT schema format using json-schema
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>   .../devicetree/bindings/media/st,stm32-cec.txt     | 19 --------
>   .../devicetree/bindings/media/st,stm32-cec.yaml    | 57 ++++++++++++++++++++++
>   2 files changed, 57 insertions(+), 19 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.txt
>   create mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.txt b/Documentation/devicetree/bindings/media/st,stm32-cec.txt
> deleted file mode 100644
> index 6be2381c180d..000000000000
> --- a/Documentation/devicetree/bindings/media/st,stm32-cec.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -STMicroelectronics STM32 CEC driver
> -
> -Required properties:
> - - compatible : value should be "st,stm32-cec"
> - - reg : Physical base address of the IP registers and length of memory
> -	 mapped region.
> - - clocks : from common clock binding: handle to CEC clocks
> - - clock-names : from common clock binding: must be "cec" and "hdmi-cec".
> - - interrupts : CEC interrupt number to the CPU.
> -
> -Example for stm32f746:
> -
> -cec: cec@40006c00 {
> -	compatible = "st,stm32-cec";
> -	reg = <0x40006C00 0x400>;
> -	interrupts = <94>;
> -	clocks = <&rcc 0 STM32F7_APB1_CLOCK(CEC)>, <&rcc 1 CLK_HDMI_CEC>;
> -	clock-names = "cec", "hdmi-cec";
> -};
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
> new file mode 100644
> index 000000000000..c99144107185
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 CEC bindings
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> +  - Yannick Fertre <yannick.fertre@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32-cec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module Clock
> +      - description: Bus Clock
> +
> +  clock-names:
> +    items:
> +      - const: cec
> +      - const: hdmi-cec
> +
> +  pinctrl-names: true
> +
> +patternProperties:
> +  "^pinctrl-[0-9]+$": true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    cec: cec@40006c00 {
> +        compatible = "st,stm32-cec";
> +        reg = <0x40006c00 0x400>;
> +        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&rcc CEC_K>, <&clk_lse>;
> +        clock-names = "cec", "hdmi-cec";
> +    };
> +
> +...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
