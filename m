Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8FF80D3BD
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 18:27:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C0F1C6B458;
	Mon, 11 Dec 2023 17:27:52 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64A9CC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 17:27:51 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-50be10acaf9so4682820e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 09:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702315670; x=1702920470;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OO0GQljarECteBeseBCGP9zfJso+D2EETifrGOypSaw=;
 b=JXTnonBNEuqjByNs0QtEv+v8bNlP5jzdB4Bkjpk46sAUNSQgG/7Xc74tDZRFIKBvQb
 wwGBEaeUS//+GPceKSAEO4o+/eUxOn/dalKJnToJo/FEXwkqcvbzLZIojMqQ0S3p6PgO
 7ld+e/FoWfBxeLroOJOpPfGlfeQH+bSod9FIFmP+LFVeakaFwt8wo3Mdo0Q2Rg0yPaqF
 toN2sOmwemdNbbaeznb2wvv7+XLaYs8bNHgXANx9W4lV87t3rTsmwCDrH7hqz2uZ00Dq
 1gosPE3mOfZtQL4dvBHGWKAivjgLdc407nRPECxbcT7K23NtxxfE0jb9DkJtecPj8ijU
 qxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702315670; x=1702920470;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OO0GQljarECteBeseBCGP9zfJso+D2EETifrGOypSaw=;
 b=XkMWT+vbScIUhrZLe7b1IgUZa0xK+JA3QZyrLTgWPvWvQtbX9jEVADVbXHWOD3iHCj
 tScebQqUNBJ7xFSn8V/etxJyNV+5Fh4s1xXrtATK9MH2Igob008fs8gr6NEmOgeua7Ph
 gUdjT2SDZWibY0oBXKNWbFjV7rsndxS2q96zPW9l75Qrtu8WS9hNitRyl/Ssq3yqdXIi
 7EvsFwd+I36334qPYy7YptR84DJmjfxCghDOsc/qneejZdxJjNt3pU24xcMTBUX8nsWN
 jZinrxUx9qTCbjr2jggTs9XNinI0PPOvIYgoZGaIx33fibQwgDwGfvezp1mYtuTew1QU
 qgXA==
X-Gm-Message-State: AOJu0YzNwSFesobZmXMxGK1STWI32a0RLEz75VvFZWTGp3oLNk+aWxiH
 4wIGHxDZtgbBm0UBYPGy0JM=
X-Google-Smtp-Source: AGHT+IFUg4ywpvNcYPrUuDPc0QKX6EBfk9n5LgjF6r7DuqftMLpNUtqDdaOY3KOuOLNJ19ftSGKBQA==
X-Received: by 2002:a05:6512:b95:b0:50c:2177:f184 with SMTP id
 b21-20020a0565120b9500b0050c2177f184mr3648357lfv.17.1702315670061; 
 Mon, 11 Dec 2023 09:27:50 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a056512350400b0050d14ce3958sm1072052lfs.81.2023.12.11.09.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 09:27:49 -0800 (PST)
Date: Mon, 11 Dec 2023 20:27:46 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <hpqssnt7odmuuyhsljuqovmwatdjz4s6kix6abq7lrvyciawy5@5ypscmmivnmh>
References: <20231207-stmmac-no-mdio-node-v3-1-34b870f2bafb@redhat.com>
 <jz6ot44fjkbmwcezi3fkgqd54nurglblbemrchfgxgq6udlhqz@ntepnnzzelta>
 <hxds75erxqcfkufxnfbyo2up4b4jeicmi3f5xr6qlb3yf7fe76@4byeq62jhu4o>
 <hgz3pt625kggix6kzincohw7kr2okcumrwfkmjgiauw2yvhrzt@ekeygo4b7k3b>
 <h5ucipgjtsesrz3jyul5xohu4pqom56v6ayx7aonnfesret3ht@wmblmndj6zir>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <h5ucipgjtsesrz3jyul5xohu4pqom56v6ayx7aonnfesret3ht@wmblmndj6zir>
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

