Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC2E779CC9
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Aug 2023 04:55:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF3D6C6B474;
	Sat, 12 Aug 2023 02:55:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FB4AC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Aug 2023 02:55:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C818061311;
 Sat, 12 Aug 2023 02:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8815C433C7;
 Sat, 12 Aug 2023 02:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691808922;
 bh=8xhMi8cCxfgXnMrPb750nSrQBcgTHJS5NlxPxURCcW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qDtF4baCkmTYqMhnD6jEUxmemiA2ZKrOgocYikKT2OcRX4Rkymkte02ADgwxauQIb
 b687ULIO7ZD8Uxqeb/UM1lR3ahx2gCrv/V0ANfZJrDwanBUfu9hNbZUOvopmBoUrSz
 VASQEYNoZb7LbAjB1MO5NvarJzr+BxM3TWWAmx60GxD9lNuAp5rFBgWT6pWti/d1RX
 KkTAJoh8aXOvA8d30tYlpkOWgBgn8Gp1RpQJ9ufhEsNNMLYtuY7xEMJm19/r4j1u/k
 vuGTm3ihEgbffmvmvKxUoGjFeDedH3F1+HcavQRT+KG179e/pCatY7gm8ETRGxEosS
 b6Os7KV70F0vQ==
Date: Fri, 11 Aug 2023 19:55:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Message-ID: <20230812025520.GE971@sol.localdomain>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230719-mcrc-upstream-v2-2-4152b987e4c2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719-mcrc-upstream-v2-2-4152b987e4c2@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/6] crypto: crc64 - add crc64-iso
	framework
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

On Fri, Aug 11, 2023 at 12:58:49AM +0530, Kamlesh Gurudasani wrote:
> diff --git a/include/linux/crc64.h b/include/linux/crc64.h
> index 70202da51c2c..10b792080374 100644
> --- a/include/linux/crc64.h
> +++ b/include/linux/crc64.h
> @@ -8,11 +8,15 @@
>  #include <linux/types.h>
>  
>  #define CRC64_ROCKSOFT_STRING "crc64-rocksoft"
> +#define CRC64_ISO_STRING "crc64-iso"
>  
>  u64 __pure crc64_be(u64 crc, const void *p, size_t len);
>  u64 __pure crc64_iso_generic(u64 crc, const void *p, size_t len);
>  u64 __pure crc64_rocksoft_generic(u64 crc, const void *p, size_t len);
>  
> +u64 crc64_iso(const unsigned char *buffer, size_t len);
> +u64 crc64_iso_update(u64 crc, const unsigned char *buffer, size_t len);
> +
>  u64 crc64_rocksoft(const unsigned char *buffer, size_t len);
>  u64 crc64_rocksoft_update(u64 crc, const unsigned char *buffer, size_t len);

Is "crc64-iso" clear enough, or should it be "crc64-iso3309"?  There are
thousands of ISO standards.  Different CRC variants are specified by different
ISO standards.  Is this particular variant indeed commonly referred to as simply
the "ISO" CRC-64?  Even if it's currently the case that all other CRCs in ISO
standards are different widths than 64 bits (which may be unlikely?), I'm not
sure we should count on no CRC-64 variant ever being standardized by ISO.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
