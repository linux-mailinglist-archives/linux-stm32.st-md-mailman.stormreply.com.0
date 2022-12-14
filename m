Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E764C483
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Dec 2022 08:54:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96591C65E7A;
	Wed, 14 Dec 2022 07:54:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E592FC65047
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Dec 2022 07:54:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6C9E61841;
 Wed, 14 Dec 2022 07:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5ACC433EF;
 Wed, 14 Dec 2022 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671004483;
 bh=93g2T3KhAXhgG13/7pvnSucwyl+V/l6zp5Waj7KK7fM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gfC+mMup11HUefG+BLYZD7E5ZU34eyZfbs7p82jwChzLgdsK1u/SNN+yXJ4YH/oG8
 u9UjygaxxLPV9j62vwdHENFRfUXH/cJgvDp1KJW4Oc69D9iPF37AVGE0hFXgDVs+5M
 p9ckSE6LbT6sVnuHMXTXZ8ZRKchKQebV2I0w5svRcuwWeqeb3PbHTFeknRt79+fxpx
 Mwisdjb3BYIhZSYdyJHqk2jfvo5+f2jXDpcMUgzo3CpZlWxGOgCW4yV6U9mTpG5sBI
 Us3e2cNwZny8hcOHs1gtRLoDHKLfFAY8/5xrhhLclkpffwRfAbB8mYkibWHqzSRufp
 IdA91KOOF8vFA==
Date: Wed, 14 Dec 2022 09:54:38 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Message-ID: <Y5mBPs/eYf4yVFfi@unreal>
References: <20221214034205.3449908-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221214034205.3449908-1-cuigaosheng1@huawei.com>
Cc: hawk@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, john.fastabend@gmail.com,
 ast@kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix errno when
 create_singlethread_workqueue() fails
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

On Wed, Dec 14, 2022 at 11:42:05AM +0800, Gaosheng Cui wrote:
> We should set the return value to -ENOMEM explicitly when
> create_singlethread_workqueue() fails in stmmac_dvr_probe(),
> otherwise we'll lose the error value.
> 
> Fixes: a137f3f27f92 ("net: stmmac: fix possible memory leak in stmmac_dvr_probe()")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Please change title of your patch to be "PATCH net"

Thanks
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
