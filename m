Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6758FAE45
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 11:05:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61A78C71288;
	Tue,  4 Jun 2024 09:05:10 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D284C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 09:05:02 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ea903cd11bso56017581fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Jun 2024 02:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717491902; x=1718096702;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ra/05RG+I2wv8KgtJlT+4wpFEIAZV3HX8GrU0T/bo6E=;
 b=HlFW0J18uZPba5bvAS1KfX2OoPU/G6PsFOgm2gOWVdJ7l8ELE5cQLrrrCLLWMcg5lh
 Wm5YzOe4RgJwEMo6mfrw5rRaKu/waRDWHByJcNw7hTFcNkOmU6fk7vxpZGQLJOV24tRb
 QXOkf0Crwohk5FAYWx3iXHWDW4gLFOXH4DFCyOW0Jq6JSkRWMXTOaPCu+2HH1SpQuO+P
 TWOo1K6v5sKANkHVjSzpD5D6JPjWdSL7pCNjkn8fr4f1hPjFJFdTucBkNdCDbvpmPJw0
 Eg/2dgdQZOaozuf6ZoVsjrsJGxl1AsBL/Hy9aMViUI1nMtUQw0oslsomNZYvqcx3Wg8S
 OThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717491902; x=1718096702;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ra/05RG+I2wv8KgtJlT+4wpFEIAZV3HX8GrU0T/bo6E=;
 b=Z8O+RXDsI8/hb9rCCYkbgRe5qvv2Gis5F6hzZQC+p17BYn0617qGp3btjxNhNs7a6N
 M7LAFPuKjq76AqYwLjoN7YvFbnVJRScew2wHAn+BnTqOI9T6bFq5cYtlZOcSLuv/Uy1/
 ah5AUOvbIh1+AJ9U+CMkeVHBX9+7VJENWvoie9R14eYcppsBJgMUnqCk+CLEBDGCGy1+
 7UXtwGWw4U18PWT/noflIws55htBrlU8Miv4DHLvJA3n/2P15v731L+UN7FzjKXQKpQ5
 N580V8sYcioCZBxtjCfLFqnM1ShnEWFZZqeqliy3t/xTMotkVax6S0wYfMaCoHnZY8jS
 mCVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVBnG41zFXO8IYlxOv21wIAVSE9z5CTwzMM3m02W1pHWWFxlRkwgkeOR3EQpqRfLpvyIM8bTSl0FKKj5W0o6L/xTRaIFMBWlGWXKp14zNiOup8ACUxGkuE
X-Gm-Message-State: AOJu0YwYAGOE2xPw4g1i7pY6O34TZHaCV1BW2fXsSWd684ZLAN2EcY1u
 B5uH78kT0+N/7+UjywzhOTb297njXaD/bNVcxrBXgEU6rHJBUqtk
X-Google-Smtp-Source: AGHT+IGxu8ZeKox/ETHOIGY9tQlCyxdSpOaMcwX3b4V+1NwYwnwZiIpRFm6IZBuIp5wxpDQGIUfJ0A==
X-Received: by 2002:a2e:3c0b:0:b0:2e5:3f56:2a0e with SMTP id
 38308e7fff4ca-2ea9516108emr89381841fa.24.1717491901400; 
 Tue, 04 Jun 2024 02:05:01 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91bb4e24sm14583141fa.55.2024.06.04.02.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 02:05:00 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:04:57 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <equlcrx6dgdtrmrlnxxhdunpghw46sjcyn5z6m6lszyiddbag4@eo6oeotzsxef>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-11-fancer.lancer@gmail.com>
 <2lpomvxhmh7bxqhkuexukztwzjfblulobepmnc4g4us7leldgp@o3a3zgnpua2a>
 <Zl2G+gK8qpBjGpb3@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zl2G+gK8qpBjGpb3@shell.armlinux.org.uk>
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

On Mon, Jun 03, 2024 at 10:03:54AM +0100, Russell King (Oracle) wrote:
> On Mon, Jun 03, 2024 at 11:54:22AM +0300, Serge Semin wrote:
> > >  	if (priv->plat->pcs_init) {
> > >  		ret = priv->plat->pcs_init(priv);
> > 
> > > +	} else if (fwnode_property_present(devnode, "pcs-handle")) {
> > > +		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
> > > +		xpcs = xpcs_create_fwnode(pcsnode, mode);
> > > +		fwnode_handle_put(pcsnode);
> > > +		ret = PTR_ERR_OR_ZERO(xpcs);
> > 
> > Just figured, we might wish to be a bit more portable in the
> > "pcs-handle" property semantics implementation seeing there can be at
> > least three different PCS attached:
> > DW XPCS
> > Lynx PCS
> > Renesas RZ/N1 MII
> > 
> > Any suggestion of how to distinguish the passed handle? Perhaps
> > named-property, phandle argument, by the compatible string or the
> > node-name?
> 

> I can't think of a reasonable solution to this at the moment. One
> solution could be pushing this down into the platform code to deal
> with as an interim solution, via the new .pcs_init() method.
> 
> We could also do that with the current XPCS code, since we know that
> only Intel mGBE uses xpcs. This would probably allow us to get rid
> of the has_xpcs flag.

Basically you suggest to move the entire stmmac_pcs_setup() to the
platforms, don't you? The patch 9 of this series indeed could have
been converted to just moving the entire PCS-detection loop from
stmmac_pcs_setup() to the Intel-specific pcs_init.

But IMO some default/generic code would be still useful to preserve in
the stmmac_pcs_setup() method. When it comes to the fwnode-based
platform we at least could be falling back to the default DW XPCS
device registration if no plat_stmmacenet_data::pcs_init() callback
was specified and there was the "pcs-handle" property found,
especially seeing DW *MAC and DW XPCS are of the same vendor.

Based on that I can convert patch 9 of this series to introducing the
pcs_init() callback in the Intel mGBE driver, but preserve the
semantics of the rest of the series changes.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
