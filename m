Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0B654E5D9
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 17:19:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83FF2C56630;
	Thu, 16 Jun 2022 15:19:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB878C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 15:19:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GBen9b012447;
 Thu, 16 Jun 2022 17:19:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=u2DOIgy6ruypIGVOsxjaBHKJnTchni+PYTY7P+u1ssM=;
 b=ISxykwuLS8UH+Z11wmARfLO/TxTFd7vz6+HaJHTCiCOuilxCa0QyUCojYgGaQXQdTH69
 r22bPTHqFE5saXhmYWkecOWJPvdXQLdA2AAiCSnrBLL/FPGo4fuJ1suLBTpE29483ElQ
 VTO40Iu4HMM2xT3Qe3lasnSVr5TqhFacFQp2n6HWJ5zme0qHsqpE2JFjk4TNhs85RVhw
 XHHXuI/+h38Xw1Za1lsjTzwd673/w6q7rDwwlW0vyl8SJiw1m/KuUNceAiLMYyGWbAvT
 /dTOxYr/8MiULCbZo2fby8SqAEPjlJQ4hakDQDZn9hQFAfYNdQHzt/4yedXPSuQN/+1N Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gmjd2as3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jun 2022 17:19:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C630B10002A;
 Thu, 16 Jun 2022 17:19:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2CAA22176B;
 Thu, 16 Jun 2022 17:19:03 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 16 Jun
 2022 17:19:03 +0200
Message-ID: <ec0632d6-82dc-f458-f7ba-c7db5b7ee5d8@foss.st.com>
Date: Thu, 16 Jun 2022 17:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Kegl Rohit <keglrohit@gmail.com>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <CAMeyCbhVim1AxYGD76yezzkfx6+cXrdpGOOfgPYhB4p7yPtdWQ@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CAMeyCbhVim1AxYGD76yezzkfx6+cXrdpGOOfgPYhB4p7yPtdWQ@mail.gmail.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_12,2022-06-16_01,2022-02-23_01
Subject: Re: [Linux-stm32] STM32MP151A sysfs
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

Hi Kegl

On 6/15/22 07:41, Kegl Rohit wrote:
> Hello!
> 
> I could notice following issue with kernel version 5.10.61:
> Exporting GPIO PB12 and PD12 via sysfs triggers a kernel ERROR.
> After the error happend the gpio still got exported and seem to function.
> 
> Both Pins are unclaimed:
> grep -e PB12 -e PD12
> /sys/kernel/debug/pinctrl/soc\:pin-controller@50002000/pinmux-pins
> pin 28 (PB12): UNCLAIMED
> pin 60 (PD12): UNCLAIMED
> 
> root@dev:/sys/class/gpio# echo 60 > export
> root@dev:/sys/class/gpio# echo 28 > export
> [   30.467370] stm32mp157-pinctrl soc:pin-controller@50002000: irq
> line 12 already requested.
> 
> The order does not matter:
> root@dev:/sys/class/gpio# echo 60 > export
> root@dev:/sys/class/gpio# echo 28 > export
> [   20.768493] stm32mp157-pinctrl soc:pin-controller@50002000: irq
> line 12 already requested.
> 
> This is the dev_err code part:
> https://github.com/STMicroelectronics/linux/commit/8eb2dfee9fb1277f635ce369ef8669df0ec421bc#diff-549d83503a258940ffa6617dbbf4859d463fcac94f376b45b1744d243ffe9b16R381
> 
> Seems that gpio sysfs requests an IRQ every time and there is some
> shared IRQ limitation which is not implemented / handled yet.
> 
> Can someone reproduce this? Maybe it is only a usage / kernel /
> devicetree setup error by me...
> Or is this a STM32MP1 limitation? gpio sysfs bug with STM32MP1? ...
> 

I just do the test on my DK2 board. I'm not able to reproduce (even if I 
add a gio-keys using the EXTI line 12).

Which STM32MP151 do you use ?

regards
Alex



> 
> Thanks in advance.
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
