Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EBBBD91F2
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 13:52:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C94CCC3FACE;
	Tue, 14 Oct 2025 11:52:38 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 311EAC35E3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 11:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=vZpO
 rc8jIqdudWaU55WhDn+MoeYiJWe7gJ48hDY+d1M=; b=lHlc4Mk/T4KsX8seSNJQ
 vvL90nUOyuUxzJ/sq5J3piw1hVW61or4bFrdau3nnoyj3BFHrxN3871raQO/I1my
 Bz2hxNc6FqCtd7PgKMnKFKb4zz5l0ZkRZrRwumRqR9BKuI1SJ2ADJNcz2IFKsFdU
 7nuBCXwtqXb1hDr3WwWQTUQ9u509yeoTAuKhGd6ojJX525GWTZA+l2Y1cCCedxki
 RoGYmMz1ynzbjCONDddHsTpxmDfBZnv+OBHrb9nSx93bzg7mxVHuiXUmbzunV9v2
 qfLQ147EJ76zXvWtGcSHT5C/ArHdi6hIp1iJlb+s0EIXecC51hGviWUiT95BVFMO
 +g==
Received: (qmail 2951131 invoked from network); 14 Oct 2025 13:52:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 14 Oct 2025 13:52:28 +0200
X-UD-Smtp-Session: l3s3148p1@0cGqBB1B1OIgAwDPXwQHAL/S9V79e5yL
Date: Tue, 14 Oct 2025 13:52:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <aO45fBIEqFyRq3_k@shikoro>
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
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Roger Quadros <rogerq@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

On Fri, Jul 04, 2025 at 10:54:15AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>

With the dependencies being upstream now, applied to for-current,
thanks!

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
