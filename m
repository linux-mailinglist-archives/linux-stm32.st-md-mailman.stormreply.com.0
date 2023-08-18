Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A858F784746
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B32CC6DD92;
	Tue, 22 Aug 2023 16:25:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63C19C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 07:26:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37I7Pgwj016351;
 Fri, 18 Aug 2023 02:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1692343542;
 bh=bm4x7kxqWvWv3qzJzqySj6fmSFubOtRfgMiZakk91HU=;
 h=From:To:CC:Subject:In-Reply-To:References:Date;
 b=QrdPfjdTnJ3toEmR05ynqxTJNyXv2WwWNY9iqNKI5ZFikSVIzBqXWCiawp34x8gv+
 q9ZOlSy14oa7NSbs74lPmlzUEun8L6d9cg+dyi4woQpGHnYbIIQ8v4jjz/wS/h0Sew
 1Goe9HX9BfhtVSaISpEEynKj6eLUjPqbAUTFqAyI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37I7PgPS006923
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Aug 2023 02:25:42 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Aug 2023 02:25:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Aug 2023 02:25:42 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37I7Pf40110519;
 Fri, 18 Aug 2023 02:25:41 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20230812025520.GE971@sol.localdomain>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230719-mcrc-upstream-v2-2-4152b987e4c2@ti.com>
 <20230812025520.GE971@sol.localdomain>
Date: Fri, 18 Aug 2023 12:55:40 +0530
Message-ID: <87jztserrf.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: Nishanth Menon <nm@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [EXTERNAL] Re: [PATCH v2 2/6] crypto: crc64 - add
 crc64-iso framework
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

> On Fri, Aug 11, 2023 at 12:58:49AM +0530, Kamlesh Gurudasani wrote:
>> diff --git a/include/linux/crc64.h b/include/linux/crc64.h
>> index 70202da51c2c..10b792080374 100644
>> --- a/include/linux/crc64.h
>> +++ b/include/linux/crc64.h
>> @@ -8,11 +8,15 @@
>>  #include <linux/types.h>
>>  
>>  #define CRC64_ROCKSOFT_STRING "crc64-rocksoft"
>> +#define CRC64_ISO_STRING "crc64-iso"
>>  
>>  u64 __pure crc64_be(u64 crc, const void *p, size_t len);
>>  u64 __pure crc64_iso_generic(u64 crc, const void *p, size_t len);
>>  u64 __pure crc64_rocksoft_generic(u64 crc, const void *p, size_t len);
>>  
>> +u64 crc64_iso(const unsigned char *buffer, size_t len);
>> +u64 crc64_iso_update(u64 crc, const unsigned char *buffer, size_t len);
>> +
>>  u64 crc64_rocksoft(const unsigned char *buffer, size_t len);
>>  u64 crc64_rocksoft_update(u64 crc, const unsigned char *buffer, size_t len);
>
> Is "crc64-iso" clear enough, or should it be "crc64-iso3309"?  There are
> thousands of ISO standards.  Different CRC variants are specified by different
> ISO standards.  Is this particular variant indeed commonly referred to as simply
> the "ISO" CRC-64?  Even if it's currently the case that all other CRCs in ISO
> standards are different widths than 64 bits (which may be unlikely?), I'm not
> sure we should count on no CRC-64 variant ever being standardized by ISO.
>
> - Eric
https://en.wikipedia.org/wiki/Cyclic_redundancy_check

Last entry CRC-64-ISO in the table.
It is mentioned as crc64-iso and that's the
only 64-bit CRC standardized by ISO. But I do agree that crc64-iso3309 would
be more specific, will change it to crc64-iso3309 in next
revision. Thanks.

Regards,
Kamlesh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
