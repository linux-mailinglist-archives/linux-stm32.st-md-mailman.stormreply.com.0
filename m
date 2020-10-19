Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A64F22930F2
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 00:09:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61386C424B8;
	Mon, 19 Oct 2020 22:09:44 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12BA4C3FAE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 22:09:43 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CFWBs1rGrz1qs10;
 Tue, 20 Oct 2020 00:09:40 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CFWBr3FV4z1qryT;
 Tue, 20 Oct 2020 00:09:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id QLOlEyoyRyZB; Tue, 20 Oct 2020 00:09:38 +0200 (CEST)
X-Auth-Info: Tzf/BxdUU4K2Y9+pwlHbvD3zwpLHgG6AleZMuipK0l0=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 20 Oct 2020 00:09:38 +0200 (CEST)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201002230823.242147-1-marex@denx.de>
 <20201019005438.GD4174@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <0c038afd-f4f2-966c-babc-f4275678840f@denx.de>
Date: Tue, 20 Oct 2020 00:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201019005438.GD4174@pendragon.ideasonboard.com>
Content-Language: en-US
Cc: Vincent Abriou <vincent.abriou@st.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] [RFC][PATCH] drm/bridge: lvds-codec: Add support
 for pixel data sampling edge select
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

On 10/19/20 2:54 AM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> Thank you for the patch.
> 
> On Sat, Oct 03, 2020 at 01:08:23AM +0200, Marek Vasut wrote:
>> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
>> select input pixel data sampling edge. Add DT property "pixelclk-active",
>> same as the one used by display timings, and configure bus flags based on
>> this DT property.
> 
> The feature looks good to me. I however wonder if we shouldn't use the
> standard pclk-sample endpoint property (documented in [1]) instead of a
> custom properly.

Either is fine by me, but I think pixelclk-active, which comes from
panel-timings.yaml is closer to the video than multimedia bindings.
(the multimedia and video bindings should be aligned, sigh)

> The DT bindings for the lvds-codec should be updated accordingly. And
> the property should only be taken into account when operating in encoder
> mode, as for decoder mode there's no polarity for the sampling of LVDS
> signals, as you've explained in a reply to Sam.

So, we need to rework the whole compatible data and identify what is
encoder/decoder in addition to connector there.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
