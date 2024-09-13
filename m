Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB455977D9E
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Sep 2024 12:35:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 584DEC78017;
	Fri, 13 Sep 2024 10:35:55 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0239C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2024 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0CNSbKCh69zCkNZH9jjKsEGylWzRRbRWSCCkDQw1EN4=; b=b0oRHCYmhr2BHyiELxmtqT8RHH
 L0n+o1OocTiaM9+NYNmaOM/L1OjhoCUkRZAwChGWKWOe5cmg//ZSKgQ9WjOKSq2hobW8loM1lIgGd
 PpraMNvXMnyAvkNRkSHW82BaW42d0xkrKZNkkoDyNx42GCxEYJJDPIuYoVWqi+gSQ3xchSyRgruFY
 ZoowMCGpsRXlWHYODOHhL2INhN/hij7SsZgqmhUpEm+ZGYBCPYaGYQIQmsuJ2oF/XsjaFr5alfRKn
 1ygt5YEj8V+aWEvNbAMEofsQairfmQVJALguTZLIGjIIRkUaBVPTJo3KPZfLWGngaC7saj/7RKYQ0
 R7A1fCJw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1sp3UD-002E1K-2g; Fri, 13 Sep 2024 18:35:24 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 13 Sep 2024 18:35:23 +0800
Date: Fri, 13 Sep 2024 18:35:23 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Message-ID: <ZuQVa8ARmd4fjAup@gondor.apana.org.au>
References: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
 <87tti098af.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <Zme3EcW4Uz8kTbTt@gondor.apana.org.au>
 <20240611031314.GA2557@sol.localdomain>
 <ZmfBxLB8RC_KNUlx@gondor.apana.org.au>
 <87cylhm3tn.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cylhm3tn.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
Cc: robh@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 kristo@kernel.org, devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, akpm@linux-foundation.org, will@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
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

On Fri, Sep 06, 2024 at 04:44:44PM +0530, Kamlesh Gurudasani wrote:
>
> Just wanted to confirm, if this is being rejected primarily because
> 1. there is no in-kernel user for crc64-iso3309
> 2. or poor performance benefit of using it from userspace

Essentially we don't want to add every random algorithm to the crypto
API because we may end up having to maintain them long after the users
have disappeared.

For a special-purpose algorithm like this, it's perfectly fine to have
a custom driver to be made so that your user-space app can access the
hardware.

> The context for asking is that we have another superset IP known as MCRC
> (this one is MCRC64), which supports crc8/16/32/64(iso-3309).
> 
> That IP has working DMA and will give good offloading numbers.
> 
> We are planning to send drivers for crc8/16/32 for MCRC
> 1.should I put efforts for crc64-iso3309 as well or
> 2.drop the crc64-iso3309 and send only for remaining
> crc8/16/32(standard algorithms with already in-kernel user).
> 
> All our devices either have MCRC or MCRC64.

Do any existing kernel users benefit sufficiently from these algorithms
being offloaded? If no then there is no need to bother.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
