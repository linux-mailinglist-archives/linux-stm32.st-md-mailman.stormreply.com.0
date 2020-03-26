Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B0193D6D
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2020 12:00:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54C15C36B0C;
	Thu, 26 Mar 2020 11:00:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DC3BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2020 11:00:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02QAw3le004718; Thu, 26 Mar 2020 11:59:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ePaRO2xQxOSssih3ATmMumUDQxzntYCKLl5miAQMV5w=;
 b=JH9clXkigdRraWQGXYGOr5OIW5C0DUutbVjb3FjeIpaKChItgfANVt8ZSlPcbAJ29JQF
 pcXwgEF3oq3ZiT6SlQBovqwa4XPGP0NoiabrJ1AzHyhzX0GHTYH3irwUrSjfNk3+j+np
 MT1qeeRo276ThIrrCloKGNcKxcoD8mSyc/Q08WnSeXaDcNLF2dPbyfV++pERS0Cba980
 YiUF7ir7TU7okOhmKfyC+9/kHPHg9eqRHCH3HiiCWeBH5MBY+kRZw76BxYUJOne1rqH5
 W9AZOg+uxLaMXCevPQSgT805s254FyCGJhIvJkehDIav9m5nVL/6W/ykSz11n5fRACKz Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ywappb5e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 11:59:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 84D8F100038;
 Thu, 26 Mar 2020 11:59:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DC9E2A5553;
 Thu, 26 Mar 2020 11:59:48 +0100 (CET)
Received: from lmecxl0889.tpe.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 26 Mar
 2020 11:59:38 +0100
To: Joe Perches <joe@perches.com>, Jiri Slaby <jslaby@suse.cz>, Ohad Ben-Cohen
 <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200324170407.16470-1-arnaud.pouliquen@st.com>
 <20200324170407.16470-3-arnaud.pouliquen@st.com>
 <e458f805-c746-c88e-98f4-d874a7552933@suse.cz>
 <1e4ce821-dd9b-bb04-774b-58a255834cf5@st.com>
 <ec061c30-eace-1df9-fa7b-71a61e5710a2@suse.cz>
 <f97d9dc54178e4344512bc7986265f101f4639c6.camel@perches.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <54d9b379-ba51-b29c-db58-6e305773ee96@st.com>
Date: Thu, 26 Mar 2020 11:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f97d9dc54178e4344512bc7986265f101f4639c6.camel@perches.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-26_02:2020-03-26,
 2020-03-26 signatures=0
Cc: Suman Anna <s-anna@ti.com>, linux-stm32@st-md-mailman.stormreply.com,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 xiang xiao <xiaoxiang781216@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 2/2] tty: add rpmsg driver
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



On 3/26/20 1:01 AM, Joe Perches wrote:
> On Wed, 2020-03-25 at 14:31 +0100, Jiri Slaby wrote:
>> The question was exactly about that: can a compiler optimize it to a
>> bare number or will strlen call remain there?
> 
> $ cat str.c
> #include <string.h>
> 
> int foo(void)
> {
> 	return strlen("abc");
> }
> 
> $ gcc -c -O2 str.c
> $ objdump -d str.o
> str.o:     file format elf64-x86-64
> 
> 
> Disassembly of section .text:
> 
> 0000000000000000 <foo>:
>    0:	f3 0f 1e fa          	endbr64 
>    4:	b8 03 00 00 00       	mov    $0x3,%eax
>    9:	c3                   	retq   
> 
> 
same result with  arm gcc using  -O1 or -Og:

str.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <foo>:
   0:	e3a00003 	mov	r0, #3
   4:	e12fff1e 	bx	lr

So in conclusion replacing sizeof by srlen even if not optimized in -o0, right?

Thanks,
Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
