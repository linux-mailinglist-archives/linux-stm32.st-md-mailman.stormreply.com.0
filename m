Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C68AF411068
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Sep 2021 09:43:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76C8BC5A4D0;
	Mon, 20 Sep 2021 07:43:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 425CAC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 07:43:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18K098xl022500; 
 Mon, 20 Sep 2021 09:43:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oH4D/HPpaxuvzZMHzMZBaGtDooA6Q+t7sSJkEid2Q98=;
 b=nYJy/MWmrk2/0hZdrqkhcXqWUw4Go8I084uP5DybUyZxoMp8DpKHNr0sEjmO7Sib9tow
 PID399KTk0tKbfyr3GAWJtaZojcaup8EYUdyeKoao+rUFoDhsuMpNs7/rAxZu/bCilxP
 Xmir32mFK2WqizgICJaAhehcMI3tWCwE4klb0mTr9KkG+6xZcYwkTs3MfWwNgDXjrWzu
 UxxJRwCKCZ1csUcn9LvZNtBGMzf6PuoHq26esV7FGk6qx8jsKiMV0RLQ2h2PB2O389eB
 A8FM7xHzAsCIYBgGvDYE4ychRUA6HCYYP+6qVCXBAaW4kJhTjHCMugbQ10sPIllVxwyu Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b6fgqhhv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 09:43:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 942FF10002A;
 Mon, 20 Sep 2021 09:43:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8AD822128D5;
 Mon, 20 Sep 2021 09:43:26 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep
 2021 09:43:26 +0200
To: Grzegorz Szymaszek <gszymaszek@short.pl>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Marcin
 Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <YSepFyt8o+5lAsrA@nx64de-df6d00>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <0ac8725b-b3b9-7c9b-bb88-70e586092c09@foss.st.com>
Date: Mon, 20 Sep 2021 09:43:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSepFyt8o+5lAsrA@nx64de-df6d00>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_03,2021-09-17_02,2020-04-07_01
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: set the DCMI pins on
	stm32mp157c-odyssey
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

On 8/26/21 4:45 PM, Grzegorz Szymaszek wrote:
> The Seeed Odyssey-STM32MP157C board has a 20-pin DVP camera output. The
> DCMI pins used on this output are defined in the pin state definition
> &pinctrl/dcmi-1, AKA &dcmi_pins_b (added in mainline commit
> 02814a41529a55dbfb9fbb2a3728e78e70646ea6). Set these pins as the default
> pinctrl of the DCMI peripheral in the board device tree.
> 
> The pins are not used for any other purpose, so it seems safe to assume
> most users will not need to override (delete) what this patch provides.
> status defaults to "disabled", so the peripheral will not be
> unnecessarily started. And the users who actually intend to make use of
> a camera on the DVP port will have this little part of the configuration
> ready.
> 
> Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
> ---
>   arch/arm/boot/dts/stm32mp157c-odyssey.dts | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey.dts b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
> index be1dd5e9e744..554f5d3bcdc3 100644
> --- a/arch/arm/boot/dts/stm32mp157c-odyssey.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
> @@ -22,6 +22,12 @@ chosen {
>   	};
>   };
>   
> +&dcmi {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&dcmi_pins_b>;
> +	pinctrl-1 = <&dcmi_sleep_pins_b>;
> +};
> +
>   &ethernet0 {
>   	status = "okay";
>   	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
> 

Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
