Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE879E5C48
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 17:55:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 242DBC7801B;
	Thu,  5 Dec 2024 16:55:43 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0BA7C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 16:55:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 28A5CA43798;
 Thu,  5 Dec 2024 16:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A48C4CED1;
 Thu,  5 Dec 2024 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733417740;
 bh=EY2JQ1OUdq1nkq0OdGBKVLh8IN+KP3uYIHf4Esw6NRo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FsksfZd0UGkgpt4kFjDeehzYfX1wWHKpJRUTy8PStAUQmjAv0rzo+gYYiM0Kpv8gd
 TwSsdqFrZdUqGcTCRan1r1FKO8vrCp3xTCeZpByPwNiIImHynYkIoUE+EYAIJ4TiNz
 bwjQnhdE3oi9sBxJen7FRV3c2WxvzrwLpe72KQ11wIqcMcfG4mMefh9IZ0Yqg0XTD3
 kz3Sh2R83u3gQU2cA+Cg0ujPk6IM6ih32Uiacv1lH0DKkfin+77+2M/fYrgAS6ZTCc
 JxEM2KSVCnU9CkGK/K/Shy2FD3JouWHu0xfygwPBQZ4z9oQHwZqWtDeue+SIByIYFX
 n8MdRot1Ly8YQ==
Date: Thu, 5 Dec 2024 08:55:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20241205085539.0258e5fb@kernel.org>
In-Reply-To: <Z1HYKh9eCwkYGlrA@shell.armlinux.org.uk>
References: <20241205091830.3719609-1-0x1207@gmail.com>
 <Z1HYKh9eCwkYGlrA@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Jon Hunter <jonathanh@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unaligned
 DMA unmap for non-paged SKB data
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

On Thu, 5 Dec 2024 16:43:22 +0000 Russell King (Oracle) wrote:
> I'm slightly disappointed to have my patch turned into a commit under
> someone else's authorship before I've had a chance to do that myself.
> Next time I won't send a patch out until I've done that.

Yes, this is definitely not okay. LMK if you dropped this from your
TODO already, otherwise I'm tossing this patch and expecting the fix
from the real author.

Side rant - the Suggested-by tag is completely meaningless, maybe we
should stop using it. The usage ranges from crediting people pointing
out issues in basic code review, to crediting authors when stealing
their code. What is the point.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
