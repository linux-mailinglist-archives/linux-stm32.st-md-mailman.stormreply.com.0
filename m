Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD64CC1642
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 08:56:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05EECC87EDC;
	Tue, 16 Dec 2025 07:56:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AA16C87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 07:56:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso15046265e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 23:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765871767; x=1766476567;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dgLiR9L5wEhCMccIYV392PBhORkDXeC6wYlSh2crOgg=;
 b=VUj+FF9TmKaGLk7kGTtlBuMgHhtzL52hUxdizFzrgjhwQnqGUxGNfAiRqhjcEGma29
 9IiHVGK23HDbO5kcU34qml0/d9rLM9nGp4B0n0oYIAAdR0E52Ou3L50i6JGbBWE4L9vj
 3nstz7lEKemuMFONSJWaat6DFT7XENTxMuwa0pkOhLiEPRPFXrGu1CV7r/+lN9xxjCnB
 dDGXkuM9FlFM76ds8hJ22uWMcZAiMd+KaZ/XlcNySgr63kdqm2Pbe6caacQtruol7HzD
 iTB4DnNPRxH+6cccUemCTQYZf+hNaUEczZCLagcV6sBI8g1wRfQedsIGJKeQSnwYTi1z
 7TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765871767; x=1766476567;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgLiR9L5wEhCMccIYV392PBhORkDXeC6wYlSh2crOgg=;
 b=DW5wjJ2/3/fXtowq5wGatCcvwXloB+lRAm4/c1Q9F1DX3j34977IZLNcUX4h4JnpAy
 wCU26coZHgyvpcROh94ebOP/fOXwWFXd0W1t6fkY1ApOBjHL7dF25T2OUbjB0L+o7Afy
 Bp8p8gHl9aRQ+fQkQ5vDZPoQ9QVvuCSItHJjXgDcky1GWGUZ+VOGtxVoEqtFiuYMYFRB
 u8NHWEIFqSuNdp6XeR+SN2DQuxW5RMeaWgnvWxA4lJ3/YVbLQ61+rrZ9Kszse0r69ssm
 0FuvKgYshnZW6GX2VEbg/CpjTVbrJp0d6qquDI1GmOPKELAQyeaqRmZRGUCDQCiLpRhK
 HHzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWrZzsV73KBv0q+YiwxB5mKievYyP47XsmZx2nEfxUcTASDF2m+Pq8r9jL972bzdTRzxOPUoM7PPu4/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzlz3JjAr5KaghPm8lf5/TkyIuTjYhDQjcBbOnUtAGLCoLw4Tnw
 XN2w7z8AloiBErqvfONzAeiF7d/IrVGJX2gb3BJgDzmuj1UPJe6bE5aUXOqhR7kXgas=
X-Gm-Gg: AY/fxX5ySnHgVr/E/2Q/ZCMBuoK1HyfXyP+vwNv3Lw/hHFb1XXDKa75/8aCsfCcnhfL
 FT9exXGpZrX8V9dvH5YBWXJGY5+LVIog7bUwXWNP+XFAhZ2Rjp8/hZErmeK+/MgE5YiAjBfA1yZ
 48dAHb3//RoQh+UmG1PcP8Cg/51YOH2X2OgtV7dCtZ2xN4xwTgJqykIOjdkcMewHJ+Zrkabjc48
 ATtuAsmD7HAdYELMj1fjMdyPZuppxTwwQnMTb2cO541h5YG1QU4oerzhGQLPT5io5JSJI21ZMs9
 URm4DhmgscG0YuQGVB5/Hu+UtGkb7U1bZ/ZtNeoU9wZDklS/2/qpkyL58p1XWD67Au1mIJXk10Z
 ULdvlONmLD5BEZ4ZlpbmkVJkcTwTbedjrHyb8SIha65bz+Osqm6GClxdDwvJTp99v/NR6TNFOHt
 v527+Sw6cXLrvyR+0P
X-Google-Smtp-Source: AGHT+IG+piBYJp8yRE0JaiL0XBKJcrLuB82TEEFiVQtz41FJiO/E2QY1ciGNs20Cvz2Woq6tSTEwTw==
X-Received: by 2002:a05:6000:26d0:b0:430:f74d:6e9f with SMTP id
 ffacd0b85a97d-430f74d6ef6mr8155517f8f.14.1765871766545; 
 Mon, 15 Dec 2025 23:56:06 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f1fa232csm19824386f8f.6.2025.12.15.23.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 23:56:06 -0800 (PST)
Date: Tue, 16 Dec 2025 10:56:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Message-ID: <aUEQkuzSZXFs5nqr@stanley.mountain>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
 <aUBUkuLf7NHtLSl1@stanley.mountain>
 <aUBha2/xiZsIF/o5@lizhi-Precision-Tower-5810>
 <aUBrV2_Iv4oTPkC4@stanley.mountain>
 <aUB4pFEwmMBzW52T@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUB4pFEwmMBzW52T@lizhi-Precision-Tower-5810>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linaro-s32@linaro.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] s32g: Use a syscon for GPR
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

