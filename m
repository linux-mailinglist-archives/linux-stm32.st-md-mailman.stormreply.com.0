Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE9C301DCC
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Jan 2021 18:04:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99070C57181;
	Sun, 24 Jan 2021 17:04:50 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFC73C5717F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Jan 2021 17:04:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DNzrH5fpvz1qsjq;
 Sun, 24 Jan 2021 18:04:47 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DNzrH0HKRz1tYWh;
 Sun, 24 Jan 2021 18:04:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ZfK5OcRbFmNR; Sun, 24 Jan 2021 18:04:44 +0100 (CET)
X-Auth-Info: u/UwA9CDT1uEGoW2wOgfY7i+YKsWSmnVFay5SmxFy3I=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 24 Jan 2021 18:04:43 +0100 (CET)
To: dri-devel@lists.freedesktop.org
References: <20201224061832.92010-1-marex@denx.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <82442a19-f4ea-ec33-abec-1c067ebab828@denx.de>
Date: Sun, 24 Jan 2021 18:04:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201224061832.92010-1-marex@denx.de>
Content-Language: en-US
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] [PATCH V2] drm/bridge: lvds-codec: Add support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/24/20 7:18 AM, Marek Vasut wrote:
> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
> select input pixel data sampling edge. Add DT property "pixelclk-active",
> same as the one used by display timings, and configure bus flags based on
> this DT property.

Bump ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
