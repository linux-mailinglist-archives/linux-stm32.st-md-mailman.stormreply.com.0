Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2147CA656
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Oct 2023 13:13:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C92EEC6B452;
	Mon, 16 Oct 2023 11:13:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EC58C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Oct 2023 11:13:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 238E660ED4;
 Mon, 16 Oct 2023 11:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE142C433CB;
 Mon, 16 Oct 2023 11:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697454788;
 bh=UAUugA1TRH3GNFHUIn31bVskNVQzeqghhP8ABGtukvE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YAqoi0iUbfPDUjpjVXO6wBfsmdA54PwDqLnlg/LzHbRnh41ED/N+x3X8P2cJ74Znt
 xi4jBbxym5JSYILiAXV3+mnyBwcrIKqXyRYQJK5zBax2zMJ0pllHT+nN8R09wIItqv
 edhkwzj2RH8z1Dcd3uFtC66uCpCcit/6Kbuq3ls+7HqxWwjKrPjOoZVE5Fswi5SWWd
 RkSfNglzLl/VHogRcITq0Jk3+9cfRjVpOG9tUwHzca6gLLNAwWPqs8pyjR/fqB6zdX
 oLtvR9mvjdu3grHwTTTUroGDWT3BNnOzCXG2XuKuAs3MnxhMp5C4zBsmi66yo8Nu2d
 E60hGccgKUtWw==
From: Vinod Koul <vkoul@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20231009082450.452877-1-amelie.delaunay@foss.st.com>
References: <20231009082450.452877-1-amelie.delaunay@foss.st.com>
Message-Id: <169745478541.211836.5231413059323245231.b4-ty@kernel.org>
Date: Mon, 16 Oct 2023 16:43:05 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: correct desc prep
 when channel running
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


On Mon, 09 Oct 2023 10:24:50 +0200, Amelie Delaunay wrote:
> In case of the prep descriptor while the channel is already running, the
> CCR register value stored into the channel could already have its EN bit
> set.  This would lead to a bad transfer since, at start transfer time,
> enabling the channel while other registers aren't yet properly set.
> To avoid this, ensure to mask the CCR_EN bit when storing the ccr value
> into the mdma channel structure.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: stm32-mdma: correct desc prep when channel running
      commit: 03f25d53b145bc2f7ccc82fc04e4482ed734f524

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
