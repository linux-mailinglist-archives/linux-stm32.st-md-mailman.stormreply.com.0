Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2444EA8DF
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 09:59:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37F60C5EC56;
	Tue, 29 Mar 2022 07:59:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 309FFC5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 07:59:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22T7N1Xq020398;
 Tue, 29 Mar 2022 09:59:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UcgvQ2AdqobLy8N84Hdj82PeXx82mB/fu9p/MaYyHdI=;
 b=CQMOzzrneW0mojI+xjGHYXulRxrDP0c0Y8GdKIAHw8Ff1gWo5+MYtj88VtmxM40gQrBY
 c7pnL8L44jCHw0rYTnsvnuQdzFDItQi4+Mz032IrPBqztShXfcqDNiudSgA6CwE1AGjE
 4LPcfxDVVw23/+hJkqI9l+edsrjGqW9VWCBzhbVl+jWRnETCBwn8E9XI2dANUjRVG1lG
 V43tCejVYcyrKlTl2akWBAg6osT663vAqpwEG7QKfQffgXn0a78BoAZ3mp7cpYeMJyau
 iDJPm6xle6YBOczTZDPwJjIPY6rWnu4vAyEA35ZjFK1xtIziGCtY/6Q5hb3H2e2eZlcZ CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1tkm7m18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 09:59:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A60110002A;
 Tue, 29 Mar 2022 09:59:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 216872138C3;
 Tue, 29 Mar 2022 09:59:34 +0200 (CEST)
Received: from [10.211.10.49] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 29 Mar
 2022 09:59:33 +0200
Message-ID: <44057328-2454-4f4d-cc90-b0ca35ba1e5a@foss.st.com>
Date: Tue, 29 Mar 2022 09:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-2-andriy.shevchenko@linux.intel.com>
From: Fabien DESSENNE <fabien.dessenne@foss.st.com>
In-Reply-To: <20220325200338.54270-2-andriy.shevchenko@linux.intel.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_02,2022-03-28_01,2022-02-23_01
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v1 2/5] pinctrl: stm32: Replace custom
 code by gpiochip_count() call
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Andy,


On 25/03/2022 21:03, Andy Shevchenko wrote:
> Since we have generic function to count GPIO controller nodes
> under given device, there is no need to open code it. Replace
> custom code by gpiochip_count() call.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 9ed764731570..d4bbeec82c1f 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1423,7 +1423,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct stm32_pinctrl *pctl;
>   	struct pinctrl_pin_desc *pins;
> -	int i, ret, hwlock_id, banks = 0;
> +	int i, ret, hwlock_id;
> +	unsigned int banks;
>   
>   	if (!np)
>   		return -EINVAL;
> @@ -1513,10 +1514,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		return PTR_ERR(pctl->pctl_dev);
>   	}
>   
> -	for_each_available_child_of_node(np, child)

Here we look for "available" child, while the new generic helper 
gpiochip_count() looks for any child, available or not.
Would it be possible to hav gpiochip_count() looking for available child 
as well?
It looks like there is '_available_' version of 
'device_for_each_child_node', maybe this shall be added too.


> -		if (of_property_read_bool(child, "gpio-controller"))
> -			banks++;
> -
> +	banks = gpiochip_count(dev);
>   	if (!banks) {
>   		dev_err(dev, "at least one GPIO bank is required\n");
>   		return -EINVAL;

Fabien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
