Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0192AAC96D
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 17:25:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58F36C78F72;
	Tue,  6 May 2025 15:25:58 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E5ECC7802C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 15:25:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 18695A4D602;
 Tue,  6 May 2025 15:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D32C4CEE4;
 Tue,  6 May 2025 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746545155;
 bh=8n38TSBJmBwvs64PRmlNU+Hw9KwwnaLfXu8Gxhr7I4A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ibZ9lgxmL6bmeZofnWidzB/nTKHyL2JhpdcpMZYM5tAbA1gdfeEbbCaWIZeIUrZKJ
 BydPQgKYEEHIo7fdhSvv2L7/x7fE3kD/0v1cllQB1S2kgLRAqoJEvdxm6JHhhUHJHg
 OnGCkLgbOo9CE52Jsk7ZJBpgp2bDCcq4NKZIbhoJnkDZz0D2EGah6quZaFK2/CWJDt
 CA5WtciN71wqTGrCn3PVAKFfMKscX/y8LHf9fG969X1rfYU8ugWiHjGZXTs2uKsuNB
 tRO7EDY1h7b0MoSMglrL2Z9PEak9Jp0q/+1YPRKTGXG0Un/+6BMbF/H4dJoNy3elgT
 wQT1k2qgYD4/w==
Date: Tue, 6 May 2025 08:25:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250506082554.75959fec@kernel.org>
In-Reply-To: <aBnK4i52tEHs3jm_@shell.armlinux.org.uk>
References: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
 <E1uAqYC-002D3p-UO@rmk-PC.armlinux.org.uk>
 <ed54d4e5-ecc3-4327-8739-3d41ca41211e@lunn.ch>
 <aBUG6Z_Crs31W45x@shell.armlinux.org.uk>
 <aBnKKafHHjkL5iP-@shell.armlinux.org.uk>
 <aBnK4i52tEHs3jm_@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Thierry Reding <treding@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bpf@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/4] net: stmmac: call
 phylink_carrier_*() in XDP functions
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

On Tue, 6 May 2025 09:40:02 +0100 Russell King (Oracle) wrote:
> > Well, this series has been discarded from patchwork. Shrug. I won't be
> > posting another version, stmmac can remain broken. I don't have a
> > suggestion on better names for these functions.  
> 
> ... and in any case, Andrew's comment would be a *separate* change to
> the subject of this series, so is not appropriate to be part of this
> series.

Right, I think the state is purely due to the typo in kdoc of patch 1.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
