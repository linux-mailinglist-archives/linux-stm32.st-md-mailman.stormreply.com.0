Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19648843D71
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 11:58:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5FEFC6C841;
	Wed, 31 Jan 2024 10:58:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11E64C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 10:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706698730; x=1738234730;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=miXEls7aCVwLJDABniQxOKAOmoSskv8EQdi+pLuHLaQ=;
 b=WDWKp6Jx5FTFMJnp71Kz4/BKZr4eXVmioqe+5DyetqWzOmNGD+6uoUiH
 jWAAlV6hnS+CYXanWWgWxRDRQOeR3ySS6V8bcMe0rKUqwtm73O2NwXAbU
 GlLU5HOKE79ItimFNvs5XqWkfJKlSKJD07ieqlUesuBo0y6GaQhqRYug6
 SGhWTXj0N/qawOGvtAyP/3dHl6KwlH7+IEew4lCEUSZ557rzgF79oDbHU
 L3n6k0FX86FieqUkHGDapzZ3urP4ED2okENjby+i/qcFAZI7ln3lbPTHm
 mEYZWLWWac2plt1DRB2KBQBZm4bbCs7bWCqKshGzADk/9K8W4dp/IDVja Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3407473"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3407473"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:58:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119583211"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="1119583211"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.246.35.167])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:58:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 31 Jan 2024 12:58:32 +0200 (EET)
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <20240129130253.1400707-9-yong.liang.choong@linux.intel.com>
Message-ID: <99d78f25-dd2a-4a52-4c2a-b0e29505a776@linux.intel.com>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
 <20240129130253.1400707-9-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, Alexei Starovoitov <ast@kernel.org>,
 platform-driver-x86@vger.kernel.org, Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 08/11] stmmac: intel:
 configure SerDes according to the interface mode
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

On Mon, 29 Jan 2024, Choong Yong Liang wrote:

> From: "Tan, Tee Min" <tee.min.tan@linux.intel.com>
> 
> Intel platform will configure the SerDes through PMC api based on the
> provided interface mode.
> 
> This patch adds several new functions below:-
> - intel_tsn_interface_is_available(): This new function reads FIA lane
>   ownership registers and common lane registers through IPC commands
>   to know which lane the mGbE port is assigned to.
> - intel_config_serdes(): To configure the SerDes based on the assigned
>   lane and latest interface mode, it sends IPC command to the PMC through
>   PMC driver/API. The PMC acts as a proxy for R/W on behalf of the driver.
> - intel_set_reg_access(): Set the register access to the available TSN
>   interface.
> 
> Signed-off-by: Tan, Tee Min <tee.min.tan@linux.intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 113 +++++++++++++++++-
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.h |  75 ++++++++++++
>  3 files changed, 188 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 85dcda51df05..be423fb2b46c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -273,6 +273,7 @@ config DWMAC_INTEL
>  	default X86
>  	depends on X86 && STMMAC_ETH && PCI
>  	depends on COMMON_CLK
> +	select INTEL_PMC_IPC

INTEL_PMC_IPC has depends on ACPI but selecting INTEL_PMC_IPC won't 
enforce it AFAIK.

-- 
 i.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
