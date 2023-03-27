Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF996C9DEB
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 10:33:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA24FC6A5F6;
	Mon, 27 Mar 2023 08:33:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C13DDC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 08:33:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32R6V1H7009540; Mon, 27 Mar 2023 10:33:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=content-type :
 message-id : date : mime-version : subject : to : references : from :
 in-reply-to; s=selector1; bh=fpoyyzUt1Bk1yruHAJ2S/Ha2Gf+cvKYilP2Hrz+Z/oM=;
 b=E4p0+jDajG4O0h9xRXWki3uIIank9yN6R+8VEyNlPwamuI9S6ktn5gsTmS2VjQ+pOPWE
 MRISvm5iwqXk6tORyCbGAzVHBlleNeECRorC6GJKxYj4nHn9rsl8ZZxHGo2y2E78xN1P
 4R90DIVdOgVFgNW/h+DvKshIZ00mQ+ftwYnHGTHIMoIEALs+dc3FxPu3VGl8664Npe8d
 KPGMQDJvc1qJ6WGKuzWcg8m5mo5CW09bgbEgiZ/E7o5MGeGG5pU6pNvFwE4Ns2TQhkKQ
 1WgcO/yMJiZZhNwVHM9rZq8b1jsdh7apMoaoMi+jlymPlVFqBKiZLoIw+SFXnxY98rhq /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pk5xk8vh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 10:33:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 662C010002A;
 Mon, 27 Mar 2023 10:33:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5FD9C211F07;
 Mon, 27 Mar 2023 10:33:11 +0200 (CEST)
Received: from [10.201.22.173] (10.201.22.173) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 27 Mar
 2023 10:33:12 +0200
Message-ID: <e7cd1e8b-9ebc-ff6d-a8c4-1ccd11df6de1@foss.st.com>
Date: Mon, 27 Mar 2023 10:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
To: Herbert Xu <herbert@gondor.apana.org.au>, Linus Walleij
 <linus.walleij@linaro.org>, Lionel Debieve <lionel.debieve@foss.st.com>, Li
 kunyu <kunyu@nfschina.com>, <davem@davemloft.net>,
 <linux-arm-kernel@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <mcoquelin.stm32@gmail.com>
References: <ZAxFBR3TdA7jUAgJ@gondor.apana.org.au>
 <E1pavED-002xbf-LL@formenos.hmeau.com>
From: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
In-Reply-To: <E1pavED-002xbf-LL@formenos.hmeau.com>
X-Originating-IP: [10.201.22.173]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
Subject: Re: [Linux-stm32] [v7 PATCH 8/8] crypto: stm32 - Save and restore
 between each request
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
Content-Type: multipart/mixed; boundary="===============3916660133415041134=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3916660133415041134==
Content-Type: multipart/alternative;
	boundary="------------OJK46vj4EtA7f0GcP2B09DbY"

--------------OJK46vj4EtA7f0GcP2B09DbY
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Herbert,

I'm working on the patch for STM32MP13.

On Sat, Mar 11, 2023 at 10:09 AM Herbert Xu<herbert@gondor.apana.org.au>  wrote:

> The Crypto API hashing paradigm requires the hardware state to
> be exported between *each* request because multiple unrelated
> hashes may be processed concurrently.
>
> The stm32 hardware is capable of producing the hardware hashing
> state but it was only doing it in the export function.  This is
> not only broken for export as you can't export a kernel pointer
> and reimport it, but it also means that concurrent hashing was
> fundamentally broken.
>
> Fix this by moving the saving and restoring of hardware hash
> state between each and every hashing request.
>
> Fixes: 8a1012d3f2ab ("crypto: stm32 - Support for STM32 HASH module")
> Reported-by: Li kunyu<kunyu@nfschina.com>
> Signed-off-by: Herbert Xu<herbert@gondor.apana.org.au>
> ---
>
>   drivers/crypto/stm32/stm32-hash.c |  164 ++++++++++++--------------------------
>   1 file changed, 56 insertions(+), 108 deletions(-)
>
> diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
> index f898ec62b459..17183f631bb4 100644
> --- a/drivers/crypto/stm32/stm32-hash.c
> +++ b/drivers/crypto/stm32/stm32-hash.c
> @@ -135,7 +135,7 @@ struct stm32_hash_state {
>   	u8 buffer[HASH_BUFLEN] __aligned(4);
>   
>   	/* hash state */
> -	u32			*hw_context;
> +	u32			hw_context[3 + HASH_CSR_REGISTER_NUMBER];
>   };

