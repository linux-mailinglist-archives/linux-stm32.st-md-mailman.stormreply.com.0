Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 246A378B165
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 15:13:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6687C6A617;
	Mon, 28 Aug 2023 13:13:11 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5354C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 13:13:09 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2bcb0b973a5so48399961fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 06:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693228389; x=1693833189;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vPcs0sktiib0CVnQrsGDXOLxOsYaOoyJrgrvneL+iRI=;
 b=EEnmV2sMju/dqKLAuQnHnueTheowYjzwfKRXRixXky7c7ImDccINdT0pTl+/2ge+j+
 W1pQXboC6Ty5KaPQZKmUab5cR3/E3SPwFn9K5eeYl/qmeBKaQa0ZNEv0Ddn8XiMFJqQu
 qD/Z4VBRm4rRaM4vVz88+OFysYVXVgVRKBzET7RGwE1kO4apkcxPBMqGD+JJw6ak5oyb
 cbRNV3fTTE0nex1r7M5S7x16TkQYwiy8j7DXsPDziOQbK2rK4EsaWc8IHmA34JmackPg
 2L1uMD91hM5K9qVgvueZ9hdPljPNiLj8bD9B18OaT2HrcTATN4QQajG50QkT5f9Qkpyl
 2zCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693228389; x=1693833189;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vPcs0sktiib0CVnQrsGDXOLxOsYaOoyJrgrvneL+iRI=;
 b=PxAQj6ImspjLkJ4fD9xTJWCyFqzeO8FNOKImU4zPsyVkqc7CWcmF+lIsM1cIEj9Agx
 YtyfmP6A6p7B89GC0BRVI/C7lh12mX9GJmW9bCkbNHL5U/66pp/uUxF10WlSytV2Z65L
 bg4ObIhN4p5ATXP+d3jSMu5OGAeafR2Iryobif4H2pXZeiSMpx3ZF5bBCs+x3b0Uv1gf
 Z3J4jkYcCB8WqhFrDO5D1KoBtYWfg09oyOaCmPJVk2ITQta0w056qv1qYILkEXuqhvVX
 nX5W3GjpX5F4UigrxK446SKBJTVIY9AawnosDtlyObwlVHWgOfWyGY3Wjr0MBvRTWEp/
 nrew==
X-Gm-Message-State: AOJu0YxugJSkPWpSZjdhPqu7ZmdrBqqsMGbE3Bv/bEk2pWs+1VkGWDhE
 YGPTl76WUREQQ8ek+CIJA4Y=
X-Google-Smtp-Source: AGHT+IEm2nDKmysz9bZqzY/IjgJcyF6bL+NRMaFzEewPti0bqJYqOQn+cfpgmS2KGCGOxCmnPQWspQ==
X-Received: by 2002:a2e:99c4:0:b0:2bc:e856:6208 with SMTP id
 l4-20020a2e99c4000000b002bce8566208mr8664753ljj.33.1693228388708; 
 Mon, 28 Aug 2023 06:13:08 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a2e86d7000000b002b9e5fe86dasm1727253ljj.81.2023.08.28.06.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 06:13:08 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:13:00 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <qc2nyqmuouig6qww2q7orlwzvcprjyruyeuyr5dqdpxysajjpv@6fzsgjgokry7>
References: <20230827091710.1483-1-jszhang@kernel.org>
 <20230827091710.1483-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827091710.1483-3-jszhang@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Maxime@web.codeaurora.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Coquelin@web.codeaurora.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/3] dt-bindings: net: add
 T-HEAD dwmac support
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

On Sun, Aug 27, 2023 at 05:17:09PM +0800, Jisheng Zhang wrote:
> Add documentation to describe T-HEAD dwmac.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>  .../devicetree/bindings/net/thead,dwmac.yaml  | 77 +++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index b196c5de2061..73821f86a609 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -96,6 +96,7 @@ properties:
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
>          - starfive,jh7110-dwmac
> +        - thead,th1520-dwmac
>  
>    reg:
>      minItems: 1
> diff --git a/Documentation/devicetree/bindings/net/thead,dwmac.yaml b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
> new file mode 100644
> index 000000000000..bf8ec8ca2753
> --- /dev/null

> +++ b/Documentation/devicetree/bindings/net/thead,dwmac.yaml

see further regarding using dwmac in the names here.

> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +

> +title: T-HEAD DWMAC Ethernet controller

Additionally would be nice to have a brief controller "description:"
having the next info: the SoCs the controllers can be found on, the DW
(G)MAC IP-core version the ethernet controller is based on and some
data about the synthesize parameters: SMA (MDIO-bus), Tx/Rx COE, DMA
FIFOs size, perfect and hash MAC-filters size, L3L4 frame filters
availability, VLAN hash filter, SA/VLAN-tag insertion, ARP offload
engine, PHY interfaces (MII, RMII, RGMII, etc), EEE support, IEEE
1588(-2008) Timestamping support, PMT and Wake-up frame support, MAC
Management counters (MMC). In addition to that for DW QoS
ETH/XGMAC/XLGMAC the next info would be useful: number of MTL Queues
and DMA channels, MTL queues capabilities (QoS-related), TSO
availability, SPO availability.

Note DMA FIFO sizes can be also constrained in the properties
"rx-fifo-depth" and "tx-fifo-depth"; perfect and hash MAC-filter sizes -
in "snps,perfect-filter-entries" and "snps,multicast-filter-bins".

> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:

> +          - thead,th1520-dwmac

Referring to the DW IP-core in the compatible string isn't very
much useful especially seeing you have a generic fallback compatible.
Name like "thead,th1520-gmac" looks more informative indicating its
speed capability.

> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:

> +          - thead,th1520-dwmac

ditto.

-Serge(y)

> +      - const: snps,dwmac-3.70a
> +
> +  reg:
> +    maxItems: 1
> +
> +  thead,gmacapb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle to the syscon node that control ethernet
> +      interface and timing delay.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - phy-mode
> +  - thead,gmacapb
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    gmac0: ethernet@e7070000 {
> +        compatible = "thead,th1520-dwmac", "snps,dwmac-3.70a";
> +        reg = <0xe7070000 0x2000>;
> +        clocks = <&clk 1>, <&clk 2>;
> +        clock-names = "stmmaceth", "pclk";
> +        interrupts = <66>;
> +        interrupt-names = "macirq";
> +        phy-mode = "rgmii-id";
> +        snps,fixed-burst;
> +        snps,axi-config = <&stmmac_axi_setup>;
> +        snps,pbl = <32>;
> +        thead,gmacapb = <&gmacapb_syscon>;
> +        phy-handle = <&phy0>;
> +
> +        mdio {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "snps,dwmac-mdio";
> +
> +            phy0: ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +        };
> +    };
> -- 
> 2.40.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
