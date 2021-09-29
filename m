Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6546F41C340
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Sep 2021 13:18:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1F1DC5A4F7;
	Wed, 29 Sep 2021 11:18:10 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 828F3C597BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Sep 2021 11:18:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 33D548281E;
 Wed, 29 Sep 2021 13:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1632914285;
 bh=dGc4HjvZ/w/JGXHTxOzP8+/A2IJCNhU36kbfb8OcODs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rZUu0BmrtcFmpE05PQ0K8pJq9SLJ0TGzjmO+ozo52scz0uuK5v4SRjPlFeFqMjVLl
 b35mTHB4MYWG0sEzdbpkeY6IozQqvASG0gFd6wbisfsbNjqCi0VafJGrZpvqdeWLiA
 UgSWQ007LgodFu6lg7gUaanPGFZq319PynJAQO+ia1pDsxyzPmapmrkyOcqzr4BoNr
 mMfGfI56taBA4Rn0NlfrmUcF8xd5Owrb9b8Ea4uBtcrcSxtyKllHgpH3GHRJE1lljF
 1AzrsfDa0T4AH69m1Qxpi/nCMFMlu5UEhTrcb5sQPrt/pKmc4OsY8r2ew7ar5wrEf+
 fo2RtkBdT94qQ==
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20210927114553.21843-1-olivier.moysan@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <beb6e7c8-f3c8-fc4e-6017-fea5690b9f33@denx.de>
Date: Wed, 29 Sep 2021 13:18:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210927114553.21843-1-olivier.moysan@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: fix AV96 board SAI2B
 pin muxing on stm32mp15
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

On 9/27/21 1:45 PM, Olivier Moysan wrote:
> Fix SAI2B pin muxing for AV96 board on STM32MP15.
> The label "sai2a-4" is defined twice. Change redundant label to "sai2b-4".
> 
> Fixes: dcf185ca8175 ("ARM: dts: stm32: Add alternate pinmux for SAI2 pins on stm32mp15")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 5b60ecbd718f..b9cc9e0dd4fc 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1235,7 +1235,7 @@
>   		};
>   	};
>   
> -	sai2b_pins_c: sai2a-4 {
> +	sai2b_pins_c: sai2b-4 {
>   		pins1 {
>   			pinmux = <STM32_PINMUX('F', 11, AF10)>; /* SAI2_SD_B */
>   			bias-disable;

This mp1 pinmuxing is a total mess, sigh.

Can you please also fix sai1a-4 and sai1a-5, which should really be 
sai1a-2 and sai1a-sleep-2 ? Same as the sai2b-4 and sai2b-5 should be 
sai2b-2 and sai2b-sleep-2 .

With that, it would be perfect, thank you.

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
