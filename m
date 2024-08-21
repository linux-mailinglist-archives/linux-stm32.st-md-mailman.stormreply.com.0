Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B29F79594C1
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 08:36:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ED9FC6DD9D;
	Wed, 21 Aug 2024 06:36:48 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8964DC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 02:17:46 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WpVH30Lb9z20lyF;
 Wed, 21 Aug 2024 10:13:03 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 4E6EF1A0188;
 Wed, 21 Aug 2024 10:17:44 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 21 Aug 2024 10:17:43 +0800
Message-ID: <7dedb5a5-16d9-2056-8333-8b8e65ab30af@huawei.com>
Date: Wed, 21 Aug 2024 10:17:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230814125501.303210-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20230814125501.303210-1-ruanjinjie@huawei.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-Mailman-Approved-At: Wed, 21 Aug 2024 06:36:41 +0000
Subject: Re: [Linux-stm32] [PATCH -next] stm class: Switch to
	memdup_user_nul() helper
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

Ping.

On 2023/8/14 20:55, Ruan Jinjie wrote:
> Although stm_write() use the kbuf with its count, the last byte of
> kbuf is not initialized and there may be problems.
> 
> Use memdup_user_nul() helper instead of open-coding to simplify the code
> and fix the above issue.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/hwtracing/stm/core.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index 534fbefc7f6a..342d0ab6e8ca 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -645,15 +645,9 @@ static ssize_t stm_char_write(struct file *file, const char __user *buf,
>  			return err;
>  	}
>  
> -	kbuf = kmalloc(count + 1, GFP_KERNEL);
> -	if (!kbuf)
> -		return -ENOMEM;
> -
> -	err = copy_from_user(kbuf, buf, count);
> -	if (err) {
> -		kfree(kbuf);
> -		return -EFAULT;
> -	}
> +	kbuf = memdup_user_nul(buf, count);
> +	if (IS_ERR(kbuf))
> +		return PTR_ERR(kbuf);
>  
>  	pm_runtime_get_sync(&stm->dev);
>  
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
