Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4461D78B171
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 15:16:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02731C6A617;
	Mon, 28 Aug 2023 13:16:40 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66D21C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 13:16:38 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2bcd7a207f7so47076301fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693228597; x=1693833397;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XFmS+lobOszZw6W/QjUfDnJ5/Wvc31my2B1+5jBa7/A=;
 b=OQDAjV8mL2PUcye54nJcr6yKcKc1uYXBEejW9G0o+zfSHAPiUae7LS2RRT+CdJav1d
 j8gXyy7HXBObI85M8fhu1vAyA086jT9dhzVbit+NxLf4dCvQXPbW+Wl8qFRUt13Iquka
 GLvsON1Oc3cdnxwHgpbYt0cweaWvqknrNFy/CQnp5RcalL0G+xeUzARgt5H4pWJ0sBfF
 8vpzXWXvpAkLSgOx28M2huZunrNYiRx+mnxzxEyaJbVdlP+aUscSjhVGZfs9lmwFl0B8
 0+NjXU5YXcuaIrUgPD4s+YKG060zx1NOgmPkMxO8C+oSag77EIejkjB5KsHjdQzw0+Pe
 46Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693228597; x=1693833397;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFmS+lobOszZw6W/QjUfDnJ5/Wvc31my2B1+5jBa7/A=;
 b=Zhv/FjC2Fq2jxt0tLkWy++E58wMnxK+Gh+udMh3SrYuXsnQi3KLE6o8mlXFaLz+HnB
 kZh9A0EQikUhq16PZFW7Kpi+2Td1MQOASEkRgxX5593i7ou1k2QujEsPwKMHPDu4AGoy
 xHry3Re1Z3ysf65NNnB8Ixi6VUj9MI5fMa1t+CHCYA7RLZh3HZETdJCYdTiyFHMjo9/3
 UvXQS1wgtLDUi2GzXIGcBQCzB0sJFwQNCZo9zXzFQWr/pRePKXLmSJU/pPNZnJSnMg77
 1n1stg+wBUi/KArRRzEtIum7D/VMmUiDygXFXQat8bVfOxrNdNzz7AHX5RzX2Pv865Ls
 siAA==
X-Gm-Message-State: AOJu0YzZlnu4iooi801wjQUL/n7rms4USFdU7iugpjmnQjRfHsUia8/S
 XnYSOdg0ukdUhOtlRPjCOnY=
X-Google-Smtp-Source: AGHT+IGSl1gon6Mw15MQYmfOY6/9wlPue4ynOnk1kyxKFHnkqnQl6GNsj4QdZfkhjBmEOXhmF7zt6A==
X-Received: by 2002:a2e:a201:0:b0:2b5:9d78:213e with SMTP id
 h1-20020a2ea201000000b002b59d78213emr18323279ljm.22.1693228597433; 
 Mon, 28 Aug 2023 06:16:37 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a2e7011000000b002b9f1214394sm1754206ljc.13.2023.08.28.06.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 06:16:36 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:16:34 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <koiz2vlo3juah7kgvefjiyvxkh7k6tu3an3v7uewpmtdurkico@sazvvhpwvzg6>
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
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD DWMAC Ethernet controller
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
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - thead,th1520-dwmac
> +      - const: snps,dwmac-3.70a
> +
> +  reg:
> +    maxItems: 1
> +

> +  thead,gmacapb:

BTW what is a point in having the "apb" prefix in the name?
The property name like "thead,gmac-syscon" looks much more suitable
since it refers to the actual property content.

-Serge(y)

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