On Mon, Dec 15, 2025 at 04:07:48PM -0500, Frank Li wrote:
> On Mon, Dec 15, 2025 at 11:11:03PM +0300, Dan Carpenter wrote:
> > On Mon, Dec 15, 2025 at 02:28:43PM -0500, Frank Li wrote:
> > > On Mon, Dec 15, 2025 at 09:33:54PM +0300, Dan Carpenter wrote:
> > > > On Mon, Dec 15, 2025 at 10:56:49AM -0500, Frank Li wrote:
> > > > > On Mon, Dec 15, 2025 at 05:41:43PM +0300, Dan Carpenter wrote:
> > > > > > The s32g devices have a GPR register region which holds a number of
> > > > > > miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> > > > > > anything from there and we just add a line to the device tree to
> > > > > > access that GMAC_0_CTRL_STS register:
> > > > > >
> > > > > >                         reg = <0x4033c000 0x2000>, /* gmac IP */
> > > > > >                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > > > > >
> > > > > > We still have to maintain backwards compatibility to this format,
> > > > > > of course, but it would be better to access these through a syscon.
> > > > > > First of all, putting all the registers together is more organized
> > > > > > and shows how the hardware actually is implemented.  Secondly, in
> > > > > > some versions of this chipset those registers can only be accessed
> > > > > > via SCMI, if the registers aren't grouped together each driver will
> > > > > > have to create a whole lot of if then statements to access it via
> > > > > > IOMEM or via SCMI,
> > > > >
> > > > > Does SCMI work as regmap? syscon look likes simple, but missed abstract
> > > > > in overall.
> > > > >
> > > >
> > > > The SCMI part of this is pretty complicated and needs discussion.  It
> > > > might be that it requires a vendor extension.  Right now, the out of
> > > > tree code uses a nvmem vendor extension but that probably won't get
> > > > merged upstream.
> > > >
> > > > But in theory, it's fairly simple, you can write a regmap driver and
> > > > register it as a syscon and everything that was accessing nxp,phy-sel
> > > > accesses the same register but over SCMI.
> > >
> > > nxp,phy-sel is not standard API. Driver access raw register value. such
> > > as write 1 to offset 0x100.
> > >
> > > After change to SCMI, which may mapped to difference command. Even change
> > > to other SOC, value and offset also need be changed. It is not standilzed
> > > as what you expected.
> >
> > We're writing to an offset in a syscon.  Right now the device tree
> > says that the syscon is an MMIO syscon.  But for SCMI devices we
> > would point the phandle to a custom syscon.  The phandle and the offset
> > would stay the same, but how the syscon is implemented would change.
> 
> Your SCMI syscon driver will convert some private hard code to some
> function, such previous example's '1' as SEL_RGMII. It is hard maintained
> in long term.
> 

No, there isn't any conversion needed.  It's exactly the same as writing
to the register except it goes through SCMI.

> >
> > >
> > > >
> > > > > You still use regmap by use MMIO. /* GMAC_0_CTRL_STS */
> > > > >
> > > > > regmap = devm_regmap_init_mmio(dev, sts_offset, &regmap_config);
> > > > >
> > > >
> > > > You can use have an MMIO syscon, or you can create a custom driver
> > > > and register it as a syscon using of_syscon_register_regmap().
> > >
> > > My means is that it is not necessary to create nxp,phy-sel, especially
> > > there already have <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > >
> >
> > Right now the out of tree dwmac-s32cc.c driver does something like
> > this:
> >
> >     89          if (gmac->use_nvmem) {
> >     90                  ret = write_nvmem_cell(gmac->dev, "gmac_phy_intf_sel", intf_sel);
> >     91                  if (ret)
> >     92                          return ret;
> >     93          } else {
> >     94                  writel(intf_sel, gmac->ctrl_sts);
> >     95          }
> >
> > Which is quite complicated, but with a syscon, then it's just:
> >
> > 	regmap_write(gmac->sts_regmap, gmac->sts_offset, S32_PHY_INTF_SEL_RGMII);
> >
> > Even without SCMI, the hardware has all these registers grouped together
> > it just feels cleaner to group them together in the device tree as well.
> 
> Why not implement standard phy interface,
> phy_set_mode_ext(PHY_MODE_ETHERNET, RGMII);
> 
> For example:  drivers/pci/controller/dwc/pci-imx6.c
> 
> In legency platform, it use syscon to set some registers. It becomes mess
> when more platform added.  And it becomes hard to convert because avoid
> break compatibltiy now.
> 
> It doesn't become worse since new platforms switched to use standard
> inteface, (phy, reset ...).
> 

This happens below that layer, this is just saying where the registers
are found.  The GMAC_0_CTRL_STS is just one register in the GPR region,
most of the others are unrelated to PHY.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
