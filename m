Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fAuQFFGGKGoPFwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 23:32:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D094664434
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 23:32:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=m+NA6ZT1;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=riscstar.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C38E5C8F292;
	Tue,  9 Jun 2026 21:32:00 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA8C8C8F290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2026 21:31:59 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-4863cd278d7so3799974b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2026 14:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781040718; x=1781645518;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kQKbERiB0ntPOS/R2wMXRwGJAn2HHwIq3s8Tu7uVMO4=;
 b=m+NA6ZT1VcTq57TkEaqSsonoG9H6oNzBZpaqnx0A9GBoNhFI/g6hScV8LsFemAR0Ga
 9AM26ZU8Y1eDz+GyiK54iwCrNJkBVtCOtMAUjVBfned/zYl0Ex9OGnI1L7eiSM82b8o0
 OVj9caf1hWp57sX2SIaw2hWdz9dinTIL9en78Fj6QJ+Vwc/dyusV2X3x73IrAWqHXKAi
 inPM/k9uwwhKOOigPY26d+Gxod7w2Io+aW0EfIxyMZHwWNH8xJ09tygPEMs6GGQYbHx8
 EGd+mcWs9CgrvQTxhqs53ECVXfv/iSSJPYS4UcqM2Z1VeyM8nyPtjxYFocirinrEzojF
 TkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781040718; x=1781645518;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kQKbERiB0ntPOS/R2wMXRwGJAn2HHwIq3s8Tu7uVMO4=;
 b=j0iU8+WD99ujQKdwbWw/FsaKmyrPYdoXVc9TbtuhzmTZ3ETT7G+LD+JXusaX9uD5b3
 DYM8Rk1wHxrr90esevItRrnSCJr3pqCgVBk0BSWyK2DpHxeva3DIOv3Ss6jwNrZw/3Gs
 W3Td/tgvbS7tokaSbMcLH7+nbqgbVB74IHA/NsfBZ/sYkYrfl/O4iZPxx+uPCZFqG4hP
 yL8WG/7MNR6LcIreyRaIda5KLOYHtC9Kf++9Q7Mtw5fU7MF+oOaZhyzBKUIQ5k98pNz+
 5f2Z0ZgRdLEFspNrOnaWwhZr+NM+FqLbZQAZUpJV7XFIh3xSak/nQP8mwYattCIG5cqn
 0g7g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+2cpKAQ00ULZffkM/G9Gbl0su6GV4AgUg6nUCMS68mV52yif7CUWxEv/L3QLzpZHoPLqn6N5LTLow18g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzFoUhpqMkmEzMt2yIR7BuczBfh1ZG8FewovG1Vv/EEmqtGq/GW
 BWpCGJhkIv+5xhbR6ShAb6n7uvKjxmsQd8l5H3dyzJzMgyOuBTGmQjDnjZ3nLNfxOAE=
X-Gm-Gg: Acq92OEt+UMFbhx3iJb4KzjKNBdgG7xGWCuskkyB4gZXZ8eIx/E3l0T+/VVfrIMqSMI
 TaK/mSPeBQlOea06Y1atDg6eVR5nLhrlIHTfA7GriY7wpV7YU5SGk2npSgqWOYBC0WvXu6v1mi9
 bBvY3dmqLGFU+vZ8HK7ADgaGK4eKWv96ukUiC/rR/BR2sAsxUXITnkZf8lq+YQ/+HDyMSgCS3ps
 b3DNvL5WBWvpsK6w9jeYOBBH24lw9Vyz8DFIgLsQgLHC1yupQqfJ3KfWGPy6VQNc+hjVw5t3DbV
 bWITYSa8hiolslzUD2ryprh3jO+46kH/ofkaAJ2rQmHxzD9NC3tuPMqrBUQ/3TlNIGwr8Y+O33J
 2eXd3y1m9b6qV2qEg4WrCPib+vBhSKxB5rP9DqyRTCeQvtcCGvkCozaDj0zew/VtRiQYvcN/tiu
 i9SvAImET0D0L9RuKF1CZFLgvP9AJJ49n+2NF97KpnmZG8
