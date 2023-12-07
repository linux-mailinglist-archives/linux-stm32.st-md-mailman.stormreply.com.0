Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1788E80966A
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 00:07:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEECFC65E4F;
	Thu,  7 Dec 2023 23:07:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2302CC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Dec 2023 23:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701990452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jVM1WmJwjQIszb+XLXzan7QiLivbxv0y5A1QhrsixGY=;
 b=fSs4MtWY3XBbg+ixRGeRGejZe3zGDkUq4uOh43JLtHny13K6+5b8ccUQOQGzFjXugCEsBH
 tc8m/Qd5cLhtBI1SM+lzK6kB4pRBgVrBc8X+qwsRCv+DbjwTN9486I3yxFYRhxAfXCWXvr
 YKSMea1sDZ7qYNDchgPq7Cfi8R7dJ88=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-Hlye-v6-N_yfm2SLSgtvMw-1; Thu, 07 Dec 2023 18:07:29 -0500
X-MC-Unique: Hlye-v6-N_yfm2SLSgtvMw-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-425886864f4so17796351cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Dec 2023 15:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701990447; x=1702595247;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jVM1WmJwjQIszb+XLXzan7QiLivbxv0y5A1QhrsixGY=;
 b=vjHaWLZIRP566nWc04EKMR1C04Z2xzw6ronVRVT+wHE2/NcR23MTVC0ww0h88kd17o
 Yj67FHHub4LTs4jXW62hDX7miKGPvsfFh1GTewaf1AynEaySLr7+oypq4AiDI2fjKo+J
 UordErBJpMp4l8fEuxxLoieVDT8W33aWn7O/ODvC/Ka0kZWifJJNq0USbkPLywNtz186
 l9aJ0n35Hjw5IYDpVOL7d/PMWUHB0JpC4qpWXUZqzwut+lygNHSz/vge57b5Qxj102lC
 jPZaLB0xowbY9N2LwgXwH4r/xQ4d2xB9IN0x6AaIeMemkstn5rYGM7vxn0aKGuaBIvdT
 RfBQ==
X-Gm-Message-State: AOJu0YxNL0FJa1i/lAgDBNtAvXVOGSA47uES2hWbb7RXBFesKufNq+4a
 vvMalwfC+UcSahqSfH4v7BARkzwrBumhUvQAX7UodzgyYcOwt/5OMr3ZvKw2qRoRirJM1CmBee/
 dM1RWqhAivu0mx/X644XH7qO3tZhYmGLH+7CJ7IWL
X-Received: by 2002:a05:622a:1a0c:b0:417:fd7e:2154 with SMTP id
 f12-20020a05622a1a0c00b00417fd7e2154mr4335061qtb.9.1701990447264; 
 Thu, 07 Dec 2023 15:07:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELEnmaKlLkEXPtsoU1QDWmch2MnIAl4zsRZz3furlGlXRAjnhjBjwRDw+3e9RFT1Hd9Ndx5A==
X-Received: by 2002:a05:622a:1a0c:b0:417:fd7e:2154 with SMTP id
 f12-20020a05622a1a0c00b00417fd7e2154mr4335040qtb.9.1701990447010; 
 Thu, 07 Dec 2023 15:07:27 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 t18-20020ac865d2000000b00423829b6d91sm294156qto.8.2023.12.07.15.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 15:07:26 -0800 (PST)
Date: Thu, 7 Dec 2023 17:07:24 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <hxds75erxqcfkufxnfbyo2up4b4jeicmi3f5xr6qlb3yf7fe76@4byeq62jhu4o>
References: <20231207-stmmac-no-mdio-node-v3-1-34b870f2bafb@redhat.com>
 <jz6ot44fjkbmwcezi3fkgqd54nurglblbemrchfgxgq6udlhqz@ntepnnzzelta>
MIME-Version: 1.0
In-Reply-To: <jz6ot44fjkbmwcezi3fkgqd54nurglblbemrchfgxgq6udlhqz@ntepnnzzelta>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: stmmac: don't create a
 MDIO bus if unnecessary
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

