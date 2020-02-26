Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7902D170784
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 19:22:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24123C36B0B;
	Wed, 26 Feb 2020 18:22:02 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53B6CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 18:21:59 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p23so4992424edr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 10:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ovPhpjCazhkBuPF/3ZKvkZXEB2wEDICs1R4JyVb9o08=;
 b=OI9iBUUhfV6cJMJ9vJ68G9/cgbTv1wHVcLG3LksGDJejAEymTYAcHNfYaJykBuoCYe
 87vy3ZZP1+u0TaBtMLFbjh8l7ziIjEh+V4M8f3I/wxUqb7Ew7PxoqQKRR4ZT048Ejzju
 wyU8A8YVqsth1rJFgn/NB5jkfes01W6LkbdTqYBI3MdZ3P4j2c9kTfU1x/BUFK72+5IV
 JHmXKtnRhNimBUw3yac7D0HrmV6Y9w5aJcXVxQLAIsogWJzBZqOeGnjOwt/ZvdBqUHO5
 x7txNWnt26x8UvtluXLhrabAHgxXnevK2t8iE7HXNw6RDu5P2EuMWsvI9OG7e6P2h/P+
 cEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ovPhpjCazhkBuPF/3ZKvkZXEB2wEDICs1R4JyVb9o08=;
 b=jN1yY2K7I0wbx2I/CuaUR66pq5BW/re1GLnAgNXesOeJwZXLawlT59s/ER+GNFqlQ8
 dqmuIhAO62VXzNgip8ca9aSxI+Q8FdGvcjbEjGEWwmrpCOY+5WWk8FUhhH4R62SBp/Ip
 ASXcjYNeopI4Bti6tr+6xlo/EU2POHDHpCXhHZ2cAjH0QQKgZc2ftLXe1sWhv7BwTzWh
 9mu+FhT55ufpV63ohWVApz03WC1/uWtlNyoUQKJGBvA8ISOE9mzCLMkYuQXEakWodXM+
 HZqBFN6TpV2JuH8brab9HAFmiG6YKeXX9+iTWRlvIIu+/6NEBTijlp2q+sKFKFmkUkEq
 ViJQ==
X-Gm-Message-State: APjAAAU6+5u6fcn9JkOv6RcDcX1WUjJ8TMa2cz3AsnSoSlRk0r1B7Flf
 h3SP+S6EHEH5sd/kz7JAWKOtu89WH9bJ8NWhqu8=
X-Google-Smtp-Source: APXvYqyWWHDLBD74C4KrlGNwJKHlt0Sr7+Pr/k5MqDzX2pGa8p/QrMHHNyTSgjdqd2CIME9nHLlZVrItPU00x+MTPeA=
X-Received: by 2002:a05:6402:128c:: with SMTP id
 w12mr643997edv.368.1582741318899; 
 Wed, 26 Feb 2020 10:21:58 -0800 (PST)
MIME-Version: 1.0
References: <20200226102312.GX25745@shell.armlinux.org.uk>
 <E1j6tqv-0003G6-BO@rmk-PC.armlinux.org.uk>
 <CA+h21hrR1Xkx9gwAT2FHqcH38L=xjWiPxmF2Er7-4fHFTrA8pQ@mail.gmail.com>
 <20200226115549.GZ25745@shell.armlinux.org.uk>
 <CA+h21hqjMBjgQDee8t=Csy5DXVUk9f=PP0hHSDfkuA746ZKzSQ@mail.gmail.com>
 <20200226133614.GA25745@shell.armlinux.org.uk>
In-Reply-To: <20200226133614.GA25745@shell.armlinux.org.uk>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Wed, 26 Feb 2020 20:21:47 +0200
Message-ID: <CA+h21hqHfC0joRDhCQP6MntFdVaApFiC51xk=tUf3+y-C7sX_Q@mail.gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/8] net: phylink: propagate
 resolved link config via mac_link_up()
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

On Wed, 26 Feb 2020 at 15:36, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
>
> dpaa2 is complicated by the firmware, and that we can't switch the
> interface mode between (SGMII,1000base-X) and 10G.
>
> If the firmware is in "DPMAC_LINK_TYPE_PHY" mode, it expects to be told
> the current link parameters via the dpmac_set_link_state() call - it
> isn't clear whether that needs to be called for other modes with the
> up/down state (firmware API documentation is poor.)
>

With PCS control in Linux, I am pretty sure that you don't want
anything other than DPMAC_LINK_TYPE_PHY anyway.
Basically in DPMAC_LINK_TYPE_FIXED, the MC firmware is in control of
the PCS and polls its link state to emit link notifications to objects
connected to the DPMAC. So Linux control of PCS would class with
firmware control of the PCS, leading to undesirable side-effects to
say the least.

> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up

Regards,
-Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
