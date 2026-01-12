Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D6D13A3C
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 16:26:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5BEBC5A4CA;
	Mon, 12 Jan 2026 15:26:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11EE6C57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 15:26:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B006B44267;
 Mon, 12 Jan 2026 15:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D07C16AAE;
 Mon, 12 Jan 2026 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768231600;
 bh=sl2zm1e8Xq0C8os/T82of2ab0lap0J3S5GZLuulyDb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mMgY08iKCGvYXO0xquWj3zGWAf1+lPX1wT5sJkOUXKw8wHMLGXXL3pX7OfJurCeuu
 uhRIcHMuE5FkVFmKePGuC+Rkfw3N/Sc7Uk+Pc4d4TXlFT2NX/XnRtiCExy3lrmmpMv
 viPo65VWzeR9ElfqRCjsaKEttO7jeR6lrSTeCI7kMaOtqtgimshvazNP9kPk8EPRvT
 yMZfZjvleM5RwPDgfS5CYbaqf2r6AdP3Jl5y1sEtVr42UYRcBsZQLb0Zcmn7mRqPpC
 sU7+BckoguXjGIv2CmJPr28c23q1R+QxBK6PQoEMQzYk6ts1+2c9A4RIxWIvj4T07w
 bfSI8o3QLOA8w==
Date: Mon, 12 Jan 2026 15:26:35 +0000
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Message-ID: <aWUSq925KrWXh0Rg@horms.kernel.org>
References: <20260108-gxring_stmicro-v2-1-3dcadc8ed29b@debian.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-gxring_stmicro-v2-1-3dcadc8ed29b@debian.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: convert to use
 .get_rx_ring_count
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

On Thu, Jan 08, 2026 at 03:43:00AM -0800, Breno Leitao wrote:
> Convert the stmmac driver to use the new .get_rx_ring_count
> ethtool operation instead of implementing .get_rxnfc for handling
> ETHTOOL_GRXRINGS command.
> 
> Since stmmac_get_rxnfc() only handled ETHTOOL_GRXRINGS (returning
> -EOPNOTSUPP for all other commands), remove it entirely and replace
> it with the simpler stmmac_get_rx_ring_count() callback.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Changes in v2:
> - no change from v1. Basically resending it now that net-next is open.
> - Link to v1: https://patch.msgid.link/20251222-gxring_stmicro-v1-1-d018a14644a5@debian.org

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
