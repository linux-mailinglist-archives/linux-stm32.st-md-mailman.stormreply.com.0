Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B69427FA440
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 16:19:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64E55C6B469;
	Mon, 27 Nov 2023 15:19:29 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1556FC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 15:19:28 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-db4050e68f3so4007068276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 07:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701098367; x=1701703167;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VIKMvlIRYtS1WvbUoM+vWJ1z9I2GYsx2bfxFTfmC+TQ=;
 b=UUH8LeuLO4ttlIYQfo57rNfT7KxAsiuXwo9+13ccBcp8Bcz4swP9fWgFKHAULY9kNZ
 ukCPR6h4fMtp4D4OBnDS+9qeb6/UZE+69Jwp1PNK6tZpbvSODxsH5M+IFGYYwSgN62Ev
 C5px4PUEo+4x2eyeJu661i9cd5plQx5+7B6fbaHbM/K7MpIQCo0GWkJxMQwOq24J1bIO
 6ebLM0Wk4CplfYTelXKIkxy5E+gidahe0D959Qcg5Jw8cwI6qjUD4fZFuxq5cxGbk/E1
 ruAkngDzfaQamDA3aH1V3kUBBeyjBE4bFPxBU1OwSzgzE3MFHkOGNEgEVgHk+Od490l8
 tOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701098367; x=1701703167;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VIKMvlIRYtS1WvbUoM+vWJ1z9I2GYsx2bfxFTfmC+TQ=;
 b=NgCFHSYz7BAMdEdMU5zDSyUrarklEDAKEP/i4Cbhemc5EkM+Kx/RU4jm5HE+hLsogQ
 U5zP+rdF8Gacs8/E88eHimz8D6J3RfRy2G8POt8oQVGGSsQAzL+kNSWy6XPYwhEEA8Ki
 RXmJ6DB4FDH1GRTuBiPbmgsQWRXoCcu1GbBwpPg5etf6f64UAD4i+wKq1BwaYca1MB34
 O8ouP4lFaa9BMxGTagS1IwqTI6cCNXZ+moOKGn3WyzcZ0X+WQos8EdI6Ts0MfVpA2oSt
 7NQa8FzyRkWGCtF19oukHKOSDE4XfESUa+4gQjyKO6/dDKe7ZxB9dmKclYQ+PEPRa4qd
 4Ing==
X-Gm-Message-State: AOJu0YyF9Mz91ttrMLcvavTY9prt7M6Z741ROiarxdXd6XwEJfvh3tx4
 ij5M1y57jo0jApoq/du7dXwpVKB/jP2SO62ELto=
X-Google-Smtp-Source: AGHT+IE/rFqsV0KKN1gYLmgiErQUf25fY8S0FvfOygtZwLf5Ah7JOJcfJbDXf3oSBTUYCLBu/J8CZ1DTNOo/phyIfOI=
X-Received: by 2002:a25:4b02:0:b0:db0:23d8:780 with SMTP id
 y2-20020a254b02000000b00db023d80780mr9466434yba.60.1701098366826; Mon, 27 Nov
 2023 07:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
 <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
 <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
In-Reply-To: <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 27 Nov 2023 17:19:15 +0200
Message-ID: <CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com>
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

I took a look at the xpcs driver and the stmmac driver and it doesn't
cover NPCM use.

in the NPCM case the stmmac ID=0x37 therefore the driver is linked to DWMAC1000
https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/hwif.c#L139

to enable the xpcs, the stmmac should support xgmac or gmac4 and in
the NPCM is support only gmac.
https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c#L555
https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c#L573

and the most important thing is that the XPCS is handled through an
indirect register access and not through MDIO. the MDIO is connected
to the external PHY and not to the XPCS.

In that case, I think the best way to handle the XPCS is through the
NPCM glue layer, what do you think?

Thanks,

Tomer

On Thu, 23 Nov 2023 at 15:50, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Andrew,
>
> On Wed, 22 Nov 2023 at 20:45, Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Wed, Nov 22, 2023 at 07:50:57PM +0200, Tomer Maimon wrote:
> > > Hi Andrew,
> > >
> > > Thanks for your comments
> > >
> > > On Tue, 21 Nov 2023 at 18:42, Andrew Lunn <andrew@lunn.ch> wrote:
> > > >
> > > > > +void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
> > > > > +                      struct plat_stmmacenet_data *plat_dat)
> > > > > +{
> > > > > +     u16 val;
> > > > > +
> > > > > +     iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
> > > > > +     val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > > +     val |= PCS_RST;
> > > > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > > +
> > > > > +     while (val & PCS_RST)
> > > > > +             val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > > +
> > > > > +     val &= ~(PCS_AN_ENABLE);
> > > > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > > +}
> > > >
> > > > Is this a licensed PCS implementation? Or home grown? If its been
> > > > licensed from somebody, it maybe should live in driver/net/pcs, so
> > > > others can reuse it when they license the same core.
> >
> > > we are using DWC PCS, I don't see support for DWC PCS and I am not
> > > sure it is supposed to be supported at /drivers/net/pcs
> >
> > I've not followed the naming used by Synopsys. Is DWC PCS the same as
> > XPCS? Does Synopsys have multiple PCS implementations?
> >
> > > I do see a patch set to support DWC PCS but I don't think it answers my needs
> > > https://patchwork.ozlabs.org/project/netdev/patch/1559674736-2190-3-git-send-email-weifeng.voon@intel.com/
> >
> > I _think_ this patch eventually got turned into
> > driver/net/pcs/pcs-xpcs.c
> >
> > What exactly does it not do for you?
> Thanks for pointing me to Synopsys (DWC) PCS in pcs-xpcs.c I need to
> check if the driver follows all our SGMII needs
> >
> >      Andrew
>
> Best regards,
>
> Tomer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
