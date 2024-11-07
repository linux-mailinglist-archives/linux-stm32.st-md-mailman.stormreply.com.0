Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B9D9D4179
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74138C7A834;
	Wed, 20 Nov 2024 17:49:44 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A568C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 19:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1731007191; x=1762543191;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eN0VRTCZM2WBAT9cgFw9DTUrSpwbJpwTFubfXheWoYM=;
 b=C5VZ7UuAmvXwV8KRXPcDGElzYkYrfukRKUJD9tGSbhUpxL8vAknUujEQ
 WuG8riSt6gB8NtusJxm264gLFQnT/h8NBnzay8lUrtseUZRbApbAIv9ag
 ulKLbQl7WzaxEgMT+j/vO56z/Qwsr3IFpiLEAxSXCG6OJMY9iVxag61Ol
 Puq5a3bidTZe7tvrd6WCTI5elDyXU2w2/SmKa0JG5QRC/Lf75d9QmZycs
 eu3NBBmRP04BqFtFHT0c3TBMgpNtI6eKOJ83G0mMxlJweuXatijF+TLkw
 7SPkHtknlWZSjzYOVNAC2eT7VWKzR+CD4oDzT9pKabhVK67umICSfRQfK Q==;
X-CSE-ConnectionGUID: MDDVaqVhRqenuoSd1grXjg==
X-CSE-MsgGUID: wGoZR4F7TSiOLGn00rOoNA==
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="34539067"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Nov 2024 12:19:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Nov 2024 12:19:22 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Nov 2024 12:19:20 -0700
Date: Thu, 7 Nov 2024 19:19:19 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20241107191919.sngc2x664lp7jeg2@DEN-DL-M70577>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/9] Support external
	snapshots on dwmac1000
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

> Hi,
> =

> This V3 is just a rebase a V2 on top of net-next to address some minor
> conflicts. No changes were made.
> =

> This series is another take on the pervious work [1] done by
> Alexis Lothor=E9, that fixes the support for external snapshots
> timestamping in GMAC3-based devices.
> =

> Details on why this is needed are mentionned on the cover [2] from V1.
> =

> This V2 addresses multiple issues found in V1 :
> =

>  - The PTP_TCR register is configured from multiple places, as reported
>    by Alexis, so we need to make sure that the extts configuration
>    doesn't interfere with the hwtstamp configuration.
> =

>  - The interrupt management in V1 was incomplete, as the interrupt
>    wasn't correctly acked.
> =

>  - This series also makes so that we only enable the extts interrupt
>    when necessary.
> =

> [1]: https://lore.kernel.org/netdev/20230616100409.164583-1-alexis.lothor=
e@bootlin.com/
> [2]: https://lore.kernel.org/netdev/20241029115419.1160201-1-maxime.cheva=
llier@bootlin.com/
> =

> Thanks Alexis for laying the groundwork for this,
> =

> Best regards,
> =

> Maxime
> =

> Link to V1: https://lore.kernel.org/netdev/20241029115419.1160201-1-maxim=
e.chevallier@bootlin.com/
> Link to V2: https://lore.kernel.org/netdev/20241104170251.2202270-1-maxim=
e.chevallier@bootlin.com/

Hi Maxime,

Dont know much about this particular driver, but the patches looked good
to me!

For the series:

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
