Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E626B227AF3
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 10:43:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98619C36B2A;
	Tue, 21 Jul 2020 08:43:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0C02C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 08:43:26 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L8avqI020757; Tue, 21 Jul 2020 10:43:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=dJLHdoGwt48EnjSrf0L0JKYkNiadZM77RdxMqkK77T4=;
 b=YZW7+M6nqFCTFlcQL3GU+ISgaS6SJXJGBep9/K1+AsjqH+ytBHRT4TXY7MUEAQkJtvKi
 8YyURQEKTCDYK6adyvmpvwogPC65A+yIB3kKD0hg45BlVkY8vRtLhtb4+Ure5F94kxmr
 VaxKLw3reSYy17cxeLAlHJkFG7y1jgZ+L16KhYivxeBnzA6gyVFEpqe7LMyw/PGYFydL
 0ppetjLHxh6fNSP/3QtjZJHnm9re4p47WGPyo9Cw/kDklXN/Wotv/1fraYAWWt1U80Pt
 pPd1DJUpJcL+I6FA+5l4Kmx7/WVrrkHDeqnBQn64ZGfbco+w0HCBBXecO34MVxjsajW0 UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bs6uvswq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 10:43:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B4F0C10002A;
 Tue, 21 Jul 2020 10:43:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2F702A615D;
 Tue, 21 Jul 2020 10:43:17 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Jul
 2020 10:43:17 +0200
To: Benjamin Gaignard <benjamin.gaignard@st.com>, <robh+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <lee.jones@linaro.org>
References: <20200703095520.30264-1-benjamin.gaignard@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <dc7779a9-fe0d-5317-2b7f-3607963888c5@st.com>
Date: Tue, 21 Jul 2020 10:43:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200703095520.30264-1-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/5] ARM: STM32: Add compatibles for
	syscon nodes
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

Hi Benjamin

On 7/3/20 11:55 AM, Benjamin Gaignard wrote:
> Since commit ad440432d1f9 ("dt-bindings: mfd: Ensure 'syscon' has a more specific compatible")
> it is required to provide at least 2 compatibles string for syscon node.
> This series update the syscon of the STM32 SoCs to fix the reported errors.
> 
> Benjamin Gaignard (5):
>    dt-bingings: arm: stm32: Add compatibles for syscon nodes
>    ARM: dts: stm32: Add compatibles for syscon for stm32f426
>    ARM: dts: stm32: Add compatibles for syscon for stm32f746
>    ARM: dts: stm32: Add compatibles for syscon for stm32h743
>    ARM: dts: stm32: Add compatibles for syscon for stm32mp151
> 
>   .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml     | 14 +++++++++++++-
>   arch/arm/boot/dts/stm32f429.dtsi                           |  6 +++---
>   arch/arm/boot/dts/stm32f746.dtsi                           |  6 +++---
>   arch/arm/boot/dts/stm32h743.dtsi                           |  6 +++---
>   arch/arm/boot/dts/stm32mp151.dtsi                          |  2 +-
>   5 files changed, 23 insertions(+), 11 deletions(-)
> 

Series applied on stm32-next by fixing subject of patch [1].

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
