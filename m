Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB381D71BB
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2020 09:26:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B36FEC36B22;
	Mon, 18 May 2020 07:26:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40147C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 07:26:00 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04I7MwVY000489; Mon, 18 May 2020 09:25:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=96Qx9T4l9btbZlYCanjYMz8LWe4TWd5HlYaC0S7keCg=;
 b=DD4gCEFgAjLIf4Sdl2mn9FNSK0ht4/M3toLBzrVmSh+c/wn2sbrhNyuuouB5oe6xHr2D
 cwb64BE6kpGK8tDbyi4Caqw4baabKjaPGqfMWOABIOrR5/aH9PBQYXCIXtSWnBFwHBpZ
 MgIlR8EdstvmG4VKciLF65st+VguxD/4aos+MPgfLC4udP05rP2MDRx73m2MJbMmRvFZ
 CpwS53KCF2gkXYGZrlwfswGv5bbFnPLBH0mAheWn41DooCt6DXktVBSVaaLDgIMmlpaO
 YD+ytoJ5VCnvL7MqBB1pjpDGGdIY9tkM4urxlYIf2EZt/GodnLmq/N/5Om6qUeqvlpDy zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3125xxj4ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 09:25:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6AE310002A;
 Mon, 18 May 2020 09:25:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C12FF2A759E;
 Mon, 18 May 2020 09:25:47 +0200 (CEST)
Received: from SFHDAG3NODE1.st.com (10.75.127.7) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 May
 2020 09:25:47 +0200
Received: from SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86]) by
 SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86%20]) with mapi id
 15.00.1473.003; Mon, 18 May 2020 09:25:47 +0200
From: Erwan LE RAY <erwan.leray@st.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "mani@kernel.org"
 <mani@kernel.org>
Thread-Topic: [Linux-stm32] [PATCH v3 1/2] dt-bindings: serial: Document
 CTS/RTS gpios in STM32 UART
Thread-Index: AQHWLOKqKuTyIkoopEKFBSTOruYjFqitT8sA
Date: Mon, 18 May 2020 07:25:47 +0000
Message-ID: <4ff30338-e704-12bd-80fe-82b8c08e78d9@st.com>
References: <20200420170204.24541-1-mani@kernel.org>
 <20200420170204.24541-2-mani@kernel.org>
 <CAMuHMdVGem_2BGQK4dqZQb3sOd0LZk+RS_z4SvSRcNECEJHdwA@mail.gmail.com>
In-Reply-To: <CAMuHMdVGem_2BGQK4dqZQb3sOd0LZk+RS_z4SvSRcNECEJHdwA@mail.gmail.com>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <A9984B761F26544187A953C83E9086B0@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-18_02:2020-05-15,
 2020-05-18 signatures=0
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: serial: Document
 CTS/RTS gpios in STM32 UART
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

Hi Geert,


On 5/18/20 9:04 AM, Geert Uytterhoeven wrote:
> Hi Mani,
>
> On Mon, Apr 20, 2020 at 7:02 PM <mani@kernel.org> wrote:
>> From: Manivannan Sadhasivam <mani@kernel.org>
>>
>> Document the use of CTS/RTS gpios for flow control in STM32 UART
>> controller. These properties can be used instead of 'st,hw-flow-ctrl'
>> for making use of any gpio pins for flow control instead of dedicated
>> pins. It should be noted that both CTS/RTS and 'st,hw-flow-ctrl'
>> properties cannot co-exist in a design.
>>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
>> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>> @@ -55,6 +61,14 @@ properties:
>>     linux,rs485-enabled-at-boot-time: true
>>     rs485-rx-during-tx: true
>>
>> +if:
>> +  required:
>> +    - st,hw-flow-ctrl
> Perhaps "st,hw-flow-ctrl" should be deprecated, in favor of the standard
> "uart-has-rtscts" property?
> Of course the driver needs to gain support for the latter first.

You're fully right, the patch to deprecate "st, hw-flow-ctrl" and 
introduce generic "uart-has-rtscts" property in the driver is ready and 
will be sent this week on top of Mani patch.


>
>> +then:
>> +  properties:
>> +    cts-gpios: false
>> +    rts-gpios: false
>> +
>>   required:
>>     - compatible
>>     - reg
> Gr{oetje,eeting}s,
>
>                          Geert
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
