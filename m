Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A52F09AF55F
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 00:28:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50B3CC78F62;
	Thu, 24 Oct 2024 22:28:06 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 896AAC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 22:27:58 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2e3010478e6so1059949a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 15:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729808877; x=1730413677;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fD7JZCX3WSpRYBUjkGKdk6/F/9roVP52zuSU1cyvQeQ=;
 b=Ubawr6XAFhZm1DnWGeede+FSSozDOJTjaLjoPitlndRTEWyZiUYdkP6r86tyqFQq0X
 YDEBjis3FR5eSedbyf5nQJAcv8VVtgpoTLYvDEcV09gSddAGzwgI5tzFr8H0bnicH+y9
 68fUUyM5g8PSwfpwTJQnuxShAER6ISixFgvYgN3npyOK6cPH9f93hRdqX8UeqPiEkMyY
 Egn19VViSgoOymrD085dXmzJXuOwGJboUL5r92cEvijSsUWZ5mD+l+5HYiTb8NAYNyaz
 Ku0ChA3er0Zz9ww6+Tz4IerA8W3vCMiIeXTW/OcftlnQ937ChNxowXlFW5Sgi9QijLG8
 oB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729808877; x=1730413677;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fD7JZCX3WSpRYBUjkGKdk6/F/9roVP52zuSU1cyvQeQ=;
 b=rDrXpk54vUAewvC1UF8xJGJKx6BJ9PgT3x5Ac1o1Zayds1F+uotsEeXUw2yrHlsiEh
 zQzmTQumIzs2973ZRt6QUZkmLAi9ZDsFRvqcrOGzBRKPpki9tyWAgDJZsQv0XcFIHzbB
 TvGsyzbQyu7urzeLMeMgPLDjv05SyobKu2zjiWdjX6nb/VPdS4wyhThWNzZhqru6pvDS
 MlYUoQ1J5B7n/xzb6f3AeKkqK+wOojeVNjPZSpR0Es+N9PaufZ0qxw5kB1+5gK6mElm/
 Kbb4Zmyci6F7W5RmZPUiBfc7BH15ITRN0vhSN5pSjbK0PuGaP/z+YgGJl8fUd1GIA0b1
 tSeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAz3ZVdgbKcJp2jl7y5QzPl94SXSj+qwijarpOco3DDtn6XfKDLyJrwo8NLsRADhFRwiLxev8udjEJtw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzOL7MjM0QYjai4dYeWqT1b1uUy8/UrBwdZT96nzM2gJALdUW2B
 bJH5trMk8VdZlKpTS023lKdsYAPpB+5MQ6zV85aYFTWo/TW8PliO
X-Google-Smtp-Source: AGHT+IGQmCYk2RoxkOpXP4PJ+QT2gDC7178GzCSx0ES9YMS9JzYskSa3vPomTHV9tDwOnPLPR2pM0w==
X-Received: by 2002:a17:90b:17c1:b0:2e0:9d3e:bc2a with SMTP id
 98e67ed59e1d1-2e76b6cda50mr8866774a91.32.1729808876652; 
 Thu, 24 Oct 2024 15:27:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e77e57f74asm2019615a91.46.2024.10.24.15.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 15:27:56 -0700 (PDT)
Date: Fri, 25 Oct 2024 06:27:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <s2rbj66rarjs33fvmyrwtmeq562pbx7mif5fld56tnk3fm73m5@hlsufkbunu3t>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <20241022-crisply-brute-45f98632ef78@spud>
 <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
 <20241023-paper-crease-befa8239f7f0@spud>
 <5cv7wcdddxa4ruggrk36cwaquo5srcrjqqwefqzcju2s3yhl73@ekpyw6zrpfug>
 <20241024-wad-dusk-3d49f9ac4dff@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241024-wad-dusk-3d49f9ac4dff@spud>
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

On Thu, Oct 24, 2024 at 06:04:31PM +0100, Conor Dooley wrote:
> On Thu, Oct 24, 2024 at 06:38:29AM +0800, Inochi Amaoto wrote:
> > On Wed, Oct 23, 2024 at 09:49:34PM +0100, Conor Dooley wrote:
> > > On Wed, Oct 23, 2024 at 08:31:24AM +0800, Inochi Amaoto wrote:
> > > > On Tue, Oct 22, 2024 at 06:28:06PM +0100, Conor Dooley wrote:
> > > > > On Mon, Oct 21, 2024 at 06:36:15PM +0800, Inochi Amaoto wrote:
> > > > > > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > > > > > with some extra clock.
> > > > > > 
> > > > > > Add necessary compatible string for this device.
> > > > > > 
> > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> > > > > >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
> > > > > >  2 files changed, 146 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > > index 3c4007cb65f8..69f6bb36970b 100644
> > > > > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > > @@ -99,6 +99,7 @@ properties:
> > > > > >          - snps,dwmac-5.30a
> > > > > >          - snps,dwxgmac
> > > > > >          - snps,dwxgmac-2.10
> > > > > > +        - sophgo,sg2044-dwmac
> > > > > >          - starfive,jh7100-dwmac
> > > > > >          - starfive,jh7110-dwmac
> > > > > >  
> > > > > > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..93c41550b0b6
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > > > @@ -0,0 +1,145 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: StarFive JH7110 DWMAC glue layer
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > > +
> > > > > > +select:
> > > > > > +  properties:
> > > > > > +    compatible:
> > > > > > +      contains:
> > > > > > +        enum:
> > > > > > +          - sophgo,sg2044-dwmac
> > > > > > +  required:
> > > > > > +    - compatible
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    items:
> > > > > > +      - const: sophgo,sg2044-dwmac
> > > > > > +      - const: snps,dwmac-5.30a
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    items:
> > > > > > +      - description: GMAC main clock
> > > > > > +      - description: PTP clock
> > > > > > +      - description: TX clock
> > > > > > +
> > > > > > +  clock-names:
> > > > > > +    items:
> > > > > > +      - const: stmmaceth
> > > > > > +      - const: ptp_ref
> > > > > > +      - const: tx
> > > > > > +
> > > > > > +  sophgo,syscon:
> > > > > 
> > > > > How many dwmac instances does the sg2044 have?
> > > > > 
> > > > 
> > > > Only one, there is another 100G dwxgmac instance, but it does not
> > > > use this syscon.
> > > 
> > > That dwxgmac is a different device, with a different compatible etc?
> > 
> > Yes, it needs a different compatiable, and maybe a new binding is needed
> > since the 100G and 1G IP are different.
> 
> In that case, you don't /need/ a syscon property at all, much less one
> with offsets. You can just look up the syscon by compatible and hard
> code the offset in the driver.

Good, look up the syscon is a good idea. Thanks for this suggestion.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
