Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB468B9A0B
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2024 13:29:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE674C71291;
	Thu,  2 May 2024 11:29:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89740C71286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2024 11:29:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6931461A14;
 Thu,  2 May 2024 11:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8390CC113CC;
 Thu,  2 May 2024 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714649382;
 bh=sFaNlOmGEeVD3nYHw0uf/YVM65vnE+n2alDOQR8Xux8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ESlSRyPfuggpHlVgObOH64jFR9a8f9GIZCEhVT8gPmkobRlLYwAUiNRPfLbKhZwzW
 v7ynMJzCeC3YDHZQGy1Q/mS6f3TG5Qn8hnFAIHQSm32cuRdykxx6YOM7yco+HfAKf4
 SHaKiTPRAfmytRm0NPO+SKEUr04uz4iJG4jgPSVoxiiZTOrGtBPL9YTrVMvZjbNoNA
 hpfZSUbfu5x4dgJf3pv98nxFDT5uDOnpz3xK1za+KYGS+AiHdyoHiFFSauA8N8KIVL
 WWTfVYzc0t6o6VrvByrKuloKxF38CiRBT0qqJVhTi3bXJyhPvG5z1dB5AGwXshKh5j
 kw6XFUPZ5oEXg==
Date: Thu, 2 May 2024 13:29:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <6zrly2hk2vqljiuo3niehym74pqdgfv77fzjb63shgg4iiwhnt@zcnrqrke663b>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/15] i2c: use 'time_left' with wait_for_*
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

Hi Wolfram,

On Sat, Apr 27, 2024 at 10:35:52PM +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to

there was a little checkpatch warning here for the line being
over 75 characters, but I went ahead anyway and pushed the whole
series to i2c/i2c-host.

Thanks,
Andi

> store the result of wait_for_*() causing patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> This is the I2C part of a tree-wide series. The rest of the patches can
> be found here (slightly WIP):
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left
> 
> Because these patches are generated, they need manual audit. So, I will
> send them step by step. This is part 1 and also a call for opinions if
> this is a desirable change. But at least in the I2C realm, I really want
> to have it proper.
> 
> Build bot is happy with these patches and I also compile tested them
> (except two). No functional changes intended.
> 
> Wolfram Sang (15):
>   i2c: amd-mp2-plat: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: digicolor: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: exynos5: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: hix5hd2: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: imx-lpi2c: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: omap: use 'time_left' variable with wait_for_completion_timeout()
>   i2c: st: use 'time_left' variable with wait_for_completion_timeout()
>   i2c: stm32f4: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: stm32f7: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: synquacer: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: jz4780: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: qcom-geni: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: rk3x: use 'time_left' variable with wait_event_timeout()
>   i2c: s3c2410: use 'time_left' variable with wait_event_timeout()
>   i2c: pxa: use 'time_left' variable with wait_event_timeout()
> 
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
