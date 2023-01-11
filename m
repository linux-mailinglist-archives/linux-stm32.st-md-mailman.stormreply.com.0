Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 687376655B3
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jan 2023 09:06:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 064DEC65E59;
	Wed, 11 Jan 2023 08:06:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C003C03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jan 2023 08:06:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30B16rkk019146; Wed, 11 Jan 2023 09:05:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=selector1; bh=7Kwx131LN8rPOaVIAvwafzl0BHtBg60TPKLFx1WXTIk=;
 b=sZZ7wXVa/6V8Y7egkufV+l8GrktFsCSqbqbonv2GzuFq/aZ407PnPtDjBCwrWLkEaoFt
 pC6eL9MOzQqyQLtoL1yt4QlCjdtCq1mZqpcDzOSa6UM3OLmAmO2muMLNkFoyw+inJ4N4
 ludzYH8GzSWKl0NFZALoJXTeeDdW/qxUbRhsupADYxhSgdbRpVvBFWEnTC6DHJOBY7kk
 x+afnub+nwqhaRS3GEaJ6nKSgQf3YTH8oMSIVia4Mi/4O2GzUy77hw0UYI0reFIy+fnH
 Vw2108F4eH8KooAaOqCUzIZhHJ7zYkzTMqYf+GOArxF0NL4+/IG+RiqZdlIVXkzlkyUf +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1k5rt0d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 09:05:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 57FF510002A;
 Wed, 11 Jan 2023 09:05:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 190BF20BA11;
 Wed, 11 Jan 2023 09:05:23 +0100 (CET)
Received: from [10.201.22.153] (10.201.22.153) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 11 Jan
 2023 09:05:22 +0100
Message-ID: <8d1a639b-7390-99ee-ef63-94b0a3362893@foss.st.com>
Date: Wed, 11 Jan 2023 09:05:02 +0100
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
References: <20221227-ux500-stm32-hash-v2-0-bc443bc44ca4@linaro.org>
 <20221227-ux500-stm32-hash-v2-5-bc443bc44ca4@linaro.org>
From: Lionel DEBIEVE <lionel.debieve@foss.st.com>
In-Reply-To: <20221227-ux500-stm32-hash-v2-5-bc443bc44ca4@linaro.org>
X-Originating-IP: [10.201.22.153]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_03,2023-01-10_03,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 5/6] crypto: stm32/hash: Support Ux500
	hash
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
Content-Type: multipart/mixed; boundary="===============4561304106314095432=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4561304106314095432==
Content-Type: multipart/alternative;
	boundary="------------AZ02u1PILMfs00mvkF78UyV3"
Content-Language: en-US

--------------AZ02u1PILMfs00mvkF78UyV3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

|Acked-by: Lionel Debieve <lionel.debieve@foss.st.com>|

On 1/10/23 20:19, Linus Walleij wrote:

