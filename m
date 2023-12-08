Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A48580A692
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 16:07:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19A5BC6A613;
	Fri,  8 Dec 2023 15:07:12 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD956C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 15:07:10 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-50c05ea5805so2576860e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Dec 2023 07:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702048030; x=1702652830;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WF5RVyq6ckUd8DU+aeAoDbJFrmMEuJFqK2TUAQspTEA=;
 b=JpjZM8oZ9NGTY7t8LjzOF9EAsHCOnTSdire4iPbr6FDplmd8nb30CyXwkfm48i2/j0
 40FlrfsgWVh817RwI9DuxKmVKrdOgTSmHgM0Bbtae7y2Lqm6eLmmjoRsr8G3FxvfBAmZ
 H51rZOVgFkGuhei6o0LKsYuWfp8IogHzTyaFpOH5mD4ghKSIpo3z4mg0Eo8EyRKxOJeo
 n6Bw/mJSjLCfujuJLjtJWA1qbitdPQkvpjAMBqCRY2kwOGqpRcjwDcvq6OXwO3IOikEB
 WDqh/MpWl4ofdSBBOBgWJpYoX1/EvuOVtcl4A+Au7NzTYMbIO9FdUM4FIbzK3tL5WjbH
 I6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702048030; x=1702652830;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WF5RVyq6ckUd8DU+aeAoDbJFrmMEuJFqK2TUAQspTEA=;
 b=RQOmAiHP2tbxWAQ+NpJ8TQ9SZ+xzk3zQafrmsMqq4VVut3oIeaKRL1UgszCQ/xMqVO
 VzYQWEhL+gjGSxhLn9MWsG7DPAZOVulBGNGpTpjSEjUz+UD67KlJrHo603Hh22Gi6jQJ
 Yon4Q8xuFE2jeygxIxiNbep0RnhBqvgcGFWOuKxdYKPcm9GzinF+EdwSfsHvuDqmRpMs
 76gkDawNPx2W6qIskqtMYwKqdzCSRdpGMEl842e9QCgND4g8V86AcgNbSFxbmfPONHac
 5T8Cmd4Xe5Je7L4jO1QVTFz/OnIv0jg03CWvgOEo+zKQnM7NGJUnOH/1g/A00E1N5K0r
 UJlA==
X-Gm-Message-State: AOJu0Yzywo8qwsmaW0iE4k2Xk/cDEqQ+1yVJcJLsljHADJbOXbEWnD9J
 U5kTAm/3gg9wSNMYkG6bZ6A=
X-Google-Smtp-Source: AGHT+IFn0DWLpA9c912lqdnIDk2jEvmPjcyf++uanjHB3XBJDgftEUxNxH3LEfqMKNi2fs+m3cHW3A==
X-Received: by 2002:ac2:5d31:0:b0:50b:f547:82ba with SMTP id
 i17-20020ac25d31000000b0050bf54782bamr17911lfb.130.1702048029635; 
 Fri, 08 Dec 2023 07:07:09 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 5-20020ac25f45000000b0050bf06c8098sm241291lfz.116.2023.12.08.07.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 07:07:09 -0800 (PST)
Date: Fri, 8 Dec 2023 18:07:06 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <hgz3pt625kggix6kzincohw7kr2okcumrwfkmjgiauw2yvhrzt@ekeygo4b7k3b>
References: <20231207-stmmac-no-mdio-node-v3-1-34b870f2bafb@redhat.com>
 <jz6ot44fjkbmwcezi3fkgqd54nurglblbemrchfgxgq6udlhqz@ntepnnzzelta>
 <hxds75erxqcfkufxnfbyo2up4b4jeicmi3f5xr6qlb3yf7fe76@4byeq62jhu4o>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <hxds75erxqcfkufxnfbyo2up4b4jeicmi3f5xr6qlb3yf7fe76@4byeq62jhu4o>
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

