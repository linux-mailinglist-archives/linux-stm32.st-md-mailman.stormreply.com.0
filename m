Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD439874C0
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2024 15:50:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2941C6DD72;
	Thu, 26 Sep 2024 13:50:04 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A449DCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 13:49:57 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a8d1a00e0d0so13615966b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727358597; x=1727963397;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7+zzLjRllKvgaQXPsb5e4jFYVKK2ubkPN9j82GqItdI=;
 b=HDPxtcxMoxTfpLE7l1otEBcoS4d8+62iVEJoalFnYVU+hh2d1R/rm83Ezr4VpgD/21
 7oUzkjVMZeS7ds5zhbhiM0creU46SUalSgZ4e9mFSftmKhKdrRzo4K8YFw4wrLu1UIpb
 SOnRWNdP68YCbqXbBOqLbOpb7XW6vYMuGnDoP8N+bVoo6BzQTdom76FbkyjmQOmYL5da
 SHnhhBva3V7N3ii+GPJxpSb9l19iHpyFHTysoW9pm/CjY3dU0cxyGLORhX6l4UoI5TNI
 lJNEu2I2iTWdqc8LO8sFxBBuhpMtxXd9fX4OnsxYpjJ8gwjzMZf1RTn3VigzeKTtuqxD
 0oYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727358597; x=1727963397;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+zzLjRllKvgaQXPsb5e4jFYVKK2ubkPN9j82GqItdI=;
 b=T7g0J5M1f58sfh8xf59Oc+AiPpOS5k97rvWTIAGRTlGmppgSDZEbf2R0L2d6YNkCcu
 Sz9CCHchwe88Wa/9hn8pRuAfmKrD4b2PNP4sTIc+pVhWazrSQ/W90D8prJWAfd0qMIHp
 qIPYRXpVqdwnCPkXg0dh3QNpgreSXoDmFHXAslRpArZILn/fG3YiKPPczvUplGxRZ2Vc
 4hbBkT8gV1jcT5Cp0KIwvAGdBQEAJ3BQR2p6qghcIxqSKzWSbruGyim2vlQDfv7Q1Bz9
 3bKBvgSL2GRTJM8rSb/QClV2W6efXJdItUg3X34mLlW961HjWugFzefM0vQbThQvaQqx
 S6ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3+1Hz3q0ZArk6yUwfFD43CajQtpr1zGb1qVboR+secrpEzLbE+iMa5Tw6P9LKXxYUtQTQWkeQquDpuA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxfMW5TBZn4UbiV02UiiyWE3ZqRCeeZvSNLUwuRt4MIV/kF3I32
 7tAEeTszK7xNKglUL5/LNDZD7hTzUMNHSturjBE4htFxT1rF1ZUW
X-Google-Smtp-Source: AGHT+IFpnlRuaodvuzoE0X+W5IOt9tpTDOpsyXF7kzVQoQXrBi+0dHlWnNst0pRaJ2gCgm9xWycbmA==
X-Received: by 2002:a17:906:d550:b0:a8a:9054:8396 with SMTP id
 a640c23a62f3a-a93b267b48fmr114945166b.7.1727358596598; 
 Thu, 26 Sep 2024 06:49:56 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f79c3sm359701666b.176.2024.09.26.06.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 06:49:55 -0700 (PDT)
Date: Thu, 26 Sep 2024 16:49:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20240926134952.atabwkzfal44r3lk@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <20240925134337.y7s72tdomvpcehsu@skbuf>
 <ZvVIZ8cp4T/wO5Kh@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZvVIZ8cp4T/wO5Kh@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC 00/10] net: pcs: xpcs: cleanups batch 1
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

On Thu, Sep 26, 2024 at 12:41:27PM +0100, Russell King (Oracle) wrote:
> On Wed, Sep 25, 2024 at 04:43:37PM +0300, Vladimir Oltean wrote:
> > Hi Russell,
> > 
> > On Mon, Sep 23, 2024 at 03:00:26PM +0100, Russell King (Oracle) wrote:
> > > First, sorry for the bland series subject - this is the first in a
> > > number of cleanup series to the XPCS driver.
> > 
> > I presume you intend to remove the rest of the exported xpcs functions
> > as well, in further "batches". Could you share in advance some details
> > about what you plan to do with xpcs_get_an_mode() as used in stmmac?
> 
> I've been concentrating more on the sja1105 and wangxun users with this
> cleanup, as changing stmmac is going to be quite painful - so I've left
> this as something for the future. stmmac already stores a phylink_pcs
> pointer, but we can't re-use that for XPCS because stmmac needs to know
> that it's an XPCS vs some other PCS due to the direct calls such as
> xpcs_get_an_mode() and xpcs_config_eee().
> 
> When I was working on EEE support at phylink level, I did try to figure
> out what xpcs_config_eee() is all about, what it's trying to do, why,
> and how it would fit into any phylink-based EEE scheme, but I never got
> very far with that due to lack of documentation.
> 
> So, at the moment I have no plans to touch the prototypes of
> xpcs_get_an_mode(), xpcs_config_eee() nor xpcs_get_interfaces(). With
> the entire patch series being so large already, I'm in no hurry to add
> patches for this - which would need yet more work on stmmac that I'm
> no longer willing to do.

