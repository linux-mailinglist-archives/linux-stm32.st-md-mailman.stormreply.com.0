Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E591644A674
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Nov 2021 06:50:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FEC2C5EC6C;
	Tue,  9 Nov 2021 05:50:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DA17C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Nov 2021 05:50:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABB45610F7;
 Tue,  9 Nov 2021 05:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636437048;
 bh=7wrdFm6RXmCeAdIpuwIhaiDDfnkWbf0prf/NE/auG6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SWcwkwwOuRWxpUwx5oLLfgnruxI10Dj/1xdBUkCOvWtEQVVOXTkcFlencWpXw2QQL
 tsrE4ykafAy7yYPw65LaX6u3ULiwkHniVZY/P1zm0hTCY5GSdYpW9mNnnSyTAIsjQ2
 KvnDz39VlTBWnwpJC3SOr0xoNPcJVPaFvakHkCH6yjMDCb/Ar+JDkzjs3H4HL6fc1I
 HGb//Gz44Fr98Pt8SCsubaVrHOR0lLBa/o1UIXTlsd/Nac1eg7xAUvc4UWuawfRyM5
 fjg623QJQSGSW8IdBce5nHDGV1s/GSZfs8a66S/N1ExVa3uB58R/0f1/sMbfzWpROu
 RZdFu3tCZ8Kzg==
Date: Tue, 9 Nov 2021 11:20:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YYoMM5RnQ+G7RtFw@matsya>
References: <20211103153312.41483-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103153312.41483-1-amelie.delaunay@foss.st.com>
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] dmaengine: stm32-dma: avoid 64-bit
 division in stm32_dma_get_max_width
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

On 03-11-21, 16:33, Amelie Delaunay wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Using the % operator on a 64-bit variable is expensive and can
> cause a link failure:
> 
> arm-linux-gnueabi-ld: drivers/dma/stm32-dma.o: in function `stm32_dma_get_max_width':
> stm32-dma.c:(.text+0x170): undefined reference to `__aeabi_uldivmod'
> arm-linux-gnueabi-ld: drivers/dma/stm32-dma.o: in function `stm32_dma_set_xfer_param':
> stm32-dma.c:(.text+0x1cd4): undefined reference to `__aeabi_uldivmod'
> 
> As we know that we just want to check the alignment in
> stm32_dma_get_max_width(), there is no need for a full division, and
> using a simple mask is a faster replacement.
> 
> Same in stm32_dma_set_xfer_param(), change this to only allow burst
> transfers if the address is a multiple of the length.
> stm32_dma_get_best_burst just after will take buf_len into account to fix
> burst in case of misalignment.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
