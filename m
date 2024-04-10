Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE07689ECB1
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 09:52:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D409C6C858;
	Wed, 10 Apr 2024 07:52:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 417C1C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 07:52:42 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43A7EafS003712; Wed, 10 Apr 2024 09:52:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=rMYpD05cp2Dgf5jUrorLWhuaT2GKlTcovx9+xdL8a+U=; b=SA
 V3xkHLSYG9l9cKfiEQO1OFktaeA9tHlvj9no6sZMCStQ3sPl3Q1dGdw22hNsWHmp
 I4ghwx0+JJ0P7WrrRpkqSW8hhAewwt2k/GgGTTUiykz0quaR2Xsluz+pcNuk8cJ9
 PZfVqu4I7QJsvl97gltrpnq5Doxq2zxy59j6lO7uO5uNxFJIX6HD9twZGQ/7cZ3U
 qfTn30bLxhHxkQEFGYRCjQeiMs/z6XQtq7I+Vbbe71SlCyqva4YmXK/DdIlKrb6k
 fJjZXsXbTIw99b2KkyvPH0gppi4ACePK+tZG8JGeVh337zJydOK9eM7r4ICFYPta
 C8MJPrVcAnW5wzy0o51g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xautfy33v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Apr 2024 09:52:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8C68E4002D;
 Wed, 10 Apr 2024 09:52:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DC5C211609;
 Wed, 10 Apr 2024 09:51:28 +0200 (CEST)
Received: from [10.48.86.110] (10.48.86.110) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 10 Apr
 2024 09:51:27 +0200
Message-ID: <4ad98109-9440-4331-b49c-141cc2e08498@foss.st.com>
Date: Wed, 10 Apr 2024 09:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20240409171241.274600-1-gabriel.fernandez@foss.st.com>
 <20240409171241.274600-3-gabriel.fernandez@foss.st.com>
 <0fd8811a-03ea-4471-a72d-7138aeb319f5@linaro.org>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <0fd8811a-03ea-4471-a72d-7138aeb319f5@linaro.org>
X-Originating-IP: [10.48.86.110]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_02,2024-04-09_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v10 2/4] dt-bindings: stm32: update DT
 bingding for stm32mp25
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


On 4/10/24 09:06, Krzysztof Kozlowski wrote:
> On 09/04/2024 19:12, gabriel.fernandez@foss.st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
> A nit, subject: drop second/last, redundant "DT bindings". (plus a
> typo...) The "dt-bindings" prefix is already stating that these are
> bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
> Subject: Everything is an update. Be specific.
ok
>
>> RCC driver uses '.index' to define all parent clocks instead '.names'
>> because the use of a name to define a parent clock is prohibited.
>> This is ABI change, but the RCC driver has not yet merged, unlike all
>> others drivers besides Linux.
>>
>> Fixes: b5be49db3d47 ("dt-bindings: stm32: add clocks and reset binding for stm32mp25 platform")
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> ---
>>
>> Changes in v10:
>>    - cosmetic change (add change blank line)
>>    - rename USB2 into USBH to be compliant with last Reference Manuel
>>
>> Changes in v9:
>>    - Update DT binding documentation according S.Boyd remarks on RCC driver:
>>      Don't use '.name' to define a parent but use '.index'
>>      Then:
>>        - remove 'clock-names' property
>>        - Add description of all parent clocks used in RCC driver
>>
>>    v9 was Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Please avoid putting full acks somewhere in the changelog. You confuse
> people's filters and maybe tooling as well. "v9 was Acked-by Conor
> Dooley", so a proper sentence, not "fake" ack, would work for everyone.
>
>
> With fixes in the subject:
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thank's

Best regards

Gabriel


> Best regards,
> Krzysztof
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
