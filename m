Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A4FCBFAE9
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 21:11:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4F3CC35E3C;
	Mon, 15 Dec 2025 20:11:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFFB6C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 20:11:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso42435935e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 12:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765829468; x=1766434268;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NVHWp8cheEcClOBV4c/zxK94NkQEphirpcQRQ+Yuj0w=;
 b=BaTxAMo92cIDGgoBIPVRI0t4WEPxtOiqWSoA9D39wn9GjAbiOShMtPFPThxRy9DcH4
 IiElw0W5qftUvuRF+oWd8hXQ9tYEuV7aHWevC8+OfeqNpJ7DBVhnkJ6X/64go6KUonJp
 A6/sTUwrn+5PXUQMRQl0+7qnFQs466zROPtlIEZo1iTaBE/SmwK8GApM5Nkhm7zw9elm
 puUiXK2TCy0ku98xxo3C9RZp9qWmt/yjs1e4jjq30qvtVY8JEHHrq/wGq3zBYmj4BuVi
 79L/Hu90qW3hAi31pODoQl7gxQd4vzYljwyEVyoUQXIE6yDq4m86XLum9gb0c9JGD6Yd
 rqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765829468; x=1766434268;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVHWp8cheEcClOBV4c/zxK94NkQEphirpcQRQ+Yuj0w=;
 b=kxowypNdd7zUXJZvw1+/4JyBqqYqFHXCev8+H/nXz5Ou8PGSF3he7CHdNjtq2BYUgO
 6ffUAxqnwBonRaXM0ah7wRnutcEuA+GIdevG7FA/FB3yw1J2Q4TFbtL/6T0j0MbY0u9I
 N7NaPu5QIve1nuVgCd8HlXnvr+Wl2GC+Qh8hFbU4JPoNxUeCBy/4C0c79a992Ew/V3xH
 SqJBA9ZzEbUF4LxXEDnhbC7G1DaqO0bZxJU8mlkMBjStjlZgdRBkBchuUI3i+fe8KK+J
 6EQ+sv0blyc/Bu5iq65ObqpUK8y9R7biQnL6pgdbH0fArkAnwaYojiiWL+SDbalgR+c/
 y06Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9PG6jYJ+53UEzJCXvKS41QvpF6vfoJQ4J4GEjjxrvgCcdIfTFlZ5gcO/woxgPJOsxn//WcLU+e19g4g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9/8enoHAnJyErA4ICwhw+xglwiW/hcyoepXH8OQq5yYYNT4Kl
 gi64PZ7X+rriMt/Fpfy4PrJNIzcCEmCyx5CjbgDHGY8ci71sisNHnHLjBd3/4EkPKIU=
X-Gm-Gg: AY/fxX7TdjVLveGBQnPHNnOjwZweKNILooW5tXox/sFR2ORlOKm0lmgiCEC09rS09By
 DV+p45HGjhOcDv2R/DlaQMevaSvYDPDA/UJS4b0GbZIt+DKNtecL0zNrkoDHF22zfYCeoFM129t
 ulFq2CLcQANyuB4uwYGuY/U4SqiKIO77+hLVZJZSDtH01MbiEx/ECUjfWJzGk+rAD9VBFq03/J0
 hu7wxScu+LdIwPDD8EZSZY7l6evXsKVcIWMHvSo7ftdDwyzOkqcvRyrj6sd0BEB+pwRloY5UT2M
 yBkaA2yaw2rK1f8z7fQ3N7fl836taVMDza6rdsgdf11dFEcVKRvrZhDC/1A077st2rJgedkhYnB
 OJ3jjE9+eRCd0u5rj5Q5MGDBR1AZ9TJdqn6MX5O8Nm8mC/ci3TbyXM+M/Z5n7Khkul1UMPt00oe
 DTocSmsNhSkbp/HiE/
