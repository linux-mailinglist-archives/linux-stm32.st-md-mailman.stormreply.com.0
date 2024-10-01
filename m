Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C5798C06C
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2024 16:41:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5659C78012;
	Tue,  1 Oct 2024 14:41:10 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A57C4C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 14:41:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7132FA43814;
 Tue,  1 Oct 2024 14:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E070EC4CEC6;
 Tue,  1 Oct 2024 14:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727793662;
 bh=yH3EYi9l7999VMvJhbJUAJ9GmVhEmuscSZSWkWCB8eE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tfiFt8H8f9Iy5Ux8P2ifGd4nOe5WPqJcQE0W29n9xYt4iS5yfGaifJqaRVskFaV8P
 T3SW+GYwqr7vy3aPyLse/BDE96odIUhBJpZI+P9BoY3m5w4Q20ByXBMuaV7Az0ldt5
 8JY6Jr6r0y8H20aaYhC3rq7FQNNzifxxUqGDEO+yhWVs1SZchLCIJCvBbjLCxMXcSd
 bDVJ5vC2WVfY0+4dtB4Yw2j+fjSAwf2fP9ydXNXYz/v6XDC3RLcbMd4GaQTTO7GYJ6
 oYPXAiuSoT6od4r/nYgzdG+xeKr/voBwVx/tFKgIgPSEpnAbqB8u2yBeh6KyZTr7xA
 +bR6AXwGv4dVw==
Date: Tue, 1 Oct 2024 16:40:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <nxle4pkngjnzguo4dzkc4hthggfovvzfvrkygdcy7mygkebxyi@yl72fievk2bh>
References: <20240930192820.59719-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930192820.59719-1-marex@denx.de>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 kernel@dh-electronics.com, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] i2c: stm32f7: Do not prepare/unprepare
 clock during runtime suspend/resume
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

On Mon, Sep 30, 2024 at 09:27:41PM GMT, Marek Vasut wrote:
> In case there is any sort of clock controller attached to this I2C bus
> controller, for example Versaclock or even an AIC32x4 I2C codec, then
> an I2C transfer triggered from the clock controller clk_ops .prepare
> callback may trigger a deadlock on drivers/clk/clk.c prepare_lock mutex.
> 
> This is because the clock controller first grabs the prepare_lock mutex
> and then performs the prepare operation, including its I2C access. The
> I2C access resumes this I2C bus controller via .runtime_resume callback,
> which calls clk_prepare_enable(), which attempts to grab the prepare_lock
> mutex again and deadlocks.
> 
> Since the clock are already prepared since probe() and unprepared in
> remove(), use simple clk_enable()/clk_disable() calls to enable and
> disable the clock on runtime suspend and resume, to avoid hitting the
> prepare_lock mutex.
> 
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

I think we also need:

Fixes: 4e7bca6fc07b ("i2c: i2c-stm32f7: add PM Runtime support")
Cc: <stable@vger.kernel.org> # v5.0+

I'm adding them, please, let me know if you think they are not
needed.

For now I merged this patch in i2c/i2c-host-fixes.

Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
