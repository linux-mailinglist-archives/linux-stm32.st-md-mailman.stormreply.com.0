Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61645315965
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 23:26:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1966CC57B53;
	Tue,  9 Feb 2021 22:26:15 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A3C8C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 22:26:14 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 100so12196otg.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Feb 2021 14:26:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CpHUG6zmw18TNWXb6G+ZZ+TkFily+o9vxR1Gsb1g40M=;
 b=ukyrQHmDrM1mxuo6k3XB9+2Be22oZ4mpCoLOfA18b22AUxislwKuTHVdIWP8ZzJfxq
 tfdvhFo6tX937ME0/QLrvB5ya6DMQ4Z7trhmz6G7NNkkuaUqu03OybI6Zi69IArxbzCa
 KbT/y7zqp5vHovaSnE6CJV1D4iZ4fhOWbkKDLvEOZ4ftx/56oN1K5mSUlUmcO2yq7lMJ
 Qz5sRU/7IK5/H7W/y8TFTjnNWjV7OUyLG4duI/qHH4S6RDZDLQjGE+WRoWi+LKLU/eOr
 mue4I25OolEgNcbeKvXmjIFK/T5HV2FURpSrz4rHQJF5Y42huqrBjemabeAr2m4uzNNx
 F3/w==
X-Gm-Message-State: AOAM532qywzB0KQsckg34Fctj8+X6JhJQTGwHxl1/hXNzfAQgeC44C1Q
 9ELB3kX6wSApU+9/njP+gQ==
X-Google-Smtp-Source: ABdhPJzr2vknJRylFG+vJrIeAIlQaCsPUqumwuuZSexwlH+7rHvqFVgBEECiYUuNWu9rdahsJqXIfw==
X-Received: by 2002:a05:6830:4110:: with SMTP id
 w16mr17667575ott.102.1612909572989; 
 Tue, 09 Feb 2021 14:26:12 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t14sm17724oif.30.2021.02.09.14.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 14:26:10 -0800 (PST)
Received: (nullmailer pid 324900 invoked by uid 1000);
 Tue, 09 Feb 2021 22:26:08 -0000
Date: Tue, 9 Feb 2021 16:26:08 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20210209222608.GA269004@robh.at.kernel.org>
References: <20210208135609.7685-1-Sergey.Semin@baikalelectronics.ru>
 <20210208135609.7685-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208135609.7685-5-Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Joao Pinto <jpinto@synopsys.com>,
 netdev@vger.kernel.org, Lars Persson <larper@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH v2 04/24] dt-bindings: net: dwmac:
 Refactor snps, *-config properties
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

On Mon, Feb 08, 2021 at 04:55:48PM +0300, Serge Semin wrote:
> Currently the "snps,axi-config", "snps,mtl-rx-config" and
> "snps,mtl-tx-config" properties are declared as a single phandle reference
> to a node with corresponding parameters defined. That's not good for
> several reasons. First of all scattering around a device tree some
> particular device-specific configs with no visual relation to that device
> isn't suitable from maintainability point of view. That leads to a
> disturbed representation of the actual device tree mixing actual device
> nodes and some vendor-specific configs. Secondly using the same configs
> set for several device nodes doesn't represent well the devices structure,
> since the interfaces these configs describe in hardware belong to
> different devices and may actually differ. In the later case having the
> configs node separated from the corresponding device nodes gets to be
> even unjustified.
> 
> So instead of having a separate DW *MAC configs nodes we suggest to
> define them as sub-nodes of the device nodes, which interfaces they
> actually describe. By doing so we'll make the DW *MAC nodes visually
> correct describing all the aspects of the IP-core configuration. Thus
> we'll be able to describe the configs sub-nodes bindings right in the
> snps,dwmac.yaml file.
> 
> Note the former "snps,axi-config", "snps,mtl-rx-config" and
> "snps,mtl-tx-config" properties have been marked as deprecated in favor of
> the added by this commit "axi-config", "mtl-rx-config" and "mtl-tx-config"
> sub-nodes respectively.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Note this change will work only if DT-schema tool is fixed like this:
> 
> --- a/meta-schemas/nodes.yaml	2021-02-08 14:20:56.732447780 +0300
> +++ b/meta-schemas/nodes.yaml	2021-02-08 14:21:00.736492245 +0300
> @@ -22,6 +22,7 @@
>      - unevaluatedProperties
>      - deprecated
>      - required
> +    - not
>      - allOf
>      - anyOf
>      - oneOf

Can you send me a patch or GH PR. There is another way to express. More 
below.

