Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A68709AE50E
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F945C78F77;
	Thu, 24 Oct 2024 12:39:13 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB867C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 00:31:47 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-71e953f4e7cso4236449b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 17:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729643506; x=1730248306;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TqoKRoP0trGpynhgqzBKYCwSQUSG9Om+dv3i8c0Nq6Q=;
 b=LWzdc6w/SeQ6LV/wpjMGG6HWKnS8hKoZfbvedwmZ6CbOoEJJRbELLqC3Hgecwq50Sb
 bRbz5q91W0dZCexzROg7v0DAkoec8O6xOQ5pfL3KB+TNJPc6yTvbTFu90yAAVspmP9wi
 92QQk4dk1JCsYifu3KIFfjcpQpLxgUcN3C102t57PVKuyRAMRfqH0tnUpR6FteE1wUWu
 OMGj7OxMiojpw1UETUliq7rpAJxl50WrHJQsfM2+WqxNgQx7He0ut3+rdjUYJYYD48fR
 VJKPLB0hM2d1at14PEMnL3wGT3eCFRSefT9ahIJkT4m3qCLnIUa1HgIYTM0uBktTKqw1
 /G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729643506; x=1730248306;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TqoKRoP0trGpynhgqzBKYCwSQUSG9Om+dv3i8c0Nq6Q=;
 b=WwlkyaKWzcSjZegNbVu4w2b7LbBJWY0D3l40ZAFP7/uWR3Jc+xL31hp43w79/n1HtH
 MA1H2rTx91dePHHI3ugHEEygVx9b9cHU3ipIkveQf6cUtvXtgGVEt5oMPmq5xXV1OIEk
 nBD/YFJItc2au/tSQc4SIRh7Z8UJ8r6j4XThONxEIYLeA3NUtDajuwltgdaBNy9tZx9E
 xJs7D7HR0JOrHvg+GHXGkZY5ZR1g74dw8BIyzW9NP6b/RQt7MKO2QT7lObs/EU3W+qMt
 yHdfpe3/koLQ8Skf3h3dWxz9fiKsxOVaXRWL5CiHJBsqZgcuWwivyUhkJJcEZIqwB4VC
 TOkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGxV265eaHCYGypX/Q1vmQSt7YPOdO3JV8KGQoSKXQ2GuSZNAzh/gFxVOEGZ0LWhgz4Jnbo1muEzZULQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxDE79WZKxOtB4Dq6iEGWBNq0N+3vOFuAq6b86ZigtmpzmdB50t
 HwhBSV1Gzdc96/BJSqX0Ums+PioqPwOpmdGGqn5BOZCZz4pD5CMH
X-Google-Smtp-Source: AGHT+IE/EmIUFDrkEnasULUT9TnLW0DMraLwPlJfZhNd8+1qE1ieaafFg/FIQckU5WrODA3aincEjg==
X-Received: by 2002:a05:6a00:9297:b0:71e:98a:b6b4 with SMTP id
 d2e1a72fcca58-72030babd9fmr1189730b3a.11.1729643504597; 
 Tue, 22 Oct 2024 17:31:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7eaeabda3b2sm5606574a12.83.2024.10.22.17.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 17:31:44 -0700 (PDT)
Date: Wed, 23 Oct 2024 08:31:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <20241022-crisply-brute-45f98632ef78@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022-crisply-brute-45f98632ef78@spud>
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:39:11 +0000
Cc: Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Chen Wang <unicorn_wang@outlook.com>, Jose Abreu <joabreu@synopsys.com>,
 Inochi Amaoto <inochiama@outlook.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 2/4] dt-bindings: net: Add support for
	Sophgo SG2044 dwmac
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

