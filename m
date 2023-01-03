Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DC165BC11
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Jan 2023 09:21:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B2A1C65E45;
	Tue,  3 Jan 2023 08:21:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8D7CC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 08:21:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3033RIr7014931; Tue, 3 Jan 2023 09:21:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=selector1; bh=AIRyWjK6DWrumDdX1fq/aoa9jC6GTGkFiSpa6rZ8+Fw=;
 b=OlMOA5rHo8uJJTGo18MEC4jiN7uAc50nGk2u/RKY4cbGo/6fPEHu42lIfDNGX+ite5KL
 X8FmuI+6DSAQlddPvYa5wSq/vl9ZM7J+64+EzEWPUQF/rJlLIJmdt4fsY5YtPNb4b6Ga
 HBAcmO94KjfPckj7MFUKh3RhCBINudri9f34pGIONBMN5iJsAZ2YB7WeAluvDVi6yqB4
 yvP7Hq/2I8vE2MYaWEl+yClDUYfmmSScViFbuYgVcxMZadCw0GTiAMPuHi90jGFsCBWE
 HW4D7Rjf/tX+Lzvgc5fs2i80IV/zxeHP1iu1t0YANHy7IiQY3kXYrYSW/c2A7x/Bv1eR qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtda63cvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 09:21:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FDF710002A;
 Tue,  3 Jan 2023 09:21:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79166212FBC;
 Tue,  3 Jan 2023 09:21:18 +0100 (CET)
Received: from [10.201.22.153] (10.201.22.153) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 09:21:17 +0100
Message-ID: <c0ddde67-2a9c-fcd3-4db3-252d5e059f40@foss.st.com>
Date: Tue, 3 Jan 2023 09:21:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Linus Walleij <linus.walleij@linaro.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org>
 <20221227-ux500-stm32-hash-v1-4-b637ac4cda01@linaro.org>
Content-Language: en-US
From: Lionel DEBIEVE <lionel.debieve@foss.st.com>
In-Reply-To: <20221227-ux500-stm32-hash-v1-4-b637ac4cda01@linaro.org>
X-Originating-IP: [10.201.22.153]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_14,2022-12-30_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 4/7] crypto: stm32/hash: Make dma_mode a
	bool
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
Content-Type: multipart/mixed; boundary="===============5037765362065370683=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5037765362065370683==
Content-Type: multipart/alternative;
	boundary="------------P950ehpOdKtgxkdwz6IIOnzq"
Content-Language: en-US

--------------P950ehpOdKtgxkdwz6IIOnzq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

On 12/28/22 00:03, Linus Walleij wrote:

