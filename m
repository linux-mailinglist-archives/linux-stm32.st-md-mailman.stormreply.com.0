Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC9080A9BE
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 17:50:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24FAFC6B475;
	Fri,  8 Dec 2023 16:50:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58FE1C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702054234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b9G4gtAHl2jdBgyqLp8sobufNphdW1bLmTw+/OLi/vA=;
 b=daMT4hATPXYhk4artMrKm8Ufy6xW/Xwuf7KVsuk9kpTTrxz+jEgPb1/LB9XIwfex1/C35A
 Oy7raYIIamfSo1uCXIswLFCMFUETOBJl3No0JMeeP98mfIDeLsaLlLzd5eRVfO/aCm4hiW
 rpxvQ1A/U42ezUE98L3+B+fuTqCXF88=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-nLGzpjvZMtCk6yK5IUw5xw-1; Fri, 08 Dec 2023 11:50:33 -0500
X-MC-Unique: nLGzpjvZMtCk6yK5IUw5xw-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-425886864f4so27503151cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Dec 2023 08:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702054233; x=1702659033;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9G4gtAHl2jdBgyqLp8sobufNphdW1bLmTw+/OLi/vA=;
 b=kL0kiXKm8Y6LP+loUFZjkYupYnNCDl2pu0fHejXvkeaJnJJabpMagAz0OlgICYr30I
 YVAmU3lf6qic3kzUpkoPjMPH0L+U8uV/668v6sd+fRO+GNzbQ0mAqZQpDARC3KyKozq0
 06PZWob/fBCR3WZN0xdYjJJx9rAhxUfMx96rC1ExPQtNiDJG/NZHUVMt6doyiMnp6aJO
 BB9yjhF8LiHYGGVql6PmjHIH4FTn9E2b0TN6UZLTTxqFVBFT2jGS3ymD1EyfMlCz704Y
 9CumCjLaToUr5I7nSpDxGlt0pZid6ss+CQLE2ClM9IMMftNqYmNPqYqXi+Cabsu4kwcj
 xXyA==
X-Gm-Message-State: AOJu0Yxo2o09b+jRtxUQNSLM8o/qGgf5jErpQCJfaBcaWh478IT4G+Uj
 l4P7xqm301Y5q0lPjckMW7ZWk0t0QrVImcQh795yEDDmhaAnjoaErD+/mYc4rTsbNA6TyC1lpAP
 PlBu5zKSdIMGyoP1etgBMyS9qBr/Ldn76weDLsSq1
X-Received: by 2002:a05:622a:1309:b0:425:9426:91aa with SMTP id
 v9-20020a05622a130900b00425942691aamr454859qtk.34.1702054232700; 
 Fri, 08 Dec 2023 08:50:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3MkP5lk5Sl/2AGIEvzOZH8sOYwYpbdXiAWnTwjUg36SFaoDyLKp2Da3nJ+OEmEbw6FcPKYg==
X-Received: by 2002:a05:622a:1309:b0:425:9426:91aa with SMTP id
 v9-20020a05622a130900b00425942691aamr454855qtk.34.1702054232378; 
 Fri, 08 Dec 2023 08:50:32 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 g23-20020ac842d7000000b00410a9dd3d88sm923673qtm.68.2023.12.08.08.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 08:50:31 -0800 (PST)
Date: Fri, 8 Dec 2023 10:50:29 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <h5ucipgjtsesrz3jyul5xohu4pqom56v6ayx7aonnfesret3ht@wmblmndj6zir>
References: <20231207-stmmac-no-mdio-node-v3-1-34b870f2bafb@redhat.com>
 <jz6ot44fjkbmwcezi3fkgqd54nurglblbemrchfgxgq6udlhqz@ntepnnzzelta>
 <hxds75erxqcfkufxnfbyo2up4b4jeicmi3f5xr6qlb3yf7fe76@4byeq62jhu4o>
 <hgz3pt625kggix6kzincohw7kr2okcumrwfkmjgiauw2yvhrzt@ekeygo4b7k3b>
MIME-Version: 1.0
In-Reply-To: <hgz3pt625kggix6kzincohw7kr2okcumrwfkmjgiauw2yvhrzt@ekeygo4b7k3b>
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

