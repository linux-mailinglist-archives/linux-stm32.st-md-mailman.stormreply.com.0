Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EE8842589
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 13:56:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44C27C6B477;
	Tue, 30 Jan 2024 12:56:58 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E283C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 12:56:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 71C9DCE16B0;
 Tue, 30 Jan 2024 12:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7882C433F1;
 Tue, 30 Jan 2024 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706619414;
 bh=8FYnOFzp7lrsJcX6tRJa4Cck3+U76gyyBXxVd460tLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jPThSBBSRd/OSe7say3+ieOOILpVTW2mxlLfh4SIqsRlKMCQqTQtnCYgyGs/xWLl4
 CD9hn5fXvy54KhAexNojsVqVQKCssGfY57JjsbqAM9my5jjijad1JsVjtJ0KH8G6TL
 s/dduCQ/IUMPwsmJ2iZJD3+NWHLMSqso9tLMXGspw0c03X3QZdEMiE/O9Q1Tsti4xx
 J4ySsVXrFTtGWY3XP382nQojtAo72yydO3PgwE6LXT27BBtVWTb5I3wpzwcjZP3ubl
 0nyK9BNMQNzZCNYtGumJ4Gi3T2wNVEFM6YFo7A2vK/SPo/NarIFzNfWEuNb3AElndn
 t24fkuBevoMlg==
Date: Tue, 30 Jan 2024 12:56:46 +0000
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Message-ID: <20240130125646.GD351311@kernel.org>
References: <20240125193420.533604-1-leitao@debian.org>
 <20240125193420.533604-6-leitao@debian.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125193420.533604-6-leitao@debian.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, linux-kernel@vger.kernel.org,
 edumazet@google.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, kuba@kernel.org,
 weiwan@google.com, pabeni@redhat.com, davem@davemloft.net,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net 05/10] net: fill in
 MODULE_DESCRIPTION()s for dwmac-socfpga
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

On Thu, Jan 25, 2024 at 11:34:15AM -0800, Breno Leitao wrote:
> W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> Add descriptions to the STMicro DWMAC for Altera SOCs.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
