Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3045AD9E17
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jun 2025 17:35:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C60FC36B3D;
	Sat, 14 Jun 2025 15:35:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F165C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jun 2025 15:35:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A50861126;
 Sat, 14 Jun 2025 15:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FDEC4CEEB;
 Sat, 14 Jun 2025 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749915317;
 bh=d/EY3r7M0Oqj/yKEoNpBZWTyk+esJAhtZ5aqvrMM2to=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TBrYjt+TsccDL8IyUV+0MyZuV+x2m0KQPMmUzqif+KvB70rMn7led0twGlZSOv+t0
 wqPvrCyT+uA9Z5XOlOIdI5pcbu5oVCQgUJvstu7ldKG+0EPa0GDztZqOzyorcowOzw
 4EBw4ObYoPcpy1d2xDYeU7Pz3mRHeHV+//E0H3qunHYBQ0UEorJrMi9euNHELcqIze
 eBLmuhZ4cmO+hJHlfjLgsN+nBTr783gvtcdcrg6DfSc9sgF8dL8wyoqJdlweEZA1MQ
 WIpCt2olStUt4E/jeV80IUcYJLSSgGemvn2xJ95HMx53m0jOpHWiESG443k3f+VgZ+
 KRQOty20KW+zg==
Date: Sat, 14 Jun 2025 16:35:12 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250614153512.GQ414686@horms.kernel.org>
References: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
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

On Thu, Jun 12, 2025 at 05:16:30PM +0100, Russell King (Oracle) wrote:
> Add ethqos_pcs_set_inband() to improve readability, and to allow future
> changes when phylink PCS support is properly merged.
> 
> Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks Russell,

The nit below notwithstanding this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index e30bdf72331a..2e398574c7a7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -622,6 +622,11 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
>  	}
>  }
>  
> +static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
> +{
> +	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);

FWIIW, I would have gone for the following, as all the type of
three of the trailing parameters is bool.

	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, false, false);

> +}
> +
>  /* On interface toggle MAC registers gets reset.
>   * Configure MAC block for SGMII on ethernet phy link up
>   */

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
