Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 038A69C3BD0
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 11:25:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A06F3C78F60;
	Mon, 11 Nov 2024 10:25:54 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89B01C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 10:25:47 +0000 (UTC)
Received: from fedor-21d0 (unknown [10.10.165.9])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1670440B2295;
 Mon, 11 Nov 2024 10:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 1670440B2295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1731320746;
 bh=Hfjqn7SDOIyQITK6gpOpUjN15fT1QwZHztZC4zX812A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rIuqH2vAytZns3wNa36rXMzC4BLTmXefN/cD3DYvYqdxnQr0BkkQ8PSw5RUy2qpVM
 fveb3CnNu3Gtzxko9BHvXbDd+BhzGR2K1ZoHJdKRTeOGfC/SXCeqmxQW/YTWM4CEgG
 WxzkJ7N8eNqCrcdopvi/jDySjA0HuDoQQE5L90ec=
Date: Mon, 11 Nov 2024 13:25:42 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <20241111-def1390bf54ce26f76be250c-pchelkin@ispras.ru>
References: <20241108173334.2973603-1-mordan@ispras.ru>
 <e1b263d8-adc0-455b-adf1-9247fae1b320@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1b263d8-adc0-455b-adf1-9247fae1b320@stanley.mountain>
Cc: lvc-project@linuxtesting.org, lkp@intel.com, netdev@vger.kernel.org,
 Vadim Mutilin <mutilin@ispras.ru>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vitalii Mordan <mordan@ispras.ru>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, oe-kbuild@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH net v2]: stmmac: dwmac-intel-plat: fix
 call balance of tx_clk handling routines
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

Hi,

On Mon, 11. Nov 12:39, Dan Carpenter wrote:
> smatch warnings:
> drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c:163 intel_eth_plat_probe() error: we previously assumed 'dwmac->data' could be null (see line 101)

There is a patch [1] targeted at net-next tree which removes the check. I
think there should be v2 posted soon.

As it's not the first time Smatch is pointing at this issue [2], is there
something to improve? I mean, posting the patches in form of a series or
explaining in commit message that the check is redundant and is a subject
for removal? Adding new redundant checks for the fix-patch would not be
good..

What would be the most appropriate way?

[1]: https://lore.kernel.org/netdev/20240930183926.2112546-1-mordan@ispras.ru/
[2]: https://lore.kernel.org/netdev/20241003111811.GJ1310185@kernel.org/

--
Thanks,
Fedor
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
