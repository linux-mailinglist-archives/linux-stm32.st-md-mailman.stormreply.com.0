Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D92CC5FD5BF
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 09:51:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B76EC640FF;
	Thu, 13 Oct 2022 07:51:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55FAFC03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 07:51:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29D3rHrP019805;
 Thu, 13 Oct 2022 09:51:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=selector1; bh=7yj6ItUE3T6a3jDsOqWMDbrKDiVWaMjkozeUvgESAPE=;
 b=QFgs8TGRfDBMnj0+nNf1OTbleymud6LefErDMJ9TC0piuhz3ogdZ0cq70mSnTAn3d4k5
 74mt7Ivh0rz6EIJ6OThStFx0iN8EtWTcp9IxWijGOPklGHuAR61oEYPmq7VDkAM9nY+E
 bVePjzaBSDU9lHz08GlJx19rlSOeLo9vLxr78fJXVhavE8e0FwdrK1wT39kWVT5ivxfT
 VBMUvhFN465+Dp7zBFFthxW3K6esOvss+QnVzBiHjgN9SNmI/RBxtBUdCCJj0Jy5/K4L
 5F7NAHFfAjWsRQ4DPK5i5R2V/XvJ7eJUT9NykRWtuu1gCZKspUgMKHuKSUNpevIpZ7Xd QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k5v4mxt9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 09:51:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F66410002A;
 Thu, 13 Oct 2022 09:51:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 092FB216EDA;
 Thu, 13 Oct 2022 09:51:12 +0200 (CEST)
Received: from [10.201.21.144] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 13 Oct
 2022 09:51:11 +0200
Message-ID: <6a54c6fa-2b3e-d833-4fd0-9ad564f5dc50@foss.st.com>
Date: Thu, 13 Oct 2022 09:50:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Tomas Marek <tomas.marek@elrest.cz>, <mpm@selenic.com>,
 <herbert@gondor.apana.org.au>
References: <20221012160924.12226-1-tomas.marek@elrest.cz>
 <20221012160924.12226-2-tomas.marek@elrest.cz>
From: Lionel DEBIEVE <lionel.debieve@foss.st.com>
In-Reply-To: <20221012160924.12226-2-tomas.marek@elrest.cz>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_06,2022-10-12_01,2022-06-22_01
Cc: oleg.karfich@wago.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] hwrng: stm32 - fix number of returned
 bytes on read
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
Content-Type: multipart/mixed; boundary="===============1968786857239384252=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1968786857239384252==
Content-Type: multipart/alternative;
	boundary="------------n8YQiEYQjFyJgGr2nsm0tyI6"
Content-Language: en-US

--------------n8YQiEYQjFyJgGr2nsm0tyI6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/22 18:09, Tomas Marek wrote:

> The stm32_rng_read() function uses `retval` variable as a counter of
> generated random bytes. However, the same variable is used to store
> a result of the polling function in case the driver is waiting until
> the TRNG is ready. The TRNG generates random numbers by 16B. One
> loop read 4B. So, the function calls the polling every 16B, i.e.
> every 4th loop. The `retval` counter is reset on poll call and only
> number of bytes read after the last poll call is returned to the
> caller. The remaining sampled random bytes (for example 48 out of
> 64 in case 64 bytes are read) are not used.
>
> Use different variable to store the polling function result and
> do not overwrite `retval` counter.
>
> Cc: Oleg Karfich<oleg.karfich@wago.com>
> Signed-off-by: Tomas Marek<tomas.marek@elrest.cz>
> ---
>   drivers/char/hw_random/stm32-rng.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
> index bc22178f83e8..8eaacefd498b 100644
> --- a/drivers/char/hw_random/stm32-rng.c
> +++ b/drivers/char/hw_random/stm32-rng.c
> @@ -49,11 +49,13 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
>   		/* Manage timeout which is based on timer and take */
>   		/* care of initial delay time when enabling rng	*/
>   		if (!sr && wait) {
> -			retval = readl_relaxed_poll_timeout_atomic(priv->base
> +			int ret;
> +
> +			ret = readl_relaxed_poll_timeout_atomic(priv->base
>   								   + RNG_SR,
>   								   sr, sr,
>   								   10, 50000);
> -			if (retval)
> +			if (ret)
>   				dev_err((struct device *)priv->rng.priv,
>   					"%s: timeout %x!\n", __func__, sr);
>   		}

Reviewed-by: Lionel DEBIEVE<lionel.debieve@foss.st.com>

--------------n8YQiEYQjFyJgGr2nsm0tyI6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 10/12/22 18:09, Tomas Marek wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20221012160924.12226-2-tomas.marek@elrest.cz">
      <pre class="moz-quote-pre" wrap="">The stm32_rng_read() function uses `retval` variable as a counter of
generated random bytes. However, the same variable is used to store
a result of the polling function in case the driver is waiting until
the TRNG is ready. The TRNG generates random numbers by 16B. One
loop read 4B. So, the function calls the polling every 16B, i.e.
every 4th loop. The `retval` counter is reset on poll call and only
number of bytes read after the last poll call is returned to the
caller. The remaining sampled random bytes (for example 48 out of
64 in case 64 bytes are read) are not used.

Use different variable to store the polling function result and
do not overwrite `retval` counter.

Cc: Oleg Karfich <a class="moz-txt-link-rfc2396E" href="mailto:oleg.karfich@wago.com">&lt;oleg.karfich@wago.com&gt;</a>
Signed-off-by: Tomas Marek <a class="moz-txt-link-rfc2396E" href="mailto:tomas.marek@elrest.cz">&lt;tomas.marek@elrest.cz&gt;</a>
---
 drivers/char/hw_random/stm32-rng.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index bc22178f83e8..8eaacefd498b 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -49,11 +49,13 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 		/* Manage timeout which is based on timer and take */
 		/* care of initial delay time when enabling rng	*/
 		if (!sr &amp;&amp; wait) {
-			retval = readl_relaxed_poll_timeout_atomic(priv-&gt;base
+			int ret;
+
+			ret = readl_relaxed_poll_timeout_atomic(priv-&gt;base
 								   + RNG_SR,
 								   sr, sr,
 								   10, 50000);
-			if (retval)
+			if (ret)
 				dev_err((struct device *)priv-&gt;rng.priv,
 					"%s: timeout %x!\n", __func__, sr);
 		}
</pre>
    </blockquote>
    <pre>Reviewed-by: Lionel DEBIEVE <a class="moz-txt-link-rfc2396E" href="mailto:lionel.debieve@foss.st.com">&lt;lionel.debieve@foss.st.com&gt;</a>
</pre>
  </body>
</html>

--------------n8YQiEYQjFyJgGr2nsm0tyI6--

--===============1968786857239384252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1968786857239384252==--
