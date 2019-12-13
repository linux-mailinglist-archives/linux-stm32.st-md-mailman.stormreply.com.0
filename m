Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E84E311ED00
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2019 22:39:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C9B2C36B0B;
	Fri, 13 Dec 2019 21:39:21 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 956CDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 21:39:19 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i1so1953476oie.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 13:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SCYACv29dkJEimAeryd7NAUvfts7axPZD4KOPwPhHhU=;
 b=ouJng0iqQhHLLx2dx0Rw2KyCgzrk1ZFDziHhtay6oEuM5G76YPIA885dQTxZqzGdvN
 zs4INrCyfpW4xCNhoktm8FnkRVw8tkJtGQZDKeoK0pcHjJ3twkQKRK77Gcaak/AwMy/v
 8aOZDMcrpk1qHhhzqS02ImVwyBxdJhD59UczFndE39kWJiuFb8mnMCE/2Wn+5RMJKc7y
 FgQlr6KXyLo0sTMpKszNW/RX7DVDSgHK7AxiTJq5iM8oUChNZLtLjkAiXi+sNbykx+rl
 V20vLiB44x9jzt5A9/Raluw87Pn88shzFf/Vuws8UptKnhqle9LCoOLjzSzHZ6F7Mkh+
 wJLA==
X-Gm-Message-State: APjAAAV9zstuWcQ/q7N6zEpZlYHVLObqhkKwo5pZzXJpZYya8lCgoKXx
 P0/8UyenHf/na4IRK6W5jg==
X-Google-Smtp-Source: APXvYqx8lp9CVw+D5kPH+eRXIzKkrTm4GjWilZZXwORT3uNCoTfc2EDpKa5QD1/v0PHo3VOao+xSTg==
X-Received: by 2002:aca:d706:: with SMTP id o6mr8416194oig.19.1576273158143;
 Fri, 13 Dec 2019 13:39:18 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b3sm3687774oie.25.2019.12.13.13.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 13:39:17 -0800 (PST)
Date: Fri, 13 Dec 2019 15:39:16 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20191213213916.GA1292@bogus>
References: <20191128154603.6911-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128154603.6911-1-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: stm32: convert mlahb to
	json-schema
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

On Thu, Nov 28, 2019 at 04:46:03PM +0100, Arnaud Pouliquen wrote:
> Convert the ML-AHB bus bindings to DT schema format using json-schema
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
> Notice that this patch requests an update of the simple-bus schema to add
> the support of the "dma-ranges" property.
> A Pull request has been sent in parallel to the dt-schema github repo:
> https://github.com/devicetree-org/dt-schema/pull/30
> 
> To remind the topic around the use of "dma-ranges" please
> refer to following discussion: https://lkml.org/lkml/2019/4/3/1261
> ---
>  .../devicetree/bindings/arm/stm32/mlahb.txt   | 37 ----------
>  .../bindings/arm/stm32/st,mlahb.yaml          | 69 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> deleted file mode 100644
> index 25307aa1eb9b..000000000000
> --- a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -ML-AHB interconnect bindings
> -
> -These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
> -a Cortex-M subsystem with dedicated memories.
> -The MCU SRAM and RETRAM memory parts can be accessed through different addresses
> -(see "RAM aliases" in [1]) using different buses (see [2]) : balancing the
> -Cortex-M firmware accesses among those ports allows to tune the system
> -performance.
> -
> -[1]: https://www.st.com/resource/en/reference_manual/dm00327659.pdf
> -[2]: https://wiki.st.com/stm32mpu/wiki/STM32MP15_RAM_mapping
> -
> -Required properties:
> -- compatible: should be "simple-bus"
> -- dma-ranges: describes memory addresses translation between the local CPU and
> -	   the remote Cortex-M processor. Each memory region, is declared with
> -	   3 parameters:
> -		 - param 1: device base address (Cortex-M processor address)
> -		 - param 2: physical base address (local CPU address)
> -		 - param 3: size of the memory region.
> -
> -The Cortex-M remote processor accessed via the mlahb interconnect is described
> -by a child node.
> -
> -Example:
> -mlahb {
> -	compatible = "simple-bus";
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	dma-ranges = <0x00000000 0x38000000 0x10000>,
> -		     <0x10000000 0x10000000 0x60000>,
> -		     <0x30000000 0x30000000 0x60000>;
> -
> -	m4_rproc: m4@10000000 {
> -		...
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
> new file mode 100644
> index 000000000000..8ad3f7c7f9ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/stm32/st,mlahb.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: STMicroelectronics STM32 ML-AHB interconnect bindings
> +
> +maintainers:
> +  - Fabien Dessenne <fabien.dessenne@st.com>
> +  - Arnaud Pouliquen <arnaud.pouliquen@st.com>
> +
> +description: |
> +  These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
> +  a Cortex-M subsystem with dedicated memories. The MCU SRAM and RETRAM memory
> +  parts can be accessed through different addresses (see "RAM aliases" in [1])
> +  using different buses (see [2]): balancing the Cortex-M firmware accesses
> +  among those ports allows to tune the system performance.
> +  [1]: https://www.st.com/resource/en/reference_manual/dm00327659.pdf
> +  [2]: https://wiki.st.com/stm32mpu/wiki/STM32MP15_RAM_mapping
> +
> +allOf:
> + - $ref: /schemas/simple-bus.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      enum:
> +        - st,mlahb
> +
> +  dma-ranges:
> +    description: |
> +      Describe memory addresses translation between the local CPU and the
> +      remote Cortex-M processor. Each memory region, is declared with
> +      3 parameters:
> +      - param 1: device base address (Cortex-M processor address)
> +      - param 2: physical base address (local CPU address)
> +      - param 3: size of the memory region.
> +    maxItems: 3
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - dma-ranges
> +
> +examples:
> +  - |
> +    mlahb: ahb {
> +      compatible = "st,mlahb", "simple-bus";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      reg = <0x10000000 0x40000>;
> +      dma-ranges = <0x00000000 0x38000000 0x10000>,
> +                   <0x10000000 0x10000000 0x60000>,
> +                   <0x30000000 0x30000000 0x60000>;
> +

Fails to build:

builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/stm32/st,mlahb.example.dt.yaml: 
ahb: 'ranges' is a required property

Run 'make dt_binding_check'

> +      m4_rproc: m4@10000000 {
> +       reg = <0x10000000 0x40000>;
> +      };
> +    };
> +
> +...
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
