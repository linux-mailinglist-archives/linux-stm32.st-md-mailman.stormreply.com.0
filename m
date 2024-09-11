Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF4C974875
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Sep 2024 05:09:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C17D5C78014;
	Wed, 11 Sep 2024 03:09:00 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3C56C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 03:08:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7E5D5A412DF;
 Wed, 11 Sep 2024 03:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DB3C4CEC3;
 Wed, 11 Sep 2024 03:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726024130;
 bh=HEMopyFpUu8HJoyo6/3G/2qXbBjpHn1icDfAGuvUUL8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qkc5suz42b+1q4lA5Sqr8EwF3Ml5GipTiZT9ykooM+Qp6DW2VLa1KT4ftQQlZdoYh
 eicfVfZC4fP1MFHxQ6yFV03y6qrOy0JmuZSyISJI4NmA3EzoH6SD0yj/4kQnMeXbRc
 urCd2KR9gdyU5JTSNuXDoKxkI8ej6MyEX6AaLfbV9AkXGM9ndJsOh1IzCNLhk+Vk9R
 i6Pu1aB9D97WUkhiBfwOAKdMCw939M2g5HIhImKk3TqNLyhqbWo1apohvoVdp3skWL
 eTI5CAYdElaDC5EhA9lhWnY9oRhZADU123CiIcWp2PsKB3JSFPH6wd+HVV82ufZ7R5
 BXLMgs+IdLr+g==
Date: Tue, 10 Sep 2024 20:08:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Li Zetao <lizetao1@huawei.com>
Message-ID: <20240910200848.0b028720@kernel.org>
In-Reply-To: <20240907031926.3591353-1-lizetao1@huawei.com>
References: <20240907031926.3591353-1-lizetao1@huawei.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, heiko@sntech.de, platform-driver-x86@vger.kernel.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 radhey.shyam.pandey@amd.com, florian.fainelli@broadcom.com,
 samuel@sholland.org, ruanjinjie@huawei.com, jernej.skrabec@gmail.com,
 linux-rockchip@lists.infradead.org, wens@csie.org, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
 ilpo.jarvinen@linux.intel.com, pabeni@redhat.com, yisen.zhuang@huawei.com,
 linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
 jacky_chou@aspeedtech.com, hauke@hauke-m.de, hdegoede@redhat.com,
 mchehab@kernel.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 salil.mehta@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, hverkuil-cisco@xs4all.nl, wellslutw@gmail.com,
 olteanv@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/10] net: Convert using
 devm_clk_get_enabled()/devm_clk_get_optional_enabled()
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

On Sat, 7 Sep 2024 11:19:16 +0800 Li Zetao wrote:
> v1 -> v2:
>   1) Patch 5 optimizes the check and adds commit information for easier
>   inspection.
>   2) It is no longer necessary to use clk, so delete the clk member of
>   the spl2sw_common structure.
>   3) Remove patches 11 and 12, they should be sent to wireless-next
>   individually

In addition to Christophe's suggestions the patches didn't get ingested
correctly into patchwork, due to the quick repost of:
https://lore.kernel.org/all/20240907031009.3591057-1-lizetao1@huawei.com/
without bumping the patch version...
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
