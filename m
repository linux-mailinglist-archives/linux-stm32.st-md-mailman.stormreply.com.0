Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 839D7779CE5
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Aug 2023 05:01:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A98CC6B474;
	Sat, 12 Aug 2023 03:01:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 421BAC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Aug 2023 03:01:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02AB961321;
 Sat, 12 Aug 2023 03:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AB6C433C8;
 Sat, 12 Aug 2023 03:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691809278;
 bh=l/yGOkqsa8kjqG7Q1FQDe6y3BvLBuVJGICeXb/Wg5U4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PCxyEaxofwKOYu++aRE8JA4T/q7hFz1Tm2cqdaSq9C7IwL4TLoD0hSX5PzqUZAmwg
 AQ0Orhh4RIGvEvJ6/RFNlRgS7xqfH8+sGkTzSsaKvnFkoXkwhdIXZ0b8PYtK/wPGqx
 EsIB3TgiTWUiUH5BxyBCLAxc3x5BX23OdMPz/M/0w4M7PwEbvYQ1JzmcMWxjAQ3aGG
 rlT/VwdIFSJ2VL1x5XgG6V5SuIk/Dm0DK4s4NXDqgdJvsXZdGhcAHR/SDMhVphAJn2
 eBy1ORPaoHqfZ+1QGnWQaNa6MHgcMjZpSJMMBRqi/XvMCd2So6840O0lwUh0t58MBk
 7FjJZ/kVIKA/w==
Date: Fri, 11 Aug 2023 20:01:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Message-ID: <20230812030116.GF971@sol.localdomain>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/6] Add support for Texas Instruments
	MCRC64 engine
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

On Fri, Aug 11, 2023 at 12:58:47AM +0530, Kamlesh Gurudasani wrote:
> Add support for MCRC64 engine to calculate 64-bit CRC in Full-CPU mode
> 
> MCRC64 engine calculates 64-bit cyclic redundancy checks (CRC)
> according to the ISO 3309 standard.
> 
> The ISO 3309 64-bit CRC model parameters are as follows:
>     Generator Polynomial: x^64 + x^4 + x^3 + x + 1
>     Polynomial Value: 0x000000000000001B
>     Initial value: 0x0000000000000000
>     Reflected Input: False
>     Reflected Output: False
>     Xor Final: 0x0000000000000000
> 
> Tested with
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
> 
> and tcrypt,
> sudo modprobe tcrypt mode=329 sec=1
> 
> User space application implemented using algif_hash,
> https://gist.github.com/ti-kamlesh/73abfcc1a33318bb3b199d36b6209e59
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>

I do not see any in-kernel user of this CRC variant being introduced, which
leaves algif_hash as the only use case.

Can you elaborate on the benefit this brings to your application?  Yes, it
allows you to use your hardware CRC engine.  But, that comes with all the
overhead from the syscalls, algif_hash, and the driver.  How does performance
compare to a properly optimized software CRC implementation on your platform,
i.e. an implementation using carryless multiplication instructions (e.g. ARMv8
CE) if available on your platform, otherwise an implementation using the
slice-by-8 or slice-by-16 method?

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
