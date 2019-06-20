Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724A4D1E5
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2019 17:19:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E734FC078CF
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2019 15:19:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA66AC078CE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 15:19:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5KFHhOE011982; Thu, 20 Jun 2019 17:18:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3awahpLzjIg/zQ8bAq/yq4u/Eajukl1uJeabfahZE1k=;
 b=QE4URSfxjpHaljx4dsJHe7OiqHVN6fRUApZ7Yc2CHBNzWUJ0sELxztHUhoNWPWJA9H+p
 7bAVnFzPrpkMJ3zKoP/vmqvYoJ4dvQ5bE4U89jwhIRfnJy0I9BTc5ljcBwXAxVp35OOo
 etfmfe+F7NIo7hFUzjXFv7uPJfEX03p44gkNNV77syS3TtMiB5Q7hP6BEzSII79JKmfW
 WrkyoyNiAjxyV8RxFpUuCChqDuS3ZJjIL6C3PNr2uosibu4XfNu9UMTZJo7+S7utW3W5
 RegGBa6tbYoq9e3OhzSxlmX92P8iXb18fHvUVSYGxZCyFtNmyGYvv9XKNGyLWikcjlPp lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t78132f08-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 20 Jun 2019 17:18:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC41831;
 Thu, 20 Jun 2019 15:18:03 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8FE02C8C;
 Thu, 20 Jun 2019 15:18:03 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 20 Jun
 2019 17:18:03 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Thu, 20 Jun 2019 17:18:03 +0200
From: Amelie DELAUNAY <amelie.delaunay@st.com>
To: Lee Jones <lee.jones@linaro.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Thread-Topic: [PATCH] mfd: stmfx: Fix an endian bug in stmfx_irq_handler()
Thread-Index: AQHVJT/EzC9etQZAeEm7fd3OYhvByKag8E+AgADT/ICAAJenAIACLrsA
Date: Thu, 20 Jun 2019 15:18:03 +0000
Message-ID: <f0ff1e54-c1b9-4a08-c7ff-2ff545e398c3@st.com>
References: <CAHk-=wgTL5sYCGxX8+xQqyBRWRUE05GAdL58+UTG8bYwjFxMkw@mail.gmail.com>
 <20190617190605.GA21332@mwanda> <20190618081645.GM16364@dell>
 <CAHk-=wghW+AKvRGevUiVWwTqWObygSZSdq6Dz2ad81H73VeuRQ@mail.gmail.com>
 <20190619055816.GF18371@dell>
In-Reply-To: <20190619055816.GF18371@dell>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <18B2C5B8D6D879419D1A363687D100BA@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_11:, , signatures=0
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Fix an endian bug in
	stmfx_irq_handler()
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

On 6/19/19 7:58 AM, Lee Jones wrote:
> On Tue, 18 Jun 2019, Linus Torvalds wrote:
> 
>> On Tue, Jun 18, 2019 at 1:16 AM Lee Jones <lee.jones@linaro.org> wrote:
>>>
>>>> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
>>>
>>> Ideally we can get a review too.
>>
>> Looks fine to me, but obviously somebody should actually _test_ it too.
> 
> Amelie, would you be so kind?
> 

Tested on stm32mp157c-ev1.

Tested-by: Amelie Delaunay <amelie.delaunay@st.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
