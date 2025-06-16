Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B64BAADB52F
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 17:23:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EC9EC35E00;
	Mon, 16 Jun 2025 15:23:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00FC9C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 15:23:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7982649D3A;
 Mon, 16 Jun 2025 15:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC8BC4CEED;
 Mon, 16 Jun 2025 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750087406;
 bh=DzAYX/OSHec4aneSP3rKdKZMDvBVK1lYEdX+ohzC8Z8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p4bSIrFatcQ42d88MaNSql4q5Dcs587b0VzQUEpNUgOZlHk+NN8C1yA1R7fPrwy+C
 78egzc9WK0QVzESvoMXRWSr0heoUW+1Cfc7Wqe4zx6sAym65yTvUPGQXZcvJ40NapN
 XenE3xQPdDEEliVJItbTX4Q6tmazd2OK2OtpkZfd7ZgVskQL1cuqSPWNm3em/l9Pf9
 sK5qZHWclWBSvkQo5B8tr8c0b3JtZVj36rX6tMEp5Ai9D/o/e2RRIcnMRPO8w6yWTa
 17dwO7u1Fs358bBpZcN8RxasCUeYIrfZDjv8V8GXoz2uS+ga3f6qDn9kCdkshrKQEu
 n7ytYrKkWv0IA==
Date: Mon, 16 Jun 2025 16:23:21 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250616152321.GD6918@horms.kernel.org>
References: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
 <20250614153512.GQ414686@horms.kernel.org>
 <aE29zFKp5PLAM5pP@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aE29zFKp5PLAM5pP@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: add
 ethqos_pcs_set_inband()
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

On Sat, Jun 14, 2025 at 07:22:04PM +0100, Russell King (Oracle) wrote:
> On Sat, Jun 14, 2025 at 04:35:12PM +0100, Simon Horman wrote:
> > On Thu, Jun 12, 2025 at 05:16:30PM +0100, Russell King (Oracle) wrote:
> > > Add ethqos_pcs_set_inband() to improve readability, and to allow future
> > > changes when phylink PCS support is properly merged.
> > > 
> > > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > Thanks Russell,
> > 
> > The nit below notwithstanding this looks good to me.
> > 
> > Reviewed-by: Simon Horman <horms@kernel.org>
> > 
> > > ---
> > >  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++++----
> > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > index e30bdf72331a..2e398574c7a7 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > @@ -622,6 +622,11 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
> > >  	}
> > >  }
> > >  
> > > +static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
> > > +{
> > > +	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
> > 
> > FWIIW, I would have gone for the following, as all the type of
> > three of the trailing parameters is bool.
> > 
> > 	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, false, false);
> 
> So the original code:
> 
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
>             stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
> 
> While one could convert the last two arguments to true/false, I'd prefer
> leaving them as is, as less change means less chance to introduce a bug.

Sure. No objections on my side.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
