Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6D8302569
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 14:22:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84A5FC5663B;
	Mon, 25 Jan 2021 13:22:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A0E8C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 13:22:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10PDHo7R021408; Mon, 25 Jan 2021 14:22:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RYio32/XADuCDh9xsQeRZ48FrT1zC9Njdms8Qb4Uj9s=;
 b=gCc7aA0Wl0MzH86uU6H2G0UZ19O4+GnYdbw3F7wpNQfifUiWgoB/iGFh2sHJa6Kw7sFT
 WnWko94/0h8aT2wKLTHDjdsep2ZwnjvM3qaxCHFW0wcPDaUPNfO02I8samOXjEfidCqa
 WM1Eo0dP+R16qFNYTOTMzR8jsuj8lyb52nT5S7/Ibnc8xDxyFHtD/JFXIvH0PD+ED2CE
 ltC8x2Bmca1gPJGfUGqhcLF2gGZqmoL7UjB3lghbvqaDscvpjo7qk63v5gMScKC8ZluE
 rr0dsRSq1a2osF7swxiU8wKVkus53blWye9jGJTjVFBe+i6cAqWdG3HdZk3BDQs+LVGG 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjn31kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 14:22:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8AD5A10002A;
 Mon, 25 Jan 2021 14:22:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D15121824D;
 Mon, 25 Jan 2021 14:22:04 +0100 (CET)
Received: from lmecxl0572.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Jan
 2021 14:22:03 +0100
To: Rob Herring <robh@kernel.org>
References: <20210122105101.27374-1-gabriel.fernandez@foss.st.com>
 <20210122105101.27374-14-gabriel.fernandez@foss.st.com>
 <1611324045.701742.674374.nullmailer@robh.at.kernel.org>
From: "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Message-ID: <1e713377-c5e0-fc4f-3f32-d35be4367091@foss.st.com>
Date: Mon, 25 Jan 2021 14:22:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1611324045.701742.674374.nullmailer@robh.at.kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_04:2021-01-25,
 2021-01-25 signatures=0
Cc: Etienne Carriere <etienne.carriere@st.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 13/14] dt-bindings: clock: stm32mp1 new
 compatible for secure rcc
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

Hi Rob,

many thanks i will send a v2.

Best regards

Gabriel

On 1/22/21 3:00 PM, Rob Herring wrote:
> On Fri, 22 Jan 2021 11:51:00 +0100, gabriel.fernandez@foss.st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>>
>> Introduce new compatible string "st,stm32mp1-rcc-secure" for
>> stm32mp1 clock driver when the device is configured with RCC
>> security support hardened.
>>
>> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> ---
>>   Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dt.yaml: rcc@50000000: compatible:1: 'st,stm32mp1-rcc' was expected
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.example.dt.yaml: rcc@50000000: compatible: ['st,stm32mp1-rcc-secure', 'syscon'] is too short
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>
> See https://patchwork.ozlabs.org/patch/1430316
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
