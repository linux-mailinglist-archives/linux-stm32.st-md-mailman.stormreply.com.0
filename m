Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7427F4E3F
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Nov 2023 18:23:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C180C6B479;
	Wed, 22 Nov 2023 17:23:42 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C5D8C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 17:23:40 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-da7ea62e76cso8555276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 09:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700673820; x=1701278620;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NynfojDHOku/gIHF0Vtvo3+Mk/LM+8uGwtlY48AR6MM=;
 b=KYxJ/RlgxEEXwAZXNWwd7vtW1RA8mL92dZFJHT5Z3oaN2epPFlEUzBXsBFrX6uQAYt
 OpENb2jbxXU2nnMmCcSWM/pF6479Yw6X7TqIdehK31xvFDnISBA6pT5oC9X9Tqn8dlGT
 rGnugeOTcu+LVBmjeEVHTdfj+xaJ3xRNmDyuGhGycwX2hsHDFaFtsmqDiE/T4sGogenf
 2MkDPGc+93QTB4imOo7BH11tMBP87rNbBYDE9yeKD/86Mv3pZM0+w/0NygUAz2oaQZQr
 8AGFA+t7IeHsM7U7WIFiJTF4qKU5ckm95r5gX1DrrKqxtOtegwwAskATQUyKrdUoZ1+P
 9MVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700673820; x=1701278620;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NynfojDHOku/gIHF0Vtvo3+Mk/LM+8uGwtlY48AR6MM=;
 b=bhxQToB6ZRh+B6hqTU8EA6HWcTECTi8WkPnuQKPQK6GLVBBqjtFSz1PuWHNg04RPTa
 XjEmCm7rfj6b9Kg07+NHJ5eNsjBefmaluRDRtaPWdCWL6RSsoyvd4Fr9esSutKYoGgpY
 1uQzbAA8PHzUOsQQ1WKqtpoJV5iFVf0Oy3QGU3mAGujKOwrWoTewdSenP5tBA3DLkXDh
 1s94X/StMJzS1S+3BUPF9q4zrXdi8VbXqVziebbhwyQJDbpf98rzv1wy3dfMUXfIs1d6
 IwFo9XTf7uWf+Oyv7cnOsvOZKkuZf6NHBw1d46mQPM2qm/Ps2v4vjzRpWFuYEdtGcki1
 62gw==
X-Gm-Message-State: AOJu0YxyjQKcP1bINP/7H8yl8g0bqAI8KIkegyTNy+5vXDw8rqgLTl7V
 CAGYi+vUIM3dRo4ALsMGy37x6lvXwTqPZsQL45g=
X-Google-Smtp-Source: AGHT+IHOpI5xPVk6Sar76TK2xFochhgo10/ziA9WnAM3iYe0K/JG8b7nGUI7tLK1eOpbXeUs9Wl63rjUYOi5f2szQMQ=
X-Received: by 2002:a5b:1cb:0:b0:d91:fdb:afd4 with SMTP id
 f11-20020a5b01cb000000b00d910fdbafd4mr2751108ybp.16.1700673819823; 
 Wed, 22 Nov 2023 09:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <ZVzQh9ykusyknGgP@shell.armlinux.org.uk>
In-Reply-To: <ZVzQh9ykusyknGgP@shell.armlinux.org.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 22 Nov 2023 19:23:28 +0200
Message-ID: <CAP6Zq1gzAhp9BZNX1MOozUfQc82Vi_S==on5_nOfVfpvtgnN2g@mail.gmail.com>
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

Thanks for your comments.

On Tue, 21 Nov 2023 at 17:45, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Nov 21, 2023 at 05:17:33PM +0200, Tomer Maimon wrote:
> > Add Nuvoton NPCM BMC SoCs support to STMMAC dwmac driver.
> >
> > And modify MAINTAINERS to add a new F: entry for this driver.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> A few comments on this...
>
> > +#define IND_AC_BA_REG                0x1FE
> > +#define SR_MII_CTRL          0x3E0000
> > +
> > +#define PCS_SR_MII_CTRL_REG  0x0
> > +#define PCS_SPEED_SELECT6    BIT(6)
> > +#define PCS_AN_ENABLE                BIT(12)
> > +#define PCS_SPEED_SELECT13   BIT(13)
> > +#define PCS_RST                      BIT(15)
>
> include/uapi/linux/mii.h:
>
> #define BMCR_SPEED1000          0x0040  /* MSB of Speed (1000)         */
> #define BMCR_ANENABLE           0x1000  /* Enable auto negotiation     */
> #define BMCR_SPEED100           0x2000  /* Select 100Mbps              */
> #define BMCR_RESET              0x8000  /* Reset to default state      */
>
> Look familiar? Maybe use the standard definitions for a standardised
> register?
>
> > +void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
> > +                      struct plat_stmmacenet_data *plat_dat)
> > +{
> > +     u16 val;
> > +
> > +     iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
> > +     val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > +     val |= PCS_RST;
> > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > +
> > +     while (val & PCS_RST)
> > +             val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
>
> What if the PCS never clears its reset bit? Maybe use
> read_poll_timeout() ?
>
> > +
> > +     val &= ~(PCS_AN_ENABLE);
> > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > +}
>
> Also, maybe it's time to require new stmmac platform support to start
> making use of the phylink PCS support rather than continuing to code its
> own?
>
> I notice, however, that you always disable inband signalling - please
> explain why. Also, what protocol does the PCS use when communicating
> with the PHY?
With disable inband signalling you mean disable auto negotiation? if
yes it is because the PCS sgmii is connected to the external phy AN
and is not working between the PCS and external phy.
accessing the PCS registers is indirect. The top 13 bits (bits 21-9)
of the offset have to be written to Indirect Access Base register
bits 12:0 before indirectly accessing the target register with the
offset of the bottom 9 bits (8:0) of the offset
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
