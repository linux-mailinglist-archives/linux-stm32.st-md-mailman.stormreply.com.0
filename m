Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8F86BF7F6
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Mar 2023 06:21:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D65E4C6907C;
	Sat, 18 Mar 2023 05:21:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71C8DC65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 05:21:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E3A860A0C;
 Sat, 18 Mar 2023 05:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40A0C433D2;
 Sat, 18 Mar 2023 05:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679116879;
 bh=ArRYF4BA+E7Tyz1BYurYG5giIOqMsCRLQshVwP1KzDc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=obBbpX0QIRFajzPFiKavuEO5zhPk40CAT4gY88WL4IyupBpK4gsuXPsZMaOCT4TPE
 e6S6+n51fuWf0HzlpYrOptXdxgZU6Sq/FcblaBiR+vnlRENDjnoNVEMaL0vjMCrU9A
 z9qQq5vJXSs6vXxe3l5LRjlCOMKqC+ebv3TF4wI1Dx2KrpuYqZFBR0dQAoW2DlcbXc
 wywhFKzC0ovE1BTfFhIivZ8QGbDdRPTar6nBnSRwRXRq0ei8DHYBkHZ+DH+530CrLO
 DTjHkC8Ompu8DRdROTMy9QSCQB9FnZ8mMXfgaxmvNrvU2yYEBQvKQSXWJVe/r5gejk
 m2qqC7WlF+MTw==
Date: Fri, 17 Mar 2023 22:21:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jochen Henneberg <jh@henneberg-systemdesign.com>
Message-ID: <20230317222117.3520d4cf@kernel.org>
In-Reply-To: <20230316075940.695583-2-jh@henneberg-systemdesign.com>
References: <20230316075940.695583-1-jh@henneberg-systemdesign.com>
 <20230316075940.695583-2-jh@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Topics: 
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net V2 1/2] net: stmmac: Premature loop
 termination check was ignored on rx
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

On Thu, 16 Mar 2023 08:59:39 +0100 Jochen Henneberg wrote:
> The premature loop termination check makes sense only in case of the
> jump to read_again where the count may have been updated. But
> read_again did not include the check.
> 
> Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
> Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index e4902a7bb61e..ea51c7c93101 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5221,10 +5221,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  			len = 0;
>  		}
>  
> +read_again:
>  		if (count >= limit)
>  			break;

Are you sure? Can you provide more detailed analysis?
Do you observe a problem / error in real life or is this theoretical?

As far as I can tell only path which jumps to read_again after doing
count++ is via the drain_data jump, but I can't tell how it's
discarding subsequent segments in that case..

> -read_again:
>  		buf1_len = 0;
>  		buf2_len = 0;
>  		entry = next_entry;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
