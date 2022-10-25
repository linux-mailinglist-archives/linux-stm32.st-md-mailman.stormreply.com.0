Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23060C26F
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Oct 2022 06:00:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3D8CC03FC9;
	Tue, 25 Oct 2022 04:00:24 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7C62C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Oct 2022 04:00:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E401B8068D;
 Tue, 25 Oct 2022 04:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CFBC433D7;
 Tue, 25 Oct 2022 04:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666670421;
 bh=3TINTyanXuh5N7qudvfxQz6WRFTsujLwEF2pzywIiiE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P+KnXybmZVUF8gekFdWhYtiDldRQa2c58xCgS3Ba/n5uiZdtsuWFZ+YgTBOfCxIHh
 2JmNbKMTzQwkP8wWeXWN2Os2mG4mnBgJ/9yKp58256KL8zWaqwPMtdEdg+ArHDKycg
 02kzSCX5iq2Y4S4E3QzNG7VeZ3438EHSHLKAVtGBxw4wmKzSVRuj17oS7aN+z19Y1z
 +ImrrVUaFfuvbjHy2V8HvOYinRuzKFsSkySjPDDzVwHxyFMXzwzVfdn0W2UwUYgWRG
 dTP7g6yEgrQosSJxkBhpHnNRj89zSHufDIwjY3zdGheve31DXS+GteBnYkIAMaW8zX
 kUU5UgHNUKAbw==
Date: Mon, 24 Oct 2022 21:00:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Junxiao Chang <junxiao.chang@intel.com>
Message-ID: <20221024210019.551e64ae@kernel.org>
In-Reply-To: <20221021114711.1610797-1-junxiao.chang@intel.com>
References: <20221021114711.1610797-1-junxiao.chang@intel.com>
MIME-Version: 1.0
Cc: Joao.Pinto@synopsys.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: fix unsafe MTL
	DMA macro
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

On Fri, 21 Oct 2022 19:47:10 +0800 Junxiao Chang wrote:
> Macro like "#define abc(x) (x, x)" is unsafe which might introduce
> side effects. Each MTL RxQ DMA channel mask is 4 bits, so using
> (0xf << chan) instead of GENMASK(x + 3, x) to avoid unsafe macro.
> 
> Fixes: d43042f4da3e ("net: stmmac: mapping mtl rx to dma channel")

You need to point out an existing usage where this is causing problems,
otherwise this is not a fix.

And squash the two patches together, it's going to be easier to review.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
