Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C897F31A3
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Nov 2023 15:52:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1477EC6B476;
	Tue, 21 Nov 2023 14:52:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88D68C6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 14:52:47 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3ALDpuXH012055; Tue, 21 Nov 2023 15:52:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=79KQmYQ1vX36wpYqLr+d8+iTCWO58+gvNG3Lzn1r0Wo=; b=Bu
 PD1gPR4EpQg6dhBbh7/Zimcai3D1MbrZQbK4pEpxdfBfcW9ZBeYiQ/Fif0t3/81b
 hquMFQ459OVo0Oh4utdo9iNGCgtWcWuGqF2YZlZNUe+Q3YQ+XUPElYeqIo4oFqQI
 Pbnsl/Fc9eO+M++03a7VTKeh3KZvBqe8TXAup0Y5owAXgDt88X5mV+uMR+gvx9aQ
 G/gOOgLs1WuduWI7AmqRf4BbsgLT/1RW4u3bAkJq5VtvsyX1WG8w1evyIrQAT/wD
 BR2XK+QboCijLtfMvpF5bBCgr/iXXEfsyX8ezw+6PixezL0ui8mE7LnYmz9uwvZR
 HruEgJ3WUHLHENJJYacg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ugwtcr90s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 15:52:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E3EE10002A;
 Tue, 21 Nov 2023 15:52:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DBA1227F0B;
 Tue, 21 Nov 2023 15:52:30 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 21 Nov
 2023 15:52:29 +0100
Message-ID: <a47efeb5-dc5d-474f-a72c-fffa481f350c@foss.st.com>
Date: Tue, 21 Nov 2023 15:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>, <linux-spi@vger.kernel.org>, 
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20231102193722.3042245-1-ben.wolsieffer@hefring.com>
 <20231102193722.3042245-6-ben.wolsieffer@hefring.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20231102193722.3042245-6-ben.wolsieffer@hefring.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_08,2023-11-21_01,2023-05-22_02
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 5/5] ARM: dts: stm32: add SPI support
	on STM32F746
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

Hi Ben

On 11/2/23 20:37, Ben Wolsieffer wrote:
> Add device tree nodes for the STM32F746 SPI controllers.
> 
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
> ---
>   arch/arm/boot/dts/st/stm32f746.dtsi | 60 +++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 

Applied on stm32-next. Yaml verification done on linux-next.

Cheers
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
