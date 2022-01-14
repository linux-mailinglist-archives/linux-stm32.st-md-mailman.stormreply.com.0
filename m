Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA2B48ED16
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 16:23:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11260C5F1F4;
	Fri, 14 Jan 2022 15:23:11 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 727EDC5E2AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 15:23:10 +0000 (UTC)
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 98A4E402A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642173786;
 bh=Ia9jCR2j/rA1cIOYRQT6jRXDjntVCpr3+k1Bg19zGmo=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=NGGEQPQ6DXcJv+0lF0fm9b6XPu/oIqpT5+UDOSbramjwxe3NOW7JkGSGbI//COBye
 IHCMEB43PMIS7vkxOVLiF2a1MyHzJ5qMf33VzIHsXNGLMHrXJVETj8Kp6G7AFOdCCT
 v/05dhuQgRhxAoLt+O2vb42GymvVY1+hG8cJzQ5uAucXaDWzY8ynsD7MHRQMK6Rfvc
 LaGyQDbCj64H0SW8m0fPlcpqn+Qre3xnoiVgdH85uXuREfGSgBFTFmxfavqitr1yWR
 HHt1pOATlmz7xDo6DIR91CRvczo2XLD6rRexdj4RoHGRYeSffu9JH9Sr8bz5auS9nw
 VR8zC13W8CSig==
Received: by mail-oo1-f69.google.com with SMTP id
 t12-20020a4aa3cc000000b002e087a8da2eso1377071ool.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 07:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ia9jCR2j/rA1cIOYRQT6jRXDjntVCpr3+k1Bg19zGmo=;
 b=R+pB0d4gs5fJOS+DEqWgyxN7kRM4t6zkE9EKOiKhJQlTI7HxYyY/OpOR2HI+7oXt6i
 cemXi1OCuaTRPXjNJK74x7y9+tMuYf1ADMcP0KjKoVUy6IXwm8EuhXBFjMYi0dHQvsG2
 E67XwATpo+lluyxYQAcrmUQwjXXRZ1I3lY8aRg44YYjSlS8ED8eiyfYNKw0i7V19CevF
 5tOHrQj5jOJbxkkqvX72jmRfAo2rhk7B26MdGUMDqUSQmYRphcVIokfVUjs+Kgfq80qM
 A8fTIW3fd1Tyx7RnxeNgZaljGZO2zV67uhRFoHIVxRcIOcYvPg7t1S9uKReGDu1g2tx1
 KGmA==
X-Gm-Message-State: AOAM531JjxCivDQHdWaCXDRsH7Rg9qMAc+Kt0k1TdB33ceLP8U/ID6xu
 Lih73Tx/3CgwrdKWnI0BU71lkDPHsm6pmCYfdOxlgajQpWYUsOF6MGdtWDrBV5JANmcxOwXATNZ
 zU3nvf7zSi3t1aFZi3kobkNGYOjxQ/1LwDV4Sgk8aL+3f8oIBFVBref2MGJJH2AdICBhVd5hnTQ
 ==
X-Received: by 2002:a9d:24e4:: with SMTP id z91mr7171446ota.11.1642173785397; 
 Fri, 14 Jan 2022 07:23:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1rRcmwLgU1sdJqzQCBSfOAGlb01uPOBf0ZfAZY09v0WzUQ92iIkMR8shxtN95ewZDg/NvYsXU4kg6yfRt754=
X-Received: by 2002:a9d:24e4:: with SMTP id z91mr7171417ota.11.1642173785054; 
 Fri, 14 Jan 2022 07:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20220114040755.1314349-1-kai.heng.feng@canonical.com>
 <20220114040755.1314349-2-kai.heng.feng@canonical.com>
 <YeF18mxKuO4/4G0V@lunn.ch>
In-Reply-To: <YeF18mxKuO4/4G0V@lunn.ch>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 14 Jan 2022 23:22:53 +0800
Message-ID: <CAAd53p5R2y-2JhWx3wp2=aBypJO=iV7fFS99eAgk6q7KBZMFMA@mail.gmail.com>
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

On Fri, Jan 14, 2022 at 9:09 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Jan 14, 2022 at 12:07:54PM +0800, Kai-Heng Feng wrote:
> > BIOS on Dell Edge Gateway 3200 already makes its own phy LED setting, so
> > instead of setting another value, keep it untouched and restore the saved
> > value on system resume.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 16 +++++
> >  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 +
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ++
> >  drivers/net/phy/marvell.c                     | 58 ++++++++++++-------
> >  include/linux/marvell_phy.h                   |  1 +
> >  5 files changed, 61 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > index 8e8778cfbbadd..f8a2879e0264a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > @@ -857,6 +857,16 @@ static const struct dmi_system_id quark_pci_dmi[] = {
> >       {}
> >  };
> >
> > +static const struct dmi_system_id use_preset_led[] = {
> > +     {
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "Dell EMC"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Edge Gateway 3200"),
> > +             },
> > +     },
> > +     {}
> > +};
>
> This is a PHY property. Why is the MAC involved?

This is inspired by commit a93f7fe13454 ("net: phy: marvell: add new
default led configure for m88e151x") which passes the flag from MAC to
PHY.

>
> Please also think about how to make this generic, so any ACPI based
> system can use it, with any PHY.

ACPI property won't work because it ties to ACPI platform device or
PCI device, so the property still needs to be passed from MAC to PHY.

So the only approach I can think of is to use DMI match directly in PHY driver.

Kai-Heng

>
>      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
