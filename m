Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C180E94B4AC
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Aug 2024 03:37:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47899C78002;
	Thu,  8 Aug 2024 01:37:12 +0000 (UTC)
Received: from out30-112.freemail.mail.aliyun.com
 (out30-112.freemail.mail.aliyun.com [115.124.30.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78C95C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Aug 2024 01:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1723081022; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=mH8254NBLvcuf4h8WC2ZfPzI9DxBk0rkYDY1AhyBiGQ=;
 b=rpPPw2glLUAvPFY5y2AOONkMotRIUfCZLGLRBXezbo4nyMOPdWpgyu+NrgmM2vD06vvuHGiZ/FZsYsyDZ/Mv+oyHDWZkdJ1emxyhXVu5qggwuOnzIbmwNK/ik1o8Rw7GEN3cfVWJQYoFw8LZHEdCoGsHbNaUUTYGsTPmnzMlliA=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067109;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0WCKS0YA_1723081020; 
Received: from 30.97.56.61(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0WCKS0YA_1723081020) by smtp.aliyun-inc.com;
 Thu, 08 Aug 2024 09:37:01 +0800
Message-ID: <3b38eee4-1dc3-45b3-85d7-d4923f5e571e@linux.alibaba.com>
Date: Thu, 8 Aug 2024 09:37:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gaosheng Cui <cuigaosheng1@huawei.com>, andersson@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
References: <20240803061443.287117-1-cuigaosheng1@huawei.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20240803061443.287117-1-cuigaosheng1@huawei.com>
Cc: linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] hwspinlock: stm32: Add missing
 clk_disable_unprepare in stm32_hwspinlock_probe
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2024/8/3 14:14, Gaosheng Cui wrote:
> Add the missing clk_disable_unprepare() before return in
> stm32_hwspinlock_probe().
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>   drivers/hwspinlock/stm32_hwspinlock.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
> index bb5c7e5f7a80..a4e3b9a9e29d 100644
> --- a/drivers/hwspinlock/stm32_hwspinlock.c
> +++ b/drivers/hwspinlock/stm32_hwspinlock.c
> @@ -103,6 +103,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
>   	ret = devm_add_action_or_reset(dev, stm32_hwspinlock_disable_clk, pdev);
>   	if (ret) {
>   		dev_err(dev, "Failed to register action\n");
> +		clk_disable_unprepare(hw->clk);
>   		return ret;
>   	}
>   
> @@ -112,8 +113,10 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
>   	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
>   					0, STM32_MUTEX_NUM_LOCKS);
>   
> -	if (ret)
> +	if (ret) {
>   		dev_err(dev, "Failed to register hwspinlock\n");
> +		clk_disable_unprepare(hw->clk);
> +	}

I don't think this is needed, because if the device initialization 
fails, stm32_hwspinlock_disable_clk() will be called to disable the 
clock automatically when the device releases its resources. Please check 
how devm_add_action_or_reset() work.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
