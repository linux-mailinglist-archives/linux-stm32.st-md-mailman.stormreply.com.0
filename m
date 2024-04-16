Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 475F98A69BA
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 13:38:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04072C6B45B;
	Tue, 16 Apr 2024 11:38:33 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8C21C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 11:38:31 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5193363d255so203908e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713267511; x=1713872311;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3imXpN/x1JQtEA6zkUwudIXWS06IjOEYxP3aQIvEud0=;
 b=KxyCOgavHYxbkgfY/Tqm0Igjbktno52y6w/g9RVZJd0jBjnBn5qkz0TbLyIMDuOAOR
 CYWcCGsk40rHzcMS53/voU7Ztuw9ZduLBRXsxgCFp9/YTYEo4JyjQUThGwtuOGOkCIhi
 ptv4GBGwL2ar6XMuRXEfhFIOTFkKTthOJt8NGLdxUpZVrftSK9xuJLV65hs9awOFV36G
 xv5c4RL3SM90sLZv+8MDUu1FWO2NX11pRUG+KWkzpvHMajjWoKdPZzwss69n8u2A8/pq
 Foz5XDCs0LOV5QksISwzeUcVdvOHMvowH6V1F9VVzKas/6S5cfQaDlTXcygHiakEHLm6
 i9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713267511; x=1713872311;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3imXpN/x1JQtEA6zkUwudIXWS06IjOEYxP3aQIvEud0=;
 b=np9fpyYIS4r7GhsD0NVjH+r6ZwXjVD28PH8YMNhPbbSBdBG7lzieAUoFCbq2j6UkJr
 913JaduIMY3OG5xAfN/gdKm5jc70tU9oa9YwLIetdPz3eLMR18eKf5gM/x8bgd8Dkjil
 TEf2ccfDXVLt74WqAd/1yMk0ao5RoICZq1ji7auwmQQLGXHCkfx2MgRpZAAwevbXbiLI
 98NxiPake74+vCwSL1Zq0wXaLBye6lm7EmIQE1YR8M0LSXYNESGrFNlQ0/uC0eoDovEC
 0P/3CHXznSGWG90NM4B0+y0ncdHVbe3xYb6Rs+C/JHeMVfhdNY9ZjFfJ0KskAnnRuykl
 gQFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4DllZ6p/j1gCGvCuE/anhKpyeQLYehH9Nbzs6R2xZyz3h5n6d17fU5uXRlF3rUSCueOqJHQ9qx4YAHk0l4XZo6vB/7z1sIrVte1+Io05JanFEqxv3Z271
X-Gm-Message-State: AOJu0YxnHcig7GU7yFEVSYnJxUsggLE1tm9z+vj+q3X5scd0X22UDhdW
 cnxndEYUFu4DxGViq0e8iqSUA0t8jkymHZnSvzK8Znaopev3YEkD
X-Google-Smtp-Source: AGHT+IFsv1t50cVsn9xtvOjs4g4KFGJI0LdCIc6Wa6MGsoQY1SUEtRqNz2Pjjzjb2zJlDyUmdLuf3A==
X-Received: by 2002:ac2:528c:0:b0:518:7e4a:2035 with SMTP id
 q12-20020ac2528c000000b005187e4a2035mr7410480lfm.45.1713267510734; 
 Tue, 16 Apr 2024 04:38:30 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
 by smtp.gmail.com with ESMTPSA id
 bp22-20020a056512159600b00518e96b85b0sm568727lfb.234.2024.04.16.04.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 04:38:30 -0700 (PDT)
Date: Tue, 16 Apr 2024 14:38:28 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <btgxb3ugs4apjvxj5hmpec3rtoxwdal7ms2z4s7pecdfefphiw@gd7ctqsh7wg2>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
 <20240412180340.7965-5-fancer.lancer@gmail.com>
 <714199e5-edf2-dcbb-216b-563431d70488@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <714199e5-edf2-dcbb-216b-563431d70488@bootlin.com>
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: Move MAC caps
 init to phylink MAC caps getter
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

Hi Romain

On Tue, Apr 16, 2024 at 09:56:32AM +0200, Romain Gantois wrote:
> Hi Serge,
> 
> On Fri, 12 Apr 2024, Serge Semin wrote:
> 
> > +static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
> > +					 phy_interface_t interface)
> > +{
> > +	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
> > +
> > +	/* Get the MAC-specific capabilities */
> > +	stmmac_mac_phylink_get_caps(priv);
> 
> This is a bit of a nitpick, but the terminology is quite confusing between 
> stmmac_mac_phylink_get_caps() and stmmac_mac_get_caps().

Right, the naming turns to be ambiguous "a bit".)

> Ideally, we could just 
> get rid of the whole stmmac_do_void_callback() complexity and just call 
> phylink_get_caps() directly.

No, this isn't a good solution. The local coding convention implies
using the macro-functions implemented to execute the callbacks. We
can't use the macros everywhere but in this place.

> In the meantime, maybe renaming this to 
> stmmac_mac_core_get_caps() would be acceptable?

The name was selected to align with the rest of the PHYLINK callbacks:

static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
        .mac_get_caps = stmmac_mac_get_caps,
        .mac_select_pcs = stmmac_mac_select_pcs,
        .mac_config = stmmac_mac_config,
        .mac_link_down = stmmac_mac_link_down,
        .mac_link_up = stmmac_mac_link_up,
};

So I don't think that changing it to something different would be a
good alternative. What could be a better option is to rename the
stmmac_ops::phylink_get_caps() callback and
stmmac_mac_phylink_get_caps() macro-function to something like:

stmmac_ops::link_update_caps()
stmmac_mac_link_update_caps()

especially seeing the callback no longer sets the phylink MAC
capabilities directly. What do you think?

-Serge(y)

> 
> Please let me know what you think.
> 
> Thanks,
> 
> -- 
> Romain Gantois, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
