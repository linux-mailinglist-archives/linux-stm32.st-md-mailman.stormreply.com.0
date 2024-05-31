Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 809CA8D5F33
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 12:04:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35C71C6C820;
	Fri, 31 May 2024 10:04:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47D8BC030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 10:04:09 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 786F48869E;
 Fri, 31 May 2024 12:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717149848;
 bh=9GPw1umK/mB9EDut1kKlrkCFOEdOSCsqYb2hH2z3l2U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oeaE7Yt672PKDzAwIDlx9j6005P9UKBVIt1SeB/CBXN2mz4BXXSWa21bMQ/+N6Wo7
 Jo9JP5poC8xX2A+PS6KKtlNIQJ+vxaswyL/2xkU7qj2TQAjJDAsAcWV8QI+e6KkAxJ
 mDNxhdBrCrtwbxqWrT7sLW5r2MuSkxbYax1342GvpWNzE4VOLzTRAiU/lReMuRFjOY
 xgr5yF7ObZxgq/kgOK+iCm+KGZrO5yDZsN/yX26hYWgSmjrJPiftKroXf3BJZ4u2v2
 L5PCHc62CD8HWxqj94Me2kna4KPYPtrfg4n9mAVKW+RW4XB9PELffe4TEIIZL0rKsd
 502f4eU1vwbDw==
Message-ID: <693df34f-c387-48a5-bbb9-1fa2e3077da8@denx.de>
Date: Fri, 31 May 2024 12:04:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20240516193757.12458-1-marex@denx.de>
 <20240516193757.12458-2-marex@denx.de> <ZllavXc2lscS9TRc@gondor.apana.org.au>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZllavXc2lscS9TRc@gondor.apana.org.au>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Rob Herring <robh@kernel.org>, Yang Yingliang <yangyingliang@huawei.com>,
 kernel@dh-electronics.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] hwrng: stm32 - cache device
 pointer in struct stm32_rng_private
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

On 5/31/24 7:06 AM, Herbert Xu wrote:
> On Thu, May 16, 2024 at 09:37:41PM +0200, Marek Vasut wrote:
>> Place device pointer in struct stm32_rng_private and use it all over the
>> place to get rid of the horrible type casts throughout the driver.
>>
>> No functional change.
>>
>> Acked-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> I think you should remove the assignment of rng.priv too as nothing
> should use it anymore after your patch.

Fixed in V3, thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
