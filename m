Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D11627863D
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2019 09:22:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8230DC35E01;
	Mon, 29 Jul 2019 07:22:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C586AC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2019 07:22:34 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6T7LhjY024911; Mon, 29 Jul 2019 09:22:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=BrcI7CA5OtqOSVGd0MNreUQcr/fWMiNNKrFXwlcauwg=;
 b=HtsVBdFzeQGhEJOx7laE7SNZm50J5WstAiEevq/LZ+iQZW2lYEJQRyJ7banSr5LH7Tih
 l1UDVn1J6MArE0IwuGH9FNg8m0cVOKcsE+JPNFLRiSRkRi+etUFsh3aryLgPNweJmVoh
 sWjNxpxS76Vi386fd0NXzX6oua5xkmoyQHlZIHpsG9nxuLfLev6RffhuIxEXRRG1Gkr5
 UfWnVsNnb9/1FBdBz7ULimDF1HkHIS8HTIxJL+K/tE8JkX7Bkky32lTBmHYahH8rMMNs
 fg1QdsQntZpaATKUX/iNemClh5ygi1MdpW2DVyHDmlHefyZ8Lm+UJ3P0CvvZZZUg4kgR fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0ccwanmu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 29 Jul 2019 09:22:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1ABFD38;
 Mon, 29 Jul 2019 07:22:10 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2D77569B;
 Mon, 29 Jul 2019 07:22:10 +0000 (GMT)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 29 Jul
 2019 09:22:09 +0200
To: Fabrice Gasnier <fabrice.gasnier@st.com>, <thierry.reding@gmail.com>,
 <robh+dt@kernel.org>
References: <1560937925-8990-1-git-send-email-fabrice.gasnier@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <542bd9ed-a93f-fdcc-5dc9-ccaed8a50097@st.com>
Date: Mon, 29 Jul 2019 09:22:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1560937925-8990-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-29_04:, , signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] Add missing pwm-cells to STM32 timers
	PWM
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

Hi Fabrice

On 6/19/19 11:52 AM, Fabrice Gasnier wrote:
> This series adds missing generic 3-cells PWM to STM32 timers dt-bindings,
> PWM driver, and the relevant dtsi files for STM32F4, STM32F7 and STM32MP1.
> 
> Fabrice Gasnier (5):
>    dt-bindings: pwm-stm32: add #pwm-cells
>    pwm: stm32: use 3 cells ->of_xlate()
>    ARM: dts: stm32: add pwm cells to stm32mp157c
>    ARM: dts: stm32: add pwm cells to stm32f429
>    ARM: dts: stm32: add pwm cells to stm32f746
> 
>   Documentation/devicetree/bindings/pwm/pwm-stm32.txt |  3 +++
>   arch/arm/boot/dts/stm32f429.dtsi                    | 12 ++++++++++++
>   arch/arm/boot/dts/stm32f746.dtsi                    | 12 ++++++++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi                  | 12 ++++++++++++
>   drivers/pwm/pwm-stm32.c                             |  2 ++
>   5 files changed, 41 insertions(+)
> 

DT patches applied on stm32-next.

regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
