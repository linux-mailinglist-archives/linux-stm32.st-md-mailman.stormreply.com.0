Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B802C7FF7DC
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Nov 2023 18:15:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C4D5C6B475;
	Thu, 30 Nov 2023 17:15:35 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 501B1C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 17:15:34 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-5d3644ca426so8216657b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 09:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701364533; x=1701969333;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rUEJMCiwK1IimuLmpZAvnaV23jPetFgYdyhHNBMmmMM=;
 b=drANb443IdT650KzcW5MQRHE4W8ruzJljzK9+y5LOGkW0tTZDPrN4mPRBRqYNaSMxk
 FL8/vUCiHgnR3oZqGpujGzxKcAG7VsAjeBvtCNkxQSwQUUKg3+96hSVQ8/ybvIIsYn9h
 INUceATenSv6R1HRd73yr9GcOQlbCKT3cvTYzcXbqyckP6Ye6mzN/CD0fghJ5RdyDSLO
 0B68Utv0PNAbQIEK5I+0BswxUcqMMgEl33ZpCjZlcyTuOQaGNvr0rolNecP/Wy1rAfzc
 6605Hc8bv+vehlP5zTwbBsQgr8I+tbsAhEJ4z88eWHK5vogUNtIFFA+8Re14+KUOSxZU
 rXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701364533; x=1701969333;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rUEJMCiwK1IimuLmpZAvnaV23jPetFgYdyhHNBMmmMM=;
 b=TLelrdem7NN+D9vw54yGPEW6/LxJiiHRcUrIaGlENrWIM+EnNICaUYXnOsDpTGKZRy
 FeqfuKib7wt/lqGYjlQuEt+qS7Fhpa/b7zfBozghB4m7STjP7ZprTaGUN7JXzIPJpvW8
 0bM9A+LTsacJJX3MQzD8ZfOzF/IwfPcp3n3Iv38Q8nlZrtVx5gfMcgx9YcNk8iiowdgO
 MkXNVchlAp/Zsnvim9I1MlaqjS1cFgRvFu1XSt+g86MZJGsGrSamS9e+teSSeEIOo6Ul
 rpXg+Of/wb2ef62VU8ByHp3pfWo/dFBmYW6845ZRt2/6R5aU0LcCNgBPtsEW6zaIs8RF
 KS5Q==
X-Gm-Message-State: AOJu0Yxk5PedpXx1nbPgf0I3hIrQGkSTTlwLS6cMjipxqOHbCZ5foKzJ
 YwwL9pVS8FLYxyxcBb55UZuc7dmDAzGCCOXooEQ=
X-Google-Smtp-Source: AGHT+IErvA2RyH4g/m74oMEXpowU9Ue1ZkuQKHoyzXHdNG4/HUE13vw8TPWvMWjjM1lDHYhxc1hrEUPuGNakOFAxacU=
X-Received: by 2002:a81:ad1c:0:b0:5cb:ee2d:5f5d with SMTP id
 l28-20020a81ad1c000000b005cbee2d5f5dmr18972117ywh.39.1701364533098; Thu, 30
 Nov 2023 09:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <ZVzQh9ykusyknGgP@shell.armlinux.org.uk>
 <CAP6Zq1gzAhp9BZNX1MOozUfQc82Vi_S==on5_nOfVfpvtgnN2g@mail.gmail.com>
 <ZWS8m66LrrRQpbLO@shell.armlinux.org.uk>
In-Reply-To: <ZWS8m66LrrRQpbLO@shell.armlinux.org.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 30 Nov 2023 19:15:21 +0200
Message-ID: <CAP6Zq1gLmOmtQ6081CubDsG4_CNvjBSMGdA2TTE4o+QJX8c=ZA@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: tali.perry1@gmail.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 benjaminfair@google.com, openbmc@lists.ozlabs.org, yuenn@google.com,
 joabreu@synopsys.com, joel@jms.id.au, andrew@codeconstruct.com.au,
 devicetree@vger.kernel.org, j.neuschaefer@gmx.net, robh+dt@kernel.org,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, davem@davemloft.net
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

Hi Russell,

