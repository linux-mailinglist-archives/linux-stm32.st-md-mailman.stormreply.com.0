Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F2FFDB7C
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2019 11:37:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89782C36B0B;
	Fri, 15 Nov 2019 10:37:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45D23C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2019 10:37:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFAWQiT028677; Fri, 15 Nov 2019 11:37:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ousFJn9iJUrzpf2LIHmiL0+y3ehrao/jdi7laTUbdv4=;
 b=Vs3dLVaX2bTHsn6YGNPM0+68RyoakepcWmq3eNhFSSgdV4UCC/xpY4dDjI/bXmxpF4zM
 meRNbVUDv9oMMf8rJ79DMRQd2Q90pht4DLRQWmoEbSQ7eI9KV7w6iaIU6tBHSt6AtaZg
 J5rUBmyYvTNokUcDE5LdL6+01ys9D2HJWFnbRfCgMwaKscQR5yLFjkbya2wMHSWAdzUx
 cJnwS6G+mRNWaU41VOdHp6K8oX8OxH2MEGVGg1iVwSz2NgfxkhVW796GFXunR23RQIdT
 7f3zOQRXeg4VfwUICH90euox84qSjKeu5GpQXvcyQ5ZSJBAi31H6Nltdma6ch9uYJ8V+ AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w7psfkmmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 11:37:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA686100034;
 Fri, 15 Nov 2019 11:37:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B7FA2B3F80;
 Fri, 15 Nov 2019 11:37:39 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 15 Nov
 2019 11:37:39 +0100
To: Fabrice Gasnier <fabrice.gasnier@st.com>
References: <1572958341-12404-1-git-send-email-fabrice.gasnier@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <afba0f85-b7db-41de-f6f6-bcff1be1b0c0@st.com>
Date: Fri, 15 Nov 2019 11:37:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572958341-12404-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_02:2019-11-15,2019-11-15 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] Update PWM support on stm32mp157
	boards
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

Hi Fabrice

On 11/5/19 1:52 PM, Fabrice Gasnier wrote:
> This series update PWM support on stm32mp157c-ev1 and stm32mp157a-dk1
> boards, e.g. add pinmuxing and use them in board device-tree.
> - Add PWM sleep pins that can be used on stm32mp157c-ev1 board
> - Add PWM pins that can be used on stm32mp157a-dk1 board
> - Add PWM pinctrl sleep state on stm32mp157c-ev1 board
> - Add PWM support on stm32mp157a-dk1 board
> 
> Fabrice Gasnier (4):
>    ARM: dts: stm32: add pwm sleep pin muxing for stm32mp157c-ed1
>    ARM: dts: stm32: add pwm pin muxing for stm32mp157a-dk1
>    ARM: dts: stm32: add pwm sleep pins to stm32mp157c-ev1
>    ARM: dts: stm32: add support for PWM on stm32mp157a-dk1
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 99 +++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157a-dk1.dts     | 85 ++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts     |  9 ++-
>   3 files changed, 190 insertions(+), 3 deletions(-)
> 

Series applied on stm32-next. I just rename patch1 to be more coherent 
with your explanation done in cover letter.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
