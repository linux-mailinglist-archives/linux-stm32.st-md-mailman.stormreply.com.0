Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 743637AAA3B
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 09:28:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1958CC6C82F;
	Fri, 22 Sep 2023 07:28:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0BE5C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 07:27:59 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38M3QAW4014025; Fri, 22 Sep 2023 09:27:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=0bp+NRqfXUCXmXbjcCA67hlANJccbiq96hkutpc8qzk=; b=Uy
 BO7y8X7Ny0Oo3Hl4YFrV2KyCU0z/yR0RYevIRGRs2hwXLBgAb97CKGEjcJbynK1a
 yhowZJfMJzv/+YfEUnM0YlUzgs32UhfY1695rc510idhaEi+z3F20qZza9gWnY0x
 MvvRGzMHkr9zAeA/MJ6phwNY5G4FqVE+n4wyyh1PQuwdwcoEnOJT3qRJ7I4rw7KB
 YfIll2jUUQwfeBAVF0bRKqNNg4Q6GUestvkrfk3Phv+01NBTVaTJkBweC9l4cuKb
 VfNhAmGCbJDXMPzdGft07iRSTdRL9EaKX2Ay271KgSOyM1EHd/9BGZg5EDeygub8
 b4hjtGSXIlNNwY3vQTgw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t8tt7j2d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 09:27:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5187100051;
 Fri, 22 Sep 2023 09:27:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC56F2105B2;
 Fri, 22 Sep 2023 09:27:44 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 09:27:44 +0200
Message-ID: <614e085b-3c71-a19b-c34b-610501c49aa1@foss.st.com>
Date: Fri, 22 Sep 2023 09:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Yann Gautier <yann.gautier@foss.st.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
References: <20230904132212.157405-1-yann.gautier@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230904132212.157405-1-yann.gautier@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_05,2023-09-21_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Add SD-card support on STM32MP25
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

Hi Yann

On 9/4/23 15:22, Yann Gautier wrote:
> Add sdmmc1 node in SoC DT file, then the pins used on STM32MP257F-EV1
> board, and then the node in board file for SD-card support.
> 
> Yann Gautier (3):
>    arm64: dts: st: add sdmmc1 node in stm32mp251 SoC file
>    arm64: dts: st: add sdmmc1 pins for stm32mp25
>    arm64: dts: st: add SD-card support on STM32MP257F-EV1 board
> 
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 54 +++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi        | 13 +++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 22 ++++++++
>   3 files changed, 89 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
