Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D9B3D93DC
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jul 2021 19:05:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFC72C597BE;
	Wed, 28 Jul 2021 17:05:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF0ACC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jul 2021 17:05:39 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EC85782D5B;
 Wed, 28 Jul 2021 19:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1627491937;
 bh=e4zGJOsuG/L4sGGODhJtwQ+ICfnFl/TV7iUtDPL18Sc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cXTclarVa3q/HWffUZaSYsQyXODhGoBAobfU8N/3f/ENa3nLTENZX8E9ARTdREeyk
 9uPLqIwmDTUaGmtaFsFIP//h2pfq5jCSdhsVfQlw4zC/1L2rcsdrA3gMErQmlcHfKk
 TL/IMrtfttqGjIYYN4RQ75d7txxThJu2A6dLMIdSxqy7WPHKyCagbfiB1/0OpqK+hz
 wt2EoMgypilzmzEzyEXsHspso4axKEGRouePGCpXBc4nSyDbyk59dHOMfUYE7nSW4j
 KW4Pk+/yxfG+zIdWk9LXU6EMZJI5YRvLAhSecU497tptYoeZUxsbh54xV30/ygN9Kh
 OUAF6tbt4GJ+w==
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20210721181040.126714-1-marex@denx.de>
 <fa16ffd9-765d-c82d-d7c3-c4cb4c867177@foss.st.com>
 <d151bcf0-773c-d694-173f-84d138b309ce@denx.de>
 <600f2cba-f1be-7c43-46aa-c79a07a39d76@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <47cc8d99-9826-31d8-bbeb-07932a1e2dcd@denx.de>
Date: Wed, 28 Jul 2021 19:05:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <600f2cba-f1be-7c43-46aa-c79a07a39d76@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: cniedermaier@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix touchscreen IRQ line
 assignment on DHCOM
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

On 7/28/21 9:31 AM, Alexandre TORGUE wrote:
> On 7/23/21 7:39 PM, Marek Vasut wrote:
>> On 7/23/21 5:18 PM, Alexandre TORGUE wrote:
>>> Hi Marek
>>>
>>> On 7/21/21 8:10 PM, Marek Vasut wrote:
>>>> While 7e5f3155dcbb4 ("ARM: dts: stm32: Fix LED5 on STM32MP1 DHCOM 
>>>> PDK2")
>>>> fixed the LED0 assignment on the PDK2 board, the same commit did not
>>>> update the touchscreen IRQ line assignment, which is the same GPIO 
>>>> line,
>>>> shared between the LED0 output and touchscreen IRQ input. To make this
>>>> more convoluted, the same EXTI input (not the same GPIO line) is shared
>>>> between Button B which is Active-Low IRQ, and touchscreen IRQ which is
>>>> Edge-Falling IRQ, which cannot be used at the same time. In case the 
>>>> LCD
>>>> board with touchscreen is in use, which is the case here, LED0 must be
>>>> disabled, Button B must be polled, so the touchscreen interrupt 
>>>> works as
>>>> it should.
>>>>
>>>> Update the touchscreen IRQ line assignment, disable LED0 and use polled
>>>> GPIO button driver for Button B, since the DT here describes baseboard
>>>> with LCD board.
>>>>
>>>> Fixes: 7e5f3155dcbb4 ("ARM: dts: stm32: Fix LED5 on STM32MP1 DHCOM 
>>>> PDK2")
>>>> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM 
>>>> STM32MP1 SoM and PDK2 board")
>>>
>>> I think you need to keep only one fixes tag.
>>
>> Then it is the first one (LED5) if you want to pick it, or shall I 
>> resend it ?
> 
> I'll do it.

Thank you
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
