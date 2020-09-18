Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D28DD26F64A
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Sep 2020 08:48:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82C58C32EA8;
	Fri, 18 Sep 2020 06:48:36 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95391C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Sep 2020 06:48:33 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1kJAAz-0002f5-5k; Fri, 18 Sep 2020 16:47:22 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 18 Sep 2020 16:47:21 +1000
Date: Fri, 18 Sep 2020 16:47:21 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <20200918064721.GA9520@gondor.apana.org.au>
References: <20200903131242.128665-1-tianjia.zhang@linux.alibaba.com>
 <20200903131242.128665-6-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903131242.128665-6-tianjia.zhang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Stephan Mueller <smueller@chronox.de>,
 Brendan Higgins <brendanhiggins@google.com>,
 Jia Zhang <zhang.jia@linux.alibaba.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Vitaly Chikunov <vt@altlinux.org>, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Marcelo Henrique Cerri <marcelo.cerri@canonical.com>,
 Waiman Long <longman@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Gilad Ben-Yossef <gilad@benyossef.com>,
 Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 linux-arm-kernel@lists.infradead.org, David Howells <dhowells@redhat.com>,
 Pascal van Leeuwen <pvanleeuwen@rambus.com>, linux-kernel@vger.kernel.org,
 Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v6 5/8] crypto: testmgr - support test
 with different ciphertext per encryption
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

On Thu, Sep 03, 2020 at 09:12:39PM +0800, Tianjia Zhang wrote:
> Some asymmetric algorithms will get different ciphertext after
> each encryption, such as SM2, and let testmgr support the testing
> of such algorithms.
> 
> In struct akcipher_testvec, set c and c_size to be empty, skip
> the comparison of the ciphertext, and compare the decrypted
> plaintext with m to achieve the test purpose.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> Tested-by: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>
> ---
>  crypto/testmgr.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Is there supposed to be another patch that contains test vectors?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
