Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E164E5E4
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Dec 2022 03:16:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3DDAC65E46;
	Fri, 16 Dec 2022 02:16:08 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DA40C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Dec 2022 02:16:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8582785319;
 Fri, 16 Dec 2022 03:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671156967;
 bh=P966DiPywJi72dDvlS35nXR4CLL+jEqDYx5pkSRR9dg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L1RrVNbTLZ4dKcU/KsGiSNQIipERmLDFbnjHlqyjpp6yrPFgQs3SGsiujpU9HLkK3
 Xy/15GWpIlyDVd1T5jz5ixBMibgZYrPMOuS5Yc2towCMOeU+fqI1GSx8BTfhTvYoIT
 Pf8S8+R5cMJftEphaa6+Qd2xOP46Fa0oPEyGVzSX7BurPyt6NWYqGLPLZJOs2RaCHZ
 JsqjY8o4T75OgbV4GYwbuuaHO57N8xCYjtFiASgf0Ai9vPmpPBUVvUCkYzYzBYhc0j
 ibIuxgC3wZtnkduN5ekOqThElFmpXfNRMAdk/DyakckULpkECFmmwiALrTotEHO/Uy
 x5p08Ip+j4Vjw==
Message-ID: <5ef20edd-7673-661d-5175-2c9a6af26dde@denx.de>
Date: Fri, 16 Dec 2022 03:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Valentin CARON <valentin.caron@foss.st.com>
References: <20221207195929.160267-1-marex@denx.de>
 <34ec91a2-2089-65ba-d5bb-fed03cda63b7@foss.st.com>
 <a984e2aa-1fbf-4b6b-9326-d926221740d8@denx.de>
 <f2373a2b-8229-8af3-116c-7f3b8ccf8062@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f2373a2b-8229-8af3-116c-7f3b8ccf8062@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] serial: stm32: Move hard IRQ handling to
 threaded interrupt context
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

On 12/15/22 17:52, Valentin CARON wrote:
> Hi Marek,

Hi,

> I test your patch with a loop-back test between usart3 and uart7 on 
> STM32MP157C-DK2. It
> shows a speed transfer diminution (about -1,5%), some locks during 
> transfer, RT throttling etc...
> (I use lszrz tool).
> 
> But finally, I think your patch is the best solution that we have.
> Other solutions always throws an RT exception on a spin_lock.

I just sent a V2, so let's see how that works.

Thanks for testing!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
