Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763F5B5AFA
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Sep 2022 15:17:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D109BC04004;
	Mon, 12 Sep 2022 13:17:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EAD7C03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 13:17:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C9kN1F026955;
 Mon, 12 Sep 2022 15:16:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DJv34owWXbp7wiiVh54Yb8R/LId3v7mQgsIrzElrNlE=;
 b=LBasRIrueL6b7XRNxyuUr3IiD7719JjzKhV7OCtI57RP61Ck+7qsT4q9bP42g6HGD0oh
 IvWDO69Z0Wa+9wPbqAhXsao8srTV4oP0YLQT/q8PaLeprBFWyHT4YIWkgNqqw6L9ZNl+
 Se39iiZgdX6Ll6B/hQWDUwfLL87VrJ9r3RJeKPjbZXbDIpx96BMtwcqkXpqRk6KwbcAB
 ELyQE0rWxzqdHIKJ/bTuEudUocw4jA8ZmVg6pO04VltDxhKljyxztxMZYn1pPphxAu3Y
 MzdwphUU+zNhyVjlJwXxWyh5LbPTvvQCpmCUE8HhDRDRI4esvoUFsS6AzWBUnk+cvCVO mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjwv261a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 15:16:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED02910002A;
 Mon, 12 Sep 2022 15:16:51 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E0CC122FA29;
 Mon, 12 Sep 2022 15:16:51 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.123) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 15:16:51 +0200
Message-ID: <be86a79c-253e-2054-4cfa-37b950f578d7@foss.st.com>
Date: Mon, 12 Sep 2022 15:16:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 <linux-spi@vger.kernel.org>
References: <20220824082130.21934-1-wsa+renesas@sang-engineering.com>
 <20220824082130.21934-2-wsa+renesas@sang-engineering.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220824082130.21934-2-wsa+renesas@sang-engineering.com>
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_08,2022-09-12_01,2022-06-22_01
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Reinhold Mueller <reinhold.mueller@emtrion.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: argon: remove spidev
	node
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

On 8/24/22 10:21, Wolfram Sang wrote:
> Commit 956b200a846e ("spi: spidev: Warn loudly if instantiated from DT
> as "spidev"") states that there should not be spidev nodes in DTs.
> Remove this non-HW description. There won't be a regression because it
> won't bind since 2015 anyhow.
> 
> Fixes: 16e3e44c5b87 ("ARM: dts: stm32: Add support for the emtrion emSBC-Argon")
> Cc: Reinhold Mueller <reinhold.mueller@emtrion.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Please take it via your platform tree.
> 
>   arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> index ac53ee3c496b..30156b7546ed 100644
> --- a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> @@ -435,12 +435,6 @@ &spi1 {
>   	pinctrl-0 = <&spi1_pins_a>;
>   	cs-gpios = <&gpioz 3 0>;
>   	status = "disabled";
> -
> -	spidev@0  {
> -		compatible = "spidev";
> -		reg = <0>;
> -		spi-max-frequency = <100000>;
> -	};
>   };
>   
>   &timers1 {

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
