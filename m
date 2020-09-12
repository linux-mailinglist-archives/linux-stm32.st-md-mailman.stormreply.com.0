Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC42678E0
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Sep 2020 10:36:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BEC4C3FAFE;
	Sat, 12 Sep 2020 08:36:55 +0000 (UTC)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AE89C3FAE2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Sep 2020 08:36:53 +0000 (UTC)
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 8C4D172CA54;
 Sat, 12 Sep 2020 11:36:52 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id 40EEF4A4A16;
 Sat, 12 Sep 2020 11:36:52 +0300 (MSK)
Date: Sat, 12 Sep 2020 11:36:52 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <20200912083652.dxosjsartbvnxq2r@altlinux.org>
References: <20200903131242.128665-1-tianjia.zhang@linux.alibaba.com>
 <20200903131242.128665-9-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903131242.128665-9-tianjia.zhang@linux.alibaba.com>
Cc: Stephan Mueller <smueller@chronox.de>,
 Brendan Higgins <brendanhiggins@google.com>,
 Jia Zhang <zhang.jia@linux.alibaba.com>, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Marcelo Henrique Cerri <marcelo.cerri@canonical.com>,
 Waiman Long <longman@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Gilad Ben-Yossef <gilad@benyossef.com>,
 Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 linux-arm-kernel@lists.infradead.org,
 Pascal van Leeuwen <pvanleeuwen@rambus.com>, linux-kernel@vger.kernel.org,
 Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v6 8/8] integrity: Asymmetric digsig
 supports SM2-with-SM3 algorithm
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

On Thu, Sep 03, 2020 at 09:12:42PM +0800, Tianjia Zhang wrote:
> Asymmetric digsig supports SM2-with-SM3 algorithm combination,
> so that IMA can also verify SM2's signature data.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> Tested-by: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com> (coding, not crypto

It looks not breaking ecrdsa/streebog handling and accords to rfc draft:

  https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02

  5.1.4.2.  Hash Functions
    The sm2 digital signature algorithm requires the hash functions
    approved by Chinese Commercial Cryptography Administration Office,
    such as sm3.

Reviewed-by: Vitaly Chikunov <vt@altlinux.org>

Thanks,

> ---
>  security/integrity/digsig_asymmetric.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/security/integrity/digsig_asymmetric.c b/security/integrity/digsig_asymmetric.c
> index cfa4127d0518..b86a4a8f61ab 100644
> --- a/security/integrity/digsig_asymmetric.c
> +++ b/security/integrity/digsig_asymmetric.c
> @@ -99,14 +99,22 @@ int asymmetric_verify(struct key *keyring, const char *sig,
>  	memset(&pks, 0, sizeof(pks));
>  
>  	pks.hash_algo = hash_algo_name[hdr->hash_algo];
> -	if (hdr->hash_algo == HASH_ALGO_STREEBOG_256 ||
> -	    hdr->hash_algo == HASH_ALGO_STREEBOG_512) {
> +	switch (hdr->hash_algo) {
> +	case HASH_ALGO_STREEBOG_256:
> +	case HASH_ALGO_STREEBOG_512:
>  		/* EC-RDSA and Streebog should go together. */
>  		pks.pkey_algo = "ecrdsa";
>  		pks.encoding = "raw";
> -	} else {
> +		break;
> +	case HASH_ALGO_SM3_256:
> +		/* SM2 and SM3 should go together. */
> +		pks.pkey_algo = "sm2";
> +		pks.encoding = "raw";
> +		break;
> +	default:
>  		pks.pkey_algo = "rsa";
>  		pks.encoding = "pkcs1";
> +		break;
>  	}
>  	pks.digest = (u8 *)data;
>  	pks.digest_size = datalen;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
