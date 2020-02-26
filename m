Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83A16FCEF
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 12:06:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A64B5C36B0C;
	Wed, 26 Feb 2020 11:06:19 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E36EC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 11:06:18 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e10so3230259edv.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 03:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qD490qP8YoHuMggNJ+4rCSwLuR21SazsOZ1+Y/A5tXY=;
 b=nAB7CUTnvsBjhe/PIwUREoSD8Dtea7xSb4TC/ZjuCq1rN7YookFkVvp8f5NZr8ViuK
 JDwLBw/0dPnEXcIRSMONvffCxwYafU6qASRFtw2FNJWsgVFLjapX7Y4NaqL3meEK0zbK
 uNBpTss6XQOEf+r08uX1VGCQ0l4g5Jtd4g7oug1CoUkmD6Lkte+9/zOKo7RA7ZGzOP5h
 34i5PNdEEhbSXfsPuH7I/CNg7jeUY9/lkboGTTuf0f5N0YJ2dZrhkAngbkNKktHnf1FZ
 /TIxN12YKiz/RCiSaMauemnXMy4FcKVLARcxQHPhLrOT7xcsiujLwxQ2HYaqpa7W2KQZ
 s4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qD490qP8YoHuMggNJ+4rCSwLuR21SazsOZ1+Y/A5tXY=;
 b=kRywLUhvJrRYI1yyTV5LtgTZnLBhTV5D7BwDQna8Z9NS8SK2BMTTNLcnDgbE9nm7sR
 6q/SD4KoCBYsALOGD+9R/kwtdOt/mNgSToXBHIuJG/UWh/xxkcxs60OUENeIVzFgotP/
 2Tm6a2SmnvmWabpeJjKCU5XmDiDJ+mtmY/3yN6Ekj9qSR49yP2m8WejYADqj8XJpUzlJ
 uMb0Ctkn7J3NV8SxanYgZmY8ICKRLcdeo8Q0jjUmAPasEH0KcafPS42rBeAH8hU+jWvD
 ar6rUjeBIabejQeWsQIaNpNNsgv9N7HH8tNzO42J7MxerMNrnNcLl4xUoT+sgtY3zF9t
 GP2w==
X-Gm-Message-State: APjAAAVJdj7UW42icWk4GnCsoKXUWcfyB+0+LsUqzum6H7i4RUvHw8VA
 BqCG5b/EEWL61gCU/mC2CjXITESlDKpbc5fvivY=
X-Google-Smtp-Source: APXvYqxKn9EHYJorI3u34MIoTYZ1p/XSstU3KzZU6YSsE3nbzrut7Z7pjBq/4/6dZdIrJEtcRK8EZjxaPv8Js3jOl/c=
X-Received: by 2002:a05:6402:3046:: with SMTP id
 bu6mr4201533edb.139.1582715177721; 
 Wed, 26 Feb 2020 03:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20200226102312.GX25745@shell.armlinux.org.uk>
 <E1j6tqv-0003G6-BO@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1j6tqv-0003G6-BO@rmk-PC.armlinux.org.uk>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Wed, 26 Feb 2020 13:06:06 +0200
Message-ID: <CA+h21hrR1Xkx9gwAT2FHqcH38L=xjWiPxmF2Er7-4fHFTrA8pQ@mail.gmail.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
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
 Nicolas Ferre <nicolas.ferre@microchip.com>,
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

Hi Russell,

On Wed, 26 Feb 2020 at 12:23, Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> Propagate the resolved link parameters via the mac_link_up() call for
> MACs that do not automatically track their PCS state. We propagate the
> link parameters via function arguments so that inappropriate members
> of struct phylink_link_state can't be accessed, and creating a new
> structure just for this adds needless complexity to the API.
>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  Documentation/networking/sfp-phylink.rst      | 17 +++++-
>  drivers/net/ethernet/cadence/macb_main.c      |  7 ++-
>  .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  7 ++-
>  drivers/net/ethernet/marvell/mvneta.c         |  8 ++-
>  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 19 +++++--
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  7 ++-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +-
>  .../net/ethernet/xilinx/xilinx_axienet_main.c |  7 ++-
>  drivers/net/phy/phylink.c                     |  9 ++-
>  include/linux/phylink.h                       | 57 ++++++++++++++-----
>  net/dsa/port.c                                |  4 +-
>  11 files changed, 105 insertions(+), 41 deletions(-)
>
> diff --git a/Documentation/networking/sfp-phylink.rst b/Documentation/networking/sfp-phylink.rst
> index d753a309f9d1..8d7af28cd835 100644
> --- a/Documentation/networking/sfp-phylink.rst
> +++ b/Documentation/networking/sfp-phylink.rst
> @@ -74,10 +74,13 @@ phylib to the sfp/phylink support.  Please send patches to improve
>  this documentation.
>
>  1. Optionally split the network driver's phylib update function into
> -   three parts dealing with link-down, link-up and reconfiguring the
> -   MAC settings. This can be done as a separate preparation commit.
> +   two parts dealing with link-down and link-up. This can be done as
> +   a separate preparation commit.
>
> -   An example of this preparation can be found in git commit fc548b991fb0.
> +   An older example of this preparation can be found in git commit
> +   fc548b991fb0, although this was splitting into three parts; the
> +   link-up part now includes configuring the MAC for the link settings.
> +   Please see :c:func:`mac_link_up` for more information on this.
>
>  2. Replace::
>
> @@ -207,6 +210,14 @@ this documentation.
>     using. This is particularly important for in-band negotiation
>     methods such as 1000base-X and SGMII.
>
> +   The :c:func:`mac_link_up` method is used to inform the MAC that the
> +   link has come up. The call includes the negotiation mode and interface
> +   for reference only. The finalised link parameters are also supplied
> +   (speed, duplex and flow control/pause enablement settings) which
> +   should be used to configure the MAC when the MAC and PCS are not
> +   tightly integrated, or when the settings are not coming from in-band
> +   negotiation.
> +
>     The :c:func:`mac_config` method is used to update the MAC with the
>     requested state, and must avoid unnecessarily taking the link down
>     when making changes to the MAC configuration.  This means the

Just to make sure I understand the changes:
- A MAC with no PCS can be configured in either .mac_config or .mac_link_up
- A MAC that needs to be manually reconfigured to the link mode
negotiated by its PCS needs to have the PCS configured in .mac_config
and the MAC in .mac_link_up
- A MAC with PCS where the MAC follows the PCS negotiation
automatically in hardware is basically equivalent with a MAC with no
PCS, and therefore can be configured in either .mac_config or
.mac_link_up
Is this correct?

Regards,
-Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
