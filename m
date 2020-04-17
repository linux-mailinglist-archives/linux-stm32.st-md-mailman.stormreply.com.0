Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A79E1AD831
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2020 10:06:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE317C36B0D;
	Fri, 17 Apr 2020 08:06:31 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83BB9C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 08:06:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 8AD6E2A2164
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Adrian Ratiu
 <adrian.ratiu@collabora.com>
In-Reply-To: <CAFqH_513KB+En_xbpXSBG6Q38kYxWCgw0KO3NVxCb6fqHDaKBA@mail.gmail.com>
References: <20200414151955.311949-1-adrian.ratiu@collabora.com>
 <20200414151955.311949-2-adrian.ratiu@collabora.com>
 <CAFqH_52eKB4jtmn5e4HQubv8ijOPqDqncp1dRGahhU3NOorJMQ@mail.gmail.com>
 <87lfmvjmt5.fsf@collabora.com>
 <CAFqH_513KB+En_xbpXSBG6Q38kYxWCgw0KO3NVxCb6fqHDaKBA@mail.gmail.com>
Date: Fri, 17 Apr 2020 11:07:37 +0300
Message-ID: <87imhyk01i.fsf@collabora.com>
MIME-Version: 1.0
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Adrian Pop <pop.adrian61@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Collabora Kernel ML <kernel@collabora.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, linux-imx@nxp.com
Subject: Re: [Linux-stm32] [PATCH v6 1/8] drm: bridge: dw_mipi_dsi: add
 initial regmap infrastructure
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

On Thu, 16 Apr 2020, Enric Balletbo Serra <eballetbo@gmail.com> 
wrote:
> Hi Adrian, 
> 
> [snip] 
> 
>> >> 
>> >> +static void dw_mipi_dsi_get_hw_version(struct dw_mipi_dsi 
>> >> *dsi) +{ +       regmap_read(dsi->regs, DSI_VERSION, 
>> >> &dsi->hw_version); +       dsi->hw_version &= VERSION; + if 
>> >> (!dsi->hw_version) +               dev_err(dsi->dev, "Failed 
>> >> to read DSI hw version register\n"); 
>> > 
>> > Is this an error that should be ignored? If you can't get the 
>> > HW version, probably, there is something wrong with your 
>> > hardware so, don't you need to return an error? 
>> > 
>> 
>> After thinking a bit more about it, that error should be a 
>> warning. 
>> 
>> I added it because in some cases (for eg. if the peripheral 
>> clock is disabled) the reads can return 0 which is obviously an 
>> invalid version and the bridge will error in the next step when 
>> not finding a layout. 
>> 
> 
> If you'll error anyway, why wait? IIUC at this point the clock 
> *must* be enabled, and if not, something is wrong with the 
> driver, I don't see any advantage on delay the error. do you 
> have a use case where this is called and peripheral clock 
> disabled? 

There should be no real use-case (maybe malfunctioning HW), and we 
could error out here to catch driver bugs ASAP, so I'll go this 
route then :)

Thank you, much appreciated!

>
>> So I'll make this a warning in v7 and explicitely mention that
>> reads version == 0 can be caused by a disabled pclk.
>>
>
> -- Enric
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
