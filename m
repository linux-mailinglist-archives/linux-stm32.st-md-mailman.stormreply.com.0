Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7078CF0D94
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 05:10:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36B0FC36B0B;
	Wed,  6 Nov 2019 04:10:28 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 930D5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 04:10:26 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id y194so19787078oie.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Nov 2019 20:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XTqm+5ilx5cNXoALUuokKsa13a1L8tV/eJS9nqrIoLA=;
 b=bFUcj3xJurVEvIqXjPrZz73jA8YYi02i1xCfCIC6d0Ld4CI8eBq5RTQvv7vz4OFJTp
 +4/2E/ouv+m9sBn0V59auhq/4iejwuc3ty4N9I5QS81aUUX9v49NNDKJEw0Rt420iGfq
 HXg7cedfH6H6ktOH2pAeaPtjmHAbq1cbJLoQYQEl+ZxMTErQRcT2HcgP65ANWa2VWkdm
 /mMGQRMKqDU1hiL0CFVBpRGJTyXuqAoLQ51JQik772BF29o063PCIntHrstDovQEwl7X
 MktE5qrV9uTej0TfvIueSHLYWvN6B23Vy+QHHLfS2kShEgzsZbS6+QAHtjSciu+xteBY
 RBXA==
X-Gm-Message-State: APjAAAVnUXgETmDLz9/ESJqzAH8c35ZWv/1Sdp0WHFgRTWQQiH8GTSTS
 BVwFtSxSNrk83NDSpiIWsQ==
X-Google-Smtp-Source: APXvYqylmIWEBXlGiig5sQDLxWMziJuvUvr8lMR4v+i6TBlZUwvxqcsWnINhAkMmXTCCEcsff6WZoQ==
X-Received: by 2002:aca:5dd5:: with SMTP id r204mr400621oib.73.1573013425171; 
 Tue, 05 Nov 2019 20:10:25 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w33sm6874277otb.68.2019.11.05.20.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 20:10:24 -0800 (PST)
Date: Tue, 5 Nov 2019 22:10:23 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191106041023.GB5294@bogus>
References: <20191031123040.26316-1-benjamin.gaignard@st.com>
 <20191031123040.26316-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031123040.26316-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, fabrice.gasnier@st.com,
 lee.jones@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: counter: Convert stm32
 counter bindings to json-schema
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

On Thu, Oct 31, 2019 at 01:30:37PM +0100, Benjamin Gaignard wrote:
> Convert the STM32 counter binding to DT schema format using json-schema

Probably this should all be 1 file instead.

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/counter/st,stm32-timer-cnt.yaml       | 38 ++++++++++++++++++++++
>  .../bindings/counter/stm32-timer-cnt.txt           | 31 ------------------
>  2 files changed, 38 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/counter/st,stm32-timer-cnt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/counter/stm32-timer-cnt.txt
> 
> diff --git a/Documentation/devicetree/bindings/counter/st,stm32-timer-cnt.yaml b/Documentation/devicetree/bindings/counter/st,stm32-timer-cnt.yaml
> new file mode 100644
> index 000000000000..56192d613601
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/counter/st,stm32-timer-cnt.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/counter/st,stm32-timer-cnt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Timers quadrature bindings
> +
> +description:
> +  STM32 Timer provides quadrature encoder to detect angular position
> +  and direction of rotary elements, from IN1 and IN2 input signals.
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> +  - Fabrice Gasnier <fabrice.gasnier@st.com>
> +
> +properties:
> +  counter:
> +    type: object
> +
> +    description:
> +      must be a sub-node of an STM32 Timer device tree node
> +
> +    properties:
> +      compatible:
> +        const: st,stm32-timer-counter
> +            
> +    required:
> +      - compatible
> +
> +examples:
> +  - |
> +    counter {
> +      compatible = "st,stm32-timer-counter";
> +    };
> +
> +...
> +
> diff --git a/Documentation/devicetree/bindings/counter/stm32-timer-cnt.txt b/Documentation/devicetree/bindings/counter/stm32-timer-cnt.txt
> deleted file mode 100644
> index c52fcdd4bf6c..000000000000
> --- a/Documentation/devicetree/bindings/counter/stm32-timer-cnt.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -STMicroelectronics STM32 Timer quadrature encoder
> -
> -STM32 Timer provides quadrature encoder to detect
> -angular position and direction of rotary elements,
> -from IN1 and IN2 input signals.
> -
> -Must be a sub-node of an STM32 Timer device tree node.
> -See ../mfd/stm32-timers.txt for details about the parent node.
> -
> -Required properties:
> -- compatible:		Must be "st,stm32-timer-counter".
> -- pinctrl-names: 	Set to "default".
> -- pinctrl-0: 		List of phandles pointing to pin configuration nodes,
> -			to set CH1/CH2 pins in mode of operation for STM32
> -			Timer input on external pin.
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
> -		counter {
> -			compatible = "st,stm32-timer-counter";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&tim1_in_pins>;
> -		};
> -	};
> -- 
> 2.15.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
