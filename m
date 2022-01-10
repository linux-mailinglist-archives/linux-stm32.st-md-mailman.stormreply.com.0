Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DF489EA0
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jan 2022 18:48:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71AB3C5F1FC;
	Mon, 10 Jan 2022 17:48:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAF69CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jan 2022 17:48:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AE5160B59;
 Mon, 10 Jan 2022 17:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFA4C36AE3;
 Mon, 10 Jan 2022 17:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641836904;
 bh=KiOlz2TRaGGfIu+ZWVRftSJ3vEG+bot8fE4I4Q+0ZwI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q8Hq/T3nLaXInhFlON+FbegXUxwsn/Y96nFIghTKOLRZq5r8s53cIZ/Cej05eCCPr
 3ARyRyl+64UKnqhXonsCu70rUcV9RTPAcXnAF/4cJy/lltgeSMA0fUfpsSLZY0eeLL
 z15RDsN82q2VNWlgiYLxQB/NUXdT2ScpDclFOGt5ao6ecXIgURVjxqePBwvfAM7WPO
 +NfgpZD0kHBHLLKHdYSGnY+jWvv77NXJBXqD/mYKiAfliU4VDfVDlDoJiMkTvocgKb
 Kurm9AJMBoQxZ1Hv4I4TMGWHGOTtVc3unCMRkRNYSfL7TYbbaadFVsFmDIioQjPti4
 ZD1l2JNHCygtA==
Date: Mon, 10 Jan 2022 09:48:22 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Peng Luo <wuhanluop@163.com>
Message-ID: <YdxxZmmlWp+RQeGC@sol.localdomain>
References: <20220109170239.4322-1-wuhanluop@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109170239.4322-1-wuhanluop@163.com>
Cc: herbert@gondor.apana.org.au, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 terrelln@fb.com, linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: testmgr - fix some wrong vectors
	of aes-ccm
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

On Mon, Jan 10, 2022 at 01:02:39AM +0800, Peng Luo wrote:
> Some vectors of aes-ccm are wrong.
> This patch has been tested with kernel 4.9 and openssl1.1.1k.
> 
> Signed-off-by: Peng Luo <wuhanluop@163.com>
> ---
>  crypto/testmgr.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/crypto/testmgr.h b/crypto/testmgr.h
> index a253d66ba1c1..ff171fe53979 100644
> --- a/crypto/testmgr.h
> +++ b/crypto/testmgr.h
> @@ -19865,8 +19865,8 @@ static const struct aead_testvec aes_ccm_tv_template[] = {
>  			  "\xd0\xd1\x3d\x1a\xa3\x6d\xe4\x0a"
>  			  "\x86\xb0\x87\x6b\x62\x33\x8c\x34"
>  			  "\xce\xab\x57\xcc\x79\x0b\xe0\x6f"
> -			  "\x5c\x3e\x48\x1f\x6c\x46\xf7\x51"
> -			  "\x8b\x84\x83\x2a\xc1\x05\xb8\xc5",
> +			  "\xCF\xE9\xF9\x21\x3C\x1A\xCE\x67"
> +			  "\x62\x7B\x36\x3A\xEA\x19\xAC\x58",
>  		.clen	= 48,
>  		.novrfy	= 1,
>  	}, {
> @@ -19952,8 +19952,8 @@ static const struct aead_testvec aes_ccm_tv_template[] = {
>  			  "\xc6\x0e\x6e\xe5\xd6\x98\xa6\x37"
>  			  "\x8c\x26\x33\xc6\xb2\xa2\x17\xfa"
>  			  "\x64\x19\xc0\x30\xd7\xfc\x14\x6b"
> -			  "\xe3\x33\xc2\x04\xb0\x37\xbe\x3f"
> -			  "\xa9\xb4\x2d\x68\x03\xa3\x44\xef",
> +			  "\x08\x5A\x20\x4A\xB0\x2C\xF9\x49"
> +			  "\x10\x1C\x9C\x85\x8C\x12\xE0\x3A",
>  		.clen	= 48,
>  		.novrfy	= 1,
>  	}, {
> @@ -19983,7 +19983,7 @@ static const struct aead_testvec aes_ccm_tv_template[] = {
>  			  "\x3e\xaf\x70\x5e\xb2\x4d\xea\x39"
>  			  "\x89\xd4\x75\x7a\x63\xb1\xda\x93",
>  		.plen	= 32,
> -		.ctext	= "\x48\x01\x5e\x02\x24\x04\x66\x47"
> +		.ctext	= "\x14\x01\x5e\x02\x24\x04\x66\x47"
>  			  "\xa1\xea\x6f\xaf\xe8\xfc\xfb\xdd"
>  			  "\xa5\xa9\x87\x8d\x84\xee\x2e\x77"
>  			  "\xbb\x86\xb9\xf5\x5c\x6c\xff\xf6"

This patch causes a self-test failure:

	[   22.354527] alg: aead: ccm_base(ctr-aes-aesni,cbcmac(aes-aesni)) decryption unexpectedly succeeded on test vector 16; expected_error"
	[   22.355843] ------------[ cut here ]------------
	[   22.356306] alg: self-tests for ccm_base(ctr-aes-aesni,cbcmac(aes-aesni)) (ccm(aes)) failed (rc=-22)

Please be more specific about what is wrong.  Also, please test with the latest
upstream kernel, not v4.9 which is over 5 years old.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
