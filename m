Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7057B837A
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 17:24:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8221BC6C831;
	Wed,  4 Oct 2023 15:24:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F32B9C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 14:41:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 394ArQHU024373; Wed, 4 Oct 2023 16:41:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=KPQruG3VfMmKQVdEVQ7aQu3ubE96ICMR1N0cn0SYCOI=; b=4S
 M7JDlOvwkA8lz+wS51Xd5ASNYCGrt56H+5c2GdEWIGo0Qi+AbfUA59bjKhEHsatM
 38rsxgm0bFyo3qYV30v5KBk7SE+LBJ1z4JDhv1c2IQ7hz3Wrb7HpZ/ZMT/pA2mwR
 4GLDK7N/QhGqcJpIi7Sj1Oo9wWOpAbtSrzgaMARfL16t67kYpc4tWKJW0eRH4Brh
 abMx7Bu+TAXrHHktZ/G/vEQZ7Ao5qZqsCpi66vkDUwzeZmCVMvDXoBwmouLNrErl
 /xw8fD5SrdKwR6azuCGX6FCnI5eYC3QDhRs2m5HpJoJVi4Efzexw+HmUSOLnIPRb
 nX0Dz/rBg9+5A2Cj3xvQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3te8t51t9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 16:41:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 336C3100053;
 Wed,  4 Oct 2023 16:41:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1039925225D;
 Wed,  4 Oct 2023 16:41:17 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 16:41:16 +0200
Message-ID: <7754c3e4-fdb9-0976-9b91-97f0938d7afa@foss.st.com>
Date: Wed, 4 Oct 2023 16:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>
References: <20231003145114.21637-1-brgl@bgdev.pl>
 <20231003145114.21637-30-brgl@bgdev.pl>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20231003145114.21637-30-brgl@bgdev.pl>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_07,2023-10-02_01,2023-05-22_02
X-Mailman-Approved-At: Wed, 04 Oct 2023 15:24:21 +0000
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 29/36] pinctrl: st: use new pinctrl GPIO
	helpers
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



On 10/3/23 16:51, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Replace the pinctrl helpers taking the global GPIO number as argument
> with the improved variants that instead take a pointer to the GPIO chip
> and the controller-relative offset.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-st.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> index c1f36b164ea5..ec763572ab3e 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -719,7 +719,7 @@ static void st_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>  
>  static int st_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
>  {
> -	pinctrl_gpio_direction_input(chip->base + offset);
> +	pinctrl_gpio_direction_input_new(chip, offset);
>  
>  	return 0;
>  }
> @@ -730,7 +730,7 @@ static int st_gpio_direction_output(struct gpio_chip *chip,
>  	struct st_gpio_bank *bank = gpiochip_get_data(chip);
>  
>  	__st_gpio_set(bank, offset, value);
> -	pinctrl_gpio_direction_output(chip->base + offset);
> +	pinctrl_gpio_direction_output_new(chip, offset);
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
