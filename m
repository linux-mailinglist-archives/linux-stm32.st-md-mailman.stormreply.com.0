Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE2369C2B8
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Feb 2023 22:33:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B534CC65E59;
	Sun, 19 Feb 2023 21:33:13 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 410CBC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 21:33:12 +0000 (UTC)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B9A6A3F71B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 21:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1676842390;
 bh=8R8frgxkiDD95gIO0fe6fOdEBdEu/5r0X1kDOciAmuU=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=ON/mdzt8yHRRSijWHQWcmxSfQaok9cKnC2sKpZ9bsBzJkOxD1p9mNvd8ubIMDIGXN
 5vMpR4rmeh4fbND9FCnj/llk6Vekf/Py6CdQsEJZk+5L5y1O8FTdWp578E0zkgWAqS
 nLB9dY0a1T8cysPiZhkLfmGOoINo/89DkHojuEP06cVYfyAhrwO1IhGY8j5dxjvFBk
 dMPZWn2srHsvqxXZ+uIIuXXmqrlEI1xxtfUP9LUyFxGVzZIETitPC87/SrnAQgG2AT
 2fFNPfC3BYuVOrc3PFDXmKLiZeBUBrViWeTY0uktaiwDVBm2LPOS9KLzP9IJgBeKhh
 Lm7x4jXLogx6Q==
Received: by mail-lf1-f69.google.com with SMTP id
 d6-20020a0565123d0600b004b57756f937so234287lfv.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Feb 2023 13:33:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8R8frgxkiDD95gIO0fe6fOdEBdEu/5r0X1kDOciAmuU=;
 b=pDs1oRV+bNHHFleaLaKf4A9mP1GKzC1lcqQPwU3zEKO0I+T5PigSo3LjD4UQAzhd/H
 fwQef+c5+vKNwxtFB8ti0Kt+TGtEdySH2RecpxFydSWCDzYPyUYYzLCASOdMFi5RtIbW
 3rO9yPzScXWCRZNrEkUvzwSEJPoondNSmA/n6rWbXWEoCqqRj5iHE5ijKMViHvRhX35B
 J9nU4/N+84aPVbzHMIg4t6mC4hJ5do17GbnFurx5E/BKr6RagmO5kAlQ2+guzjyLoPt4
 mHhcMzXGjG+G2y4nYpPlr7TbrvSE0XQK7Nue0DTnbsMLqL7h1xJ4ozRWyeWPGOcAm0kt
 t1+g==
X-Gm-Message-State: AO0yUKVwsTGRkwtbv5pafEwFA+15KfKzKtf8lgj+U0df8GIb1frtChtb
 ts1ojQoV98xBLvCYtFztENjdUxLAwKtJQ0UKio//wqPYmQG9CJKgraB09bJXplkiBvvTMEg8kFB
 Kp/LekkMq1zyj6+9GIxVh2SzalRucAX5sy97MGYnxqupE4aCsJJbcl6usYgOUTxosGXzKn03KzQ
 ==
X-Received: by 2002:ac2:43dc:0:b0:4db:1aa4:fe08 with SMTP id
 u28-20020ac243dc000000b004db1aa4fe08mr25251lfl.1.1676842389564; 
 Sun, 19 Feb 2023 13:33:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/jqCxE7vysa+nLkM379Amt8o48UAX1vdCWM3PBOuY188t0gNT9otYGX3LH6uHIPrqc4/KhbzdCFeHafmAK5zQ=
X-Received: by 2002:ac2:43dc:0:b0:4db:1aa4:fe08 with SMTP id
 u28-20020ac243dc000000b004db1aa4fe08mr25246lfl.1.1676842389272; Sun, 19 Feb
 2023 13:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-5-cristian.ciocaltea@collabora.com>
 <Y+567t+kDjZI+fbo@spud>
In-Reply-To: <Y+567t+kDjZI+fbo@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sun, 19 Feb 2023 22:32:52 +0100
Message-ID: <CAJM55Z_poY3dVu9fQ1W1VQw3V=8VdVKc1+qUcdHduM1aAveJUQ@mail.gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, daire.mcnamara@microchip.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 04/12] soc: sifive: ccache: Add
	non-coherent DMA handling
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

On Thu, 16 Feb 2023 at 19:51, Conor Dooley <conor@kernel.org> wrote:
>
> Emil,
>
> +CC Daire
>
> On Sat, Feb 11, 2023 at 05:18:13AM +0200, Cristian Ciocaltea wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> >
> > Add functions to flush the caches and handle non-coherent DMA.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > [replace <asm/cacheflush.h> with <linux/cacheflush.h>]
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
>
> > +void *sifive_ccache_set_uncached(void *addr, size_t size)
> > +{
> > +     phys_addr_t phys_addr = __pa(addr) + uncached_offset;
> > +     void *mem_base;
> > +
> > +     mem_base = memremap(phys_addr, size, MEMREMAP_WT);
> > +     if (!mem_base) {
> > +             pr_err("%s memremap failed for addr %p\n", __func__, addr);
> > +             return ERR_PTR(-EINVAL);
> > +     }
> > +
> > +     return mem_base;
> > +}
>
> The rest of this I either get b/c we did it, or will become moot so I
> amn't worried about it, but can you please explain this, in particular
> the memremap that you're doing here?

No, I can't really. As we talked about it's also based on a prototype
by Atish. I'm sure you know that the general idea is that we want to
return a pointer that accesses the same physical memory, but through
the uncached alias. I can't tell you exactly why it's done this way
though, sorry.

/Emil

> Cheers,
> Conor.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
