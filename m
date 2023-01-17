Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CED4566DC17
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jan 2023 12:17:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E826C65E45;
	Tue, 17 Jan 2023 11:17:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E913C65047
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 11:17:38 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30HAFL7k020822; Tue, 17 Jan 2023 12:17:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=u0kaHI8tNOfKQRFpseaOw/BSe5Zyv8eEs8CWYtEpTic=;
 b=oP5YhL2+bok9XIMnUzy7YEFlwtztXCoS/ViqC333m8urOpeUaxWemfaS99SaRU5cB1aM
 qE4Xi3db6rQT9Y+fhLQYQNUKwxhx34JP+cmvBgvE5Dl7XPjrxEi95N4UATAeAp6tVrly
 HxTZMwNnrYhh7iG90ecEtFGamEAJQ3+fcf0armNMl6yxs5BZRW9VAk0ICpd8/IX3LKLB
 4IEFClBDiiwL5Wnc7xsJDzxanKzplRD5VNdR/RJ6VSefbM4yB4X87S+k1/lF4PgOQ2MY
 UX4u1/3hASBtHs8xQNDXl5gOltgGNukYpmfUiWfWvHQk1spAlt7SVfCry2ZWVxG5/dOt QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n3jpr0b5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 12:17:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18F2210002A;
 Tue, 17 Jan 2023 12:17:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 15F39215BDC;
 Tue, 17 Jan 2023 12:17:20 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 17 Jan
 2023 12:17:19 +0100
Message-ID: <5c742bec-723d-b6dd-2571-a574ebbf3ad5@foss.st.com>
Date: Tue, 17 Jan 2023 12:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20230110091713.444395-1-olivier.moysan@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230110091713.444395-1-olivier.moysan@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_05,2023-01-17_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/3] ARM: dts: stm32: add timers
	support on stm32mp13
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

On 1/10/23 10:17, Olivier Moysan wrote:
> Add STM32 TIM and LPTIM support to STM32MP13 SoCs family.
> Add also support of timers available on DK board RPI expansion connector.
> These timers are configured in the DK board device tree, but let in
> disabled state by default.
> 
> Changes in v2:
> - rebase serie
> 
> Olivier Moysan (3):
>    ARM: dts: stm32: add timers support on stm32mp131
>    ARM: dts: stm32: add timer pins muxing for stm32mp135f-dk
>    ARM: dts: stm32: add timers support on stm32mp135f-dk
> 
>   arch/arm/boot/dts/stm32mp13-pinctrl.dtsi |  60 +++
>   arch/arm/boot/dts/stm32mp131.dtsi        | 557 +++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp135f-dk.dts     |  58 +++
>   3 files changed, 675 insertions(+)
> 
Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
