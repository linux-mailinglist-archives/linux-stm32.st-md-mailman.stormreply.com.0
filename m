Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F009A42F0F
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 22:29:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 125AAC78F89;
	Mon, 24 Feb 2025 21:29:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2685CC78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 21:29:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 13D3361129;
 Mon, 24 Feb 2025 21:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB4CC4CED6;
 Mon, 24 Feb 2025 21:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740432579;
 bh=2wIuo2JpNrpSXzbijZXMds2t2FH5opDQp0MBirv33i0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zi8MSJVFCqiwf9OUs5sWKRYW6666HCAE9LClfaJJdld4CT/dvQKA+mFh2yqDuuYBh
 T+ucoLngVzPbDBvHyZ5jfD9Ggsqclh1bmtQc+l9ErARAKBGVnboakH0OrS9fPEZ4l0
 8AyA1C0Zpy48ekBhKpai+u1Byg0pgOq3QvgeVDrgjuf8uQRvg0gorn02FYrtDEAV5R
 OaLvg3LI+yxKXvmuIFCs67v+udlk1dVD32+Sv3v6OY2Qr/NRNFLFngTo3ChIDJ5txa
 mNxBw3qqV55ohBwvQCa9yjuCXY8UEdbWpXalhDGoMxEFF3XaKBqiujWbxBDrRjd/sw
 Lfca3buOi7lPw==
Date: Mon, 24 Feb 2025 13:29:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250224132938.4b352786@kernel.org>
In-Reply-To: <Z7yjLjfNq89vPnOd@shell.armlinux.org.uk>
References: <Z7yGdNuX2mYph8X8@shell.armlinux.org.uk>
 <E1tmZjr-004uJP-82@rmk-PC.armlinux.org.uk>
 <Z7yjLjfNq89vPnOd@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwc-qos: clean
 up clock initialisation
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

On Mon, 24 Feb 2025 16:49:50 +0000 Russell King (Oracle) wrote:
> On Mon, Feb 24, 2025 at 02:47:19PM +0000, Russell King (Oracle) wrote:
> > Clean up the clock initialisation by providing a helper to find a
> > named clock in the bulk clocks, and provide the name of the stmmac
> > clock in match data so we can locate the stmmac clock in generic
> > code.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>  
> 
> Yet more warnings and errors from NIPA, yet this patch passes my local
> build tests.
> 
> As no one looked at v1, I don't see the point of waiting 24h before
> posting v3... no one is probably looking at v2.

NIPA builds with W=1 C=1, FWIW, looks like a sparse warning.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
