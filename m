Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E8C290A67
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Oct 2020 19:16:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0673BC3FADE;
	Fri, 16 Oct 2020 17:16:29 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 912A6C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Oct 2020 17:16:27 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CCXqt1MC1z1qs39;
 Fri, 16 Oct 2020 19:16:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CCXqs6tWNz1qvgZ;
 Fri, 16 Oct 2020 19:16:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id rO_PnB00SBqX; Fri, 16 Oct 2020 19:16:23 +0200 (CEST)
X-Auth-Info: u48+n1/+Hd+tGuTlZUlVRaBSedtZemDDrMYmC6ozLN0=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 16 Oct 2020 19:16:23 +0200 (CEST)
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201002230823.242147-1-marex@denx.de>
 <20201016162553.GA1333109@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <42115980-41ed-b73c-9c46-16af2b3a51a7@denx.de>
Date: Fri, 16 Oct 2020 19:16:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201016162553.GA1333109@ravnborg.org>
Content-Language: en-US
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On 10/16/20 6:25 PM, Sam Ravnborg wrote:
> Hi Marek.

Hello Sam,

> On Sat, Oct 03, 2020 at 01:08:23AM +0200, Marek Vasut wrote:
>> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
>> select input pixel data sampling edge. Add DT property "pixelclk-active",
>> same as the one used by display timings, and configure bus flags based on
>> this DT property.
> 
> Why is it that this information cannot come from the panel driver?

Because the sampling edge of the panel can be different (is there even
such an edge for LVDS panel?). What we care about specifying here is the
edge on which the FIN3385 samples the data on the Parallel bus, and that
is a property of the FIN3385, because that is configured via a dedicated
pin on the FIN3385.

> The property tell when data are sampled and the FIN3385 Parallel-to-LVDS
> is the one that transmit the data - not then one that samples the data.
> Correct?

Not correct I'm afraid, see above.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
