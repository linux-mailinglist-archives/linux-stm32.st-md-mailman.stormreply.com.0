Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 540D3783928
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 07:17:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3FAAC6A613;
	Tue, 22 Aug 2023 05:17:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEF25C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Aug 2023 05:17:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D7B9637A8;
 Tue, 22 Aug 2023 05:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F77C433C8;
 Tue, 22 Aug 2023 05:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692681433;
 bh=+jvnwslWsq/Tc/qVWqkrTTghTcTJYEhN/fQRBxc9GTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AN+Vs4aNh2+pH71kCFvT6Oqu1A/ChXO0NESEee2XcJoaI4+KWK7+WgxPNw9t0dGhF
 L41nfPGTcD0WXqTVwZYUdPwwubsHADcGTdaVH2RwG93o3Lb0idZT22o7bUwAvSAySg
 t/cx1rxaCpp7hKIpNffGsPV67oYNN2giAeDQPh33paKcgf6i6syxlLqVFxZqj50xfg
 kq8sGb5yDGlL9JQllWvXbcTTbkdUdeHhNXy6FYG1+NK/paypeqBY8xeTdlK9x6J5G5
 8lWBIpE+Le2YBZ3J4/iyVpx3HNQhMHZ0ZxjF11a4r4bfBwg2lVTE7GdwgxXFV82nkT
 c5hK4wDFhiXGA==
Date: Mon, 21 Aug 2023 22:17:10 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Message-ID: <20230822051710.GC1661@sol.localdomain>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230812030116.GF971@sol.localdomain>
 <87h6owen39.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6owen39.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
Cc: Nishanth Menon <nm@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [EXTERNAL] Re: [PATCH v2 0/6] Add support for
 Texas Instruments MCRC64 engine
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

On Fri, Aug 18, 2023 at 02:36:34PM +0530, Kamlesh Gurudasani wrote:
> Hi Eric,
> 
> We are more interested in offload than performance, with splice system
> call and DMA mode in driver(will be implemented after this series gets
> merged), good amount of cpu cycles will be saved.

So it's for power usage, then?  Or freeing up CPU for other tasks?

> There is one more mode(auto mode) in mcrc64 which helps to verify crc64
> values against pre calculated crc64, saving the efforts of comparing in
> userspace.

Is there any path forward to actually support this?

> 
> Current generic implementation of crc64-iso(part of this series)
> gives 173 Mb/s of speed as opposed to mcrc64 which gives speed of 812
> Mb/s when tested with tcrypt.

This doesn't answer my question, which to reiterate was:

    How does performance compare to a properly optimized software CRC
    implementation on your platform, i.e. an implementation using carryless
    multiplication instructions (e.g. ARMv8 CE) if available on your platform,
    otherwise an implementation using the slice-by-8 or slice-by-16 method?

The implementation you tested was slice-by-1.  Compared to that, it's common for
slice-by-8 to speed up CRCs by about 4 times and for folding with carryless
multiplication to speed up CRCs by 10-30 times, sometimes limited only by memory
bandwidth.  I don't know what specific results you would get on your specific
CPU and for this specific CRC, and you could certainly see something different
if you e.g. have some low-end embedded CPU.  But those are the typical results
I've seen for other CRCs on different CPUs.  So, a software implementation may
be more attractive than you realize.  It could very well be the case that a
PMULL based CRC implementation actually ends up with less CPU load than your
"hardware offload", when taking into syscall, algif_hash, and driver overhead...

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
