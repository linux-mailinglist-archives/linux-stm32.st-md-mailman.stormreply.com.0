Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC7FE9A2B
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2019 11:40:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88577C36B0B;
	Wed, 30 Oct 2019 10:40:14 +0000 (UTC)
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42A27C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 10:40:13 +0000 (UTC)
Received: from [172.20.50.122] ([91.217.168.176])
 by smtp-cloud9.xs4all.net with ESMTPA
 id PlOaiZF6psBskPlOdiLsfs; Wed, 30 Oct 2019 11:40:12 +0100
To: Benjamin Gaignard <benjamin.gaignard@st.com>, mchehab@kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com,
 yannick.fertre@st.com, philippe.cornu@st.com, hugues.fruchet@st.com
References: <20191014092021.24020-1-benjamin.gaignard@st.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e6655a20-5d87-7dc1-14e3-844f12096f0e@xs4all.nl>
Date: Wed, 30 Oct 2019 11:40:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014092021.24020-1-benjamin.gaignard@st.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDQzby7iJi2ukFJgU8JHUeC09xVN/QRQKmGaOzCliVJkkKMZFTdmOnJyl8HqCfm0V2sLtB6hU6a8WD57eHRd4e5QptFvRANT17/vxFEteIhxRqmWlxup
 yb6FF0YqO7vKcKT4RG1fHevWR/4xpUhkU3Nl0alXpEnwvsA39svrlvWADD+PNIf+RlT5UjSQ697/L9g0WIfEADln+HoYUtv/vGAQD6V+8+zHFnn4bghuqDFo
 iC3yKvFv2A2bmLAJx65S702UAHYb0ofwwXOCkVWvZgbBoeass0tdrPNA24ThvBhi5vPsAYKvdAClQO4+qxFjJ9Y8ih9N5vkyp95mETisdI85XEghoy6iJDPt
 rQrNQbHhZR2TFSZTf10mF+ZSgTAvZm3bsc7UWfbBgdd/uvnlRYo9aqrEjo5f5Nr25FPnKDDc4AaS7urPt+VECDT83IcrRXWBoG15fduxWlhtaM2yXVm2Lzbz
 /+XykNPENAoFFRhLmDcLoLW6tNPVJ5rLsCWMcSjaDdO+Z2E4gAk5dUz2bBVqu4jyfwb0joC4VtW49RNsOYPyVt9tgi9GsZO6TwjyMJ7355BQWo1k2pkXK4R/
 s00JGiNgf1Ej0c0VzZSaci2Hi6O9Q+xHZ/plQAWZVrQb7F6/pEquzv7qhj9hWO0uW+4=
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: media: Convert stm32 cec
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10/14/19 11:20 AM, Benjamin Gaignard wrote:
> Convert the STM32 cec binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

There doesn't seem to be a MAINTAINERS entry for this driver. Can you add
one?

	Hans

> ---
> changes in v3:
> - use (GPL-2.0-only OR BSD-2-Clause) license
> 
> changes in v2:
> - use BSD-2-Clause license
> - add additionalProperties: false
> - remove pinctrl-names and pinctrl-[0-9]
> 
>   .../devicetree/bindings/media/st,stm32-cec.txt     | 19 --------
>   .../devicetree/bindings/media/st,stm32-cec.yaml    | 54 ++++++++++++++++++++++
>   2 files changed, 54 insertions(+), 19 deletions(-)
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
> index 000000000000..d75019c093a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
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
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
