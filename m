Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8693E64A065
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Dec 2022 14:24:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46AF8C65E78;
	Mon, 12 Dec 2022 13:24:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD839C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 13:24:40 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B388D84D70;
 Mon, 12 Dec 2022 14:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670851480;
 bh=ByugvTB2TdD9rhs8DFOD2UNRwsHQ+Fwc4kOKwPPfwr4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VQWdRaTfiV38yMRIHxVMtDuuJWSFn+RlcDFwqCkKkB0bXpHT/qcBbnYCYQShghKA6
 FNRa3XAg/ZJ4jwLqaUuRGxlhu4p9FxEJ5WWQei5o1VgvQLfPEgm93jR9wpGxpzYftQ
 vM24hYkUpcM8C1Yf1PZW438WYHmw9Z2PcJ2fxoXE7OElL4ZVHkpwehWc6F2JPej1YA
 8B480VZ7yM1ykqR+bUJgVnXa7LqHM2b1f3Jd2VnpCFWYeNlxVsRjnjUlAM0tDYHk9o
 qxYgjWbY5bXu920z8lcHZlQi8/tDfjzRk/bx93zucyYsoezW4kMq4bXWL0ZewId2/C
 JXrVw7RV+cZug==
Message-ID: <7e9301a5-a246-9779-39c7-9f2125218c30@denx.de>
Date: Mon, 12 Dec 2022 14:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: patrice.chotard@foss.st.com, robh+dt@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alexandre.torgue@foss.st.com
References: <20221212085142.3944367-1-patrice.chotard@foss.st.com>
 <20221212085142.3944367-2-patrice.chotard@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221212085142.3944367-2-patrice.chotard@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] ARM: dts: stm32: Fix qspi pinctrl
 phandle for stm32mp15xx-dhcor-som
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

On 12/12/22 09:51, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Chip select pinctrl phandle was missing in several stm32mp15x based boards.
> 
> Fixes: ea99a5a02ebc ("ARM: dts: stm32: Create separate pinmux for qspi cs pin in stm32mp15-pinctrl.dtsi)
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> index 134a798ad3f2..bb40fb46da81 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> @@ -247,8 +247,12 @@ &pwr_regulators {
>   
>   &qspi {
>   	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a>;
> -	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a>;
> +	pinctrl-0 = <&qspi_clk_pins_a
> +		     &qspi_bk1_pins_a
> +		     &qspi_cs1_pins_a>;
> +	pinctrl-1 = <&qspi_clk_sleep_pins_a
> +		     &qspi_bk1_sleep_pins_a
> +		     &qspi_cs1_sleep_pins_a>;
>   	reg = <0x58003000 0x1000>, <0x70000000 0x200000>;
>   	#address-cells = <1>;
>   	#size-cells = <0>;


Splitting the pins makes sense indeed.

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