X-Google-Smtp-Source: AGHT+IFzTdgd8HuBCRpheWEKJMhw6vXCy8KxXaScp0+GwrnVXW68cCuyCfDLEuzw7wX+ZV30A2XRQg==
X-Received: by 2002:a05:600c:46c4:b0:46e:59bd:f7d3 with SMTP id
 5b1f17b1804b1-47a8f9046fcmr137755605e9.20.1765829468100; 
 Mon, 15 Dec 2025 12:11:08 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4ace61sm200864155e9.7.2025.12.15.12.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 12:11:07 -0800 (PST)
Date: Mon, 15 Dec 2025 23:11:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Message-ID: <aUBrV2_Iv4oTPkC4@stanley.mountain>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
 <aUBUkuLf7NHtLSl1@stanley.mountain>
 <aUBha2/xiZsIF/o5@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUBha2/xiZsIF/o5@lizhi-Precision-Tower-5810>
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

On Mon, Dec 15, 2025 at 02:28:43PM -0500, Frank Li wrote:
> On Mon, Dec 15, 2025 at 09:33:54PM +0300, Dan Carpenter wrote:
> > On Mon, Dec 15, 2025 at 10:56:49AM -0500, Frank Li wrote:
> > > On Mon, Dec 15, 2025 at 05:41:43PM +0300, Dan Carpenter wrote:
> > > > The s32g devices have a GPR register region which holds a number of
> > > > miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> > > > anything from there and we just add a line to the device tree to
> > > > access that GMAC_0_CTRL_STS register:
> > > >
> > > >                         reg = <0x4033c000 0x2000>, /* gmac IP */
> > > >                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > > >
> > > > We still have to maintain backwards compatibility to this format,
> > > > of course, but it would be better to access these through a syscon.
> > > > First of all, putting all the registers together is more organized
> > > > and shows how the hardware actually is implemented.  Secondly, in
> > > > some versions of this chipset those registers can only be accessed
> > > > via SCMI, if the registers aren't grouped together each driver will
> > > > have to create a whole lot of if then statements to access it via
> > > > IOMEM or via SCMI,
> > >
> > > Does SCMI work as regmap? syscon look likes simple, but missed abstract
> > > in overall.
> > >
> >
> > The SCMI part of this is pretty complicated and needs discussion.  It
> > might be that it requires a vendor extension.  Right now, the out of
> > tree code uses a nvmem vendor extension but that probably won't get
> > merged upstream.
> >
> > But in theory, it's fairly simple, you can write a regmap driver and
> > register it as a syscon and everything that was accessing nxp,phy-sel
> > accesses the same register but over SCMI.
> 
> nxp,phy-sel is not standard API. Driver access raw register value. such
> as write 1 to offset 0x100.
> 
> After change to SCMI, which may mapped to difference command. Even change
> to other SOC, value and offset also need be changed. It is not standilzed
> as what you expected.

We're writing to an offset in a syscon.  Right now the device tree
says that the syscon is an MMIO syscon.  But for SCMI devices we
would point the phandle to a custom syscon.  The phandle and the offset
would stay the same, but how the syscon is implemented would change.

> 
> >
> > > You still use regmap by use MMIO. /* GMAC_0_CTRL_STS */
> > >
> > > regmap = devm_regmap_init_mmio(dev, sts_offset, &regmap_config);
> > >
> >
> > You can use have an MMIO syscon, or you can create a custom driver
> > and register it as a syscon using of_syscon_register_regmap().
> 
> My means is that it is not necessary to create nxp,phy-sel, especially
> there already have <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> 

Right now the out of tree dwmac-s32cc.c driver does something like
this:

    89          if (gmac->use_nvmem) {
    90                  ret = write_nvmem_cell(gmac->dev, "gmac_phy_intf_sel", intf_sel);
    91                  if (ret)
    92                          return ret;
    93          } else {
    94                  writel(intf_sel, gmac->ctrl_sts);
    95          }

Which is quite complicated, but with a syscon, then it's just:

	regmap_write(gmac->sts_regmap, gmac->sts_offset, S32_PHY_INTF_SEL_RGMII);

Even without SCMI, the hardware has all these registers grouped together
it just feels cleaner to group them together in the device tree as well.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
