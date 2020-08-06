Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD8223D767
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Aug 2020 09:37:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31B90C36B3A;
	Thu,  6 Aug 2020 07:37:05 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB7CDC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Aug 2020 07:37:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BMgL475JPz1qs0h;
 Thu,  6 Aug 2020 09:37:00 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BMgL46M1vz1qyXs;
 Thu,  6 Aug 2020 09:37:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id YyO78TKKvQQI; Thu,  6 Aug 2020 09:36:59 +0200 (CEST)
X-Auth-Info: AWbSNkVtJ7QFZbnQLGNYjChXd+mqDcF8qR8ntqY3dz4=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  6 Aug 2020 09:36:59 +0200 (CEST)
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20200724101610.146403-1-marex@denx.de>
 <ca48284998c14faf8ed17e6fa0cfac42@dh-electronics.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <495b2f6b-04b7-c1eb-7aed-cd55636bef46@denx.de>
Date: Thu, 6 Aug 2020 09:29:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ca48284998c14faf8ed17e6fa0cfac42@dh-electronics.com>
Content-Language: en-US
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fill GPIO line names on
	AV96
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

On 8/6/20 9:09 AM, Christoph Niedermaier wrote:
> From: Marek Vasut <marex@denx.de>
> Sent: Friday, July 24, 2020 12:16 PM
>>
>> Fill in the custom GPIO line names used by DH.
>>
> [...]
>> +&gpioa {
>> +       gpio-line-names = "", "", "", "",
>> +                         "", "", "", "",
>> +                         "", "", "", "DH-GPIO-K",
>> +                         "DH-GPIO-I", "", "DH-GPIO-A", "";
>> +};
>> +
> [...]
> 
> Hello Marek,

Hello Christoph,

> We have been using the GPIO names at DH electronics for some time and also
> on other SOMs, but have not yet streamed them. We started with the naming
> only with a capital letter "A-W" since then without problems. To avoid a
> hard cut or patching for us and our customers it would be good if we could
> use the same naming in the mainline kernel as well. Marek, we would be
> happy if you would adopt our valued GPIO naming in your patch.

My counter-argument to this is that the naming should be unique and
provide a hint where those GPIO lines come from, so maybe even DH-GPIO-n
should rather be DHCOM-n . I can't say I'm particularly fond of the
plain 'n' naming of GPIO lines, because then the GPIO label (and e.g.
listing in libgpiod tools) does not give any hint what the GPIO is or
where it comes from. Also, I worry a plain 'n' naming might clash with
other GPIO IPs easily, while a more unique name can not.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
