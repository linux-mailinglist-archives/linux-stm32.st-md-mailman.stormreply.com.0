Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 639239B4E05
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 16:31:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A0F7C71290;
	Tue, 29 Oct 2024 15:31:11 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C0F7C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 15:31:04 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCRjnj014244;
 Tue, 29 Oct 2024 16:30:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 R+/H3pqYnfyIgN4uUTX5uKa1/8V4zVKPQSaYRI/UZRA=; b=OVNmKCRko1YzY2kL
 5Z4zEd9acvr9AXfrhBP3j4XJ3vOlg+SkFkMqjbC+p1GB9ZRKKothnz5GqlN3nfJn
 t/lqY+G/f7lpgiWsV7KBtugZaU3rM+eUeqqNA1IOLhTo9WNP+SEgCADKeHTPuR16
 5soEjoVxw5N7CB9ARbgnYVP+md1s4/N6hgsNbCsVHRT32l2l5kfTCXzZGEHgxm75
 tQgg4K3mfTDS1mReIuphJvwgxKfEUKSPcwLNzBONVDEx+dboffGGBRrFnRTZq2qe
 Py9bM3Ptf6tXUgobwCmE7/kDZEgvdWca6f3nqIMMdxRubBEIqEv3jd6Y0a6SLUXB
 aPdH5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42hbchmh24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 16:30:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 10C8540044;
 Tue, 29 Oct 2024 16:29:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2CB95263877;
 Tue, 29 Oct 2024 16:28:47 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 16:28:46 +0100
Message-ID: <b616628b-f9e3-42dd-b5dd-e7aa0235daae@foss.st.com>
Date: Tue, 29 Oct 2024 16:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20241017190933.131441-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241017190933.131441-1-marex@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: Describe M24256E
 write-lockable page in DH STM32MP13xx DHCOR SoM DT
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

On 10/17/24 21:09, Marek Vasut wrote:
> The STM32MP13xx DHCOR SoM is populated with M24256E EEPROM which has
> Additional Write lockable page at separate I2C address. Describe the
> page in DT to make it available.
> 
> Note that the WLP page on this device is hardware write-protected by
> R37 which pulls the nWC signal high to VDD_3V3_1V8 power rail.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: Fix up the M25256E in Subject
> ---
> DEPENDS:
> - https://lore.kernel.org/linux-i2c/20241017184152.128395-1-marex@denx.de/
> - https://lore.kernel.org/linux-i2c/20241017184152.128395-2-marex@denx.de/
> ---
>   arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> index 5c633ed548f37..07133bd82efa6 100644
> --- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> @@ -202,6 +202,12 @@ eeprom0: eeprom@50 {
>   		pagesize = <64>;
>   	};
>   
> +	eeprom0wl: eeprom@58 {
> +		compatible = "st,24256e-wl";	/* ST M24256E WL page of 0x50 */
> +		pagesize = <64>;
> +		reg = <0x58>;
> +	};
> +

You could have sorted nodes by I2C addresses.
Anyway, applied on stm32-next (as dependencies have been applied by 
Bartosz).

Cheers
Alex


>   	rv3032: rtc@51 {
>   		compatible = "microcrystal,rv3032";
>   		reg = <0x51>;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
