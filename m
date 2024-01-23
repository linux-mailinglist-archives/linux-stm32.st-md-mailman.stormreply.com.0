Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA67C8399DB
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jan 2024 20:50:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D233C6DD6D;
	Tue, 23 Jan 2024 19:50:57 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77C71C6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 19:50:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9F9E0CE2FAE;
 Tue, 23 Jan 2024 19:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEEDC433C7;
 Tue, 23 Jan 2024 19:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706039451;
 bh=JdM9TTZCWN64d8b7V18qvRomhjSHitoxtF6sWalz8RI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bwKr99PE3PLFylNmMkGyJg3i1edGMRoBYyQsyR4msDUYiyaKA+xo0PT+Ml39I6VCz
 5KJzNMIGRbczBN3pyGyY4f2HijZ2uB9vOV0Elu/ityI2QNcsEeQGkNevri9zsn9HSS
 gORdqLmBQa58bsMPQMyiR2kCiZfserJZUXtRJFgvzXFKQ3X/dMnxzD7iKS7O1edEpW
 52h+gTd7u/ldFMhdOpaGqpdravlexlwdaNkLrCZIbThxPgdgATJ4S2FfA6viLqqaOr
 ogvZG+zNWX8wyKhfsUI8v3yjgWBNgESlASo9SAoJIqviMl/MhG+oH/bBFBWaJwGDqA
 Vt5yFiXXnLoCw==
Date: Tue, 23 Jan 2024 19:50:46 +0000
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240123195046.GQ254773@kernel.org>
References: <20240123085037.939471-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123085037.939471-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix safety error
	descriptions
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

On Tue, Jan 23, 2024 at 04:50:37PM +0800, Furong Xu wrote:
> Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> XGMAC core") prints safety error descriptions when safety error assert,
> but missed some special errors, and mixed correctable errors and
> uncorrectable errors together.
> This patch complete the error code list and print the type of errors.
> 
> Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> Signed-off-by: Furong Xu <0x1207@gmail.com>

I'm not entirely sure this is a fix rather than an enhancement.
But the code change itself looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
