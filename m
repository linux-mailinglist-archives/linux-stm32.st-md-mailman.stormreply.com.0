Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EABF432F
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Oct 2025 02:54:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43486C5A4F9;
	Tue, 21 Oct 2025 00:54:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 159C5C5A4F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 00:54:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 84A2644E58;
 Tue, 21 Oct 2025 00:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F40AC4CEFB;
 Tue, 21 Oct 2025 00:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761008051;
 bh=GWRxTbKMIALWDNujjpFEp+EgSzbDooDkX5Xj1E6/bxg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KHLMJ6EyXs5/HPdCNWAj9X+qWyC60ZpVLNY2gqzR2nIfMD7otI0SfuiVYZ8jLavEV
 I0ElnaL32TSpS9VKMeZfyOoVVw+F7WM6w3/NBaPsjjxdfmiqNGvnBeOEIAghgsxX/9
 QY0Q16Ta26AdMpn+NpjO48Y8fTgmzgBHB3iWZpM6h5PZ8n10U7X4PLNYrceGxODVEh
 S/C9zssq5qdlAKcR560nunNsBjDCNmhc9OGkgxfbbyVHdOWrMc5DQe+IK4EGEx9Tx+
 i48tm5NU7Dbs7vyEkml57TR+QJTe+kZSS+5fNJPIklFpleWDWgPdQaVoCbpTXBfL96
 M5ioOAewcz9JA==
Date: Mon, 20 Oct 2025 17:54:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20251020175409.5098acd4@kernel.org>
In-Reply-To: <E1v9gFI-0000000Azbb-44bh@rmk-PC.armlinux.org.uk>
References: <E1v9gFI-0000000Azbb-44bh@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, s32@nxp.com,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: replace has_xxxx
	with core_type
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

On Fri, 17 Oct 2025 09:55:32 +0100 Russell King (Oracle) wrote:
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.

Looks like this also conflicts with the just-applied PCS series?
Either way - doesn't seem to apply for me :(
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
