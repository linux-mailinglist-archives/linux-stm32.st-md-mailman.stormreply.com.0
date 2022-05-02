Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08479516C12
	for <lists+linux-stm32@lfdr.de>; Mon,  2 May 2022 10:32:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1F65C628A9;
	Mon,  2 May 2022 08:32:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC100C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 May 2022 08:32:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 241Ho1Ea031550;
 Mon, 2 May 2022 10:32:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9dUYh+DHasuAQkUDwAHv3H6Pnub6cjmHiZc6sRAX3/I=;
 b=pQIGp8lPeAU3THNmMu0fjkMFb2KB79X41O3Nmip2ywXugsm/DDmWCgUYdw0fuIN3fN8e
 CGaKclqn4kixL10sgYC+TiYowglwLuTo3i8SO438xXLhteJC8Ha3lx7AFuQHQZlAGhWT
 fBTtGnMjY+GBTZArMAeTqCB2ZJ/l/zkAX07XL5MsDcHQkz5vg2UYWXCOz8D1+6t3MtZv
 cMhLxzZHhF5HupEJrfounLiLmclYg5YwRhrQm0/Gkhi6FraVkMI8W9fNtZvlXj5+FQ6N
 e+ixRksn8oe1+9qsCHEwvnWOk0RdFiXIM7J5TglpQOw5M+atTudJ5pGf+E+qZrrIYt/w wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthjfa3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 10:32:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 731A210002A;
 Mon,  2 May 2022 10:32:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C671212FB6;
 Mon,  2 May 2022 10:32:00 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 2 May
 2022 10:32:00 +0200
Message-ID: <4f362178-9eef-a669-59fa-d01a17b2bac3@foss.st.com>
Date: Mon, 2 May 2022 10:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220425140436.332467-1-krzysztof.kozlowski@linaro.org>
 <20220425140436.332467-2-krzysztof.kozlowski@linaro.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220425140436.332467-2-krzysztof.kozlowski@linaro.org>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_03,2022-04-28_01,2022-02-23_01
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 2/2] dt-bindings: arm: stm32: correct
	blank lines
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

Hi Krzysztof

On 4/25/22 16:04, Krzysztof Kozlowski wrote:
> Correct blank lines to precesily separate entries.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 2f83f2760e6a..80b29f6903f0 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -64,8 +64,8 @@ properties:
>                 - st,stm32mp157c-ed1
>                 - st,stm32mp157a-dk1
>                 - st,stm32mp157c-dk2
> -
>             - const: st,stm32mp157
> +
>         - items:
>             - const: st,stm32mp157c-ev1
>             - const: st,stm32mp157c-ed1
> @@ -110,6 +110,7 @@ properties:
>             - const: oct,stm32mp15xx-osd32
>             - enum:
>                 - st,stm32mp157
> +
>         - description: Odyssey STM32MP1 SoM based Boards
>           items:
>             - enum:

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
