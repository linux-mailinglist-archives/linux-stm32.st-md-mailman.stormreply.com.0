Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C6D4FBD0B
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 15:28:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A4A2C628A6;
	Mon, 11 Apr 2022 13:28:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61A76C60495
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 13:28:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2AF760BBF;
 Mon, 11 Apr 2022 13:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE23C385A3;
 Mon, 11 Apr 2022 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649683714;
 bh=wY2kkpkdJta5VZ4YNiEH8OvoR3YdYHuwo0F1OuTyYj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IvvY1WzzHSzYXvYnOKCFUjS4UgpB0CDgJmIrACaNIhTZY3PhF79b3OVRp1LoGpM/S
 VfI6g2m25yIelLafewradRDZlul1qbeZi2n1gHeCxqVv0iI/j4m4tDna18EzJzZt1N
 oiL73LjDk9SZ3rq9bC850P0LNimGAlYr8l8IXMPb1k7Mu/ePKVusAM8SE8THQXtH6y
 PGrK8cpM4ZRpqQsqjP8bLqhX2SLgorBNfJMpF9D4l0FM9Qw2O4/aU684TuO3s8aRwj
 x2InZKP4gHKMtgNPOmZYhiTKuOlfPs0tAOKNNumVUZlDVeIz5TDikSjo4m7KR3flqr
 3TwceEzvkDKsA==
Date: Mon, 11 Apr 2022 18:58:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YlQs/rPFnRWP6W6D@matsya>
References: <20220330103645.99969-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330103645.99969-1-amelie.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: check the channel
 availability (secure or not)
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

On 30-03-22, 12:36, Amelie Delaunay wrote:
> STM32_MDMA_CCR bit[8] is used to enable Secure Mode (SM). If this bit is
> set, it means that all the channel registers are write-protected. So the
> channel is not available for Linux use.
> 
> Add stm32_mdma_filter_fn() callback filter and give it to
> __dma_request_chan (instead of dma_get_any_slave_channel()), to exclude the
> channel if it is marked Secure.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
