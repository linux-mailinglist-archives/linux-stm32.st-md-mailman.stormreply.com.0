Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F39263A463B
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 18:12:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99F29C58D5B;
	Fri, 11 Jun 2021 16:12:45 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2F02C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 16:12:41 +0000 (UTC)
IronPort-SDR: Wa8QdVjrLGX0RXTl6nKPJDjhpbgMgnAnQ8afPfN7CFQzQapHw24njHKVN/8n+XIle+jHfZC8id
 rdT0Z71XFVAw==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="269403596"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="269403596"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 09:12:29 -0700
IronPort-SDR: hYweaGxaI7yIu9RoJ5cDtL4ZzMjbpf6PDj6vl8pQKBonCgwUo3XoTke2a2/hBCPki0E+XgCvwG
 fodlEZNQ1BEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="483316279"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga001.jf.intel.com with ESMTP; 11 Jun 2021 09:12:28 -0700
Received: from lcsmsx601.ger.corp.intel.com (10.109.210.10) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 11 Jun 2021 09:12:27 -0700
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 LCSMSX601.ger.corp.intel.com (10.109.210.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 11 Jun 2021 19:12:25 +0300
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2242.008;
 Fri, 11 Jun 2021 19:12:25 +0300
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "trix@redhat.com" <trix@redhat.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "tsbogend@alpha.franken.de"
 <tsbogend@alpha.franken.de>, "jic23@kernel.org" <jic23@kernel.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "nbd@nbd.name"
 <nbd@nbd.name>, "lorenzo.bianconi83@gmail.com"
 <lorenzo.bianconi83@gmail.com>, "ryder.lee@mediatek.com"
 <ryder.lee@mediatek.com>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>,
 "davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org"
 <kuba@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com" <joe@perches.com>, 
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, "chenhuacai@kernel.org"
 <chenhuacai@kernel.org>, "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>, 
 "zhangqing@loongson.cn" <zhangqing@loongson.cn>, "jbhayana@google.com"
 <jbhayana@google.com>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>,
 "shayne.chen@mediatek.com" <shayne.chen@mediatek.com>,
 "Soul.Huang@mediatek.com" <Soul.Huang@mediatek.com>, "shorne@gmail.com"
 <shorne@gmail.com>, "gsomlo@gmail.com" <gsomlo@gmail.com>,
 "pczarnecki@internships.antmicro.com" <pczarnecki@internships.antmicro.com>,
 "mholenko@antmicro.com" <mholenko@antmicro.com>, "davidgow@google.com"
 <davidgow@google.com>
Thread-Topic: [PATCH 2/7] mei: hdcp: SPDX tag should be the first line
Thread-Index: AQHXXkH6CZWhH34xEEKudrvKO6IQEasO/INA
Date: Fri, 11 Jun 2021 16:12:24 +0000
Message-ID: <22a4dc49b49348438d71be0fb02e3ab1@intel.com>
References: <20210610214438.3161140-1-trix@redhat.com>
 <20210610214438.3161140-4-trix@redhat.com>
In-Reply-To: <20210610214438.3161140-4-trix@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.184.70.1]
MIME-Version: 1.0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/7] mei: hdcp: SPDX tag should be the
	first line
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

> 
> From: Tom Rix <trix@redhat.com>
> 
> checkpatch looks for the tag on the first line.
> So delete empty first line
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
Acked-by: Tomas Winkler <tomas.winkler@intel.com>
> ---
>  drivers/misc/mei/hdcp/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
> index 95b2d6d37f102..54e1c95269096 100644
> --- a/drivers/misc/mei/hdcp/Kconfig
> +++ b/drivers/misc/mei/hdcp/Kconfig
> @@ -1,4 +1,3 @@
> -
>  # SPDX-License-Identifier: GPL-2.0
>  # Copyright (c) 2019, Intel Corporation. All rights reserved.
>  #
> --
> 2.26.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
