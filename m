Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D60F4770D56
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Aug 2023 04:44:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80ABBC6B469;
	Sat,  5 Aug 2023 02:44:48 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76D21C6B466
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 02:44:46 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RHn1q37y5zVk2P;
 Sat,  5 Aug 2023 10:42:55 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 5 Aug 2023 10:44:43 +0800
Message-ID: <b5fbdc3f-0404-c939-9f33-8d7489c19921@huawei.com>
Date: Sat, 5 Aug 2023 10:44:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: Andi Shyti <andi.shyti@kernel.org>, <pierre-yves.mordret@foss.st.com>,
 <alain.volmat@foss.st.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
References: <20230731112755.1943630-1-ruanjinjie@huawei.com>
 <169119887102.1781235.17733733758389845864.b4-ty@kernel.org>
Content-Language: en-US
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <169119887102.1781235.17733733758389845864.b4-ty@kernel.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Subject: Re: [Linux-stm32] [PATCH -next] i2c: stm32: fix the return value
 handle for platform_get_irq()
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



On 2023/8/5 9:29, Andi Shyti wrote:
> Hi
> 
> On Mon, 31 Jul 2023 19:27:55 +0800, Ruan Jinjie wrote:
>> There is no possible for platform_get_irq() to return 0,
>> and the return value of platform_get_irq() is more sensible
>> to show the error reason.
>>
>>
> 
> With the commit log fixed, applied to i2c/andi-for-next on

Thank you!

> 
> https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
> 
> Please note that this patch may still undergo further evaluation
> and the final decision will be made in collaboration with
> Wolfram.
> 
> Thank you,
> Andi
> 
> Patches applied
> ===============
> [1/1] i2c: stm32: fix the return value handle for platform_get_irq()
>       commit: 603b3cf89d8a96cc0e51eb15853f28944eb78f31
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
