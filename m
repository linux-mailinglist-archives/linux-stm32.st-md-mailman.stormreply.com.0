Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 530534E1913
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Mar 2022 01:01:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2935C60462;
	Sun, 20 Mar 2022 00:01:22 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E982BC5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Mar 2022 00:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647734472;
 bh=hFobiD0Av9I4hKkI1kP4GGFNq/s/44RpeMZwSfBgc3c=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=PqKCQoexUgpht1kHUKyWOcgIyUGvwdsEF2BKQ4ntC7CxqdifOJlD7m1jZRDrV8HoV
 gxqSxo/y/MPcb5FQDJXBPZJolT+MC5eodSMtlPUgg4lyceVyw7MRymanITcbTJbtQ5
 GHYmxd202Jzv6Q+KWJWAU5kBiBsLTGl+b/TzQKLo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.33] ([46.223.3.204]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvbBk-1oKvuw0B6c-00sdcZ; Sun, 20
 Mar 2022 01:01:12 +0100
To: gregkh@linuxfoundation.org, jirislaby@kernel.org
References: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
 <20220228023928.1067-2-LinoSanfilippo@gmx.de>
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <9cf25a55-9597-74d3-7829-6422c8a5a73c@gmx.de>
Date: Sun, 20 Mar 2022 01:01:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220228023928.1067-2-LinoSanfilippo@gmx.de>
Content-Language: en-US
X-Provags-ID: V03:K1:AUxWCItz1tm+yKQXwbhBjD4S3BmYFzw2v+jNazO1T0kwTCkHtob
 Pecyzp8X20LCrqzhrqfQDinKYmR+24IRLddX89cKYxPqgSYzE5yq3zeyMNG/JeyXJuvCoes
 XNksQk+zEi+BQjku9iX6cgR4Bgf3Yv5b0OJMxgCEcWDJTS0ZgGvQ3d8BCRneK1uL14tG+kl
 5KSP4UDwyoJeZPqvd2JWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:USVa+vBjMjo=:YU3b7lq8uHCDGNS9biTLoT
 ci09eq5EIElP6ylgBJdoQkG75c22H3fbdRoeYsBXFCveZ7IqiyoVJaYy8xdMAy2dPUsYm6L8V
 QyeA50MtuZTBZjg1EnWcKYlbg8GC9kTzaS7QzVAn9FR9LPYCVt/hHuc/BKZ4br/qh5wd+3+ev
 LIgOJLv54mNCgyRuH6t6jAMDKfxMHjirhJ8/cVNrt3KUoYk96bZhSKB59wqd0xxKdWelaclBa
 yH/bm6Gaq1lbPZfF2dEoLAzmyZAm5TVNrvNCyFyELkrM0vg3GPxF8aqb6rMwB9/Ma/MxEE7/B
 NgvXNdpXKKfzrL3y5dGYLD39xGgCH6wMuFNX7EGN1qUKfavrgPOBnJgrC+/zBGW1uxuXhOlj0
 0u6GfvleGUFA6oFIQNVea1ZBxIrriS72JMF5oEZtZVMB0psslFmZklTqs8wzvbk4TsGw943lH
 +qLyWQrxXxve3cuZBRroBFkW6vgFfKxmtYzT5LNeA/Nl/O7s8HWmGMF8JCrkcHwmXQRDRsZ7X
 NOvGQlChwTIQwWPgL3X2PJQ8cvrQRQVNWDuRkvDkmAdT9rJAexFZW/4FgF2DvhNPHFfq0H6tD
 9rcblGibdNSvmHIzy9DmFUIum7J5/OTggTPSFnswYqSpWQeCPT3kWnv16cQO24PU8jYHPrSNZ
 1exYdbSkpj3JsYmHj9ane/69lHJqLWrPOoFziqTUHcc8f5s3V1KDIIBc8Ro64/Luk5fTJBleh
 +pw+nz6XbmD5HzR60WkMTAT6XwFtcSIL7fOE7DiCNgpikxWJmfvSNpcJdlTIEnRFGXFruwL3Y
 E/t4LTQwHNBuUxmUOpz9JfJugc/LaAksGp17Ua3jCAjB0mkWww5iLOzukP2YQHosdpbNauRO0
 j+4AqAFnE2uD0WvkDJTY4Q8enKVotRqb6vIzoQBGfdohEnAj8IRvhjVit7wi2YPIexQ7MJ1BZ
 rmPHt7bVL3iWLrgQLr+QGn2Q8NF21SjKHnwjegSqlGlkUMxrrs6CbbWnOoe4GsqVlFTPf0j4u
 fccIrwmBb93tk3XuWP5FiCmC6rWWcAvzvaAM3x2d/L0qWMP53H284y9G8Ycry3cslN4C3ugZt
 r07LEfxtuwD/s0=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 richard.genoud@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 nicolas.ferre@microchip.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, u.kleine-koenig@pengutronix.de,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: Re: [Linux-stm32] [PATCH v4 1/9] serial: core: move RS485
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

Hi Greg, Jiri,

On 28.02.22 at 03:39, Lino Sanfilippo wrote:
> Several drivers that support setting the RS485 configuration via userspace
> implement one or more of the following tasks:
>
> - in case of an invalid RTS configuration (both RTS after send and RTS on
>   send set or both unset) fall back to enable RTS on send and disable RTS
>   after send
>
> - nullify the padding field of the returned serial_rs485 struct
>
> - copy the configuration into the uart port struct
>
> - limit RTS delays to 100 ms
>
> Move these tasks into the serial core to make them generic and to provide
> a consistent behaviour among all drivers.
>

is this patch series mergeable now? Or is there anything else to do from my side?

Regards,
Lino
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
