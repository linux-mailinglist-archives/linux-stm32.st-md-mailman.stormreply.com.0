Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFD12DB2FF
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Dec 2020 18:50:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EBE9C32E90;
	Tue, 15 Dec 2020 17:50:07 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45BBBC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 17:50:05 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id x13so20244964oto.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 09:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TtEN0qeUEFJtej+0NqYqcBgmDeRXe5i3bl1rddfJtGk=;
 b=Ejf0ZFedQU9iv84/+GD8my28sx8T8LdU6FeDl2AxnOs5b1JXjYT9SUuf7L6w+M04Ac
 1uSBiT7+OiKguy8pI4CV2pWno4Sulfdon5RWkLUB05aQdO+Skl1BIdV/562tJU7ugAM4
 uDcu7wMANgI6X/PWbtG3EGQ42SGk92jo88rIDKy9/vKB54pJ4yF0SJ4uLp4X7tB1k0Ub
 zvdXsCY+ZhcPVyo0tqP9en0SJr4A/NadZo8UbExG4UZXm3ecm3yBxjTA7rCL9LQ5qm2L
 /dJkjP3onchfcyhfRBopmHNnEPNpcqebF5BmNxySGBp1GhtZ0XZxNRZFUWUURC3woMK9
 WUEg==
X-Gm-Message-State: AOAM531hfO0aFFhQNoq43Y9NLqwkbDLFfXHyDDJMhyVmUyg1Xf3Jv01I
 +grsDE37iAoJkQUzLX6kzA==
X-Google-Smtp-Source: ABdhPJxbVBZx9Mhv6ck1Loj48EH72/hoWr/0eCy25FEC3zL8+XfOfxlxH17fOBKcLvccgg+/2FSO1g==
X-Received: by 2002:a9d:6450:: with SMTP id m16mr23406700otl.344.1608054604452; 
 Tue, 15 Dec 2020 09:50:04 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 73sm572541otv.26.2020.12.15.09.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 09:50:03 -0800 (PST)
Received: (nullmailer pid 4102332 invoked by uid 1000);
 Tue, 15 Dec 2020 17:50:02 -0000
Date: Tue, 15 Dec 2020 11:50:02 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20201215175002.GA4074883@robh.at.kernel.org>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
 <20201214091616.13545-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214091616.13545-8-Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Lars Persson <larper@axis.com>, linux-stm32@st-md-mailman.stormreply.com,
 Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH 07/25] dt-bindings: net: dwmac: Detach
 Generic DW MAC bindings
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

On Mon, Dec 14, 2020 at 12:15:57PM +0300, Serge Semin wrote:
> Currently the snps,dwmac.yaml DT bindings file is used for both DT nodes
> describing generic DW MAC devices and as DT schema with common properties
> to be evaluated against a vendor-specific DW MAC IP-cores. Due to such
> dual-purpose design the "compatible" property of the common DW MAC schema
> needs to contain the vendor-specific strings to successfully pass the
> schema evaluation in case if it's referenced from the vendor-specific DT
> bindings. That's a bad design from maintainability point of view, since
> adding/removing any DW MAC-based device bindings requires the common
> schema modification. In order to fix that let's detach the schema which
> provides the generic DW MAC DT nodes evaluation into a dedicated DT
> bindings file preserving the common DW MAC properties declaration in the
> snps,dwmac.yaml file. By doing so we'll still provide a common properties
> evaluation for each vendor-specific MAC bindings which refer to the
> common bindings file, while the generic DW MAC DT nodes will be checked
> against the new snps,dwmac-generic.yaml DT schema.

I'm okay with the change, but it needs a big fat note that 
snps,dwmac-generic.yaml should not have new users. New users should have 
an SoC specific compatible. History has shown that even IP versions are 
not enough to handle all the integration crap vendors do.

> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  .../bindings/net/snps,dwmac-generic.yaml      | 148 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 139 +---------------
>  2 files changed, 149 insertions(+), 138 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml b/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> new file mode 100644
> index 000000000000..f1b387911390
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac-generic.yaml
> @@ -0,0 +1,148 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/snps,dwmac-generic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare Generic MAC Device Tree Bindings
> +
> +maintainers:
> +  - Alexandre Torgue <alexandre.torgue@st.com>
> +  - Giuseppe Cavallaro <peppe.cavallaro@st.com>
> +  - Jose Abreu <joabreu@synopsys.com>
> +
> +# Select the DT nodes, which have got compatible strings either as just a
> +# single string with IP-core name optionally followed by the IP version or
> +# two strings: one with IP-core name plus the IP version, another as just
> +# the IP-core name.
> +select:
> +  properties:
> +    compatible:
> +      oneOf:
> +        - items:
> +            - pattern: "^snps,dw(xg)+mac(-[0-9]+\\.[0-9]+a?)?$"
> +        - items:
> +            - pattern: "^snps,dwmac-[0-9]+\\.[0-9]+a?$"
> +            - const: snps,dwmac
> +        - items:
> +            - pattern: "^snps,dwxgmac-[0-9]+\\.[0-9]+a?$"
> +            - const: snps,dwxgmac
> +
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Generic Synopsys DW MAC
> +        oneOf:
> +          - items:
> +              - enum:
> +                  - snps,dwmac-3.50a
> +                  - snps,dwmac-3.610
> +                  - snps,dwmac-3.70a
> +                  - snps,dwmac-3.710
> +                  - snps,dwmac-4.00
> +                  - snps,dwmac-4.10a
> +                  - snps,dwmac-4.20a
> +              - const: snps,dwmac
> +          - const: snps,dwmac
> +      - description: Generic Synopsys DW xGMAC
> +        oneOf:
> +          - items:
> +              - enum:
> +                  - snps,dwxgmac-2.10
> +              - const: snps,dwxgmac
> +          - const: snps,dwxgmac
> +      - description: ST SPEAr SoC Family GMAC
> +        deprecated: true
> +        const: st,spear600-gmac
> +
> +  reg:
> +    maxItems: 1
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    gmac0: ethernet@e0800000 {
> +      compatible = "snps,dwxgmac-2.10", "snps,dwxgmac";
> +      reg = <0xe0800000 0x8000>;
> +      interrupt-parent = <&vic1>;
> +      interrupts = <24 23 22>;
> +      interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
> +      mac-address = [000000000000]; /* Filled in by U-Boot */
> +      max-frame-size = <3800>;
> +      phy-mode = "gmii";
> +      snps,multicast-filter-bins = <256>;
> +      snps,perfect-filter-entries = <128>;
> +      rx-fifo-depth = <16384>;
> +      tx-fifo-depth = <16384>;
> +      clocks = <&clock>;
> +      clock-names = "stmmaceth";
> +      snps,axi-config = <&stmmac_axi_setup>;
> +      snps,mtl-rx-config = <&mtl_rx_setup>;
> +      snps,mtl-tx-config = <&mtl_tx_setup>;
> +      mdio0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "snps,dwmac-mdio";
> +        phy1: ethernet-phy@0 {
> +          reg = <0>;
> +        };
> +      };
> +    };
> +  - |
> +    gmac1: ethernet@f8010000 {
> +      compatible = "snps,dwmac-4.10a", "snps,dwmac";
> +      reg = <0xf8010000 0x4000>;
> +      interrupts = <0 98 4>;
> +      interrupt-names = "macirq";
> +      clock-names = "stmmaceth", "ptp_ref";
> +      clocks = <&clock 4>, <&clock 5>;
> +      phy-mode = "rgmii";
> +      snps,txpbl = <8>;
> +      snps,rxpbl = <2>;
> +      snps,aal;
> +      snps,tso;
> +
> +      snps,axi-config {
> +        snps,wr_osr_lmt = <0xf>;
> +        snps,rd_osr_lmt = <0xf>;
> +        snps,blen = <256 128 64 32 0 0 0>;
> +      };
> +
> +      snps,mtl-rx-config {
> +        snps,rx-queues-to-use = <1>;
> +        snps,rx-sched-sp;
> +        queue0 {
> +          snps,dcb-algorithm;
> +          snps,map-to-dma-channel = <0x0>;
> +          snps,priority = <0x0>;
> +        };
> +      };
> +
> +      snps,mtl-tx-config {
> +        snps,tx-queues-to-use = <2>;
> +        snps,tx-sched-wrr;
> +
> +        queue0 {
> +          snps,weight = <0x10>;
> +          snps,dcb-algorithm;
> +          snps,priority = <0x0>;
> +        };
> +
> +        queue1 {
> +          snps,avb-algorithm;
> +          snps,send_slope = <0x1000>;
> +          snps,idle_slope = <0x1000>;
> +          snps,high_credit = <0x3E800>;
> +          snps,low_credit = <0x1FC18000>;
> +          snps,priority = <0x1>;
> +        };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 74820f491346..72b58f86bc41 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -11,31 +11,7 @@ maintainers:
>    - Giuseppe Cavallaro <peppe.cavallaro@st.com>
>    - Jose Abreu <joabreu@synopsys.com>
>  
> -# Select every compatible, including the deprecated ones. This way, we
> -# will be able to report a warning when we have that compatible, since
> -# we will validate the node thanks to the select, but won't report it
> -# as a valid value in the compatible property description
> -select:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - snps,dwmac
> -          - snps,dwmac-3.50a
> -          - snps,dwmac-3.610
> -          - snps,dwmac-3.70a
> -          - snps,dwmac-3.710
> -          - snps,dwmac-4.00
> -          - snps,dwmac-4.10a
> -          - snps,dwmac-4.20a
> -          - snps,dwxgmac
> -          - snps,dwxgmac-2.10
> -
> -          # Deprecated
> -          - st,spear600-gmac
> -
> -  required:
> -    - compatible
> +select: false
>  
>  allOf:
>    - $ref: "ethernet-controller.yaml#"
> @@ -62,35 +38,6 @@ allOf:
>              MAC HW capability register.
>  
>  properties:
> -
> -  # We need to include all the compatibles from schemas that will
> -  # include that schemas, otherwise compatible won't validate for
> -  # those.
> -  compatible:
> -    contains:
> -      enum:
> -        - allwinner,sun7i-a20-gmac
> -        - allwinner,sun8i-a83t-emac
> -        - allwinner,sun8i-h3-emac
> -        - allwinner,sun8i-r40-emac
> -        - allwinner,sun8i-v3s-emac
> -        - allwinner,sun50i-a64-emac
> -        - amlogic,meson6-dwmac
> -        - amlogic,meson8b-dwmac
> -        - amlogic,meson8m2-dwmac
> -        - amlogic,meson-gxbb-dwmac
> -        - amlogic,meson-axg-dwmac
> -        - snps,dwmac
> -        - snps,dwmac-3.50a
> -        - snps,dwmac-3.610
> -        - snps,dwmac-3.70a
> -        - snps,dwmac-3.710
> -        - snps,dwmac-4.00
> -        - snps,dwmac-4.10a
> -        - snps,dwmac-4.20a
> -        - snps,dwxgmac
> -        - snps,dwxgmac-2.10
> -
>    reg:
>      minItems: 1
>      maxItems: 2
> @@ -543,88 +490,4 @@ dependencies:
>    snps,reset-delay-us: ["snps,reset-gpio"]
>  
>  additionalProperties: true
> -
> -examples:
> -  - |
> -    gmac0: ethernet@e0800000 {
> -        compatible = "snps,dwxgmac-2.10", "snps,dwxgmac";
> -        reg = <0xe0800000 0x8000>;
> -        interrupt-parent = <&vic1>;
> -        interrupts = <24 23 22>;
> -        interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
> -        mac-address = [000000000000]; /* Filled in by U-Boot */
> -        max-frame-size = <3800>;
> -        phy-mode = "gmii";
> -        snps,multicast-filter-bins = <256>;
> -        snps,perfect-filter-entries = <128>;
> -        rx-fifo-depth = <16384>;
> -        tx-fifo-depth = <16384>;
> -        clocks = <&clock>;
> -        clock-names = "stmmaceth";
> -        snps,axi-config = <&stmmac_axi_setup>;
> -        snps,mtl-rx-config = <&mtl_rx_setup>;
> -        snps,mtl-tx-config = <&mtl_tx_setup>;
> -        mdio0 {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -            compatible = "snps,dwmac-mdio";
> -            phy1: ethernet-phy@0 {
> -                reg = <0>;
> -            };
> -        };
> -    };
> -  - |
> -    gmac1: ethernet@f8010000 {
> -        compatible = "snps,dwmac-4.10a", "snps,dwmac";
> -        reg = <0xf8010000 0x4000>;
> -        interrupts = <0 98 4>;
> -        interrupt-names = "macirq";
> -        clock-names = "stmmaceth", "ptp_ref";
> -        clocks = <&clock 4>, <&clock 5>;
> -        phy-mode = "rgmii";
> -        snps,txpbl = <8>;
> -        snps,rxpbl = <2>;
> -        snps,aal;
> -        snps,tso;
> -
> -        snps,axi-config {
> -            snps,wr_osr_lmt = <0xf>;
> -            snps,rd_osr_lmt = <0xf>;
> -            snps,blen = <256 128 64 32 0 0 0>;
> -        };
> -
> -        snps,mtl-rx-config {
> -            snps,rx-queues-to-use = <1>;
> -            snps,rx-sched-sp;
> -            queue0 {
> -               snps,dcb-algorithm;
> -               snps,map-to-dma-channel = <0x0>;
> -               snps,priority = <0x0>;
> -            };
> -        };
> -
> -        snps,mtl-tx-config {
> -            snps,tx-queues-to-use = <2>;
> -            snps,tx-sched-wrr;
> -            queue0 {
> -                snps,weight = <0x10>;
> -                snps,dcb-algorithm;
> -                snps,priority = <0x0>;
> -            };
> -
> -            queue1 {
> -                snps,avb-algorithm;
> -                snps,send_slope = <0x1000>;
> -                snps,idle_slope = <0x1000>;
> -                snps,high_credit = <0x3E800>;
> -                snps,low_credit = <0xFFC18000>;
> -                snps,priority = <0x1>;
> -            };
> -        };
> -    };
> -
> -# FIXME: We should set it, but it would report all the generic
> -# properties as additional properties.
> -# additionalProperties: false
> -
>  ...
> -- 
> 2.29.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
