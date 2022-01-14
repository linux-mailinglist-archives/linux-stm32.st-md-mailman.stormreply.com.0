Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F87B48ED19
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 16:25:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A448C5F1F4;
	Fri, 14 Jan 2022 15:25:32 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6497BC5E2AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 15:25:31 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 15FA8402A6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 15:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642173931;
 bh=1r53LGbRrCdIDFkdFatBJl+cYRNX8emZDBqZeKrVhA0=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=rWGtiG9uI4y+5AlEq01ZA/NeofQf4xdOaoq1Bd7EpvRhO9llNE1be6mBHZnXOGpNE
 rFMxgkluHL3kSiobH0wPVgc/wiuriEyImbvnTlLKArbvo7RmolyD2M41YUDniw5TbC
 KSzoETYEZUR8LeK8gEoGJjeUpPqM2/KaCd+YeLyyHvwyevGLy/ypyORnbNB43PBo4U
 1uAIp87RuCdA38PzcGr2Rp/w4tQJ1JDHH+PEENbSHaNBuO9UZs1cxpLJeegjfwgnBP
 i2Usy4+d5F8ZfvXmKZm3UBFS+UekTupOTbsG1XyJaFa1YPvyxonxPPsIS/n9Xe6MMa
 S8Ws5BL7QbytQ==
Received: by mail-oi1-f198.google.com with SMTP id
 g4-20020acab604000000b002c8b24c3964so6174375oif.22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 07:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1r53LGbRrCdIDFkdFatBJl+cYRNX8emZDBqZeKrVhA0=;
 b=IY6a3BFSJACWd2/mkU1Xl4wVi7fENlvmF3QJJkDqruv5wTE7XEqpwtBfAoAdFbFBDZ
 y88h4ZKbnjdgYOT0d+hcgyiWd7n7oCII2aCAjv8CYV2mEZVyi5n4fLXyhilSMqwhGYNa
 FGlLwzSEll1Udn8TOx3HYTyRNQFHs5XkUBxC2NJ38zvv220LRL/nOx01W22p86ptb3MB
 3ywWMk/M8ZHkD2j/k1WagJgg3GX4BZ6quGgJj+Wf+wC5UYe7RnH9jicrcGAeLFScacU3
 3EpcisLQ/SDlB3V4RNh09Zz8ThYKoZp+emZWlzjsAY1E9pSvpYYXKJMJ+72DIvFd3P0t
 HpMw==
X-Gm-Message-State: AOAM532bnso4xizGaeXdjrv2whAllaiwnK3YSduF0JWi6AzodyEQrEAo
 VPSfmHueM7aLj1IqI3EvY/nowM7grUTIIN5xTHaEZMpYZ5vtWup6fF2mUrZZoh9oHQp1r1vS0qb
 EPIwCkwPwyFxruh/CA+CYYs0g1c+zUi+0s8jhX9qDL2JvXnb8cjmyRTBnzE42qnu7wYL39yLbJg
 ==
X-Received: by 2002:a05:6808:199a:: with SMTP id
 bj26mr13097379oib.98.1642173929765; 
 Fri, 14 Jan 2022 07:25:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjc8OhFrl0+4UKcBWR0AvxTCF+lZaB9wkXprPPao3yjX3bM54hzP09Hoph4ybKCG+Gsz+cmAnQZkDe5pkkoW8=
X-Received: by 2002:a05:6808:199a:: with SMTP id
 bj26mr13097353oib.98.1642173929496; 
 Fri, 14 Jan 2022 07:25:29 -0800 (PST)
MIME-Version: 1.0
References: <20220114040755.1314349-1-kai.heng.feng@canonical.com>
 <20220114040755.1314349-2-kai.heng.feng@canonical.com>
 <YeF4kbsqag+kZ7ji@lunn.ch>
In-Reply-To: <YeF4kbsqag+kZ7ji@lunn.ch>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 14 Jan 2022 23:25:17 +0800
Message-ID: <CAAd53p4P9STxTUsZ2fXNqOnmwLMfOBXpYR5hvcJHk5-0V7MPgA@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 Russell King <linux@armlinux.org.uk>, joabreu@synopsys.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 peppe.cavallaro@st.com, Ivan Bornyakov <i.bornyakov@metrotek.ru>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] stmmac: intel: Honor phy LED set by
 system firmware on a Dell hardware
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

On Fri, Jan 14, 2022 at 9:20 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> >  static void marvell_config_led(struct phy_device *phydev)
> >  {
> > -     u16 def_config;
> > +     struct marvell_priv *priv = phydev->priv;
> >       int err;
> >
> > -     switch (MARVELL_PHY_FAMILY_ID(phydev->phy_id)) {
> > -     /* Default PHY LED config: LED[0] .. Link, LED[1] .. Activity */
> > -     case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1121R):
> > -     case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1318S):
> > -             def_config = MII_88E1121_PHY_LED_DEF;
> > -             break;
> > -     /* Default PHY LED config:
> > -      * LED[0] .. 1000Mbps Link
> > -      * LED[1] .. 100Mbps Link
> > -      * LED[2] .. Blink, Activity
> > -      */
> > -     case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1510):
> > -             if (phydev->dev_flags & MARVELL_PHY_LED0_LINK_LED1_ACTIVE)
> > -                     def_config = MII_88E1510_PHY_LED0_LINK_LED1_ACTIVE;
> > -             else
> > -                     def_config = MII_88E1510_PHY_LED_DEF;
> > -             break;
> > -     default:
> > +     if (priv->led_def_config == -1)
> >               return;
> > +
> > +     if (priv->led_def_config)
> > +             goto write;
>
> Really?
>
> Please restructure this code. Take it apart into helpers. You need:
>
> A function to set the actual LED configuration.
> A function to decide what, if any, configuration to set
> A function to store the current configuration on suspend.
> A function to restore the current configuration on resume.
>
> Lots of little functions will make it much easier to understand, and
> avoid 1980s BASIC style.

Sure, will turn these into helper functions.

>
> I'm also surprised you need to deal with suspend/resume. Why does the
> BIOS not set the LED mode on resume, same as it does on power up?

I was told this is a BIOS limitation. I'll ask vendor _why_ the LED
can't be restored by BIOS.

Kai-Heng

>
>       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
