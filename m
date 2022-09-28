Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A99DE5ED5B7
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 09:10:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23FBEC63328;
	Wed, 28 Sep 2022 07:10:42 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9EB8C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 07:10:39 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id k10so19027953lfm.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ufQ0zGPTvfRrLImSMIEsJVXBC4zW2mPc5RxzBXgtKbA=;
 b=ssk1sXv9FlvBRHWFtu2ZjMB+T5sCsqsToz20IzF2iM6qnhaGPs6Y0J5MnImkfcwFXb
 0dqIQNWRwrGNl2WO/ZeoNpouvVVjREE6bSsd6oPYaO4bsBtI/sTfLCWCZTdzmNuAD5UY
 FfXvuCA+43+1DBCj4xCUBsS3pFCoGDaVGGTqc2uXIXUbidONh8lblkiJ/nPdCD813oOC
 wcQ2KbzyO+wjoxrF5+sPH/zLP1pEmyK9bhfpQHZn07Nqcq064k2oyfEZAPHSt3gWeviS
 KGPL3egTjH40KgsrjwHDb0KdDn/ZJ3orwMuTPGRb9uDmCA9y+LcmlqXqQ36vOs3JWP98
 mehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ufQ0zGPTvfRrLImSMIEsJVXBC4zW2mPc5RxzBXgtKbA=;
 b=jgZ3egqiQbGtfJf3FhN2CHo+MwSqF8TCya1MYux+0ngQDusFQzfJjgN0hYnCRMd7ip
 sp1YEUHFzHY+pMP8Q1o2Bp4m0DR258L0Uge9GdGqjwm9GUKLtmlG9Atw+Wz2YaeO7HFw
 3+Ac2HokBTHgIwN4Pzx4hueGhpKLtoN5DH3Fh3tXwemC7tl+BITcof/PsmapsboGGxS8
 mRpBriIexKxe2hxR1H5tsNKVq5DbSHhLt4uDRSiRT1FaXOZubwZXzKNYykHBB5aLrD6x
 FLCVLBMpeR+fbxbSz6F2WyNcTYNr67xcRXjJ6ekHXi35bZ/T2B3RgfcBUSd94mebhnOm
 KC1w==
X-Gm-Message-State: ACrzQf0gL5US5U8hVwP+VZt7ct8UZ5rMSKj562pRYoIXykZj/XY9k/4i
 1G60TpUzGPP8bDOxU821uzRvGw==
X-Google-Smtp-Source: AMsMyM7ogFFKIHQCral82ti5BCqs8IqYmc388oiFcO6XbFUzrKuFuRPXX2BFoB+R0NlXow3fdRTVZg==
X-Received: by 2002:a05:6512:b0d:b0:4a1:baad:8d7a with SMTP id
 w13-20020a0565120b0d00b004a1baad8d7amr7721071lfu.293.1664349038947; 
 Wed, 28 Sep 2022 00:10:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac25f63000000b0049f6484694bsm390318lfc.161.2022.09.28.00.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 00:10:38 -0700 (PDT)
Message-ID: <846bc515-bdda-6022-0611-daaa9a632e64@linaro.org>
Date: Wed, 28 Sep 2022 09:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20220926225536.548139-1-marex@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220926225536.548139-1-marex@denx.de>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: memory-controller: st,
 stm32: Split off MC properties
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

