Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uQUwE6RMT2osdwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 09:24:20 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3718C72D928
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 09:24:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=sang-engineering.com header.s=k1 header.b=NuwCZfDv;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D99BCC8F289;
	Thu,  9 Jul 2026 07:24:18 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6349AC1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=gMx8
 43/5S34JEAk8VaWDn/h5oOHvje0shPRIPDVNBUs=; b=NuwCZfDvc91ju+YTsx4n
 eZWwMQbPm+QI4f+FRcoOPL3cEQKcFifbAWJOWfe20PCky4AkARDVTO7jSTImK0ng
 KYaZgKYF5nnCwqAs4KsFUVF7HIlFDaBKbPhucbl1UAZlMoXIFD0+WwRPxFmexC6j
 QsXrtzYDtk9TUduI/3rlJBSGTwEpt3LfNbh5UZqHQWE4jYOdmr4/5fNvvwsBYRFJ
 Wpd9tnh7uHCLgkA4+zbfkLwLNiQZ6I6kO2HYGGya2nLPUYso+L5Kh/hv0inG7DpN
 XsLyWddSoLcbgvRTYh3Hvj0cMvMcMhwLJQEQLct9v1RTgUPKVR6ylOLxKRfuhrsY
 Rg==
Received: (qmail 1017861 invoked from network); 9 Jul 2026 09:24:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 9 Jul 2026 09:24:05 +0200
X-UD-Smtp-Session: l3s3148p1@XaNSgihWothQT+F6
Date: Thu, 9 Jul 2026 09:24:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <ak9MldvSmaDyJn42@shikoro>
References: <20260709023048.599150-1-panchuang@vivo.com>
 <d31c4217-4733-4459-a9d7-265731d295fc@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d31c4217-4733-4459-a9d7-265731d295fc@kernel.org>
Cc: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Laura Nao <laura.nao@collabora.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, Fei Shao <fshao@chromium.org>,
 Magnus Damm <magnus.damm@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 John Madieu <john.madieu.xa@bp.renesas.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Mason Chang <mason-cw.chang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>, Markus Mayer <mmayer@broadcom.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Pan Chuang <panchuang@vivo.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 00/18] thermal/drivers: Remove redundant
 error messages on IRQ request failure
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[renesas];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:imx@lists.linux.dev,m:heiko@sntech.de,m:geert+renesas@glider.be,m:rafael@kernel.org,m:amitk@kernel.org,m:Frank.Li@nxp.com,m:jiapeng.chong@linux.alibaba.com,m:laura.nao@collabora.com,m:alim.akhtar@samsung.com,m:miquel.raynal@bootlin.com,m:srinivas.pandruvada@linux.intel.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:peter.griffin@linaro.org,m:thierry.reding@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:bzolnier@gmail.com,m:florian.fainelli@broadcom.com,m:jirislaby@kernel.org,m:fshao@chromium.org,m:magnus.damm@gmail.com,m:zhuyinbo@loongson.cn,m:jonathanh@nvidia.com,m:john.madieu.xa@bp.renesas.com,m:linux-rockchip@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:rui.zhang@intel.com,m:thara.gopinath@gmail.com,m:linux-tegra@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:frank-w@public-files.de,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:mason-cw.chang@mediatek.com,m:linux-mediatek@lists.infra
 dead.org,m:mmayer@broadcom.com,m:daniel.lezcano@kernel.org,m:matthias.bgg@gmail.com,m:andriy.shevchenko@linux.intel.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:zhanghongchen@loongson.cn,m:linux-pm@vger.kernel.org,m:clamor95@gmail.com,m:panchuang@vivo.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:niklas.soderlund@ragnatech.se,m:lukasz.luba@arm.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:tharagopinath@gmail.com,m:mcoquelinstm32@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DMARC_NA(0.00)[sang-engineering.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	RCPT_COUNT_GT_50(0.00)[51];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,sntech.de,glider.be,kernel.org,nxp.com,linux.alibaba.com,collabora.com,samsung.com,bootlin.com,linux.intel.com,gmail.com,st-md-mailman.stormreply.com,linaro.org,vger.kernel.org,broadcom.com,chromium.org,loongson.cn,nvidia.com,bp.renesas.com,lists.infradead.org,intel.com,public-files.de,pengutronix.de,mediatek.com,vivo.com,ragnatech.se,arm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3718C72D928


> all of these 18 are just one commit, no?

I think so, too.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
