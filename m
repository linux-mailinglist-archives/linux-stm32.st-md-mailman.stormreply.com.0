Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E003545778
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 00:34:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B075C5EC76;
	Thu,  9 Jun 2022 22:34:48 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F113C5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jun 2022 22:34:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0C986B8309F;
 Thu,  9 Jun 2022 22:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAADBC34114;
 Thu,  9 Jun 2022 22:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654814085;
 bh=dBKNxF1K520/m+yTDNoLaoC08D0Nq4opdmEABWHhV8I=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=XovdbldpQO+DBhq6nk6NN7LeIskhttaZQ2olUiZBz2ZykiYgaOW53ykUJGboadOB3
 0rDylXVg8jT9DgReYt+rL5GgocnwP943cnntOyx/O5tm6TTXBcSTLc9tMysKFXmA5O
 FC4Qq2b2dm52kWEEVHokSqQYCQjH9/8ntHLk/F613pcXVmaDJwHWz43lwSThnE/CZB
 3lN4TDvy+qIQjEoS+YtU3UUIAlIpt+HsP+JtOPZAAeBn+vYxCtIchTP6bsIx+SWaW+
 iBpeA1Z+BQynXdDWsV2aqmZ4Ovx4JnRf8rAX5LGHK5IeeMcuv3sRw4nP+2wf1ezQJi
 dA8HiZhXVrtdw==
MIME-Version: 1.0
In-Reply-To: <20220608021154.990347-1-weiyongjun1@huawei.com>
References: <20220608021154.990347-1-weiyongjun1@huawei.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, weiyongjun1@huawei.com
Date: Thu, 09 Jun 2022 15:34:43 -0700
User-Agent: alot/0.10
Message-Id: <20220609223445.AAADBC34114@smtp.kernel.org>
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH -next] clk: stm32: rcc_reset: Fix missing
	spin_lock_init()
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

Quoting Wei Yongjun (2022-06-07 19:11:54)
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
> 
> Fixes: 637cee5ffc71 ("clk: stm32: Introduce STM32MP13 RCC drivers (Reset Clock Controller)")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-fixes
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