On Fri, Dec 08, 2023 at 01:16:12AM +0300, Serge Semin wrote:
> On Thu, Dec 07, 2023 at 03:12:40PM -0600, Andrew Halaney wrote:
> > The stmmac_dt_phy() function, which parses the devicetree node of the
> > MAC and ultimately causes MDIO bus allocation, misinterprets what
> > fixed-link means in relation to the MAC's MDIO bus. This results in
> > a MDIO bus being created in situations it need not be.
> > 
> > Currently a MDIO bus is created if the description is either:
> > 
> >     1. Not fixed-link
> >     2. fixed-link but contains a MDIO bus as well
> > 
> > The "1" case above isn't always accurate. If there's a phy-handle,
> > it could be referencing a phy on another MDIO controller's bus[1]. In
> > this case currently the MAC will make a MDIO bus and scan it all
> > anyways unnecessarily.
> > 
> > There's also a lot of upstream devicetrees[2] that expect a MDIO bus to
> > be created and scanned for a phy. This case can also be inferred from
> > the platform description by not having a phy-handle && not being
> > fixed-link. This hits case "1" in the current driver's logic.
> > 
> > Let's improve the logic to create a MDIO bus if either:
> > 
> 
> >     - Devicetree contains a MDIO bus
> >     - !fixed-link && !phy-handle (legacy handling)
> 
> If what you suggest here is a free from regressions semantics change
> (really hope it is) I will be with both my hands for it. This will
> solve the problem we have with one of our device which doesn't have
> SMA interface (hardware designers decided to save ~4K gates of the
> chip area) but has a PHY externally attached to the DW XGMAC<->XPCS
> interface. PHY is accessible via a GPIO-based MDIO bus. BTW having no
> SMA interface available on a DW *MAC device but creating the MDIO-bus
> on top of the non-existent SMA CSRs anyway causes having _32_ dummy
> PHYs created with zero IDs.

I hope it is regression free! I have tested both the [1] and [2] cases
(I hacked up the devicetree for [1] to make it look like [2]) without
any issue.

Sorry, I don't have any docs for stmmac hardware so this might be
answered in there (or just common net knowledge that I can't find
online)... what's SMA stand for? I assume it's the MDIO interface.

I agree though, if you have a phy-handle and no mdio node in your
devicetree this patch series should bail out without registering a bus
in stmmac_mdio_register().

> 
> > 
> > Below upstream devicetree snippets can be found that explain some of
> > the cases above more concretely.

<snip>

> > -	if (mdio) {
> > -		plat->mdio_bus_data =
> > -			devm_kzalloc(dev, sizeof(struct stmmac_mdio_bus_data),
> > -				     GFP_KERNEL);
> 
> > +	/* Legacy devicetrees allowed for no MDIO bus description and expect
> > +	 * the bus to be scanned for devices. If there's no phy or fixed-link
> > +	 * described assume this is the case since there must be something
> > +	 * connected to the MAC.
> > +	 */
> > +	legacy_mdio = !of_phy_is_fixed_link(np) && !plat->phy_node;
> > +	if (legacy_mdio)
> > +		dev_info(dev, "Deprecated MDIO bus assumption used\n");
> > +
> > +	if (plat->mdio_node || legacy_mdio) {
> > +		plat->mdio_bus_data = devm_kzalloc(dev,
> 
> Special thanks for adding the comment above this code. It will really
> save time of figuring out why MDIO-bus needs to be created anyway.
> 
> > +						   sizeof(struct stmmac_mdio_bus_data),
> 
> Should v4 is required I would suggest to change this to
> sizeof(*plat->mdio_bus_data).
> 
> Anyway feel free to add:
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> 
> -Serge(y)

Sure I will spin v4 to pick that up, thanks for catching it. I'll also
improve the motivation in the commit message a hair more per Andrew
Lunn's request over here on v2 (and will hold off a little bit just to
make sure reviews come in before a respin):

    https://lore.kernel.org/netdev/e64b14c3-4b80-4120-8cc4-9baa40cdcb75@lunn.ch/

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
