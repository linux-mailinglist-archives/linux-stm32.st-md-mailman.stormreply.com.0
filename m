Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95308645631
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Dec 2022 10:13:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50BCAC65E6B;
	Wed,  7 Dec 2022 09:13:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 306DCC65E5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 09:13:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E6AE60BC3;
 Wed,  7 Dec 2022 09:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAABBC433C1;
 Wed,  7 Dec 2022 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670404409;
 bh=eS/FqO4dJ70H+Gw9HdEBtknKGdxHesbCy+r25riz/G8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cBzmAWspWNRBSswWavNnGco+Lf8bRF41RxCGsNnmIOpiwbP9F4fAgLdWZ7AomrpTQ
 ybfBXA4Vz7eYAYMfvyCY8BtfZgJ7P2ZkBJPyg8CLGJ36o6ML7EBdIrCyZvTB77/kyM
 liGQKUiFlYJyIqkK4ExOR9g2JTXm99I8VvbO0C/Ihs2yJLeFw21Ns11VCjspHye5/2
 gy9+MNjZZh0/8FkbV2PmHZaCT+xyBxeIrHJ/Pho/5OwfNVFAozx2nxoSg1E+W7o1Fw
 Ej2Hp2e9i8jWppE3izNfds9wHqI2O6hPuj4mefgZcQw+0XiZRzQ/YJlpeVnKDCGcz4
 /HXUEBUAg9URQ==
Date: Wed, 7 Dec 2022 11:13:24 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Message-ID: <Y5BZNKkSpE4W/aUF@unreal>
References: <20221207083413.1758113-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221207083413.1758113-1-cuigaosheng1@huawei.com>
Cc: hawk@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, john.fastabend@gmail.com,
 ast@kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix possible memory leak
 in stmmac_dvr_probe()
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

On Wed, Dec 07, 2022 at 04:34:13PM +0800, Gaosheng Cui wrote:
> The bitmap_free() should be called to free priv->af_xdp_zc_qps
> when create_singlethread_workqueue() fails, otherwise there will
> be a memory leak, so we add the err path error_wq_init to fix it.
> 
> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
