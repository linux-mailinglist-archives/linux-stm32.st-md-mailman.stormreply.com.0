Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D9AD3835
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 15:08:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BEFAC3F93F;
	Tue, 10 Jun 2025 13:08:08 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A03CC3F93D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 13:08:07 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLKIb000488;
 Tue, 10 Jun 2025 15:07:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mCaZx9gJ+o3Q94P6ZYIvia/cHH4I4d89mREiVwWUrpM=; b=ngrdcVOc68Hp75Pu
 +jEX2wmlvTg2ujcw/Zr8WDxPRt6nV6WfaoUS0QDY9k7Xlf3fLKPutBi3yrXZJsz4
 ZAn375f4uVFmhk4AJy72NgWyVaBwaaIhZaqgOrb4DQwfK81OeX8mNNPc7jTJ5RGu
 XzMi86tzlDEpDtbE15JPr1ayK3pIpOIg/LyV0s+XTsVtlc15bxENm+za6CPnFZme
 hm2T2SH+F8O39zOBcfqGeu9sUYKX4G5ZNGZj7IGaLtWlhqOTEYIp3aTBqxX6rcmB
 b6LYMPJsb+oGNIQBmIp1c6hQFVgMohQ0FOYmjxJsh5zxF4rbLK9yVJ4Nqyz2RsyB
 AqhVNA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4750cnsxrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 15:07:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1F9554004B;
 Tue, 10 Jun 2025 15:06:49 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B46C1B525F3;
 Tue, 10 Jun 2025 15:06:07 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 15:06:07 +0200
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 15:06:06 +0200
Message-ID: <afda753a-47b2-417d-82a1-b166fc601f8f@foss.st.com>
Date: Tue, 10 Jun 2025 15:06:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Antonio Borneo <antonio.borneo@foss.st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andy Shevchenko <andy@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, "Lee
 Jones" <lee@kernel.org>, <linux-iio@vger.kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>
References: <20250610124855.269158-1-antonio.borneo@foss.st.com>
 <20250610124855.269158-6-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250610124855.269158-6-antonio.borneo@foss.st.com>
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 5/5] mfd: stm32-timers: Fix build warnings
	about export.h
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

On 6/10/25 14:48, Antonio Borneo wrote:
> After commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") and commit 7d95680d64ac ("scripts/misc-check:
> check unnecessary #include <linux/export.h> when W=1") we get the build
> warning with W=1:
> 
> drivers/mfd/stm32-timers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Fix it.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Hi Antonio,

You can add my:
Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice

> ---
>  drivers/mfd/stm32-timers.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
> index e3c116ee4034a..b3dbc02aaf798 100644
> --- a/drivers/mfd/stm32-timers.c
> +++ b/drivers/mfd/stm32-timers.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/export.h>
>  #include <linux/mfd/stm32-timers.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
