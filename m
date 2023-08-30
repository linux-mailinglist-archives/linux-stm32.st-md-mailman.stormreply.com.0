Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C480178D64F
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Aug 2023 15:49:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DE3FC6B444;
	Wed, 30 Aug 2023 13:49:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3695C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 13:49:17 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37UDmsSH069738;
 Wed, 30 Aug 2023 08:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1693403334;
 bh=k3G+QCd0qq+SmUmXwQ1w+6uf1+2cGUO++sEcK3YjTPM=;
 h=From:To:CC:Subject:In-Reply-To:References:Date;
 b=iz8aBw26EMlFJ3f4qOvXvi5WCcONePsIYPOQ75mdUaRjlqzKVcBpjiB17nxzgktvq
 0+sKBr1nJV3xEyNPx43OCQyCcum61cZeOIvnRjplbzQVdDRgJkLOQI6bKDwFr7n7HU
 8ojsmayw0NReO5596uAOaoeVnn+vpuX/mtnrIxDg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37UDmssS019352
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Aug 2023 08:48:54 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Aug 2023 08:48:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Aug 2023 08:48:54 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37UDmrha038381;
 Wed, 30 Aug 2023 08:48:54 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20230822051710.GC1661@sol.localdomain>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230812030116.GF971@sol.localdomain>
 <87h6owen39.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <20230822051710.GC1661@sol.localdomain>
Date: Wed, 30 Aug 2023 19:18:53 +0530
Message-ID: <87v8cwd4je.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Nishanth Menon <nm@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kamlesh@ti.com,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
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

Eric Biggers <ebiggers@kernel.org> writes:

> On Fri, Aug 18, 2023 at 02:36:34PM +0530, Kamlesh Gurudasani wrote:
>> Hi Eric,
>> 
>> We are more interested in offload than performance, with splice system
>> call and DMA mode in driver(will be implemented after this series gets
>> merged), good amount of cpu cycles will be saved.
>
> So it's for power usage, then?  Or freeing up CPU for other tasks?
>

It's for freeing up CPU for other tasks

>> There is one more mode(auto mode) in mcrc64 which helps to verify crc64
>> values against pre calculated crc64, saving the efforts of comparing in
>> userspace.
>
> Is there any path forward to actually support this?
>
>> 
>> Current generic implementation of crc64-iso(part of this series)
>> gives 173 Mb/s of speed as opposed to mcrc64 which gives speed of 812
>> Mb/s when tested with tcrypt.
>
> This doesn't answer my question, which to reiterate was:
>
>     How does performance compare to a properly optimized software CRC
>     implementation on your platform, i.e. an implementation using carryless
>     multiplication instructions (e.g. ARMv8 CE) if available on your platform,
>     otherwise an implementation using the slice-by-8 or slice-by-16 method?
>
> The implementation you tested was slice-by-1.  Compared to that, it's common for
> slice-by-8 to speed up CRCs by about 4 times and for folding with carryless
> multiplication to speed up CRCs by 10-30 times, sometimes limited only by memory
> bandwidth.  I don't know what specific results you would get on your specific
> CPU and for this specific CRC, and you could certainly see something different
> if you e.g. have some low-end embedded CPU.  But those are the typical results
> I've seen for other CRCs on different CPUs.  So, a software implementation may
> be more attractive than you realize.  It could very well be the case that a
> PMULL based CRC implementation actually ends up with less CPU load than your
> "hardware offload", when taking into syscall, algif_hash, and driver overhead...
>
> - Eric

Hi Eric, thanks for your detailed and valuable inputs.

As per your suggestion, we did some profiling. 

Use case is to calculate crc32/crc64 for file input from user space.

Instead of directly implementing PMULL based CRC64, we made first comparison between 
Case 1.
CRC32 (splice() + kernel space SW driver) 
https://gist.github.com/ti-kamlesh/5be75dbde292e122135ddf795fad9f21

Case 2.
CRC32(mmap() + userspace armv8 crc32 instruction implementation)
(tried read() as well to get contents of file, but that lost to mmap() so not mentioning number here)
https://gist.github.com/ti-kamlesh/002df094dd522422c6cb62069e15c40d

Case 3.
CRC64 (splice() + MCRC64 HW)
https://gist.github.com/ti-kamlesh/98b1fc36c9a7c3defcc2dced4136b8a0


Overall, overhead of userspace + af_alg + driver in (Case 1) and ( Case 3) is ~0.025s, which is constant for any file size.
This is calculated using real time to calculate crc  - driver time (time spend inside init() + update() +final()) = overhead ~0.025s    

Here, if we consider similar numbers for crc64 PMULL implementation as crc32 (case 2) , we save good number of cpu cycles using mcrc64
in case of files bigger than 5-10mb as most of the time is being spent in HW offload.

+-------------------+-----------------------------+-----------------------+------------------------+------------------------+
|                   |                             |                       |                        |                        |
| File size         | 120mb(ideal size for us)    | 20mb                  | 15mb                   | 5mb                    |
+===================+=============================+=======================+========================+========================+
|                   |                             |                       |                        |                        |
| CRC32 (Case 1)    | Driver time 0.155s          | Driver time 0.0325s   | Driver time 0.019s     | Driver time 0.0062s    |
|                   |    real time 0.18s          |    real time 0.06s    |    real time 0.04s     |    real time 0.03s     |
|                   |    overhead 0.025s          |    overhead 0.025s    |    overhead 0.021s     |    overhead ~0.023s    |
+-------------------+-----------------------------+-----------------------+------------------------+------------------------+
|                   |                             |                       |                        |                        |
| CRC32 (Case 2)    | Real time 0.30s             | Real time 0.05s       | Real time 0.04s        | Real time 0.02s        |
+-------------------+-----------------------------+-----------------------+------------------------+------------------------+
|                   |                             |                       |                        |                        |
| CRC64 (Case 3)    | Driver time   0.385s        | Driver time 0.0665s   | Driver time 0.0515s    | Driver time 0.019s     |
|                   |    real time 0.41s          |    real time 0.09s    |    real time 0.08s     |    real time 0.04s     |
|                   |    overhead 0.025s          |    overhead 0.025s    |    overhead ~0.025s    |    overhead ~0.021s    |
+-------------------+-----------------------------+-----------------------+------------------------+------------------------+
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
