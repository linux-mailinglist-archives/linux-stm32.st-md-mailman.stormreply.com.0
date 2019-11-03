Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D54ED306
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Nov 2019 12:08:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0035C36B0B;
	Sun,  3 Nov 2019 11:08:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9EE1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Nov 2019 11:08:49 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9974820842;
 Sun,  3 Nov 2019 11:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572779327;
 bh=FbaoVaWioLqr0Z7FxL6DKXeAOHtNY6YOT3zMnzdc8eU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aD6PQEf1YtBiqkJF3yrAS2+/Z6KUwhqc68hNZX6/JK6K79E/SC6l/MJJK/XPvHMVo
 FKFtMgi5uMvstFpoEvL8wAOJ/0IAUtx1un5J0bwBbMya+o7K3qc6EBB8uSXwD0/x9c
 +PTJWqhrPJrpGPKRQQy4w5Ow7wodiZeOSRK/hR54=
Date: Sun, 3 Nov 2019 11:08:41 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191103110841.3ad3ecfb@archlinux>
In-Reply-To: <20191031123040.26316-3-benjamin.gaignard@st.com>
References: <20191031123040.26316-1-benjamin.gaignard@st.com>
 <20191031123040.26316-3-benjamin.gaignard@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, pmeerw@pmeerw.net,
 knaack.h@gmx.de, fabrice.gasnier@st.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] dt-bindings: iio: timer: Convert
 stm32 IIO trigger bindings to json-schema
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

On Thu, 31 Oct 2019 13:30:38 +0100
Benjamin Gaignard <benjamin.gaignard@st.com> wrote:

> Convert the STM32 IIO trigger binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
I'm far from great on these as still haven't taken the time I should to learn
the yaml syntax properly.  A few comments inline however based mostly on this
doesn't quite look like other ones I've seen recently.

Thanks,

Jonathan

> ---
>  .../bindings/iio/timer/st,stm32-timer-trigger.yaml | 44 ++++++++++++++++++++++
>  .../bindings/iio/timer/stm32-timer-trigger.txt     | 25 ------------
>  2 files changed, 44 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/timer/st,stm32-timer-trigger.yaml
>  delete mode 100644 Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/timer/st,stm32-timer-trigger.yaml b/Documentation/devicetree/bindings/iio/timer/st,stm32-timer-trigger.yaml
> new file mode 100644
> index 000000000000..1c8c8b55e8cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/timer/st,stm32-timer-trigger.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/timer/st,stm32-timer-trigger.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Timers IIO timer bindings
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> +  - Fabrice Gasnier <fabrice.gasnier@st.com>
> +
> +properties:
> +  $nodemane:

nodename?

> +    pattern: "^timer@[0-9]+$"
> +    type: object
> +
> +    description:
> +      must be a sub-node of an STM32 Timer device tree node
> +
> +    properties:
> +      compatible:
> +        oneOf:

enum is I think preferred for these.

> +          - const: st,stm32-timer-trigger
> +          - const: st,stm32h7-timer-trigger
> +            
> +      reg: true

Normally some info for what the reg value is..

> +
> +    required:
> +      - compatible
> +      - reg
> +
> +examples:
> +  - |
> +    timers2: timer@40000000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      timer@0 {
> +        compatible = "st,stm32-timer-trigger";
> +        reg = <0>;
> +      };
> +    };
> +    
> +...
> diff --git a/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt b/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
> deleted file mode 100644
> index b8e8c769d434..000000000000
> --- a/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -STMicroelectronics STM32 Timers IIO timer bindings
> -
> -Must be a sub-node of an STM32 Timers device tree node.
> -See ../mfd/stm32-timers.txt for details about the parent node.
> -
> -Required parameters:
> -- compatible:	Must be one of:
> -		"st,stm32-timer-trigger"
> -		"st,stm32h7-timer-trigger"
> -- reg:		Identify trigger hardware block.
> -
> -Example:
> -	timers@40010000 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "st,stm32-timers";
> -		reg = <0x40010000 0x400>;
> -		clocks = <&rcc 0 160>;
> -		clock-names = "int";
> -
> -		timer@0 {
> -			compatible = "st,stm32-timer-trigger";
> -			reg = <0>;
> -		};
> -	};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