> This flag enables/disables DMA mode and is a true/false
> flag so make it a bool. Clamp the value from the
> HASH_HWCFGR register to a bool as well using a double-bang
> construction.
>
> Signed-off-by: Linus Walleij<linus.walleij@linaro.org>
> ---
>   drivers/crypto/stm32/stm32-hash.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
> index cc0a4e413a82..5f03be121787 100644
> --- a/drivers/crypto/stm32/stm32-hash.c
> +++ b/drivers/crypto/stm32/stm32-hash.c
> @@ -166,7 +166,7 @@ struct stm32_hash_dev {
>   	struct reset_control	*rst;
>   	void __iomem		*io_base;
>   	phys_addr_t		phys_base;
> -	u32			dma_mode;
> +	bool			dma_mode;

Till now, the value is 0 or 1.
I'm expecting in the future that the value could become greater than 1, it comes from the HW register value where the bitfield is 4 bits.
Bool can simplify for now but will be moved back to u32 once the value will be increased. I'd prefer to keep the dma_mode as u32.

>   	u32			dma_maxburst;
>   
>   	struct ahash_request	*req;
> @@ -481,7 +481,7 @@ static int stm32_hash_hmac_dma_send(struct stm32_hash_dev *hdev)
>   	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(tfm);
>   	int err;
>   
> -	if (ctx->keylen < HASH_DMA_THRESHOLD || (hdev->dma_mode == 1)) {
> +	if (ctx->keylen < HASH_DMA_THRESHOLD || (hdev->dma_mode)) {
>   		err = stm32_hash_write_key(hdev);
>   		if (stm32_hash_wait_busy(hdev))
>   			return -ETIMEDOUT;
> @@ -568,7 +568,7 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
>   
>   		sg[0] = *tsg;
>   		if (sg_is_last(sg)) {
> -			if (hdev->dma_mode == 1) {
> +			if (hdev->dma_mode) {
>   				len = (ALIGN(sg->length, 16) - 16);
>   
>   				ncp = sg_pcopy_to_buffer(
> @@ -602,7 +602,7 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
>   			return err;
>   	}
>   
> -	if (hdev->dma_mode == 1) {
> +	if (hdev->dma_mode) {
>   		if (stm32_hash_wait_busy(hdev))
>   			return -ETIMEDOUT;
>   		reg = stm32_hash_read(hdev, HASH_CR);
> @@ -663,7 +663,7 @@ static bool stm32_hash_dma_aligned_data(struct ahash_request *req)
>   		return false;
>   
>   	if (sg_nents(req->src) > 1) {
> -		if (hdev->dma_mode == 1)
> +		if (hdev->dma_mode)
>   			return false;
>   		for_each_sg(req->src, sg, sg_nents(req->src), i) {
>   			if ((!IS_ALIGNED(sg->length, sizeof(u32))) &&
> @@ -1525,7 +1525,7 @@ static int stm32_hash_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_engine_start;
>   
> -	hdev->dma_mode = stm32_hash_read(hdev, HASH_HWCFGR);
> +	hdev->dma_mode = !!stm32_hash_read(hdev, HASH_HWCFGR);
>   
>   	/* Register algos */
>   	ret = stm32_hash_register_algs(hdev);
>

BR,
Lionel

--------------P950ehpOdKtgxkdwz6IIOnzq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Linus,
</pre>
    <div class="moz-cite-prefix">
      <pre>On 12/28/22 00:03, Linus Walleij wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20221227-ux500-stm32-hash-v1-4-b637ac4cda01@linaro.org">
      <pre class="moz-quote-pre" wrap="">This flag enables/disables DMA mode and is a true/false
flag so make it a bool. Clamp the value from the
HASH_HWCFGR register to a bool as well using a double-bang
construction.

Signed-off-by: Linus Walleij <a class="moz-txt-link-rfc2396E" href="mailto:linus.walleij@linaro.org">&lt;linus.walleij@linaro.org&gt;</a>
---
 drivers/crypto/stm32/stm32-hash.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index cc0a4e413a82..5f03be121787 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -166,7 +166,7 @@ struct stm32_hash_dev {
 	struct reset_control	*rst;
 	void __iomem		*io_base;
 	phys_addr_t		phys_base;
-	u32			dma_mode;
+	bool			dma_mode;</pre>
    </blockquote>
    <pre>Till now, the value is 0 or 1.
I'm expecting in the future that the value could become greater than 1, it comes from the HW register value where the bitfield is 4 bits.
Bool can simplify for now but will be moved back to u32 once the value will be increased. I'd prefer to keep the dma_mode as u32.

</pre>
    <blockquote type="cite"
      cite="mid:20221227-ux500-stm32-hash-v1-4-b637ac4cda01@linaro.org">
      <pre class="moz-quote-pre" wrap="">
 	u32			dma_maxburst;
 
 	struct ahash_request	*req;
@@ -481,7 +481,7 @@ static int stm32_hash_hmac_dma_send(struct stm32_hash_dev *hdev)
 	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(tfm);
 	int err;
 
-	if (ctx-&gt;keylen &lt; HASH_DMA_THRESHOLD || (hdev-&gt;dma_mode == 1)) {
+	if (ctx-&gt;keylen &lt; HASH_DMA_THRESHOLD || (hdev-&gt;dma_mode)) {
 		err = stm32_hash_write_key(hdev);
 		if (stm32_hash_wait_busy(hdev))
 			return -ETIMEDOUT;
@@ -568,7 +568,7 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 
 		sg[0] = *tsg;
 		if (sg_is_last(sg)) {
-			if (hdev-&gt;dma_mode == 1) {
+			if (hdev-&gt;dma_mode) {
 				len = (ALIGN(sg-&gt;length, 16) - 16);
 
 				ncp = sg_pcopy_to_buffer(
@@ -602,7 +602,7 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 			return err;
 	}
 
-	if (hdev-&gt;dma_mode == 1) {
+	if (hdev-&gt;dma_mode) {
 		if (stm32_hash_wait_busy(hdev))
 			return -ETIMEDOUT;
 		reg = stm32_hash_read(hdev, HASH_CR);
@@ -663,7 +663,7 @@ static bool stm32_hash_dma_aligned_data(struct ahash_request *req)
 		return false;
 
 	if (sg_nents(req-&gt;src) &gt; 1) {
-		if (hdev-&gt;dma_mode == 1)
+		if (hdev-&gt;dma_mode)
 			return false;
 		for_each_sg(req-&gt;src, sg, sg_nents(req-&gt;src), i) {
 			if ((!IS_ALIGNED(sg-&gt;length, sizeof(u32))) &amp;&amp;
@@ -1525,7 +1525,7 @@ static int stm32_hash_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_engine_start;
 
-	hdev-&gt;dma_mode = stm32_hash_read(hdev, HASH_HWCFGR);
+	hdev-&gt;dma_mode = !!stm32_hash_read(hdev, HASH_HWCFGR);
 
 	/* Register algos */
 	ret = stm32_hash_register_algs(hdev);

</pre>
    </blockquote>
    <br>
    <pre>BR,
Lionel</pre>
  </body>
</html>

--------------P950ehpOdKtgxkdwz6IIOnzq--

--===============5037765362065370683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5037765362065370683==--
