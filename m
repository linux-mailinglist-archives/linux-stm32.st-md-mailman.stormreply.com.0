Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4F278470D
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:25:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7384C6C829;
	Tue, 22 Aug 2023 16:25:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95536C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 13:47:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 642BB65CC8;
 Thu, 10 Aug 2023 13:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E03C433C8;
 Thu, 10 Aug 2023 13:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691675235;
 bh=QkyBBRbhaAkBlqKoL0aRnLOyMswVogqYwOnrfamsuyI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AyPw5yEFAHz2Y86hjai0dOH62HvASem+iQ1Gnh6MPraVhYC9FrPXveuwnF8+CI8ip
 kfe5BEc4clCP/zCrKuzm7hIXN7l04ukqxmHzRkh6tiIkcI7mxLQKfjB13/qyYtJmvG
 Wqw57Nm1mz/DlCoJryqUsIKza2yd+8VlfE+wyVP5Nm2lx7JAe187L688uFcgKqOhYz
 sNla0vRV+mqybIHhF0rg4FYi2qieMkIpLzpYPdoolH67vfQf3DUltLvLdurBFCF6G4
 HRVcXDqTaaV1QBD/u2OK6d/YsNEvtfVewprr3PO6NZYk/iaum6xlKCqCY7Chm4vSf9
 H4U5KF32ZWfwQ==
Message-ID: <0bea4002-8160-bebc-2243-c7d4044eb5ad@kernel.org>
Date: Thu, 10 Aug 2023 22:47:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
References: <20230810095849.123321-1-krzysztof.kozlowski@linaro.org>
 <20230810095849.123321-2-krzysztof.kozlowski@linaro.org>
From: Chanwoo Choi <chanwoo@kernel.org>
In-Reply-To: <20230810095849.123321-2-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:58 +0000
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/9] mfd: max14577: Fix
	Wvoid-pointer-to-enum-cast warning
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

On 23. 8. 10. 18:58, Krzysztof Kozlowski wrote:
> 'dev_type' is an enum, thus cast of pointer on 64-bit compile test with
> W=1 causes:
> 
>   max14577.c:406:5: error: cast to smaller integer type 'enum maxim_device_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/mfd/max14577.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
> index 25ed8846b7fb..1f4f5002595c 100644
> --- a/drivers/mfd/max14577.c
> +++ b/drivers/mfd/max14577.c
> @@ -402,8 +402,7 @@ static int max14577_i2c_probe(struct i2c_client *i2c)
>  
>  		of_id = of_match_device(max14577_dt_match, &i2c->dev);
>  		if (of_id)
> -			max14577->dev_type =
> -				(enum maxim_device_type)of_id->data;
> +			max14577->dev_type = (uintptr_t)of_id->data;
>  	} else {
>  		max14577->dev_type = id->driver_data;
>  	}

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
