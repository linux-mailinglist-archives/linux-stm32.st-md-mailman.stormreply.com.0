Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF7C4C4961
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Feb 2022 16:43:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75DA1C60491;
	Fri, 25 Feb 2022 15:43:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08637C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 15:43:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21PD6pq4031745;
 Fri, 25 Feb 2022 16:43:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MBoowDQHPfD1JA5SFm2tPIXGpLPPrwVQpuzL9/QQv20=;
 b=OmyHVP7XKeH06zdmOAYu3zu/hZ/Nuja8/4COwZUTHGgwqGn+AWfahVMR+FeMrD7l5pt1
 NqdKTrEb2OnZe5u2bkgS8wQG5hLFdZmjgm1a/cUPb7gLFE1JBPBV4HgCQDd/LsyyTcXu
 GwzxOURKLINGKMVgQl8YaOS5Gx9f8Y5ZGLueE635n0SgGcEzcPPR5my+ZxN5HmKw0MBh
 fBH9O/ebNcfG6EBCfoQAsbeniNEMiKtIlLMVVVnPdaHqGOiOJmJwu7QLEtURoBe3mWVZ
 b0BrtWctGTanPYtYUyCS6TQF68pG2Btrt2ARESG/hzJPh+qpI/c1yJiRyaVzmryGevNb eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3eetrf2y6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:43:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31B5F10002A;
 Fri, 25 Feb 2022 16:43:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28BDC22FA49;
 Fri, 25 Feb 2022 16:43:09 +0100 (CET)
Received: from [10.201.22.79] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 25 Feb
 2022 16:43:08 +0100
Message-ID: <7d1c5ef9-beca-9804-471f-92abd8a6e168@foss.st.com>
Date: Fri, 25 Feb 2022 16:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220225133137.813919-1-gabriel.fernandez@foss.st.com>
 <3e2f8cf8-3a41-d2e2-c9f1-6c1240b4a610@pengutronix.de>
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <3e2f8cf8-3a41-d2e2-c9f1-6c1240b4a610@pengutronix.de>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_09,2022-02-25_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 00/13] Introduction of STM32MP13 RCC
 driver (Reset Clock Controller)
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

Hi Ahmad,

many thanks for your review.

I'll check linux-stm32 mailing list issue.

Best Regards

Gabriel

On 2/25/22 16:28, Ahmad Fatoum wrote:
> On 25.02.22 14:31, gabriel.fernandez@foss.st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
>> This patchset introduce the reset and clock driver of STM32MP13 SoC.
>> It uses a clk-stm32-core module to manage stm32 gate, mux and divider
>> for STM32MP13 and for new future STMP32 SoC.
>>
>> v2:
>>    - Resend because patch 9,10,12,13 has not been sent
>>    - add Reviewed by Krzysztof Kozlowski for patch 1
>>
>> Gabriel Fernandez (13):
>>    dt-bindings: rcc: stm32: add new compatible for STM32MP13 SoC
>>    clk: stm32: Introduce STM32MP13 RCC drivers (Reset Clock Controller)
> This patch seems to not have reached linux-stm32. It's not in my inbox
> and https://st-md-mailman.stormreply.com/pipermail/linux-stm32/2022-February/014533.html
> doesn't list it either. It's indexed by lore.kernel.org though.
>
> Cheers,
> Ahmad
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
