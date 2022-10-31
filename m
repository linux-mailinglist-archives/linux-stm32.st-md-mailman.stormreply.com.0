Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE2613C6A
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Oct 2022 18:45:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2B09C57183;
	Mon, 31 Oct 2022 17:44:59 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 498F2C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 17:44:59 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w14so16992537wru.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 10:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uYtKmfNhvFP9fjeZBd6sjzcvYV43BjS3uEVltPLZXlo=;
 b=CP/OPsDiOO5oiXwe+KdK/PBb5uKYx61OOfMaWRqa2Bgcl5FaBr0wIhSH1k2qT+j+3o
 I2fpPy74CcLqE0MkXZ5CSQ/FkQna5kXNaeWLKThePjZMvHB7ybbv9i/Fp9ZLndGFzdkc
 tLzotgErj5cws74IhfXObgInf/HozgI3A8ZW57wHBV3KCs/SlzEcUQ3t2EdCq5EK8hh8
 LPOeP3dbJ3rTAhx44cbgciknRC7gTGg8hymj1sqY5TsGgEugfXkySiRNpZq7rLyFHTGN
 eUbUGGiuaZabCocIXsle5jbamXCjiWo0zN8yl5Dn5O3Pu2gh/S00xae3rZofqRKQNdXn
 mVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uYtKmfNhvFP9fjeZBd6sjzcvYV43BjS3uEVltPLZXlo=;
 b=ppupObhJotPpeqJZSUwfRzGUwgkvXAQ2ORrLG8zoU4jwcgbrCFzSQo9psQvD2OqBeI
 CLB6tTchUFeeFaG7Hz7EBLnlmYPqoEWiEbtv8mTvsRqcQyfGzM7TlZT9aznFTDzuWTJc
 X3dibdz7Z39UK+mf4qylyECnD8swTZjjoa2Q3PqcXsHM0rwZYzGHsHR9TQGHLjUw4QIh
 nIICb9bF8XG0J+WGj3Hh1x3kUTC8DYMAIpxCAw7Wfb0MTNjdc7XZQdkgyCt5jcCTPv6c
 Z/0ZwVByK7md94mS0v+GQQEhbWq1mrXMunTG6mvQ+Ne2daO9SmJszoNyuyaKyEcOMUm0
 s88A==
X-Gm-Message-State: ACrzQf0qN0aiJ53msziuLUxvHvCpcvVKw0GqEIz4UqACTWSW+0gZixsA
 PTJMsNnazDcFaRFS9U+oO8MCMA==
X-Google-Smtp-Source: AMsMyM6LetfHCHnCEKA7eJHWyMthDihLQrGyAsqKozRudXi0o9xFBAFBq46R3WXtUvbxrKq9NDPndg==
X-Received: by 2002:a05:6000:18a2:b0:22e:72fd:c5d0 with SMTP id
 b2-20020a05600018a200b0022e72fdc5d0mr8866232wri.682.1667238298855; 
 Mon, 31 Oct 2022 10:44:58 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 bg37-20020a05600c3ca500b003b477532e66sm25983788wmb.2.2022.10.31.10.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 10:44:58 -0700 (PDT)
Message-ID: <bb2c0e45-e1cf-6105-a6ea-20a6085f6c89@linaro.org>
Date: Mon, 31 Oct 2022 17:44:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jiangshan Yi <13667453960@163.com>, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
References: <20221009082819.2662964-1-13667453960@163.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221009082819.2662964-1-13667453960@163.com>
Cc: Jiangshan Yi <yijiangshan@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] nvmem: stm32: fix spelling typo in comment
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



On 09/10/2022 09:28, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>
> 
> Fix spelling typo in comment.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>

Applied thanks,

--srini
> ---
>   drivers/nvmem/stm32-romem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/stm32-romem.c b/drivers/nvmem/stm32-romem.c
> index 354be526897f..0c206ad05be7 100644
> --- a/drivers/nvmem/stm32-romem.c
> +++ b/drivers/nvmem/stm32-romem.c
> @@ -19,7 +19,7 @@
>   #define STM32_SMC_WRITE_SHADOW		0x03
>   #define STM32_SMC_READ_OTP		0x04
>   
> -/* shadow registers offest */
> +/* shadow registers offset */
>   #define STM32MP15_BSEC_DATA0		0x200
>   
>   /* 32 (x 32-bits) lower shadow registers */
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