Ok, but I guess that the (very) long-term plan still is that direct
calls from the MAC driver into symbols exported by the PCS are no longer
going to be a thing, right?

> > 	if (xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73))
> > 
> > I'm interested because I actually have some downstream NXP patches which
> > introduce an entirely new MLO_AN_C73 negotiating mode in phylink (though
> > they don't convert XPCS to it, sadly). Just wondering where this is going
> > in your view.
> 
> To give a flavour of what remains:
> 
> net: pcs: xpcs: move Wangxun VR_XS_PCS_DIG_CTRL1 configuration
> net: pcs: xpcs: correctly place DW_VR_MII_DIG_CTRL1_2G5_EN
> net: pcs: xpcs: use dev_*() to print messages
> net: pcs: xpcs: convert to use read_poll_timeout()
> net: pcs: xpcs: add _modify() accessors
> net: pcs: xpcs: use FIELD_PREP() and FIELD_GET()
> net: pcs: xpcs: convert to use linkmode_adv_to_c73()
> net: pcs: xpcs: add xpcs_linkmode_supported()
> net: mdio: add linkmode_adv_to_c73()
> net: pcs: xpcs: move searching ID list out of line
> net: pcs: xpcs: rename xpcs_get_id()
> net: pcs: xpcs: move definition of struct dw_xpcs to private header
> net: pcs: xpcs: provide a helper to get the phylink pcs given xpcs
> net: pcs: xpcs: pass xpcs instead of xpcs->id to xpcs_find_compat()
> net: pcs: xpcs: don't use array for interface
> net: pcs: xpcs: remove dw_xpcs_compat enum
> 
> which looks like this on the diffstat:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |   2 +-
>  drivers/net/pcs/pcs-xpcs-nxp.c                    |  24 +-
>  drivers/net/pcs/pcs-xpcs-wx.c                     |  51 +--
>  drivers/net/pcs/pcs-xpcs.c                        | 521 +++++++++-------------
>  drivers/net/pcs/pcs-xpcs.h                        |  42 +-
>  include/linux/mdio.h                              |  40 ++
>  include/linux/pcs/pcs-xpcs.h                      |  19 +-
>  7 files changed, 303 insertions(+), 396 deletions(-)

Ok, I don't see anything major on the clause 73 autoneg front. Which I
guess is good? (because at least there aren't competing ideas in flight
about phylink's role for this operating mode)

The bad part is that some user-visible functional changes in xpcs will
most likely be in order. So will probably not be able to be converted
without someone with both access to the 10G hardware and the motivation
to do so (and this might make the conversion unreachable for me too).

For example, without having seen the content of your patch list,
I can only assume linkmode_adv_to_c73() is based on the ethtool
link modes that _xpcs_config_aneg_c73(), mii_c73_mod_linkmode() and
phylink_c73_priority_resolution[] treat.

But I'm already objecting that 2500baseX shouldn't be in those tables.
There should have been a new 2500base-KX ethtool mode, which is one
of the amendments to 802.3-2018 called 802.3cb-2018.

I also have other objections to XPCS's implementation of C73, but I
don't think this is the right context to point them all out. The gist
is that at least for this area, I don't think it would be a good idea
at all to base core phylink support based on what XPCS has/does.

I guess what I'm saying is that taking a break from stmmac until the
groundwork in the core has been laid out through some other vector also
seems like the best idea to me.

Would you be interested in seeing an alternative implementation of
clause 73 support (for the Lynx PCS), this time centered around phylink_pcs,
even if it doesn't touch stmmac/xpcs? As a side effect of that work, it
would maybe provide a long-term avenue of avoiding the xpcs_get_interfaces()
and xpcs_get_an_mode() direct calls, as well as a more consolidated
framework for C73 in XPCS to be reimplemented by somebody. (warning,
this implementation will be quite large, so the question is also about
your time/energy availability in the near future).
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
