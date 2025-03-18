Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B669A67B5E
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 18:50:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDF23C7802F;
	Tue, 18 Mar 2025 17:50:38 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC24EC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 17:50:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 516A1A48C28;
 Tue, 18 Mar 2025 17:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D290C4CEF0;
 Tue, 18 Mar 2025 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742320236;
 bh=05dV3XU+mkBc9epGa05z7Ilnv35DhfiJI5QbiveCVaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SEtfdg4hz79B8jrpwRwn2cl9oYH73z/gds+uQ/pYSRMJOYKFTDpp8ii7283VGc1Ds
 klTmWdF4rqn3mRKo9ZrkyE+h36AFAXZ9FtXKcrhS9cpPYyc/MvoqkUwRukqrGBLv7K
 5RbN2ST8KQNqatL8CIBU1/tpS39nMDEJBFtiZS9O/eJhBMpaBYvZo8ftLO0J1cBDHr
 DxpoTg6DFuEMkLw+QEeLZdA7CCIXTp5FGNqtIejpFAOJIqvIM/rnGnrGqu+4Sj+lXh
 kfjKTaeSeSLgdxhMl4E4COs4/8WsN8dfeHy4ryy8+e669gAhnKW88hfwAoqxMa2yvX
 jp0ZHf3aABIaQ==
Date: Tue, 18 Mar 2025 17:50:31 +0000
From: Simon Horman <horms@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Message-ID: <20250318175031.GT688833@kernel.org>
References: <20250313161422.97174-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250313161422.97174-2-phasta@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>, netdev@vger.kernel.org,
 Yinggang Gu <guyinggang@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] Clean up deprecated PCI calls
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

On Thu, Mar 13, 2025 at 05:14:20PM +0100, Philipp Stanner wrote:
> Spiritual successor of this older series, of which one patch has already
> been merged [1]
> 
> P.
> 
> [1] https://lore.kernel.org/netdev/20250226085208.97891-1-phasta@kernel.org/
> 
> Philipp Stanner (3):
>   stmmac: loongson: Remove surplus loop
>   stmmac: Remove pcim_* functions for driver detach
>   stmmac: Replace deprecated PCI functions

Hi Philipp,

Unfortunately this series did not apply cleanly to net-next when the CI ran.
Please rebase and repost, including Jacob's tags.

-- 
pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
