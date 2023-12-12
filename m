Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6341A80F4FF
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 18:54:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09DAAC6C85B;
	Tue, 12 Dec 2023 17:54:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6CC0C6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702403636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DdlHDXKia7dZsATDkFa8oWY9uFwh0XkWCfO7wMb7BdI=;
 b=d4MjXISJ7lrfbdAFDbJ66VhSQTzWC2qIrOipMQVeo7pOx4YSVSuSfttmLZp7IadtsH5HNd
 ApFF7L2IxczahTUbJHCC/pJmKO6U7JbjURJjX5ElXkeo3ltWJV2R6tyX7eCG6zebvNsVXD
 C2K9Fr4sNtEgivL748DMA6hxWlnqZSg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-XVMZBvRLNX-Hln6eJJYbaQ-1; Tue, 12 Dec 2023 12:53:52 -0500
X-MC-Unique: XVMZBvRLNX-Hln6eJJYbaQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-77f383fa40fso757093785a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 09:53:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702403628; x=1703008428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdlHDXKia7dZsATDkFa8oWY9uFwh0XkWCfO7wMb7BdI=;
 b=ahwxgLEb6XruldW1dKlsXEQFurwt6uC6sDr5XbeJy4QJeCq1t7tOffDuBujr81jwdC
 2uyo4/6S2SWRlOxNm9v+6TXnaQDRSh2XABPN3uh6QNLKkn7V3MzdSS3JIBUiBR5unrBB
 AVFudV+W3vnJtc4ZTDtVYmvhKwY8IhU/MMgLXXzgHBVL8zqd79duPbwpe8pSU+mdJ0YD
 pXI0dMGPdPErIsL1tXnQ6JuBTKuzbs3mtzLAZfQFETzHYqhl5HmEed3GJHjgAHxibEA/
 cMmwYpCwKimSQFHTl/sNyhM7PRRUuOqy36d5IwZ3C14/5YZPwXNj/iQA5i+KgdW6v2K5
 OaLw==
X-Gm-Message-State: AOJu0Yx3for1I7rIdjeAdxCudlLOLGwMU8HLLUUNTEtFS62cqABktFTb
 X9Nl37WMDDiihlzaMrUeE2kVz//yr1w+KCd5IEht3cxxlqro/GmAPQlKMdQ88osFQ2l0E6iwpcd
 VKpVHkaqAx3YLugVG+epLrnguNg8e+bAmnbPt3Fb4
X-Received: by 2002:a05:620a:1787:b0:77f:3d4a:6dcc with SMTP id
 ay7-20020a05620a178700b0077f3d4a6dccmr9193577qkb.8.1702403628498; 
 Tue, 12 Dec 2023 09:53:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo+zoJmze0Y/kUaT4ct5ONqWmBVqq2jGqNbXv6BFGF3NJSoybXPW+YABIfoKfhOnFfXTSh+g==
X-Received: by 2002:a05:620a:1787:b0:77f:3d4a:6dcc with SMTP id
 ay7-20020a05620a178700b0077f3d4a6dccmr9193564qkb.8.1702403628126; 
 Tue, 12 Dec 2023 09:53:48 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 bl10-20020a05620a1a8a00b0077d8fdc7e84sm3890632qkb.5.2023.12.12.09.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 09:53:47 -0800 (PST)
