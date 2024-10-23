Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C399AE513
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A16FC78F80;
	Thu, 24 Oct 2024 12:39:13 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95C84C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 22:38:52 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-71e6d988ecfso240300b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 15:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729723131; x=1730327931;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rkwckHmFPJEkM3Wxs1jlPmTkTzgcJwcJLaHVmfmItpM=;
 b=h6vmIlV6k3VbclBN8XeVIC27h3f996F1FD808n7W3IWkw6y/jKUTDUcJwZPKfgMqsy
 JYNSsHiutjyKdtypS05FGOHpN1O+VvaZahHdw3yjVEH14q0dk2Yl/WHfDv6ufvTm0lBZ
 Fs42XjaJDJowx1l2DYVQFQf+MyFXbYWwOzNLcSRWUteIWBwuLyHIlpnKpl0/SdxznCCr
 /m4BdxPh5owrEklZUOvyfozxDOBSfVTz36Iq91Utsqq25z7GeF4nixTf9Zi7Mubh0f4H
 NN22ccHRMkT6GvSY8K3mjwz2I8UIFtXqRi/SRHDN2v6HahSQTsHhWFPni+M4vjFp4kza
 TC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729723131; x=1730327931;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rkwckHmFPJEkM3Wxs1jlPmTkTzgcJwcJLaHVmfmItpM=;
 b=lWzgMP0Z4dXQKZnnEq2O2C4/gRVCeCMS9nXHLBstBHuntS9t2mqU16k2M3J62hpVD7
 r8v3IQ1ZtPsw6+cd6dQNbAo/XjRA23xfhSkDtqCBb8qxlc4lEgtkoWFoa+mhP59ziDhw
 3Sr5tTdHcVugGoUCA+Y78Jdkz98RhumAn/B467tqe2cNjwe0YdNruEwBMcekY7e8Om8H
 cPP60LbuSlj/ZlU4EMGI+dwuyzkQUAbHsmLUwwinmeupNQMSV3leeJWlJLqP81UjDT/s
 /KnK8AdVPZmDHiLT7bKDbaF3IyYweaKtXNIG9KpeIQI5ZbPZxGIo6VCBwa+QOnQZxV6m
 NDXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtF+5M+JhG6W1KI7iJ5BtQUTZRvraLF4i2kdOJNyaGDWk2PCfAJ7esA+d5AgorHk43D+MValzMCjBk0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0fWa8AxX8YlgjeBPQG/VxLvsx2Ph3io6+rkukDJiyTrRTsc0x
 /p9y98Sp9RecL8ClROgmBjRXPIOeEzo6Z4IezMR6APZXnUZxHFNV
X-Google-Smtp-Source: AGHT+IGUv5GcBzM76Tis8BZFsna+Tt+yRb2ER6YRERF8hAd8oZIE6Ogk0CalUXCV034zvn8ODhWHxQ==
X-Received: by 2002:a05:6a00:806:b0:71e:693c:107c with SMTP id
 d2e1a72fcca58-72030a8b242mr6049959b3a.11.1729723130943; 
 Wed, 23 Oct 2024 15:38:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71ec1312c8fsm7047579b3a.14.2024.10.23.15.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 15:38:50 -0700 (PDT)
Date: Thu, 24 Oct 2024 06:38:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <5cv7wcdddxa4ruggrk36cwaquo5srcrjqqwefqzcju2s3yhl73@ekpyw6zrpfug>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <20241022-crisply-brute-45f98632ef78@spud>
 <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
 <20241023-paper-crease-befa8239f7f0@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241023-paper-crease-befa8239f7f0@spud>
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

On Wed, Oct 23, 2024 at 09:49:34PM +0100, Conor Dooley wrote:
> On Wed, Oct 23, 2024 at 08:31:24AM +0800, Inochi Amaoto wrote:
> > On Tue, Oct 22, 2024 at 06:28:06PM +0100, Conor Dooley wrote:
> > > On Mon, Oct 21, 2024 at 06:36:15PM +0800, Inochi Amaoto wrote:
> > > > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > > > with some extra clock.
> > > > 
> > > > Add necessary compatible string for this device.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> > > >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
> > > >  2 files changed, 146 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > index 3c4007cb65f8..69f6bb36970b 100644
> > > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > @@ -99,6 +99,7 @@ properties:
> > > >          - snps,dwmac-5.30a
> > > >          - snps,dwxgmac
> > > >          - snps,dwxgmac-2.10
> > > > +        - sophgo,sg2044-dwmac
> > > >          - starfive,jh7100-dwmac
> > > >          - starfive,jh7110-dwmac
> > > >  
> > > > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > new file mode 100644
> > > > index 000000000000..93c41550b0b6
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > @@ -0,0 +1,145 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: StarFive JH7110 DWMAC glue layer
> > > > +
> > > > +maintainers:
> > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > +
> > > > +select:
> > > > +  properties:
> > > > +    compatible:
> > > > +      contains:
> > > > +        enum:
> > > > +          - sophgo,sg2044-dwmac
> > > > +  required:
> > > > +    - compatible
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: sophgo,sg2044-dwmac
> > > > +      - const: snps,dwmac-5.30a
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: GMAC main clock
> > > > +      - description: PTP clock
> > > > +      - description: TX clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: stmmaceth
> > > > +      - const: ptp_ref
> > > > +      - const: tx
> > > > +
> > > > +  sophgo,syscon:
> > > 
> > > How many dwmac instances does the sg2044 have?
> > > 
> > 
> > Only one, there is another 100G dwxgmac instance, but it does not
> > use this syscon.
> 
> That dwxgmac is a different device, with a different compatible etc?

Yes, it needs a different compatiable, and maybe a new binding is needed
since the 100G and 1G IP are different.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
