Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB722B00D5E
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 22:49:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EFFFC349C7;
	Thu, 10 Jul 2025 20:49:57 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5648AC349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 20:49:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A9B3BA5477C;
 Thu, 10 Jul 2025 20:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2068FC4CEF4;
 Thu, 10 Jul 2025 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752180594;
 bh=R7alaaCPHt1AUC5EDQMaWx/LazeRtOK9h/LtGYLubzc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h6fyEEN4OVF3X4z4T6olPNkDshuKXL14P1ZPQgpydfMFcwR9gfB/GOgMD4XCHMsaT
 imvTz7KUSeoR1/jaC3kgG9uR9g+XUykWN4fqfF0+nqa4G5qvdeRbBc9MnFG6JPwpxC
 ox4Ky8S7mPhrBIne33gDYoUD0T/ERZI7PD7fw9WWgjzVEj37q6CWRlQMB9b2NLWezl
 pJUcn55+qsWr3Y3mSb6HfxYvVxDKlTeiX2xva/VTcEnydxdor+JtVDcKnaLMw8YBlC
 yvnIRSbvTfsVnfz3DHpgDKlZWNaOUzIt2YJhwLMQOWTEF/SJIDs2dY6X2jqzlqJK3p
 Bvxnwb3KGLDBg==
Date: Thu, 10 Jul 2025 22:49:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <sj24iciugqjrof6672tvlnxjfvgperdliftfa47cquyfe6g22c@s5e7twdtjhsj>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075415.3218608-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704075415.3218608-1-sakari.ailus@linux.intel.com>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Vignesh R <vigneshr@ti.com>,
 Ajay Gupta <ajayg@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Chris Brandt <chris.brandt@renesas.com>, Elie Morisse <syniurge@gmail.com>,
 Jan Dabros <jsd@semihalf.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Michal Simek <michal.simek@amd.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Andreas Kemnade <andreas@kemnade.info>, Orson Zhai <orsonzhai@gmail.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>, Jean Delvare <jdelvare@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Roger Quadros <rogerq@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 23/80] i2c: Remove redundant
 pm_runtime_mark_last_busy() calls
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

Hi Sakari,

On Fri, Jul 04, 2025 at 10:54:15AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
