Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB3FA7F384
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 06:22:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BAEBC78F7F;
	Tue,  8 Apr 2025 04:22:33 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 414F6C78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 04:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mahaabwDrQlQzhrNZftxJhgbFWCOhwEQ+DtuX71tBgo=; b=YfBrzn9h6eYCkpnfx+kdVgpMYM
 /ORtIBDJCM6yaKVs3H08hjqHKk8iDe9xqkermuv0sDSrgaEvWhwOAf2GYX8dJ7qxMeajRitWdRlLi
 P1OtoaL22eOs7/kuKS40NdC48/wwk0Aa9Vk3rlDvpQw6QexNPKi00vkSVM1YiXlyis4XlaHM5MVmK
 J/OUN6sylUHcgGCidEUttf7D82CbMQ0+XwLa2XM2lxD8hSUOE/j85eafYrOqrvtVZfFeCLZqnfQaa
 ahEwWt7J6P3ZxuLQmjFqMHr7KvK0/prUfnqVvWhCgoz5LJXwpPKBSjfe5z6XwoXfh5lYxnKtpGW1V
 W+IJySFQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1u20TZ-00Dlme-1v; Tue, 08 Apr 2025 12:22:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 08 Apr 2025 12:22:17 +0800
Date: Tue, 8 Apr 2025 12:22:17 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Li Zhijian <lizhijian@fujitsu.com>
Message-ID: <Z_Skef-ZAYAzPfOF@gondor.apana.org.au>
References: <20250408041647.88489-1-lizhijian@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250408041647.88489-1-lizhijian@fujitsu.com>
Cc: Erhard Furtner <erhard_f@mailbox.org>, linux-kernel@vger.kernel.org,
 davem@davemloft.net, linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto/testmgr: Fix acomp_req leak
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

On Tue, Apr 08, 2025 at 12:16:47PM +0800, Li Zhijian wrote:
> The kmemleak reported that
> ...
> unreferenced object 0xffff888108d6c300 (size 256):
>   comm "cryptomgr_test", pid 183, jiffies 4294700957
>   hex dump (first 32 bytes):
>     00 c1 d6 08 81 88 ff ff 00 cb d6 08 81 88 ff ff  ................
>     50 cd a7 81 ff ff ff ff b8 fb 93 02 00 c9 ff ff  P...............
>   backtrace (crc 29cca632):
>     __kmalloc_noprof+0x2fa/0x430
>     test_acomp+0x174/0x960
>     alg_test_comp+0x6f/0x90
>     alg_test.part.26+0x105/0x410
>     cryptomgr_test+0x20/0x40
>     kthread+0x10c/0x250
>     ret_from_fork+0x30/0x40
>     ret_from_fork_asm+0x1a/0x30
> unreferenced object 0xffff888108d6c100 (size 256):
>   comm "cryptomgr_test", pid 183, jiffies 4294700972
>   hex dump (first 32 bytes):
>     00 1d da 08 81 88 ff ff 00 c3 d6 08 81 88 ff ff  ................
>     50 cd a7 81 ff ff ff ff b8 fb 93 02 00 c9 ff ff  P...............
>   backtrace (crc 3047d62b):
>     __kmalloc_noprof+0x2fa/0x430
>     test_acomp+0x174/0x960
>     alg_test_comp+0x6f/0x90
>     alg_test.part.26+0x105/0x410
>     cryptomgr_test+0x20/0x40
>     kthread+0x10c/0x250
>     ret_from_fork+0x30/0x40
>     ret_from_fork_asm+0x1a/0x30
> 
> acomp_request will be chained to req[0], however,
> acomp_request_free(), it will not free the whole chain.
> 
> Fix it by freeing them one by one.
> 
> Fixes: 99585c2192cb ("crypto: testmgr - Add multibuffer acomp testing")
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Closes: https://lore.kernel.org/linux-crypto/20250408002741.089f1e9a@outsider.home/
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---
>  crypto/testmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the patch but this will be removed by

https://patchwork.kernel.org/project/linux-crypto/patch/048b1e176dd3507ec31497ccf215630dc2b2ed04.1744018301.git.herbert@gondor.apana.org.au/

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
