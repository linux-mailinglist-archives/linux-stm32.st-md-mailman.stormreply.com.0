Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 614F7A12496
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 14:17:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10EC0C6DD6D;
	Wed, 15 Jan 2025 13:17:11 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FB9CC78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 10:24:41 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F7sWRc014640;
 Wed, 15 Jan 2025 04:24:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=PODMain02222019; bh=F8fT8Kv+j/S2D4pOQn
 UFqbh6MfyYIrUfOk0KiOX87Jc=; b=VW1JPJwireF63R+LkAf1nvgCd4OhgbgcGo
 o9oqRq48//099FlqQg+hrWuLh26NjzJb4IumNFVQH0UApd/L8xoncuZ18dAoyk9e
 trJGUbZqhYvD/HMldUm3uONz+tCg74wGl53NBjMxBJVqLXXTNDNdEx3+BslIHULB
 XQn+wO1wI17r1fGEme0bWM+tIeOWC/j4etAsl2901S62Gq42kFccnhsfuAEUNiNn
 B6tQD0hORaBy/LPaDTgEHFuhvjEuDhiZTumorTk0lhtwEWodOs8UfDBdR5OdbYsd
 wgG+wx4ScyMZkWekMPAtIP0pp8zJnUhRxbRcwhFVeWW7m+uB2VNw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 443px4mf9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2025 04:24:18 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 15 Jan
 2025 10:24:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Wed, 15 Jan 2025 10:24:16 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
 by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 1508882026C;
 Wed, 15 Jan 2025 10:24:16 +0000 (UTC)
Date: Wed, 15 Jan 2025 10:24:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <Z4eMz06gm6DPjqsR@opensource.cirrus.com>
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
X-Proofpoint-ORIG-GUID: g_1sQD1C5vLD-t_9ffrlstl7qSLhk8gd
X-Proofpoint-GUID: g_1sQD1C5vLD-t_9ffrlstl7qSLhk8gd
X-Authority-Analysis: v=2.4 cv=XdhzzJ55 c=1 sm=1 tr=0 ts=67878cd2 cx=c_pps
 a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17
 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=Q-fNiiVtAAAA:8 a=KKAkSRfTAAAA:8
 a=w1d2syhTAAAA:8 a=4kLLQdw-iMVuSiU5jB4A:9
 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Wed, 15 Jan 2025 13:17:09 +0000
Cc: Andy Shevchenko <andy@kernel.org>, linux-pwm@vger.kernel.org,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 patches@opensource.cirrus.com, Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Nandor Han <nandor.han@ge.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] gpio: Use str_enable_disable-like
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

On Tue, Jan 14, 2025 at 08:14:38PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

For the Wolfson bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
