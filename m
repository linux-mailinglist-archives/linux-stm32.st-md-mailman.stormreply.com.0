Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C539C3B8CA
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 18:00:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78E8FCD948B
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 16:00:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80674CD9489
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 16:00:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5AFpjoA009189; Mon, 10 Jun 2019 18:00:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=hL5doPAk7gz0oURE8Qq+x0YUW9RAa/CHoF+4B6z8r2k=;
 b=ENZtCi9dMus0j1k6iHnZpCQ1RX+RtshUvGAffIQ9bro55dGz1QKditKnTUFiuWS0zw8h
 JX6hS18qOmYCUfcopHomtLXHOQeMOQqY57MJ5RH/6w1rW6zRFhLRsMeHVCP9oG2V4f/Z
 LMvh1q8dwxlCthe780b4xdGec8F4Am5dUaBGNol1Xc+KZ5aAJaykZQrtv3wVL85A5Bbm
 C0p5IGHLiZc46sw+L0Gq3sj5cj6TVQGfpbUYL23tDdTC4MeosEjC8HxMUe7brT/ecanB
 GPznEItkcwq2tMWlFGO285T7SY2Pma8heSyluzp7Q7uZfU5kQNMeK4Cxg17UBJft1Dk1 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t02st9vxe-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 10 Jun 2019 18:00:39 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C44BB31;
 Mon, 10 Jun 2019 16:00:38 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9BD9A4F5B;
 Mon, 10 Jun 2019 16:00:38 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 10 Jun
 2019 18:00:38 +0200
To: Erwan Le Ray <erwan.leray@st.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
References: <1559638519-6128-1-git-send-email-erwan.leray@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <e6fecf4c-cb07-4cf7-099a-201b14e90a00@st.com>
Date: Mon, 10 Jun 2019 18:00:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559638519-6128-1-git-send-email-erwan.leray@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-10_07:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/10] STM32 usart power improvements
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

Hi Erwan,

On 6/4/19 10:55 AM, Erwan Le Ray wrote:
> This series delivers power improvements for stm32-usart driver.
> 
> Bich Hemon (4):
>    dt-bindings: serial: add optional pinctrl states
>    serial: stm32: select pinctrl state in each suspend/resume function
>    ARM: dts: stm32: Update pin states for uart4 on stm32mp157c-ed1
>    ARM: dts: stm32: Update UART4 pin states on stm32mp157a-dk1
> 
> Erwan Le Ray (6):
>    dt-bindings: serial: stm32: add wakeup option
>    serial: stm32: add pm_runtime support
>    serial: stm32: Use __maybe_unused instead of #if CONFIG_PM_SLEEP
>    serial: stm32: add support for no_console_suspend
>    ARM: dts: stm32: update uart4 pin configurations for low power
>    ARM: dts: stm32: add wakeup capability on each usart/uart on
>      stm32mp157c
> 
>   .../devicetree/bindings/serial/st,stm32-usart.txt  | 19 ++++-
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi          | 17 +++++
>   arch/arm/boot/dts/stm32mp157a-dk1.dts              |  5 +-
>   arch/arm/boot/dts/stm32mp157c-ed1.dts              |  5 +-
>   arch/arm/boot/dts/stm32mp157c.dtsi                 | 40 ++++++++--
>   drivers/tty/serial/stm32-usart.c                   | 88 ++++++++++++++++++++--
>   drivers/tty/serial/stm32-usart.h                   |  1 +
>   7 files changed, 155 insertions(+), 20 deletions(-)
> 

I'll merge device tree part into stm32-next branch when binding part 
will be accepted.

regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
