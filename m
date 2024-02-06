Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E96384B8D6
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 16:08:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50291C6B476;
	Tue,  6 Feb 2024 15:08:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCB4DC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 15:08:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A926861536;
 Tue,  6 Feb 2024 15:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A01C433C7;
 Tue,  6 Feb 2024 15:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707232119;
 bh=y0RNzdVJndYWSP0vGgdOxK1NMGHChFiuRWotjCrpl0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1qyTm/0U+yzlb1K9Uzww22xl2BagUxKRr4E8pXRsIdKwRSutYO3C14gDCXxpMJ/d
 mPOgS/R5rdvmKhQPQqWgN6jB7CDkL8nbolZ2Qy/dVFSlBpc02UqkxXnh7lru3JQ6R+
 FHexHrssJkeJ0Fd0gepitxGMeB4XtUeU2WGxGWqZ3zdiPdsxBL08iYXnB8ZViIjSxA
 dIWYMhwbfW8ZcorLnhgSnUkLUOhsgtkMEZW26ZLWcZm+/Zd/OfuBb1lKum6H/aHwQE
 L/6ijl3lLIUQXQtXH+qlWsgLKPeSGfGP7TDQBtNzbBsFUoIx0ta5PUN+LzABn/gHKU
 RmXipacSQ1HGg==
Date: Tue, 6 Feb 2024 15:07:04 +0000
From: Simon Horman <horms@kernel.org>
To: Pavel Sakharov <p.sakharov@ispras.ru>
Message-ID: <20240206150704.GD1104779@kernel.org>
References: <20240203150323.1041736-1-p.sakharov@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240203150323.1041736-1-p.sakharov@ispras.ru>
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: Fix incorrect dereference in
	stmmac_*_interrupt()
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

On Sat, Feb 03, 2024 at 06:03:21PM +0300, Pavel Sakharov wrote:
> If 'dev' is NULL, the 'priv' variable has an incorrect address when
> dereferencing calling netdev_err().
> 
> Pass 'dev' instead of 'priv->dev" to the function.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Pavel Sakharov <p.sakharov@ispras.ru>

Thanks Pavel,

I agree with your analysis that this can result in a NULL dereference.
And that your proposed fix is good: netdev_err() can handle a NULL
dev argument.

As this seems to be a fix I suggest it should be for net.
And that it should be based on that tree and designated as such
in the subject:

Subject: [PATCH net] ...

Also if it is a fix, it should have a fixes tag.
Perhaps this one:

Fixes: 8532f613bc78 ("net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX")


I don't think there is a need to respin for the above, though please
keep this in mind when posting Networking patches in future.


Looking at the patch above, and stmmac_main.c, it seems that the following
functions also suffer from a similar problem:

static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
{
	struct stmmac_tx_queue *tx_q = (struct stmmac_tx_queue *)data;
	...
	dma_conf = container_of(tx_q, struct stmmac_dma_conf, tx_queue[chan]);
	priv = container_of(dma_conf, struct stmmac_priv, dma_conf);

	if (unlikely(!data)) {
		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
		...

And stmmac_msi_intr_rx(), which follows a similar pattern
to stmmac_msi_intr_tx().

I also note that in those functions "invalid dev pointer" seems misleading,
perhaps it ought to be "invalid queue" pointer.

As these problems seem to all have been introduced at the same time,
perhaps it is appropriate to fix them all in one patch?

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 4727f7be4f86..5ab5148013cd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5848,7 +5848,7 @@ static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id)
>  	struct stmmac_priv *priv = netdev_priv(dev);
> 
>  	if (unlikely(!dev)) {
> -		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
> +		netdev_err(dev, "%s: invalid dev pointer\n", __func__);
>  		return IRQ_NONE;
>  	}
> 
> @@ -5868,7 +5868,7 @@ static irqreturn_t stmmac_safety_interrupt(int irq, void *dev_id)
>  	struct stmmac_priv *priv = netdev_priv(dev);
> 
>  	if (unlikely(!dev)) {
> -		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
> +		netdev_err(dev, "%s: invalid dev pointer\n", __func__);
>  		return IRQ_NONE;
>  	}
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
