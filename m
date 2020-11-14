Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 818782B30AD
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Nov 2020 21:45:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28FD9C5660F;
	Sat, 14 Nov 2020 20:45:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B047C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Nov 2020 20:45:09 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com
 (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E31922245;
 Sat, 14 Nov 2020 20:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605386708;
 bh=55zxoyo1mw5dFVi7p+0C1p3Xc0RC5j9O+Cjwpd28/ws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ckAxn0Pt2y0h2Lt0+FbrNqdH6Du3v4N1NoglM7MmQ3sJfy5ol4xd2jl2BHcP8sA4w
 xYvXpui1Y4e6m6f5ofe+Dqwv9Kgy1Tb0f4wmI1lnsfE4lt8DfSAGR8lMRK8FR0h7Ul
 fLU/rFawQBFiJRPnQ7K/QDpubI/U2bqdjnqt8ot8=
Date: Sat, 14 Nov 2020 12:45:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wong Vee Khee <vee.khee.wong@intel.com>
Message-ID: <20201114124506.13847db4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201112144948.3042-1-vee.khee.wong@intel.com>
References: <20201112144948.3042-1-vee.khee.wong@intel.com>
MIME-Version: 1.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Use rtnl_lock/unlock
 on netif_set_real_num_rx_queues() call
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

On Thu, 12 Nov 2020 22:49:48 +0800 Wong Vee Khee wrote:
> Fix an issue where dump stack is printed on suspend resume flow due to
> netif_set_real_num_rx_queues() is not called with rtnl_lock held().
> 
> Fixes: 686cff3d7022 ("net: stmmac: Fix incorrect location to set real_num_rx|tx_queues")
> Reported-by: Christophe ROULLIER <christophe.roullier@st.com>
> Tested-by: Christophe ROULLIER <christophe.roullier@st.com>
> Cc: Alexandre TORGUE <alexandre.torgue@st.com>
> Reviewed-by: Ong Boon Leong <boon.leong.ong@intel.com>
> Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ba855465a2db..33e280040000 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5278,7 +5278,10 @@ int stmmac_resume(struct device *dev)
>  
>  	stmmac_clear_descriptors(priv);
>  
> +	rtnl_lock();
>  	stmmac_hw_setup(ndev, false);
> +	rtnl_unlock();
> +
>  	stmmac_init_coalesce(priv);
>  	stmmac_set_rx_mode(ndev);
>  

Doesn't look quite right. This is under the priv->lock which is
sometimes taken under rtnl_lock. So theoretically there could be
a deadlock.

You should probably take rtnl_lock() before priv->lock and release 
it after. It's pretty common for drivers to hold rtnl_lock around 
most of the resume method.

With larger context:
 

        mutex_lock(&priv->lock);
 
        stmmac_reset_queues_param(priv);
 
        stmmac_clear_descriptors(priv);
 
+       rtnl_lock();
        stmmac_hw_setup(ndev, false);
+       rtnl_unlock();
+
        stmmac_init_coalesce(priv);
        stmmac_set_rx_mode(ndev);
 
        stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
 
        stmmac_enable_all_queues(priv);
 
        mutex_unlock(&priv->lock);
 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