On Tue, Oct 22, 2024 at 06:28:06PM +0100, Conor Dooley wrote:
> On Mon, Oct 21, 2024 at 06:36:15PM +0800, Inochi Amaoto wrote:
> > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > with some extra clock.
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
> >  2 files changed, 146 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 3c4007cb65f8..69f6bb36970b 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -99,6 +99,7 @@ properties:
> >          - snps,dwmac-5.30a
> >          - snps,dwxgmac
> >          - snps,dwxgmac-2.10
> > +        - sophgo,sg2044-dwmac
> >          - starfive,jh7100-dwmac
> >          - starfive,jh7110-dwmac
> >  
> > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > new file mode 100644
> > index 000000000000..93c41550b0b6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > @@ -0,0 +1,145 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH7110 DWMAC glue layer
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - sophgo,sg2044-dwmac
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: sophgo,sg2044-dwmac
> > +      - const: snps,dwmac-5.30a
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: GMAC main clock
> > +      - description: PTP clock
> > +      - description: TX clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: stmmaceth
> > +      - const: ptp_ref
> > +      - const: tx
> > +
> > +  sophgo,syscon:
> 
> How many dwmac instances does the sg2044 have?
> 

Only one, there is another 100G dwxgmac instance, but it does not
use this syscon.

> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to syscon that configures phy
> > +          - description: offset of phy mode register
> > +          - description: length of the phy mode register
> > +    description:
> > +      A phandle to syscon with two arguments that configure phy mode.
> > +      The argument one is the offset of phy mode register, the
> > +      argument two is the length of phy mode register.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - resets
> > +  - reset-names
> > +
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: sophgo,sg2044-dwmac
> 
> Why does this have to be applied conditionally? There's only one
> compatible in the binding, can't you apply these unconditionally?
> 
> 
> Cheers,
> Conor.
> 

I think it can apply it unconditionally. I will fix it.

Regards,
Inochi

> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 1
> > +          maxItems: 1
> > +
> > +        interrupt-names:
> > +          minItems: 1
> > +          maxItems: 1
> > +
> > +        resets:
> > +          maxItems: 1
> > +
> > +        reset-names:
> > +          const: stmmaceth
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    ethernet@30006000 {
> > +      compatible = "sophgo,sg2044-dwmac", "snps,dwmac-5.30a";
> > +      reg = <0x30006000 0x4000>;
> > +      clocks = <&clk 151>, <&clk 152>, <&clk 154>;
> > +      clock-names = "stmmaceth", "ptp_ref", "tx";
> > +      interrupt-parent = <&intc>;
> > +      interrupts = <296 IRQ_TYPE_LEVEL_HIGH>;
> > +      interrupt-names = "macirq";
> > +      resets = <&rst 30>;
> > +      reset-names = "stmmaceth";
> > +      snps,multicast-filter-bins = <0>;
> > +      snps,perfect-filter-entries = <1>;
> > +      snps,aal;
> > +      snps,tso;
> > +      snps,txpbl = <32>;
> > +      snps,rxpbl = <32>;
> > +      snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
> > +      snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
> > +      snps,axi-config = <&gmac0_stmmac_axi_setup>;
> > +      status = "disabled";
> > +
> > +      gmac0_mtl_rx_setup: rx-queues-config {
> > +        snps,rx-queues-to-use = <8>;
> > +        snps,rx-sched-wsp;
> > +        queue0 {};
> > +        queue1 {};
> > +        queue2 {};
> > +        queue3 {};
> > +        queue4 {};
> > +        queue5 {};
> > +        queue6 {};
> > +        queue7 {};
> > +      };
> > +
> > +      gmac0_mtl_tx_setup: tx-queues-config {
> > +        snps,tx-queues-to-use = <8>;
> > +        queue0 {};
> > +        queue1 {};
> > +        queue2 {};
> > +        queue3 {};
> > +        queue4 {};
> > +        queue5 {};
> > +        queue6 {};
> > +        queue7 {};
> > +      };
> > +
> > +      gmac0_stmmac_axi_setup: stmmac-axi-config {
> > +        snps,blen = <16 8 4 0 0 0 0>;
> > +        snps,wr_osr_lmt = <1>;
> > +        snps,rd_osr_lmt = <2>;
> > +      };
> > +    };
> > -- 
> > 2.47.0
> > 


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
