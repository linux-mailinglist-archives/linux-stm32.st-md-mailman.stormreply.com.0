Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA57D1B6
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Aug 2019 01:10:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09D0BC35E02;
	Wed, 31 Jul 2019 23:10:50 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BD3FC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 23:10:48 +0000 (UTC)
Received: from localhost (c-24-20-22-31.hsd1.or.comcast.net [24.20.22.31])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id CE1C1126598C9;
 Wed, 31 Jul 2019 16:10:45 -0700 (PDT)
Date: Wed, 31 Jul 2019 19:10:45 -0400 (EDT)
Message-Id: <20190731.191045.1364878383424980981.davem@davemloft.net>
To: brgl@bgdev.pl
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190730113814.13825-1-brgl@bgdev.pl>
References: <20190730113814.13825-1-brgl@bgdev.pl>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 31 Jul 2019 16:10:46 -0700 (PDT)
Cc: fisaksen@baylibre.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Use netif_tx_napi_add() for
 TX polling function
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

From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 30 Jul 2019 13:38:14 +0200

> From: Frode Isaksen <fisaksen@baylibre.com>
> 
> This variant of netif_napi_add() should be used from drivers
> using NAPI to exclusively poll a TX queue.
> 
> Signed-off-by: Frode Isaksen <fisaksen@baylibre.com>
> Tested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Applied and queued up for -stable.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