On Mon, 27 Nov 2023 at 17:58, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Nov 22, 2023 at 07:23:28PM +0200, Tomer Maimon wrote:
> > Hi Russell,
> >
> > Thanks for your comments.
> >
> > On Tue, 21 Nov 2023 at 17:45, Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Tue, Nov 21, 2023 at 05:17:33PM +0200, Tomer Maimon wrote:
> > > > Add Nuvoton NPCM BMC SoCs support to STMMAC dwmac driver.
> > > >
> > > > And modify MAINTAINERS to add a new F: entry for this driver.
> > > >
> > > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > >
> > > A few comments on this...
> > >
> > > > +#define IND_AC_BA_REG                0x1FE
> > > > +#define SR_MII_CTRL          0x3E0000
> > > > +
> > > > +#define PCS_SR_MII_CTRL_REG  0x0
> > > > +#define PCS_SPEED_SELECT6    BIT(6)
> > > > +#define PCS_AN_ENABLE                BIT(12)
> > > > +#define PCS_SPEED_SELECT13   BIT(13)
> > > > +#define PCS_RST                      BIT(15)
> > >
> > > include/uapi/linux/mii.h:
> > >
> > > #define BMCR_SPEED1000          0x0040  /* MSB of Speed (1000)         */
> > > #define BMCR_ANENABLE           0x1000  /* Enable auto negotiation     */
> > > #define BMCR_SPEED100           0x2000  /* Select 100Mbps              */
> > > #define BMCR_RESET              0x8000  /* Reset to default state      */
> > >
> > > Look familiar? Maybe use the standard definitions for a standardised
> > > register?
> > >
> > > > +void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
> > > > +                      struct plat_stmmacenet_data *plat_dat)
> > > > +{
> > > > +     u16 val;
> > > > +
> > > > +     iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
> > > > +     val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > +     val |= PCS_RST;
> > > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > +
> > > > +     while (val & PCS_RST)
> > > > +             val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > >
> > > What if the PCS never clears its reset bit? Maybe use
> > > read_poll_timeout() ?
> > >
> > > > +
> > > > +     val &= ~(PCS_AN_ENABLE);
> > > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > +}
> > >
> > > Also, maybe it's time to require new stmmac platform support to start
> > > making use of the phylink PCS support rather than continuing to code its
> > > own?
> > >
> > > I notice, however, that you always disable inband signalling - please
> > > explain why. Also, what protocol does the PCS use when communicating
> > > with the PHY?
> > With disable inband signalling you mean disable auto negotiation?
>
> Over a SGMII, 1000base-X, USXGMII etc link, there is an inband
> signalling method. Whether it is "auto negotiation" depends on your
> point of view.
>
> With 1000base-X, it is "auto negotiation" because the two link partners
> advertise their abilities, and resolve the operational link parameters.
> In essence, there is a negotiation between both ends.
>
> In the case of e.g. Cisco SGMII, "auto negotiation" is a total misnomer.
> There is no "negotiation". The SGMII PHY side re-purposes the 1000base-X
> inband 16-bit control word to inform the MAC about the negotiated
> speed and duplex settings, and the MAC can only say "yes thank you for
> that" back to the PHY. There is no "and this is what I'm doing" to it.
> So there's no "negotiation" in SGMII.
>
> So, I prefer using "inband signalling" because that more accurately
> describes both of these situations, whereas "auto negotiation" does
> not.
>
> Note also that whenever I see "SGMII", that means Cisco's SGMII,
> which is 1000base-X modified by Cisco, and doesn't include the IEEE
> 802.3 1000base-X.
>
> > if
> > yes it is because the PCS sgmii is connected to the external phy AN
> > and is not working between the PCS and external phy.
>
> What if the external PHY wants to use Cisco SGMII inband signalling?
This is not working with the external PHY we using (BCM54210S) and
this is why we disable the inband signalling in the PCS.
> > accessing the PCS registers is indirect. The top 13 bits (bits 21-9)
> > of the offset have to be written to Indirect Access Base register
> > bits 12:0 before indirectly accessing the target register with the
> > offset of the bottom 9 bits (8:0) of the offset
>
> I'm not sure how this connects with my email. I asked what protocol
> is used between the PCS and PHY, and I _think_ you've said that it's
> Cisco SGMII.
>
> Please give details of which PHY is being used - I'd like to know
> more about why the inband signalling isn't being used.
We are using BRCM PHY, BCM54210S.
>
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

Thanks,

Tomer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
