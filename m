Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDF660562C
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Oct 2022 05:58:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A154AC64104;
	Thu, 20 Oct 2022 03:58:44 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93E81C55596
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Oct 2022 03:58:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10CD5B825C6;
 Thu, 20 Oct 2022 03:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47030C433C1;
 Thu, 20 Oct 2022 03:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666238321;
 bh=tZLEOSmLZX9fAjwEpzjOiiXPK8cCgzbSv+ofgqwpMjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qpNkVYQ7zj1ggo48POKzGIxFc3C6BqZ7K0a/4IKbrEm/NbcPgtX68orL9nKLdueuz
 wR297dV/gmel1valM0nTLGZC5nC1ec5q8NNyF8r321gIJ3/W8JKGFxWRFKMIifC/+0
 8B93SV0m4THHI9hK4/wU0y+wnHJIKc1PwavtTRD7pjLkv0OUS4i4mcI1CLIh8N8p/o
 Nx4T+b9CeNhCuBO9+wsjjTFV0DhUcPg2CbTZIZ2vIqgtGjcCdqQrgKxAQLEAE3GBLU
 0GOCd7eJ1c6qWXY07/LO4NYGa0sskglW3OlAIcoWj2HEeCiQOTA4uD0sNDjPwb25d6
 ZMSceoXYCOiOA==
Date: Wed, 19 Oct 2022 20:58:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <Y1DHb66VYPzFlTwh@sol.localdomain>
References: <20221018071006.5717-1-tianjia.zhang@linux.alibaba.com>
 <20221018071006.5717-13-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018071006.5717-13-tianjia.zhang@linux.alibaba.com>
Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>, linux-kernel@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "David S. Miller" <davem@davemloft.net>, Mark Brown <broonie@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 12/15] crypto: arm64/sm4 - add CE
 implementation for ESSIV mode
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

On Tue, Oct 18, 2022 at 03:10:03PM +0800, Tianjia Zhang wrote:
> This patch is a CE-optimized assembly implementation for ESSIV mode.
> The assembly part is realized by reusing the CBC mode.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>

Is there still a use case for CBC-ESSIV mode these days, now that everyone is
using XTS instead?

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