Date: Tue, 12 Dec 2023 11:53:45 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <726fd37c4ayubzzdyfh2cd3dkqdqzzkjcak4po7iudb73nnmp3@rq5j63ik2tvv>
References: <20231207-stmmac-no-mdio-node-v3-1-34b870f2bafb@redhat.com>
 <jz6ot44fjkbmwcezi3fkgqd54nurglblbemrchfgxgq6udlhqz@ntepnnzzelta>
 <hxds75erxqcfkufxnfbyo2up4b4jeicmi3f5xr6qlb3yf7fe76@4byeq62jhu4o>
 <hgz3pt625kggix6kzincohw7kr2okcumrwfkmjgiauw2yvhrzt@ekeygo4b7k3b>
 <h5ucipgjtsesrz3jyul5xohu4pqom56v6ayx7aonnfesret3ht@wmblmndj6zir>
 <hpqssnt7odmuuyhsljuqovmwatdjz4s6kix6abq7lrvyciawy5@5ypscmmivnmh>
 <slq3uvpe424lxksgc2ho4q5apon6yqyvmq3ubpmx3z5ln5yhqf@klnkglqb6o6r>
 <4e42erte4zvx77vgj77kcal2ss4nma3ggm3wa6wssleuubtzit@gbkbbudjfwhz>
MIME-Version: 1.0
In-Reply-To: <4e42erte4zvx77vgj77kcal2ss4nma3ggm3wa6wssleuubtzit@gbkbbudjfwhz>
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

