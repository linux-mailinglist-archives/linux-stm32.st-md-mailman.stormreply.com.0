Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7276BDCCE
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 00:20:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBBF7C69067;
	Thu, 16 Mar 2023 23:20:27 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA75DC6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 23:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1679008826; x=1710544826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O1jHjEbYbpqFiJyhifBYrEpgoyEcjH6v2vhO3Ok8R2Y=;
 b=Fc1Nmzxu4yNcRtPtemSAY5hY4mXUiNcV+0DuXei0STtnNWI635TenO3e
 nwKxyHQwLHNcH00JwUXlq8+vwjM3jqwHvH1rnf39dRiW/3lwU8ermvg+Z
 XyJsfrvN+CJYbvOwzXesUneh5Y0obyV4yoTPA7AN6dXRPYY2ye3xTJtid
 QQrY6y1NMbO5PabC5UZpIxT3gkHAqASxQaeITYMdThSNq3YKJ7Ve03Pw8
 C9+7Xs0dlKr7AeVyQCSUdUuqlN9mp14uzr/GA/7pMvqUGi93V9TcHAKI6
 5wtcb0kQOq6nTZMJIpCM4y7bj17efLRmwMnWfPQfkf1Xve+1UD7dOFnpz w==;
X-IronPort-AV: E=Sophos;i="5.98,267,1673938800"; d="scan'208";a="205494179"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 16:20:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 16:20:23 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 16 Mar 2023 16:20:22 -0700
Date: Fri, 17 Mar 2023 00:20:22 +0100
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Jochen Henneberg <jh@henneberg-systemdesign.com>
Message-ID: <20230316232022.4xof7vguvpr3brgn@soft-dev3-1>
References: <20230314123759.132521-1-jh@henneberg-systemdesign.com>
 <20230316075940.695583-1-jh@henneberg-systemdesign.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230316075940.695583-1-jh@henneberg-systemdesign.com>
X-Topics: 
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net V2 0/2] net: stmmac: Premature loop
 termination check was ignored
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

The 03/16/2023 08:59, Jochen Henneberg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> As proposed in [1] here is are the fixes as a patch series that do the
> premature end-of-loop check within the goto loop.
> 
> The commit messages now tell us which rx path has been fixed.

Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>

> 
> Jochen Henneberg (2):
>   net: stmmac: Premature loop termination check was ignored on rx
>   net: stmmac: Premature loop termination check was ignored on ZC rx
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> [1] https://lore.kernel.org/all/Y%2FdiTAg2iUopr%2FOy@corigine.com
> --
> 2.39.2
> 

-- 
/Horatiu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
