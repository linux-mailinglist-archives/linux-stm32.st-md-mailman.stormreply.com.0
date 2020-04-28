Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6801BBEB2
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2020 15:14:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFB04C36B0C;
	Tue, 28 Apr 2020 13:14:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CADFC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 13:14:06 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SDChAB020530; Tue, 28 Apr 2020 15:13:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=lacSSkWzlQgfEqOpGzNZ5KMynxTMC2Ry6JNMtvAjEgo=;
 b=u3V7ADK5t6k/7/qA6ArL15iaaSyWdIzGLKSd7sRrxzaK/T+LY5qlT5NV0+/gLJUOGcJ+
 7wzM/WyZ7ffuuxXCDl54FjdOsCmqULKzBRmIdvdnWIb9AJEwjcS4zOi1Q2c/fNHTR1Vk
 eLojP+Ascrbi66Yb6ZYVlQaiGOg/XVAhBxWqlq6ABmTnSzUp1dok0i1CHNXNEfXg1BCv
 oRQq9HtRcKuntWPAlO2LYdxDmqtwUIKx40yqkU0pFbPJVBxfD7Ob3iIsqjztRoxDAVPC
 9ig1xxcqZQeSYGjCnHVOTRKzvM/Tck4hvwUR8AHvMTLJmGiNmXWPuGzHsqFNRrdStTJn 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j5v5r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 15:13:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EFECD10002A;
 Tue, 28 Apr 2020 15:13:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF0862B8A0A;
 Tue, 28 Apr 2020 15:13:45 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Apr
 2020 15:13:45 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 28 Apr 2020 15:13:45 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Linus Walleij <linus.walleij@linaro.org>
Thread-Topic: [PATCH 1/5] dt-bindings: bus: Add firewall bindings
Thread-Index: AQHWFxpQ9gVgCvdMT0SVViT5CkNk0KiOT0yAgAAeqAA=
Date: Tue, 28 Apr 2020 13:13:45 +0000
Message-ID: <13b16e13-690b-ad3f-a800-28c7805cbb96@st.com>
References: <20200420134800.31604-1-benjamin.gaignard@st.com>
 <20200420134800.31604-2-benjamin.gaignard@st.com>
 <CACRpkdatGwWyruTLC=+BUtnunvqyxnXAYDhcHqy26oeud8Bs1w@mail.gmail.com>
In-Reply-To: <CACRpkdatGwWyruTLC=+BUtnunvqyxnXAYDhcHqy26oeud8Bs1w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <4C34B4DE90D8EF4C901A2C48542A843B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_09:2020-04-28,
 2020-04-28 signatures=0
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: bus: Add firewall
	bindings
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



On 4/28/20 1:24 PM, Linus Walleij wrote:
> Hi Benjamin,
>
> On Mon, Apr 20, 2020 at 3:48 PM Benjamin Gaignard
> <benjamin.gaignard@st.com> wrote:
>> Add schemas for firewall consumer and provider.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> +$id: http://devicetree.org/schemas/bus/stm32/firewall-consumer.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Common Bus Firewall consumer binding
>> +
>> +maintainers:
>> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> This really needs a description: to tell what is going on and what
> these firewalls
> are for and how they are supposed to work.
Hi Linus,

Does the following description sound good for you:
Firewall properties provide the possible firewall bus controller 
configurations for a device.
Bus firewall controllers are typically used to control if a hardware 
block can perform read or write operations on bus.
The contents of the firewall bus configuration properties are defined by 
the binding for the individual firewall controller device.
The first configuration 'firewall-0' or the one named 'default' is 
applied before probing the device itself.

Regards,
Benjamin
>
> I suppose just a bit of cut'n'paste from the cover letter :D
>
> Otherwise it looks good to me.
>
> Yours,
> Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
