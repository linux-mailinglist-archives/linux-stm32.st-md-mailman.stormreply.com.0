Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 110697F60C8
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 14:50:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2254C6B476;
	Thu, 23 Nov 2023 13:50:28 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42A2BC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 13:50:27 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-da37522a363so891790276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 05:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700747426; x=1701352226;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6HDmUWHoV/d+5kwt+BMpRMCcQ4EU+NPmBrVnqKEpBkk=;
 b=DsJfeVS+J7q27HJcUtmW50Mld4MONFIfPlidwnlScALlljSwRx04c4qt8oxUeBx7Is
 gW4p545I8ycbZqAMVGoxPcF9Bu/V3E5Yghxy3DNY4AVLaT2rrCzaC8zKd1sf81dyPv11
 IDAOi8hokpL6Ede9BEd/wQ/EDoBmmVhDrUJo2ZDG3ykVZQpgeTvoh+ipgnRTjobC26qr
 zKh9CfzJqgR083qzjH12t2VToQjgzk7Df3Bqb0cn0hzhXH10wCdBhqWT5XPQYZ1RKMNO
 /oND1C071PddSp3PPfiSjqfeUgEjM/Hq4/AyMsWTQ3o9/Hm1XZ53hpyGdyrnkE4oA8ZZ
 A08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700747426; x=1701352226;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6HDmUWHoV/d+5kwt+BMpRMCcQ4EU+NPmBrVnqKEpBkk=;
 b=vyovd8ugoWkjz9ugQvIswX8K2jyLYQHSTc4RG3QaC4lYKEEjCU7UJ+cGEBX7zk+AX/
 k/n9YzuuYwFE60r9jv8LCmKZud4/CO7sC4C3eIpGkIUu/DM7vzCqZzaaaL0Wa5DRGz4o
 7/zjreRzMVT2MXxSnG6Y2GD/A97EgXPAUGf4hta2Rd7mQ2ADI85EDFZ2ENC6rClaXSBw
 YOLI8t6w8Fmn346ruV20+TaSIS2s9HnL3t+jOuk168cnu2+5C51nb57J1icwpZLDGsf4
 JKTlEJ9AcNAbvdDR0/ANJZ+yLPZBAysuTn87LVkyAngRvOJl8gpYKKJ42scRntF8Y3PH
 qdyA==
X-Gm-Message-State: AOJu0YzZtG9VuFYFmpCG1H2k0U6Mg1Xhlh/Eubjrh3OZADCFbr1dgU/c
 IvuOyCjKKwc3q+kp3XzXP3eZP6m6PYx33FStbiU=
X-Google-Smtp-Source: AGHT+IGZwjwRkgSJ7EnlxLUgRSgKWDT8jC/rPzRQg0Kq3WiN+CVcYva0UFJf/nOdcGZASDUiq8QSYhmkdlzne0lzNs4=
X-Received: by 2002:a25:3409:0:b0:da0:3535:41f4 with SMTP id
 b9-20020a253409000000b00da0353541f4mr5712007yba.7.1700747426043; Thu, 23 Nov
 2023 05:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
 <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
In-Reply-To: <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 23 Nov 2023 15:50:14 +0200
Message-ID: <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
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

On Wed, 22 Nov 2023 at 20:45, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Nov 22, 2023 at 07:50:57PM +0200, Tomer Maimon wrote:
> > Hi Andrew,
> >
> > Thanks for your comments
> >
> > On Tue, 21 Nov 2023 at 18:42, Andrew Lunn <andrew@lunn.ch> wrote:
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
> > > > +
> > > > +     val &= ~(PCS_AN_ENABLE);
> > > > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > > > +}
> > >
> > > Is this a licensed PCS implementation? Or home grown? If its been
> > > licensed from somebody, it maybe should live in driver/net/pcs, so
> > > others can reuse it when they license the same core.
>
> > we are using DWC PCS, I don't see support for DWC PCS and I am not
> > sure it is supposed to be supported at /drivers/net/pcs
>
> I've not followed the naming used by Synopsys. Is DWC PCS the same as
> XPCS? Does Synopsys have multiple PCS implementations?
>
> > I do see a patch set to support DWC PCS but I don't think it answers my needs
> > https://patchwork.ozlabs.org/project/netdev/patch/1559674736-2190-3-git-send-email-weifeng.voon@intel.com/
>
> I _think_ this patch eventually got turned into
> driver/net/pcs/pcs-xpcs.c
>
> What exactly does it not do for you?
Thanks for pointing me to Synopsys (DWC) PCS in pcs-xpcs.c I need to
check if the driver follows all our SGMII needs
>
>      Andrew

Best regards,

Tomer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
