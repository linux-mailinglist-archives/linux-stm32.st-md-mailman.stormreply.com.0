Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20F843D50
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 11:55:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CA46C6C841;
	Wed, 31 Jan 2024 10:55:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E1DDC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 10:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706698516; x=1738234516;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=eubTaO2Xn3E5tDtt+RwQYETkethSKNEFLYxSws5vnIE=;
 b=cdWvkVl3s0rB8zqmGuNrPS4wZW4+a7Ndic77kDFqhU/PmSWFmawr/m1s
 feIaWHc+WA2hRJ3h32BrqJtTQUs0gGPk3KBuoUIvv7ntZiLFKFG/RVELL
 S1la/XHS4E6Tk0F59ygWXsGbDHOqjpHjAHUP1uay1wiRNGpLCZZ89qTjO
 BDIpQxKfiUjk9P5GnzYOZaX094RlYu8F701Fl6G4KK9QIdezvLlJuNiLo
 Nqb7hbVTqNi87O+UjdfmcF9ltJy0ezaqQLhzPxhQjt3Iu3BJeTcUZCGTe
 UnC0+lyNlPQRMjTNPkZhpATbqTXnbbofKHOj0zjonAKMANK3/4QWAfKy+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10667006"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10667006"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:55:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4009100"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.246.35.167])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:55:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 31 Jan 2024 12:54:58 +0200 (EET)
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <20240129130253.1400707-8-yong.liang.choong@linux.intel.com>
Message-ID: <1fccbf0d-5b96-447b-80f1-19af70628edc@linux.intel.com>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
 <20240129130253.1400707-8-yong.liang.choong@linux.intel.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v4 07/11] arch: x86: Add IPC
 mailbox accessor function and add SoC register access
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

> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
> - Add support to use IPC command allows host to access SoC registers
> through PMC firmware that are otherwise inaccessible to the host due to
> security policies.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Chao Qin <chao.qin@intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> ---
>  MAINTAINERS                                   |  2 +
>  arch/x86/Kconfig                              |  9 +++
>  arch/x86/platform/intel/Makefile              |  1 +
>  arch/x86/platform/intel/pmc_ipc.c             | 75 +++++++++++++++++++
>  .../linux/platform_data/x86/intel_pmc_ipc.h   | 34 +++++++++
>  5 files changed, 121 insertions(+)
>  create mode 100644 arch/x86/platform/intel/pmc_ipc.c
>  create mode 100644 include/linux/platform_data/x86/intel_pmc_ipc.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8709c7cd3656..441eb921edef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10973,8 +10973,10 @@ M:	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
>  M:	David E Box <david.e.box@intel.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> +F:	arch/x86/platform/intel/pmc_ipc.c
>  F:	Documentation/ABI/testing/sysfs-platform-intel-pmc
>  F:	drivers/platform/x86/intel/pmc/
> +F:	linux/platform_data/x86/intel_pmc_ipc.h
>  
>  INTEL PMIC GPIO DRIVERS
>  M:	Andy Shevchenko <andy@kernel.org>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 5edec175b9bf..bceae28b9381 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -666,6 +666,15 @@ config X86_AMD_PLATFORM_DEVICE
>  	  I2C and UART depend on COMMON_CLK to set clock. GPIO driver is
>  	  implemented under PINCTRL subsystem.
>  
> +config INTEL_PMC_IPC
> +	tristate "Intel Core SoC Power Management Controller IPC mailbox"
> +	depends on ACPI
> +	help
> +	  This option enables sideband register access support for Intel SoC
> +	  power management controller IPC mailbox.
> +
> +	  If you don't require the option or are in doubt, say N.
> +
>  config IOSF_MBI
>  	tristate "Intel SoC IOSF Sideband support for SoC platforms"
>  	depends on PCI
> diff --git a/arch/x86/platform/intel/Makefile b/arch/x86/platform/intel/Makefile
> index dbee3b00f9d0..470fc68de6ba 100644
> --- a/arch/x86/platform/intel/Makefile
> +++ b/arch/x86/platform/intel/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_IOSF_MBI)			+= iosf_mbi.o
> +obj-$(CONFIG_INTEL_PMC_IPC)		+= pmc_ipc.o
> \ No newline at end of file

New line missing.


-- 
 i.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
