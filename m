Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 194311D32C9
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 16:27:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC954C36B12;
	Thu, 14 May 2020 14:27:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3CFCC36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 14:27:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EEMauo025134; Thu, 14 May 2020 16:27:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ZMy1+msU3qIx6LTAwdehKut0UjRI0mnFs7bLiuFarQw=;
 b=sNcsrqpMySOnjxnhIy3SXJeCtls0RULYglzoVyTe2lPMryA/mR83R0Mjx2OpNKtWhn+m
 hShx5z8iGRKy8IqgTJs3vAZPWgEo3PHkn+NL9OwYm1RhVHg56RrMMttdCifW7VwFtOGT
 UecmBcfi5WdglmlC5IYFkPQWnSxseYk/SxFKxFMiBue8vJn8IzJXv69/L8Bu9ioNbB3C
 KW6BtVYQIfzWQnbjX+JKH2uFDJN+fvPpcP0foEqsZWY45dZ27OG0eHThTeQajgrWspTI
 +L7BTu1br9CWGZZ/fYElt+UZZioAkja10o+hMbm9XlICXoCKCWifdA/KU16HVlfPhRg3 KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vnbrhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 16:27:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78F6B100039;
 Thu, 14 May 2020 16:27:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A5692C4DEC;
 Thu, 14 May 2020 16:27:15 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May
 2020 16:27:11 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200513181020.8225-1-marex@denx.de>
 <20200513181020.8225-4-marex@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <6989f6c2-cbaa-5ef3-c540-fdf1260f3bbd@st.com>
Date: Thu, 14 May 2020 16:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513181020.8225-4-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_05:2020-05-14,
 2020-05-14 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V3 4/4] ARM: dts: stm32: Split Avenger96
 into DHCOR SoM and Avenger96 board
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

Hi Marek

On 5/13/20 8:10 PM, Marek Vasut wrote:
> The Avenger96 is in fact an assembly of DH Electronics DHCOR SoM on top
> of an Avenger96 reference board. The DHCOR SoM can be populated with any
> STM32MP15xx. Split the DTs to reflect this such that the common SoM and
> Avenger96 parts are now in stm32mp15xx-dhcor-*dtsi and a specific example
> implementation of STM32MP157A SoM and Avenger96 board is separated into
> stm32mp157a-dhcor-*dts* . The stm32mp157a-avenger96.dts is retained for
> the sake of backward naming compatibility.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Drop the stm32mp157a-dhcor-som.dtsi , as it was just include statements
>      - Add comment about what SoM+Board combination is currently supported
> V3: No change
> ---
>   arch/arm/boot/dts/Makefile                    |   1 +
>   arch/arm/boot/dts/stm32mp157a-avenger96.dts   | 618 +-----------------
>   .../boot/dts/stm32mp157a-dhcor-avenger96.dts  |  38 ++
>   .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 401 ++++++++++++
>   .../arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi |  23 +
>   arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi  | 209 ++++++
>   6 files changed, 675 insertions(+), 615 deletions(-)
>   create mode 100644 arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dts
>   create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcor-io1v8.dtsi
>   create mode 100644 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> 


Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
