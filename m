Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9F8902EF1
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 05:14:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB725C6C838;
	Tue, 11 Jun 2024 03:14:14 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FAF5CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 03:14:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4096ACE01BC;
 Tue, 11 Jun 2024 03:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE838C2BBFC;
 Tue, 11 Jun 2024 03:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718075650;
 bh=mbLv1uH2SZYJsLfBUYXgs87kE41hXHw1r1WdE9F1N8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NLzAwj3Q7cuqOrIBmQCoD309Oia4DvkXjzRhFz6WEvf2FFKM2GNjA/mb1UBMH02B1
 xH+lTl2C2R6KuTB0CidmE/RB0/eDRIfsZqwPmyQ4GDiWW4AD2CcZYPcqE+qmIghEns
 7wP1bTRbGiDy/rzyBpadzaF6EioxRsRNruXdMWgoFF0DfWWsvFIyoTkBUwK9zAI8gt
 1PH2Q7xMGt/Q5MziAJHxjxLEzy8ElPCi/FvSCK3bp/MH7qxX+sWnciFZlWSwEnPQ3w
 3Q32bWqqNqcIEWwVJN9pcteBwpJ3SWrpXhnMOnobkgjIrKt9SAXUtfLDgzTGr5pOwr
 //9KmDYX2vrDA==
Date: Mon, 10 Jun 2024 20:14:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: kamlesh@ti.com
Message-ID: <20240611031408.GB2557@sol.localdomain>
References: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
 <20240524-mcrc64-upstream-v3-1-24b94d8e8578@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240524-mcrc64-upstream-v3-1-24b94d8e8578@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 herbert@gondor.apana.org.au, kristo@kernel.org, devicetree@vger.kernel.org,
 catalin.marinas@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, akpm@linux-foundation.org, will@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Subject: Re: [Linux-stm32] [PATCH v3 1/6] lib: add ISO 3309 model crc64
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

On Thu, May 30, 2024 at 05:54:23PM +0530, kamlesh@ti.com wrote:
> diff --git a/lib/crc64.c b/lib/crc64.c
> index 61ae8dfb6a1c..40369dd26812 100644
> --- a/lib/crc64.c
> +++ b/lib/crc64.c
> @@ -22,6 +22,11 @@
>   * x^24 + x^23 + x^22 + x^21 + x^19 + x^17 + x^13 + x^12 + x^10 + x^9 +
>   * x^7 + x^4 + x + 1
>   *
> + * crc64iso3309table[256] table is from the ISO-3309:1991 specification
> + * polynomial defined as,
> + *
> + * x^64 + x^4 + x^3 + x + 1
> + *
>   * crc64rocksoft[256] table is from the Rocksoft specification polynomial
>   * defined as,
>   *
> @@ -63,6 +68,28 @@ u64 __pure crc64_be(u64 crc, const void *p, size_t len)
>  }
>  EXPORT_SYMBOL_GPL(crc64_be);
>  
> +/**
> + * crc64_iso3309_generic - Calculate bitwise ISO3309 CRC64
> + * @crc: seed value for computation. 0 for a new CRC calculation, or the
> + *	 previous crc64 value if computing incrementally.
> + * @p: pointer to buffer over which CRC64 is run
> + * @len: length of buffer @p
> + */
> +u64 __pure crc64_iso3309_generic(u64 crc, const void *p, size_t len)
> +{
> +	size_t i, t;
> +
> +	const unsigned char *_p = p;
> +
> +	for (i = 0; i < len; i++) {
> +		t = ((crc >> 56) ^ (*_p++)) & 0xFF;
> +		crc = crc64iso3309table[t] ^ (crc << 8);
> +	}
> +
> +	return crc;
> +}
> +EXPORT_SYMBOL_GPL(crc64_iso3309_generic);

Putting this in lib/ seems premature, given that this is only used by
crypto/crc64_iso3309_generic.c.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
