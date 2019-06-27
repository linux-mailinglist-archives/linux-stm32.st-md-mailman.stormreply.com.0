Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB46558ADE
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 21:17:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CB9CC3F932;
	Thu, 27 Jun 2019 19:17:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE3DFC3F926
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 19:17:54 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AD9D21670
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 19:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561663073;
 bh=jVA4VB9s5NNy9GIAi2iskWf5Auj5Utva7w73gHJYNuA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ae4utuPSQV3RWm09jXUtYypQOUgcyxetwsNCrFA24+VnggTEpoFKEvr0UyFZmkJL7
 s6tzk/zlkcFOBr6INX6mshjna79/iSbjeSCbX3mHV36qVnXrlAJWLc+zy3nhGp2Npe
 pH18Ipb481m/RGHEM6joBPRqQ66+BtHmh6V6WpUY=
Received: by mail-qk1-f173.google.com with SMTP id b18so2728836qkc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 12:17:53 -0700 (PDT)
X-Gm-Message-State: APjAAAUbbGHCJhRiMGniiypxtLtNMz2vxMSgQ4wYFA177bQ1S4P/whUA
 8dPaAFOgMDXdjgLkwSS3ueYzyxNyjMydxh/uQQ==
X-Google-Smtp-Source: APXvYqwMe03fvIIa3Mb5qmrWDe/3LSiR1s/xQeMGkTRSxCRPlyYgVVQQnPRou7SUsvG7QpKsbJzlqXNsXyomtemEUa0=
X-Received: by 2002:a05:620a:1447:: with SMTP id
 i7mr5051184qkl.254.1561663072405; 
 Thu, 27 Jun 2019 12:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
 <20190627.102256.1839462093915893704.davem@davemloft.net>
In-Reply-To: <20190627.102256.1839462093915893704.davem@davemloft.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 27 Jun 2019 13:17:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ9VtRv6QKuPO9kXst61ndG1UNBnx8qMkkv879GG7JTXg@mail.gmail.com>
Message-ID: <CAL_JsqJ9VtRv6QKuPO9kXst61ndG1UNBnx8qMkkv879GG7JTXg@mail.gmail.com>
To: David Miller <davem@davemloft.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev <netdev@vger.kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 00/13] net: Add generic and Allwinner
	YAML bindings
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

On Thu, Jun 27, 2019 at 11:22 AM David Miller <davem@davemloft.net> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> Date: Thu, 27 Jun 2019 17:31:42 +0200
>
> > This is an attempt at getting the main generic DT bindings for the ethernet
> > (and related) devices, and convert some DT bindings for the Allwinner DTs
> > to YAML as well.
> >
> > This should provide some DT validation coverage.
>
> I don't think this should go via my tree as it's all DT stuff.

That's fine. I can take it. There's one conflict with commit
79b647a0c0d5 ("dt-bindings: net: document new usxgmii phy mode"), but
that's easy enough to handle. Any other changes to the binding docs
will need to go thru me this cycle.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
