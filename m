Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F40184806
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2020 14:26:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31F0EC36B0E;
	Fri, 13 Mar 2020 13:26:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F143C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2020 13:26:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02DDNQfp026519; Fri, 13 Mar 2020 14:26:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=MiS/taC8So8EgjWNAwucGO9VM7ZZlVzG70mkM5pYJpE=;
 b=spfw+RC7iVY3pH1Zc2bxHY7DIhn9dsegfmdsy0MInvl5YCjqT0lsYNjIBtyqe1/Ua1C1
 py5JSfE1tBtg3OqRhcJ5YYz7cFzrSAB9AW+An4wE8MU+Y/7EkFWFmdWEXvjJ3LgYSqEh
 pxne4Td8EORVkDIBCITKw7viEiwovcxKOrdVsyDDD2YBaOopqvUdFRvOwAZBduPUj5xQ
 v19nxTXWn2BYdCdsye0veZ5Rx+haIk48p3t2u6CH/0HAJg773uPPx4s/RHFP1s1KV5p4
 /L/NkzZFwoEsp9ed9iHnjC10oXFQZh28fkbnD0C+Bm3F3fwJ/qFRY0jyuf0W0PQemw3I lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yqt8190f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 14:26:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C912F10002A;
 Fri, 13 Mar 2020 14:26:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 978E82A9047;
 Fri, 13 Mar 2020 14:26:33 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 13 Mar
 2020 14:26:32 +0100
To: Yann Gautier <yann.gautier@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20200304080956.7699-1-yann.gautier@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <6d4fb1e7-f134-1f92-242d-93054a334139@st.com>
Date: Fri, 13 Mar 2020 14:26:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304080956.7699-1-yann.gautier@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_05:2020-03-12,
 2020-03-13 signatures=0
Subject: Re: [Linux-stm32] [PATCH 0/3] Update SDMMC nodes on STM32MP1 boards
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

On 3/4/20 9:09 AM, Yann Gautier wrote:
> This patchset updates the sdmmc nodes for STM32MP1.
> For SD cards nodes, the cd-gpio property is used instead of broken-cd,
> and the disable-wp property is added.
> The last patch corrects the vqmmc regulator for eMMC on ED1/EV1 boards.
> 
> Yann Gautier (3):
>    ARM:dts: stm32: add cd-gpios properties for SD-cards on STM32MP1
>      boards
>    ARM: dts: stm32: add disable-wp property for SD-card on STM32MP1
>      boards
>    ARM: dts: stm32: use correct vqmmc regu for eMMC on stm32mp1 ED1/EV1
>      boards
> 
>   arch/arm/boot/dts/stm32mp157a-avenger96.dts | 3 ++-
>   arch/arm/boot/dts/stm32mp157c-ed1.dts       | 5 +++--
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi      | 3 ++-
>   3 files changed, 7 insertions(+), 4 deletions(-)
> 

Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
