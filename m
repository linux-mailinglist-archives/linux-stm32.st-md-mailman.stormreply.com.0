Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6911ECD86
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jun 2020 12:27:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43089C36B21;
	Wed,  3 Jun 2020 10:27:54 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB0EEC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 10:27:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 53CE52A3AC2
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, Adrian Ratiu
 <adrian.ratiu@collabora.com>
In-Reply-To: <CACvgo51QyzEa8LFpGq5zjYV-0TifQRtNh4WhMYy8jNtaswxd7Q@mail.gmail.com>
References: <20200427081952.3536741-1-adrian.ratiu@collabora.com>
 <20200427081952.3536741-9-adrian.ratiu@collabora.com>
 <4acc09e8-0610-01f6-b18d-3ffc390c45a3@st.com>
 <87blm387vt.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
 <CACvgo51QyzEa8LFpGq5zjYV-0TifQRtNh4WhMYy8jNtaswxd7Q@mail.gmail.com>
Date: Wed, 03 Jun 2020 13:28:54 +0300
Message-ID: <878sh48mu1.fsf@collabora.com>
MIME-Version: 1.0
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Adrian Pop <pop.adrian61@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Subject: Re: [Linux-stm32] [PATCH v8 08/10] drm: stm: dw-mipi-dsi: let the
 bridge handle the HW version check
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

On Tue, 02 Jun 2020, Emil Velikov <emil.l.velikov@gmail.com> 
wrote:
> Hi Adrian, 

Hi Email,

> 
> On Mon, 1 Jun 2020 at 10:14, Adrian Ratiu 
> <adrian.ratiu@collabora.com> wrote: 
>> 
>> On Fri, 29 May 2020, Philippe CORNU <philippe.cornu@st.com> 
>> wrote: 
>> > Hi Adrian, and thank you very much for the patchset.  Thank 
>> > you also for having tested it on STM32F769 and STM32MP1. 
>> > Sorry for the late response, Yannick and I will review it as 
>> > soon as possible and we will keep you posted.  Note: Do not 
>> > hesitate to put us in copy for the next version 
>> > (philippe.cornu@st.com, yannick.fertre@st.com) Regards, 
>> > Philippe :-) 
>> 
>> Hi Philippe, 
>> 
>> Thank you very much for your previous and future STM testing, 
>> really appreciate it! I've CC'd Yannick until now but I'll also 
>> CC you sure :) 
>> 
>> It's been over a month since I posted v8 and I was just gearing 
>> up to address all feedback, rebase & retest to prepare v9 but 
>> I'll wait a little longer, no problem, it's no rush. 
>> 
> Small idea, pardon for joining so late: 
> 
> Might be a good idea to add inline comment, why the clocks are 
> disabled so late.  Effectively a 2 line version of the commit 
> summary. 
> 
> Feel free to make that a separate/follow-up patch.

Thanks, I'll add the comment to this patch in v9.

>
> -Emil
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
