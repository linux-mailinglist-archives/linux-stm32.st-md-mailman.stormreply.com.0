Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6434F5FD5CC
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 09:58:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0962C640FF;
	Thu, 13 Oct 2022 07:58:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4642AC640F3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 07:58:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29D3rH0D031428;
 Thu, 13 Oct 2022 09:58:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=selector1; bh=dJG+RQ6uq0IKjCpZc96PW+MuGK5VVyZ6Y1R1P+RRP+8=;
 b=eHL5Qe3bM96EnJUqsPrkSNjpmn5DCkatSNfSk2k7JzqkFk9LYo9FDzsPww1YEZOTnjGd
 1cFT2xlth/hjP4uhBkahaQCqbDhYgH1SS2ZVn/xA/pr8kXGOVBGa/bpIXOGg+YLKmyyt
 6Qoe/g6uDJ0vRxldNNCvubCTBszgL1L5nP71usSE5IJ8RWS8+773KWkfFYbHv0YqKLkz
 LCUoS46N/Uqq2sxrl3zdvi2G13VGdIIdw3U/YCjIbstAkXPOqatiaIO6GVCXNyr0EvNH
 ZGj1AN/hwD7OduENnKsMkRMPIH/wGFWiuguaO7C3ct/jbINHR+gACwOHYWn2RvVW79E2 Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31gq9566-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Oct 2022 09:58:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3B0A10002A;
 Thu, 13 Oct 2022 09:58:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE0AE2171C1;
 Thu, 13 Oct 2022 09:58:17 +0200 (CEST)
Received: from [10.201.21.144] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 13 Oct
 2022 09:58:16 +0200
Message-ID: <39e822ca-1df4-fd51-0e29-0dbde04539a3@foss.st.com>
Date: Thu, 13 Oct 2022 09:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Tomas Marek <tomas.marek@elrest.cz>, <mpm@selenic.com>,
 <herbert@gondor.apana.org.au>
References: <20221012160924.12226-1-tomas.marek@elrest.cz>
 <20221012160924.12226-3-tomas.marek@elrest.cz>
From: Lionel DEBIEVE <lionel.debieve@foss.st.com>
In-Reply-To: <20221012160924.12226-3-tomas.marek@elrest.cz>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_06,2022-10-12_01,2022-06-22_01
Cc: oleg.karfich@wago.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] hwrng: stm32 - fix read of the last
 word
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
Content-Type: multipart/mixed; boundary="===============0842431261586503552=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============0842431261586503552==
Content-Type: multipart/alternative;
	boundary="------------rs3bXP0RxO0F1XafOGavWFig"
Content-Language: en-US

--------------rs3bXP0RxO0F1XafOGavWFig
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/22 18:09, Tomas Marek wrote:

> The stm32_rng_read() function samples TRNG by 4 bytes until at
> least 5 bytes are free in the input buffer. The last four bytes
> are never read. For example, 60 bytes are returned in case the
> input buffer size is 64 bytes.
>
> Read until at least 4 bytes are free in the input buffer. Fill
> the buffer entirely in case the buffer size is divisible by 4.
>
> Cc: Oleg Karfich<oleg.karfich@wago.com>
> Signed-off-by: Tomas Marek<tomas.marek@elrest.cz>
> ---
>   drivers/char/hw_random/stm32-rng.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
> index 8eaacefd498b..366edda4848b 100644
> --- a/drivers/char/hw_random/stm32-rng.c
> +++ b/drivers/char/hw_random/stm32-rng.c
> @@ -44,7 +44,7 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
>   
>   	pm_runtime_get_sync((struct device *) priv->rng.priv);
>   
> -	while (max > sizeof(u32)) {
> +	while (max >= sizeof(u32)) {
>   		sr = readl_relaxed(priv->base + RNG_SR);
>   		/* Manage timeout which is based on timer and take */
>   		/* care of initial delay time when enabling rng	*/

Reviewed-by: Lionel DEBIEVE<lionel.debieve@foss.st.com>

--------------rs3bXP0RxO0F1XafOGavWFig
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
      cite="mid:20221012160924.12226-3-tomas.marek@elrest.cz">
      <pre class="moz-quote-pre" wrap="">The stm32_rng_read() function samples TRNG by 4 bytes until at
least 5 bytes are free in the input buffer. The last four bytes
are never read. For example, 60 bytes are returned in case the
input buffer size is 64 bytes.

Read until at least 4 bytes are free in the input buffer. Fill
the buffer entirely in case the buffer size is divisible by 4.

Cc: Oleg Karfich <a class="moz-txt-link-rfc2396E" href="mailto:oleg.karfich@wago.com">&lt;oleg.karfich@wago.com&gt;</a>
Signed-off-by: Tomas Marek <a class="moz-txt-link-rfc2396E" href="mailto:tomas.marek@elrest.cz">&lt;tomas.marek@elrest.cz&gt;</a>
---
 drivers/char/hw_random/stm32-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 8eaacefd498b..366edda4848b 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -44,7 +44,7 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 
 	pm_runtime_get_sync((struct device *) priv-&gt;rng.priv);
 
-	while (max &gt; sizeof(u32)) {
+	while (max &gt;= sizeof(u32)) {
 		sr = readl_relaxed(priv-&gt;base + RNG_SR);
 		/* Manage timeout which is based on timer and take */
 		/* care of initial delay time when enabling rng	*/
</pre>
    </blockquote>
    <pre>
</pre>
    <pre>Reviewed-by: Lionel DEBIEVE <a class="moz-txt-link-rfc2396E" href="mailto:lionel.debieve@foss.st.com">&lt;lionel.debieve@foss.st.com&gt;</a></pre>
  </body>
</html>

--------------rs3bXP0RxO0F1XafOGavWFig--

--===============0842431261586503552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0842431261586503552==--
