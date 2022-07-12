Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B885714E5
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jul 2022 10:42:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 310F1C640F9;
	Tue, 12 Jul 2022 08:42:50 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88526C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 08:42:49 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id r9so4753293lfp.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 01:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=beH/rg/vfB+Yd9R/ZZN+HNd6fMmwTTRKCdj3qxzIlfw=;
 b=GUOcZRDeJq7SuRAbLTR5dTQL/L2f6miqFoSHCX4KDoodgtL270sNff1V+yvO8IFApl
 kMEovUjRNw4KZlCPuZbB5MercZlupfI4VW1u4loKgkm5TbgtqGIanbocEVmeRZeD1mtH
 jShb0iJnYSOpmCHoSP0cgmO2yAbZaL2Glza21F2siIzojGJvgxdFw7q7bEWsSA34DKFK
 Dtg9j5IzA8BPN4NaLFhwuvr7JXmSnX6MDFJPSQz35ncezYeTnPSIH60Xvk5d4mMquaRc
 lwGuY6dnKmMvA1Wxh1eAuMo2Oezs2YtjVnBdedA6Bp8dKxbw0CqfsHWZdO7N2CacS+nS
 TavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=beH/rg/vfB+Yd9R/ZZN+HNd6fMmwTTRKCdj3qxzIlfw=;
 b=xUTDwO5HiYxrxQ9X2qLOpdaDlsvSywM/NX0HXep07VdCoFYjAxojpSrJ8wbliz7VwG
 6kjaVMLD/swsGq3W+vbQDXX41K5q/7BImazEDnoCmrkTXdyG6zx6InDxxuMRztHSIdA1
 jbljezwu9Ek7zBDl3FtJO7JGeuZ7yXhgOTLRklyecx4AcEM9/WIgMA4fl8JbCepNzM/N
 mBAuK0as224/SSp3MUjja09B/HW70751KWUyFWQupND1WpA+7BL9MUhaJAy7jNG10H2a
 C5sBx5yibsDtBEE4vzZNKNGyBHWyM4YVPdxmWu6HjUUvcV600UW19wmyrrErSZpGN1Lg
 BoCg==
X-Gm-Message-State: AJIora9jZsLUbRB/337Tjw8p1MC43qDTKK5dq6rY8UWxp67w9ua/1PwM
 kV7o5IM77aNQh6if5qiuOs5XRw==
X-Google-Smtp-Source: AGRyM1sI2eIEo4Bwc0oYhOPsU94ZRQCA0G+Z66pXFLubJDzxUZkVGSP9W+OSBkXqr6pURGtafmmu0Q==
X-Received: by 2002:a05:6512:2823:b0:485:6312:2a07 with SMTP id
 cf35-20020a056512282300b0048563122a07mr14123734lfb.525.1657615368769; 
 Tue, 12 Jul 2022 01:42:48 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a2eb5d2000000b0025c068f123dsm2287413ljn.30.2022.07.12.01.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 01:42:48 -0700 (PDT)
Message-ID: <403ba7a3-7e3d-4daa-6c14-d8bb4a3d6087@linaro.org>
Date: Tue, 12 Jul 2022 10:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
References: <20220711120122.25804-1-fabrice.gasnier@foss.st.com>
 <20220711120122.25804-2-fabrice.gasnier@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711120122.25804-2-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 1/4] dt-bindings: usb: typec: add
 bindings for stm32g0 controller
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

On 11/07/2022 14:01, Fabrice Gasnier wrote:
> Add DT schema documentation for the STM32G0 Type-C PD (Power Delivery)
> controller.
> STM32G0 provides an integrated USB Type-C and power delivery interface.
> It can be programmed with a firmware to handle UCSI protocol over I2C
> interface. A GPIO is used as an interrupt line.
> It may be used as a wakeup source, so use optional "wakeup-source" and
> "power-domains" properties to support wakeup.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thank you for your patch. There is something to discuss/improve.

> ---
> Changes in v2:
> - Krzysztof's review comments: update commit message, use ports, use
>   unevaluatedProperties: false for usb-connector schema, define maxItems
>   for power-domains, adopt generic node names, remove quotes
> ---
>  .../bindings/usb/st,typec-stm32g0.yaml        | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml b/Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml
> new file mode 100644
> index 0000000000000..7b3a2c2124e38
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/st,typec-stm32g0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32G0 USB Type-C PD controller
> +
> +description: |
> +  The STM32G0 MCU can be programmed to control Type-C connector(s) through I2C
> +  typically using the UCSI protocol over I2C, with a dedicated alert
> +  (interrupt) pin.
> +
> +maintainers:
> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stm32g0-typec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  connector:
> +    type: object
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +  firmware-name:
> +    description: |
> +      Should contain the name of the default firmware image
> +      file located on the firmware search path
> +
> +  wakeup-source: true
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

Isn't connector a required property? I would assume the device does not
make much sense to operate without it.

What about firmware-name? Do you expect hardware to work fine without it
(default firmware?)?


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