On Tue, Dec 12, 2023 at 01:42:35PM +0300, Serge Semin wrote:
> On Mon, Dec 11, 2023 at 01:48:47PM -0600, Andrew Halaney wrote:
> > On Mon, Dec 11, 2023 at 08:27:46PM +0300, Serge Semin wrote:
> > > On Fri, Dec 08, 2023 at 10:50:29AM -0600, Andrew Halaney wrote:
> > > > On Fri, Dec 08, 2023 at 06:07:06PM +0300, Serge Semin wrote:
> > > > > On Thu, Dec 07, 2023 at 05:07:24PM -0600, Andrew Halaney wrote:
> > > > > > On Fri, Dec 08, 2023 at 01:16:12AM +0300, Serge Semin wrote:
> > > > > > > On Thu, Dec 07, 2023 at 03:12:40PM -0600, Andrew Halaney wrote:
> > > > > > > > The stmmac_dt_phy() function, which parses the devicetree node of the
> > > > > > > > MAC and ultimately causes MDIO bus allocation, misinterprets what
> > > > > > > > fixed-link means in relation to the MAC's MDIO bus. This results in
> > > > > > > > a MDIO bus being created in situations it need not be.
> > > > > > > > 
> > > > > > > > Currently a MDIO bus is created if the description is either:
> > > > > > > > 
> > > > > > > >     1. Not fixed-link
> > > > > > > >     2. fixed-link but contains a MDIO bus as well
> > > > > > > > 
> > > > > > > > The "1" case above isn't always accurate. If there's a phy-handle,
> > > > > > > > it could be referencing a phy on another MDIO controller's bus[1]. In
> > > > > > > > this case currently the MAC will make a MDIO bus and scan it all
> > > > > > > > anyways unnecessarily.
> > > > > > > > 
> > > > > > > > There's also a lot of upstream devicetrees[2] that expect a MDIO bus to
> > > > > > > > be created and scanned for a phy. This case can also be inferred from
> > > > > > > > the platform description by not having a phy-handle && not being
> > > > > > > > fixed-link. This hits case "1" in the current driver's logic.
> > > > > > > > 
> > > > > > > > Let's improve the logic to create a MDIO bus if either:
> > > > > > > > 
> > > > > > > 
> > > > > > > >     - Devicetree contains a MDIO bus
> > > > > > > >     - !fixed-link && !phy-handle (legacy handling)
> > > > > > > 
> > > > > > > If what you suggest here is a free from regressions semantics change
> > > > > > > (really hope it is) I will be with both my hands for it. This will
> > > > > > > solve the problem we have with one of our device which doesn't have
> > > > > > > SMA interface (hardware designers decided to save ~4K gates of the
> > > > > > > chip area) but has a PHY externally attached to the DW XGMAC<->XPCS
> > > > > > > interface. PHY is accessible via a GPIO-based MDIO bus. BTW having no
> > > > > > > SMA interface available on a DW *MAC device but creating the MDIO-bus
> > > > > > > on top of the non-existent SMA CSRs anyway causes having _32_ dummy
> > > > > > > PHYs created with zero IDs.
> > > > > > 
> > > > > 
> > > > > > I hope it is regression free! I have tested both the [1] and [2] cases
> > > > > > (I hacked up the devicetree for [1] to make it look like [2]) without
> > > > > > any issue.
> > > > > > 
> > > > > 
> > > > > I doubt you could have tested it on all the possible hardware the
> > > > > STMMAC driver supports. The problem is that the DT-bindings thing is a
> > > > > kind of contract which can't be changed that easily. It's like ABI but
> > > > > for the hardware description so the kernel would bootup correctly on
> > > > > the platforms with the old DT blobs. But if the change isn't that
> > > > > critical, if the device-tree sources in the kernel fit to the updated
> > > > > semantics, if the networking subsystem maintainers aren't against it
> > > > > and I guess with the Rob, Krzysztof or Conor blessing (at least it
> > > > > won't hurt to add them to the Cc-list together with the devicetree
> > > > > mailing-list), then it will likely be accepted.
> > > > 
> > > 
> > > > To be clear, I don't think we're violating the dt-binding ABI contract
> > > > here. My intention is that all the existing use cases continue to work,
> > > > and this just improves one use case. I did a write up
> > > > over on v2 about the use cases I see and the current logic vs what
> > > > changes with this patch series:
> > > > 
> > > >     https://lore.kernel.org/netdev/plvbqgi2bwlv5quvpiwplq7cxx6m5rl3ghnfhuxfx4bpuhyihl@zmydwrtwdeg6/
> > > > 
> > > > Please comment if you think I have broken some backwards
> > > > compatibility.
> > > 
> > > To shortly sum up so I didn't miss something. Current semantics of the
> > > MDIO-bus registration is:
> > > if !fixed-link || mdio_node_present
> > >     create MDIO-bus
> > > and the semantics of the PHY auto-probe (legacy) is:
> > > if !(fixed-link || mdio_node_present || phy_node_present)
> > >     auto-probe PHY
> > 
> 
> > I think phy_node_present doesn't belong in the current view of the
> > semantics for PHY auto-probe (legacy). This devicetree would trigger a
> > PHY auto-probe/scan on ethernet0's MAC's MDIO bus:
> > 
> > 	random-mdio-bus {
> > 		rgmii_phy: phy@0 {
> > 		};
> > 	};
> > 
> > 	ethernet0 {
> > 		phy-handle = <&rgmii_phy>;
> > 	};
> 
> Em, unless I miss something, but on STMMAC it wont due to the next
> statement: stmmac_mdio_register():
> 	if (priv->plat->phy_node || mdio_node)
> 		goto bus_register_done;
> 
> Note by the "PHY auto-probe (legacy)" semantics I meant the algo
> implemented at the bottom of the stmmac_mdio_register() method. If no
> PHY-node or MDIO-node specified it tries to find any PHY on the
> DW MAC SMA MDIO bus and use it in the driver.
> 
> If what you meant was the PHY auto-probe/scan executed in the
> __mdiobus_register() method, then I guess it's relevant only _if_ the
> stmmac_mdio_register() method performs the legacy auto-probing too.
> Yes, the MDIO/PHY subsystem _will_ scan the MDIO-bus for PHYs, but
> they won't be utilized in the STMMAC driver due to the conditional
> statement above. In other words I guess the scanning performed in
> __mdiobus_register() will be pointless anyway in that case, since no
> detected PHY-devices will be actually used afterwards.
> 

Yes, I was referring to the __mdiobus_register() bit, and I now see what
you mean. So in the example I painted above the stmmac_mdio_register()
auto-probing would not happen since the phy-handle exists (and therefore
phy_node).

So the only change here is that the __mdiobus_register() scan wouldn't
happen, but since stmmac is the only MAC that would attach to a phy on
that bus it doesn't matter (the phy is already acquired by the
phy-handle).

