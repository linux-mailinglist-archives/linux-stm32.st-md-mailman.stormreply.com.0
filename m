Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB9E80965D
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 00:00:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FCADC65E4F;
	Thu,  7 Dec 2023 23:00:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07400C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Dec 2023 23:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701990021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHDiIUO4wGrJXoCtVtKVrp/X3ZZZ6xuRsMz/PFdLYt4=;
 b=ER4myZksgwb9gVIbYZ7Zy/aynSEhYy/IVKgq6N2uuLACL1/N9aRT/RHOWS76dyJO4d1qew
 XgU+ISCt+bRywyCT/luk12T0uDfngPhy1eGp57KSTFGHDYXl5apxi2tEiYXvEmTXVpqw4S
 0tmTx9SiTPNTebcvLZN66eu4Zilb/cQ=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-kZtYAL6PPUi_VVwVFv606A-1; Thu, 07 Dec 2023 18:00:19 -0500
X-MC-Unique: kZtYAL6PPUi_VVwVFv606A-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-dbc507311d7so158792276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Dec 2023 15:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701990019; x=1702594819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bHDiIUO4wGrJXoCtVtKVrp/X3ZZZ6xuRsMz/PFdLYt4=;
 b=fdNGh2cW5O5IHdiMDtNfXXmAyLgqvK4s1wbKwSpNxH6O00ZVXsFfoLGSpTMO3qWR+f
 k+IoG4WyFBgPpSP8hTffa8x0u+SfAX+Fyrpy+2pxNtGljsMof6mq/3NYWLdzU/1hRQqW
 fopeGpIiA6s4GR61P93I4gqcsWygji4xfiBIyK3dX5+3uClIg2f+HroN1Qwfc9fKgfN/
 nYDEB8BSUyk0zAK4V/KOF5fvj3EJg05EgSTjBQSKbG6A61PlgkgomOvXQNAYHVAM8laK
 pLjG6ovvz7ebJ28ep0NV8E9GgU6diDdloFJMWYZ26cOpJpkw/BNMGQSz+x6dGTELiwww
 PDmA==
X-Gm-Message-State: AOJu0YxwGyiIm0oF8eUJDuP30qWC3iZLj4yFto8ybyHHsokN7En84HSK
 kMzFxSJNUTR9qiowo3O+190dA4T/uOOlAvbIB/0K4DFcrJ73pG0GBeyNEJoqBc1UD64aynaqKlw
 +efy0/8XYTDos9qBFgZPpW2+dkglZdaS64APxsX8s
X-Received: by 2002:a25:b0a1:0:b0:db5:50a4:5d8d with SMTP id
 f33-20020a25b0a1000000b00db550a45d8dmr2980174ybj.62.1701990018903; 
 Thu, 07 Dec 2023 15:00:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0avpExtnb0QEhd4giNpUXpAE03lNhEmhlHgyYyxAylqZ06Xwo4E+/RgU0lzyhjqXned4R+g==
X-Received: by 2002:a25:b0a1:0:b0:db5:50a4:5d8d with SMTP id
 f33-20020a25b0a1000000b00db550a45d8dmr2980142ybj.62.1701990018572; 
 Thu, 07 Dec 2023 15:00:18 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05621415c500b0067ac2df0199sm271427qvz.128.2023.12.07.15.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 15:00:18 -0800 (PST)
Date: Thu, 7 Dec 2023 17:00:15 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <nx2qggr3aget4t57qbosj6ya5ocq47t6w33ve5ycabs5mzvo7c@vctjvc5gip5d>
References: <20231206-stmmac-no-mdio-node-v2-1-333cae49b1ca@redhat.com>
 <e64b14c3-4b80-4120-8cc4-9baa40cdcb75@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <e64b14c3-4b80-4120-8cc4-9baa40cdcb75@lunn.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: don't create a
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

On Thu, Dec 07, 2023 at 10:30:23PM +0100, Andrew Lunn wrote:
> On Wed, Dec 06, 2023 at 05:46:09PM -0600, Andrew Halaney wrote:
> > The stmmac_dt_phy() function, which parses the devicetree node of the
> > MAC and ultimately causes MDIO bus allocation, misinterprets what
> > fixed-link means in relation to the MAC's MDIO bus. This results in
> > a MDIO bus being created in situations it need not be.
>
> Please extend that with something like....
>
> This is bad, because ....
>
> Most 'clean' driver unconditionally create the MDIO bus. But stmmac is
> not that clean, and has to keep backwards compatibility to some old
> usage. I'm just wondering what this patch actually brings us, and is
> it worth it. Is it fixing a real bug, or just an optimisation?
>
>    Andrew
>

It is an optimization for speeding up time to link up. I already sent
out v3 moments before this arrived, I'll be sure to capture that more
clearly in v4 (and wait a little longer before respinning it).

I'm trying to optimize this device configuration (as shown in the commit):
"""
    Here's[1] an example where there is no MDIO bus or fixed-link for
    the ethernet1 MAC, so no MDIO bus should be created since ethernet0
    is the MDIO master for ethernet1's phy:

        &ethernet0 {
                phy-mode = "sgmii";
                phy-handle = <&sgmii_phy0>;

                mdio {
                        compatible = "snps,dwmac-mdio";
                        sgmii_phy0: phy@8 {
                                compatible = "ethernet-phy-id0141.0dd4";
                                reg = <0x8>;
                                device_type = "ethernet-phy";
                        };

                        sgmii_phy1: phy@a {
                                compatible = "ethernet-phy-id0141.0dd4";
                                reg = <0xa>;
                                device_type = "ethernet-phy";
                        };
                };
        };

        &ethernet1 {
                phy-mode = "sgmii";
                phy-handle = <&sgmii_phy1>;
        };
"""

I'm seeing that ethernet1 scans the whole MDIO bus created for it, and
finds nothing, wasting time in the process. Since there's no mdio bus
described (since it's vacant) you get something like this call order:

    stmmac_mdio_register()
    of_mdiobus_register(new_bus, mdio_node) // mdio_node is NULL in this case
    __of_mdiobus_register(mdio, np, owner)  // this doesn't set phy_mask since np == NULL
    __mdiobus_register(mdio, owner)
    mdiobus_scan_bus_c22(bus)
    mdiobus_scan_c22()                      // Called PHY_MAX_ADDR times, probing an empty bus

Which is causing a good bit of delay in the time to link up, each
attempted probe is taking about 5 ms and that's just benchmarking the
get_phy_c22_id() calls, if you look at the whole loop it's greater (but I
am unsure if that's just scheduling contention or something else going
on, once I realized we were doing this work unnecessarily I decided to
try and remove it)

I know you said the standard is to make the MDIO bus unconditionally, but
to me that feels like a waste, and describing say an empty MDIO bus
(which would set the phy_mask for us eventually and not scan a
bunch of phys, untested but I think that would work) seems like a bad
description in the devicetree (I could definitely see describing an
empty MDIO bus getting NACKed, but that's a guess).

Please let me know if you disagree with that logic and have some
alternative solutions for optimizing. In either case I think this code
needs some cleaning so I'll carry this through. It also seems that
unconditional creation of the MDIO bus is something that's biting some
stmmac variants that lack an MDIO controller based on Serge's latest
comments on v3:

    https://lore.kernel.org/netdev/jz6ot44fjkbmwcezi3fkgqd54nurglblbemrchfgxgq6udlhqz@ntepnnzzelta/

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
