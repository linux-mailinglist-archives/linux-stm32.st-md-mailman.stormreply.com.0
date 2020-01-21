Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5E814471C
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2020 23:20:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF60BC36B0C;
	Tue, 21 Jan 2020 22:20:11 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C68BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 22:20:10 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i1so4191236oie.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 14:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JYjL5Dj4sHium7MXkG5wUfXThgHrFk9aKNPtUfH5UZc=;
 b=XOI5Q9qJjuI0TAeoL1/L9BS0nRIpAFj+XevuNn8B7SQ99JJfLquddcLwzSIogPOwgX
 HKrxlkCQMH1IEjijplyL1S3SujPLJWP++RHnM0afVBS8SngNhzDuEQTgl/Wd9NUBIVPb
 sgkym7CxC5lSSlE3mIfTDx6n3+CUyJ71deSsPDtZHeKmwuf8RdgmgfyOrVJHSwK91JZ/
 IHpaG/py/wYrSkkGnVLv6EGBM+JNUQfMWIQT6V4L24XHaO3+fiW+7dL12gn0Brxp0raw
 c6SeKN5IA8JeLGjfVu/ccybsHlMj3DM/5Ne2bOeQO8zdxgSUisqk9jZSx/E80ND/orEl
 x+5g==
X-Gm-Message-State: APjAAAWnPyYbycGCaiWNEMvOVDGz1uBzNjl1Xc7hACuxJ9cTOMUmSikq
 axAKozGDNDEMG+fMTkVfXA==
X-Google-Smtp-Source: APXvYqyA0cFBVl5WxqRWUAajmwQG24um1yPraaZ5cnlqeSKW61xBpYW8L1xuloSvzFgFL8RaFKDW6w==
X-Received: by 2002:aca:5588:: with SMTP id j130mr4595173oib.122.1579645208961; 
 Tue, 21 Jan 2020 14:20:08 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d7sm12406255oic.46.2020.01.21.14.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 14:20:08 -0800 (PST)
Received: (nullmailer pid 8896 invoked by uid 1000);
 Tue, 21 Jan 2020 22:20:07 -0000
Date: Tue, 21 Jan 2020 16:20:07 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200121222007.GA1686@bogus>
References: <20200114123329.3792-1-benjamin.gaignard@st.com>
 <20200114123329.3792-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114123329.3792-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: serial: Convert rs485
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

On Tue, Jan 14, 2020 at 01:33:28PM +0100, Benjamin Gaignard wrote:
> Convert rs485 binding to yaml style file.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  Documentation/devicetree/bindings/serial/rs485.txt | 32 +--------------
>  .../devicetree/bindings/serial/rs485.yaml          | 45 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/serial/rs485.yaml
> 
> diff --git a/Documentation/devicetree/bindings/serial/rs485.txt b/Documentation/devicetree/bindings/serial/rs485.txt
> index b92592dff6dd..a7fe93efc4a5 100644
> --- a/Documentation/devicetree/bindings/serial/rs485.txt
> +++ b/Documentation/devicetree/bindings/serial/rs485.txt
> @@ -1,31 +1 @@
> -* RS485 serial communications
> -
> -The RTS signal is capable of automatically controlling line direction for
> -the built-in half-duplex mode.
> -The properties described hereafter shall be given to a half-duplex capable
> -UART node.
> -
> -Optional properties:
> -- rs485-rts-delay: prop-encoded-array <a b> where:
> -  * a is the delay between rts signal and beginning of data sent in milliseconds.
> -      it corresponds to the delay before sending data.
> -  * b is the delay between end of data sent and rts signal in milliseconds
> -      it corresponds to the delay after sending data and actual release of the line.
> -  If this property is not specified, <0 0> is assumed.
> -- rs485-rts-active-low: drive RTS low when sending (default is high).
> -- linux,rs485-enabled-at-boot-time: empty property telling to enable the rs485
> -  feature at boot time. It can be disabled later with proper ioctl.
> -- rs485-rx-during-tx: empty property that enables the receiving of data even
> -  while sending data.
> -
> -RS485 example for Atmel USART:
> -	usart0: serial@fff8c000 {
> -		compatible = "atmel,at91sam9260-usart";
> -		reg = <0xfff8c000 0x4000>;
> -		interrupts = <7>;
> -		atmel,use-dma-rx;
> -		atmel,use-dma-tx;
> -		linux,rs485-enabled-at-boot-time;
> -		rs485-rts-delay = <0 200>;		// in milliseconds
> -	};
> -
> +See rs485.yaml
> diff --git a/Documentation/devicetree/bindings/serial/rs485.yaml b/Documentation/devicetree/bindings/serial/rs485.yaml
> new file mode 100644
> index 000000000000..65c6a98969a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/rs485.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serial/rs485.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RS485 serial communications Bindings
> +
> +description: The RTS signal is capable of automatically controlling
> +             line direction for the built-in half-duplex mode.
> +             The properties described hereafter shall be given to a
> +             half-duplex capable UART node.
> +
> +maintainers:
> +  -  Rob Herring <robh@kernel.org>
> +
> +properties:
> +  rs485-rts-delay:
> +    description: prop-encoded-array <a b>
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +      - items:
> +          items:
> +            - description:
> +                Delay between rts signal and beginning of data sent in milliseconds.
> +                It corresponds to the delay before sending data.
> +              $ref: "/schemas/types.yaml#/definitions/uint32"

This is not correct. The types only apply to whole properties.

Is there a maximum? Seems like 1 sec would be more than anyone would 
ever want?

> +              default: 0
> +            - description:
> +                Delay between end of data sent and rts signal in milliseconds.
> +                It corresponds to the delay after sending data and actual release of the line.
> +              $ref: "/schemas/types.yaml#/definitions/uint32"
> +              default: 0
> +
> +  rs485-rts-active-low:
> +    description: drive RTS low when sending (default is high).
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  linux,rs485-enabled-at-boot-time:
> +    description: enables the rs485 feature at boot time. It can be disabled later with proper ioctl.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  rs485-rx-during-tx:
> +   description: enables the receiving of data even while sending data.
> +   $ref: /schemas/types.yaml#/definitions/flag
> -- 
> 2.15.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
