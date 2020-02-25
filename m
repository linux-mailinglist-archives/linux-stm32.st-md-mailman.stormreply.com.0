Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BD616F8D2
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 08:55:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27C10C36B0E;
	Wed, 26 Feb 2020 07:55:28 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ACFFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2020 21:09:47 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id v28so1003904edw.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2020 13:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ReknaT/FHBXByMXGGadMEzL/WYd/+sCy+KAJpp5ZwQ=;
 b=g6gfdjSUOo1daNt5JbO1OW+lwH1wDg11Aag/ldGmhkKkxyuiYo8+Th2fgxoAQQ4hXq
 TRfwhYem3PhxViqcWuVx+VibsoPJtyTVagbuspEnHeQYaT2u/LwJMeu3LbXXCD0Gb+P0
 kRLDLX6J05YQ2Y8hv4+QoX7W+8th93s38oDKyijo7aUk+0WA/Q35uUeEjwKyuKG1sJKb
 pHrmZYL+Ul2ujJ6ECXARZynFXSJa6Fk0D+GxbQh8iZeV9tRAEnb/IR6xJlRYeIfUjO0K
 m+I0aO92UvVW8NrmhRC7I6GzDK8oveynokyluJrJ/ckLFboCtOu9kXc5lv28q9nFAWd2
 pQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ReknaT/FHBXByMXGGadMEzL/WYd/+sCy+KAJpp5ZwQ=;
 b=hVkB6z99gBariKFDCcjN0Lizh2A6ijGxnodNECWU3QDgchX567cO99M6ka3y8on2bw
 kYZaguCPc747yZi4bNL17Dr7SFdfFSJLJXMtkI8nv9VWeXQQrHuPDYpxGfRgTnSEeG3V
 UmqBBSuDqZWeQju8zKuQCZwXNYrh0LT+7cwpev9qTk9wWDwbsLUlKMgtQy137sTypI49
 3P9xaAjwJrWqCPVtuzgxba0kbLcKtQQiYAqNoNmJ4NU/aopMAMpk7nwG1pI4rALChz/I
 ISg4f9hPVV44z/RRB5oggkC8tdq5HhbuGM3GY/cuQe1WYHMit0esDs+xZfFizrPTIP/U
 b+CQ==
X-Gm-Message-State: APjAAAXUFcUj9DkugTefCeaLx3GQRyzSmYgUi0IxOWNufhS2KdG3ca/u
 DoMxUSg484ZfEVW4ZG+kYdgebECDkt6MbRw0BKs=
X-Google-Smtp-Source: APXvYqyAzVm/wNR8w7wh+lAC7aHiC7zE7iGdWgqO+BLhvYvGS2dy2yiQw4bZhX/VBimWuHByQuf8RvIEP4SD4vbjH9A=
X-Received: by 2002:a05:6402:128c:: with SMTP id
 w12mr909815edv.368.1582664986639; 
 Tue, 25 Feb 2020 13:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20200225093703.GS25745@shell.armlinux.org.uk>
 <E1j6Wg0-0000Ss-W7@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1j6Wg0-0000Ss-W7@rmk-PC.armlinux.org.uk>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 25 Feb 2020 23:09:35 +0200
Message-ID: <CA+h21hp8KCqhCasOAGz17k0eRteHVVYK-eANQmn4h443qv=2JQ@mail.gmail.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
X-Mailman-Approved-At: Wed, 26 Feb 2020 07:55:27 +0000
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [Linux-stm32] [PATCH net-next 2/8] net: dsa: propagate resolved
	link config via mac_link_up()
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

On Tue, 25 Feb 2020 at 11:39, Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> Propagate the resolved link configuration down via DSA's
> phylink_mac_link_up() operation to allow split PCS/MAC to work.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/dsa/b53/b53_common.c       | 4 +++-
>  drivers/net/dsa/b53/b53_priv.h         | 4 +++-
>  drivers/net/dsa/bcm_sf2.c              | 4 +++-
>  drivers/net/dsa/lantiq_gswip.c         | 4 +++-
>  drivers/net/dsa/mt7530.c               | 4 +++-
>  drivers/net/dsa/mv88e6xxx/chip.c       | 4 +++-
>  drivers/net/dsa/sja1105/sja1105_main.c | 4 +++-
>  include/net/dsa.h                      | 4 +++-
>  net/dsa/port.c                         | 3 ++-
>  9 files changed, 26 insertions(+), 9 deletions(-)
>

It looks like you missed the felix_phylink_mac_link_up() conversion in
this patch? (which also makes it fail to build, by the way, I'm
supposed the Kbuild robot didn't already jump)
Nonetheless, I've manually added the missing speed, duplex, tx_pause
and rx_pause parameters, and it appears to work as before.
Same for sja1105.

Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Regards,
-Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
