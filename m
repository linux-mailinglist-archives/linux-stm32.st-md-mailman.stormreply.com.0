Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFDC97A53C
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Sep 2024 17:23:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7F08C78011;
	Mon, 16 Sep 2024 15:23:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25C5EC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2024 15:23:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 14CBD5C5B60;
 Mon, 16 Sep 2024 15:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD772C4CEC4;
 Mon, 16 Sep 2024 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726500210;
 bh=FF+mkLhhU8uH27RYqeySVdh6+IQVVTSZXcZ1I8HSanQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tN5W6ce94XXmdEQVD13WHFfzJPNTD2CJVS4cq5vSuxLAU2owRauPYKfQ5j2RVNfui
 LO8dSwTZG4LBSySzF4pxdpqg3soXomuYxFf7kUctuVEGWs7kYEcEV3+n9IBx7kp7AK
 wKmuJkMsx3EtB6ueC3R5MItUEd1svpOGgRpS4lj3pQ1Y9S0iTGuvCuf9oMhVKtJ1Gl
 nOy3kxGdoODuX5O9nj1HwA+68GU6+kviJBwhocOYUXeFKXa/X59KEAJBCm52Ndagm1
 OSr2EthyHoI0zCWijCb14abvGBjL1pIJuy9rZXyCjb9smAUQL9qzgJzUhFhSUv8YuP
 vGw9QwExaNJug==
Date: Mon, 16 Sep 2024 16:23:25 +0100
From: Simon Horman <horms@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <20240916152325.GB396300@kernel.org>
References: <20240916094812.29804-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240916094812.29804-1-minda.chen@starfivetech.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v1] stmmac: mmc: dwmac4: Add ip payload
	error statistics
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

On Mon, Sep 16, 2024 at 05:48:12PM +0800, Minda Chen wrote:
> Add dwmac4 ip payload error statistics, and rename discripter bit macro
> because latest version descriptor IPCE bit claims include ip checksum
> error and l4 segment length error.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Hi Minda,

Some feedback on process.

net-next is currently closed for the v6.12 merge window.
Please consider reposting this patch once it re-opens,
after v6.12-rc1 is released, likely about two weeks from now.

RFC patches, and fixes for net are, OTOH, welcome any time.

Also, when posting patches for net-next, please explicitly
target them as such.

	Subject: [PATCH net-next] ...

Link: https://docs.kernel.org/process/maintainer-netdev.html

And lastly, I don't think 'mmc: ' belongs in the patch prefix.
This is an Ethernet driver, right? Looking over git history,
it seems that 'net: stmmac: ' is appropriate here.

	Subject: [PATCH net-next] net: stmmac: ...

-- 
pw-bot: defer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
