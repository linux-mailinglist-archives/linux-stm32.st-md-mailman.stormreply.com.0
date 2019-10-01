Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD5EC3682
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2019 16:00:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0491BC36B0B;
	Tue,  1 Oct 2019 14:00:08 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3CFEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2019 14:00:06 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id c10so11596296otd.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Oct 2019 07:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JZBM1FPFDAl5uESgEP9tPsFTn7qdNx8IBtQzRJpA2CU=;
 b=ciBNEPdevsaomm5CJGw9EGiSUIF8hUxSVIfqHHaZA0eB/yIBmpWp5pdUjW6fWic1+P
 eNht0+t5DlVioVgipAxKgSKeIilxLunbV4BsDUCP9H5lMe//eZUgKX6f5089UGVGKZrz
 LI6BpsYYfKh8NstqdROcW6LRa2zB8RqRhsO1fqM1OI4Jn6+mdjEyIkxqiLWbiCrmNR8/
 kgu3jpyBTbVaxCmaXdT0Oj+nz6QAwcznCvCNLvfd2sR9KUOCE/BJn45EbxjqlUh1LrST
 D1kz5cEdzGqMD8q+RCHG3l78NZDS53aaHFugJBHuNV9m2zHpnZLePjmtPxyntIZGXndZ
 NVXg==
X-Gm-Message-State: APjAAAUFVS+hghYKzJmotSVJCydjm13A9c7+poYuqvKZvCzmkSE3rlng
 +s59Ld5UfHTuqrsxMhHefQ==
X-Google-Smtp-Source: APXvYqyny3jSQCJcTq07B8NFgeh+CqrPZ/jllExOJcitfcVJnCPPhlC7KQB0zTngJlFTUtwdcVIBqg==
X-Received: by 2002:a9d:4041:: with SMTP id o1mr4924805oti.61.1569938405253;
 Tue, 01 Oct 2019 07:00:05 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m25sm5045457oie.39.2019.10.01.07.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 07:00:04 -0700 (PDT)
Date: Tue, 1 Oct 2019 09:00:03 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20191001140003.GA31344@bogus>
References: <20190918173141.4314-1-krzk@kernel.org>
 <20190918173141.4314-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918173141.4314-2-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, Matt Mackall <mpm@selenic.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/8] dt-bindings: sram: Convert SRAM
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

On Wed, Sep 18, 2019 at 07:31:35PM +0200, Krzysztof Kozlowski wrote:
> Convert generic mmio-sram bindings to DT schema format using
> json-schema.

I've been slow getting to this because I started on the same thing...

> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable).
> ---
>  .../devicetree/bindings/sram/sram.txt         |  80 ----------
>  .../devicetree/bindings/sram/sram.yaml        | 138 ++++++++++++++++++
>  2 files changed, 138 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sram/sram.txt
>  create mode 100644 Documentation/devicetree/bindings/sram/sram.yaml

> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> new file mode 100644
> index 000000000000..8d9d6ce494b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sram/sram.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic on-chip SRAM
> +
> +maintainers:
> +  - FIXME <who@should.it.be>

You can put me.

> +
> +description: |+
> +  Simple IO memory regions to be managed by the genalloc API.
> +
> +  Each child of the sram node specifies a region of reserved memory. Each
> +  child node should use a 'reg' property to specify a specific range of
> +  reserved memory.
> +
> +  Following the generic-names recommended practice, node names should
> +  reflect the purpose of the node. Unit address (@<address>) should be
> +  appended to the name.
> +
> +properties:
> +  $nodename:
> +    pattern: "^sram(@.*)?"
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - mmio-sram
> +          - atmel,sama5d2-securam

I was trying to go down the path of putting all the compatibles for 
various SRAM bindings here, but I ran into some issues. I need to 
revisit as I've forgotten the exact issue.

This would need to be a 'contains' if this is going to work for others.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    description: Should use the same values as the root node.
> +
> +  "#size-cells":
> +    description: Should use the same values as the root node.

I defined both of these to be 1 as 4GB of SRAM should be enough for a 
while. We can debate 1 or 2 cells vs. 1, but there's no reason it has to 
be the same as the root (unless we're failing to do address 
translation).

> +
> +  ranges:
> +    description:
> +      Should translate from local addresses within the sram to bus addresses.
> +
> +  no-memory-wc:
> +    description:
> +      The flag indicating, that SRAM memory region has not to be remapped
> +      as write combining. WC is used by default.
> +    type: boolean
> +
> +  # TODO: additionalProperties: false
> +
> +patternProperties:
> +  "^([a-z]*-)?sram@[a-f0-9]$":
> +    type: object
> +    description:
> +      Each child of the sram node specifies a region of reserved memory.
> +    properties:
> +      reg:
> +        description:
> +          IO mem address range, relative to the SRAM range.

maxItems: 1

> +
> +      compatible:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description:
> +          Should contain a vendor specific string in the form
> +          <vendor>,[<device>-]<usage>
> +
> +      pool:
> +        description:
> +          Indicates that the particular reserved SRAM area is addressable
> +          and in use by another device or devices.
> +        type: boolean
> +
> +      export:
> +        description:
> +          Indicates that the reserved SRAM area may be accessed outside
> +          of the kernel, e.g. by bootloader or userspace.
> +        type: boolean
> +
> +      protect-exec:
> +        description: |
> +          Same as 'pool' above but with the additional constraint that code
> +          will be run from the region and that the memory is maintained as
> +          read-only, executable during code execution. NOTE: This region must
> +          be page aligned on start and end in order to properly allow
> +          manipulation of the page attributes.
> +        type: boolean
> +
> +      label:
> +        $ref: /schemas/types.yaml#/definitions/string

Already has a type definition.

> +        description:
> +          The name for the reserved partition, if omitted, the label is taken
> +          from the node name excluding the unit address.
> +
> +      clocks:
> +        description:
> +          A list of phandle and clock specifier pair that controls the
> +          single SRAM clock.
> +
> +      # TODO: additionalProperties: false
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +examples:
> +  - |
> +    sram: sram@5c000000 {
> +        compatible = "mmio-sram";
> +        reg = <0x5c000000 0x40000>; /* 256 KiB SRAM at address 0x5c000000 */
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x5c000000 0x40000>;
> +
> +        smp-sram@100 {
> +            compatible = "socvendor,smp-sram";
> +            reg = <0x100 0x50>;
> +        };
> +
> +        device-sram@1000 {
> +            reg = <0x1000 0x1000>;
> +            pool;
> +        };
> +
> +        exported@20000 {
> +            reg = <0x20000 0x20000>;
> +            export;
> +        };
> +    };
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
