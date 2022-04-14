Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB76500CE6
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Apr 2022 14:17:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88EE2C6049C;
	Thu, 14 Apr 2022 12:17:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44FD6C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 12:17:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23E7Qc7l001962;
 Thu, 14 Apr 2022 14:17:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9lS9iIV+KOyeznWXLU/+PFYSNVvJsgPO8cF8Hhb/0RQ=;
 b=RpocIrDBEpyX48SquStLyCMt2/rW2Z8Ys0WHvNW8LgCmUDlupMB6LSCZeWDgwhzmzTyf
 //NATfuswH45y2PrpCe3hSdFAJMnKRccc7FJBoSBH/uqFbIJOt1Z/ib/b68arpfI0ofn
 sCEKOx4BvBG+rdXeJpjsEcRSq8NNHPTUJoPif98nTE3EdIlqFJmgr2khBocSZwh6gRl1
 iSDyq12bbpxEefYS9t1Y05h9Gd/K/jt2E4InkUlUcE8sPiwnNm2HFB61zwBH+SMaMzje
 9T9imW+qB6nEvI4J7pmMy7wA6rkvAWnojAnzbVknfWxq9WFfM56oKQK75k6u/qJDD3gU EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb74ymh5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 14:17:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 030E910002A;
 Thu, 14 Apr 2022 14:17:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEF84220FB6;
 Thu, 14 Apr 2022 14:17:05 +0200 (CEST)
Received: from [10.201.20.168] (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 14 Apr
 2022 14:17:05 +0200
Message-ID: <b29dda44-1596-0456-7331-00012d740f06@foss.st.com>
Date: Thu, 14 Apr 2022 14:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220408122636.505737-1-valentin.caron@foss.st.com>
 <20220408122636.505737-4-valentin.caron@foss.st.com>
 <CAMuHMdWD8fxeqPUaT_CwnYdq02aaTsnQM_G-YyOGWooS5epCeQ@mail.gmail.com>
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <CAMuHMdWD8fxeqPUaT_CwnYdq02aaTsnQM_G-YyOGWooS5epCeQ@mail.gmail.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_04,2022-04-14_01,2022-02-23_01
Cc: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 3/3] serial: stm32: add earlycon support
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

On 4/11/22 16:59, Geert Uytterhoeven wrote:
> Hi Valentin,
>
> On Fri, Apr 8, 2022 at 3:14 PM Valentin Caron
> <valentin.caron@foss.st.com> wrote:
>> Add early console support in stm32 uart driver.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> Thanks for your patch!
>
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -1264,6 +1264,12 @@
>>                          address must be provided, and the serial port must
>>                          already be setup and configured.
>>
>> +               stm32,<addr>
>> +                       Use early console provided by ST Microelectronics
>> +                       serial driver for STM32 SoCs. A valid base address
>> +                       must be provided, and the serial port must already
>> +                       be setup and configured.
> Why do you need this parameter?
>
> Given this driver uses DT, can't it figure out the serial port address
> from chosen/stdout-path?
>
> +OF_EARLYCON_DECLARE(stm32, "st,stm32h7-uart", early_stm32_h7_serial_setup);
> +OF_EARLYCON_DECLARE(stm32, "st,stm32f7-uart", early_stm32_f7_serial_setup);
> +OF_EARLYCON_DECLARE(stm32, "st,stm32-uart", early_stm32_f4_serial_setup);
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

Hi Geert,

I took the example of other serial drivers.
Both methods work (with earlycon/stdout-path and with 
earlycon=stm32,0xXXXXXXX)
but your right, the second will probably never used on this driver.

Should I remove it ?

Thanks,
Valentin

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
