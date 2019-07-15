Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8B7683D4
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 09:02:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0614FC56625
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 07:02:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCB17D2A398
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2019 07:02:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6F6uSio030992; Mon, 15 Jul 2019 09:01:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Zl4deGZbQ+vwkjKjMySHruoNEZ/Tdqr9qboU+Ck4czs=;
 b=mNuPpWJUbgOtsdKvOrrjxjRe5FJn4yQ5m9gUfKCWt4Az42LPaH/qFaD6E5SKi5Sr3khE
 P4urEGi0kp9oYCLif+cM3vFABuf0kmRFrSqlwBQD56IM5MGYxFfrAl/VM4NkZMqU5Ka0
 W6bFfGJwZwgrRb8bYKCpUNvf98urVDrhNGBKdGuUSfvc/LqWGob3Pt3N+ltZTwN7Xknz
 vaOPqmF5MasW0iGCW68hvqF4OpaWz0OHHcb8TAsHDMVJbVqFoA2byGwYpVN+3LZQJEec
 bVWGt9WrvuwTOkuLPH63oj6+iboOzdKlQCi4yNn0bcqY4RqPsvilzISC+CYcZL1gGvY4 cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tq52u3xy5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 15 Jul 2019 09:01:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6839A38;
 Mon, 15 Jul 2019 07:01:08 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0FEA515AB;
 Mon, 15 Jul 2019 07:01:08 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 15 Jul
 2019 09:01:07 +0200
Received: from [10.48.0.167] (10.48.0.167) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 15 Jul 2019 09:01:07 +0200
To: Jonathan Cameron <jic23@kernel.org>
References: <1562148496-26789-1-git-send-email-fabrice.gasnier@st.com>
 <1562148496-26789-4-git-send-email-fabrice.gasnier@st.com>
 <20190714171310.1816afe3@archlinux>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <c69cff23-b67e-2aed-f250-c237e9cd4a3d@st.com>
Date: Mon, 15 Jul 2019 09:01:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190714171310.1816afe3@archlinux>
Content-Language: en-US
X-Originating-IP: [10.48.0.167]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-15_02:, , signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] ARM: dts: stm32: add syscfg to ADC
	on stm32mp157c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 7/14/19 6:13 PM, Jonathan Cameron wrote:
> On Wed, 3 Jul 2019 12:08:16 +0200
> Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
> 
>> On stm32mp157c, the ADC inputs are multiplexed with analog switches which
>> have reduced performances when their supply is below 2.7V (vdda by
>> default).
>> Add syscfg registers that can be used on stm32mp157c, to get full ADC
>> analog performances.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> I've applied the patches using this on the assumption this will go via
> the usual SoC route.
> 
> Thanks,

Hi Jonathan,

Many thanks,
Fabrice

> 
> Jonathan
> 
>> ---
>>  arch/arm/boot/dts/stm32mp157c.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
>> index 2dd5162..b9a5b58 100644
>> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
>> @@ -862,6 +862,7 @@
>>  			clocks = <&rcc ADC12>, <&rcc ADC12_K>;
>>  			clock-names = "bus", "adc";
>>  			interrupt-controller;
>> +			st,syscfg = <&syscfg>;
>>  			#interrupt-cells = <1>;
>>  			#address-cells = <1>;
>>  			#size-cells = <0>;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
