Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD8C160949
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2020 04:53:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B69AC36B0B;
	Mon, 17 Feb 2020 03:53:05 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D1EFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2020 03:53:04 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 4EC611582D81F;
 Sun, 16 Feb 2020 19:53:01 -0800 (PST)
Date: Sun, 16 Feb 2020 19:53:00 -0800 (PST)
Message-Id: <20200216.195300.260413184133485319.davem@davemloft.net>
To: ilias.apalodimas@linaro.org
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200216094056.8078-1-ilias.apalodimas@linaro.org>
References: <20200216094056.8078-1-ilias.apalodimas@linaro.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sun, 16 Feb 2020 19:53:02 -0800 (PST)
Cc: mcoquelin.stm32@gmail.com, kuba@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
 linux-kernel@vger.kernel.org, jaswinder.singh@linaro.org, joabreu@synopsys.com,
 thomas.petazzoni@bootlin.com, jonathan.lemon@gmail.com, peppe.cavallaro@st.com,
 bpf@vger.kernel.org, lorenzo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 hawk@kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: page_pool: API cleanup and
	comments
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

From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Sun, 16 Feb 2020 11:40:55 +0200

> Functions starting with __ usually indicate those which are exported,
> but should not be called directly. Update some of those declared in the
> API and make it more readable.
> 
> page_pool_unmap_page() and page_pool_release_page() were doing
> exactly the same thing. Keep the page_pool_release_page() variant
> and export it in order to show up on perf logs.
> Finally rename __page_pool_put_page() to page_pool_put_page() since we
> can now directly call it from drivers and rename the existing
> page_pool_put_page() to page_pool_put_full_page() since they do the same
> thing but the latter is trying to sync the full DMA area.
> 
> Also update netsec, mvneta and stmmac drivers which use those functions.
> 
> Suggested-by: Jonathan Lemon <jonathan.lemon@gmail.com>
> Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

Applied to net-next, thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
