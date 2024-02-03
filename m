Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39441847DFD
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Feb 2024 01:56:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B46B4C6DD98;
	Sat,  3 Feb 2024 00:56:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27734C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Feb 2024 00:56:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3AB462778;
 Sat,  3 Feb 2024 00:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F059CC433C7;
 Sat,  3 Feb 2024 00:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706921789;
 bh=OxV8pHXLyySJ/zKHrQvTD77VkTpEJB95ybnLcz5aFYs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LzvW/KmfUHM2tC7qzBRm8VaPKKrC7PEZKBXOmjUzSZNyyfCWYtgxF+4u9Hcohv+n+
 EBw95y1P/JIEphKYUT+sOhT9Nsi1iPphughPrl0sxsPX9qd+ip3miQszSEhf303NrW
 xN9atWmEbVE29RvGDzlgslKcjtoXIPrw6Rc+UoybggFq70Hp4qfKSadKm5EH9spr08
 kOOFMEpnpvzeFOy79GUyobBVyq8mTKQW1Jm6QukAtrTUqUi8yXttQGeck25FGPtU6x
 At3Od31DgR7g/FsTQ84olBQ0DkjnKlw8BQLizQX1GUvH/CHXAy6rpa8VIBPePU7/QA
 cfj1wECU56oFg==
Date: Fri, 2 Feb 2024 16:56:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20240202165627.64e0a628@kernel.org>
In-Reply-To: <ksfs7uag4yukqbeygch7pxvr5axyrqz4gunq2xes3ppmtrgm5b@hwh5yx5qz3wl>
References: <20240131020828.2007741-1-0x1207@gmail.com>
 <ksfs7uag4yukqbeygch7pxvr5axyrqz4gunq2xes3ppmtrgm5b@hwh5yx5qz3wl>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: xgmac: fix handling
 of DPP safety error for DMA channels
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

On Sat, 3 Feb 2024 00:58:39 +0300 Serge Semin wrote:
> If so, David/Jakub, is it possible to rebase the branch with the macro
> fixed in the commit or a new cleanup patch is the only option?

Cleanup patch is the only option :(
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
