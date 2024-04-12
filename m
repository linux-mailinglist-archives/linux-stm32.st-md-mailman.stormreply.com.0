Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 456508A2691
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 08:28:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC3B6C6DD66;
	Fri, 12 Apr 2024 06:28:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00BF2C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 06:28:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43C0RJ5o014097; Fri, 12 Apr 2024 08:27:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=s25N0TuD2mKVnak326HEWl8NP4R38SQt9FxwJaCaMSI=; b=I4
 TntV39qdNvna/x0r4lkyP4NzQgLHdtb5KRXZXhmRYLAHBxfbGILwiOlyQySw7/N2
 brRLGppXPHoQPVfMk5e/FG+PE33r3WSI8mW2L/ciNJnEmlcVMlfSDH23kfRWnWAZ
 Gy7P+uAg7k9G+/BPY+njfs6w2OSnvfevI8hb6f+90goDO3hRxUStsMmt/Y2/1pxp
 lazHYhTpaAKiJ20VUadXbsXn+DjvET9aKobGeawDuOa6r0lqBK7cnbJU9TUEYCmV
 qDiHXAsL9uZixO/nwRo91Q2FoDHgIhMu/Fx5zke78HLfGI+dEA5A+KiLj/b9plTL
 38vWRqK8d5os4zSm2cew==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xauh5fnqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Apr 2024 08:27:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8E8324002D;
 Fri, 12 Apr 2024 08:27:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0AAA20DD96;
 Fri, 12 Apr 2024 08:26:53 +0200 (CEST)
Received: from [10.252.29.77] (10.252.29.77) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 12 Apr
 2024 08:26:52 +0200
Message-ID: <82b2a672-ecd9-40e6-83fb-c469498230af@foss.st.com>
Date: Fri, 12 Apr 2024 08:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
References: <20240411092453.243633-1-gabriel.fernandez@foss.st.com>
 <20240411092453.243633-4-gabriel.fernandez@foss.st.com>
 <7efb8858995d0c97ad2deccb24318353.sboyd@kernel.org>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <7efb8858995d0c97ad2deccb24318353.sboyd@kernel.org>
X-Originating-IP: [10.252.29.77]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_03,2024-04-09_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v11 3/4] clk: stm32: introduce clocks for
 STM32MP257 platform
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


On 4/12/24 08:22, Stephen Boyd wrote:
> Quoting gabriel.fernandez@foss.st.com (2024-04-11 02:24:52)
>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
>> This driver is intended for the STM32MP25 clock family and utilizes
>> the stm32-core API, similar to the stm32mp13 clock driver.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> ---
> Applied to clk-next
Thank's Stephen
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