On Thu, Dec 07, 2023 at 05:07:24PM -0600, Andrew Halaney wrote:
> On Fri, Dec 08, 2023 at 01:16:12AM +0300, Serge Semin wrote:
> > On Thu, Dec 07, 2023 at 03:12:40PM -0600, Andrew Halaney wrote:
> > > The stmmac_dt_phy() function, which parses the devicetree node of the
> > > MAC and ultimately causes MDIO bus allocation, misinterprets what
> > > fixed-link means in relation to the MAC's MDIO bus. This results in
> > > a MDIO bus being created in situations it need not be.
> > > 
> > > Currently a MDIO bus is created if the description is either:
> > > 
> > >     1. Not fixed-link
> > >     2. fixed-link but contains a MDIO bus as well
> > > 
> > > The "1" case above isn't always accurate. If there's a phy-handle,
> > > it could be referencing a phy on another MDIO controller's bus[1]. In
> > > this case currently the MAC will make a MDIO bus and scan it all
> > > anyways unnecessarily.
> > > 
> > > There's also a lot of upstream devicetrees[2] that expect a MDIO bus to
> > > be created and scanned for a phy. This case can also be inferred from
> > > the platform description by not having a phy-handle && not being
> > > fixed-link. This hits case "1" in the current driver's logic.
> > > 
> > > Let's improve the logic to create a MDIO bus if either:
> > > 
> > 
> > >     - Devicetree contains a MDIO bus
> > >     - !fixed-link && !phy-handle (legacy handling)
> > 
> > If what you suggest here is a free from regressions semantics change
> > (really hope it is) I will be with both my hands for it. This will
> > solve the problem we have with one of our device which doesn't have
> > SMA interface (hardware designers decided to save ~4K gates of the
> > chip area) but has a PHY externally attached to the DW XGMAC<->XPCS
> > interface. PHY is accessible via a GPIO-based MDIO bus. BTW having no
> > SMA interface available on a DW *MAC device but creating the MDIO-bus
> > on top of the non-existent SMA CSRs anyway causes having _32_ dummy
> > PHYs created with zero IDs.
> 

> I hope it is regression free! I have tested both the [1] and [2] cases
> (I hacked up the devicetree for [1] to make it look like [2]) without
> any issue.
> 

I doubt you could have tested it on all the possible hardware the
STMMAC driver supports. The problem is that the DT-bindings thing is a
kind of contract which can't be changed that easily. It's like ABI but
for the hardware description so the kernel would bootup correctly on
the platforms with the old DT blobs. But if the change isn't that
critical, if the device-tree sources in the kernel fit to the updated
semantics, if the networking subsystem maintainers aren't against it
and I guess with the Rob, Krzysztof or Conor blessing (at least it
won't hurt to add them to the Cc-list together with the devicetree
mailing-list), then it will likely be accepted.

> Sorry, I don't have any docs for stmmac hardware so this might be
> answered in there (or just common net knowledge that I can't find
> online)... what's SMA stand for? I assume it's the MDIO interface.

Right. Synopsys names the MDIO-bus interface as Station Management
Agent MDIO module.

> 
> I agree though, if you have a phy-handle and no mdio node in your
> devicetree this patch series should bail out without registering a bus
> in stmmac_mdio_register().

On the other hand why would the MDIO-bus needed in such case? If the
phy-handle property is specified with no MDIO-bus DT-subnode, then it
will point out to a PHY residing an external bus. The only case I can
imagine though is that the DW XPCS device could be still auto-detected
on the internal SMA-MDIO-bus. But the only driver which currently has
XPCS auto-detection activated is the Intel glue layer (see
dwmac-intel.c and has_xpcs flag), but it doesn't use DT interface
since it handles a PCIe-based device.  So this case is out of
brackets.

> 
> > 
> > > 
> > > Below upstream devicetree snippets can be found that explain some of
> > > the cases above more concretely.
> 
> <snip>
> 
> > > -	if (mdio) {
> > > -		plat->mdio_bus_data =
> > > -			devm_kzalloc(dev, sizeof(struct stmmac_mdio_bus_data),
> > > -				     GFP_KERNEL);
> > 
> > > +	/* Legacy devicetrees allowed for no MDIO bus description and expect
> > > +	 * the bus to be scanned for devices. If there's no phy or fixed-link
> > > +	 * described assume this is the case since there must be something
> > > +	 * connected to the MAC.
> > > +	 */
> > > +	legacy_mdio = !of_phy_is_fixed_link(np) && !plat->phy_node;
> > > +	if (legacy_mdio)
> > > +		dev_info(dev, "Deprecated MDIO bus assumption used\n");
> > > +
> > > +	if (plat->mdio_node || legacy_mdio) {
> > > +		plat->mdio_bus_data = devm_kzalloc(dev,
> > 
> > Special thanks for adding the comment above this code. It will really
> > save time of figuring out why MDIO-bus needs to be created anyway.
> > 
> > > +						   sizeof(struct stmmac_mdio_bus_data),
> > 
> > Should v4 is required I would suggest to change this to
> > sizeof(*plat->mdio_bus_data).
> > 
> > Anyway feel free to add:
> > Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> > 
> > -Serge(y)
> 

> Sure I will spin v4 to pick that up, thanks for catching it. I'll also
> improve the motivation in the commit message a hair more per Andrew
> Lunn's request over here on v2 (and will hold off a little bit just to
> make sure reviews come in before a respin):
> 
>     https://lore.kernel.org/netdev/e64b14c3-4b80-4120-8cc4-9baa40cdcb75@lunn.ch/

Ok. Thanks.

-Serge(y)

> 
> Thanks,
> Andrew
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
