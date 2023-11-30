Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C823F7FF7FD
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Nov 2023 18:17:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84D54C6B475;
	Thu, 30 Nov 2023 17:17:36 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 278CBC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 17:17:35 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5d279bcce64so13649337b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 09:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701364654; x=1701969454;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S4ItrsGzT/WvTQH/WrTuyHNbLnHImVbBz/zIs/Lb/tg=;
 b=AsuWdf9FRmVxvPHDmyrleRAcqbKmRPkOz5W7FKPmN29+u8l23+WgFOiblhG8N4Ckny
 PR7hT5Ls2vpv1nGsebQRWxJJjC9f0polVs+0sHBj4bnuKHEJCOxAmrdZTSlMdODpLe0S
 h9tct3HaCac9mShikOs0An52N/bhA2nlkaR6jG3SRcQaHP8TPcvdL5V4auUZWOfeSkZg
 KCFJulqu5kCeNtcO4c2OErKI8YD/6dyylNWoLGsEKLD7imPUmxHYwRzqSkLF2325cft+
 3YJk27rMva9sqPGqWmVACiZ6Fbb3ZFHtv3/ypHBBKy053xmPlyESJUSPyYR4YRGAijqF
 YsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701364654; x=1701969454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S4ItrsGzT/WvTQH/WrTuyHNbLnHImVbBz/zIs/Lb/tg=;
 b=hSg5lbZiqd5sROuEdOjJonG57yqKmitaoz6lfU9i0b8N1gO2r4YAQxCJsu7TWALr5G
 I2yWlUCLgT9ke99VUy5fEopDaL99FX1careeMmcxGKp7ZNC1H0JKxvVd/zNnXiPYd2ZL
 yhM7SiYwkGT8Mi8DDQeh0n5aSDY1+xEVLQ6hb5XDM0LXNaKCMohmld88m4o+a6eGvnli
 02IVhCR9oeVeMRQJIM7/JsOZ5ZLegLuWkyjE4ozfuY7mEaQKtUh+DABSOQ14JoSyJmik
 9ehiP3JM32g09xqzH49Q/0OAzNveJN6i0nOFQV960je3QCU+68z9CqcqFgZdwsgpI5jL
 pyFw==
X-Gm-Message-State: AOJu0YywNZaliLraYWhAWMDtLAlGZL+xABSdzozyHXd7W6sv4Jqr9BGA
 Id2oZJpKBEfFwrjQM2LjbY5H4SN7HouOErgHs7M=
X-Google-Smtp-Source: AGHT+IFRYlx8Y2pZgDDnTjk34oWVAWqB8FSjJ3g/yr2nSX2rg4cTZh7j2qWaWLqE1aKFFeAOp9O2b/2sC6qDD70RNAw=
X-Received: by 2002:a0d:f2c7:0:b0:5cd:3d82:1ac6 with SMTP id
 b190-20020a0df2c7000000b005cd3d821ac6mr21961033ywf.42.1701364653930; Thu, 30
 Nov 2023 09:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
 <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
 <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
 <CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com>
 <a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch>
In-Reply-To: <a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 30 Nov 2023 19:17:22 +0200
Message-ID: <CAP6Zq1jVO5y3ySeGNE5-=XWV6Djay5MhGxXCZb9y91q=EA71Vg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjaminfair@google.com, davem@davemloft.net, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 tali.perry1@gmail.com, mcoquelin.stm32@gmail.com, edumazet@google.com,
 joabreu@synopsys.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, j.neuschaefer@gmx.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: Add NPCM support
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

Hi Andrew,


On Wed, 29 Nov 2023 at 01:31, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Nov 27, 2023 at 05:19:15PM +0200, Tomer Maimon wrote:
> > Hi Andrew,
> >
> > I took a look at the xpcs driver and the stmmac driver and it doesn't
> > cover NPCM use.
> >
> > in the NPCM case the stmmac ID=0x37 therefore the driver is linked to DWMAC1000
> > https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/hwif.c#L139
> >
> > to enable the xpcs, the stmmac should support xgmac or gmac4 and in
> > the NPCM is support only gmac.
> > https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c#L555
> > https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c#L573
> >
> > and the most important thing is that the XPCS is handled through an
> > indirect register access and not through MDIO. the MDIO is connected
> > to the external PHY and not to the XPCS.
>
> What really matters here is, is the PCS hardware block you have an
> XPCS? We don't want two drivers for the same block of hardware.
>
> MDIO vs indirect register access can be solved with a bit of
> layering. That is not a reason to write a second driver.
I will check with the xpcs maintainer how can we add indirect access
to the xpcs module.
>
>         Andrew

Thanks.

Tomer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