On Fri, Dec 08, 2023 at 10:50:29AM -0600, Andrew Halaney wrote:
> On Fri, Dec 08, 2023 at 06:07:06PM +0300, Serge Semin wrote:
> > On Thu, Dec 07, 2023 at 05:07:24PM -0600, Andrew Halaney wrote:
> > > On Fri, Dec 08, 2023 at 01:16:12AM +0300, Serge Semin wrote:
> > > > On Thu, Dec 07, 2023 at 03:12:40PM -0600, Andrew Halaney wrote:
> > > > > The stmmac_dt_phy() function, which parses the devicetree node of the
> > > > > MAC and ultimately causes MDIO bus allocation, misinterprets what
> > > > > fixed-link means in relation to the MAC's MDIO bus. This results in
> > > > > a MDIO bus being created in situations it need not be.
> > > > > 
> > > > > Currently a MDIO bus is created if the description is either:
> > > > > 
> > > > >     1. Not fixed-link
> > > > >     2. fixed-link but contains a MDIO bus as well
> > > > > 
> > > > > The "1" case above isn't always accurate. If there's a phy-handle,
> > > > > it could be referencing a phy on another MDIO controller's bus[1]. In
> > > > > this case currently the MAC will make a MDIO bus and scan it all
> > > > > anyways unnecessarily.
> > > > > 
> > > > > There's also a lot of upstream devicetrees[2] that expect a MDIO bus to
> > > > > be created and scanned for a phy. This case can also be inferred from
> > > > > the platform description by not having a phy-handle && not being
> > > > > fixed-link. This hits case "1" in the current driver's logic.
> > > > > 
> > > > > Let's improve the logic to create a MDIO bus if either:
> > > > > 
> > > > 
> > > > >     - Devicetree contains a MDIO bus
> > > > >     - !fixed-link && !phy-handle (legacy handling)
> > > > 
> > > > If what you suggest here is a free from regressions semantics change
> > > > (really hope it is) I will be with both my hands for it. This will
> > > > solve the problem we have with one of our device which doesn't have
> > > > SMA interface (hardware designers decided to save ~4K gates of the
> > > > chip area) but has a PHY externally attached to the DW XGMAC<->XPCS
> > > > interface. PHY is accessible via a GPIO-based MDIO bus. BTW having no
> > > > SMA interface available on a DW *MAC device but creating the MDIO-bus
> > > > on top of the non-existent SMA CSRs anyway causes having _32_ dummy
> > > > PHYs created with zero IDs.
> > > 
> > 
> > > I hope it is regression free! I have tested both the [1] and [2] cases
> > > (I hacked up the devicetree for [1] to make it look like [2]) without
> > > any issue.
> > > 
> > 
> > I doubt you could have tested it on all the possible hardware the
> > STMMAC driver supports. The problem is that the DT-bindings thing is a
> > kind of contract which can't be changed that easily. It's like ABI but
> > for the hardware description so the kernel would bootup correctly on
> > the platforms with the old DT blobs. But if the change isn't that
> > critical, if the device-tree sources in the kernel fit to the updated
> > semantics, if the networking subsystem maintainers aren't against it
> > and I guess with the Rob, Krzysztof or Conor blessing (at least it
> > won't hurt to add them to the Cc-list together with the devicetree
> > mailing-list), then it will likely be accepted.
> 

> To be clear, I don't think we're violating the dt-binding ABI contract
> here. My intention is that all the existing use cases continue to work,
> and this just improves one use case. I did a write up
> over on v2 about the use cases I see and the current logic vs what
> changes with this patch series:
> 
>     https://lore.kernel.org/netdev/plvbqgi2bwlv5quvpiwplq7cxx6m5rl3ghnfhuxfx4bpuhyihl@zmydwrtwdeg6/
> 
> Please comment if you think I have broken some backwards
> compatibility.

To shortly sum up so I didn't miss something. Current semantics of the
MDIO-bus registration is:
if !fixed-link || mdio_node_present
    create MDIO-bus
and the semantics of the PHY auto-probe (legacy) is:
if !(fixed-link || mdio_node_present || phy_node_present)
    auto-probe PHY

You are changing the MDIO-bus creation semantics to:
if !(fixed-link || phy_node_present) || mdio_node_present
    create MDIO-bus
with no change in the PHY auto-probe semantics:
if !(fixed-link || mdio_node_present || phy_node_present)
    auto-probe PHY

So the change is that if a PHY-handle is specified the MDIO-bus won't
be created with the rest conditions being the same.

