Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC71818BECA
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2020 18:54:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6605C36B0B;
	Thu, 19 Mar 2020 17:54:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52D91C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 17:54:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02JHm9SF030010; Thu, 19 Mar 2020 18:53:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=xhvicN/AH/49Tg2jHic/L9lkAzHjv3HYlGeap+CFKCw=;
 b=itPC5gsA4ELXAaE5a2xDmNDrb5QWsSt9ffWnFFkd989qno6/JM/OpyoT751KRmhW/tNQ
 71qYW6KimHr6RiyjbBsoHXLoJDqjWKcnirjzDlAMbVwek7QEQhR+Ik69n4vnor64SVHA
 4hCbsJHZMCrK5CPkIrUwH6pb9kkTCOuc5qvL4zMOLcXfH6lhm0OWuEP8vuyvHdiidnt5
 IJfMlkjybMUpN4QYPBsXJ6KsXlqPMPsN9yTboHVu94k1OUH6FGjAsoH+1B/HTR194Xzp
 nZgRYNOWW7u+QfXgNj0UJ9jkZT+EqGp6R266rND85YqQsEPi4/k1HkncEl4vdZmJAqgL 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8etk926-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 18:53:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CBB6100034;
 Thu, 19 Mar 2020 18:53:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0DC32BC7BA;
 Thu, 19 Mar 2020 18:53:22 +0100 (CET)
Received: from [10.211.9.6] (10.75.127.45) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 18:53:21 +0100
To: Rob Herring <robh@kernel.org>
References: <1584543037-32095-1-git-send-email-fabrice.gasnier@st.com>
 <20200319171231.GA17071@bogus>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <3a1474bd-ae64-96f8-d094-545e0e2eff6c@st.com>
Date: Thu, 19 Mar 2020 18:53:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200319171231.GA17071@bogus>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_06:2020-03-19,
 2020-03-19 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: dac: stm32-dac: convert
 bindings to json-schema
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

On 3/19/20 6:12 PM, Rob Herring wrote:
> On Wed, 18 Mar 2020 15:50:37 +0100, Fabrice Gasnier wrote:
>> Convert the STM32 DAC binding to DT schema format using json-schema
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>> ---
>>  .../devicetree/bindings/iio/dac/st,stm32-dac.txt   |  63 ------------
>>  .../devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 110 +++++++++++++++++++++
>>  2 files changed, 110 insertions(+), 63 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
>>  create mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml: $id: relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/iio/dac/st,stm32-dac.yaml#
> 
> See https://patchwork.ozlabs.org/patch/1257568
> Please check and re-submit.

Hi Rob,

Just sent a V2.

I fear it's a copy/paste from another patch:
https://patchwork.ozlabs.org/patch/1223488/
dt-bindings: iio: adc: stm32-adc: convert bindings to json-schema

Should I send a fix for this one also ?

Please advise,
Fabrice
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