On Fri, Dec 08, 2023 at 06:07:06PM +0300, Serge Semin wrote:
> On Thu, Dec 07, 2023 at 05:07:24PM -0600, Andrew Halaney wrote:
> > On Fri, Dec 08, 2023 at 01:16:12AM +0300, Serge Semin wrote:
> > > On Thu, Dec 07, 2023 at 03:12:40PM -0600, Andrew Halaney wrote:
> > > > The stmmac_dt_phy() function, which parses the devicetree node of the
> > > > MAC and ultimately causes MDIO bus allocation, misinterprets what
> > > > fixed-link means in relation to the MAC's MDIO bus. This results in
> > > > a MDIO bus being created in situations it need not be.
> > > > 
> > > > Currently a MDIO bus is created if the description is either:
> > > > 
> > > >     1. Not fixed-link
> > > >     2. fixed-link but contains a MDIO bus as well
> > > > 
> > > > The "1" case above isn't always accurate. If there's a phy-handle,
> > > > it could be referencing a phy on another MDIO controller's bus[1]. In
> > > > this case currently the MAC will make a MDIO bus and scan it all
> > > > anyways unnecessarily.
> > > > 
> > > > There's also a lot of upstream devicetrees[2] that expect a MDIO bus to
> > > > be created and scanned for a phy. This case can also be inferred from
> > > > the platform description by not having a phy-handle && not being
> > > > fixed-link. This hits case "1" in the current driver's logic.
> > > > 
> > > > Let's improve the logic to create a MDIO bus if either:
> > > > 
> > > 
> > > >     - Devicetree contains a MDIO bus
> > > >     - !fixed-link && !phy-handle (legacy handling)
> > > 
> > > If what you suggest here is a free from regressions semantics change
> > > (really hope it is) I will be with both my hands for it. This will
> > > solve the problem we have with one of our device which doesn't have
> > > SMA interface (hardware designers decided to save ~4K gates of the
> > > chip area) but has a PHY externally attached to the DW XGMAC<->XPCS
> > > interface. PHY is accessible via a GPIO-based MDIO bus. BTW having no
> > > SMA interface available on a DW *MAC device but creating the MDIO-bus
> > > on top of the non-existent SMA CSRs anyway causes having _32_ dummy
> > > PHYs created with zero IDs.
> > 
> 
> > I hope it is regression free! I have tested both the [1] and [2] cases
> > (I hacked up the devicetree for [1] to make it look like [2]) without
> > any issue.
> > 
> 
> I doubt you could have tested it on all the possible hardware the
> STMMAC driver supports. The problem is that the DT-bindings thing is a
> kind of contract which can't be changed that easily. It's like ABI but
> for the hardware description so the kernel would bootup correctly on
> the platforms with the old DT blobs. But if the change isn't that
> critical, if the device-tree sources in the kernel fit to the updated
> semantics, if the networking subsystem maintainers aren't against it
> and I guess with the Rob, Krzysztof or Conor blessing (at least it
> won't hurt to add them to the Cc-list together with the devicetree
> mailing-list), then it will likely be accepted.

To be clear, I don't think we're violating the dt-binding ABI contract
here. My intention is that all the existing use cases continue to work,
and this just improves one use case. I did a write up
over on v2 about the use cases I see and the current logic vs what
changes with this patch series:

    https://lore.kernel.org/netdev/plvbqgi2bwlv5quvpiwplq7cxx6m5rl3ghnfhuxfx4bpuhyihl@zmydwrtwdeg6/

Please comment if you think I have broken some backwards
compatibility. If I _could_ break compatibility, I'd make everyone
describe their busses entirely... but as you said that's against the
spirit of dt-bindings and would upset a lot of people. That's why I've
left the "!fixed-link && !phy-handle (legacy handling) logic :)

> 
> > Sorry, I don't have any docs for stmmac hardware so this might be
> > answered in there (or just common net knowledge that I can't find
> > online)... what's SMA stand for? I assume it's the MDIO interface.
> 
> Right. Synopsys names the MDIO-bus interface as Station Management
> Agent MDIO module.
> 
> > 
> > I agree though, if you have a phy-handle and no mdio node in your
> > devicetree this patch series should bail out without registering a bus
> > in stmmac_mdio_register().
> 
> On the other hand why would the MDIO-bus needed in such case? If the
> phy-handle property is specified with no MDIO-bus DT-subnode, then it
> will point out to a PHY residing an external bus. The only case I can
> imagine though is that the DW XPCS device could be still auto-detected
> on the internal SMA-MDIO-bus. But the only driver which currently has
> XPCS auto-detection activated is the Intel glue layer (see
> dwmac-intel.c and has_xpcs flag), but it doesn't use DT interface
> since it handles a PCIe-based device.  So this case is out of
> brackets.

Agreed, I think making the bus is not needed in the driver as is in that
case.

I'd like to think (but am not sure) that when a devicetree based DW XPCS
description comes around it will allow you to describe it exactly
instead of doing auto-detection (i.e. something like phy-handle), but I
am not very familiar with PCS and friends in the stack so that may be a
crude extension from my knowledge of MDIO.

Thanks,
Andrew

> 
> > 
> > > 
> > > > 
> > > > Below upstream devicetree snippets can be found that explain some of
> > > > the cases above more concretely.
> > 
> > <snip>
> > 
> > > > -	if (mdio) {
> > > > -		plat->mdio_bus_data =
> > > > -			devm_kzalloc(dev, sizeof(struct stmmac_mdio_bus_data),
> > > > -				     GFP_KERNEL);
> > > 
> > > > +	/* Legacy devicetrees allowed for no MDIO bus description and expect
> > > > +	 * the bus to be scanned for devices. If there's no phy or fixed-link
> > > > +	 * described assume this is the case since there must be something
> > > > +	 * connected to the MAC.
> > > > +	 */
> > > > +	legacy_mdio = !of_phy_is_fixed_link(np) && !plat->phy_node;
> > > > +	if (legacy_mdio)
> > > > +		dev_info(dev, "Deprecated MDIO bus assumption used\n");
> > > > +
> > > > +	if (plat->mdio_node || legacy_mdio) {
> > > > +		plat->mdio_bus_data = devm_kzalloc(dev,
> > > 
> > > Special thanks for adding the comment above this code. It will really
> > > save time of figuring out why MDIO-bus needs to be created anyway.
> > > 
> > > > +						   sizeof(struct stmmac_mdio_bus_data),
> > > 
> > > Should v4 is required I would suggest to change this to
> > > sizeof(*plat->mdio_bus_data).
> > > 
> > > Anyway feel free to add:
> > > Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> > > 
> > > -Serge(y)
> > 
> 
> > Sure I will spin v4 to pick that up, thanks for catching it. I'll also
> > improve the motivation in the commit message a hair more per Andrew
> > Lunn's request over here on v2 (and will hold off a little bit just to
> > make sure reviews come in before a respin):
> > 
> >     https://lore.kernel.org/netdev/e64b14c3-4b80-4120-8cc4-9baa40cdcb75@lunn.ch/
> 
> Ok. Thanks.
> 
> -Serge(y)
> 
> > 
> > Thanks,
> > Andrew
> > 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
