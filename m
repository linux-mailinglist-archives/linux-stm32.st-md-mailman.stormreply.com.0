Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB148C60E5
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2024 08:42:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7B00C6B47A;
	Wed, 15 May 2024 06:42:30 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6A4BC5E2D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2024 06:42:28 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F05PSM029365;
 Wed, 15 May 2024 08:42:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=/JIVYxvq9mCRglxSh2kdGVPT8AdWYNNp6KoGXjOv+kA=; b=An
 V1AyPaWYFcTG7Q/oR5JcWofslVX6rydGTYF6mdkKpO+SzGiG0VDRj5MOUbry5yHL
 y0ECkguVqBLqFqMeCxZhxgM75T4D5B/ioU81qZ9SILcNEX03dm3SK6sFIJ+ERDyd
 XcK4PslZ8kg08z5l8/AYpS7sJ7e8pxd5CRIUq2wsrZXNJoKP/FgS2hGvFksGefNZ
 g0hDlgY4M8xdZY4fNcHZvDkQw6fvgGLd6wUVMK2CtXEJ6XJBlcbqQwKvY4CG2V7U
 EGls+Wnlu+vO0aCj9E8BYn+Ox2hMf1TsA+Rxlh2GXz2UvcJNqaykrOlcFBimDpL3
 enZUVxQ808WhW+DLUSCA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y2kmhv6ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 May 2024 08:42:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AD9214002D;
 Wed, 15 May 2024 08:42:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DC2A20DD93;
 Wed, 15 May 2024 08:41:19 +0200 (CEST)
Received: from [10.48.87.209] (10.48.87.209) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 08:41:18 +0200
Message-ID: <73a9d56c-9e8d-4859-b3a2-dba1531b57e5@foss.st.com>
Date: Wed, 15 May 2024 08:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
References: <20240419152723.570159-1-gabriel.fernandez@foss.st.com>
 <20240419152723.570159-3-gabriel.fernandez@foss.st.com>
 <332c845c17e24e2eb660e18680f2626f.sboyd@kernel.org>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <332c845c17e24e2eb660e18680f2626f.sboyd@kernel.org>
X-Originating-IP: [10.48.87.209]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_02,2024-05-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/4] clk: stm32mp2: use of STM32 access
	controller
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


On 5/8/24 00:02, Stephen Boyd wrote:
> Quoting gabriel.fernandez@foss.st.com (2024-04-19 08:27:21)
>> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
>> index 210b75b39e50..a37ee9f707e3 100644
>> --- a/drivers/clk/stm32/clk-stm32mp25.c
>> +++ b/drivers/clk/stm32/clk-stm32mp25.c
>> @@ -4,7 +4,9 @@
>>    * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
>>    */
>>   
>> +#include <linux/bus/stm32_firewall_device.h>
> I don't have this include. I either need a signed tag or this needs to
> wait until next merge window.

Sorry for the delay, i was off.

I was based on tag next-20240419

>>   #include <linux/clk-provider.h>
>> +#include <linux/of_address.h>
> What is this include for?

yes #include <linux/io.h> is more appropriate.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
