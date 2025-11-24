Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 966A2C7FB65
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Nov 2025 10:48:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BBB1C030CD;
	Mon, 24 Nov 2025 09:48:58 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 847EAC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
 from:content-type:reply-to; bh=bcui04wUrJGLCUSACMGAJjVCbT+7fdon+daQNvMd9Zo=; 
 b=Gzok8FeUMi+72XYChLg5NvbnOmmS+6/dobmqOxyGZ3EPUr1DGs3dCT4nf7Jc6igiIg5VlkExM5o
 qfujUK4WYscZTivMF+W8YXg2ONdVoBVzpzgN0wY1o0UZwbUtE/1gcb8ZVOw2UyqUtlp/CWYs8rUN+
 WORtHCOxERS6jw39KJmj7/byJ2NqyWj9AXalsRX+tdtzNcuxJLiutXJHNJjxe9tlE9u9JPMvvyoq+
 xMShLX8tmDs/5pUnSHRsqBbSUoFBWF2H/G3YjU/nIUG8cjGFmn8k/4R1I0dEvk3uC/Gmqj+XQKik5
 R7ZZ8jTss3SADpVdsGTRydaFYdPiR4NSVq6A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1vNTBT-005XMj-1s; Mon, 24 Nov 2025 17:48:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 24 Nov 2025 17:48:35 +0800
Date: Mon, 24 Nov 2025 17:48:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Message-ID: <aSQp8x2yrLTZQ-lj@gondor.apana.org.au>
References: <20251117114426.99713-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117114426.99713-2-thorsten.blum@linux.dev>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: testmgr - Add missing DES weak
 and semi-weak key tests
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

On Mon, Nov 17, 2025 at 12:44:26PM +0100, Thorsten Blum wrote:
> Ever since commit da7f033ddc9f ("crypto: cryptomgr - Add test
> infrastructure"), the DES test suite has tested only one of the four
> weak keys and none of the twelve semi-weak keys.
> 
> DES has four weak keys and twelve semi-weak keys, and the kernel's DES
> implementation correctly detects and rejects all of these keys when the
> CRYPTO_TFM_REQ_FORBID_WEAK_KEYS flag is set. However, only a single weak
> key was being tested. Add tests for all 16 weak and semi-weak keys.
> 
> While DES is deprecated, it is still used in some legacy protocols, and
> weak/semi-weak key detection should be tested accordingly.
> 
> Tested on arm64 with cryptographic self-tests.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  crypto/testmgr.h | 120 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
