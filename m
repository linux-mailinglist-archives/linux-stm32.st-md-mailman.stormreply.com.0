Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF5657AB77
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Jul 2022 03:13:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0053C640F5;
	Wed, 20 Jul 2022 01:13:07 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38A39C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jul 2022 01:13:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8C830B81DDD;
 Wed, 20 Jul 2022 01:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBDBC341CF;
 Wed, 20 Jul 2022 01:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279584;
 bh=vqXj7XcdFd9Log8wvaLARZBQdPJgW9zLErQWSV79MdA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K3pSe4msWE2Awk/GAmbgus7yuRnAsXc9l2XCHhoy1nCqgYCa4vukN2Y86rG66baSP
 6vm6+5zguf+tG4L776e+Lb8rpB4/vzd3HgdrcV/8mts5mg+UxMC1tiyVtamBWk/q06
 rsFWmQQLZMoV3FOSaTIY+fzYDU4tNPK2wBy22alnE977cmESn7R1mlboYF2OTCW7yA
 KAjeW3AaKHrbo4E6PcbZM7niAoMit9aOwSm7YL11Qbt4dENe4PZ1eDKaYhjQsQc/wn
 uw/oPI/PbgXUr2aAD0KvBSxdedWioQ6ToAk35vg33KgEXPxqj6TxQgjqGLu6TLHakc
 Yq6I8euJ/dS3w==
Date: Tue, 19 Jul 2022 18:13:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <20220719181302.292961f6@kernel.org>
In-Reply-To: <20220719013219.11843-1-ansuelsmth@gmail.com>
References: <20220719013219.11843-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH v4 0/5] Add MTU change with
 stmmac interface running
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

On Tue, 19 Jul 2022 03:32:14 +0200 Christian Marangi wrote:
> This series is to permit MTU change while the interface is running.
> Major rework are needed to permit to allocate a new dma conf based on
> the new MTU before applying it. This is to make sure there is enough
> space to allocate all the DMA queue before releasing the stmmac driver.

Other than the kdoc nit, LGTM!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
