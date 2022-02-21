Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B56684BEDCB
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 00:19:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CFB8C60463;
	Mon, 21 Feb 2022 23:19:38 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8918C5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Feb 2022 23:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645485568;
 bh=0PDuuvV4gPmzvIMULIgaTzx2skF6pBwzkA8LWxeWBYs=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=KUCzMnpcOnAEw6LofcvHN2n6O9nA8SpfBb/+00WP5mmE1UE1TN9F8PIEtdM9HnrG4
 Bl/+NuyZqF1vEcspfXWHwWAuCQQdoVGgqMuByjqmtnN+GZSfEBMBrmNno4pNxWvg2G
 SeFATGhhV81438Uk+lFJ38otyPiyNw9/RkPGthWQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.47] ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzhnH-1o99Sj2zKL-00vfHH; Tue, 22
 Feb 2022 00:19:28 +0100
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220216001803.637-1-LinoSanfilippo@gmx.de>
 <20220216001803.637-2-LinoSanfilippo@gmx.de> <YhPcfMtE7xhykgcI@kroah.com>
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <5982f410-9e67-f1b1-7cb5-28330fae306e@gmx.de>
Date: Tue, 22 Feb 2022 00:19:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YhPcfMtE7xhykgcI@kroah.com>
Content-Language: en-US
X-Provags-ID: V03:K1:V7fg3jJoNiscRHi8TUXjkEDwmGMmW0a/kmQgEh78znc/ax6P1vb
 i28qrvOMmhhK7zfnyTDsm28v5kH8fRfMfVac0KOiqSwkvOmc1pm81wVAO7cer9Yow7HG2Pz
 NRcM3Haen6q9cT6psBZ1RsJNuVAnLKPm/Q2ki6RNpg2ECaUC5VroC1EdSFGKmRw5l2pFbZD
 HYLIUdQt7X6TlWwQp9cLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XE1lGwkfLPo=:th4sFlrzQZgUMFeO623FK9
 HcZ2ef+g4gyj82rQbRNko5KKzi8KgnisfK46Xxqs6O/oOEcrZpjzwOn3D549TVo1wQX15H/fD
 IRcssAvGuDQPymZeI05w4LdRBMlgHvDyJkNv53travF/82iMHy0UiD9ZckUgO8jL0Edw5vXMe
 omGCcKWrtvVPkxIeGx7Nm1+t9ZJO7HtPpRgfKIiWJY6obkSxtH6afybmYFum4/wkPdgIWbZUo
 QVP6rlPAt7p2kzQySMV4iOHqyCdc7dRi/SvT/1jegK7NPDCLFD5WGcEPRSIvKro2z5plb1Rjs
 bhGmNnkGtCH7bmpiD/rWjtqijrMsRyLeXhiyu9xf6BAPbCv3j8x40SxoOiorvdNCvmQbnL/N4
 DG1ZE4Loil5uJpVfqXBKv/9ALKp/QND5+eFo6X6A9hg1FKJ9ob+qqw1ySt6mMLs+wjMLUhKF8
 PVjknepEfeui8QsBzEDpz2v3ZW/3KoYDCzi3OPOoqZaKK4bZjgccxpRM+YBScWWlOyl/7wQyt
 WFVCvuzIYVusJ8GtdUwN0PqfvI3hoUAl+MUL4kN2+aSZk0h7hmT2qGs8F9aiFq8k5px0E9RYX
 aCmQe8K4lSPZZE4s2LpLzLTzdSbqCo2UzBcB/YwAJGocDTJASQJAPUiMY07mxKt/lvqxBqpJH
 Lz5vIV2VLzYfDDtAu0HpKVv2cgQNbn6rWqocRH5teJQOYnfNi89AX9tSlY/17Lh9umZnGeyy5
 p0uANROfis4tSq9VwIo8t2FHoUGsOxqF9AIvviSMSNbEDVorsD/t0fIVxjqiBr8c9vrnU0Ou8
 7XXC0GlIyFadUt7EYUgM/Q2jQ7IAcpOQyJUEoMdvfMmZj/h32ukL/I2GFI4jFI+ivetlZ+vdW
 SpM2fnbqoAbsvxOP4DnpKHuNxaz43ITVtyuflt0n8QtlxLJ0vHF1ANsfuxFIjOoKqYOJbPG1O
 RGu43XaqZlHjJVyKWrm9sX970sBYBgdEiJXSUhJ16jy8wHpL8u5Bb7PVW3V1H8BDEqnhHTi5+
 jFTiEPKbtPlPvgCYH8axBCTrdYoJ4iCPFybPQ0P39YN2hTZ4LnhsLCPW91YCCu9gIdV1cIgMo
 xRygjpsitjzL2A=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 festevam@gmail.com, mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 richard.genoud@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 nicolas.ferre@microchip.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, u.kleine-koenig@pengutronix.de,
 jirislaby@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2 1/9] serial: core: move RS485
 configuration tasks from drivers into core
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


Hi,

On 21.02.22 at 19:39, Greg KH wrote:

>> diff --git a/include/uapi/linux/serial.h b/include/uapi/linux/serial.h
>> index fa6b16e5fdd8..859045a53231 100644
>> --- a/include/uapi/linux/serial.h
>> +++ b/include/uapi/linux/serial.h
>> @@ -128,6 +128,9 @@ struct serial_rs485 {
>>  							   (if supported) */
>>  	__u32	delay_rts_before_send;	/* Delay before send (milliseconds) */
>>  	__u32	delay_rts_after_send;	/* Delay after send (milliseconds) */
>> +#define SER_RS485_MAX_RTS_DELAY		100		/* Max time with active
>> +							   RTS before/after
>> +							   data sent (msecs) */
>
> Why is this a userspace value now?  What can userspace do with this
> number?  Once we add this, it's fixed for forever.
>
> thanks,
>
> greg k-h
>


Ok, I think we do not really need to expose it to userspace, since we
clamp the delay anyway if it is too big. I will correct this in the next
patch version.

Regards,
Lino



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
