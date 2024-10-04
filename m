Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 584D09912FD
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Oct 2024 01:29:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01289C7802B;
	Fri,  4 Oct 2024 23:29:22 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21DA2C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 23:29:15 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5398ec2f3c3so3478742e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Oct 2024 16:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728084554; x=1728689354;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ex2CqobCrHYMdEDOFvV3TgWiBh8tlgxqvWb2s/WawSY=;
 b=T24Pe0HYYQiaNZ0R+lbPbIQV9tWluGtvHxvM/1Hi2G8+D/WnOm4qQROwRlgEC2jGv+
 7NQSG1Rmo9MGHjiKirMEkQOuvGfpta1kYi1Myjnwrx39rbNMH3FGuT1yOi08+Rc/BIFR
 il5XsoUL4xJQVFywYx+eIRCRx78C8+UgVcHOIo/4MbyuKJ4WTqz+GstvJSGpCJDbiTSt
 0BSRigaAYNY8P4av3f0WMgp8pwyueIlwO1NwFxMUaonNT/GKu1+xbEdolazYTkH4jrVt
 HUl09w18dwqXADMFC/lE9d0AnKPSQZfPLIuPK3s1cxJEPoJj5b8M1dAVY/0XNp24YxAx
 7Rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728084554; x=1728689354;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ex2CqobCrHYMdEDOFvV3TgWiBh8tlgxqvWb2s/WawSY=;
 b=Py+c5aYyzEkFtaUTJRURR7v1ynkq2zrlU3tGyRmXsZsfpj0jD2aS1mwzAZGhxanYJt
 F82MWzgIvDz/S7uL/rfsDYm4HJrvLZs7OlZUEWIfty/uGxQ8P2c1E7xNt8Rrva9+EnyH
 wIzBOcnORGE0t0c51h+pLjtXrZxTqKvpfY3pqFZBL9RA+yw3KErm77HYkmtMVopWWl3X
 tFuDQw7lT6tw5Fkt3eGg4F0YbzuIvIdpxUWQMZGDx798AIGqxCy1+5q4btgqAi8nQjS6
 6ixexgJIFkvcWe8cu0Xk6c7OjqVlxVNV1HpWEtC9yJ/ozWLxFW7W+jm5BWidgsm1hM03
 RgEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXERzL/VvOz3QppPhZZBZFRPbJ7e6W45MK6TYj+9rDsG9p4u9WbeGIcwykffDwyEkD0CNxeW6V+6WPq2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzdbbDtgfQyv0IybifPU39CT06Xpj2tf9EZyyfADjKGcY3sPM0M
 zjZFL7RL7DFtAsi6OwumJsI7cR2TdHRgabCZIEyujg9KgmNtlWLM
X-Google-Smtp-Source: AGHT+IH+tDh+zT+JlQyYhGaogqDETgzJYe2wwGAq406JNg1paWVoGvp/OoTKcL1enGDkx3qwp3/0Xg==
X-Received: by 2002:a05:6512:3d0b:b0:536:a533:c03a with SMTP id
 2adb3069b0e04-539ab87801bmr2666309e87.17.1728084553875; 
 Fri, 04 Oct 2024 16:29:13 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec828csm84367e87.77.2024.10.04.16.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 16:29:13 -0700 (PDT)
Date: Sat, 5 Oct 2024 02:29:10 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Message-ID: <dxkpa2abcz4nxmmrhrg5stwgenwdsyeah2box33fob2ssoot22@52smn4gv2qrb>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 00/10] net: pcs: xpcs: cleanups
	batch 1
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

On Tue, Oct 01, 2024 at 05:02:48PM GMT, Russell King (Oracle) wrote:
> Hi,
> 
> First, sorry for the bland series subject - this is the first in a
> number of cleanup series to the XPCS driver. This series has some
> functional changes beyond merely cleanups, notably the first patch.
> 
> This series starts off with a patch that moves the PCS reset from
> the xpcs_create*() family of calls to when phylink first configures
> the PHY. The motivation for this change is to get rid of the
> interface argument to the xpcs_create*() functions, which I see as
> unnecessary complexity. This patch should be tested on Wangxun
> and STMMAC drivers.
> 
> Patch 2 removes the now unnecessary interface argument from the
> internal xpcs_create() and xpcs_init_iface() functions. With this,
> xpcs_init_iface() becomes a misnamed function, but patch 3 removes
> this function, moving its now meager contents to xpcs_create().
> 
> Patch 4 adds xpcs_destroy_pcs() and xpcs_create_pcs_mdiodev()
> functions which return and take a phylink_pcs, allowing SJA1105
> and Wangxun drivers to be converted to using the phylink_pcs
> structure internally.
> 
> Patches 5 through 8 convert both these drivers to that end.
> 
> Patch 9 drops the interface argument from the remaining xpcs_create*()
> functions, addressing the only remaining caller of these functions,
> that being the STMMAC driver.

Better later than never. Just reached my hardware treasury and managed to
test the series out on the next setup:

DW XGMAC <-(XGMII)-> DW XPCS <-(10Gbase-R)-> Marvell 88x2222
<-(10gbase-R)->
SFP+ fiber SFP+
<-(10gbase-r)->
Marvell 88x2222 <-(10gbase-r)-> DW XPCS <-(XGMII)-> DW XGMAC

DW XGMAC was working under the STMMAC driver control.

No problem has been spotted. So

Tested-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> As patch 7 removed the direct calls to the XPCS config/link-up
> functions, the last patch makes these functions static.
> 
>  drivers/net/dsa/sja1105/sja1105.h                 |  2 +-
>  drivers/net/dsa/sja1105/sja1105_main.c            | 85 ++++++++++----------
>  drivers/net/dsa/sja1105/sja1105_mdio.c            | 28 ++++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  7 +-
>  drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c    | 18 ++---
>  drivers/net/ethernet/wangxun/txgbe/txgbe_type.h   |  2 +-
>  drivers/net/pcs/pcs-xpcs.c                        | 92 ++++++++++++++---------
>  include/linux/pcs/pcs-xpcs.h                      | 14 ++--
>  8 files changed, 132 insertions(+), 116 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
