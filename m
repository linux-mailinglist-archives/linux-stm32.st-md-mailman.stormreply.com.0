Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B23124E43
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 17:48:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A925EC36B0C;
	Wed, 18 Dec 2019 16:48:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61E73C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 16:48:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIGiM9c017256; Wed, 18 Dec 2019 17:47:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=hotd3mZ8fmPE7JI8P99BBUl8p+25O/Q4/tedj2kCByI=;
 b=C4A8aYSBOwg+vBmlAMX12llGQ//NjCOtQ8FmpbZ5cRUEO+J7tDh0lEZRh0RQZwamV1Ss
 csFAi0hoFqJKK6If4VbfnZfczgr/uYSC6oel6hkEHNwYf+7+Ymn8fVA8IeSr8kX/ZHLG
 0ZHh0MHetHtLeEl7sQaZ39ex2XesHT/BQtakVo/GYf/R+30KlCxOFgt4f5gor7p/2fkx
 qZcxDDx3PeC+Iu9AHR9ooUzcwAd3m+zeSAlC5a2jK3F8pCAL6Yi5bjaoakjwU1BXhYFn
 gUtvFcZkaEJryIJenGvOf0LMwMdL5bP3k6WttTu1d/KKFL8Qp+zGi4qPYm72cG++ChE7 cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvpd1nbpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 17:47:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7141310002A;
 Wed, 18 Dec 2019 17:47:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E07D2B4B01;
 Wed, 18 Dec 2019 17:47:58 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 18 Dec
 2019 17:47:57 +0100
To: Benjamin Gaignard <benjamin.gaignard@st.com>, <mcoquelin.stm32@gmail.com>, 
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
References: <20191218144844.7481-1-benjamin.gaignard@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <17dbe601-ac37-21e1-1cb5-1b7a3167bca1@st.com>
Date: Wed, 18 Dec 2019 17:47:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218144844.7481-1-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_05:2019-12-17,2019-12-18 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/3] Convert STM32 dma to json-schema
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

Hi Benjamin,

On 12/18/19 3:48 PM, Benjamin Gaignard wrote:
> version 2: Only contains rebased dtsi file on top of stm32-next after
> DT diversity patches
> 
> This series convert STM32 dma, mdma and dmamux bindings to json-schema.
> Yaml bindings use dma-controller and dma-router schemas where nodes names
> are verified which lead to fix stm32f746, stm32f743 and stm32mp157 device
> tree files.
> 
> 
> Benjamin Gaignard (3):
>    ARM: dts: stm32: fix dma controller node name on stm32f746
>    ARM: dts: stm32: fix dma controller node name on stm32f743
>    ARM: dts: stm32: fix dma controller node name on stm32mp157c
> 
>   arch/arm/boot/dts/stm32f746.dtsi  | 4 ++--
>   arch/arm/boot/dts/stm32h743.dtsi  | 6 +++---
>   arch/arm/boot/dts/stm32mp151.dtsi | 6 +++---
>   3 files changed, 8 insertions(+), 8 deletions(-)
> 

Series applied on stm32-next.

regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
