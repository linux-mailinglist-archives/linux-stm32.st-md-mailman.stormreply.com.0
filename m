Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF1CCB80AA
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Dec 2025 07:41:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3451C8F276;
	Fri, 12 Dec 2025 06:41:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1095CC5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Dec 2025 06:41:12 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso6331105e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 22:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765521672; x=1766126472;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/0dbF2KGAYM3vdkkaB9ys4HQSTDRocKJY/9bGXcOOVY=;
 b=Fxc1G431Bn/HFsdKD7txA46ktdwb0BY4ykavVo4l+xEApMXC29camz8VlSTLBv77Bp
 TU0xlzOfxvjlCM3ZFr/1wYsA8MefAgVR4vbpatp3oTYHgk9OMabgx06uCoqBGJJ7pV6n
 D0oZFWJYDh4R80C1628/mmikrzURTupQvrjZRLHVMZm3ktrHyWf900SFEIuHDEK+SCD9
 GwZQw+IPelcqpliGaVpvZjfjDlUrsAb0VjO59wyBGp/z4Rnm1yWDltrIt4v4Am4lvp80
 aPK/7ceBydNbCa2Y0ljre/1aBG9VQis7B3BwANeDckxcuteXf7a/ay+8kwRA7fiz4MsT
 VQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765521672; x=1766126472;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/0dbF2KGAYM3vdkkaB9ys4HQSTDRocKJY/9bGXcOOVY=;
 b=S4jEl+WV3KbwB42+C5kgYOtypo+1EvUDb3LFd3On5pBESwCltOvdUkk5sSKSbNiCCh
 NmGXPUi1wmKTNrnj6BZQ9jXJgO/B4z555LlbwnwPmDB633ePFor/xONA+3oEmqWzHvQo
 FWDUre+C8WPdcHEx+TmEXJfjUeq50oDZEQLQ+L8j/RWMapOsvdRb1cjlJgqsSKxQcRI3
 N3Swvx/G1X6v99OixoGKm6qCFyTCSGLshNVxibohv3pj6PySEl+F+eXTF+gRGXfDtbJs
 OYKVjGuLm/lWAIvMbHcW2g22w1//vvSpeRWFFPxX8Hw5+3FIEaWYCTgBMFIwSQ7BulZe
 BeKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq0BHOIrALW9Fq0ZDITf03v5N2JTm1dL+LCx6/wC/LzcwFBA7KlhDKW18DqWaGw07NUwjX84wlqgDzAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxmrTkVcsKuvChSYcfogfCJDsvpw5blpVweEpbiWa72MkmCwiU5
 ZOKyP9k2H9o1R5X9ChrAhhLi/hvfO/Y4TtVZPc5CgnpU4YHUQ+QvflvMbyGZwhAsGK0=
X-Gm-Gg: AY/fxX5azO6de/byuC4jfWnrhXraaYBBWJYI1cA+bO76SXJHsmNx6+wN96rh0fDqnja
 sKq/gNyBHLojz+CtVvEVpkEM9dtEUtNPPaY+wlkS6t9yrLTQ9cvP3M4SAmAMkRyNKp9K9YQ17GN
 Q1ZAYsCnPZoALOlLkk1fJ70qHvElD9otdmW17/daALlYlCnw2oqzcLh8ZqhYoXhdJA8smcIqAcH
 SYZSj81c7UFg698G6IPNFVwcPFrugHjpX2eIPHTLDQGszGbctrzwEyJYidK6JgX+ckUsCNT8HL0
 92fvsYWaHcu/dcZ7dlzS8As3ZF9zrVoRg687vxosKmzQxhMN5Zv/lPxAMehwLRpJ1Etu1mMkfoF
 BmTzA3/iXdoqvoYhWuEOWGwEeDuK/eOt/67M9gU2lY/puvmI/hy12vwnvKBt7kdf3JIiGABaM54
 09eTbvVP/Bh4LIOa1F
X-Google-Smtp-Source: AGHT+IF5qezNkUaAJ9catHYZZtFdsT9KvXk7hbPAPFs0cPAp04mHo7MQ82wa12a1D0dIkmm73s4oQQ==
X-Received: by 2002:a05:600c:470b:b0:479:2a09:9262 with SMTP id
 5b1f17b1804b1-47a8f8c00d1mr7099105e9.9.1765521672165; 
 Thu, 11 Dec 2025 22:41:12 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f3a1b17sm5503315e9.2.2025.12.11.22.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 22:41:11 -0800 (PST)
Date: Fri, 12 Dec 2025 09:41:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aTu5BB0pMfgzIodh@stanley.mountain>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
 <6275e666a7ef78bd4c758d3f7f6fb6f30407393e.1764592300.git.dan.carpenter@linaro.org>
 <aS3GzJljbfp2xJmW@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aS3GzJljbfp2xJmW@shell.armlinux.org.uk>
Cc: s32@nxp.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linaro-s32@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] net: stmmac: s32: use the syscon
 interface PHY_INTF_SEL_RGMII
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

On Mon, Dec 01, 2025 at 04:48:12PM +0000, Russell King (Oracle) wrote:
> On Mon, Dec 01, 2025 at 04:08:20PM +0300, Dan Carpenter wrote:
> > On the s32 chipset the GMAC_0_CTRL_STS register is in GPR region.
> > Originally, accessing this register was done in a sort of ad-hoc way,
> > but we want to use the syscon interface to do it.
> > 
> > This is a little bit uglier because we to maintain backwards compatibility
> > to the old device trees so we have to support both ways to access this
> > register.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
> >  1 file changed, 18 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > index 5a485ee98fa7..20de761b7d28 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > @@ -11,12 +11,14 @@
> >  #include <linux/device.h>
> >  #include <linux/ethtool.h>
> >  #include <linux/io.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of_mdio.h>
> >  #include <linux/of_address.h>
> >  #include <linux/phy.h>
> >  #include <linux/phylink.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> >  #include <linux/stmmac.h>
> >  
> >  #include "stmmac_platform.h"
> > @@ -32,6 +34,8 @@
> >  struct s32_priv_data {
> >  	void __iomem *ioaddr;
> >  	void __iomem *ctrl_sts;
> > +	struct regmap *sts_regmap;
> > +	unsigned int sts_offset;
> >  	struct device *dev;
> >  	phy_interface_t *intf_mode;
> >  	struct clk *tx_clk;
> > @@ -40,7 +44,10 @@ struct s32_priv_data {
> >  
> >  static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
> >  {
> > -	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> > +	if (gmac->ctrl_sts)
> > +		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> > +	else
> > +		regmap_write(gmac->sts_regmap, gmac->sts_offset, PHY_INTF_SEL_RGMII);
> 
> Sorry, but even if that regmap_write() is targetting the exact same
> register, these are not identical.
> 
> S32_PHY_INTF_SEL_RGMII, which is a S32-specific value, takes the value 2.
> PHY_INTF_SEL_RGMII is the dwmac specific value, and takes the value 1.
> 
> If this targets the same register, then by writing PHY_INTF_SEL_RGMII,
> you are in effect writing the equivalent of S32_PHY_INTF_SEL_SGMII to
> it. This seems like a bug.
> 

Yeah.  Sorry, I forward ported this, then back ported it, then forward
ported this again and I messed up.  :(

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
