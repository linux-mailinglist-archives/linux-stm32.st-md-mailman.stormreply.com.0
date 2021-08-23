Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 667983F4EA5
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Aug 2021 18:44:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 051D1C5718D;
	Mon, 23 Aug 2021 16:44:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 842FFC57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Aug 2021 16:44:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55BF6610F8;
 Mon, 23 Aug 2021 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629737066;
 bh=7w5FXWeb8P/JBu4RqLDy7fzGAXbval5K4YO4wkz3Tn8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QRPsy8S1buyVDP9dLd+eDgJJ0x7b+mpjd+QiKp17gSoCfIyr9cTC4G+Px9ZSVsWbl
 OdMipVIHQKzyX4St+fNM8uMsktO3/osoQjVeJb+ijLUj8UaVHBY/dPo+oZdngbIXh0
 ep3Odv0n41HiNoR6MKshMxFAVDF3GuvV55qj3gaFSjUPLv194qHl5K/prEJ2Jauk+C
 e7gxbFkoiMd3hTXRZB1zMeM+AORbj1pyS+jfibY7MCqLj9NvEk/Y1qiEDIlMLsUvUO
 1HifTcI35mpL7oJFxzbg1laOWr4bUQKUdazBHG6sSSPv2vX4rvZJvnGTTJXsBfuyAM
 O0suswGiISgGQ==
Date: Mon, 23 Aug 2021 09:44:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Message-ID: <20210823094425.78d7a73e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210823143754.14294-1-michael.riesch@wolfvision.net>
References: <20210823143754.14294-1-michael.riesch@wolfvision.net>
MIME-Version: 1.0
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-rockchip@lists.infradead.org, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: fix unbalanced
 pm_runtime_enable warnings
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

On Mon, 23 Aug 2021 16:37:54 +0200 Michael Riesch wrote:
> In the commit to be reverted, support for power management was
> introduced to the Rockchip glue code. Later, power management support
> was introduced to the stmmac core code, resulting in multiple
> invocations of pm_runtime_{enable,disable,get_sync,put_sync}.

Can we get a Fixes tag? I.e. reference to the earliest commit where 
the warning can be triggered?

> The multiple invocations happen in rk_gmac_powerup and
> stmmac_{dvr_probe, resume} as well as in rk_gmac_powerdown and
> stmmac_{dvr_remove, suspend}, respectively, which are always called
> in conjunction.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
