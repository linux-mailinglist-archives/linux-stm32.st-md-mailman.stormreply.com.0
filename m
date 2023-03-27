Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 763816CA0E3
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 12:09:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2613BC6A5F6;
	Mon, 27 Mar 2023 10:09:14 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D4AEC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 10:09:12 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so6964055wmq.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 03:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679911752;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hw+/RHBhs6qoBuvjwE715wDDIv45tvIt89aqUEaXIH8=;
 b=N3Hr5w5nCaDfzUSpQRCDtPx/Qvsd4Gm+6qfGW2UtaaQSsKN9Pw4QMjzMKwhgZsTn7y
 XhwI5vliTtQdo1E44Wo9dntl87Mv4rcyPrvjrNiZ5mDoElXrOFwYoPjUzEu1nRBQGqOv
 sNNZusonmNapXEyqUqPiMo2jCD3FScrrSEy+7rAEsVVmrQPgj/yGYqmyNZ/RERs3fQTg
 rv8qYaB7igo9EHXclRaHWjlr870TAu9AyDdaRaAaJ7Lh8JznpTVyenVDu5/xiVqZ2gUd
 LU0JgrEPhleHqQkP17BRPq52yP3rRYrVS6N7xwTFrZxYQc5I1Oida6MgeEZmWGkbBlDy
 yL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679911752;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hw+/RHBhs6qoBuvjwE715wDDIv45tvIt89aqUEaXIH8=;
 b=ZmPWUpO00L977BVZ/HeuvzoDhktMj45eqgyZkr6Q3RLCHGE+ryGP7JKJYoWnsIJyLL
 fjY5D5SAT0als/Aq+n9iLVzmYjMajRkx6rXO8AnLGaC7TJ6cdR1fCG3qDG+ZTRnQg26v
 7aIcxnWUeFw9EH9r2jacJFXQdyWQav6IbHNch7ZCPjoSgdUZjEYJE3EH4hV222ucNowi
 brGPTRaCMnWrjNQQJwldTCapC2DalJk3i+DT0QiALgu9kqlharp+mdBct56GUbUHa7dG
 TyTY9g+ebPw3RnSzxrH/faKs9yZPVPdw7ohqn2/n9QvBKChhTiM/dQYGwbLwCg8NfIWa
 9T5w==
X-Gm-Message-State: AAQBX9dCImxJOcRep2LSMLFrP2Sp/8ru29MkBjBEH37aBJAR8T5hnKhw
 F6dnAvf+qVBs7GMVpYZZLmK2Dw==
X-Google-Smtp-Source: AKy350bAklOYTUxUxdr7ZG0/oisXLxeuAEwoOFvEmh6uLNgFLQqBGEXCgbCn+KqQuOwgQXmm7IdKFQ==
X-Received: by 2002:a7b:c009:0:b0:3ef:62c6:9930 with SMTP id
 c9-20020a7bc009000000b003ef62c69930mr5425149wmb.3.1679911752085; 
 Mon, 27 Mar 2023 03:09:12 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b003dd1bd0b915sm8402995wmq.22.2023.03.27.03.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 03:09:11 -0700 (PDT)
Message-ID: <5a72f14d-636d-8328-fc56-23be11c6737c@linaro.org>
Date: Mon, 27 Mar 2023 11:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230327094742.38856-1-christophe.kerello@foss.st.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 0/2] mtd: rawnand: stm32_fmc2: do not
	support EDO mode
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



On 3/27/23 10:47, Christophe Kerello wrote:

Hi!

> The first patch removes EDO mode support from FMC2 driver as the controller
> does not support the feature and has to be applied on Kernel LTS. The second
> patch uses timings.mode instead of checking tRC_min timing for Kernel next.
> 

Would have been good if you specified that the fix is needed for v5.4+
and that the timings.mode was introduced in v5.8, it would have spared
readers of checking if two patches are really needed. No need to resubmit.

> Changes in v2:
>  - second patch added for Kernel next
> 
> Christophe Kerello (2):
>   mtd: rawnand: stm32_fmc2: do not support EDO mode
>   mtd: rawnand: stm32_fmc2: use timings.mode instead of checking tRC_min
> 
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
