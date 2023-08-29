Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3715F78C6CB
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Aug 2023 16:05:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60AE3C6A60C;
	Tue, 29 Aug 2023 14:05:06 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15DD0C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1693317905; x=1724853905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HIjB6DSGcDiXSyJUkfXprhzVVBjmfilf4Wii2YLRbOw=;
 b=KQ1dJI90DtU789iIxdXZC3jy1UDBtcn+6jG+36/OMP6P8MEBsFviiV1J
 /2FW95DMdbRL+WrMmKV+ZslHRz3nPJaxQs+quTMJCyvs702F7rppGI0ao
 MhK4o+ieyhYUtSyLeF8uinLI5Lt72FVRRCQINLTbpomxzmRxdn5L6xwyw
 FfHYPanzOZ1fROCFrv/SX92IVpluvnXCRARGuEfbFKPKKfaNZdUlolQa9
 kbgGXyZfTHTMUJ7g3ur6HUB0Fu+BG5cvQygXTKGQnaxNWX/6ifTkMQJQs
 j/wjp3akiCgGImSzOyBmZcZkJcbW7EjxQPveB8qZfi2/Kq6Jorlhwea/p Q==;
X-IronPort-AV: E=Sophos;i="6.02,210,1688421600"; d="scan'208";a="32680003"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 29 Aug 2023 16:05:04 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0271E280045;
 Tue, 29 Aug 2023 16:05:03 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 29 Aug 2023 16:05:03 +0200
Message-ID: <4507976.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <E1qayn0-006Q8J-GE@rmk-PC.armlinux.org.uk>
References: <E1qayn0-006Q8J-GE@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: failure to probe
	without MAC interface specified
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Am Dienstag, 29. August 2023, 15:29:50 CEST schrieb Russell King (Oracle):
> Alexander Stein reports that commit a014c35556b9 ("net: stmmac: clarify
> difference between "interface" and "phy_interface"") caused breakage,
> because plat->mac_interface will never be negative. Fix this by using
> the "rc" temporary variable in stmmac_probe_config_dt().
> =

> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> I don't think the net tree is up to date with the net-next, so this
> patch needs applying to net-next preferably before the pull request
> to fix a regression.

On top of next-20230829:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks

> Thanks.
> =

>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c index
> 35f4b1484029..0f28795e581c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -419,9 +419,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, =
u8
> *mac) return ERR_PTR(phy_mode);
> =

>  	plat->phy_interface =3D phy_mode;
> -	plat->mac_interface =3D stmmac_of_get_mac_mode(np);
> -	if (plat->mac_interface < 0)
> -		plat->mac_interface =3D plat->phy_interface;
> +	rc =3D stmmac_of_get_mac_mode(np);
> +	plat->mac_interface =3D rc < 0 ? plat->phy_interface : rc;
> =

>  	/* Some wrapper drivers still rely on phy_node. Let's save it while
>  	 * they are not converted to phylink. */


-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
