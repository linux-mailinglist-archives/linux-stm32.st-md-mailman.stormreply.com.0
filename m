Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 278BA160CE1
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2020 09:21:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCAF5C36B0B;
	Mon, 17 Feb 2020 08:21:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DF8BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2020 08:21:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01H8DR2s003204; Mon, 17 Feb 2020 09:21:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=eeYePah8N20Fhz2BV0G/EU8+d/RYrV5o3pvxjTnWhtQ=;
 b=tYjvTXZR/+yVgJq4Q7/Q8BVNR4fg57US+2Lz2Rv12fLlnKMRkjd+xOhyAsK4CKhqyC9P
 ajb7XMJ/ERa17xR/QCtYS79B13JLRda0+BjSC1sCDOTeHO4++yTgshQ4zwKEUwaz2Pl+
 4o5moP2QRz+TXJNj01NOq2gBvNwim0410gQZjGsiWu+KiMZSeV5fWF3FHdu8Z8N78vKU
 jxPpUZ89F4XVR2XxVoSWYO9Kdxsl/JQHBPgdUWEhVuYi2JiUBb0HBfKWnrKO6vH+TC6J
 t/28ljTKWtjt73PMR+QJwTqcOLqsHr68cyFRWddll0XOHFcmbcKk5QRHyUyUb/bWPgxo Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y6705hmd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 09:21:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 839C7100038;
 Mon, 17 Feb 2020 09:21:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74E0B221612;
 Mon, 17 Feb 2020 09:21:10 +0100 (CET)
Received: from [10.48.0.71] (10.75.127.47) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Feb
 2020 09:21:09 +0100
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Benjamin Gaignard
 <benjamin.gaignard@st.com>, Rob Herring <robh@kernel.org>
References: <20200216130841.4187-1-lukas.bulwahn@gmail.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <d24f8983-1d68-11d3-280e-a632ba618460@st.com>
Date: Mon, 17 Feb 2020 09:21:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200216130841.4187-1-lukas.bulwahn@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_04:2020-02-14,
 2020-02-17 signatures=0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] MAINTAINERS: adjust to stm32 timer
	dt-bindings conversion
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

On 2/16/20 2:08 PM, Lukas Bulwahn wrote:
> The commit 56fb34d86e87 ("dt-bindings: mfd: Convert stm32 timers bindings
> to json-schema") and commit b88091f5d84a ("dt-bindings: mfd: Convert stm32
> low power timers bindings to json-schema") converted some files from txt to
> yaml format in ./Documentation/devicetree/bindings/, but they missed to
> adjust MAINTAINERS.
> 
> Since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   no file matches F: Documentation/devicetree/bindings/*/stm32-*timer*
>   no file matches F: Documentation/devicetree/bindings/pwm/pwm-stm32*
> 
> So, repair the MAINTAINERS entry now.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Hi Lukas,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Fabrice
> ---
> Benjamin, Fabrice, please ack.
> Rob, please pick this patch.
> applies cleanly on current master and on next-20200214
> 
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0d86490c2c6..9175b59e2b4c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15923,8 +15923,7 @@ F:	drivers/*/stm32-*timer*
>  F:	drivers/pwm/pwm-stm32*
>  F:	include/linux/*/stm32-*tim*
>  F:	Documentation/ABI/testing/*timer-stm32
> -F:	Documentation/devicetree/bindings/*/stm32-*timer*
> -F:	Documentation/devicetree/bindings/pwm/pwm-stm32*
> +F:	Documentation/devicetree/bindings/mfd/st,stm32-*timer*.yaml
>  
>  STMMAC ETHERNET DRIVER
>  M:	Giuseppe Cavallaro <peppe.cavallaro@st.com>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
