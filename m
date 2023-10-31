Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF8C7DCA6A
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Oct 2023 11:09:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B75EFC6B44B;
	Tue, 31 Oct 2023 10:09:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A52AC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 10:09:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39V8stnD014473; Tue, 31 Oct 2023 11:09:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:cc:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=4teyTP8wthQuYWyxvRw9scjnKMkSjcXFG9zTOb3dtFo=; b=y6
 8CxtLD2QDXlZmSTxJz9tLVRx+DWoFOzsd5deHSlX8594VX7dvCg8qSYgAnfF8dMl
 NTs8g0dh0aS1EB+xVbybXf0relr6lYKz7KKsuZSQVRCma/9+Dul8St+5YcTD+Rwm
 cLK1vG56vUjQcZ08zW91OwOe5F9ruIh/bD/02KErp/i2aqKhOW3vN7owjJYjwozA
 VwxCTTZ8oPx44BzUXDLn202iCqfgRswYNxem1vtzcrd8g0yHPzvnBr2xjMaFguFi
 A2oiwAxMMIDENUm3leymlwhcanqFxdZ4Ug+5i8BamxmRv4Je+F24pMNFSxsQLqk5
 MUvI5emzNnqD2IIIYklw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u29yanhrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Oct 2023 11:09:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D24A100050;
 Tue, 31 Oct 2023 11:09:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F76621ED27;
 Tue, 31 Oct 2023 11:09:21 +0100 (CET)
Received: from [10.201.20.136] (10.201.20.136) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 31 Oct
 2023 11:09:20 +0100
Message-ID: <77e47143-2351-4f78-81b6-35ed4664f358@foss.st.com>
Date: Tue, 31 Oct 2023 11:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Chen Ni <nichen@iscas.ac.cn>, <linus.walleij@linaro.org>
References: <20231031080807.3600656-1-nichen@iscas.ac.cn>
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <20231031080807.3600656-1-nichen@iscas.ac.cn>
X-Originating-IP: [10.201.20.136]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-31_03,2023-05-22_02
Cc: robh@kernel.org, bero@baylibre.com, geert+renesas@glider.be,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com,
 dario.binacchi@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: Add check for devm_kcalloc
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

Hi Chen,

Thank you for your patch:

Acked-by: Valentin Caron <valentin.caron@foss.st.com>

Regards,
Valentin

On 10/31/23 09:08, Chen Ni wrote:
> Add check for the return value of devm_kcalloc() and return the error
> if it fails in order to avoid NULL pointer dereference.
>
> Fixes: 32c170ff15b0 ("pinctrl: stm32: set default gpio line names using pin names")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index a73385a431de..419eca49ccec 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1378,6 +1378,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>   	}
>   
>   	names = devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
> +	if (!names) {
> +		err = -ENOMEM;
> +		goto err_clk;
> +	}
> +
>   	for (i = 0; i < npins; i++) {
>   		stm32_pin = stm32_pctrl_get_desc_pin_from_gpio(pctl, bank, i);
>   		if (stm32_pin && stm32_pin->pin.name)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
