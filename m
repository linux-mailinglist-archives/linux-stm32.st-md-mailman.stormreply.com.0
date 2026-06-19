Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hxonM2FHNWpHrAYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jun 2026 15:42:57 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B9F6A626D
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jun 2026 15:42:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=2OHXR1Qw;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAB5BC9AE48;
	Fri, 19 Jun 2026 13:42:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 414BAC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2026 13:42:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8B1B7C06CDC;
 Fri, 19 Jun 2026 13:43:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A0BA6601AD;
 Fri, 19 Jun 2026 13:42:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9861106C88A8; 
 Fri, 19 Jun 2026 15:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1781876571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=17i6oa0M6UmVrMWmDG7cWGhbnxl14z0/BIWH4Fd9A3Y=;
 b=2OHXR1QwtCE+m9KORcKStlkcA6ag+ntrhh38YC8FuWi4Ivanof2kMKZSiDIi8KDy/rJyOy
 d9n5jfH4IyN51n8RfW5VcLV8ajZhRXvgOa5R+0d6jYOJlGpRQ8Ei+7ncYisPtX154p/itA
 +FVS4408GK6t2mbJW4PGkgW8pjPtp0vASGX+Kfy16/0IwPEQZfEFJaECutzX09avkZUJFd
 QP6TokojrSOrCy+kB+ysimzb7jkt7bgeZJOi91eLy/pgdjhtdRh6ocFi/X0UOYZD7EK78Z
 Hch7VJW8YQWSdBwSR/Bp3d6ZAidfHERZnrYDFVzmEH+M4z5scGH6fREi9mAoVw==
Mime-Version: 1.0
Date: Fri, 19 Jun 2026 15:42:30 +0200
Message-Id: <DJD2IQSFENH4.337VSFOU7OJ29@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sandy
 Huang <hjc@rock-chips.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix
 Kernel Team <kernel@pengutronix.de>, Liu Ying <victor.liu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Yannick
 Fertre <yannick.fertre@foss.st.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Douglas
 Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:imx@lists.linux.dev,m:heiko@sntech.de,m:geert+renesas@glider.be,m:tomi.valkeinen@ideasonboard.com,m:Frank.Li@nxp.com,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:paul@crapouillou.net,m:biju.das.jz@bp.renesas.com,m:laurent.pinchart@ideasonboard.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:m.szyprowski@samsung.com,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:linux-rockchip@lists.infradead.org,m:khilman@baylibre.com,m:mcanal@igalia.com,m:magnus.damm@gmail.com,m:martin.blumenstingl@googlemail.com,m:hjc@rock-chips.com,m:jagan@amarulasolutions.com,m:jbrunet@baylibre.com,m:chunkuang.hu@kern
 el.org,m:kernel@pengutronix.de,m:victor.liu@nxp.com,m:s.hauer@pengutronix.de,m:inki.dae@samsung.com,m:linux-mediatek@lists.infradead.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:mcoquelin.stm32@gmail.com,m:lumag@kernel.org,m:yannick.fertre@foss.st.com,m:dave.stevenson@raspberrypi.com,m:dianders@chromium.org,m:linux-kernel@vger.kernel.org,m:ple@baylibre.com,m:kieran.bingham+renesas@ideasonboard.com,m:zhengxingda@iscas.ac.cn,m:p.zabel@pengutronix.de,m:kernel-list@raspberrypi.com,m:andy.yan@rock-chips.com,m:jyri.sarha@iki.fi,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[60];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,sntech.de,glider.be,ideasonboard.com,nxp.com,lists.freedesktop.org,vger.kernel.org,crapouillou.net,bp.renesas.com,gmail.com,st-md-mailman.stormreply.com,samsung.com,lists.infradead.org,baylibre.com,igalia.com,googlemail.com,rock-chips.com,amarulasolutions.com,kernel.org,pengutronix.de,amd.com,collabora.com,foss.st.com,raspberrypi.com,chromium.org,iscas.ac.cn,iki.fi];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56B9F6A626D

On Fri Jun 19, 2026 at 2:24 PM CEST, Maxime Ripard wrote:
> Hi,
>
> All the bridges use reset to create a blank state only and don't use it
> to reset the hardware at all. This is what the new atomic_create_state
> is exactly supposed to be doing, so we can convert all existing bridge
> users to it, and remove the reset hook and helpers.
>
> Let me know what you think,
> Maxime
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Whole series:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
