Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7960F104
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Oct 2022 09:15:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA3A7C04003;
	Thu, 27 Oct 2022 07:15:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D676EC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 07:15:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29R5289M015107;
 Thu, 27 Oct 2022 09:13:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=selector1; bh=zxPkaKKToBpHn/RAzppwJGspi2GAjaJWxY6M2eZCCjc=;
 b=q1zjONwwWSD82R8ifuhodcsuBqHgcJhnmuVv4GxBQySN24J+36BKoNTOnNO/jXPPuKCy
 mg47lgOf+qZzI2J8+WkIBoo4pzwBGm338LYxmFQbtQJBuEQX2Y6c6boI7FjYJu8Zy/hi
 V4cnGTkq9SQD7ttm3Mam6OTAZmXjNBev+mETDoCNXv6CKvJ6X2VvEpvjfyLSjPGdoLgn
 Eo8i7+v8z7HY/b1esfZfnQaZb0uQw/c5ewzraSoJhjDQZiKgdRAtYvnqB0q+ZZFNOOCE
 rEj15ixllOtrbEBqBvBhtpi+UNbnXXpUAPq56s6h/Y2wgsywxkg2zRclV41E7I4zhjpG KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kfajf3fev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 09:13:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 463EC100038;
 Thu, 27 Oct 2022 09:13:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3C7BD2122EF;
 Thu, 27 Oct 2022 09:13:36 +0200 (CEST)
Received: from [10.252.13.200] (10.252.13.200) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 27 Oct
 2022 09:13:35 +0200
Message-ID: <6f4ad7b8-28f2-36fa-bc54-d80faa63b091@foss.st.com>
Date: Thu, 27 Oct 2022 09:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Marek Vasut <marex@denx.de>, <linux-clk@vger.kernel.org>
References: <20221023164607.556118-1-marex@denx.de>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20221023164607.556118-1-marex@denx.de>
X-Originating-IP: [10.252.13.200]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_03,2022-10-26_01,2022-06-22_01
Cc: kernel test robot <lkp@intel.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Johann Neuhauser <jneuhauser@dh-electronics.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH] clk: stm32mp1: Staticize ethrx_src
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
Content-Type: multipart/mixed; boundary="===============3141223307740413356=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3141223307740413356==
Content-Type: multipart/alternative;
	boundary="------------tpkHY3UQPvV6CGWvnh60ETcv"
Content-Language: en-US

--------------tpkHY3UQPvV6CGWvnh60ETcv
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

