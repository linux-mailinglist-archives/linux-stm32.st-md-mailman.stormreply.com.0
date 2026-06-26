Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JTokHMp3PmqYGgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jun 2026 14:59:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 054906CD3DF
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jun 2026 14:59:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=SUXMgmgW;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A471CC597BF;
	Fri, 26 Jun 2026 12:59:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BE6EC424DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 12:59:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3E51843849;
 Fri, 26 Jun 2026 12:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8032F1F000E9;
 Fri, 26 Jun 2026 12:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782478791;
 bh=iuAhpilzZ82xLPk+JSQEUu87jLlBPaxS3Zm76C7j3bE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=SUXMgmgWimGLbzlNMZ7wcG+1j38gd4fRHDIlDqaegwcqfVuQgLYX8VuUJtvM15vYp
 jX12ep+d309u8bLQbPbyAdBvJmd8GAsRPjPQZkY4YwXDX5gr9XzTy4IoAL7jcTI2rV
 8MTxA1z++Ku+mxv+86TWL/aJ6xmEhLbsBHRnhMPe0NgKiyIhsLVeyivZGTUIIikGnb
 y3xB6TtxeLHebb/RguAspWG9yWJwnaIq7UkWwS/TVbfgzD/kJBZNxTlsLf/tTqaRX3
 91ZGmQgom/jibidOew2L8xqAHAtkawCvVu8yAOpBH0ClZXAOWEuwCJJPHM/LEHesNi
 Azxjd24IvLvoA==
Date: Fri, 26 Jun 2026 14:59:48 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Albert Esteve <aesteve@redhat.com>
Message-ID: <20260626-ivory-tarantula-of-valor-af0e2a@houat>
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-5-cca1a7b3bdef@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260626-drm_refcount_wiring-v1-5-cca1a7b3bdef@redhat.com>
Cc: imx@lists.linux.dev, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>,
 Stefan Agner <stefan@agner.ch>, Mikko Perttunen <mperttunen@nvidia.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Griffin <peter.griffin@linaro.org>, linux-rockchip@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-sunxi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Marek Vasut <marex@denx.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Jyri Sarha <jyri.sarha@iki.fi>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 5/5] drm: release panel reference after
 panel bridge creation
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
Content-Type: multipart/mixed; boundary="===============8513366460017412957=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.19 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:aesteve@redhat.com,m:imx@lists.linux.dev,m:heiko@sntech.de,m:geert+renesas@glider.be,m:tomi.valkeinen@ideasonboard.com,m:Frank.Li@nxp.com,m:stefan@agner.ch,m:mperttunen@nvidia.com,m:paul@crapouillou.net,m:linux-tegra@vger.kernel.org,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:m.szyprowski@samsung.com,m:simona@ffwll.ch,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:rfoss@kernel.org,m:samuel@sholland.org,m:airlied@gmail.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:jagan@amarulasolutions.com,m:alim.akhtar@samsung.com,m:linux-mips@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:linux-sunxi@lists.linux.dev,m:mcoquelin.stm32@gmail.com,m:marex@denx.de,m:kernel@pengutronix.de,m:jonas@kwiboo.se,m:s.hauer@pengutronix.de,m:alison.wang@nxp.c
 om,m:maarten.lankhorst@linux.intel.com,m:inki.dae@samsung.com,m:linux-samsung-soc@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:laurentiu.palcu@oss.nxp.com,m:biju.das.jz@bp.renesas.com,m:krzk@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:jingoohan1@gmail.com,m:linusw@kernel.org,m:sw0312.kim@samsung.com,m:hjc@rock-chips.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:jesszhan0024@gmail.com,m:kyungmin.park@samsung.com,m:kieran.bingham+renesas@ideasonboard.com,m:philippe.cornu@foss.st.com,m:tzimmermann@suse.de,m:andy.yan@rock-chips.com,m:paulk@sys-base.io,m:jyri.sarha@iki.fi,m:yannick.fertre@foss.st.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:laurent.pinchart@ideasonboard.com,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.linux.dev,sntech.de,glider.be,ideasonboard.com,nxp.com,agner.ch,nvidia.com,crapouillou.net,vger.kernel.org,intel.com,gmail.com,st-md-mailman.stormreply.com,samsung.com,ffwll.ch,kernel.org,sholland.org,linaro.org,lists.infradead.org,amarulasolutions.com,bootlin.com,denx.de,pengutronix.de,kwiboo.se,linux.intel.com,lists.freedesktop.org,oss.nxp.com,bp.renesas.com,rock-chips.com,foss.st.com,suse.de,sys-base.io,iki.fi];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[houat:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 054906CD3DF


--===============8513366460017412957==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hx5apeednlr6fj2q"
Content-Disposition: inline


--hx5apeednlr6fj2q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/5] drm: release panel reference after panel bridge
 creation
MIME-Version: 1.0

On Fri, Jun 26, 2026 at 02:03:27PM +0200, Albert Esteve wrote:
> of_drm_find_panel() and drm_of_find_panel_or_bridge() now return a
> counted reference. In drivers that immediately wrap the panel in a
> bridge via devm_drm_panel_bridge_add() or equivalent, the bridge
> acquires its own reference, so the caller's lookup reference must be
> released right afterwards.
>=20
> Also handle the cases where a panel is found but cannot be used,
> dropping the reference immediately in those paths.
>=20
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

drm_of_find_panel_or_bridge() does indeed return a refcounted pointer
now, but afaik the doc wasn't updated to reflect that.

More importantly, I feel like with both of_drm_find_panel and
drm_of_find_panel_or_bridge we update a path that is considered legacy
anyway now, and we should rather focus on providing a safe alternative.

But none of the functions you updated are unsafe, so it won't be more
unsafe, or provide any illusion of safety to the caller. Idk.

Either way, this should all be on its way out if Luca creates a bridge
for every panel, and we'll consolidate on bridges only, so maybe it's
not such a big deal to merge this patch.

Maxime

--hx5apeednlr6fj2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaj53xAAKCRAnX84Zoj2+
dsH4AX98DVuJ2nWYEJlnvBoa7TLPQIxJp+N3SqD7GpI68AgQPx9+XXIRd6eD3iVF
E+I0SeQBgPnPf10X5ME+9qUOY4BE8jXvhoS7IaHARK1hueut9qHTwNXhFYoQyHlo
Wk/+lJPV9A==
=+ukr
-----END PGP SIGNATURE-----

--hx5apeednlr6fj2q--

--===============8513366460017412957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8513366460017412957==--
