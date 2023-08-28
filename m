Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C459778B4D1
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 17:51:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 520F5C6A61D;
	Mon, 28 Aug 2023 15:51:56 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89CB4C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 15:51:54 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2bcd7a207f7so49779371fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 08:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693237913; x=1693842713;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B0Xz3WZebS/wvt47ASnAX+cx3LpJDfQJgrj01eUj9Aw=;
 b=LoUmZsrBrhdLXul+MyKhiug6e+IU93kUVAYIV6wYrBXK55lDznI3Ard62QcL9bxgov
 Pp5EXI6ZXGUanY7sxJwdIfAnATolNLTpS2gvE7XgKzI+jFWwWwymjdOIrVT1a2hkra8X
 0lR51CLfxgVmEIordgak1XqkdGfl45oB+jmv7PmQgIZKqar847Ff+tjMmsF9cV/9BOsE
 NtsIHrC/ao+kmIIqTrd4OiNjHcSX79ldD89yERA2UMkNUhNoNtHs8HdRnjSS4stNu98t
 Lb2DVfoC7ZLJwdIkqVcEul9XdZLo2nXl+LzSgr9BV+i3cRMaQZtLidOWZ3hSFsaHTwDV
 +ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693237913; x=1693842713;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B0Xz3WZebS/wvt47ASnAX+cx3LpJDfQJgrj01eUj9Aw=;
 b=JLA1KFbwLag3/UDk416St9ZzmzA8IrbQxfS2YqsJGdbfmdVaOcUXG5pSNwoPog4ej3
 ex14cLg7jvT0ymQvl1d1n9pGdYVA0Dk3RgQhElMx7fLQo8LeKntmBdB8hIKGAkU60jYh
 fFzcG2H/4lRx1eTAEM3FLkOk4MiUJZRPIZv6FkYzAxazQ1jZNBhe9ooLS/PtXsad7mph
 D04i5czRXg8/m3WqcpkQ7PEFKKSdc5phUizQbPRLvsVTt7O0OxtPcrK3fwGU2Q9MlHUF
 bl2cnRA/lWkH/7dxxEjJ7IOM+BoWZ/mejAYc4wjtE4VttezGzfPgSy3BHwoebEG0E8pw
 SRVg==
X-Gm-Message-State: AOJu0YxErjWdBFA4A42L3jEBAAb7+7ukB4LxId9v7mHzlk6fse/uGdie
 4aHv9iMmZ9zjAexwS44rCLg=
X-Google-Smtp-Source: AGHT+IGESVAn33u8cHgk2LFaFrWwav4zBU3fETTCbT3G6GJWd4vMRsBEFMW0OZS2hECrKF9bJ7YR0Q==
X-Received: by 2002:ac2:504c:0:b0:500:aa41:9d69 with SMTP id
 a12-20020ac2504c000000b00500aa419d69mr6179093lfm.66.1693237913366; 
 Mon, 28 Aug 2023 08:51:53 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 a6-20020ac25206000000b004fb74dbbd98sm1639159lfl.246.2023.08.28.08.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 08:51:52 -0700 (PDT)
Date: Mon, 28 Aug 2023 18:51:49 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <pbh7gh7fkfis7zqqmmug5wtosq3xsx7z3ktsfg3jy6jthm6qva@a3wy7knv2vcr>
References: <20230827091710.1483-1-jszhang@kernel.org>
 <20230827091710.1483-3-jszhang@kernel.org>
 <qc2nyqmuouig6qww2q7orlwzvcprjyruyeuyr5dqdpxysajjpv@6fzsgjgokry7>
 <ZOy6kLGZ1lR0I2sC@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOy6kLGZ1lR0I2sC@xhacker>
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

