Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA926D3EB0
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 10:12:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44187C65E70;
	Mon,  3 Apr 2023 08:12:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE393C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 08:12:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33365u7x006137; Mon, 3 Apr 2023 10:11:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fwYoHtk4uBEjNDRfcBSbMb8Oh9eWXuhyTYHse6pcGEs=;
 b=ffDmcWm24qyCFRt36xfw/hKtTjyV1MkGXpj9dTTxXZkA0SZ4gcffZfv++/AXa+cSnLzj
 XKMCB0sokvw9uJk7cUG4iUW/KWq5I8mr0YNDEchzLCb9TdtnyVpl5DbEeav7NBr9jrDm
 U5tK+r0PtrVuTSLroqo4EObBKuF0WGm7GlRlsk54gQohtmxkZqGIdn4Iqu6N9sEKjZ3z
 Lf7ic/4xD0JMdxzYTtnP5wTfISSpArtmli3WHM45p1or91FJKmf3FXjd67aGDnjcL0fJ
 WqzH4Pbdgdq5wg1U8CLumI9fRbkygjhzmxVjfYJPihrVWvwT9oI6kTplSk85ETYiX2PN eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ppby3rh36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 10:11:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95C1D100034;
 Mon,  3 Apr 2023 10:11:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 879682128C2;
 Mon,  3 Apr 2023 10:11:47 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 3 Apr
 2023 10:11:46 +0200
Message-ID: <c2a80960-f92f-0919-bf82-d5cec74fda09@foss.st.com>
Date: Mon, 3 Apr 2023 10:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Pierre Yves MORDRET <frq08952@lmecxl1060.lme.st.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20230119144030.1805-1-pierre-yves.mordret@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230119144030.1805-1-pierre-yves.mordret@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_05,2023-03-31_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, Reinhold Mueller <reinhold.mueller@emtrion.com>,
 linux-kernel@vger.kernel.org, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/3] YAML validation fixes
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

Hi

On 1/19/23 15:40, Pierre Yves MORDRET wrote:
> Attention: Sender not authenticated
> --------------------------------------------------
> 
> Patches to get rid from DT check errors for STM32MPU Boards but also for Argon and Odyssey.
> 
> ---
>    Version history:
>      v1:
>          * Initial
>      v2:
>          * Update send addresses
> 
> Pierre-Yves MORDRET (3):
>    ARM: dts: stm32: YAML validation fails for STM32MPU Boards
>    ARM: dts: stm32: YAML validation fails for Odyssey Boards
>    ARM: dts: stm32: YAML validation fails for Argon Boards
> 
>   arch/arm/boot/dts/stm32mp157c-ed1.dts            |  9 ---------
>   arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi |  9 ---------
>   arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi   | 10 ----------
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi           |  9 ---------
>   4 files changed, 37 deletions(-)
> 
> --
> 2.17.1
> 

Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
