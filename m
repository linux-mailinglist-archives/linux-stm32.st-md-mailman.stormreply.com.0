Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9A46D5329
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 23:11:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68E40C6A610;
	Mon,  3 Apr 2023 21:11:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6EFBC6A60B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 21:11:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81C6262B58;
 Mon,  3 Apr 2023 21:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D797DC433EF;
 Mon,  3 Apr 2023 21:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680556276;
 bh=3hxbwLfIPBSErZH0ZG4KR9ETcZ0/kYnkHQG9lfQbWlE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=m5M/pTq++F1ExgqRnygB2EGIaIg67uk+aaQxJRIbyxbDHnIkK2GC7r57PIcmmzo0g
 Ba2ddfaBEb9WwjXQUnh/Xohe15O6d/Eo0iniBHC4kejB9dCLcAVBe43rVXHIT4TFOQ
 mo5EUQf9egMSOC3mdC8k+rveF8QAilZVbHWEKyPqX4nR0hvDpRT0MMmfxjG/dcQlGm
 9hUeTMCOLuTZIn7EuBJOBPj9IndtiAheTkN3iL72ZLzkI9M+jTitWS54YbU+Er336O
 r2zeYRXiTC/xcMOAlwlBRCJIj5lttacpeUbFUQy+qVtm6RHErQXZZbNXOGpVJv5hCz
 yECGqPHkv8rOw==
Message-ID: <d93bd6ff1ce2401fd9a33c6a3ed065d2.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <e08a470fbd6151ebd83a548714c08807a80a8ad0.1680364296.git.christophe.jaillet@wanadoo.fr>
References: <e08a470fbd6151ebd83a548714c08807a80a8ad0.1680364296.git.christophe.jaillet@wanadoo.fr>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Mon, 03 Apr 2023 14:11:14 -0700
User-Agent: alot/0.10
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] clk: stm32h7: Remove an unused field in
	struct stm32_fractional_divider
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

Quoting Christophe JAILLET (2023-04-01 08:52:12)
> 'mmask' has never been used in this driver.
> Remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