The version of HASH implemented in the STM32MP13 provides new algorithms (SHA512, SHA3, ...).
Because of that, the constant HASH_CSR_REGISTER_NUMBER increases (from 54 to 103).
Hence, the size of stm32_hash_state is equal to 688 which is bigger than HASH_MAX_STATESIZE(=512)
and the driver fails to register the algorithms.

Is there any reasons why HASH_MAX_STATESIZE is set to 512 ?
I only see it used to define static arrays, so maybe it could be set to 1024.

BR

Thomas Bourgoin

--------------OJK46vj4EtA7f0GcP2B09DbY
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-text-html" lang="x-unicode">
      <div class="moz-text-html" lang="x-unicode">
        <pre>Hi Herbert,

I'm working on the patch for STM32MP13. </pre>
        <div class="moz-cite-prefix">
          <pre>On Sat, Mar 11, 2023 at 10:09 AM Herbert Xu <a class="moz-txt-link-rfc2396E" href="mailto:herbert@gondor.apana.org.au">&lt;herbert@gondor.apana.org.au&gt;</a> wrote:</pre>
        </div>
        <blockquote type="cite"
          cite="mid:E1pavED-002xbf-LL@formenos.hmeau.com">
          <pre class="moz-quote-pre" wrap="">The Crypto API hashing paradigm requires the hardware state to
be exported between *each* request because multiple unrelated
hashes may be processed concurrently.

The stm32 hardware is capable of producing the hardware hashing
state but it was only doing it in the export function.  This is
not only broken for export as you can't export a kernel pointer
and reimport it, but it also means that concurrent hashing was
fundamentally broken.

Fix this by moving the saving and restoring of hardware hash
state between each and every hashing request.

Fixes: 8a1012d3f2ab ("crypto: stm32 - Support for STM32 HASH module")
Reported-by: Li kunyu <a class="moz-txt-link-rfc2396E" href="mailto:kunyu@nfschina.com">&lt;kunyu@nfschina.com&gt;</a>
Signed-off-by: Herbert Xu <a class="moz-txt-link-rfc2396E" href="mailto:herbert@gondor.apana.org.au">&lt;herbert@gondor.apana.org.au&gt;</a>
---

 drivers/crypto/stm32/stm32-hash.c |  164 ++++++++++++--------------------------
 1 file changed, 56 insertions(+), 108 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index f898ec62b459..17183f631bb4 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -135,7 +135,7 @@ struct stm32_hash_state {
 	u8 buffer[HASH_BUFLEN] __aligned(4);
 
 	/* hash state */
-	u32			*hw_context;
+	u32			hw_context[3 + HASH_CSR_REGISTER_NUMBER];
 };
</pre>
        </blockquote>
        <pre>The version of HASH implemented in the STM32MP13 provides new algorithms (SHA512, SHA3, ...). 
Because of that, the constant HASH_CSR_REGISTER_NUMBER increases (from 54 to 103).
Hence, the size of stm32_hash_state is equal to 688 which is bigger than HASH_MAX_STATESIZE(=512)
and the driver fails to register the algorithms.

Is there any reasons why HASH_MAX_STATESIZE is set to 512 ? 
I only see it used to define static arrays, so maybe it could be set to 1024.

BR 

Thomas Bourgoin
</pre>
      </div>
      <pre>
</pre>
    </div>
  </body>
</html>

--------------OJK46vj4EtA7f0GcP2B09DbY--

--===============3916660133415041134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3916660133415041134==--
