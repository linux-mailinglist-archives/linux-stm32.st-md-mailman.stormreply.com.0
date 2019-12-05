Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B84D8114D46
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2019 09:11:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7702CC36B0B;
	Fri,  6 Dec 2019 08:11:10 +0000 (UTC)
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD4B0C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2019 22:30:07 +0000 (UTC)
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1iczdF-0004M3-RF; Thu, 05 Dec 2019 23:29:57 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.92.3)
 (envelope-from <aurelien@aurel32.net>)
 id 1iczdE-00114c-0g; Thu, 05 Dec 2019 23:29:56 +0100
Date: Thu, 5 Dec 2019 23:29:56 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20191205222956.GA240447@aurel32.net>
Mail-Followup-To: Amelie Delaunay <amelie.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191121161152.25541-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121161152.25541-1-amelie.delaunay@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:11:10 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olof Johansson <olof@lixom.net>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] USB support on stm32mp157 boards
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

On 2019-11-21 17:11, Amelie Delaunay wrote:
> This patchset adds support for USB (Host and OTG) on stm32mp157a-dk1.
> USB OTG HS is forced in Peripheral mode.
> This patchset also fixes USB on stm32mp157c-ev1: USB PHYS supplies were missing
> (CONFIG_REGULATOR_STM32_PWR) and usbotg_hs node requires phy-names property to
> get the phy.
> 
> Amelie Delaunay (5):
>   ARM: multi_v7_defconfig: enable STM32 PWR regulator
>   ARM: dts: stm32: enable USBPHYC on stm32mp157a-dk1
>   ARM: dts: stm32: enable USB Host (USBH) EHCI controller on
>     stm32mp157a-dk1
>   ARM: dts: stm32: enable USB OTG HS on stm32mp157a-dk1
>   ARM: dts: stm32: add phy-names to usbotg_hs on stm32mp157c-ev1
> 
>  arch/arm/boot/dts/stm32mp157a-dk1.dts | 28 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/stm32mp157c-ev1.dts |  1 +
>  arch/arm/configs/multi_v7_defconfig   |  1 +
>  3 files changed, 30 insertions(+)

I tested the series on a stm32mp157c-dk2.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
