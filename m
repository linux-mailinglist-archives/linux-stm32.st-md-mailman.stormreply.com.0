Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA89603FD
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 10:08:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42D66C6DD9A;
	Tue, 27 Aug 2024 08:08:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96FADC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 08:08:25 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R7NZnX002527;
 Tue, 27 Aug 2024 10:08:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NL0vfsDaZi+n7IXnnxL961mLfvdpI9ZZJJiAuUY0CU8=; b=oK+P+wyRw6FWOfoE
 ii3HFisp1T+BZcECPD9QcTmWQAnw0oAdYT+ELLEbd2HwfVDIg7dqla3qthTTlFDn
 9dHgJfiS8GlyJMKotw2TmRX8VLsA6NXdw5Vp0hUnHbt95dJ7cvqsNkTTe8JSlqJ3
 ilBOB9iLUYx3zQ8pltIC2PiQLRKfPPRkVT4ih9SmavhWveUdmAzzFkRyAkUJDsIg
 3Vw5npBP4l3po35kbKOg4jkMJke1iHgIvabfPlrSXmv9OrBF/NqfqrM7/Ub5Obe3
 fZV9bmY/1mm9Fkq5GKQXAbp2Zl9HrzxP2GDbbFfvPdDpSI9/fSwEZKZY5gub+8z+
 Vw8oWQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 419ac886r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2024 10:08:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2089540048;
 Tue, 27 Aug 2024 10:08:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C12A724DCC5;
 Tue, 27 Aug 2024 10:07:11 +0200 (CEST)
Received: from [10.252.31.50] (10.252.31.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 27 Aug
 2024 10:07:10 +0200
Message-ID: <8a13fd32-4bc4-4711-bf6b-7e0ce2e938ec@foss.st.com>
Date: Tue, 27 Aug 2024 10:07:10 +0200
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
X-Originating-IP: [10.252.31.50]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_05,2024-08-26_01,2024-05-17_01
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

Hi

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

You can create your own pin group in stm32mp15-pinctlr.dtsi. What is the 
issue ? Do I miss something ? It will avoid to overwrite an existing 
configuration

regards
alex


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
> 
> 
> Cheers,
> Ahmad
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
