Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F38778B46F
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 17:29:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04CC2C6A617;
	Mon, 28 Aug 2023 15:29:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 489E7C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 15:29:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05CEA61DEB;
 Mon, 28 Aug 2023 15:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279ABC433C8;
 Mon, 28 Aug 2023 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693236572;
 bh=dhT/NBwMHiuduDbdnzNZlW5Q3qXsPNbsQZIelzXVMWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BG530VfhxgnihhbytfskWoXrhTi2MQzMTmq/d57QU13tr3eamljeLiF0YoBH2zq5C
 aavWkg2o44ar0++FFqxCNWh5aR8e5YVvLSVK20N7XPlmTy8BgbIfy3hIzXIPpdRNlB
 GDUCvCu/oWcbxhPTk0YYt76vjBc1iVEzsmYkX3kofUqpeLxkGv1WIhmXhJiAmwtiv2
 2NRF17TC5rq85vyA9jAV+vdbxJz27qbwWMppsaG+UlPrGKtjeUVarjcBXxtjm0q2Gg
 RiUzuLN36ijcYdO5w4j1/mF0Mgc5yVZCAPptIt3nsf5a4gh40MZCt3eP/tMetteKTC
 TfG38aU1upUvA==
Date: Mon, 28 Aug 2023 23:17:36 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZOy6kLGZ1lR0I2sC@xhacker>
References: <20230827091710.1483-1-jszhang@kernel.org>
 <20230827091710.1483-3-jszhang@kernel.org>
 <qc2nyqmuouig6qww2q7orlwzvcprjyruyeuyr5dqdpxysajjpv@6fzsgjgokry7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <qc2nyqmuouig6qww2q7orlwzvcprjyruyeuyr5dqdpxysajjpv@6fzsgjgokry7>
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

On Mon, Aug 28, 2023 at 04:13:00PM +0300, Serge Semin wrote:
> On Sun, Aug 27, 2023 at 05:17:09PM +0800, Jisheng Zhang wrote:
> > Add documentation to describe T-HEAD dwmac.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
> >  .../devicetree/bindings/net/thead,dwmac.yaml  | 77 +++++++++++++++++++
> >  2 files changed, 78 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index b196c5de2061..73821f86a609 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -96,6 +96,7 @@ properties:
> >          - snps,dwxgmac
> >          - snps,dwxgmac-2.10
> >          - starfive,jh7110-dwmac
> > +        - thead,th1520-dwmac
> >  
> >    reg:
> >      minItems: 1
> > diff --git a/Documentation/devicetree/bindings/net/thead,dwmac.yaml b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
> > new file mode 100644
> > index 000000000000..bf8ec8ca2753
> > --- /dev/null
> 
> > +++ b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
> 
> see further regarding using dwmac in the names here.
> 
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> 
> > +title: T-HEAD DWMAC Ethernet controller
> 
> Additionally would be nice to have a brief controller "description:"
> having the next info: the SoCs the controllers can be found on, the DW
> (G)MAC IP-core version the ethernet controller is based on and some
> data about the synthesize parameters: SMA (MDIO-bus), Tx/Rx COE, DMA
> FIFOs size, perfect and hash MAC-filters size, L3L4 frame filters
> availability, VLAN hash filter, SA/VLAN-tag insertion, ARP offload
> engine, PHY interfaces (MII, RMII, RGMII, etc), EEE support, IEEE
> 1588(-2008) Timestamping support, PMT and Wake-up frame support, MAC
> Management counters (MMC). In addition to that for DW QoS
> ETH/XGMAC/XLGMAC the next info would be useful: number of MTL Queues
> and DMA channels, MTL queues capabilities (QoS-related), TSO
> availability, SPO availability.
> 
> Note DMA FIFO sizes can be also constrained in the properties
> "rx-fifo-depth" and "tx-fifo-depth"; perfect and hash MAC-filter sizes -
> in "snps,perfect-filter-entries" and "snps,multicast-filter-bins".

Hi Serge,

Thank you for your code review. I have different views here: If we
only support the gmac controller in one specific SoC, these detailed
information is nice to have, but what about if the driver/dt-binding
supports the gmac controller in different SoCs? These detailed
information will be outdated.

what's more, I think the purpose of dt-binding is different from
the one of documentation.

So I prefer to put these GMAC IP related detailed information into
the SoC's dtsi commit msg rather than polluting the dt-binding.
> 
> > +
> > +maintainers:
> > +  - Jisheng Zhang <jszhang@kernel.org>
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> 
> > +          - thead,th1520-dwmac
> 
> Referring to the DW IP-core in the compatible string isn't very
> much useful especially seeing you have a generic fallback compatible.
> Name like "thead,th1520-gmac" looks more informative indicating its
> speed capability.

This is just to follow the common style as those dwmac-* does.
I'm not sure which is better, but personally, I'd like to keep current
common style.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
