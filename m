Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56001784734
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C24AC6C822;
	Tue, 22 Aug 2023 16:25:21 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F331C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 06:40:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37B6eBOd021185;
 Fri, 11 Aug 2023 01:40:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1691736011;
 bh=jF7veAJCg7xxofNq8kFXr6on39XUtII8DDbN01UPOg8=;
 h=From:To:CC:Subject:In-Reply-To:References:Date;
 b=MhHDCWrW7h5mBgJXO24FHVkVesCB2J1yMupcXIKgKUUEhjv0ANFaSIFdhoq1W+EBh
 riNtETxC2Mrr0SMFPYC2wRJZR0jNszh/ZCbWKD1aapk+XXLq+7HX0+ZOjm0EVuJyBb
 LqskMROLcAzz3aYAD+h86I8WyRXq65Engmxb/tMA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37B6eBpO122620
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Aug 2023 01:40:11 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Aug 2023 01:40:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Aug 2023 01:40:10 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37B6e914007531;
 Fri, 11 Aug 2023 01:40:09 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20230811042423.GA1295@sol.localdomain>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230719-mcrc-upstream-v2-2-4152b987e4c2@ti.com>
 <20230811042423.GA1295@sol.localdomain>
Date: Fri, 11 Aug 2023 12:10:09 +0530
Message-ID: <87r0oadquu.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
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
>> diff --git a/lib/crc64-iso.c b/lib/crc64-iso.c
>> new file mode 100644
>> index 000000000000..d6e803124fa0
> [...]
>> +u64 crc64_iso_update(u64 crc, const unsigned char *buffer, size_t len)
>> +{
>> +	struct {
>> +		struct shash_desc shash;
>> +		u64 crc;
>> +	} desc;
>> +	int err;
>> +
>> +	if (static_branch_unlikely(&crc64_iso_fallback))
>> +		return crc64_iso_generic(crc, buffer, len);
>> +
>> +	rcu_read_lock();
>> +	desc.shash.tfm = rcu_dereference(crc64_iso_tfm);
>> +	desc.crc = crc;
>> +	err = crypto_shash_update(&desc.shash, buffer, len);
>> +	rcu_read_unlock();
>> +
>> +	WARN_ON_ONCE(err);
>> +
>> +	return desc.crc;
>> +}
>> +EXPORT_SYMBOL_GPL(crc64_iso_update);
>> +
>> +u64 crc64_iso(const unsigned char *buffer, size_t len)
>> +{
>> +	return crc64_iso_update(0, buffer, len);
>> +}
>> +EXPORT_SYMBOL_GPL(crc64_iso);
>
> These functions are never called.
>
> Why are you trying to add unused code to the kernel?
>
> - Eric
Thanks for the review, Eric.

Will remove this in next revision.

Regards,
Kamlesh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