The only concern I had was the so called legacy case and a possibility
to have MDIO-bus with other than PHY devices. Based on the pseudo-code
above the former case won't be affected since having PHY-node
specified didn't triggered MDIO-bus auto-probe even before your
change. The later case concerns for instance the DW XPCS devices which
on some platforms could be found on the DW MAC MDIO bus with not
having PHY living on that bus. But DW XPCS auto-probing currently is
only supported by the non-OF platforms (it's Intel). Thus your change
is supposed to be safe here too.

So to speak AFAICS from the STMMAC MDIO OF stuff your solution isn't
supposed to cause regressions and break the current DTs backward
compatibility indeed.

Regarding the ideal implementation. What could be much better is to
implement the next semantics:
if SMA-capability-detected &&
   (!mdio_node_present || (mdio_node_present && mdio_node_enabled))
    create MDIO-bus
and preserve the PHY auto-probe semantics for backwards compatibility.
Regarding the SMA-capability flag, it has been presented since DW GMAC
v3.50, so since very much early DW MAC releases. But even for the
early devices I think it could be auto-detected by checking the SMA
CSRs writability. At least DW XGMAC AFAICS has the command CSR not
writable if SMA is unavailable.

But I guess it's a matter of another patch.

> If I _could_ break compatibility, I'd make everyone
> describe their busses entirely... but as you said that's against the
> spirit of dt-bindings and would upset a lot of people. That's why I've
> left the "!fixed-link && !phy-handle (legacy handling) logic :)
> 
> > 
> > > Sorry, I don't have any docs for stmmac hardware so this might be
> > > answered in there (or just common net knowledge that I can't find
> > > online)... what's SMA stand for? I assume it's the MDIO interface.
> > 
> > Right. Synopsys names the MDIO-bus interface as Station Management
> > Agent MDIO module.
> > 
> > > 
> > > I agree though, if you have a phy-handle and no mdio node in your
> > > devicetree this patch series should bail out without registering a bus
> > > in stmmac_mdio_register().
> > 
> > On the other hand why would the MDIO-bus needed in such case? If the
> > phy-handle property is specified with no MDIO-bus DT-subnode, then it
> > will point out to a PHY residing an external bus. The only case I can
> > imagine though is that the DW XPCS device could be still auto-detected
> > on the internal SMA-MDIO-bus. But the only driver which currently has
> > XPCS auto-detection activated is the Intel glue layer (see
> > dwmac-intel.c and has_xpcs flag), but it doesn't use DT interface
> > since it handles a PCIe-based device.  So this case is out of
> > brackets.
> 
> Agreed, I think making the bus is not needed in the driver as is in that
> case.
> 

> I'd like to think (but am not sure) that when a devicetree based DW XPCS
> description comes around it will allow you to describe it exactly
> instead of doing auto-detection (i.e. something like phy-handle), but I
> am not very familiar with PCS and friends in the stack so that may be a
> crude extension from my knowledge of MDIO.

Right, there is a generic property for that - "pcs-handle". Last week
I submitted a series which makes it supported on the STMMAC and XPCS
drivers.

-Serge(y)

> 
> Thanks,
> Andrew
> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > Below upstream devicetree snippets can be found that explain some of
> > > > > the cases above more concretely.
> > > 
> > > <snip>
> > > 
> > > > > -	if (mdio) {
> > > > > -		plat->mdio_bus_data =
> > > > > -			devm_kzalloc(dev, sizeof(struct stmmac_mdio_bus_data),
> > > > > -				     GFP_KERNEL);
> > > > 
> > > > > +	/* Legacy devicetrees allowed for no MDIO bus description and expect
> > > > > +	 * the bus to be scanned for devices. If there's no phy or fixed-link
> > > > > +	 * described assume this is the case since there must be something
> > > > > +	 * connected to the MAC.
> > > > > +	 */
> > > > > +	legacy_mdio = !of_phy_is_fixed_link(np) && !plat->phy_node;
> > > > > +	if (legacy_mdio)
> > > > > +		dev_info(dev, "Deprecated MDIO bus assumption used\n");
> > > > > +
> > > > > +	if (plat->mdio_node || legacy_mdio) {
> > > > > +		plat->mdio_bus_data = devm_kzalloc(dev,
> > > > 
> > > > Special thanks for adding the comment above this code. It will really
> > > > save time of figuring out why MDIO-bus needs to be created anyway.
> > > > 
> > > > > +						   sizeof(struct stmmac_mdio_bus_data),
> > > > 
> > > > Should v4 is required I would suggest to change this to
> > > > sizeof(*plat->mdio_bus_data).
> > > > 
> > > > Anyway feel free to add:
> > > > Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> > > > 
> > > > -Serge(y)
> > > 
> > 
> > > Sure I will spin v4 to pick that up, thanks for catching it. I'll also
> > > improve the motivation in the commit message a hair more per Andrew
> > > Lunn's request over here on v2 (and will hold off a little bit just to
> > > make sure reviews come in before a respin):
> > > 
> > >     https://lore.kernel.org/netdev/e64b14c3-4b80-4120-8cc4-9baa40cdcb75@lunn.ch/
> > 
> > Ok. Thanks.
> > 
> > -Serge(y)
> > 
> > > 
> > > Thanks,
> > > Andrew
> > > 
> > 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
