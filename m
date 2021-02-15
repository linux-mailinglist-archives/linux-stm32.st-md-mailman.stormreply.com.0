Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50231BAB0
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Feb 2021 15:04:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A6F7C5718D;
	Mon, 15 Feb 2021 14:04:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85FF8C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Feb 2021 13:27:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11FDHBpM013854; Mon, 15 Feb 2021 14:26:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type; s=selector1;
 bh=B7qUA4tQmN90mh7eeSbFepOHyuWwKMZu22IkZH9LGYw=;
 b=hTfBGppI8snnj9V9k675+reKzlg9eLkqWvsdlp67ruMW/YTNh4AQae7LBTK7Vo7pNe5R
 vSUmb9khI14zQUDKSXwYDvbkTLp/3SwmThHvqUCNIAUsPtr/7x1WRmjYjCnOmObgqgNg
 FH6t60YePXMHxU1syuvWrRQe69m8wdhBk9d3DEBDhPd1FYhg3pHW5Lxm7R/45z1FA7jh
 69MYeq2KFplkSD9343T97dH2iQvqC236PIR4vGu4QTo0l6Dk57sxdR+LT5EqqOEpM6Wy
 Wfy9H/JcJihuIMspSEYffTNW5vKdQS719oaBoOsOAmcX+GcKlAWkgLDy46tVC00I9UeQ LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p6hpanx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 14:26:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C61710002A;
 Mon, 15 Feb 2021 14:26:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 51F0023BD24;
 Mon, 15 Feb 2021 14:26:43 +0100 (CET)
Received: from [10.211.12.240] (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 15 Feb
 2021 14:26:42 +0100
To: <angkery@163.com>, <linus.walleij@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE-SCND-02
 <alexandre.torgue@foss.st.com>, <maz@kernel.org>, Etienne CARRIERE-SCND-01
 <etienne.carriere@foss.st.com>,
 <geert+renesas@glider.be>, <matti.vaittinen@fi.rohmeurope.com>,
 <marex@denx.de>
From: foss <fabien.dessenne@foss.st.com>
Message-ID: <4a576fb8-682e-d1af-777d-436f9bc53794@foss.st.com>
Date: Mon, 15 Feb 2021 14:26:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-15_08:2021-02-12,
 2021-02-15 signatures=0
X-Mailman-Approved-At: Mon, 15 Feb 2021 14:04:24 +0000
Cc: yangjunlin@yulong.com, linux-gpio@vger.kernel.org,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: add missing of_node_put
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
Content-Type: multipart/mixed; boundary="===============1403264337607837949=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1403264337607837949==
Content-Type: multipart/alternative;
	boundary="------------A944B0793B100D01FFDCAC6B"
Content-Language: en-US

--------------A944B0793B100D01FFDCAC6B
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Junlin


Thank you for the patch!


Fabien


>
> From: Junlin Yang<yangjunlin@yulong.com>
>
> Fix OF node leaks by calling of_node_put in for_each_available_child_of_node when the cycle returns.
>
> Generated by: scripts/coccinelle/iterators/for_each_child.cocci
>
> Signed-off-by: Junlin Yang<yangjunlin@yulong.com>

Acked-by: Fabien Dessenne <fabien.dessenne@foss.st.com>


> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 7d9bded..da72e3e 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1542,8 +1542,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		if (of_property_read_bool(child, "gpio-controller")) {
>   			bank->rstc = of_reset_control_get_exclusive(child,
>   								    NULL);
> -			if (PTR_ERR(bank->rstc) == -EPROBE_DEFER)
> +			if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
> +				of_node_put(child);
>   				return -EPROBE_DEFER;
> +			}
>   
>   			bank->clk = of_clk_get_by_name(child, NULL);
>   			if (IS_ERR(bank->clk)) {
> @@ -1551,6 +1553,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   					dev_err(dev,
>   						"failed to get clk (%ld)\n",
>   						PTR_ERR(bank->clk));
> +				of_node_put(child);
>   				return PTR_ERR(bank->clk);
>   			}
>   			i++;
> --
> 1.9.1
>

--------------A944B0793B100D01FFDCAC6B
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Junlin<br>
    </p>
    <p><br>
    </p>
    <p>Thank you for the patch!</p>
    <p><br>
    </p>
    <p>Fabien<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:AM9PR10MB4119423F89C44A1F840A32809A889@AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM">
      <div class="moz-text-plain" wrap="true" style="font-family:
        -moz-fixed; font-size: 12px;" lang="x-western">
        <pre class="moz-quote-pre" wrap="">

From: Junlin Yang <a class="moz-txt-link-rfc2396E" href="mailto:yangjunlin@yulong.com">&lt;yangjunlin@yulong.com&gt;</a>

Fix OF node leaks by calling of_node_put in for_each_available_child_of_node when the cycle returns.

Generated by: scripts/coccinelle/iterators/for_each_child.cocci

Signed-off-by: Junlin Yang <a class="moz-txt-link-rfc2396E" href="mailto:yangjunlin@yulong.com">&lt;yangjunlin@yulong.com&gt;</a></pre>
      </div>
    </blockquote>
    <p>Acked-by: Fabien Dessenne <a class="moz-txt-link-rfc2396E" href="mailto:fabien.dessenne@foss.st.com">&lt;fabien.dessenne@foss.st.com&gt;</a><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:AM9PR10MB4119423F89C44A1F840A32809A889@AM9PR10MB4119.EURPRD10.PROD.OUTLOOK.COM">
      <div class="moz-text-plain" wrap="true" style="font-family:
        -moz-fixed; font-size: 12px;" lang="x-western">
        <pre class="moz-quote-pre" wrap="">
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 7d9bded..da72e3e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1542,8 +1542,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (of_property_read_bool(child, "gpio-controller")) {
 			bank-&gt;rstc = of_reset_control_get_exclusive(child,
 								    NULL);
-			if (PTR_ERR(bank-&gt;rstc) == -EPROBE_DEFER)
+			if (PTR_ERR(bank-&gt;rstc) == -EPROBE_DEFER) {
+				of_node_put(child);
 				return -EPROBE_DEFER;
+			}
 
 			bank-&gt;clk = of_clk_get_by_name(child, NULL);
 			if (IS_ERR(bank-&gt;clk)) {
@@ -1551,6 +1553,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 					dev_err(dev,
 						"failed to get clk (%ld)\n",
 						PTR_ERR(bank-&gt;clk));
+				of_node_put(child);
 				return PTR_ERR(bank-&gt;clk);
 			}
 			i++;
--
1.9.1

</pre>
      </div>
    </blockquote>
  </body>
</html>

--------------A944B0793B100D01FFDCAC6B--

--===============1403264337607837949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1403264337607837949==--