On Mon, Aug 28, 2023 at 11:17:36PM +0800, Jisheng Zhang wrote:
> On Mon, Aug 28, 2023 at 04:13:00PM +0300, Serge Semin wrote:
> > On Sun, Aug 27, 2023 at 05:17:09PM +0800, Jisheng Zhang wrote:
> > > Add documentation to describe T-HEAD dwmac.
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
> > >  .../devicetree/bindings/net/thead,dwmac.yaml  | 77 +++++++++++++++++++
> > >  2 files changed, 78 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > index b196c5de2061..73821f86a609 100644
> > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > @@ -96,6 +96,7 @@ properties:
> > >          - snps,dwxgmac
> > >          - snps,dwxgmac-2.10
> > >          - starfive,jh7110-dwmac
> > > +        - thead,th1520-dwmac
> > >  
> > >    reg:
> > >      minItems: 1
> > > diff --git a/Documentation/devicetree/bindings/net/thead,dwmac.yaml b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
> > > new file mode 100644
> > > index 000000000000..bf8ec8ca2753
> > > --- /dev/null
> > 
> > > +++ b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
> > 
> > see further regarding using dwmac in the names here.
> > 
> > > @@ -0,0 +1,77 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > 
> > > +title: T-HEAD DWMAC Ethernet controller
> > 
> > Additionally would be nice to have a brief controller "description:"
> > having the next info: the SoCs the controllers can be found on, the DW
> > (G)MAC IP-core version the ethernet controller is based on and some
> > data about the synthesize parameters: SMA (MDIO-bus), Tx/Rx COE, DMA
> > FIFOs size, perfect and hash MAC-filters size, L3L4 frame filters
> > availability, VLAN hash filter, SA/VLAN-tag insertion, ARP offload
> > engine, PHY interfaces (MII, RMII, RGMII, etc), EEE support, IEEE
> > 1588(-2008) Timestamping support, PMT and Wake-up frame support, MAC
> > Management counters (MMC). In addition to that for DW QoS
> > ETH/XGMAC/XLGMAC the next info would be useful: number of MTL Queues
> > and DMA channels, MTL queues capabilities (QoS-related), TSO
> > availability, SPO availability.
> > 

> > Note DMA FIFO sizes can be also constrained in the properties
> > "rx-fifo-depth" and "tx-fifo-depth"; perfect and hash MAC-filter sizes -
> > in "snps,perfect-filter-entries" and "snps,multicast-filter-bins".

BTW plus to this you may wish to add the "rx-internal-delay-ps" and
"tx-internal-delay-ps" properties constraints seeing they device
supports internal Tx/Rx delays.

> 
> Hi Serge,
> 

> Thank you for your code review. I have different views here: If we
> only support the gmac controller in one specific SoC, these detailed
> information is nice to have, but what about if the driver/dt-binding
> supports the gmac controller in different SoCs? These detailed
> information will be outdated.

First they won't. Second then you can either add more info to the
description for instance in a separate paragraph or create a dedicated
DT-bindings. Such information would be very much useful for the
generic STMMAC driver code maintenance.

> 
> what's more, I think the purpose of dt-binding is different from
> the one of documentation.

The purpose of the DT-bindings is a hardware "description". The info I
listed describes your hardware.

> 
> So I prefer to put these GMAC IP related detailed information into
> the SoC's dtsi commit msg rather than polluting the dt-binding.
> > 
> > > +
> > > +maintainers:
> > > +  - Jisheng Zhang <jszhang@kernel.org>
> > > +
> > > +select:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        enum:
> > 
> > > +          - thead,th1520-dwmac
> > 
> > Referring to the DW IP-core in the compatible string isn't very
> > much useful especially seeing you have a generic fallback compatible.
> > Name like "thead,th1520-gmac" looks more informative indicating its
> > speed capability.
> 

> This is just to follow the common style as those dwmac-* does.
> I'm not sure which is better, but personally, I'd like to keep current
> common style.

It's not that common. Half the compatible strings use the notation
suggested by me and it has more sense then a dwmac suffix. It's ok to
use the suffix in the STMMAC driver-related things because the glue
code is supposed to work with the DW *MAC generic code. Using it in
the compatible string especially together with the generic fallback
compatible just useless.

-Serge(y)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
