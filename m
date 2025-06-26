Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 944FDAEAFDF
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 09:13:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5195CC36B3E;
	Fri, 27 Jun 2025 07:13:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B03AAC36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 11:27:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA9Noi009058;
 Thu, 26 Jun 2025 13:27:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=vwG4bJ7/mdzDFYMPY5C4D76n
 QjHjkaEsopktP0VfbWs=; b=dyN/dgUHMztZN9BHU495fNr4g9GL8Bz7w4VC7Ncg
 oXjetj3EJLNs/GerzIwKsq8zgfuqzrsMqixhgwFgkn/E/OlqfeOWuZu+ygP6b2od
 sq2TJGB17hTiurvW0VpdxTkm6aozvYFVUVs1dLcw9i76RYznbuCxzLYYJ7onxvf9
 lArPS9MwOUdN5QywFPw3AQxlsN3pBhMK0dUYYKnTv0lbfw8BS3SAgT8+LxO1f0Ia
 paUCIj8hPOh4sDfiYqSiGRojRbljVzHC+fDu/0VUsMjzwKLjGmFZaoJ8xlt612Yk
 nTzQHWaLW+r9G4D8soKHxstdU2yLcFS4eG2ViHl73HiKpw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm33q2g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jun 2025 13:27:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E25874004A;
 Thu, 26 Jun 2025 13:26:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6B515C2EAC;
 Thu, 26 Jun 2025 13:24:35 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 13:24:35 +0200
Date: Thu, 26 Jun 2025 13:24:28 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <long.yunjian@zte.com.cn>
Message-ID: <20250626112428.GA350099@gnbcxd0016.gnb.st.com>
References: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Mailman-Approved-At: Fri, 27 Jun 2025 07:13:12 +0000
Cc: andi.shyti@kernel.org, linux-kernel@vger.kernel.org, fang.yumeng@zte.com.cn,
 xu.lifeng1@zte.com.cn, linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 ouyang.maochun@zte.com.cn, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mou.yi@zte.com.cn
Subject: Re: [Linux-stm32] PATCH] i2c: stm32f7: Use str_on_off() helper
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

Hi,

thank you for your patch.

On Mon, Jun 23, 2025 at 08:31:44PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> Remove hard-coded strings by using the str_on_off() helper.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index e4aaeb2262d0..ef15475a7ee1 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -34,6 +34,7 @@
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
> 
>  #include "i2c-stm32.h"
> 
> @@ -722,7 +723,7 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
>  		setup->rise_time, setup->fall_time);
>  	dev_dbg(i2c_dev->dev, "I2C Analog Filter(%s), DNF(%i)\n",
> -		(i2c_dev->analog_filter ? "On" : "Off"), i2c_dev->dnf);
> +		str_on_off(i2c_dev->analog_filter), i2c_dev->dnf);
> 
>  	i2c_dev->bus_rate = setup->speed_freq;
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain
> -- 
> 2.25.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
