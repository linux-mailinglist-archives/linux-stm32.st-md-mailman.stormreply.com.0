Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E4+SGg91PmrHGQkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jun 2026 14:48:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFFC6CD22E
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jun 2026 14:48:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=c1nHVby4;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC95BC597BF;
	Fri, 26 Jun 2026 12:48:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B888DC424DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 12:48:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D86E16020F;
 Fri, 26 Jun 2026 12:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7ABE1F000E9;
 Fri, 26 Jun 2026 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782478092;
 bh=v4y2stLxJY7uDBiTbKNkCgVELhkFZRy7m3W4tRJdf+E=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc;
 b=c1nHVby4VzRMzYi1WtQ/1/FW3ad4AR7RuNig6IMp0LM3ATUWQciaqWn60HmhO2Mvx
 cNEqkAHm18Hvnr+k13yWAhq+yWo1uNw3hHWs3Q8x1TMAn1T5q4A954G06yoTZ/xqv7
 lRQaMyVCNzPQM45PccrZMMHmAIAiMKXOnHAYfj6tLYr6w+/gjiQcRXuiPq4vQPbvJZ
 cLkFy6mqvFRYiquJKKOAOxqBTRMC3VrfNBzcr08WK3a7LEXgOXrYKDLUf/GU7q1FJs
 LJqnxBYj30rKVQA7A4J67kU/ZHMfl/2PT7/+94GYQY7CBjUcCvqoe/B9jXAyzpvIl0
 O2OBomnk1cP5w==
Message-ID: <c5dc7d7db15a943d1b902469d79f4eb2@kernel.org>
Date: Fri, 26 Jun 2026 12:48:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Albert Esteve" <aesteve@redhat.com>
In-Reply-To: <20260626-drm_refcount_wiring-v1-2-cca1a7b3bdef@redhat.com>
References: <20260626-drm_refcount_wiring-v1-2-cca1a7b3bdef@redhat.com>
Cc: imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>, Alim
 Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Frank
 Li <Frank.Li@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul
 Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, David
 Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
 Marek Vasut <marex@denx.de>, Raphael
 Gallais-Pou <rgallaispou@gmail.com>, Thierry
 Reding <thierry.reding@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Samuel
 Holland <samuel@sholland.org>, Fabio Estevam <festevam@gmail.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Magnus Damm <magnus.damm@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Griffin <peter.griffin@linaro.org>, linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev, Simona
 Vetter <simona@ffwll.ch>, Mikko
 Perttunen <mperttunen@nvidia.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Jonas
 Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Stefan Agner <stefan@agner.ch>, Laurentiu
 Palcu <laurentiu.palcu@oss.nxp.com>, Biju
 Das <biju.das.jz@bp.renesas.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jingoo Han <jingoohan1@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jessica
 Zhang <jesszhan0024@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Philippe
 Cornu <philippe.cornu@foss.st.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 Lucas Stach <l.stach@pengutronix.de>, Jyri
 Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH 2/5] drm/bridge/panel: hold a reference to
 the wrapped panel
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aesteve@redhat.com,m:imx@lists.linux.dev,m:s.hauer@pengutronix.de,m:alim.akhtar@samsung.com,m:geert+renesas@glider.be,m:tomi.valkeinen@ideasonboard.com,m:Frank.Li@nxp.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:paul@crapouillou.net,m:linux-tegra@vger.kernel.org,m:krzk@kernel.org,m:andrzej.hajda@intel.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:marex@denx.de,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:rfoss@kernel.org,m:samuel@sholland.org,m:festevam@gmail.com,m:paulk@sys-base.io,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:hjc@rock-chips.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:luca.ceresoli@bootlin.com,m:linux-sunxi@lists.linux.dev,m:simona@ffwll.ch,m:mperttunen@nvidia.com,m:kernel@pengutronix.de,m:jonas@kwiboo.se,m:alison.wang@
 nxp.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:inki.dae@samsung.com,m:laurent.pinchart+renesas@ideasonboard.com,m:stefan@agner.ch,m:laurentiu.palcu@oss.nxp.com,m:biju.das.jz@bp.renesas.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:tzimmermann@suse.de,m:jingoohan1@gmail.com,m:linusw@kernel.org,m:sw0312.kim@samsung.com,m:linux-mips@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:jesszhan0024@gmail.com,m:kyungmin.park@samsung.com,m:kieran.bingham+renesas@ideasonboard.com,m:philippe.cornu@foss.st.com,m:mcoquelin.stm32@gmail.com,m:andy.yan@rock-chips.com,m:l.stach@pengutronix.de,m:jyri.sarha@iki.fi,m:yannick.fertre@foss.st.com,m:Laurent.pinchart@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[lists.linux.dev,pengutronix.de,samsung.com,glider.be,ideasonboard.com,nxp.com,lists.freedesktop.org,vger.kernel.org,crapouillou.net,kernel.org,intel.com,gmail.com,st-md-mailman.stormreply.com,sntech.de,denx.de,sholland.org,sys-base.io,nvidia.com,linaro.org,lists.infradead.org,rock-chips.com,amarulasolutions.com,bootlin.com,ffwll.ch,kwiboo.se,linux.intel.com,agner.ch,oss.nxp.com,bp.renesas.com,suse.de,foss.st.com,iki.fi];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFFFC6CD22E

On Fri, 26 Jun 2026 14:03:24 +0200, Albert Esteve wrote:
> drm_panel_bridge_add_typed() stores a pointer to the drm_panel it
> wraps, but never acquires a reference to it. If the panel device
> goes away while a panel_bridge still exists, the dangling pointer can
> be dereferenced through panel_bridge->panel.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
