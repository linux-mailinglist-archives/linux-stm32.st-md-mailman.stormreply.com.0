Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C51298FB044
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 12:47:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F2BAC6DD67;
	Tue,  4 Jun 2024 10:47:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C051FC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 10:47:00 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52961b77655so900221e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Jun 2024 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717498020; x=1718102820;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i5WLooy2A7mlEfBwUMQTaBlwD5VzPh4lOZOOGWiXZ1k=;
 b=GhBfcTzUR7KhUVjDz8DVTXLNlQ4z2JlqmPteNPT1R8R8cmgv0VyfbfJ0MkrNTU3Qbq
 Sb/NxdS6GeKQ03RM62wwdgFoApvDzc8pgNQJjtNqYyhJC6+MH9aKe17NQ1VBpREST1AI
 AAEVIxg/xMxqa6qb4s4f1LRPXpZe6S6MJX4bPFEZciqXVZGzUh5Ha6WTs/TcA8sG2t4y
 QUlUMcTuHSU/9YCivvs0wOW/G58vwfcf0qCzMlc1UqmlGq4YQfWM68uezsk7RiVg7Lza
 BY2NkmVxT5D9RoNstlk5An17i24zE1r7qcLXQ+N+eSg+6+zpYGSg6wIliaCQxSlZ2ub3
 fWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717498020; x=1718102820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5WLooy2A7mlEfBwUMQTaBlwD5VzPh4lOZOOGWiXZ1k=;
 b=W3GzKKf2XPXnzpYljvM362xo7lTxLkjawOgQcw/x3RkqiRc2zZKbnB/PBZee5XaEnf
 sqE6L0Zr4JWTC/+/5jXuAjhZC8FdKCq/fCdvzmKpBbiGpYlVIoiiY7lbCMkolef8gFbL
 ZMPAQbQ3Wwq6w1w45SWHyCRf3QPw1228qKv7YEoozot4YhAwV3eM/nKZo1heXtDzFgJ1
 voXFI1OBRJOq9zw1O5YgN4X/YC/K/XX//tlGPoaow+S1lPZ91I+DFsBGDftg8jFreGH7
 /l2YaJawcJjHtQj9wniK3YBPtfNSeUZqIpDNreAc+r3/KZF7mOhqmMU2bTcvIJfebPZk
 E6ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/1hqcB5K+RBJq7u1KRrQp6OODtMq8a8ie9ekHyiPS4n4lR+96nb2bsOnJ/d5CBeAr523GGGldOxhf3ecEoa/NkGLvFnfY+4LiutputIZJsrSKtovsA27k
X-Gm-Message-State: AOJu0Yw++V6S+mXa1pANBM5TqG26IE9Ubc0HJZLHUsh7qjVwZ3LixYuN
 G24VWfA2mX0Fl2blxg4xY3ELPRCF8Nd91SgaYUEeIuc14BGCEFc1
X-Google-Smtp-Source: AGHT+IFhpB4oLFNLONqB/WZnWU7eWkrmPR/i/a2NYKmzouexZTEd/9HPokyqyfou7PCwNPXhTpzSEw==
X-Received: by 2002:ac2:59c9:0:b0:52b:84bd:345e with SMTP id
 2adb3069b0e04-52b8970c011mr6949767e87.43.1717498019597; 
 Tue, 04 Jun 2024 03:46:59 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b9e2404d5sm394822e87.297.2024.06.04.03.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 03:46:59 -0700 (PDT)
Date: Tue, 4 Jun 2024 13:46:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <q6u6g6aqabsgwqwzrzi4q5nhw4qxuykleotfzwcds5gztxi5ji@e6nui6k6lrk7>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-11-fancer.lancer@gmail.com>
 <2lpomvxhmh7bxqhkuexukztwzjfblulobepmnc4g4us7leldgp@o3a3zgnpua2a>
 <Zl2G+gK8qpBjGpb3@shell.armlinux.org.uk>
 <equlcrx6dgdtrmrlnxxhdunpghw46sjcyn5z6m6lszyiddbag4@eo6oeotzsxef>
 <Zl7ehKqLlzTUQIJG@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zl7ehKqLlzTUQIJG@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org,
 Jose Abreu <joabreu@synopsys.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
 linux-arm-kernel@lists.infradead.org, Mengyuan Lou <mengyuanlou@net-swift.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 10/10] net: stmmac: Add DW
 XPCS specified via "pcs-handle" support
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

On Tue, Jun 04, 2024 at 10:29:40AM +0100, Russell King (Oracle) wrote:
> On Tue, Jun 04, 2024 at 12:04:57PM +0300, Serge Semin wrote:
> > On Mon, Jun 03, 2024 at 10:03:54AM +0100, Russell King (Oracle) wrote:
> > > I can't think of a reasonable solution to this at the moment. One
> > > solution could be pushing this down into the platform code to deal
> > > with as an interim solution, via the new .pcs_init() method.
> > > 
> > > We could also do that with the current XPCS code, since we know that
> > > only Intel mGBE uses xpcs. This would probably allow us to get rid
> > > of the has_xpcs flag.
> > 
> > Basically you suggest to move the entire stmmac_pcs_setup() to the
> > platforms, don't you? The patch 9 of this series indeed could have
> > been converted to just moving the entire PCS-detection loop from
> > stmmac_pcs_setup() to the Intel-specific pcs_init.
> 

> Yes, it's not like XPCS is used by more than one platform, it's only
> Intel mGBE. So I don't see why it should have a privileged position
> over any other PCS implementation that stmmac supports (there's now
> three different PCS.)
> 

Alas DW XPCS has already got a more privileged position. The STMMAC
driver calls the XPCS driver methods here and there (supported ifaces,
EEE or PHY setup). Unless these calls are converted to some
standard/new phylink_pcs calls IMO it would be better to preserve the
default DW XPCS init at least for the "pcs-handle" property to
motivate the platform drivers developers to follow some pre-defined
device description pattern (e.g. defining DW XPCS devices in device
tree), but leave the .pcs_init() for some platform-specific PCS inits
(including which have already been implemented).

As I already mentioned DW XPCS is of Synopsys vendor. The IP-core has
been invented to provide a bridge between the Synopsys MAC IP-cores
and PMA (mainly Synopsys PMAs) for the 1G/10G links like 1000Base-X,
and 10GBase-X/-R/-KX4/-KR. The reason we see just a single use-case
of the XPCS in the driver is that even though the STMMAC driver has DW
XGMAC support the driver is mainly utilized for the 1G MACs (I don't
see any platform currently having DW XGMAC defined). Since DW GMAC/QoS
Eth can be configured to have the standard PHY interfaces available
there is no need in XPCS in these cases (except a weird Intel mGBE).

But when it comes to DW XGMAC it can be synthesized with GMII and XGMII
interfaces only. These're exactly interfaces which DW XPCS supports on
upstream. Thus basically the DW XPCS IP-core has been mainly produced
for been utilized in a couple with DW XGMAC providing a ready-to-use
solution for the XFP/SFP(+) ports or backplane-based applications. So
should we have more DW XGMACs supported in the kernel we would have met
more DW XPCS defined in there too.

> If you don't want the code in the Intel driver, then what could be
> done is provide a core implementation that gets hooked into the
> .pcs_init() method.

I don't mind converting patch 9 to moving the XPCS registration in the
Intel-specific .pcs_init() (especially seeing it's just a single
xpcs_create_mdiodev() call), but having the "pcs-handle" property
handled generically in the STMMAC core would be a useful thing to have
(see my reasoning above).

-Serge(y)

> 
> The same is probably true of other PCSes if they end up being shared
> across several different platforms.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
