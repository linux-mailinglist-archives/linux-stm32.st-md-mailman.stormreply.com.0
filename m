Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6112528A129
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Oct 2020 20:32:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10435C3FAD5;
	Sat, 10 Oct 2020 18:32:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D13BC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Oct 2020 18:32:29 +0000 (UTC)
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DC1B224DE;
 Sat, 10 Oct 2020 18:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602354747;
 bh=t2YgZVluuf4vryGXDuJmdnGG2MK0FpJGL36ekpajFyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iJtOcZGh7MXDk3mHCLkO2CpBhVWoNQBXNq6tf8cfsTaZ6DpFprFeTrBnvbRhKd6KR
 ybWmbC57523Qg3vIUgF/Li8eFfwHMtvyz6IycfzpS+OMD7xzODZfvZAGtGdzMBnyDh
 8dyze2Gfxz8If89W7su1tb7C0SbjvOhXaiHWdMoQ=
Date: Sat, 10 Oct 2020 11:32:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ye Bin <yebin10@huawei.com>
Message-ID: <20201010183226.GA1808@sol.localdomain>
References: <20201010021637.112091-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201010021637.112091-1-yebin10@huawei.com>
Cc: linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 herbert@gondor.apana.org.au
Subject: Re: [Linux-stm32] [PATCH] crypto: testmgr - Fix format argument
	warning
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

On Sat, Oct 10, 2020 at 10:16:37AM +0800, Ye Bin wrote:
> Fix follow warning:
> [crypto/testmgr.c:2317]: (warning) %d in format string (no. 5) requires
> 'int' but the argument type is 'unsigned int'.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> ---
>  crypto/testmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> index a64a639eddfa..aefa4b6b8d78 100644
> --- a/crypto/testmgr.c
> +++ b/crypto/testmgr.c
> @@ -2315,7 +2315,7 @@ static void generate_random_aead_testvec(struct aead_request *req,
>  	if (vec->setkey_error == 0 && vec->setauthsize_error == 0)
>  		generate_aead_message(req, suite, vec, prefer_inauthentic);
>  	snprintf(name, max_namelen,
> -		 "\"random: alen=%u plen=%u authsize=%u klen=%u novrfy=%d\"",
> +		 "\"random: alen=%u plen=%u authsize=%u klen=%u novrfy=%u\"",
>  		 vec->alen, vec->plen, authsize, vec->klen, vec->novrfy);

Actually vec->novrfy is 'unsigned char', not 'unsigned int'.  Both %u and %d
will work, but %d is technically correct because 'unsigned char' gets promoted
to 'int'.  What tool are you using that claims this is wrong?

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
