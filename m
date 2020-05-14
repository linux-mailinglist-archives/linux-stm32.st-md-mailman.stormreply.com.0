Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1AC1D3187
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 15:42:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C89F9C36B12;
	Thu, 14 May 2020 13:42:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77901C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 13:42:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EDgMxu028132; Thu, 14 May 2020 15:42:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=tD1qvdb0EwmAv9XocfBUyYNcHtOhYgnwwbYe5684NcY=;
 b=lpZCseNN1q8B2O++L5FqZEfrupQp8UmuSICipi2VpYbbXdKqjviuS4uNBmOQ1Qk1/JYn
 FC0+aT7IZOR+0AaKhzk+Ozpgl88d1a5y1MBWH1j0sjx/T8Vy7mAFxLIZkKAuH5DBT24e
 w8vnJeOoFwf7/cYeADMBCKg6OvlIrAm70cghUtpnyO8Px5h4+ovsh1x/0sNyYzBPay55
 GNVpTBzYrzgrxIYjV346YgPOw8M8x1YuBl3tdk9ASS/dhGkQVptEBfcXiG2r4Y/3xJqM
 b1YktOvA+/Pa6WYvOrUBAuOptDbM+z10mLDDQLjERCoYWeW9MwohkWsITtdfWVTKKrAK eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vnbg0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 15:42:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CF2C100034;
 Thu, 14 May 2020 15:42:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA8332BE24D;
 Thu, 14 May 2020 15:42:32 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May
 2020 15:42:27 +0200
To: Benjamin Gaignard <benjamin.gaignard@st.com>, <linus.walleij@linaro.org>, 
 <robh+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <caef6641-b7c2-881a-a331-3d05f6f4bba6@st.com>
Date: Thu, 14 May 2020 15:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513145935.22493-1-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_04:2020-05-14,
 2020-05-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/15] Fix STM32 DT issues on v5.7-rc4
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

Hi Benjamin

On 5/13/20 4:59 PM, Benjamin Gaignard wrote:
> This series fixes issues hight lighted by dtbs_check on STM32 devicetrees.
> The patches has been developped on top of v5.7-rc4 tag.
> 
> Benjamin Gaignard (15):
>    ARM: dts: stm32: remove useless interrupt-names property on stm32f429
>    ARM: dts: stm32: update pwm pinctrl node names for stm32f4
>    ARM: dts: stm32: update led nodes names for stm32f249-disco
>    ARM: dts: stm32: update led nodes names for stm32f469-disco
>    ARM: dts: stm32: remove useless interrupt-names property on stm32f746
>    ARM: dts: stm32: update led nodes names for stm32f429-eval
>    ARM: dts: stm32: update led nodes names for stm32f769-disco
>    ARM: dts: stm32: update led nodes names for stm32f746-eval
>    ARM: dts: stm32: remove useless interrupt-names property on stm32f743
>    ARM: dts: stm32: Update nodes names for stm32h743 pinctrl
>    ARM: dts: stm32: Update nodes names for stm32mp15 pinctrl
>    ARM: dts: stm32: Add missing #address and #size cells on spi node for
>      stm32mp151
>    ARM: dts: stm32: update led nodes names for stm32f746-eval
>    dt-bindings: pinctrl: stm32: Add missing interrupts property
>    dt-bindings: usb: dwc2: Fix issues for stm32mp15x SoC

For dts(i) part, it looks good to me. I let Rob to review before taking 
the whole series.

thanks
alex


> 
>   .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          |  3 +++
>   Documentation/devicetree/bindings/usb/dwc2.yaml                |  6 ++++--
>   arch/arm/boot/dts/stm32429i-eval.dts                           |  8 ++++----
>   arch/arm/boot/dts/stm32746g-eval.dts                           |  8 ++++----
>   arch/arm/boot/dts/stm32f4-pinctrl.dtsi                         |  4 ++--
>   arch/arm/boot/dts/stm32f429-disco.dts                          |  4 ++--
>   arch/arm/boot/dts/stm32f429.dtsi                               |  1 -
>   arch/arm/boot/dts/stm32f469-disco.dts                          |  8 ++++----
>   arch/arm/boot/dts/stm32f746.dtsi                               |  1 -
>   arch/arm/boot/dts/stm32f769-disco.dts                          |  4 ++--
>   arch/arm/boot/dts/stm32h743-pinctrl.dtsi                       | 10 +++++-----
>   arch/arm/boot/dts/stm32h743.dtsi                               |  1 -
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi                       |  6 +++---
>   arch/arm/boot/dts/stm32mp151.dtsi                              |  2 ++
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                         |  2 +-
>   15 files changed, 36 insertions(+), 32 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
