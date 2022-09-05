Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A17A5ACA80
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 08:22:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CAD3C0C920;
	Mon,  5 Sep 2022 06:22:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36786C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 06:22:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24E69610AB;
 Mon,  5 Sep 2022 06:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2F3C433D6;
 Mon,  5 Sep 2022 06:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662358962;
 bh=2xEEEZ6CvZ2nPWQv0CH8VGu41ZEdxLRb0MFZrH6xB9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XXAY+hPd+TfFiORWRJpzFbPmU6WnRKDF1N6azgqAaGu98WPoaz/pr9QFxDTtFCMWs
 J7DbZpTQ8qvOKbwHzWxNbbW1Oou9sKL0y5fT7fK/czQb40GsDIV810rGIEJ1KBich3
 vgdGsRmKxokxvV6+YmhIy6kmuLbMKCov58sITx118tNr23wskb8nlHb5D7/qidk/no
 BbJ74kkiupfZwMEWes000RhVq4PgaNOTDsSO0pbKUyxc1MPUip3EOBrJa2BJBHK925
 Awg6jtVGUuapXDRfDkGsiuTlN+31TaA6zlnTonWEN4o8Q9zJT43BfS1F0QfmcAF2s7
 1i9V5zHp/jqrg==
Date: Mon, 5 Sep 2022 11:52:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <YxWVrphgXmqmsCH2@matsya>
References: <2d8c24359b2daa32ce0597a2949b7b2bebaf23de.1659211633.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d8c24359b2daa32ce0597a2949b7b2bebaf23de.1659211633.git.christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: Simplify code
 and save a few bytes of memory
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

On 30-07-22, 22:07, Christophe JAILLET wrote:
> STM32_DMAMUX_MAX_DMA_REQUESTS is small (i.e. 32) and when the 'dma_inuse'
> bitmap is allocated, there is already a check that 'dma_req' is <= this
> limit.
> 
> So, there is no good reason to dynamically allocate this bitmap. This
> just waste some memory and some cycles.
> 
> Use DECLARE_BITMAP with the maximum bitmap size instead.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
