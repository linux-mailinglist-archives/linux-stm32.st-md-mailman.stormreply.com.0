Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EF81C72C2
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 16:26:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E81DFC32EB0;
	Wed,  6 May 2020 14:26:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF4F4C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 14:26:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 046ENSKT023761; Wed, 6 May 2020 16:26:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=swRNGJ4RbGMUQlq9a7k5krzyAOQN0sPYlERDwEvsblc=;
 b=BEbv9dVYxy/tkDICJRT9OPE7aywYn9pNG4raP/A4EIJVeDQc9qiBzdm6IEnQUFj7rAFn
 3KbArUOytYDKgQd/gu5SzYJxR8LN45AniW44joCNJLmX4XQiUedJ98nalGUgMqx8Z1VA
 JGkJH83R2xqD+N+CSgo4gObUwS5hDHqdeMTo8vCtqpM1QpscuxHBhXWKoDi/rnrcoIKE
 JB8tYHONzlRTh88mCFkC+RtR7HdatZfnYQsuiP56PsE+n6dEdvWyFQVsi1scaz/vQwsI
 8PNbndrWOBssnGSvDT8NzKNtEDYMdceev8z5e6Q9udqRhKPhcGrHohMhZzLBNgYHhWn4 LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rxmvpke8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 16:26:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6CCB610002A;
 Wed,  6 May 2020 16:26:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F3912B7C1B;
 Wed,  6 May 2020 16:26:40 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 6 May
 2020 16:26:35 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200429163743.67854-1-marex@denx.de>
 <13aabff1-d4d0-7afb-6a57-a8136e35c6a4@st.com>
 <1d9cbde1-2be1-f54e-7c65-202f2bc7e0a9@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <b100645c-32ac-325d-5838-0fab2c93df22@st.com>
Date: Wed, 6 May 2020 16:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1d9cbde1-2be1-f54e-7c65-202f2bc7e0a9@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-06_07:2020-05-05,
 2020-05-06 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 01/12] ARM: dts: stm32: Add alternate
	pinmux for I2C2 pins
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




> All right, thanks.
> 
> btw I had this internal discussion now about handling the combinatorial
> explosion of board DTs here. If we support them all, by the end of the
> lifespan of these devices, we end up with:
> 
> STM32MP15{1,3,7}{a,c,d,f} SoM rev. {0..7}00 on baseboard rev. {0..7}00.
> 
> There won't be every SoM and baseboard revision combination all right.
> But even the amount of SoM options gives me 12 DTs. That is not a low
> number. Does ST have some plan to handle such situation ?

Yes I have the same point in mind. How to maintain all boards ? Should 
we refuse some boards and only keep one as example ?


> I can imagine that U-Boot can patch the DT and enable/disable
> functionality , which could handle the {a,c,d,f} options and reduce the
> amount of DTs. It could possibly also handle the {1,3,7} options.
> 

It is something I discussed with Kevin Hilman at ELCE and sometime with 
Rob on IIRc. We could use u-boot to handle differences between SoC, and 
boards. Technically it's possible but the main issue doing that is,  you 
will hide some updates in your bootloader and then your dtb used by 
kernel will not reflect your dts file. It could be confused for 
customers and users.

> Any other ideas ?

What is for you the main issue ? the number of files to add or how to 
maintain all those files ?

If it is the number of files to add, we can think about several ways:

1-As mentioned above, to only keep kind of reference platforms

2-Have vendor directories in arch/arm/boot/dts (but it's another story 
to make it accepted)

3-Or maybe use DTBO to overwrite some configuration.

If the concern is about how to maintain, maybe I'm wrong but I think 
that with a good split and factorization we could minimize support.

Currently I only those things in mind but nothing really mature.

regards
alex











_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
