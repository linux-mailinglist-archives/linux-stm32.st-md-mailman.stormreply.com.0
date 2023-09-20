Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED57A7336
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Sep 2023 08:53:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D0DFC6B477;
	Wed, 20 Sep 2023 06:53:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3CA0C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Sep 2023 06:53:53 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38K6rR4K056956;
 Wed, 20 Sep 2023 01:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1695192807;
 bh=vlqRL+AKyD7un6uI2p8NliupoFl8GxtG647gtWnU+oU=;
 h=From:To:CC:Subject:In-Reply-To:References:Date;
 b=RHmAtXcNgSNBC2kZHuWoD6qLhgousfDLoLU4gsF4XrqRGHeigW7ZBP9sHwFfuW1Cr
 7qj6ULZyXIUJp91biwvg4WWkMsN8Pu2eZwpc0rCZHyV3uCkMdk9lfJgeKiM6HqKeeK
 Qgfj2YqJqrqSqpHFmbpATnXdkHycrz//QvTwcrxI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38K6rRaH005175
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Sep 2023 01:53:27 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Sep 2023 01:53:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Sep 2023 01:53:26 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38K6rQ5U113227;
 Wed, 20 Sep 2023 01:53:26 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <87zg28d9z4.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230812030116.GF971@sol.localdomain>
 <87h6owen39.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <20230822051710.GC1661@sol.localdomain>
 <87zg28d9z4.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
Date: Wed, 20 Sep 2023 12:23:25 +0530
Message-ID: <87a5thgwt6.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Nishanth Menon <nm@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [EXTERNAL] Re: [EXTERNAL] Re: [PATCH v2 0/6] Add
 support for Texas Instruments MCRC64 engine
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

Kamlesh Gurudasani <kamlesh@ti.com> writes:
...

> Hi Eric, thanks for your detailed and valuable inputs.
>
> As per your suggestion, we did some profiling. 
>
> Use case is to calculate crc32/crc64 for file input from user space.
>
> Instead of directly implementing PMULL based CRC64, we made first comparison between 
> Case 1.
> CRC32 (splice() + kernel space SW driver) 
> https://gist.github.com/ti-kamlesh/5be75dbde292e122135ddf795fad9f21
>
> Case 2.
> CRC32(mmap() + userspace armv8 crc32 instruction implementation)
> (tried read() as well to get contents of file, but that lost to mmap() so not mentioning number here)
> https://gist.github.com/ti-kamlesh/002df094dd522422c6cb62069e15c40d
>
> Case 3.
> CRC64 (splice() + MCRC64 HW)
> https://gist.github.com/ti-kamlesh/98b1fc36c9a7c3defcc2dced4136b8a0
>
>
> Overall, overhead of userspace + af_alg + driver in (Case 1) and
> ( Case 3) is ~0.025s, which is constant for any file size.
> This is calculated using real time to calculate crc  -
> driver time (time spend inside init() + update() +final()) = overhead ~0.025s    
>
>
>
> +-------------------+-----------------------------+-----------------------+------------------------+------------------------+
> |                   |                             |                       |                        |                        |
> | File size         | 120mb(ideal size for us)    | 20mb                  | 15mb                   | 5mb                    |
> +===================+=============================+=======================+========================+========================+
> |                   |                             |                       |                        |                        |
> | CRC32 (Case 1)    | Driver time 0.155s          | Driver time 0.0325s   | Driver time 0.019s     | Driver time 0.0062s    |
> |                   |    real time 0.18s          |    real time 0.06s    |    real time 0.04s     |    real time 0.03s     |
> |                   |    overhead 0.025s          |    overhead 0.025s    |    overhead 0.021s     |    overhead ~0.023s    |
> +-------------------+-----------------------------+-----------------------+------------------------+------------------------+
> |                   |                             |                       |                        |                        |
> | CRC32 (Case 2)    | Real time 0.30s             | Real time 0.05s       | Real time 0.04s        | Real time 0.02s        |
> +-------------------+-----------------------------+-----------------------+------------------------+------------------------+
> |                   |                             |                       |                        |                        |
> | CRC64 (Case 3)    | Driver time   0.385s        | Driver time 0.0665s   | Driver time 0.0515s    | Driver time 0.019s     |
> |                   |    real time 0.41s          |    real time 0.09s    |    real time 0.08s     |    real time 0.04s     |
> |                   |    overhead 0.025s          |    overhead 0.025s    |    overhead ~0.025s    |    overhead ~0.021s    |
> +-------------------+-----------------------------+-----------------------+------------------------+------------------------+
>
> Here, if we consider similar numbers for crc64 PMULL implementation as
> crc32 (case 2) , we save good number of cpu cycles using mcrc64
> in case of files bigger than 5-10mb as most of the time is being spent in HW offload.
>
> Regards,
> Kamlesh

Hi Eric,

Please let me know if above numbers make sense to you and I should send
next revision.

Regards,
Kamlesh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
