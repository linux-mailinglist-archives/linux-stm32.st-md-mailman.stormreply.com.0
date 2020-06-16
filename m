Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3441FB230
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 15:34:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C81DC36B11;
	Tue, 16 Jun 2020 13:34:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCD39C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 13:34:26 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GDSuXw015301; Tue, 16 Jun 2020 15:33:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8Zqu22QzzYb9zFOTMzGzv0s5kLJ9DJfwjRSOOCg3wiU=;
 b=Z7Whu9W3CnukVE5BhvVBZNXcK9GFSDhAwpxS9uQ9p4/TF8njS7UNjXvjd1xgU2VoioeP
 3mEqXyvsEmcNmmTgismCPjFb0j3LTytXUn14ub+vJAsVDsKx4dk6C2a9DWqmGeAvmLen
 EcHuxzmqybXM26XYmfaPQawFNIcxDR0jrZIeqqfzN3/pVw30RZXfPrts6le6XblcvFql
 mU2tpNe3/dgOMfeNBg3InjBdNfP/ozRcekII0sVmHoZnW3zXf8RtRyOQmP/Xytfp3ctF
 sZKGPW0ATAfhxaWrJ8lru0AagkKlNqpxBpLPDSdhXGrHJMXSF6Fzg5sK6SbfKKnvTcc8 JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjvyjx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 15:33:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D432110002A;
 Tue, 16 Jun 2020 15:33:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8801F2B663A;
 Tue, 16 Jun 2020 15:33:14 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 16 Jun
 2020 15:33:14 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 16 Jun 2020 15:33:14 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Lee Jones <lee.jones@linaro.org>
Thread-Topic: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to
 json-schema
Thread-Index: AQHV6An9BN3fbiJe+Uu+wK6+EyGnQqgtoL2AgHnzXwCAABZ/gIA0KSeA
Date: Tue, 16 Jun 2020 13:33:14 +0000
Message-ID: <f0e8c6fc-a5fc-b621-1c7e-251bafd2f46c@st.com>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
 <20200226162125.GA13349@bogus> <70ee04c9-4f65-6909-32bc-a379c21a031e@st.com>
 <20200514090025.GE271301@dell>
In-Reply-To: <20200514090025.GE271301@dell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <CB381301BD63D446B3798EA4A53A2647@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_04:2020-06-16,
 2020-06-16 signatures=0
Cc: "mark.rutland@arm.co" <mark.rutland@arm.co>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: mfd: Convert stmfx
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



On 5/14/20 11:00 AM, Lee Jones wrote:
> On Thu, 14 May 2020, Benjamin GAIGNARD wrote:
>
>>
>> On 2/26/20 5:21 PM, Rob Herring wrote:
>>> On Thu, 20 Feb 2020 17:22:46 +0100, Benjamin Gaignard wrote:
>>>> Convert stmfx bindings to json-schema
>>>>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>>>> ---
>>>>    .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
>>>>    Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
>>>>    .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------
>>>>    3 files changed, 124 insertions(+), 144 deletions(-)
>>>>    create mode 100644 Documentation/devicetree/bindings/mfd/st,stmfx.yaml
>>>>    delete mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
>>>>    delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
>>>>
>> Hi Lee, Rob,
>>
>> I haven't been able to found this patch in -next branches, can one of
>> you merge it ?
>>
>> Thanks,
>> Benjamin
>>> Reviewed-by: Rob Herring <robh@kernel.org>
> Rob,
>
> We should agree on a process going forward.  Do you take DT document
> changes or should I?  Up until we moved to YAML formatting, I took
> them but responsibly seems to have migrated over to you since then.
>
> I don't mind either way.
Hi,

Any news on this yaml conversion ?

Benjamin
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
