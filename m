Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F0B948065
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 19:37:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7B2DC71290;
	Mon,  5 Aug 2024 17:37:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC675C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2024 17:37:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B9BD260DBA;
 Mon,  5 Aug 2024 17:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0263C4AF0E;
 Mon,  5 Aug 2024 17:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722879465;
 bh=JIGgOS2dCgTDrX3lTsYGuJfpVwJU61RQ1OJxNXDBCYg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Vvivqelms7v+wTRT/e57tNZXSagGa2ZZBLXLYVZEy5f7k+onoJOPxiy1A2tCz2P17
 Sqd5bATwstmvw16c4hn4ffAx+GlnmC55UIvtqmiM7uuo5+cLWZMCvV4lOkjcIVhMfw
 D5SVNWigi5owMO1ZuQuQi0Ak4CLfKbdWEX9k3UoA5rbUzsnjNnUy5y1SDPQjd2F1eM
 wqBOfPgV2D6tmoaJkfzURtur14sqJut3eRlDFx9HDMUo3IIW7p1gCVF6NFFsbQmROB
 XeHpkmcz8uZcycHZRNEuDQkcbsn1K/8b+nrWuIAnFWgvQ4QVhKAwxwd3Fxi8qwXGfk
 qraozYsu5cpBw==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Kees Cook <kees@kernel.org>
In-Reply-To: <20240716213830.work.951-kees@kernel.org>
References: <20240716213830.work.951-kees@kernel.org>
Message-Id: <172287946248.489034.17199555217262087392.b4-ty@kernel.org>
Date: Mon, 05 Aug 2024 23:07:42 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dma3: Set lli_size after
	allocation
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


On Tue, 16 Jul 2024 14:38:33 -0700, Kees Cook wrote:
> With the new __counted_by annotation, the "lli_size" variable needs to
> valid for accesses to the "lli" array. This requirement is not met in
> stm32_dma3_chan_desc_alloc(), since "lli_size" starts at "0", so "lli"
> index "0" will not be considered valid during the initialization for loop.
> 
> Fix this by setting lli_size immediately after allocation (similar to
> how this is handled in stm32_mdma_alloc_desc() for the node/count
> relationship).
> 
> [...]

Applied, thanks!

[1/1] dmaengine: stm32-dma3: Set lli_size after allocation
      commit: b53b831919a0dc4e6631ebe0497ab2a4d8bef014

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