On 10/23/22 18:46, Marek Vasut wrote:
> Make ethrx_src array static, this is local to clk-stm32mp1.c
>
> Fixes: e9ed1ef18a37a ("clk: stm32mp1: Add parent_data to ETHRX clock")
> Reported-by: kernel test robot<lkp@intel.com>
> Signed-off-by: Marek Vasut<marex@denx.de>
> ---
> Cc: Alexandre Torgue<alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier<christophe.roullier@foss.st.com>
> Cc: Gabriel Fernandez<gabriel.fernandez@foss.st.com>
> Cc: Johann Neuhauser<jneuhauser@dh-electronics.com>
> Cc: Patrice Chotard<patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay<patrick.delaunay@foss.st.com>
> Cc: Stephen Boyd<sboyd@kernel.org>
> Cc:linux-clk@vger.kernel.org
> Cc:linux-stm32@st-md-mailman.stormreply.com
> ---
>   drivers/clk/clk-stm32mp1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
> index 7ad2e6203baef..01e5a466897f8 100644
> --- a/drivers/clk/clk-stm32mp1.c
> +++ b/drivers/clk/clk-stm32mp1.c
> @@ -155,7 +155,7 @@ static const char * const eth_src[] = {
>   	"pll4_p", "pll3_q"
>   };
>   
> -const struct clk_parent_data ethrx_src[] = {
> +static const struct clk_parent_data ethrx_src[] = {
>   	{ .name = "ethck_k", .fw_name = "ETH_RX_CLK/ETH_REF_CLK" },
>   };
>   
--------------tpkHY3UQPvV6CGWvnh60ETcv
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><span data-markjs="true" class="mark5z2zoqnl4" data-ogac=""
        data-ogab="" data-ogsc="" data-ogsb="" style="border: 0px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-variant-numeric: inherit;
        font-variant-east-asian: inherit; font-weight: 400;
        font-stretch: inherit; font-size: 14.6667px; line-height:
        inherit; font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web
        (West European)&quot;, &quot;Segoe UI&quot;, -apple-system,
        BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;,
        sans-serif; margin: 0px; padding: 0px; vertical-align: baseline;
        color: rgb(36, 36, 36); letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial;">Acked-by</span><span
        style="color: rgb(36, 36, 36); font-family: &quot;Segoe
        UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe
        UI&quot;, -apple-system, BlinkMacSystemFont, Roboto,
        &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">: Gabriel
        Fernandez <a class="moz-txt-link-rfc2396E" href="mailto:gabriel.fernandez@foss.st.com">&lt;gabriel.fernandez@foss.st.com&gt;</a></span></p>
    <div class="moz-cite-prefix">On 10/23/22 18:46, Marek Vasut wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20221023164607.556118-1-marex@denx.de">
      <pre class="moz-quote-pre" wrap="">Make ethrx_src array static, this is local to clk-stm32mp1.c

Fixes: e9ed1ef18a37a ("clk: stm32mp1: Add parent_data to ETHRX clock")
Reported-by: kernel test robot <a class="moz-txt-link-rfc2396E" href="mailto:lkp@intel.com">&lt;lkp@intel.com&gt;</a>
Signed-off-by: Marek Vasut <a class="moz-txt-link-rfc2396E" href="mailto:marex@denx.de">&lt;marex@denx.de&gt;</a>
---
Cc: Alexandre Torgue <a class="moz-txt-link-rfc2396E" href="mailto:alexandre.torgue@foss.st.com">&lt;alexandre.torgue@foss.st.com&gt;</a>
Cc: Christophe Roullier <a class="moz-txt-link-rfc2396E" href="mailto:christophe.roullier@foss.st.com">&lt;christophe.roullier@foss.st.com&gt;</a>
Cc: Gabriel Fernandez <a class="moz-txt-link-rfc2396E" href="mailto:gabriel.fernandez@foss.st.com">&lt;gabriel.fernandez@foss.st.com&gt;</a>
Cc: Johann Neuhauser <a class="moz-txt-link-rfc2396E" href="mailto:jneuhauser@dh-electronics.com">&lt;jneuhauser@dh-electronics.com&gt;</a>
Cc: Patrice Chotard <a class="moz-txt-link-rfc2396E" href="mailto:patrice.chotard@foss.st.com">&lt;patrice.chotard@foss.st.com&gt;</a>
Cc: Patrick Delaunay <a class="moz-txt-link-rfc2396E" href="mailto:patrick.delaunay@foss.st.com">&lt;patrick.delaunay@foss.st.com&gt;</a>
Cc: Stephen Boyd <a class="moz-txt-link-rfc2396E" href="mailto:sboyd@kernel.org">&lt;sboyd@kernel.org&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:linux-clk@vger.kernel.org">linux-clk@vger.kernel.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:linux-stm32@st-md-mailman.stormreply.com">linux-stm32@st-md-mailman.stormreply.com</a>
---
 drivers/clk/clk-stm32mp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index 7ad2e6203baef..01e5a466897f8 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -155,7 +155,7 @@ static const char * const eth_src[] = {
 	"pll4_p", "pll3_q"
 };
 
-const struct clk_parent_data ethrx_src[] = {
+static const struct clk_parent_data ethrx_src[] = {
 	{ .name = "ethck_k", .fw_name = "ETH_RX_CLK/ETH_REF_CLK" },
 };
 
</pre>
    </blockquote>
  </body>
</html>

--------------tpkHY3UQPvV6CGWvnh60ETcv--

--===============3141223307740413356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3141223307740413356==--
