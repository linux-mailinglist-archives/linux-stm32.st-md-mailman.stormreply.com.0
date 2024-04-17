Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8448A83E2
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 15:12:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05936C6B444;
	Wed, 17 Apr 2024 13:12:02 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F1C3C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 13:12:00 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2da63269e75so41703571fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713359519; x=1713964319;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xvq5XhFeUgxKjTzR6bSBfVpoXUJWQ7jeCb714ZUuuUI=;
 b=NHmb2xS21irmJ84TkIf8VaMSjMSr6iI5XYpnpaeAXMolO01WFFasTNzh4DW5lOVOO9
 5GHucqOf4hYCW08XL8Yv+7SBWgTIA6Ti7OHV5Ob3CB98taZyREsnIG5jmlxcgZuN3oob
 vfZK21V/R3GRLUCqhdmSxrpHMUB84y93Rr8Pb1T2X7tEgYFk3zHDMlZQp4v5vLwB4PWy
 3wNWfrMdC7Dtd75CME3GpkGKYSnBY2ji565i48Ro0j/jYo4L2YYFii+fjfTvuo+Q+rPN
 xwIyxqsKVyZno3YgFZP0zbvJ0IyClbyaSYfWlNFxOpSYYPo6ref0H3Ot2+kTHTgrzN9a
 E2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713359519; x=1713964319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xvq5XhFeUgxKjTzR6bSBfVpoXUJWQ7jeCb714ZUuuUI=;
 b=EEYuZ4KdXS9mhG/x7EWuQcRYhUn1DF0xlMi4yZRpTUPwWtmrpUddgYiZs6Bu4Oj/vh
 vznhmEyEdPK3NVMEIRpBTa7JVAN4OP2cg1/ZluHASh8eLuXzdbVRnbvBpXjfgCFKQM93
 kKTB1IBv1XYqRqkjxRHpRHGR6q6ogMv3UbKuj13pov+11FHq/Y0aIfewCEebUy30DldO
 +f0hnGQAX0tYYyjs0AFkNtxOjuAKLOP2vhmHpd7cg3jhIvRFYCOw1fplMwMee7R7ad7r
 tJdDKaUZKHYKtUgRVjHOcqsFyc4h6gYQaneZHYit5CH9V6gMCjA8TBhelYIfJ1S93LwO
 Sq/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPpa2LbNU+uj1BOcSM9QcsdKjPjJNfgFKzRQp7ux4XjZ0EoJQhUyfzh3yzWkxo1BKPGXI6d0OP/fbH8tsOWk1tZvvGYR7KnmcDJqSKiFGZqZd0DtQmh/0P
X-Gm-Message-State: AOJu0Ywra1pl00SDTn/gzIQTQPZkbm+XEPhWVn8T921vYqEWYYmJIlkW
 ZokqPJ0qNdwf2pRNuR8XhR+sVTmPZZLhXIlxENQZMFk7yDOJLi+n
X-Google-Smtp-Source: AGHT+IHdGh0cJoN5BQEheZbFU09X48BOOMw+EqWuSPIB0M7jeLokHHm06r2P5q8vQRJCzBR50C7lPg==
X-Received: by 2002:a2e:9657:0:b0:2db:4f3f:55a7 with SMTP id
 z23-20020a2e9657000000b002db4f3f55a7mr655852ljh.45.1713359519045; 
 Wed, 17 Apr 2024 06:11:59 -0700 (PDT)
Received: from mobilestation.baikal.int (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a2e8456000000b002da25e60918sm1389162ljh.18.2024.04.17.06.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 06:11:58 -0700 (PDT)
Date: Wed, 17 Apr 2024 16:11:56 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <abgmcmebzv5323wmumurygggeho2mbyf2l24fe42c6zvvueutc@w7zpxqndlqox>
References: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
 <20240415-rzn1-gmac1-v3-2-ab12f2c4401d@bootlin.com>
 <42chuecdt7dpgm6fcrtt2crifvv5hflmtnmdrw5fvk3r7pwjgu@hlcv56dbeosf>
 <77722ced-4956-0e70-9492-c7b2e8557253@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77722ced-4956-0e70-9492-c7b2e8557253@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/5] net: stmmac: introduce
 pcs_init/pcs_exit stmmac operations
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

On Wed, Apr 17, 2024 at 11:30:09AM +0200, Romain Gantois wrote:
> Hi Serge,
> 
> On Tue, 16 Apr 2024, Serge Semin wrote:
> 
> > I am currently working on my Memory-mapped DW XPCS patchset cooking:
> > https://lore.kernel.org/netdev/20231205103559.9605-1-fancer.lancer@gmail.com/
> > The changes in this series seems to intersect to what is/will be
> > introduced in my patchset. In particular as before I am going to
> > use the "pcs-handle" property for getting the XPCS node. If so what
> > about collecting PCS-related things in a single place. Like this:
> > 
> > int stmmac_xpcs_setup(struct net_device *ndev)
> > {
> > 	...
> > 
> > 	if (priv->plat->pcs_init) {
> > 		return priv->plat->pcs_init(priv); /* Romain' part */
> >	} else if (fwnode_property_present(priv->plat->port_node, "pcs-handle")) {
> > 		/* My DW XPCS part */
> > 	} else if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
> > 		/* Currently implemented procedure */
> > 	}
> > 
> > 	...
> > }
> 
> That seems like a good idea to me, although those setup functions would have to 
> be renamed to stmmac_pcs_setup/exit.

Why not, seeing they will be responsible for any PCS attached to the
MAC.

-Serge(y)

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