> 
> So a property with name "not" would be allowed and the "not-required"
> pattern would work.
> 
> Changelog v2:
> - Add the new sub-nodes "axi-config", "mtl-rx-config" and "mtl-tx-config"
>   describing the nodes now deprecated properties were supposed to
>   refer to.
> - Fix invalid identation in the "snps,route-*" property settings.
> - Use correct syntax of the JSON pointers, so the later would begin
>   with a '/' after the '#'.
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 389 +++++++++++++-----
>  1 file changed, 297 insertions(+), 92 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 03d58bf9965f..4dda9ffa822c 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -150,73 +150,264 @@ properties:
>        in a different mode than the PHY in order to function.
>  
>    snps,axi-config:
> +    deprecated: true
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> -      AXI BUS Mode parameters. Phandle to a node that can contain the
> -      following properties
> -        * snps,lpi_en, enable Low Power Interface
> -        * snps,xit_frm, unlock on WoL
> -        * snps,wr_osr_lmt, max write outstanding req. limit
> -        * snps,rd_osr_lmt, max read outstanding req. limit
> -        * snps,kbbe, do not cross 1KiB boundary.
> -        * snps,blen, this is a vector of supported burst length.
> -        * snps,fb, fixed-burst
> -        * snps,mb, mixed-burst
> -        * snps,rb, rebuild INCRx Burst
> +      AXI BUS Mode parameters. Phandle to a node that contains the properties
> +      described in the 'axi-config' sub-node.
> +
> +  axi-config:
> +    type: object
> +    description: AXI BUS Mode parameters
> +
> +    properties:
> +      snps,lpi_en:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Enable Low Power Interface
> +
> +      snps,xit_frm:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Unlock on WoL
> +
> +      snps,wr_osr_lmt:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Max write outstanding req. limit
> +        default: 1
> +        minimum: 0
> +        maximum: 15
> +
> +      snps,rd_osr_lmt:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Max read outstanding req. limit
> +        default: 1
> +        minimum: 0
> +        maximum: 15
> +
> +      snps,kbbe:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Do not cross 1KiB boundary
> +
> +      snps,blen:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: A vector of supported burst lengths
> +        minItems: 7
> +        maxItems: 7
> +        items:
> +          enum: [256, 128, 64, 32, 16, 8, 4, 0]
> +
> +      snps,fb:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Fixed-burst
> +
> +      snps,mb:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Mixed-burst
> +
> +      snps,rb:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Rebuild INCRx Burst
> +
> +    additionalProperties: false
>  
>    snps,mtl-rx-config:

You could keep these pointing to child nodes to avoid driver changes.

> +    deprecated: true
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> -      Multiple RX Queues parameters. Phandle to a node that can
> -      contain the following properties
> -        * snps,rx-queues-to-use, number of RX queues to be used in the
> -          driver
> -        * Choose one of these RX scheduling algorithms
> -          * snps,rx-sched-sp, Strict priority
> -          * snps,rx-sched-wsp, Weighted Strict priority
> -        * For each RX queue
> -          * Choose one of these modes
> -            * snps,dcb-algorithm, Queue to be enabled as DCB
> -            * snps,avb-algorithm, Queue to be enabled as AVB
> -          * snps,map-to-dma-channel, Channel to map
> -          * Specifiy specific packet routing
> -            * snps,route-avcp, AV Untagged Control packets
> -            * snps,route-ptp, PTP Packets
> -            * snps,route-dcbcp, DCB Control Packets
> -            * snps,route-up, Untagged Packets
> -            * snps,route-multi-broad, Multicast & Broadcast Packets
> -          * snps,priority, bitmask of the tagged frames priorities assigned to
> -            the queue
> +      Multiple RX Queues parameters. Phandle to a node that contains the
> +      properties described in the 'mtl-rx-config' sub-node.
> +
> +  mtl-rx-config:
> +    type: object
> +    description: Multiple RX Queues parameters
> +
> +    properties:
> +      snps,rx-queues-to-use:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Number of RX queues to be used in the driver
> +        default: 1
> +        minimum: 1
> +
> +    patternProperties:
> +      "^snps,rx-sched-(sp|wsp)$":
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Strict/Weighted Strict RX scheduling priority
> +
> +      "^queue[0-9]$":
> +        type: object
> +        description: Each RX Queue parameters
> +
> +        properties:
> +          snps,map-to-dma-channel:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: DMA channel to map
> +
> +          snps,priority:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: RX queue priority
> +            minimum: 0
> +            maximum: 15
> +
> +        patternProperties:
> +          "^snps,(dcb|avb)-algorithm$":
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: Enable Queue as DCB/AVB
> +
> +          "^snps,route-(avcp|ptp|dcbcp|up|multi-broad)$":
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description:
> +              AV Untagged/PTP/DCB Control/Untagged/Multicast & Broadcast
> +              packets routing respectively.
> +
> +        additionalProperties: false
> +
> +        # Choose only one of the Queue modes and the packets routing
> +        allOf:
> +          - not:
> +              required:
> +                - snps,dcb-algorithm
> +                - snps,avb-algorithm
> +          - oneOf:
> +              - required:
> +                  - snps,route-avcp
> +              - required:
> +                  - snps,route-ptp
> +              - required:
> +                  - snps,route-dcbcp
> +              - required:
> +                  - snps,route-up
> +              - required:
> +                  - snps,route-multi-broad
> +              - not:
> +                  anyOf:
> +                    - required:
> +                        - snps,route-avcp
> +                    - required:
> +                        - snps,route-ptp
> +                    - required:
> +                        - snps,route-dcbcp
> +                    - required:
> +                        - snps,route-up
> +                    - required:
> +                        - snps,route-multi-broad

This 'not: ..." could be:

properties:
  snps,route-avcp: false
  snps,route-ptp: false
  snps,route-dcbcp: false
  snps,route-up: false
  snps,route-multi-broad: false

Not sure which one is better. Using required everywhere or more 
concise...

(Really, 'route' should have taken a value and the schema would be 
greatly simplified. Oh well.)

> +
> +    additionalProperties: false
> +
> +    # Choose one of the RX scheduling algorithms
> +    not:
> +      required:
> +        - snps,rx-sched-sp
> +        - snps,rx-sched-wsp

I guess this is the problematic one. The rest should be hidden behind 
conditionals (a common loophole in meta-schema checks). You could do 
that here:

allOf:
  - not:
      ...

But why not just make one of the 2 properties required? You're already 
changing things. 

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
