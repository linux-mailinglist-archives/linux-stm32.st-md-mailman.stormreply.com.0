Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A36AFF53
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B017C6B46D;
	Wed,  8 Mar 2023 07:00:29 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BF11C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 19:57:57 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id w23so11928698qtn.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Mar 2023 11:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678132676;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fcear7SkG9TmnSwIELIrY7+1NyaOV8lflIIPHX2QmK8=;
 b=WGjLRckl281DCVlHPpmlzGIN/jVrcmhh5kKLciScBCHtk+amtS/6/t4urkFbS2pA3u
 07on6PPWceK62oGnAqS7/+v+401JZJqNJB6BdVuRObXwOoLqfl/JVBiS3yGP51CqW/I2
 ZzY9hwn6PSoKgV9iNYZxZFMSZzetb4rtzLQfN2JTeg1+Qx7gM3TGDUHVJZSGANu/w4jH
 iksTOHuImXCj/V+tdhzbNGhmbtBhx2OHYXc15vI4VBYpk63ZJUcJcsVc4tdP3AN64uKj
 +mtBCAYTktuAa1f+p5xWuDHFdvrZgW8nv3WFaZtNsQiGVn6q/UPkrSr6DRxIlRcr30Iz
 JWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678132676;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fcear7SkG9TmnSwIELIrY7+1NyaOV8lflIIPHX2QmK8=;
 b=aK0FS69wc0EPKwrMnbncwdZV/qxaaBkQZd8PV9OEvDvn6fS8g5ghCgdSYu+sAzk7gm
 zhBNdvKB2VgL+0yvZr1UE9Oi2wmKoL8Z3nyutxm1fHUaOrVrr7jwylIhKn9+ThfGT+fz
 HNU8VnK+oxGU1+0JOyWXjborlj8d069Ax4tpOeLEgMzPp3lHI04Ek4NLELCpxsSi0Yxn
 3W5czQo6d7g4jLeYufb6j9dWZ+aLvqVpG/hBEsevQ4+CvCZqIP6kGf687lXRK3F7lF9k
 eWdhBDsZONlB5wVjb1cGHhV2w0uZDTbvisMuuAJz0QBkb2NFg9t3/10uRvtz7X93DcrC
 SzXw==
X-Gm-Message-State: AO0yUKWNgb9qJBGTanhoLVgWySN/aNW3/KW3UKh/GEncLRZUrBNP/h1T
 OHuWBKFs6a2gh04pnCXN+AY=
X-Google-Smtp-Source: AK7set/670uYwxALTojyHbMIdyaecZVHhjNJyQIIeA/qSS1xpmTRM60vLEXXjINc/dPl+ojNjtYx/g==
X-Received: by 2002:ac8:4904:0:b0:3ba:2b4:7b39 with SMTP id
 e4-20020ac84904000000b003ba02b47b39mr13795686qtq.46.1678132676348; 
 Mon, 06 Mar 2023 11:57:56 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 x8-20020ac87008000000b003b868cdc689sm8203872qtm.5.2023.03.06.11.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 11:57:55 -0800 (PST)
Message-ID: <738a5705-74eb-d339-60ee-6f18a08822a8@gmail.com>
Date: Mon, 6 Mar 2023 11:57:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
References: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
 <20230306195556.55475-8-andriy.shevchenko@linux.intel.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230306195556.55475-8-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:00:24 +0000
Cc: Andy Shevchenko <andy@kernel.org>, Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Nandor Han <nandor.han@ge.com>, Thierry Reding <thierry.reding@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v1 07/16] gpio: brcmstb: Utilize helpers
 from string_choices.h
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

On 3/6/23 11:55, Andy Shevchenko wrote:
> There are a few helpers available to convert a boolean variable
> to the dedicated string literals depending on the application.
> Use them in the driver.
>  > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
