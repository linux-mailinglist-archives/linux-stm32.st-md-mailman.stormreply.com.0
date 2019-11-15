Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F271FDBB7
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2019 11:50:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7093C36B0B;
	Fri, 15 Nov 2019 10:50:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71197C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 10:50:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFAnPtd001023; Fri, 15 Nov 2019 11:50:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=vbNZvQAxWj5aasRHQhk+/qrLFDSdRYRbFikBMduiqK8=;
 b=SLO8PHw1uy4a+p8zkrQ3TXntGbMRI2YlKVg54MJi1bHZhtSDMVktT2weZh08kqmidMye
 F2MVk+poLx/m4YvuyuSZIlW2PJNcmYMBKklbc4gmx+uRbZSoG1zn1k7hCc2jf2+ZY/LP
 smypEYhvomkyxFCYp2W2A0s9PrrqLzv5k8P7E7XdrLjwn0T5m9N2fxGG4jo84eajGywR
 HezBM2bafiKlt+acJORJ/S4P4rbRQ+yE5M3xo+rrExTdrTZHcaxNLv64QyNN6cM6WxSk
 ncX0Y/17oPxCVbpBdcqWz4IrJS1q2M83qSGekBixm4OFVkK04WPD7Ag973ZTnsO2IQA0 iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psk3hcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 11:50:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4FE86100048;
 Fri, 15 Nov 2019 11:50:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EB652B494A;
 Fri, 15 Nov 2019 11:50:02 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 15 Nov
 2019 11:50:01 +0100
To: Yann Gautier <yann.gautier@st.com>
References: <20191106100938.11368-1-yann.gautier@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <dc5b32b3-4bac-e53e-1fe4-74098231168f@st.com>
Date: Fri, 15 Nov 2019 11:50:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106100938.11368-1-yann.gautier@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_03:2019-11-15,2019-11-15 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] Update sdmmc nodes for STM32MP1
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

On 11/6/19 11:09 AM, Yann Gautier wrote:
> The STM32MP1 SoC embeds 3 instances of the SDMMC internal peripheral.
> The sdmmc2 and sdmmc3 nodes are added in the SoC DT file, as well as
> the required pins configuration.
> The boards DT files are also updated:
> - An eMMC is connected on SDMMC2 on STM32MP157C-ED1 and EV1 boards
> - SDMMC3  can be used on the GPIO expansion pins on EV1 and DK1/DK2
> boards.
> 
> Yann Gautier (4):
>    ARM: dts: stm32: update slew-rate properties for sdmmc1 on stm32mp157
>    ARM: dts: stm32: add sdmmc2 & 3 nodes for STM32MP157 SoC
>    ARM: dts: stm32: enable sdmmc2 node for stm32mp157c-ed1 board
>    ARM: dts: stm32: add sdmmc3 node for STM32MP1 boards
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 200 +++++++++++++++++++++-
>   arch/arm/boot/dts/stm32mp157a-dk1.dts     |  12 ++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts     |  16 ++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts     |  12 ++
>   arch/arm/boot/dts/stm32mp157c.dtsi        |  33 +++-
>   5 files changed, 263 insertions(+), 10 deletions(-)
> 

Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
