Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C81EBC1763B
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 00:43:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 320E6C62D22;
	Tue, 28 Oct 2025 23:43:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C811FC62D21
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 23:43:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B04AC60423;
 Tue, 28 Oct 2025 23:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87C0C4CEE7;
 Tue, 28 Oct 2025 23:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761694979;
 bh=yf6La/yW+fAW9vXD7xqyZT4cnQekTq6yWJ+U87ek5aU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kDdCQXRqa1q+juk8aW57ol8x2a/4OlhvmYypN4PEefUdMp65mfzmqMwchQ20wagfq
 5S2HWPiYLc7BMPhFBkuKpoTIGAp4bdpRtncHyUQb+ABiu4zav6/WxgEXrzVAuAVloW
 Fc0nc4+EjLEr3eyZ1hv3yF1KfPoIQ24vo8LVKkJQwlrD5NVUTB6+NDnfwNYgPstmpE
 F24HwJqZFjbLZUkXx40fVmaauBUnFhK2HGjSlJAMKhofod9Q4XH6CgJtxs87pofUDt
 /177iltAlTicNcWjkgdPOjMWy7uaRUDpruZhwk1boJm8ndFh3/Y64gIMYyaSqZcIQb
 FTeNdikC6e4ow==
Date: Tue, 28 Oct 2025 16:42:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20251028164257.067bdbcd@kernel.org>
In-Reply-To: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
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

On Fri, 24 Oct 2025 13:48:23 +0100 Russell King (Oracle) wrote:
> This series cleans up hwif.c:
> 
> - move the reading of the version information out of stmmac_hwif_init()
>   into its own function, stmmac_get_version(), storing the result in a
>   new struct.
> 
> - simplify stmmac_get_version().
> 
> - read the version register once, passing it to stmmac_get_id() and
>   stmmac_get_dev_id().
> 
> - move stmmac_get_id() and stmmac_get_dev_id() into
>   stmmac_get_version()
> 
> - define version register fields and use FIELD_GET() to decode
> 
> - start tackling the big loop in stmmac_hwif_init() - provide a
>   function, stmmac_hwif_find(), which looks up the hwif entry, thus
>   making a much smaller loop, which improves readability of this code.
> 
> - change the use of '^' to '!=' when comparing the dev_id, which is
>   what is really meant here.
> 
> - reorganise the test after calling stmmac_hwif_init() so that we
>   handle the error case in the indented code, and the success case
>   with no indent, which is the classical arrangement.

This one needs a respin (patch 6 vs your IRQ masking changes?).
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
