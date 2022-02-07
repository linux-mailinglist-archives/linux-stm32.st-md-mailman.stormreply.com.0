Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5454AC42D
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 16:46:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C75DC60466;
	Mon,  7 Feb 2022 15:38:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18F9AC60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 15:38:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2177wqw4017916;
 Mon, 7 Feb 2022 11:39:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5fT7c4Mvgn2+ok+STLBdSgiGaFIlSdUaQbBwjLUOJH0=;
 b=i67U6qLJURxlIpLy7BYqlneYLOC7BdWvvYXtnza2KQDmRrcTbYml/pKJc443HWlff3RN
 znakVb4TkS8kPn3g+v49D34loNf2M+X9zzV6th7oqe2eRL4YZQpDgi8616hvuBPGFUK0
 JXY+LqnKaH9bGnw6VuWI9cJnvPynwDiq7K0qaqt92fLzNtiYN25P1fQylixxZuBeSqtq
 T6Yi4MBXokPTOIYgzaVkFKwbcq2zIpVbC6RB/vWgRoQWBnd5oRW69vexYBYaSckmESAS
 ziGP1HcQsDJd7Dv6uIXTP2ewNa7zQDCtOkEtHLBUdGxwgjFiQgRkj6CbgG2RYXFu+uL4 Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e2nfyaveu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 11:39:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 86CCF100034;
 Mon,  7 Feb 2022 11:39:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D6EB215157;
 Mon,  7 Feb 2022 11:39:16 +0100 (CET)
Received: from [10.48.0.252] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 7 Feb
 2022 11:39:15 +0100
Message-ID: <b35ab20d-479f-a5ae-0e43-2b3c03f087e1@foss.st.com>
Date: Mon, 7 Feb 2022 11:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>, Rob Herring <robh+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20220112163226.25384-1-yann.gautier@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220112163226.25384-1-yann.gautier@foss.st.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_03,2022-02-07_01,2021-12-02_01
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/10] ARM: dts: stm32: update sdmmc nodes
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

On 1/12/22 17:32, Yann Gautier wrote:
> This patches series brings updates for SDMMC nodes on STM32MP13
> (max frequency, pins slew-rates, sleep pins, and controller version).
> The sdmmc2 node is also added as STM32MP13 embeds 2 SDMMC controllers.
> 
> The compatible for sdmmc nodes is also updated for both STM32MP13
> and STM32MP15, to align with bootloaders DT, and after arm,pl18x.yaml
> has been updated [1].
> 
> [1] commit 552bc46484b3 ("dt-bindings: mmc: mmci: Add st,stm32-sdmmc2
>      compatible")
> 
> Gerald Baeza (1):
>    ARM: dts: stm32: update sdmmc slew-rate in stm32mp13 pinctrl
> 
> Yann Gautier (9):
>    ARM: dts: stm32: add st,stm32-sdmmc2 compatible on stm32mp151
>    ARM: dts: stm32: add st,stm32-sdmmc2 compatible on stm32mp131
>    ARM: dts: stm32: increase SDMMC max-frequency for STM32MP13
>    ARM: dts: stm32: update SDMMC clock slew-rate on STM32MP135F-DK board
>    ARM: dts: stm32: add sdmmc sleep pins for STM32MP13
>    ARM: dts: stm32: add sdmmc sleep config for STM32MP135F-DK
>    ARM: dts: stm32: update SDMMC version for STM32MP13
>    ARM: dts: stm32: add SDMMC2 in STM32MP13 DT
>    ARM: dts: stm32: add sdmmc2 pins for STM32MP13
> 
>   arch/arm/boot/dts/stm32mp13-pinctrl.dtsi | 81 ++++++++++++++++++++----
>   arch/arm/boot/dts/stm32mp131.dtsi        | 20 +++++-
>   arch/arm/boot/dts/stm32mp135f-dk.dts     |  7 +-
>   arch/arm/boot/dts/stm32mp151.dtsi        |  6 +-
>   4 files changed, 94 insertions(+), 20 deletions(-)
> 

Series applied on stm32-next.

Thanks
alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
