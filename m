Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C52AB626
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 12:09:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE124C3FAE2;
	Mon,  9 Nov 2020 11:09:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEBC1C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 11:09:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9B6cQs001199; Mon, 9 Nov 2020 12:09:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=htm0vOekG4ttjg1zbmaMtAIvz7vTW1YVK5qd+mjldiQ=;
 b=exORZa/SUt2HnKsoYhoxGaAQStF/JoUI66u54353aVIeGS02MsI22SAfQunhGpD56Kkp
 gNNifa3uezfBleTBgt+ZxazKTD80fy0XKCbA6qYSy9xg33BqocLlkeARdDp/2b/p+p4H
 q3FLAUAIfFiGB9FwtSTtxLHKFc9kLsbjbZ+SSXJ2qvXLZt1gSXfh1IeARWolzaNkXR1i
 7KPL/sXkBVsWGFcADuzWD9YzB3NnbLmRtKdSKWg8J4CFbIZQdSQ2ACDsAxLCJ5EMt9xG
 NJF71nS87mFWQf6HbOXsZpBg7Y8JOHol1yBfllxIG3JNporBYPE4uhR1wb0oec8gPGwX Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34nkbmsnq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 12:09:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60C3310002A;
 Mon,  9 Nov 2020 12:09:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4811F24D149;
 Mon,  9 Nov 2020 12:09:31 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 12:09:30 +0100
To: Lionel Debieve <lionel.debieve@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20201105102331.12984-1-lionel.debieve@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <28f5e745-bdac-7cc1-62a9-745e8d41a142@st.com>
Date: Mon, 9 Nov 2020 12:08:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105102331.12984-1-lionel.debieve@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_02:2020-11-05,
 2020-11-09 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/3] ARM: dts: stm32: enable crypto
	controllers
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

Hi Lionel

On 11/5/20 11:23 AM, Lionel Debieve wrote:
> Enable the crypto controllers in the STM32MP157C-EV1 and STM32MP157A-DK1
> STM32MP157C-DK2 boards.
> 
> Lionel Debieve (2):
>    ARM: dts: stm32: enable HASH by default on stm32mp15
>    ARM: dts: stm32: enable CRYP by default on stm32mp15
> 
> Nicolas Toromanoff (1):
>    ARM: dts: stm32: enable CRC1 by default on stm32mp15
> 
>   arch/arm/boot/dts/stm32mp157c-dk2.dts  |  4 ++++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts  | 12 ++++++++++++
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi |  8 ++++++++
>   3 files changed, 24 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
