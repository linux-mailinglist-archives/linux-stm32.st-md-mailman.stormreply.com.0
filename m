Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F6B64C4B7
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Dec 2022 09:10:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD442C65E7A;
	Wed, 14 Dec 2022 08:10:41 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9CEAC65047
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Dec 2022 08:10:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 340CCB81636;
 Wed, 14 Dec 2022 08:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BD8C433EF;
 Wed, 14 Dec 2022 08:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671005437;
 bh=+zeXN5WosSUBbyyksAsVntvHbGVEsx9KgPHCEaV47NU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V+3cDGjLFdTIIVZSXUTZNjn58MwVidDTAFPnff9rXCEMo1dyIq9fMJn8N9UoVQ5I8
 P8/rjIAjfLEIhwDy9KngMMUQLU6oxytvWUlhlx28vuF76gTkX8JYTlUDDJocpp7jQ1
 pTPXxJppunVcUSVxAXFGQa1YB50DS01v3LFOkMR0ozekMRwqyyg8nBcx5Wf11rl1ms
 0kEnK1VKywrDCDJvuRF6DLh9JztADRZ74NQjnO6cnKPDw7zzBQ1FTNaPByNMQqxulS
 9blt93uIzwXBJyZcqa1JTUEUusBDCkUCkE4g8kjg4wkhEjk8D8Yu/Udm3NlNVD+eMh
 AYleLAIjcEeXQ==
Date: Wed, 14 Dec 2022 10:10:33 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Message-ID: <Y5mE+UB9tVppXJr+@unreal>
References: <20221214080117.3514615-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221214080117.3514615-1-cuigaosheng1@huawei.com>
Cc: hawk@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, john.fastabend@gmail.com,
 ast@kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net,
 v2] net: stmmac: fix errno when create_singlethread_workqueue()
 fails
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

On Wed, Dec 14, 2022 at 04:01:17PM +0800, Gaosheng Cui wrote:
> We should set the return value to -ENOMEM explicitly when
> create_singlethread_workqueue() fails in stmmac_dvr_probe(),
> otherwise we'll lose the error value.
> 
> Fixes: a137f3f27f92 ("net: stmmac: fix possible memory leak in stmmac_dvr_probe()")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
> v2:
> - Change title of this patch to be "PATCH net", thanks!
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
>  1 file changed, 1 insertion(+)
> 

It is so shameful that on Fixed commit, my tag too :(.
Sorry about that.

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
