Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 955A396F2BF
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 13:20:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CA73C78013;
	Fri,  6 Sep 2024 11:20:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2A9DC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 11:20:16 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 486BEjgJ072314;
 Fri, 6 Sep 2024 06:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1725621285;
 bh=bPUR2egFbfVE9nGpinsihw1lIeoFQayKJ5z1HgMVXvY=;
 h=From:To:CC:Subject:In-Reply-To:References:Date;
 b=nzw5718Of9YGRlxlAu8J+drSDQsGnXhlPf5wAEAVQU76xyh+LqNRhk3QcHpahTN4l
 qXf2+CpthUqIlgR29HkB/HqY54uVLR23WAi9zx23n7z7Ta+MKg0+O2vyPjcwwmjXNG
 ZixZKqdqn2dGxtEqjVqAmp8lnsWXKFKFXqBggHf0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 486BEjse025068;
 Fri, 6 Sep 2024 06:14:45 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Sep 2024 06:14:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Sep 2024 06:14:45 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 486BEirT102212;
 Fri, 6 Sep 2024 06:14:45 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers
 <ebiggers@kernel.org>
In-Reply-To: <ZmfBxLB8RC_KNUlx@gondor.apana.org.au>
References: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
 <87tti098af.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <Zme3EcW4Uz8kTbTt@gondor.apana.org.au>
 <20240611031314.GA2557@sol.localdomain>
 <ZmfBxLB8RC_KNUlx@gondor.apana.org.au>
Date: Fri, 6 Sep 2024 16:44:44 +0530
Message-ID: <87cylhm3tn.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 kristo@kernel.org, devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 akpm@linux-foundation.org, will@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Subject: Re: [Linux-stm32] [PATCH v3 0/6] Add support for MCRC64 engine to
 calculate 64-bit CRC in Full-CPU mode
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

Herbert Xu <herbert@gondor.apana.org.au> writes:

> On Mon, Jun 10, 2024 at 08:13:14PM -0700, Eric Biggers wrote:
>>
>> I thought the rule is that there needs to be an in-kernel user to add algorithms
>> to the crypto API?  Is there any precedent for adding new algorithms purely so
>> that accelerators that implement them can be accessed from userspace via AF_ALG?
>
> I agree.  Perhaps this driver could instead be added as a simple
> char device that is then used directly by the intended user without
> going through the Crypto API at all.
>
> That would make it a lot simpler.
Thanks for all the support Herbert, Eric.

Just wanted to confirm, if this is being rejected primarily because
1. there is no in-kernel user for crc64-iso3309
2. or poor performance benefit of using it from userspace

The context for asking is that we have another superset IP known as MCRC
(this one is MCRC64), which supports crc8/16/32/64(iso-3309).

That IP has working DMA and will give good offloading numbers.

We are planning to send drivers for crc8/16/32 for MCRC
1.should I put efforts for crc64-iso3309 as well or
2.drop the crc64-iso3309 and send only for remaining
crc8/16/32(standard algorithms with already in-kernel user).

All our devices either have MCRC or MCRC64.

Thanks,
Kamlesh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