> > 
> > The assumption I make in this patch is that nothing useful could be on
> > ethernet0's MDIO bus, it certainly at least is not the phy the MAC uses.
> > 
> > > 
> > > You are changing the MDIO-bus creation semantics to:
> > > if !(fixed-link || phy_node_present) || mdio_node_present
> > >     create MDIO-bus
> > > with no change in the PHY auto-probe semantics:
> > > if !(fixed-link || mdio_node_present || phy_node_present)
> > >     auto-probe PHY
> > 
> > Unfortunately as I highlighted above this logic (while accurate to the
> > patch under review) is a change from the prior logic for the "auto-probe
> > PHY" case.
> > 
> > > 
> > > So the change is that if a PHY-handle is specified the MDIO-bus won't
> > > be created with the rest conditions being the same.
> > > 
> > > The only concern I had was the so called legacy case and a possibility
> > > to have MDIO-bus with other than PHY devices. Based on the pseudo-code
> > > above the former case won't be affected since having PHY-node
> > > specified didn't triggered MDIO-bus auto-probe even before your
> > > change. The later case concerns for instance the DW XPCS devices which
> > 
> > As I've realized in your response here, there is the possibility that
> > something is on the MDIO bus in the ethernet0 exmpale bus above, and would
> > probe, in the before handling. So I guess this isn't totally backwards
> > compatible. Gah, thanks for highlighting.
> 
> AFAICS what you suggest won't break currently supported by the STMMAC
> driver _platforms_. This is what actually matters. The legacy PHY
> auto-probing will work as before. None of the OF-based platforms
> currently expect having non-PHY devices on the bus.

I agree, you've talked me off the edge of the cliff. Thanks so much for
your help in all this.

> 
> > 
> > I'm not sure in practice if anyone out there is really relying on that
> > or not. I can get away with the "no auto-probe/scan of bus" optimization I
> > really desire by describing my MDIO bus as disabled in the devicetree
> > (need to send patches to do that in the dts and handle it gracefully in
> > stmmac). I'm wondering if I should keep forth with this patch as is, or
> > if I should keep the same logic but clean it up a bit as is done in the
> > current patch... I guess probably the latter.
> 
> It's better to limit some complicated logic before somebody tries to
> use it to bypass a harder but correct way of directly defining all
> devices (including non-PHY ones) in dts. Seeing presumably no
> currently supported platform will be broken I think you should keep
> the patch as is.

Agreed. I'll send a new version this evening with your tags, Andrew
Lunn's requested motivation in commit message, etc. Thanks!

> 
> -Serge(y)
> 
> > 
> > > on some platforms could be found on the DW MAC MDIO bus with not
> > > having PHY living on that bus. But DW XPCS auto-probing currently is
> > > only supported by the non-OF platforms (it's Intel). Thus your change
> > > is supposed to be safe here too.
> > > 
> > > So to speak AFAICS from the STMMAC MDIO OF stuff your solution isn't
> > > supposed to cause regressions and break the current DTs backward
> > > compatibility indeed.
> > > 
> > > Regarding the ideal implementation. What could be much better is to
> > > implement the next semantics:
> > > if SMA-capability-detected &&
> > >    (!mdio_node_present || (mdio_node_present && mdio_node_enabled))
> > >     create MDIO-bus
> > > and preserve the PHY auto-probe semantics for backwards compatibility.
> > > Regarding the SMA-capability flag, it has been presented since DW GMAC
> > > v3.50, so since very much early DW MAC releases. But even for the
> > > early devices I think it could be auto-detected by checking the SMA
> > > CSRs writability. At least DW XGMAC AFAICS has the command CSR not
> > > writable if SMA is unavailable.
> > > 
> > > But I guess it's a matter of another patch.
> > > 
> > 
> > I like that logic for what it is worth, although would be unsure of
> > verifying the SMA-capability-detected part of it. But I wouldn't mind
> > seeing that patch :)
> > 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
