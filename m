Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 119E59B4E49
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 16:42:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4846C71290;
	Tue, 29 Oct 2024 15:42:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CDFCC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 15:42:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TC3TTF003918;
 Tue, 29 Oct 2024 16:41:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zHF2No7iOZp8TUj0QQhR03fdH9pB3iJrECaVT7vr+7s=; b=BieAHnzsKphMUEH6
 a/0gYtOzBijwl1r2EFJO4ams2ZnNA4CAEzqbhrWFm6jCw1ZBzgl20tRmeQ7myjpW
 4mP8Fzov9Pr9Lfop1NyLAc26rVw73mX/8kpiOeJP0K1u6sn2pe+PoCOSofMjhZTa
 Gi5GbIn4K8iYYP3aytoKhk2yKdVOcEa3CiNmjdxtg3pFdPP6VN/BVPvI5NESlG47
 Q9UtwuOcglETPhBOhqTv+gvhY8X8U+dOkONbAAQB9wxiAZBNxNun8tVCN4Njiz4N
 S5IYgugpVrh/PCNM4BUiCeLTaw8u13vJXzK8pv2uEoThDn8gjIwmzEIx3YdAZzpS
 TByXEw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42gqacqdhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 16:41:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AEDA040044;
 Tue, 29 Oct 2024 16:40:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA74426B638;
 Tue, 29 Oct 2024 16:39:41 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 16:39:41 +0100
Message-ID: <a483fb50-f978-4e48-b38e-6d79632540f1@foss.st.com>
Date: Tue, 29 Oct 2024 16:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240806120517.406714-1-o.rempel@pengutronix.de>
 <20dc2cd4-7684-4894-9db3-23c3f4abd661@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20dc2cd4-7684-4894-9db3-23c3f4abd661@pengutronix.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] arm: dts: st: stm32mp151a-prtt1l: Fix
 QSPI configuration
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

Hi Ahmad

On 8/7/24 11:38, Ahmad Fatoum wrote:
> Hello Oleksij,
> 
> On 06.08.24 14:05, Oleksij Rempel wrote:
>> Rename 'pins1' to 'pins' in the qspi_bk1_pins_a node to correct the
>> subnode name. The previous name caused the configuration to be
>> applied to the wrong subnode, resulting in QSPI not working properly.
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>>   arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi b/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi
>> index 3938d357e198f..4db684478c320 100644
>> --- a/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp151a-prtt1l.dtsi
>> @@ -123,7 +123,7 @@ flash@0 {
>>   };
>>   
>>   &qspi_bk1_pins_a {
>> -	pins1 {
>> +	pins {
> 
> As you have seen such device tree overriding is error prone and would
> be entirely avoidable if specifying full board-specific pinctrl groups
> was allowed for the stm32 platforms instead of override-and-pray.
> 
> Anyways, there's better syntax for such overriding now:
> 
>    &{qspi_blk1_pins_a/pins}
> 
> which would cause a compilation error if pins was renamed again.
> 
>>   		bias-pull-up;
> 
> There's bias-disable in stm32mp15-pinctrl.dtsi. You may want to add
> a /delete-property/ for that to make sure, it's not up to the driver
> which one has priority.
> 
>>   		drive-push-pull;
>>   		slew-rate = <1>;
> 
> These are already in qspi_bk1_pins_a. If repeating those is ok, why
> not go a step further and just duplicate the pinmux property and stay
> clear of this issue altogether, provided Alex is amenable to changing
> his mind regarding pinctrl groups in board device trees.

I still prefer to have pin configuration defined in pinctrl dtsi file 
and I'll continue like this for ST board. The reason is that we try to 
reuse as much as possible pins when we create a new board and so it is 
easier to maintain if we declare them only one time.

But, I'm not blocked for "other" boards based on STM32 SoC. I mean, if 
it is simpler for you and above all if it avoid issues/complexities 
then, you can declare some pin groups in your board dts file. In this 
case we need to take care of the IO groups label name.

regards
alex

> 
> 
> Cheers,
> Ahmad
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
