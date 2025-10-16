Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42906BE1F93
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 09:45:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09FE6C5719E;
	Thu, 16 Oct 2025 07:45:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B93FEC5719D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 07:45:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D7D7C4E410F3;
 Thu, 16 Oct 2025 07:45:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A0B066062C;
 Thu, 16 Oct 2025 07:45:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 97CFF102F22F8; 
 Thu, 16 Oct 2025 09:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760600710; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=I0v577q1BsABPUxTz1xRiLHueg9d5rceOxAUtuerf34=;
 b=nfuFh5AHbkXF3rWr3y6jX3fbtDy+caY15+qyME3fkfKk8vMoSZE0F7wBVUB6+AlW5Rn0oC
 JQ4BLlcUNFD7Ij4kWS4VxeXkEAAkxYSrDbPShUnhbAG0qH1cI4R9a/letuXmQOfatIN3AT
 520yznS0ic5zJTEAafuU+Zk84MEQ78cwP+v2vVANcbidvCn9nkcGxehZLRGcK9Y3Iu/6NJ
 CQ1JaLdOvzTlVXiOLn8PR2jID7PBiv4ul8+d86+R6j/2QfZcSwgUH1iDzMVZQVNDwRKgzu
 KFJQz+8PLdwAT084rrDEaf2vZtHezNZj4k7fSVvKvTHlc0TlD5dTaQdc64WgJA==
Message-ID: <f8bf183c-964c-4e97-b7f0-f2cb0560f784@bootlin.com>
Date: Thu, 16 Oct 2025 09:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <aO-5gVqBV-2Nl7lr@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aO-5gVqBV-2Nl7lr@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-arm-msm@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Vladimir Oltean <olteanv@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 00/14] net: stmmac: phylink PCS
	conversion
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

Hi Russell,

On 15/10/2025 17:10, Russell King (Oracle) wrote:
> On Wed, Oct 15, 2025 at 03:19:25PM +0100, Russell King (Oracle) wrote:
>> Changes since RFC:
>> - new patch (7) to remove RGMII "pcs" mode
>> - new patch (8) to move reverse "pcs" mode to stmmac_check_pcs_mode()
>> - new patch (9) to simplify the code moved in the previous patch
>> - new patch (10) to rename the confusing hw->ps to something more
>>   understandable.
>> - new patch (11) to shut up inappropriate complaints about
>>   "snps,ps-speed" being invalid.
>> - new patch (13) to add a MAC .pcs_init method, which will only be
>>   called when core has PCS present.
>> - modify patch 14 to use this new pcs_init method.
> 
> I've just noticed I sent out RFC v2.. completely forgot about that,
> sorry

:( I don't know if you saw my reply to it then...

To quote :
"
  I tested that series on socfpga with :

    - 1 instance using RGMII, w/ a ksz9031 PHY, and it works well,
      traffic flows, ethtool seems to report correct data

    - 1 instance that has the Lynx PCS (DMA_HW_FEATURE[30:28] == 0)

  This also works perfectly, switching between SGMII/1000BaseX dynamically
  by hotswapping SFP modules works well, no regression found at a first glance.
"

All the boards I have that have a flavour of stmmac don't seem to have the
internal PCS, are you still interested in some testing , just
for non-regression ?

 This is a subset of RFC v2, but with patches 13 and 14
> reversed.
> 
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
