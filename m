Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BCCAEED16
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jul 2025 05:49:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5D57C3F92F;
	Tue,  1 Jul 2025 03:49:29 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B7AEC3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jul 2025 03:49:27 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bWTVQ6gzpz1R8g2;
 Tue,  1 Jul 2025 11:46:54 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
 by mail.maildlp.com (Postfix) with ESMTPS id 61C87140295;
 Tue,  1 Jul 2025 11:49:25 +0800 (CST)
Received: from [10.67.111.31] (10.67.111.31) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 1 Jul
 2025 11:49:24 +0800
Message-ID: <d612599a-b773-42ca-acfa-67b6867f96e6@huawei.com>
Date: Tue, 1 Jul 2025 11:49:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20250630133934.766646-1-gubowen5@huawei.com>
 <0bf20f7e-117c-4495-9805-baade7f466ba@suswa.mountain>
Content-Language: en-US
From: Gu Bowen <gubowen5@huawei.com>
In-Reply-To: <0bf20f7e-117c-4495-9805-baade7f466ba@suswa.mountain>
X-Originating-IP: [10.67.111.31]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemh100007.china.huawei.com (7.202.181.92)
Cc: Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 GONG Ruiqi <gongruiqi1@huawei.com>, linux-stm32@st-md-mailman.stormreply.com,
 Lu Jialin <lujialin4@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Lukas Wunner <lukas@wunner.de>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ignat Korchagin <ignat@cloudflare.com>, David Woodhouse <dwmw2@infradead.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 0/4] Reintroduce the sm2 algorithm
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

Hi,

On 7/1/2025 3:41 AM, Dan Carpenter wrote:
> On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
>> To reintroduce the sm2 algorithm, the patch set did the following:
>>   - Reintroduce the mpi library based on libgcrypt.
>>   - Reintroduce ec implementation to MPI library.
>>   - Rework sm2 algorithm.
>>   - Support verification of X.509 certificates.
> 
> Remind me, why did we remove these?
> 

At first, the process of calculating the digest with the SM2 certificate
was coupled with the signature verification process, and this 
unreasonable situation was corrected with commit e5221fa6a355 ("KEYS: 
asymmetric: Move sm2 code into x509_public_key "). However, this commit 
also caused SM2 to be unable to verify secondary certificates due to its 
special implementation. This issue was not resolved, which led to the 
removal of the sm2 algorithm.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
