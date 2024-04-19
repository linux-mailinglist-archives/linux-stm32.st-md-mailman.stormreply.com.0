Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3368AA6B5
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 03:53:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98DAAC6DD67;
	Fri, 19 Apr 2024 01:53:35 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D99BC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 01:53:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5A6BDCE1909;
 Fri, 19 Apr 2024 01:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E6DC113CC;
 Fri, 19 Apr 2024 01:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713491610;
 bh=MYLR6N6n0EJwAup/aFkpHCNwIWRltBcvf8lipAcV6rE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OcXbXpwpKvxerW53Z/tCPH9JAZLM+UZuGz9QJLb5nbh0UPIy5ufe3FI4XAL6Pl4FZ
 WXuSTAm7ucsU0TXHaAabT16/e8QUrhifETxAjUDiGDjQ54+W2XBz2fvblElPPLHXoN
 CUjDig3uIZCZaW2bkFQ2eenzPrvkcQf2LLSkgn3rYYUPtG5Ub7Z/QTnKlFQIQCQvwb
 GbbKU82r2wqDU4BHv4hTx8Pvj3RLsKhlUW7/IlWTy/rVzYCouALSXw3PLVr6XESiRr
 5vNtXZp2Q6KEi3u5+/bTVJBMFsjMWi4RFEsx3AwUn0tHQMxpOOPyP+YR42uGAIBX8h
 dF7rjEiHZDa1A==
Date: Thu, 18 Apr 2024 18:53:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20240418185328.79c38358@kernel.org>
In-Reply-To: <20240417140013.12575-1-fancer.lancer@gmail.com>
References: <20240417140013.12575-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/2] net: stmmac: Fix
 MAC-capabilities procedure
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

On Wed, 17 Apr 2024 17:00:06 +0300 Serge Semin wrote:
> The series got born as a result of the discussions around the recent
> Yanteng' series adding the Loongson LS7A1000, LS2K1000, LS7A2000, LS2K2000
> MACs support:
> Link: https://lore.kernel.org/netdev/fu3f6uoakylnb6eijllakeu5i4okcyqq7sfafhp5efaocbsrwe@w74xe7gb6x7p
> 
> In particular the Yanteng' patchset needed to implement the Loongson
> MAC-specific constraints applied to the link speed and link duplex mode.
> As a result of the discussion with Russel the next preliminary patch was
> born:
> Link: https://lore.kernel.org/netdev/df31e8bcf74b3b4ddb7ddf5a1c371390f16a2ad5.1712917541.git.siyanteng@loongson.cn
> 
> The patch above was a temporal solution utilized by Yanteng for further
> developments and to move on with the on-going review. This patchset is a
> refactored version of that single patch with formatting required for the
> fixes patches.
> 
> The main part of the series has already been merged in on v1 stage. The
> leftover is the cleanup patches which rename
> stmmac_ops::phylink_get_caps() callback to stmmac_ops::update_caps() and
> move the MAC-capabilities init/re-init to the phylink MAC-capabilities
> getter.

According to the build bot it didn't apply at the time of posting :S
It does apply now but the bot doesn't have a "retry now" button.
Could you repost?
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
