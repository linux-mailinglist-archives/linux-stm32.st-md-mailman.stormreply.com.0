Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 030F665BC1C
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Jan 2023 09:23:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCAB5C65E45;
	Tue,  3 Jan 2023 08:23:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF885C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 08:23:09 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3032NkDr006262; Tue, 3 Jan 2023 09:22:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=selector1; bh=aAspVQSKmCkv7GW9+IHfNh8yo/A31mPD30r816PYe84=;
 b=WtqkcKrdO0lHhXo/rDNdEYUKOQdOJQbeLk+k9kghES+dszV0K19os7aJPgi2/2DJTqD+
 I0oI3HKUX71xOwIUPVxTrvI5P895FFPj6zpXKvXz7MCkFGgzZXz6x09L6Nl2rfVctHv4
 M9/llqq+L6Qa3Sa1eOt/+zm1kc26hM5OOcxs3LYb4qXRsyeICR42aHvZXmwQ8BqlFigm
 JI3PWIwtyXByn2tOU/RwGCHjZeLDRqh5cHXZ7O1F8FrBDbjpWG8/GZyYJIU5P7NpSVjT
 sZmv6iqNIqMFR7l8sfAXBdbmqZ4vNEqwpLuU9NBYI5hwi9TZWHM+CqgVCMBllbYc2CEd vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtbcpuq2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 09:22:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE78710002A;
 Tue,  3 Jan 2023 09:22:55 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7E1C212FBC;
 Tue,  3 Jan 2023 09:22:55 +0100 (CET)
Received: from [10.201.22.153] (10.201.22.153) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 09:22:54 +0100
Message-ID: <47381b4c-ee7e-8de6-708d-404234c163bf@foss.st.com>
Date: Tue, 3 Jan 2023 09:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
 <20221227-ux500-stm32-hash-v1-5-b637ac4cda01@linaro.org>
From: Lionel DEBIEVE <lionel.debieve@foss.st.com>
In-Reply-To: <20221227-ux500-stm32-hash-v1-5-b637ac4cda01@linaro.org>
X-Originating-IP: [10.201.22.153]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_14,2022-12-30_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 5/7] crypto: stm32/hash: Wait for idle
 before final CPU xmit
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
Content-Type: multipart/mixed; boundary="===============5869406940016779646=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5869406940016779646==
Content-Type: multipart/alternative;
	boundary="------------lo0UZ1ulDn9JoY7nEqQpnEc9"
Content-Language: en-US

--------------lo0UZ1ulDn9JoY7nEqQpnEc9
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Lionel Debieve<lionel.debieve@foss.st.com>

On 12/28/22 00:03, Linus Walleij wrote:

> When calculating the hash using the CPU, right before the final
> hash calculation, heavy testing on Ux500 reveals that it is wise
> to wait for the hardware to go idle before calculating the
> final hash.
>
> The default test vectors mostlt worked fine, but when I used the
> extensive tests and stress the hardware I ran into this problem.
>
> Signed-off-by: Linus Walleij<linus.walleij@linaro.org>
> ---
>   drivers/crypto/stm32/stm32-hash.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
> index 5f03be121787..92b2d55d6e93 100644
> --- a/drivers/crypto/stm32/stm32-hash.c
> +++ b/drivers/crypto/stm32/stm32-hash.c
> @@ -362,6 +362,9 @@ static int stm32_hash_xmit_cpu(struct stm32_hash_dev *hdev,
>   		stm32_hash_write(hdev, HASH_DIN, buffer[count]);
>   
>   	if (final) {
> +		if (stm32_hash_wait_busy(hdev))
> +			return -ETIMEDOUT;
> +
>   		stm32_hash_set_nblw(hdev, length);
>   		reg = stm32_hash_read(hdev, HASH_STR);
>   		reg |= HASH_STR_DCAL;
>
--------------lo0UZ1ulDn9JoY7nEqQpnEc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="moz-quote-pre" wrap="">Acked-by: Lionel Debieve <a class="moz-txt-link-rfc2396E" href="mailto:lionel.debieve@foss.st.com">&lt;lionel.debieve@foss.st.com&gt;</a></pre>
    <p></p>
    <div class="moz-cite-prefix">
      <pre>On 12/28/22 00:03, Linus Walleij wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20221227-ux500-stm32-hash-v1-5-b637ac4cda01@linaro.org">
      <pre class="moz-quote-pre" wrap="">When calculating the hash using the CPU, right before the final
hash calculation, heavy testing on Ux500 reveals that it is wise
to wait for the hardware to go idle before calculating the
final hash.

The default test vectors mostlt worked fine, but when I used the
extensive tests and stress the hardware I ran into this problem.

Signed-off-by: Linus Walleij <a class="moz-txt-link-rfc2396E" href="mailto:linus.walleij@linaro.org">&lt;linus.walleij@linaro.org&gt;</a>
---
 drivers/crypto/stm32/stm32-hash.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 5f03be121787..92b2d55d6e93 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -362,6 +362,9 @@ static int stm32_hash_xmit_cpu(struct stm32_hash_dev *hdev,
 		stm32_hash_write(hdev, HASH_DIN, buffer[count]);
 
 	if (final) {
+		if (stm32_hash_wait_busy(hdev))
+			return -ETIMEDOUT;
+
 		stm32_hash_set_nblw(hdev, length);
 		reg = stm32_hash_read(hdev, HASH_STR);
 		reg |= HASH_STR_DCAL;

</pre>
    </blockquote>
  </body>
</html>

--------------lo0UZ1ulDn9JoY7nEqQpnEc9--

--===============5869406940016779646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5869406940016779646==--
