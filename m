Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D2DAFAFD3
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jul 2025 11:35:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A26E6C3F92E;
	Mon,  7 Jul 2025 09:35:23 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1070C3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jul 2025 09:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751880922;
 bh=2KBGhRNRyu3KxKn6GIG4TbV6xPdWbM2wn5dZMB9SwMg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Oldu+a0VgFeTz4ZmDWKL4P8Va82avt4ARmhJlS2yFgTJjOSAayotvoVgOBdyLKQrX
 I1dtTSwd42mT7lZsbD3fUGE9ZzXFPtJOzhZn1zvpto+sPhUwZLXxhSqrBhv2rhCek5
 /2++qG08N8VwEHBH5vEJKp4pFpNZeOasVjsgBGiPR6hZIV7hraT1lwaXLWs1w2dkoQ
 Q+0qQlXcTqD6GjGJqVSoNf3wL2xXb9KF+7t7hpq9yLmcIRMBD/7wOqrpTTKyMEsowE
 FkeAIcxgQYx5wE9J9a5a9p8ikU+pXvBbtk/V0kK7+84js2Hax5tP1YMfH/GjvrtdDz
 blzzKR5GBKwEA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F59717E1083;
 Mon,  7 Jul 2025 11:35:20 +0200 (CEST)
Message-ID: <ae202795-5194-40a6-8d3d-3a17c85c878d@collabora.com>
Date: Mon, 7 Jul 2025 11:35:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Hadar Gat <hadar.gat@arm.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Daniel Golle
 <daniel@makrotopia.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Marek Vasut <marex@denx.de>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075359.3217036-1-sakari.ailus@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250704075359.3217036-1-sakari.ailus@linux.intel.com>
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/80] hwrng: Remove redundant
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Il 04/07/25 09:53, Sakari Ailus ha scritto:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
