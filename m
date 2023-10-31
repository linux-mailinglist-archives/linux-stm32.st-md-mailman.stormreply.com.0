Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AE67DCFC9
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Oct 2023 15:57:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2D45C6B44B;
	Tue, 31 Oct 2023 14:57:03 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D44CFC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 14:57:02 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C5569404AC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1698764221;
 bh=FpYMLQZ13miVSKwRHhEO2KWJ/cMhZ5Lcm8HLU14KOBM=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=eW4VLiPWXvUMaqjqfqmAhM1ByKNOibQgBc61kIaC8g4osTDnFj000xXOdmfa2RapO
 CTNPzqmFrmuGFApa6qw3cTSf8+wla4X2IrxRl6zd1wDSWDyO04gNjwsh+5xEsvMLB5
 JP9rA9Kz3o7VTzeuCyJrBmH5DnuHBEzwC3CiiMdZJhyYrFzLr1jM9HqJf6Acfg6QT9
 RKqIPX3mU0vQo0G40PzM9wf8tIv6wPrZX6Bh1ttJKAZffYJM9Oaupp9S2I3wchQ91m
 dkXwzAqHMlOztk4iSceymUZdzJbKZh9nzHoq0kaCR5/VDz88i3vX271SDEhGWPprN+
 hv/FI7oN18PkQ==
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1cc237c79f1so30781195ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 07:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698764220; x=1699369020;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FpYMLQZ13miVSKwRHhEO2KWJ/cMhZ5Lcm8HLU14KOBM=;
 b=U28jp3vgsQL5uiuUMBouKASqc/wJITLVOAC5GQ1hQF0PQW/Ng48EfFMy9pIVTlychJ
 lgu0nBCUimWNlXp3ek8enXaQKSrVll6bPkCUb5K5ZiJTORUY+HYL1GFpvS081StpiCeN
 5DvrVdeQUrgWlcOy0mUsJwE1L3u/2SIxkrnw1gmwsxsb0TAGjbQR6xgg9fMHYwbGDYxI
 OXLpDPiTWQhCi6mpgvNQJxai8clhFU3xf3iS2tyRs+JftWjS1Y0LEJBy8cAFdqh3nC3H
 Ky8xTX25L8Clp/3CdMnYo0P0BW85TU5BbrAWQ7HC5zylswsXOfKBRR/o3dcCzjpvG5sA
 yThg==
X-Gm-Message-State: AOJu0YzEpYuDycqIbTZyeZwqLR4s9v0wxKHVPdbFYp8ij/xScldYSalB
 dSAuIeW90sVchCBp/73pWtZTYDIqVt8j0qlsH1v3BdkIwtZddAMGUUqiqGVK9//8ALRYQY9G0ed
 zQhW0WOh/Y/edxOON0F0oTkeiCWngfvgK8ynvJu+7tOjguYB0OYtoznwErvzbjvaAjzRZBOqG1g
 ==
X-Received: by 2002:ac8:7f83:0:b0:41e:204b:f931 with SMTP id
 z3-20020ac87f83000000b0041e204bf931mr17140703qtj.42.1698764199256; 
 Tue, 31 Oct 2023 07:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhxXT6zh5apbHzBARYifBNWbjuGUA0HkX/8LhJMxPXwDzweT07IN3atmh/TMSuRVNN9nyxQvVV4SHG8UkDbZU=
X-Received: by 2002:ac8:7f83:0:b0:41e:204b:f931 with SMTP id
 z3-20020ac87f83000000b0041e204bf931mr17140690qtj.42.1698764198975; Tue, 31
 Oct 2023 07:56:38 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Oct 2023 07:56:38 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <9b8c9846-20be-4cfa-aff5-f9ae8ac2aba4@lunn.ch>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-9-cristian.ciocaltea@collabora.com>
 <9b8c9846-20be-4cfa-aff5-f9ae8ac2aba4@lunn.ch>
Mime-Version: 1.0
Date: Tue, 31 Oct 2023 07:56:38 -0700
Message-ID: <CAJM55Z_+A1jceB5QWwZ9=roAs7jeAb7E-CEdw3mSOng=jyVDYg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 08/12] riscv: dts: starfive: Add pool
 for coherent DMA memory on JH7100 boards
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

Andrew Lunn wrote:
> On Sun, Oct 29, 2023 at 06:27:08AM +0200, Cristian Ciocaltea wrote:
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >
> > The StarFive JH7100 SoC has non-coherent device DMAs, but most drivers
> > expect to be able to allocate coherent memory for DMA descriptors and
> > such. However on the JH7100 DDR memory appears twice in the physical
> > memory map, once cached and once uncached:
> >
> >   0x00_8000_0000 - 0x08_7fff_ffff : Off chip DDR memory, cached
> >   0x10_0000_0000 - 0x17_ffff_ffff : Off chip DDR memory, uncached
> >
> > To use this uncached region we create a global DMA memory pool there and
> > reserve the corresponding area in the cached region.
> >
> > However the uncached region is fully above the 32bit address limit, so add
> > a dma-ranges map so the DMA address used for peripherals is still in the
> > regular cached region below the limit.
> >
> > Link: https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> >  .../boot/dts/starfive/jh7100-common.dtsi      | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > index b93ce351a90f..504c73f01f14 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > @@ -39,6 +39,30 @@ led-ack {
> >  			label = "ack";
> >  		};
> >  	};
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		dma-reserved {
> > +			reg = <0x0 0xfa000000 0x0 0x1000000>;
>
> If i'm reading this correctly, this is at the top of the first 4G of
> RAM. But this is jh7100-common.dtsi. Is it guaranteed that all boards
> derived from this have at least 4G? What happens is a board only has
> 2G?

Yes, both the BeagleV Starlight and StarFive VisionFive V1 boards have at least
4G of ram and there won't be any more boards with this SoC. It was a test chip
for the JH7110 after all.

There aren't really any limitations on where this pool could be placed, so I
just chose to wedge it between ranges reserved for graphics by the bootloader.
If anyone has a better idea please go ahead and change it.

>
> It might also be worth putting a comment here about the memory being
> mapped twice. In the ARM world that would be illegal, so its maybe not
> seen that often. Yes, the commit message explains that, but when i
> look at the code on its own, it is less obvious.
>
> > +			no-map;
> > +		};
> > +
> > +		linux,dma {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x10 0x7a000000 0x0 0x1000000>;
> > +			no-map;
> > +			linux,dma-default;
> > +		};
> > +	};
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