X-Received: by 2002:a05:6808:4fe2:b0:485:a9b2:5457 with SMTP id
 5614622812f47-4868df63ae3mr15052790b6e.35.1781040718541; 
 Tue, 09 Jun 2026 14:31:58 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4865b5a5a64sm17024127b6e.4.2026.06.09.14.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 14:31:58 -0700 (PDT)
Message-ID: <b89fe088-496f-4281-9d27-7f8b0b3f38cb@riscstar.com>
Date: Tue, 9 Jun 2026 16:31:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-14-elder@riscstar.com>
 <20260605144758.GB3659201-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260605144758.GB3659201-robh@kernel.org>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 13/14] net: stmmac: tc956x:
 add TC956x/QPS615 support
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069@gmail.com,m:dav
 em@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:email,riscstar.com:mid,riscstar.com:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D094664434

On 6/5/26 9:47 AM, Rob Herring wrote:
> On Thu, Jun 04, 2026 at 08:00:20PM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
>> small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
>> that can be accessed, along with several other peripherals, via two
>> PCIe endpoint functions. There is a main driver for the endpoint that
>> decomposes things and creates auxiliary bus devices to model the SoC.
>>
>> The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
>> supported by an MSIGEN that bridges TC956x level interrupts to PCIe
>> MSIs.
>>
>> Add a driver for the eMAC/MSIGEN combination.
>>
>> Co-developed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> 
> The order is wrong here unless you worked on it and then Daniel took
> over. Tags should be chronological order.

I think this was a dumb reorder I did to address a complaint
from checkpatch, but in any case I'll fix this.  Yes, my
signoff should "wrap" the others.

>> ---
>>   MAINTAINERS                                   |   2 +
>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  14 +
>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
>>   .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 818 ++++++++++++++++++
>>   4 files changed, 836 insertions(+)
>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0439607d1155f..418537cbefbbb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -27059,6 +27059,8 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>>   F:	drivers/gpio/gpio-tc956x.c
>>   F:	drivers/misc/tc956x_pci.c
>> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>> +F:	include/soc/toshiba/tc956x-dwmac.h
>>   
>>   TOSHIBA WMI HOTKEYS DRIVER
>>   M:	Azael Avalos <coproscefalo@gmail.com>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> index e3dd5adda5aca..8d247e033e356 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> @@ -404,6 +404,20 @@ config DWMAC_MOTORCOMM
>>   	  This enables glue driver for Motorcomm DWMAC-based PCI Ethernet
>>   	  controllers. Currently only YT6801 is supported.
>>   
>> +config DWMAC_TC956X
>> +	tristate "Toshiba TC956X DWMAC support"
>> +	depends on PCI
>> +	depends on COMMON_CLK
>> +	depends on TOSHIBA_TC956X_PCI
>> +	default TOSHIBA_TC956X_PCI
>> +	select GENERIC_IRQ_CHIP
>> +	help
>> +	  This selects the Toshiba TC956X (and Qualcomm QPS615) support in the
>> +	  stmmac driver.
>> +
>> +	  This provides support for the ethernet controllers found on these
>> +	  devices.
>> +
>>   config STMMAC_PCI
>>   	tristate "STMMAC PCI bus support"
>>   	depends on PCI
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> index a1cea2f57252e..e8e7f95dbe3e8 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> @@ -51,4 +51,6 @@ obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
>>   obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
>>   obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
>>   obj-$(CONFIG_DWMAC_MOTORCOMM)	+= dwmac-motorcomm.o
>> +obj-$(CONFIG_TC956X_PCI)	+= tc956x-pci.o
>> +obj-$(CONFIG_DWMAC_TC956X)	+= dwmac-tc956x.o
>>   stmmac-pci-objs:= stmmac_pci.o
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>> new file mode 100644
>> index 0000000000000..c77585e4a50e6
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>> @@ -0,0 +1,818 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + *
>> + * Derived from code having the following copyrights:
>> + * Copyright (C) 2011-2012  Vayavya Labs Pvt Ltd
>> + * Copyright (C) 2025 Toshiba Electronic Devices & Storage Corporation
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
> 
> Based on the block diagram, these are PCI devices. Auxiliary bus is the
> wrong thing to use here.

As I said in the other message, I'm going to rearrange this
to use pci-ep-bus and platform drivers.  Most of the core
code should be stay the same but the overall structure will
change.

Thanks for your suggestions.

					-Alex

> 
> Rob

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