> The Ux500 has a hash block which is an ancestor to the STM32
> hash block. With some minor code path additions we can
> support also this variant in the STM32 driver. Differences:
>
> - Ux500 only supports SHA1 and SHA256 (+/- MAC) so we split
>    up the algorithm registration per-algorithm and register
>    each algorithm along with its MAC variant separately.
>
> - Ux500 does not have an interrupt to indicate that hash
>    calculation is complete, so we add code paths to handle
>    polling for completion if the interrupt is missing in the
>    device tree.
>
> - Ux500 is lacking the SR status register, to check if an
>    operating is complete, we need to poll the HASH_STR_DCAL
>    bit in the HASH_STR register instead.
>
> - Ux500 had the resulting hash at address offset 0x0c and
>    8 32bit registers ahead. We account for this with a special
>    code path when reading out the hash digest.
>
> - Ux500 need a special bit set in the control register before
>    performing the final hash calculation on an empty message.
>
> - Ux500 hashes on empty messages will be performed if the
>    above bit is set, but are incorrect. For this reason we
>    just make an inline synchronous hash using a fallback
>    hash.
>
> Tested on the Ux500 Golden device with the extended tests.
>
> Signed-off-by: Linus Walleij<linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Rename flag for mdmat from has_mdma to has_mdmat
> - Fix some random whitespacing errors
> - Fix the errorpath in the synchronous fallback
> ---
>   drivers/crypto/stm32/stm32-hash.c | 231 ++++++++++++++++++++++++++++++++------
>   1 file changed, 197 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
> index d4eefd8292ff..f440e9faaf3e 100644
> --- a/drivers/crypto/stm32/stm32-hash.c
> +++ b/drivers/crypto/stm32/stm32-hash.c
> @@ -32,6 +32,7 @@
>   #define HASH_CR				0x00
>   #define HASH_DIN			0x04
>   #define HASH_STR			0x08
> +#define HASH_UX500_HREG(x)		(0x0c + ((x) * 0x04))
>   #define HASH_IMR			0x20
>   #define HASH_SR				0x24
>   #define HASH_CSR(x)			(0x0F8 + ((x) * 0x04))
> @@ -54,6 +55,10 @@
>   #define HASH_CR_ALGO_SHA224		0x40000
>   #define HASH_CR_ALGO_SHA256		0x40080
>   
> +#define HASH_CR_UX500_EMPTYMSG		BIT(20)
> +#define HASH_CR_UX500_ALGO_SHA1		BIT(7)
> +#define HASH_CR_UX500_ALGO_SHA256	0x0
> +
>   /* Interrupt */
>   #define HASH_DINIE			BIT(0)
>   #define HASH_DCIE			BIT(1)
> @@ -157,6 +162,10 @@ struct stm32_hash_algs_info {
>   struct stm32_hash_pdata {
>   	struct stm32_hash_algs_info	*algs_info;
>   	size_t				algs_info_size;
> +	bool				has_sr;
> +	bool				has_mdmat;
> +	bool				broken_emptymsg;
> +	bool				ux500;
>   };
>   
>   struct stm32_hash_dev {
> @@ -168,6 +177,7 @@ struct stm32_hash_dev {
>   	phys_addr_t		phys_base;
>   	u32			dma_mode;
>   	u32			dma_maxburst;
> +	bool			polled;
>   
>   	struct ahash_request	*req;
>   	struct crypto_engine	*engine;
> @@ -208,6 +218,11 @@ static inline int stm32_hash_wait_busy(struct stm32_hash_dev *hdev)
>   {
>   	u32 status;
>   
> +	/* The Ux500 lacks the special status register, we poll the DCAL bit instead */
> +	if (!hdev->pdata->has_sr)
> +		return readl_relaxed_poll_timeout(hdev->io_base + HASH_STR, status,
> +						  !(status & HASH_STR_DCAL), 10, 10000);
> +
>   	return readl_relaxed_poll_timeout(hdev->io_base + HASH_SR, status,
>   				   !(status & HASH_SR_BUSY), 10, 10000);
>   }
> @@ -249,7 +264,7 @@ static int stm32_hash_write_key(struct stm32_hash_dev *hdev)
>   	return 0;
>   }
>   
> -static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev)
> +static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev, int bufcnt)
>   {
>   	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(hdev->req);
>   	struct crypto_ahash *tfm = crypto_ahash_reqtfm(hdev->req);
> @@ -263,13 +278,19 @@ static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev)
>   			reg |= HASH_CR_ALGO_MD5;
>   			break;
>   		case HASH_FLAGS_SHA1:
> -			reg |= HASH_CR_ALGO_SHA1;
> +			if (hdev->pdata->ux500)
> +				reg |= HASH_CR_UX500_ALGO_SHA1;
> +			else
> +				reg |= HASH_CR_ALGO_SHA1;
>   			break;
>   		case HASH_FLAGS_SHA224:
>   			reg |= HASH_CR_ALGO_SHA224;
>   			break;
>   		case HASH_FLAGS_SHA256:
> -			reg |= HASH_CR_ALGO_SHA256;
> +			if (hdev->pdata->ux500)
> +				reg |= HASH_CR_UX500_ALGO_SHA256;
> +			else
> +				reg |= HASH_CR_ALGO_SHA256;
>   			break;
>   		default:
>   			reg |= HASH_CR_ALGO_MD5;
> @@ -284,7 +305,15 @@ static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev)
>   				reg |= HASH_CR_LKEY;
>   		}
>   
> -		stm32_hash_write(hdev, HASH_IMR, HASH_DCIE);
> +		/*
> +		 * On the Ux500 we need to set a special flag to indicate that
> +		 * the message is zero length.
> +		 */
> +		if (hdev->pdata->ux500 && bufcnt == 0)
> +			reg |= HASH_CR_UX500_EMPTYMSG;
> +
> +		if (!hdev->polled)
> +			stm32_hash_write(hdev, HASH_IMR, HASH_DCIE);
>   
>   		stm32_hash_write(hdev, HASH_CR, reg);
>   
> @@ -345,7 +374,7 @@ static int stm32_hash_xmit_cpu(struct stm32_hash_dev *hdev,
>   
>   	hdev->flags |= HASH_FLAGS_CPU;
>   
> -	stm32_hash_write_ctrl(hdev);
> +	stm32_hash_write_ctrl(hdev, length);
>   
>   	if (stm32_hash_wait_busy(hdev))
>   		return -ETIMEDOUT;
> @@ -403,6 +432,14 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
>   		bufcnt = rctx->bufcnt;
>   		rctx->bufcnt = 0;
>   		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, bufcnt, 1);
> +
> +		/* If we have an IRQ, wait for that, else poll for completion */
> +		if (hdev->polled) {
> +			if (stm32_hash_wait_busy(hdev))
> +				return -ETIMEDOUT;
> +			hdev->flags |= HASH_FLAGS_OUTPUT_READY;
> +			err = 0;
> +		}
>   	}
>   
>   	return err;
> @@ -433,11 +470,12 @@ static int stm32_hash_xmit_dma(struct stm32_hash_dev *hdev,
>   
>   	reg = stm32_hash_read(hdev, HASH_CR);
>   
> -	if (mdma)
> -		reg |= HASH_CR_MDMAT;
> -	else
> -		reg &= ~HASH_CR_MDMAT;
> -
> +	if (!hdev->pdata->has_mdmat) {
> +		if (mdma)
> +			reg |= HASH_CR_MDMAT;
> +		else
> +			reg &= ~HASH_CR_MDMAT;
> +	}
>   	reg |= HASH_CR_DMAE;
>   
>   	stm32_hash_write(hdev, HASH_CR, reg);
> @@ -558,7 +596,7 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
>   	if (rctx->nents < 0)
>   		return -EINVAL;
>   
> -	stm32_hash_write_ctrl(hdev);
> +	stm32_hash_write_ctrl(hdev, rctx->total);
>   
>   	if (hdev->flags & HASH_FLAGS_HMAC) {
>   		err = stm32_hash_hmac_dma_send(hdev);
> @@ -745,16 +783,77 @@ static int stm32_hash_final_req(struct stm32_hash_dev *hdev)
>   	else
>   		err = stm32_hash_xmit_cpu(hdev, rctx->buffer, buflen, 1);
>   
> +	/* If we have an IRQ, wait for that, else poll for completion */
> +	if (hdev->polled) {
> +		if (stm32_hash_wait_busy(hdev))
> +			return -ETIMEDOUT;
> +		hdev->flags |= HASH_FLAGS_OUTPUT_READY;
> +		/* Caller will call stm32_hash_finish_req() */
> +		err = 0;
> +	}
>   
>   	return err;
>   }
>   
> +static void stm32_hash_emptymsg_fallback(struct ahash_request *req)
> +{
> +	struct crypto_ahash *ahash = crypto_ahash_reqtfm(req);
> +	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(ahash);
> +	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
> +	struct stm32_hash_dev *hdev = rctx->hdev;
> +	struct crypto_shash *xtfm;
> +	struct shash_desc *sdesc;
> +	size_t len;
> +	int ret;
> +
> +	dev_dbg(hdev->dev, "use fallback message size 0 key size %d\n",
> +		ctx->keylen);
> +	xtfm = crypto_alloc_shash(crypto_ahash_alg_name(ahash),
> +				  0, CRYPTO_ALG_NEED_FALLBACK);
> +	if (IS_ERR(xtfm)) {
> +		dev_err(hdev->dev, "failed to allocate synchronous fallback\n");
> +		return;
> +	}
> +
> +	len = sizeof(*sdesc) + crypto_shash_descsize(xtfm);
> +	sdesc = kmalloc(len, GFP_KERNEL);
> +	if (!sdesc)
> +		goto err_hashkey_sdesc;
> +	sdesc->tfm = xtfm;
> +
> +	if (ctx->keylen) {
> +		ret = crypto_shash_setkey(xtfm, ctx->key, ctx->keylen);
> +		if (ret) {
> +			dev_err(hdev->dev, "failed to set key ret=%d\n", ret);
> +			goto err_hashkey;
> +		}
> +	}
> +
> +	ret = crypto_shash_init(sdesc);
> +	if (ret) {
> +		dev_err(hdev->dev, "shash init error ret=%d\n", ret);
> +		goto err_hashkey;
> +	}
> +
> +	ret = crypto_shash_finup(sdesc, NULL, 0, rctx->digest);
> +	if (ret)
> +		dev_err(hdev->dev, "shash finup error\n");
> +err_hashkey:
> +	kfree(sdesc);
> +err_hashkey_sdesc:
> +	crypto_free_shash(xtfm);
> +}
> +
>   static void stm32_hash_copy_hash(struct ahash_request *req)
>   {
>   	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
> +	struct stm32_hash_dev *hdev = rctx->hdev;
>   	__be32 *hash = (void *)rctx->digest;
>   	unsigned int i, hashsize;
>   
> +	if (hdev->pdata->broken_emptymsg && !req->nbytes)
> +		return stm32_hash_emptymsg_fallback(req);
> +
>   	switch (rctx->flags & HASH_FLAGS_ALGO_MASK) {
>   	case HASH_FLAGS_MD5:
>   		hashsize = MD5_DIGEST_SIZE;
> @@ -772,9 +871,14 @@ static void stm32_hash_copy_hash(struct ahash_request *req)
>   		return;
>   	}
>   
> -	for (i = 0; i < hashsize / sizeof(u32); i++)
> -		hash[i] = cpu_to_be32(stm32_hash_read(rctx->hdev,
> -						      HASH_HREG(i)));
> +	for (i = 0; i < hashsize / sizeof(u32); i++) {
> +		if (hdev->pdata->ux500)
> +			hash[i] = cpu_to_be32(stm32_hash_read(hdev,
> +					      HASH_UX500_HREG(i)));
> +		else
> +			hash[i] = cpu_to_be32(stm32_hash_read(hdev,
> +					      HASH_HREG(i)));
> +	}
>   }
>   
>   static int stm32_hash_finish(struct ahash_request *req)
> @@ -977,7 +1081,8 @@ static int stm32_hash_export(struct ahash_request *req, void *out)
>   
>   	preg = rctx->hw_context;
>   
> -	*preg++ = stm32_hash_read(hdev, HASH_IMR);
> +	if (!hdev->pdata->ux500)
> +		*preg++ = stm32_hash_read(hdev, HASH_IMR);
>   	*preg++ = stm32_hash_read(hdev, HASH_STR);
>   	*preg++ = stm32_hash_read(hdev, HASH_CR);
>   	for (i = 0; i < HASH_CSR_REGISTER_NUMBER; i++)
> @@ -1006,7 +1111,8 @@ static int stm32_hash_import(struct ahash_request *req, const void *in)
>   
>   	pm_runtime_get_sync(hdev->dev);
>   
> -	stm32_hash_write(hdev, HASH_IMR, *preg++);
> +	if (!hdev->pdata->ux500)
> +		stm32_hash_write(hdev, HASH_IMR, *preg++);
>   	stm32_hash_write(hdev, HASH_STR, *preg++);
>   	stm32_hash_write(hdev, HASH_CR, *preg);
>   	reg = *preg++ | HASH_CR_INIT;
> @@ -1125,7 +1231,7 @@ static irqreturn_t stm32_hash_irq_handler(int irq, void *dev_id)
>   	return IRQ_NONE;
>   }
>   
> -static struct ahash_alg algs_md5_sha1[] = {
> +static struct ahash_alg algs_md5[] = {
>   	{
>   		.init = stm32_hash_init,
>   		.update = stm32_hash_update,
> @@ -1177,6 +1283,9 @@ static struct ahash_alg algs_md5_sha1[] = {
>   			}
>   		}
>   	},
> +};
> +
> +static struct ahash_alg algs_sha1[] = {
>   	{
>   		.init = stm32_hash_init,
>   		.update = stm32_hash_update,
> @@ -1230,7 +1339,7 @@ static struct ahash_alg algs_md5_sha1[] = {
>   	},
>   };
>   
> -static struct ahash_alg algs_sha224_sha256[] = {
> +static struct ahash_alg algs_sha224[] = {
>   	{
>   		.init = stm32_hash_init,
>   		.update = stm32_hash_update,
> @@ -1282,6 +1391,9 @@ static struct ahash_alg algs_sha224_sha256[] = {
>   			}
>   		}
>   	},
> +};
> +
> +static struct ahash_alg algs_sha256[] = {
>   	{
>   		.init = stm32_hash_init,
>   		.update = stm32_hash_update,
> @@ -1374,35 +1486,73 @@ static int stm32_hash_unregister_algs(struct stm32_hash_dev *hdev)
>   	return 0;
>   }
>   
> +static struct stm32_hash_algs_info stm32_hash_algs_info_ux500[] = {
> +	{
> +		.algs_list	= algs_sha1,
> +		.size		= ARRAY_SIZE(algs_sha1),
> +	},
> +	{
> +		.algs_list	= algs_sha256,
> +		.size		= ARRAY_SIZE(algs_sha256),
> +	},
> +};
> +
> +static const struct stm32_hash_pdata stm32_hash_pdata_ux500 = {
> +	.algs_info	= stm32_hash_algs_info_ux500,
> +	.algs_info_size	= ARRAY_SIZE(stm32_hash_algs_info_ux500),
> +	.broken_emptymsg = true,
> +	.ux500		= true,
> +};
> +
>   static struct stm32_hash_algs_info stm32_hash_algs_info_stm32f4[] = {
>   	{
> -		.algs_list	= algs_md5_sha1,
> -		.size		= ARRAY_SIZE(algs_md5_sha1),
> +		.algs_list	= algs_md5,
> +		.size		= ARRAY_SIZE(algs_md5),
> +	},
> +	{
> +		.algs_list	= algs_sha1,
> +		.size		= ARRAY_SIZE(algs_sha1),
>   	},
>   };
>   
>   static const struct stm32_hash_pdata stm32_hash_pdata_stm32f4 = {
>   	.algs_info	= stm32_hash_algs_info_stm32f4,
>   	.algs_info_size	= ARRAY_SIZE(stm32_hash_algs_info_stm32f4),
> +	.has_sr		= true,
> +	.has_mdmat	= true,
>   };
>   
>   static struct stm32_hash_algs_info stm32_hash_algs_info_stm32f7[] = {
>   	{
> -		.algs_list	= algs_md5_sha1,
> -		.size		= ARRAY_SIZE(algs_md5_sha1),
> +		.algs_list	= algs_md5,
> +		.size		= ARRAY_SIZE(algs_md5),
> +	},
> +	{
> +		.algs_list	= algs_sha1,
> +		.size		= ARRAY_SIZE(algs_sha1),
> +	},
> +	{
> +		.algs_list	= algs_sha224,
> +		.size		= ARRAY_SIZE(algs_sha224),
>   	},
>   	{
> -		.algs_list	= algs_sha224_sha256,
> -		.size		= ARRAY_SIZE(algs_sha224_sha256),
> +		.algs_list	= algs_sha256,
> +		.size		= ARRAY_SIZE(algs_sha256),
>   	},
>   };
>   
>   static const struct stm32_hash_pdata stm32_hash_pdata_stm32f7 = {
>   	.algs_info	= stm32_hash_algs_info_stm32f7,
>   	.algs_info_size	= ARRAY_SIZE(stm32_hash_algs_info_stm32f7),
> +	.has_sr		= true,
> +	.has_mdmat	= true,
>   };
>   
>   static const struct of_device_id stm32_hash_of_match[] = {
> +	{
> +		.compatible = "stericsson,ux500-hash",
> +		.data = &stm32_hash_pdata_ux500,
> +	},
>   	{
>   		.compatible = "st,stm32f456-hash",
>   		.data = &stm32_hash_pdata_stm32f4,
> @@ -1456,16 +1606,23 @@ static int stm32_hash_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> +	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq < 0 && irq != -ENXIO)
>   		return irq;
>   
> -	ret = devm_request_threaded_irq(dev, irq, stm32_hash_irq_handler,
> -					stm32_hash_irq_thread, IRQF_ONESHOT,
> -					dev_name(dev), hdev);
> -	if (ret) {
> -		dev_err(dev, "Cannot grab IRQ\n");
> -		return ret;
> +	if (irq > 0) {
> +		ret = devm_request_threaded_irq(dev, irq,
> +						stm32_hash_irq_handler,
> +						stm32_hash_irq_thread,
> +						IRQF_ONESHOT,
> +						dev_name(dev), hdev);
> +		if (ret) {
> +			dev_err(dev, "Cannot grab IRQ\n");
> +			return ret;
> +		}
> +	} else {
> +		dev_info(dev, "No IRQ, use polling mode\n");
> +		hdev->polled = true;
>   	}
>   
>   	hdev->clk = devm_clk_get(&pdev->dev, NULL);
> @@ -1507,9 +1664,11 @@ static int stm32_hash_probe(struct platform_device *pdev)
>   	case 0:
>   		break;
>   	case -ENOENT:
> -		dev_dbg(dev, "DMA mode not available\n");
> +	case -ENODEV:
> +		dev_info(dev, "DMA mode not available\n");
>   		break;
>   	default:
> +		dev_err(dev, "DMA init error %d\n", ret);
>   		goto err_dma;
>   	}
>   
> @@ -1528,7 +1687,11 @@ static int stm32_hash_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_engine_start;
>   
> -	hdev->dma_mode = stm32_hash_read(hdev, HASH_HWCFGR);
> +	if (hdev->pdata->ux500)
> +		/* FIXME: implement DMA mode for Ux500 */
> +		hdev->dma_mode = 0;
> +	else
> +		hdev->dma_mode = stm32_hash_read(hdev, HASH_HWCFGR);
>   
>   	/* Register algos */
>   	ret = stm32_hash_register_algs(hdev);
>
--------------AZ02u1PILMfs00mvkF78UyV3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="moz-quote-pre" wrap=""><code style="padding: 0px; tab-size: 8;" class="hljs diff language-diff">Acked-by: Lionel Debieve <a class="moz-txt-link-rfc2396E" href="mailto:lionel.debieve@foss.st.com">&lt;lionel.debieve@foss.st.com&gt;</a></code></pre>
    <p></p>
    <div class="moz-cite-prefix">
      <pre>On 1/10/23 20:19, Linus Walleij wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20221227-ux500-stm32-hash-v2-5-bc443bc44ca4@linaro.org">
      <pre class="moz-quote-pre" wrap="">The Ux500 has a hash block which is an ancestor to the STM32
hash block. With some minor code path additions we can
support also this variant in the STM32 driver. Differences:

- Ux500 only supports SHA1 and SHA256 (+/- MAC) so we split
  up the algorithm registration per-algorithm and register
  each algorithm along with its MAC variant separately.

- Ux500 does not have an interrupt to indicate that hash
  calculation is complete, so we add code paths to handle
  polling for completion if the interrupt is missing in the
  device tree.

- Ux500 is lacking the SR status register, to check if an
  operating is complete, we need to poll the HASH_STR_DCAL
  bit in the HASH_STR register instead.

- Ux500 had the resulting hash at address offset 0x0c and
  8 32bit registers ahead. We account for this with a special
  code path when reading out the hash digest.

- Ux500 need a special bit set in the control register before
  performing the final hash calculation on an empty message.

- Ux500 hashes on empty messages will be performed if the
  above bit is set, but are incorrect. For this reason we
  just make an inline synchronous hash using a fallback
  hash.

Tested on the Ux500 Golden device with the extended tests.

Signed-off-by: Linus Walleij <a class="moz-txt-link-rfc2396E" href="mailto:linus.walleij@linaro.org">&lt;linus.walleij@linaro.org&gt;</a>
---
ChangeLog v1-&gt;v2:
- Rename flag for mdmat from has_mdma to has_mdmat
- Fix some random whitespacing errors
- Fix the errorpath in the synchronous fallback
---
 drivers/crypto/stm32/stm32-hash.c | 231 ++++++++++++++++++++++++++++++++------
 1 file changed, 197 insertions(+), 34 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index d4eefd8292ff..f440e9faaf3e 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -32,6 +32,7 @@
 #define HASH_CR				0x00
 #define HASH_DIN			0x04
 #define HASH_STR			0x08
+#define HASH_UX500_HREG(x)		(0x0c + ((x) * 0x04))
 #define HASH_IMR			0x20
 #define HASH_SR				0x24
 #define HASH_CSR(x)			(0x0F8 + ((x) * 0x04))
@@ -54,6 +55,10 @@
 #define HASH_CR_ALGO_SHA224		0x40000
 #define HASH_CR_ALGO_SHA256		0x40080
 
+#define HASH_CR_UX500_EMPTYMSG		BIT(20)
+#define HASH_CR_UX500_ALGO_SHA1		BIT(7)
+#define HASH_CR_UX500_ALGO_SHA256	0x0
+
 /* Interrupt */
 #define HASH_DINIE			BIT(0)
 #define HASH_DCIE			BIT(1)
@@ -157,6 +162,10 @@ struct stm32_hash_algs_info {
 struct stm32_hash_pdata {
 	struct stm32_hash_algs_info	*algs_info;
 	size_t				algs_info_size;
+	bool				has_sr;
+	bool				has_mdmat;
+	bool				broken_emptymsg;
+	bool				ux500;
 };
 
 struct stm32_hash_dev {
@@ -168,6 +177,7 @@ struct stm32_hash_dev {
 	phys_addr_t		phys_base;
 	u32			dma_mode;
 	u32			dma_maxburst;
+	bool			polled;
 
 	struct ahash_request	*req;
 	struct crypto_engine	*engine;
@@ -208,6 +218,11 @@ static inline int stm32_hash_wait_busy(struct stm32_hash_dev *hdev)
 {
 	u32 status;
 
+	/* The Ux500 lacks the special status register, we poll the DCAL bit instead */
+	if (!hdev-&gt;pdata-&gt;has_sr)
+		return readl_relaxed_poll_timeout(hdev-&gt;io_base + HASH_STR, status,
+						  !(status &amp; HASH_STR_DCAL), 10, 10000);
+
 	return readl_relaxed_poll_timeout(hdev-&gt;io_base + HASH_SR, status,
 				   !(status &amp; HASH_SR_BUSY), 10, 10000);
 }
@@ -249,7 +264,7 @@ static int stm32_hash_write_key(struct stm32_hash_dev *hdev)
 	return 0;
 }
 
-static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev)
+static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev, int bufcnt)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(hdev-&gt;req);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(hdev-&gt;req);
@@ -263,13 +278,19 @@ static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev)
 			reg |= HASH_CR_ALGO_MD5;
 			break;
 		case HASH_FLAGS_SHA1:
-			reg |= HASH_CR_ALGO_SHA1;
+			if (hdev-&gt;pdata-&gt;ux500)
+				reg |= HASH_CR_UX500_ALGO_SHA1;
+			else
+				reg |= HASH_CR_ALGO_SHA1;
 			break;
 		case HASH_FLAGS_SHA224:
 			reg |= HASH_CR_ALGO_SHA224;
 			break;
 		case HASH_FLAGS_SHA256:
-			reg |= HASH_CR_ALGO_SHA256;
+			if (hdev-&gt;pdata-&gt;ux500)
+				reg |= HASH_CR_UX500_ALGO_SHA256;
+			else
+				reg |= HASH_CR_ALGO_SHA256;
 			break;
 		default:
 			reg |= HASH_CR_ALGO_MD5;
@@ -284,7 +305,15 @@ static void stm32_hash_write_ctrl(struct stm32_hash_dev *hdev)
 				reg |= HASH_CR_LKEY;
 		}
 
-		stm32_hash_write(hdev, HASH_IMR, HASH_DCIE);
+		/*
+		 * On the Ux500 we need to set a special flag to indicate that
+		 * the message is zero length.
+		 */
+		if (hdev-&gt;pdata-&gt;ux500 &amp;&amp; bufcnt == 0)
+			reg |= HASH_CR_UX500_EMPTYMSG;
+
+		if (!hdev-&gt;polled)
+			stm32_hash_write(hdev, HASH_IMR, HASH_DCIE);
 
 		stm32_hash_write(hdev, HASH_CR, reg);
 
@@ -345,7 +374,7 @@ static int stm32_hash_xmit_cpu(struct stm32_hash_dev *hdev,
 
 	hdev-&gt;flags |= HASH_FLAGS_CPU;
 
-	stm32_hash_write_ctrl(hdev);
+	stm32_hash_write_ctrl(hdev, length);
 
 	if (stm32_hash_wait_busy(hdev))
 		return -ETIMEDOUT;
@@ -403,6 +432,14 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 		bufcnt = rctx-&gt;bufcnt;
 		rctx-&gt;bufcnt = 0;
 		err = stm32_hash_xmit_cpu(hdev, rctx-&gt;buffer, bufcnt, 1);
+
+		/* If we have an IRQ, wait for that, else poll for completion */
+		if (hdev-&gt;polled) {
+			if (stm32_hash_wait_busy(hdev))
+				return -ETIMEDOUT;
+			hdev-&gt;flags |= HASH_FLAGS_OUTPUT_READY;
+			err = 0;
+		}
 	}
 
 	return err;
@@ -433,11 +470,12 @@ static int stm32_hash_xmit_dma(struct stm32_hash_dev *hdev,
 
 	reg = stm32_hash_read(hdev, HASH_CR);
 
-	if (mdma)
-		reg |= HASH_CR_MDMAT;
-	else
-		reg &amp;= ~HASH_CR_MDMAT;
-
+	if (!hdev-&gt;pdata-&gt;has_mdmat) {
+		if (mdma)
+			reg |= HASH_CR_MDMAT;
+		else
+			reg &amp;= ~HASH_CR_MDMAT;
+	}
 	reg |= HASH_CR_DMAE;
 
 	stm32_hash_write(hdev, HASH_CR, reg);
@@ -558,7 +596,7 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 	if (rctx-&gt;nents &lt; 0)
 		return -EINVAL;
 
-	stm32_hash_write_ctrl(hdev);
+	stm32_hash_write_ctrl(hdev, rctx-&gt;total);
 
 	if (hdev-&gt;flags &amp; HASH_FLAGS_HMAC) {
 		err = stm32_hash_hmac_dma_send(hdev);
@@ -745,16 +783,77 @@ static int stm32_hash_final_req(struct stm32_hash_dev *hdev)
 	else
 		err = stm32_hash_xmit_cpu(hdev, rctx-&gt;buffer, buflen, 1);
 
+	/* If we have an IRQ, wait for that, else poll for completion */
+	if (hdev-&gt;polled) {
+		if (stm32_hash_wait_busy(hdev))
+			return -ETIMEDOUT;
+		hdev-&gt;flags |= HASH_FLAGS_OUTPUT_READY;
+		/* Caller will call stm32_hash_finish_req() */
+		err = 0;
+	}
 
 	return err;
 }
 
+static void stm32_hash_emptymsg_fallback(struct ahash_request *req)
+{
+	struct crypto_ahash *ahash = crypto_ahash_reqtfm(req);
+	struct stm32_hash_ctx *ctx = crypto_ahash_ctx(ahash);
+	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
+	struct stm32_hash_dev *hdev = rctx-&gt;hdev;
+	struct crypto_shash *xtfm;
+	struct shash_desc *sdesc;
+	size_t len;
+	int ret;
+
+	dev_dbg(hdev-&gt;dev, "use fallback message size 0 key size %d\n",
+		ctx-&gt;keylen);
+	xtfm = crypto_alloc_shash(crypto_ahash_alg_name(ahash),
+				  0, CRYPTO_ALG_NEED_FALLBACK);
+	if (IS_ERR(xtfm)) {
+		dev_err(hdev-&gt;dev, "failed to allocate synchronous fallback\n");
+		return;
+	}
+
+	len = sizeof(*sdesc) + crypto_shash_descsize(xtfm);
+	sdesc = kmalloc(len, GFP_KERNEL);
+	if (!sdesc)
+		goto err_hashkey_sdesc;
+	sdesc-&gt;tfm = xtfm;
+
+	if (ctx-&gt;keylen) {
+		ret = crypto_shash_setkey(xtfm, ctx-&gt;key, ctx-&gt;keylen);
+		if (ret) {
+			dev_err(hdev-&gt;dev, "failed to set key ret=%d\n", ret);
+			goto err_hashkey;
+		}
+	}
+
+	ret = crypto_shash_init(sdesc);
+	if (ret) {
+		dev_err(hdev-&gt;dev, "shash init error ret=%d\n", ret);
+		goto err_hashkey;
+	}
+
+	ret = crypto_shash_finup(sdesc, NULL, 0, rctx-&gt;digest);
+	if (ret)
+		dev_err(hdev-&gt;dev, "shash finup error\n");
+err_hashkey:
+	kfree(sdesc);
+err_hashkey_sdesc:
+	crypto_free_shash(xtfm);
+}
+
 static void stm32_hash_copy_hash(struct ahash_request *req)
 {
 	struct stm32_hash_request_ctx *rctx = ahash_request_ctx(req);
+	struct stm32_hash_dev *hdev = rctx-&gt;hdev;
 	__be32 *hash = (void *)rctx-&gt;digest;
 	unsigned int i, hashsize;
 
+	if (hdev-&gt;pdata-&gt;broken_emptymsg &amp;&amp; !req-&gt;nbytes)
+		return stm32_hash_emptymsg_fallback(req);
+
 	switch (rctx-&gt;flags &amp; HASH_FLAGS_ALGO_MASK) {
 	case HASH_FLAGS_MD5:
 		hashsize = MD5_DIGEST_SIZE;
@@ -772,9 +871,14 @@ static void stm32_hash_copy_hash(struct ahash_request *req)
 		return;
 	}
 
-	for (i = 0; i &lt; hashsize / sizeof(u32); i++)
-		hash[i] = cpu_to_be32(stm32_hash_read(rctx-&gt;hdev,
-						      HASH_HREG(i)));
+	for (i = 0; i &lt; hashsize / sizeof(u32); i++) {
+		if (hdev-&gt;pdata-&gt;ux500)
+			hash[i] = cpu_to_be32(stm32_hash_read(hdev,
+					      HASH_UX500_HREG(i)));
+		else
+			hash[i] = cpu_to_be32(stm32_hash_read(hdev,
+					      HASH_HREG(i)));
+	}
 }
 
 static int stm32_hash_finish(struct ahash_request *req)
@@ -977,7 +1081,8 @@ static int stm32_hash_export(struct ahash_request *req, void *out)
 
 	preg = rctx-&gt;hw_context;
 
-	*preg++ = stm32_hash_read(hdev, HASH_IMR);
+	if (!hdev-&gt;pdata-&gt;ux500)
+		*preg++ = stm32_hash_read(hdev, HASH_IMR);
 	*preg++ = stm32_hash_read(hdev, HASH_STR);
 	*preg++ = stm32_hash_read(hdev, HASH_CR);
 	for (i = 0; i &lt; HASH_CSR_REGISTER_NUMBER; i++)
@@ -1006,7 +1111,8 @@ static int stm32_hash_import(struct ahash_request *req, const void *in)
 
 	pm_runtime_get_sync(hdev-&gt;dev);
 
-	stm32_hash_write(hdev, HASH_IMR, *preg++);
+	if (!hdev-&gt;pdata-&gt;ux500)
+		stm32_hash_write(hdev, HASH_IMR, *preg++);
 	stm32_hash_write(hdev, HASH_STR, *preg++);
 	stm32_hash_write(hdev, HASH_CR, *preg);
 	reg = *preg++ | HASH_CR_INIT;
@@ -1125,7 +1231,7 @@ static irqreturn_t stm32_hash_irq_handler(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static struct ahash_alg algs_md5_sha1[] = {
+static struct ahash_alg algs_md5[] = {
 	{
 		.init = stm32_hash_init,
 		.update = stm32_hash_update,
@@ -1177,6 +1283,9 @@ static struct ahash_alg algs_md5_sha1[] = {
 			}
 		}
 	},
+};
+
+static struct ahash_alg algs_sha1[] = {
 	{
 		.init = stm32_hash_init,
 		.update = stm32_hash_update,
@@ -1230,7 +1339,7 @@ static struct ahash_alg algs_md5_sha1[] = {
 	},
 };
 
-static struct ahash_alg algs_sha224_sha256[] = {
+static struct ahash_alg algs_sha224[] = {
 	{
 		.init = stm32_hash_init,
 		.update = stm32_hash_update,
@@ -1282,6 +1391,9 @@ static struct ahash_alg algs_sha224_sha256[] = {
 			}
 		}
 	},
+};
+
+static struct ahash_alg algs_sha256[] = {
 	{
 		.init = stm32_hash_init,
 		.update = stm32_hash_update,
@@ -1374,35 +1486,73 @@ static int stm32_hash_unregister_algs(struct stm32_hash_dev *hdev)
 	return 0;
 }
 
+static struct stm32_hash_algs_info stm32_hash_algs_info_ux500[] = {
+	{
+		.algs_list	= algs_sha1,
+		.size		= ARRAY_SIZE(algs_sha1),
+	},
+	{
+		.algs_list	= algs_sha256,
+		.size		= ARRAY_SIZE(algs_sha256),
+	},
+};
+
+static const struct stm32_hash_pdata stm32_hash_pdata_ux500 = {
+	.algs_info	= stm32_hash_algs_info_ux500,
+	.algs_info_size	= ARRAY_SIZE(stm32_hash_algs_info_ux500),
+	.broken_emptymsg = true,
+	.ux500		= true,
+};
+
 static struct stm32_hash_algs_info stm32_hash_algs_info_stm32f4[] = {
 	{
-		.algs_list	= algs_md5_sha1,
-		.size		= ARRAY_SIZE(algs_md5_sha1),
+		.algs_list	= algs_md5,
+		.size		= ARRAY_SIZE(algs_md5),
+	},
+	{
+		.algs_list	= algs_sha1,
+		.size		= ARRAY_SIZE(algs_sha1),
 	},
 };
 
 static const struct stm32_hash_pdata stm32_hash_pdata_stm32f4 = {
 	.algs_info	= stm32_hash_algs_info_stm32f4,
 	.algs_info_size	= ARRAY_SIZE(stm32_hash_algs_info_stm32f4),
+	.has_sr		= true,
+	.has_mdmat	= true,
 };
 
 static struct stm32_hash_algs_info stm32_hash_algs_info_stm32f7[] = {
 	{
-		.algs_list	= algs_md5_sha1,
-		.size		= ARRAY_SIZE(algs_md5_sha1),
+		.algs_list	= algs_md5,
+		.size		= ARRAY_SIZE(algs_md5),
+	},
+	{
+		.algs_list	= algs_sha1,
+		.size		= ARRAY_SIZE(algs_sha1),
+	},
+	{
+		.algs_list	= algs_sha224,
+		.size		= ARRAY_SIZE(algs_sha224),
 	},
 	{
-		.algs_list	= algs_sha224_sha256,
-		.size		= ARRAY_SIZE(algs_sha224_sha256),
+		.algs_list	= algs_sha256,
+		.size		= ARRAY_SIZE(algs_sha256),
 	},
 };
 
 static const struct stm32_hash_pdata stm32_hash_pdata_stm32f7 = {
 	.algs_info	= stm32_hash_algs_info_stm32f7,
 	.algs_info_size	= ARRAY_SIZE(stm32_hash_algs_info_stm32f7),
+	.has_sr		= true,
+	.has_mdmat	= true,
 };
 
 static const struct of_device_id stm32_hash_of_match[] = {
+	{
+		.compatible = "stericsson,ux500-hash",
+		.data = &amp;stm32_hash_pdata_ux500,
+	},
 	{
 		.compatible = "st,stm32f456-hash",
 		.data = &amp;stm32_hash_pdata_stm32f4,
@@ -1456,16 +1606,23 @@ static int stm32_hash_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq &lt; 0)
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq &lt; 0 &amp;&amp; irq != -ENXIO)
 		return irq;
 
-	ret = devm_request_threaded_irq(dev, irq, stm32_hash_irq_handler,
-					stm32_hash_irq_thread, IRQF_ONESHOT,
-					dev_name(dev), hdev);
-	if (ret) {
-		dev_err(dev, "Cannot grab IRQ\n");
-		return ret;
+	if (irq &gt; 0) {
+		ret = devm_request_threaded_irq(dev, irq,
+						stm32_hash_irq_handler,
+						stm32_hash_irq_thread,
+						IRQF_ONESHOT,
+						dev_name(dev), hdev);
+		if (ret) {
+			dev_err(dev, "Cannot grab IRQ\n");
+			return ret;
+		}
+	} else {
+		dev_info(dev, "No IRQ, use polling mode\n");
+		hdev-&gt;polled = true;
 	}
 
 	hdev-&gt;clk = devm_clk_get(&amp;pdev-&gt;dev, NULL);
@@ -1507,9 +1664,11 @@ static int stm32_hash_probe(struct platform_device *pdev)
 	case 0:
 		break;
 	case -ENOENT:
-		dev_dbg(dev, "DMA mode not available\n");
+	case -ENODEV:
+		dev_info(dev, "DMA mode not available\n");
 		break;
 	default:
+		dev_err(dev, "DMA init error %d\n", ret);
 		goto err_dma;
 	}
 
@@ -1528,7 +1687,11 @@ static int stm32_hash_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_engine_start;
 
-	hdev-&gt;dma_mode = stm32_hash_read(hdev, HASH_HWCFGR);
+	if (hdev-&gt;pdata-&gt;ux500)
+		/* FIXME: implement DMA mode for Ux500 */
+		hdev-&gt;dma_mode = 0;
+	else
+		hdev-&gt;dma_mode = stm32_hash_read(hdev, HASH_HWCFGR);
 
 	/* Register algos */
 	ret = stm32_hash_register_algs(hdev);

</pre>
    </blockquote>
  </body>
</html>

--------------AZ02u1PILMfs00mvkF78UyV3--

--===============4561304106314095432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4561304106314095432==--
