Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6745025573E
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 11:13:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2715CC32E90
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 09:13:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7423C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 09:13:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07S97JVx008936; Fri, 28 Aug 2020 11:13:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=iLG15dhrsfK3a5qnX3uOMQK8LyuA+bMvi9d+/C/JDPE=;
 b=04QPLnNqYVtj07QzTGrKWKT46oXeoi1GxGgAMRs+pzFR/OgzajhbFu1C5Mr28e8FcDZ7
 Jq0INYTTa+mrhZWbbN6VfrCE2euLb9duoP0rRHhgjz90wXaAoO6yre/QFXSABxaqgjHu
 hSAaJZmOELgTx9mECjI/eTov+SUB3MYAHzZog2bGOS2NPkGLPzgawtpa0g19QWXATZUu
 vkgecfJ+6Nu5jkeLgZrqQp8fPqSRljVq/YA5EruKXGOvZ6O3zkOlzIHG04CN6QvLIA8p
 dhGsgVRwem1UDBKo3NNix1dSLdb0N1y0QM+jIwBgpOsiYrzBkqJ7OIAXbc86dqGlyC3V vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 332t8g5hhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 11:13:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8CEF4100038;
 Fri, 28 Aug 2020 11:13:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 785522A76E6;
 Fri, 28 Aug 2020 11:13:00 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Aug
 2020 11:12:59 +0200
To: Holger Assmann <h.assmann@pengutronix.de>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ahmad
 Fatoum <a.fatoum@pengutronix.de>
References: <20200807150355.6116-1-h.assmann@pengutronix.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <1a3291ca-daa4-32fc-d4da-15bb9faf73f9@st.com>
Date: Fri, 28 Aug 2020 11:12:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807150355.6116-1-h.assmann@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_05:2020-08-28,
 2020-08-28 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: lxa-mc1: Fix kernel
 warning about PHY delays
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

Hi Holger

On 8/7/20 5:03 PM, Holger Assmann wrote:
> The KSZ9031 PHY skew timings for rxc/txc, originally set to achieve
> the desired phase shift between clock- and data-signal, now trigger a
> kernel warning when used in rgmii-id mode:
> 
>   *-skew-ps values should be used only with phy-mode = "rgmii"
> 
> This is because commit bcf3440c6dd7 ("net: phy: micrel: add phy-mode
> support for the KSZ9031 PHY") now configures own timings when
> phy-mode = "rgmii-id". Device trees wanting to set their own delays
> should use phy-mode "rgmii" instead as the warning prescribes.
> 
> The "standard" timings now used with "rgmii-id" work fine on this
> board, so drop the explicit timings in the device tree and thereby
> silence the warning.
> 
> Fixes: 666b5ca85cd3 ("ARM: dts: stm32: add STM32MP1-based Linux Automation MC-1 board")
> Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
> ---
>   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> index 5700e6b700d3..b85025d00943 100644
> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> @@ -121,8 +121,6 @@
>   			reset-gpios = <&gpiog 0 GPIO_ACTIVE_LOW>; /* ETH_RST# */
>   			interrupt-parent = <&gpioa>;
>   			interrupts = <6 IRQ_TYPE_EDGE_FALLING>; /* ETH_MDINT# */
> -			rxc-skew-ps = <1860>;
> -			txc-skew-ps = <1860>;
>   			reset-assert-us = <10000>;
>   			reset-deassert-us = <300>;
>   			micrel,force-master;
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