On 27/09/2022 00:55, Marek Vasut wrote:
> Split st,stm32-fmc2-ebi.yaml specific properties into st,stm32-fmc2-ebi-props.yaml ,
> split memory-controller bus peripheral properties into mc-peripheral-props.yaml ,
> reference the st,stm32-fmc2-ebi-props.yaml in mc-peripheral-props.yaml and
> reference the mc-peripheral-props.yaml in micrel,ks8851.yaml .
> 
> This way, the FMC2 controller properties in Micrel KSZ8851MLL ethernet
> controller node can be properly validated.
> 
> Fixes the following warning:
> 
> "
> arch/arm/boot/dts/stm32mp153c-dhcor-drc-compact.dtb: ethernet@1,0: Unevaluated properties are not allowed ('bank-width', 'st,fmc2-ebi-cs-mux-enable', 'st,fmc2-ebi-cs-transaction-type', 'st,fmc2-ebi-cs-buswidth', 'st,fmc2-ebi-cs-address-setup-ns', 'st,fmc2-ebi-cs-address-hold-ns', 'st,fmc2-ebi-cs-bus-turnaround-ns', 'st,fmc2-ebi-cs-data-setup-ns', 'st,fmc2-ebi-cs-data-hold-ns', 'st,fmc2-ebi-cs-write-address-setup-ns', 'st,fmc2-ebi-cs-write-address-hold-ns', 'st,fmc2-ebi-cs-write-bus-turnaround-ns', 'st,fmc2-ebi-cs-write-data-setup-ns', 'st,fmc2-ebi-cs-write-data-hold-ns' were unexpected)
> "
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Depends on bugfix [PATCH] dt-bindings: memory-controller: st,stm32: Fix st,fmc2_ebi-cs-write-address-setup-ns
>     - Replace MC controllers with Memory Controllers
>     - Add type uint32 and enum 1,2,4 to bank-width prop
>     - Add RB from Rob
> ---
>  .../mc-peripheral-props.yaml                  |  38 +++++
>  .../st,stm32-fmc2-ebi-props.yaml              | 144 ++++++++++++++++++
>  .../memory-controllers/st,stm32-fmc2-ebi.yaml | 137 -----------------
>  .../bindings/net/micrel,ks8851.yaml           |   1 +
>  4 files changed, 183 insertions(+), 137 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi-props.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
> new file mode 100644
> index 0000000000000..53ae995462db7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/mc-peripheral-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Peripheral-specific properties for a Memory Controller bus.
> +
> +description:
> +  Many Memory Controllers need to add properties to peripheral devices.
> +  They could be common properties like reg or they could be controller
> +  specific like delay in clock or data lines, etc. These properties need
> +  to be defined in the peripheral node because they are per-peripheral
> +  and there can be multiple peripherals attached to a controller. All
> +  those properties are listed here. The controller specific properties
> +  should go in their own separate schema that should be referenced
> +  from here.
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +properties:
> +  reg:
> +    description: Bank number, base address and size of the device.
> +
> +  bank-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Bank width of the device, in bytes.
> +    enum: [1, 2, 4]
> +
> +required:
> +  - reg
> +
> +# The controller specific properties go here.
> +allOf:
> +  - $ref: st,stm32-fmc2-ebi-props.yaml#
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi-props.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi-props.yaml
> new file mode 100644
> index 0000000000000..475e4095068c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi-props.yaml
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/st,stm32-fmc2-ebi-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Peripheral properties for ST FMC2 Controller
> +
> +maintainers:
> +  - Christophe Kerello <christophe.kerello@foss.st.com>
> +  - Marek Vasut <marex@denx.de>
> +
> +properties:
> +  st,fmc2-ebi-cs-transaction-type:
> +    description: |
> +      Select one of the transactions type supported
> +      0: Asynchronous mode 1 SRAM/FRAM.
> +      1: Asynchronous mode 1 PSRAM.
> +      2: Asynchronous mode A SRAM/FRAM.
> +      3: Asynchronous mode A PSRAM.
> +      4: Asynchronous mode 2 NOR.
> +      5: Asynchronous mode B NOR.
> +      6: Asynchronous mode C NOR.
> +      7: Asynchronous mode D NOR.
> +      8: Synchronous read synchronous write PSRAM.
> +      9: Synchronous read asynchronous write PSRAM.
> +      10: Synchronous read synchronous write NOR.
> +      11: Synchronous read asynchronous write NOR.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 11
> +
> +  st,fmc2-ebi-cs-cclk-enable:
> +    description: Continuous clock enable (first bank must be configured
> +      in synchronous mode). The FMC_CLK is generated continuously
> +      during asynchronous and synchronous access. By default, the
> +      FMC_CLK is only generated during synchronous access.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  st,fmc2-ebi-cs-mux-enable:
> +    description: Address/Data multiplexed on databus (valid only with
> +      NOR and PSRAM transactions type). By default, Address/Data
> +      are not multiplexed.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  st,fmc2-ebi-cs-buswidth:
> +    description: Data bus width
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 8, 16 ]
> +    default: 16
> +
> +  st,fmc2-ebi-cs-waitpol-high:
> +    description: Wait signal polarity (NWAIT signal active high).
> +      By default, NWAIT is active low.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  st,fmc2-ebi-cs-waitcfg-enable:
> +    description: The NWAIT signal indicates wheither the data from the
> +      device are valid or if a wait state must be inserted when accessing
> +      the device in synchronous mode. By default, the NWAIT signal is
> +      active one data cycle before wait state.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  st,fmc2-ebi-cs-wait-enable:
> +    description: The NWAIT signal is enabled (its level is taken into
> +      account after the programmed latency period to insert wait states
> +      if asserted). By default, the NWAIT signal is disabled.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  st,fmc2-ebi-cs-asyncwait-enable:
> +    description: The NWAIT signal is taken into account during asynchronous
> +      transactions. By default, the NWAIT signal is not taken into account
> +      during asynchronous transactions.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  st,fmc2-ebi-cs-cpsize:
> +    description: CRAM page size. The controller splits the burst access
> +      when the memory page is reached. By default, no burst split when
> +      crossing page boundary.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 128, 256, 512, 1024 ]
> +    default: 0
> +
> +  st,fmc2-ebi-cs-byte-lane-setup-ns:
> +    description: This property configures the byte lane setup timing
> +      defined in nanoseconds from NBLx low to Chip Select NEx low.
> +
> +  st,fmc2-ebi-cs-address-setup-ns:
> +    description: This property defines the duration of the address setup
> +      phase in nanoseconds used for asynchronous read/write transactions.
> +
> +  st,fmc2-ebi-cs-address-hold-ns:
> +    description: This property defines the duration of the address hold
> +      phase in nanoseconds used for asynchronous multiplexed read/write
> +      transactions.
> +
> +  st,fmc2-ebi-cs-data-setup-ns:
> +    description: This property defines the duration of the data setup phase
> +      in nanoseconds used for asynchronous read/write transactions.
> +
> +  st,fmc2-ebi-cs-bus-turnaround-ns:
> +    description: This property defines the delay in nanoseconds between the
> +      end of current read/write transaction and the next transaction.
> +
> +  st,fmc2-ebi-cs-data-hold-ns:
> +    description: This property defines the duration of the data hold phase
> +      in nanoseconds used for asynchronous read/write transactions.
> +
> +  st,fmc2-ebi-cs-clk-period-ns:
> +    description: This property defines the FMC_CLK output signal period in
> +      nanoseconds.
> +
> +  st,fmc2-ebi-cs-data-latency-ns:
> +    description: This property defines the data latency before reading or
> +      writing the first data in nanoseconds.
> +
> +  st,fmc2-ebi-cs-write-address-setup-ns:
> +    description: This property defines the duration of the address setup
> +      phase in nanoseconds used for asynchronous write transactions.
> +
> +  st,fmc2-ebi-cs-write-address-hold-ns:
> +    description: This property defines the duration of the address hold
> +      phase in nanoseconds used for asynchronous multiplexed write
> +      transactions.
> +
> +  st,fmc2-ebi-cs-write-data-setup-ns:
> +    description: This property defines the duration of the data setup
> +      phase in nanoseconds used for asynchronous write transactions.
> +
> +  st,fmc2-ebi-cs-write-bus-turnaround-ns:
> +    description: This property defines the delay between the end of current
> +      write transaction and the next transaction in nanoseconds.
> +
> +  st,fmc2-ebi-cs-write-data-hold-ns:
> +    description: This property defines the duration of the data hold phase
> +      in nanoseconds used for asynchronous write transactions.
> +
> +  st,fmc2-ebi-cs-max-low-pulse-ns:
> +    description: This property defines the maximum chip select low pulse
> +      duration in nanoseconds for synchronous transactions. When this timing
> +      reaches 0, the controller splits the current access, toggles NE to
> +      allow device refresh and restarts a new access.
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
> index a1f535cececcc..49243f447eb90 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
> @@ -49,143 +49,6 @@ patternProperties:
>    "^.*@[0-4],[a-f0-9]+$":
>      type: object
>  
> -    properties:
> -      reg:
> -        description: Bank number, base address and size of the device.
> -

To be equivalent (and similar to SPI peripherals and controllers) this
should reference st,stm32-fmc2-ebi-props.yaml as well.

After such reference, you can add here unevaluatedProperties:false
(could be same or new patch as it is not related to actual split).


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
