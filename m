Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B77662B25
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jan 2023 17:26:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65BA8C69048;
	Mon,  9 Jan 2023 16:26:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E33DC03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 16:26:27 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309Cbxb4009933; Mon, 9 Jan 2023 17:26:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xb3CcM66JaqFadPsfmjLS5Ft9J7JyheCnRY1YlLrfx8=;
 b=D2XzfgNt6IbXQBZFDY9f6cvP7pugcjLw8GI+p38ZgWQb9R3Jo5FY0+SeCm47xxf5P+eG
 aG//LdKozgJ//nkkdh+gggbdVhe7q5CdFt8F42HWVjWVKkB7OfhFs0JuT8vAdFXFoD9b
 4PlqrGtPZimTqQ0f3H88oL3soneA31hweaoMQt5H2l3aC5PNjzLNuQyFv+iYDQyqt/tb
 Xb1ECVbcCnzN8I76Ww6LCNm4EwJrnc6JxGDtEtVhgaQbLULCASVu63ojnP8/+Nunw10k
 MaRBSiXQaCXPWNapsAuiWyFFA5dSZrDOsqiPEtWiYyZV+D38w43gI7NzTLOL/tLy7M5n yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mxy1qkrke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 17:26:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 019F810002A;
 Mon,  9 Jan 2023 17:26:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3FD5225921;
 Mon,  9 Jan 2023 17:26:03 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 9 Jan
 2023 17:26:02 +0100
Message-ID: <d9593bd8-f264-a754-80c2-d694d383af88@foss.st.com>
Date: Mon, 9 Jan 2023 17:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: <patrice.chotard@foss.st.com>, <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
References: <20221212085142.3944367-1-patrice.chotard@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20221212085142.3944367-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_10,2023-01-09_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Reinhold Mueller <reinhold.mueller@emtrion.com>, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, Oleksij Rempel <o.rempel@pengutronix.de>,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] Fix qspi pinctrl phandle for stm3mp15
	based boards
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

Hi Patrice

On 12/12/22 09:51, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> qspi_bk1_pins_a and qspi_bk2_pins_a pinctrl phandle has been splitted in
> 2 parts. Only stm32mp157c-ev1.dts has been updated properly.
> 
> Fix qspi pinctrl phandle for other boards which are based on stm32mp15x SoC.
> 
> Patrice Chotard (4):
>    ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp15xx-dhcor-som
>    ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp15xx-dhcom-som
>    ARM: dts: stm32: Fix qspi pinctrl phandle for
>      stm32mp157c-emstamp-argon
>    ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp151a-prtt1l
> 
> Cc: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Reinhold Mueller <reinhold.mueller@emtrion.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> 
>   arch/arm/boot/dts/stm32mp151a-prtt1l.dtsi        | 8 ++++++--
>   arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 8 ++++++--
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi     | 8 ++++++--
>   arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi     | 8 ++++++--
>   4 files changed, 24 insertions(+), 8 deletions(-)
> 

Series applied on stm32-fixes.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
