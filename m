Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1450E7AAEA
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jul 2019 16:26:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FA24C35E01;
	Tue, 30 Jul 2019 14:26:52 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B915FC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:17:51 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id k9so43548984vso.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 07:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RK299o1I9nQNlsSGV+4buZQzWUsPGHe+LviTSNSniew=;
 b=SxaVkioTG0t2pjLf5OyxRf9JMawK69C8+zJxxRkOddWQ67OVwOAduPXdi5/peQBnKk
 lxi9e/T1J1zIv9jw/oMZp6JAuybJF9n7nnxAPDDqYruh+tZLoXZKJ/Q4A3AT5yM3UpDd
 xwPcHIMWGUZGuT5Psh9H+Jxgn1UEA1p7tgXfDI0/kw+RynaQ8a6IsxMh9b2huMgPjP3o
 mwBg41OPB8I5f2RDxKql10x6ujzkOMge/X4MS/u5FTbnMA54GyC8MC3VQhza3klGnXYI
 k019OGWuAeXXutGGH3OceFAdoSGs9lXpunq0Ya6qlRFlWPZiHKR4GNpyV6lXlQkxRe3o
 NBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RK299o1I9nQNlsSGV+4buZQzWUsPGHe+LviTSNSniew=;
 b=NHEy9G4G+zeTwsq9ko1A9kalVDBwBQjpD4p14LPuQsQ1u56HlkmBOyJNYfU9PplF5K
 rBKB2zc1JiFf/4o5KcsFMC1Cxdg0AgLyqS1zxJLBYkoE7051W8JJ1le9ZLT5T/l/Q2ZP
 6f38EHjiRBF/KSwVCLRbG0r2pYXQrfLpZeEwlvz4g6Ymh0m5GHhEsL3g1P/l8z572kkz
 6PMBnO9xrKZNjHbjoaaMQNLhz1CtNLLNGi9Gz64wW+9rMCyj0co+Bl2y4gCd0G8IFlxC
 8w5OmfOyeOHMvd+JocmkDk0Mj3C4NihKFRbGjnF7dhLQJs3fUGrBwh/UFuT5TtS0MYEe
 1muw==
X-Gm-Message-State: APjAAAU4wWjZosnVEx/AGFI+pXrq245mO9qy+euyJ3AbExX4fmCiYAwZ
 PVzMZ0gEbhti9lQEWNIZtYtgmNMAUHCvfGNomlM=
X-Google-Smtp-Source: APXvYqzOWV7w5UY6HfuniMmOZbt2GqzgJCloyN6OJVs76PDRwHfZfJxx5YKZtGvjUeFd4Nxu5FnCxu0Lhw8PkE14veU=
X-Received: by 2002:a67:e9ca:: with SMTP id q10mr41517640vso.105.1564496270292; 
 Tue, 30 Jul 2019 07:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <3601e3ae4357d48b3294f42781d0f19095d1b00e.1564479382.git.joabreu@synopsys.com>
In-Reply-To: <3601e3ae4357d48b3294f42781d0f19095d1b00e.1564479382.git.joabreu@synopsys.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 30 Jul 2019 11:17:39 -0300
Message-ID: <CAAEAJfDU23Q2G+qXW+BubX3FM3MwSGhJ15NrmDuzoM6UFfFLmw@mail.gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
X-Mailman-Approved-At: Tue, 30 Jul 2019 14:26:50 +0000
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jon Hunter <jonathanh@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Sync RX Buffer upon
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

On Tue, 30 Jul 2019 at 10:57, Jose Abreu <Jose.Abreu@synopsys.com> wrote:
>
> With recent changes that introduced support for Page Pool in stmmac, Jon
> reported that NFS boot was no longer working on an ARM64 based platform
> that had the IP behind an IOMMU.
>
> As Page Pool API does not guarantee DMA syncing because of the use of
> DMA_ATTR_SKIP_CPU_SYNC flag, we have to explicit sync the whole buffer upon
> re-allocation because we are always re-using same pages.
>
> In fact, ARM64 code invalidates the DMA area upon two situations [1]:
>         - sync_single_for_cpu(): Invalidates if direction != DMA_TO_DEVICE
>         - sync_single_for_device(): Invalidates if direction == DMA_FROM_DEVICE
>
> So, as we must invalidate both the current RX buffer and the newly allocated
> buffer we propose this fix.
>
> [1] arch/arm64/mm/cache.S
>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>

Thanks a lot for the bug hunt and the fix. This fixes NFS mounting
on my RK3288 and RK3399 boards.

Tested-by: Ezequiel Garcia <ezequiel@collabora.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
