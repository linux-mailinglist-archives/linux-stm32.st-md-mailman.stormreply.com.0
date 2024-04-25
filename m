Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 819628B1CB5
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 10:22:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2907CC7128B;
	Thu, 25 Apr 2024 08:22:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9392DC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 08:22:14 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P7eqUk026286;
 Thu, 25 Apr 2024 10:22:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=i2xvSKGi0kduhQpp0jPnnSJVZO3fv1dsJElSbwSfge8=; b=Z7
 bNRD/T75coGR0wnv1ucjcEhcgQl/dfOAUul54AdY6QvnqmpAO2Z2gHItsg1gJIP4
 DaeeF6FKZx3FvlLyXaIDVXkY/Xpguo55Kw0taSszYSqEnV03bKGlquTO5AX4gRD3
 yIS2Yh3LmltmXQCVlF48IGxiFb5Qp9EQypAjXV6d3jpw3J8Tcq0d8HqiStEH33tM
 sLpnhh33C8m3j0nXNshfuhKIe3YZM5aZf1OW+gsXCz10g6qJ8tX7mvdIv6ZZQ60V
 RqaDvTZlkId0S/PovorxYAUvhbzOjBqKzrSFxdLxE5NTtKMznzlc2t0PBGTLipuc
 u2wStV67X1JFeylNuRNw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmq90tnf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Apr 2024 10:22:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B41A84002D;
 Thu, 25 Apr 2024 10:21:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92D01210F60;
 Thu, 25 Apr 2024 10:21:18 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 10:21:17 +0200
Message-ID: <c217117d-6388-4230-8afa-d26226bb11ce@foss.st.com>
Date: Thu, 25 Apr 2024 10:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Erwan Leray
 <erwan.leray@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
References: <20231218155721.359198-1-alain.volmat@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20231218155721.359198-1-alain.volmat@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_07,2024-04-25_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/6] spi: stm32: add support for stm32mp25
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

Hi Alain

On 12/18/23 16:57, Alain Volmat wrote:
> This series adds support for spi bus found on the stm32mp25 and add
> all instances within device-trees.
> 
> Alain Volmat (4):
>    spi: stm32: use dma_get_slave_caps prior to configuring dma channel
>    arm64: dts: st: add all 8 spi nodes on stm32mp251
>    arm64: dts: st: add spi3/spi8 pins for stm32mp25
>    arm64: dts: st: add spi3 / spi8 properties on stm32mp257f-ev1
> 
> Valentin Caron (2):
>    dt-bindings: spi: stm32: add st,stm32mp25-spi compatible
>    spi: stm32: add st,stm32mp25-spi compatible supporting STM32MP25 soc
> 
>   .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 +
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  46 ++++++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi        |  88 +++++++++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  14 ++
>   drivers/spi/spi-stm32.c                       | 145 ++++++++++++++++--
>   5 files changed, 280 insertions(+), 14 deletions(-)
> 

DT patches applied on stm32-next.
I added "access-controller" bindings for all SPI nodes.

Cheers
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
