Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE89C112E1E
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 16:15:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D0E4C36B0B;
	Wed,  4 Dec 2019 15:15:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7AE0C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2019 15:15:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4FBqIn030960; Wed, 4 Dec 2019 16:15:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=mi6sicS/6WmqRtJHRFBWFt0P7fH4La+GpgRzv4TMpAY=;
 b=QeS7NgnxeWH6y67qc90NxJ+EvWDr1Xf5L0eBiExsnYmb+sSqtL9d9+SfAkfNqGXWCwWF
 mjcdnK74mUSiW++ng/bMLVgi5x6LymSxphtsB2Kc8gMF4VFOpC+wWHdMypAWSxJxQcQx
 +zPICe6JBQ3BK/OyoLnI4XOO2gnpDoIdBh+G5foKYSeraKiEk0bULzhzCQKZ90qjkm73
 +WMr8TxWv++JP/0D6VaUM9wjwdEDJ9oJVsexbRt/uWIYm4ENIkBU7LRU2z97o26PU9F3
 r1FZSSQkrmeLI1+Oj3ye3q6GM/csjW4MxyV/cGSD0U2Kf37kySC3K3qpTgX5h8YlXDrv WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkg6knqqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 16:15:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5CFC10002A;
 Wed,  4 Dec 2019 16:15:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9398C2C144D;
 Wed,  4 Dec 2019 16:15:44 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 4 Dec
 2019 16:15:43 +0100
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, <arnd@arndb.de>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
References: <20191129180602.28470-1-alexandre.torgue@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <a88cb8e2-052e-5c1b-9e64-9f937030b3fe@st.com>
Date: Wed, 4 Dec 2019 16:15:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191129180602.28470-1-alexandre.torgue@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
Cc: devicetree@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/6] STM32 DT: Updates for SOC diversity
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

On 11/29/19 7:05 PM, Alexandre Torgue wrote:
> Changes since v1:
>   -According to Arnd comment, move chosen and aliases nodes to dts board file.
> 
> 
> This series updates stm32mp device tree files in order to handle the STM32MP15
> part numbers diversity. STM32MP15 part numbers are built in this way:
> 
> -STM32MP15X: X = [1, 3, 7] for IPs diversity:
>   -STM32MP151 = basic part
>   -STM32MP153 = STM32MP151  + a second CPU A7 + MCAN(x2)
>   -STM32MP157 = STM32MP153 + DSI + GPU
> 
> -STMM32MP15xY: Y = [a, c] for security diversity:
>   -STM32MP15xA: basic part.
>   -STM32MP15xC: adds crypto IP.
> 
> -STM32MP15xxZZ: ZZ = [aa, ab, ac, ad] for packages (IO) diversity:
>   -STM32MP15xxAA: TFBGA448 18x18
>   -STM32MP15xxAB: LFBGA354 16x16
>   -STM32MP15xxAC: TFBGA361 12x12
>   -STM32MP15xxAD: TFBGA257 10x10
> 
> New device tree files are created and some existing are renamed to match with
> this split.
> 
> In this way it is easy to assemble (by inclusion) those files to match with the
> SOC partnumber used on board, and then it's simpler for users to create their
> own device tree board file using the correct SOC.
> 
> For more details:
> 
> See STM32MP151 [1], STM32MP153 [2], STM32MP157 [3] reference manuals:
>   [1] https://www.st.com/resource/en/reference_manual/dm00366349.pdf
>   [2] https://www.st.com/resource/en/reference_manual/dm00366355.pdf
>   [3] https://www.st.com/resource/en/reference_manual/dm00327659.pdf
> 
> Product family:
>   https://www.st.com/en/microcontrollers-microprocessors/stm32-arm-cortex-mpus.html#products
> 
> regards
> Alex
> 
> Alexandre Torgue (6):
>    ARM: dts: stm32: Adapt stm32mp157 pinctrl to manage STM32MP15xx SOCs
>      family
>    ARM: dts: stm32: Update stm32mp157 pinctrl files
>    ARM: dts: stm32: Introduce new STM32MP15 SOCs: STM32MP151 and
>      STM32MP153
>    ARM: dts: stm32: Manage security diversity for STM32M15x SOCs
>    ARM: dts: stm32: Adapt STM32MP157 DK boards to stm32 DT diversity
>    ARM: dts: stm32: Adapt STM32MP157C ED1 board to STM32 DT diversity
>

Series applied on stm32-next.

Regards
Alex


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
