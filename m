Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ErfmHCMBOWodlQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 11:32:19 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F07026AE406
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 11:32:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=ApxzB7CQ;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0E69C9AE48;
	Mon, 22 Jun 2026 09:32:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 158EAC7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2026 09:32:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B190443A4C;
 Mon, 22 Jun 2026 09:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03291F000E9;
 Mon, 22 Jun 2026 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782120735;
 bh=OjnQqx9lVjDZn9U2JChR5sHB41aObP/M6xjkucf75vg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ApxzB7CQjt2Xqf3nCQt/J3NxrquiCG6Zue6KX9PMhWvInDLEgf9HrutmfGV+I4OZ7
 zqtwEmdv+d7ZUnSxgXUf7wQ/yfKPlsiluNm8NN8XRoE2IOvsi5/jT41VryYw1ihtZF
 kPBG2lzTF/KcN2ULGQgfha3q+Z9+hEBV2Vq3mjFX2altZoyUvtbkUgSLq6h4e9Ji/r
 l9gSXRTlctoiIyMG62c8568RoGjele/qh6tU4+nZa3nZbYEvkeMelJsv1anaF/VS6+
 tIwmmOBQrWGzho4Puta2c9AWjZVwme1jxFKiWokjuwuxfO9ve5v1qPEqaFd0Mxue7d
 27zhi66H4STrA==
From: Maxime Ripard <mripard@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
Date: Mon, 22 Jun 2026 11:32:11 +0200
Message-ID: <178212072827.575553.11508273640952121243.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sandy Huang <hjc@rock-chips.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Liu Ying <victor.liu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Phong LE <ple@baylibre.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andy Yan <andy.yan@rock-chips.com>, Jyri Sarha <jyri.sarha@iki.fi>
Subject: Re: [Linux-stm32] [PATCH v3 00/78] drm/bridge: Convert all reset
	users to create_state
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mripard@kernel.org,m:imx@lists.linux.dev,m:heiko@sntech.de,m:geert+renesas@glider.be,m:tomi.valkeinen@ideasonboard.com,m:Frank.Li@nxp.com,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:paul@crapouillou.net,m:biju.das.jz@bp.renesas.com,m:laurent.pinchart@ideasonboard.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:m.szyprowski@samsung.com,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:linux-rockchip@lists.infradead.org,m:khilman@baylibre.com,m:mcanal@igalia.com,m:magnus.damm@gmail.com,m:martin.blumenstingl@googlemail.com,m:hjc@rock-chips.com,m:jagan@amarulasolutions.com,m:jbrunet@baylibre.com,m:chunkuang.hu@kern
 el.org,m:kernel@pengutronix.de,m:victor.liu@nxp.com,m:s.hauer@pengutronix.de,m:inki.dae@samsung.com,m:linux-mediatek@lists.infradead.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:mcoquelin.stm32@gmail.com,m:lumag@kernel.org,m:yannick.fertre@foss.st.com,m:dave.stevenson@raspberrypi.com,m:dianders@chromium.org,m:linux-kernel@vger.kernel.org,m:ple@baylibre.com,m:kieran.bingham+renesas@ideasonboard.com,m:zhengxingda@iscas.ac.cn,m:p.zabel@pengutronix.de,m:kernel-list@raspberrypi.com,m:andy.yan@rock-chips.com,m:jyri.sarha@iki.fi,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,sntech.de,glider.be,ideasonboard.com,nxp.com,lists.freedesktop.org,vger.kernel.org,crapouillou.net,bp.renesas.com,gmail.com,st-md-mailman.stormreply.com,samsung.com,lists.infradead.org,baylibre.com,igalia.com,googlemail.com,rock-chips.com,amarulasolutions.com,kernel.org,pengutronix.de,amd.com,collabora.com,foss.st.com,raspberrypi.com,chromium.org,iscas.ac.cn,iki.fi];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[60];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F07026AE406

On Fri, 19 Jun 2026 14:24:05 +0200, Maxime Ripard wrote:
> All the bridges use reset to create a blank state only and don't use it
> to reset the hardware at all. This is what the new atomic_create_state
> is exactly supposed to be doing, so we can convert all existing bridge
> users to it, and remove the reset hook and helpers.
> 
> Let me know what you think,
> Maxime
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
