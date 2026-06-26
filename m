Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tarLNpARQmrCzgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 08:32:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC8A6D65A9
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 08:32:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=redhat.com header.s=mimecast20190719 header.b=IucztFzk;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=redhat.com (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D7ABC9AE40;
	Mon, 29 Jun 2026 06:25:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AFECC424DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 15:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782486727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
 b=IucztFzkThIEwOajAhn+zqBfJ+suPv8RGKGssYWDwzdr0BSp0vnPP3ftsf2Gt+aE72xgXp
 +mvnYvC1WxPjQH/1O0Ng7MSfUljHI5ukMrHCtOahfWnZF9jxS7dEb3FEZW4kz03y1o01lG
 obCYAlOckTf2RuBpW6st8jTakSMFPKw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-jk-Z_LpFPwuHX8XPTs9Isw-1; Fri, 26 Jun 2026 11:11:54 -0400
X-MC-Unique: jk-Z_LpFPwuHX8XPTs9Isw-1
X-Mimecast-MFC-AGG-ID: jk-Z_LpFPwuHX8XPTs9Isw_1782486714
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-7fd85d01ed0so21866027b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 08:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782486714; x=1783091514;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
 b=YrohUOIbWHrEO2JxBXivY6fofb7wJx0Um7o7edbuLiaaOmCSFgj9cHzO53EjLvXmbA
 8b1slTYcqO+MGU1p71fHLKlcBzZvz5zmsdAg0Fg26zgLNA/0cpUy4QJCUxOwu0Qk/d+0
 NdgajwNxS9gx8EkEupRB9b2lFnmIRutB1Z+Qm5Uhq5JJM4+gw88+/KkGKDFShbfAoMm5
 aGPEYtqfyLNGsWraKsoSwpgcutR86BCyHKUqVgl6TO/xim21MWTfdOOHO3/TDA4e3uCA
 nQr2YahPGPnCdBzwkaX2UNuZPXbP5F2ocdAyn0dg0VDv0c7aoMNyF7wmfcpG5Ll6/UIX
 NT9g==
X-Forwarded-Encrypted: i=1;
 AHgh+RolYWDhNbEFzBVI5Sx4kG0URQA46dTYvqKmWWh9BxPDz00T2O2RGxO68VbjC3vc6kvgzQtBgzSigA+MBg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxXk9p1JXd6WisnFyiKhKtKcwnpd7oKer3TymQHXaQqj7se8o3z
 LhJ4jhzQEG8Xww1GjFCa2YNbhC73eXKbs65p7IAVDpQ4Qr30/kiIqfshqYMoVCKexftOyldQTzN
 OyriVOXX3JUjzhne82PulU9JvSTumzHtzTLYU6Q8rDcl5DkOSA7afQHd24qGFmbZZ35G9N4qoCs
 VMQ5BmbUiCB6TmsBifmUzLOV/utImuztIF9EcLTCLt3pgIfQdApTo0CNeg
X-Gm-Gg: AfdE7cl9Yqet7+X9TxEL0A3YXEC7ud/nPswSmM3tgL1n/pH5vfLxgNXwFl9TG8ICEo1
 MURtdDzuD95w8JJyQfSYZI/QPoZz8OhrLQGCjY4flk0d+0rL8GngUITHybzfS6rhTeH5qA9J1FD
 zXHHf2vYzeMng1Wp5k5Yx550ELKWPu+F6QJI0QGlRhix6zC9kXSM32NfMbUiSnS8vB
X-Received: by 2002:a05:690c:6804:b0:7fc:cbe1:746d with SMTP id
 00721157ae682-80c73fe6f4bmr9719387b3.42.1782486713990; 
 Fri, 26 Jun 2026 08:11:53 -0700 (PDT)
X-Received: by 2002:a05:690c:6804:b0:7fc:cbe1:746d with SMTP id
 00721157ae682-80c73fe6f4bmr9718797b3.42.1782486713496; Fri, 26 Jun 2026
 08:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-3-cca1a7b3bdef@redhat.com>
 <20260626-successful-badger-from-neptune-ae2bc6@houat>
In-Reply-To: <20260626-successful-badger-from-neptune-ae2bc6@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 17:11:42 +0200
X-Gm-Features: AVVi8CdeJARTOKb4ohxfJd8a69EdpRugjimEtA7qtwxmMR2cbKOdWmwQblTZgKI
Message-ID: <CADSE00LO98u6aDwvjijO_hAaMBXSGXaWPuFWiveQi_RWQ0MTVA@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aGKTaNs-qEo8zPh_PVPpDZQYNgE1r9HRPT7uZ_xbGPA_1782486714
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2026 06:25:43 +0000
Cc: imx@lists.linux.dev, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
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
Subject: Re: [Linux-stm32] [PATCH 3/5] drm/panel: make *find_panel*() return
	a counted reference
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[63];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:imx@lists.linux.dev,m:heiko@sntech.de,m:geert+renesas@glider.be,m:tomi.valkeinen@ideasonboard.com,m:Frank.Li@nxp.com,m:stefan@agner.ch,m:mperttunen@nvidia.com,m:paul@crapouillou.net,m:linux-tegra@vger.kernel.org,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:m.szyprowski@samsung.com,m:simona@ffwll.ch,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:rfoss@kernel.org,m:samuel@sholland.org,m:airlied@gmail.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:jagan@amarulasolutions.com,m:alim.akhtar@samsung.com,m:linux-mips@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:linux-sunxi@lists.linux.dev,m:mcoquelin.stm32@gmail.com,m:marex@denx.de,m:kernel@pengutronix.de,m:jonas@kwiboo.se,m:s.hauer@pengutronix.de,m:alison.wang@nxp.c
 om,m:maarten.lankhorst@linux.intel.com,m:inki.dae@samsung.com,m:linux-samsung-soc@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:laurentiu.palcu@oss.nxp.com,m:biju.das.jz@bp.renesas.com,m:krzk@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:jingoohan1@gmail.com,m:linusw@kernel.org,m:sw0312.kim@samsung.com,m:hjc@rock-chips.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:jesszhan0024@gmail.com,m:kyungmin.park@samsung.com,m:kieran.bingham+renesas@ideasonboard.com,m:philippe.cornu@foss.st.com,m:tzimmermann@suse.de,m:andy.yan@rock-chips.com,m:paulk@sys-base.io,m:jyri.sarha@iki.fi,m:yannick.fertre@foss.st.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:laurent.pinchart@ideasonboard.com,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[aesteve@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[64];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,sntech.de,glider.be,ideasonboard.com,nxp.com,agner.ch,nvidia.com,crapouillou.net,vger.kernel.org,intel.com,gmail.com,st-md-mailman.stormreply.com,samsung.com,ffwll.ch,kernel.org,sholland.org,linaro.org,lists.infradead.org,amarulasolutions.com,bootlin.com,denx.de,pengutronix.de,kwiboo.se,linux.intel.com,lists.freedesktop.org,oss.nxp.com,bp.renesas.com,rock-chips.com,foss.st.com,suse.de,sys-base.io,iki.fi];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BC8A6D65A9

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMjo1MOKAr1BNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAyNiwgMjAyNiBhdCAwMjowMzoyNVBN
ICswMjAwLCBBbGJlcnQgRXN0ZXZlIHdyb3RlOgo+ID4gQ2FsbGVycyBvZiBvZl9kcm1fZmluZF9w
YW5lbCgpIHJlY2VpdmUgYSBwb2ludGVyIHdpdGggbm8gcmVmZXJlbmNlCj4gPiBoZWxkLCBjcmVh
dGluZyBhIHdpbmRvdyB3aGVyZSB0aGUgcGFuZWwgZGV2aWNlIGNhbiBiZSB1bnJlZ2lzdGVyZWQK
PiA+IGFuZCBmcmVlZCBiZXR3ZWVuIHRoZSBsb29rdXAgYW5kIGZpcnN0IHVzZSAoZS5nLiwgZHJt
X3BhbmVsX3ByZXBhcmUoKSkuCj4gPgo+ID4gZmluZF9wYW5lbF9ieV9md25vZGUoKSBpcyB0aGUg
Zndub2RlIGNvdW50ZXJwYXJ0IG9mIG9mX2RybV9maW5kX3BhbmVsKCkuCj4gPiBkcm1fcGFuZWxf
YWRkX2ZvbGxvd2VyKCkgd29ya2VkIGFyb3VuZCB0aGUgbWlzc2luZyBwYW5lbCBrcmVmIGJ5IGNh
bGxpbmcKPiA+IGdldF9kZXZpY2UoKSBvbiB0aGUgcGFuZWwncyB1bmRlcmx5aW5nIHN0cnVjdCBk
ZXZpY2UuIEhvd2V2ZXIsIGdldF9kZXZpY2UoKQo+ID4gb25seSBwcmV2ZW50cyB0aGUgZGV2aWNl
IGtvYmplY3QgZnJvbSBiZWluZyBmcmVlZC4gSXQgZG9lcyBub3QgcHJldmVudCB0aGUKPiA+IHBh
bmVsJ3Mga3phbGxvYygpJ2QgY29udGFpbmVyIG1lbW9yeSBmcm9tIGJlaW5nIHJlbGVhc2VkIHdo
ZW4gdGhlIGtyZWYKPiA+IHJlYWNoZXMgemVyby4KPiA+Cj4gPiBGaXggYm90aCBsb29rdXAgZnVu
Y3Rpb25zIGJ5IGFjcXVpcmluZyBhIHJlZmVyZW5jZSB3aXRoIGRybV9wYW5lbF9nZXQoKQo+ID4g
YmVmb3JlIHJldHVybmluZywgdW5kZXIgcGFuZWxfbG9jay4gQ2FsbGVycyBhcmUgbm93IHJlc3Bv
bnNpYmxlIGZvciBjYWxsaW5nCj4gPiBkcm1fcGFuZWxfcHV0KCkgd2hlbiB0aGV5IG5vIGxvbmdl
ciBuZWVkIHRoZSBwb2ludGVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsYmVydCBFc3RldmUg
PGFlc3RldmVAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGFu
ZWwuYyB8IDIyICsrKysrKysrKysrKysrKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9wYW5lbC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gPiBp
bmRleCA1NDVmZTkzZGMyOGZlLi5hMDBhZTk4ZWQwOTU2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVs
LmMKPiA+IEBAIC00NTgsMTQgKzQ1OCwxNyBAQCBFWFBPUlRfU1lNQk9MKF9fZGV2bV9kcm1fcGFu
ZWxfYWxsb2MpOwo+ID4KPiA+ICAjaWZkZWYgQ09ORklHX09GCj4gPiAgLyoqCj4gPiAtICogb2Zf
ZHJtX2ZpbmRfcGFuZWwgLSBsb29rIHVwIGEgcGFuZWwgdXNpbmcgYSBkZXZpY2UgdHJlZSBub2Rl
Cj4gPiArICogb2ZfZHJtX2ZpbmRfcGFuZWwgLSBsb29rIHVwIGFuZCByZWZlcmVuY2UgYSBwYW5l
bCBieSBkZXZpY2UgdHJlZSBub2RlCj4gPiAgICogQG5wOiBkZXZpY2UgdHJlZSBub2RlIG9mIHRo
ZSBwYW5lbAo+ID4gICAqCj4gPiAgICogU2VhcmNoZXMgdGhlIHNldCBvZiByZWdpc3RlcmVkIHBh
bmVscyBmb3Igb25lIHRoYXQgbWF0Y2hlcyB0aGUgZ2l2ZW4gZGV2aWNlCj4gPiAtICogdHJlZSBu
b2RlLiBJZiBhIG1hdGNoaW5nIHBhbmVsIGlzIGZvdW5kLCByZXR1cm4gYSBwb2ludGVyIHRvIGl0
Lgo+ID4gKyAqIHRyZWUgbm9kZS4gSWYgYSBtYXRjaGluZyBwYW5lbCBpcyBmb3VuZCwgdGhlIHBh
bmVsJ3MgcmVmZXJlbmNlIGNvdW50IGlzCj4gPiArICogaW5jcmVtZW50ZWQgYmVmb3JlIHJldHVy
bmluZyBhIHBvaW50ZXIgdG8gaXQuIFRoZSBjYWxsZXIgbXVzdCBjYWxsCj4gPiArICogZHJtX3Bh
bmVsX3B1dCgpIHdoZW4gaXQgbm8gbG9uZ2VyIG5lZWRzIHRoZSBwYW5lbCBwb2ludGVyLgo+ID4g
ICAqCj4gPiAtICogUmV0dXJuOiBBIHBvaW50ZXIgdG8gdGhlIHBhbmVsIHJlZ2lzdGVyZWQgZm9y
IHRoZSBzcGVjaWZpZWQgZGV2aWNlIHRyZWUKPiA+IC0gKiBub2RlIG9yIGFuIEVSUl9QVFIoKSBp
ZiBubyBwYW5lbCBtYXRjaGluZyB0aGUgZGV2aWNlIHRyZWUgbm9kZSBjYW4gYmUgZm91bmQuCj4g
PiArICogUmV0dXJuOiBBIHJlZmVyZW5jZS1jb3VudGVkIHBvaW50ZXIgdG8gdGhlIHBhbmVsIHJl
Z2lzdGVyZWQgZm9yIHRoZSBzcGVjaWZpZWQKPiA+ICsgKiBkZXZpY2UgdHJlZSBub2RlIG9yIGFu
IEVSUl9QVFIoKSBpZiBubyBwYW5lbCBtYXRjaGluZyB0aGUgZGV2aWNlIHRyZWUgbm9kZQo+ID4g
KyAqIGNhbiBiZSBmb3VuZC4KPiA+ICAgKgo+ID4gICAqIFBvc3NpYmxlIGVycm9yIGNvZGVzIHJl
dHVybmVkIGJ5IHRoaXMgZnVuY3Rpb246Cj4gPiAgICoKPiA+IEBAIC00ODQsNiArNDg3LDcgQEAg
c3RydWN0IGRybV9wYW5lbCAqb2ZfZHJtX2ZpbmRfcGFuZWwoY29uc3Qgc3RydWN0IGRldmljZV9u
b2RlICpucCkKPiA+Cj4gPiAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHBhbmVsLCAmcGFuZWxf
bGlzdCwgbGlzdCkgewo+ID4gICAgICAgICAgICAgICBpZiAocGFuZWwtPmRldi0+b2Zfbm9kZSA9
PSBucCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRybV9wYW5lbF9nZXQocGFuZWwpOwo+
ID4gICAgICAgICAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmcGFuZWxfbG9jayk7Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHBhbmVsOwo+ID4gICAgICAgICAgICAgICB9Cj4g
PiBAQCAtNTM4LDcgKzU0MiwxMyBAQCBpbnQgb2ZfZHJtX2dldF9wYW5lbF9vcmllbnRhdGlvbihj
b25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gIEVYUE9SVF9TWU1CT0wob2ZfZHJtX2dl
dF9wYW5lbF9vcmllbnRhdGlvbik7Cj4gPiAgI2VuZGlmCj4gPgo+ID4gLS8qIEZpbmQgcGFuZWwg
YnkgZndub2RlLiBUaGlzIHNob3VsZCBiZSBpZGVudGljYWwgdG8gb2ZfZHJtX2ZpbmRfcGFuZWwo
KS4gKi8KPiA+ICsvKgo+ID4gKyAqIEZpbmQgcGFuZWwgYnkgZndub2RlLCByZXR1cm5pbmcgYSBj
b3VudGVkIHJlZmVyZW5jZS4KPiA+ICsgKgo+ID4gKyAqIEJlaGF2ZXMgaWRlbnRpY2FsbHkgdG8g
b2ZfZHJtX2ZpbmRfcGFuZWwoKS4gT24gc3VjY2VzcyB0aGUgcmV0dXJuZWQKPiA+ICsgKiBwb2lu
dGVyIGhhcyBiZWVuIHBhc3NlZCB0aHJvdWdoIGRybV9wYW5lbF9nZXQoKTsgdGhlIGNhbGxlciBt
dXN0IGNhbGwKPiA+ICsgKiBkcm1fcGFuZWxfcHV0KCkgd2hlbiBkb25lIHdpdGggaXQuCj4gPiAr
ICovCj4gPiAgc3RhdGljIHN0cnVjdCBkcm1fcGFuZWwgKmZpbmRfcGFuZWxfYnlfZndub2RlKGNv
bnN0IHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUpCj4gPiAgewo+ID4gICAgICAgc3RydWN0
IGRybV9wYW5lbCAqcGFuZWw7Cj4gPiBAQCAtNTUwLDYgKzU2MCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
ZHJtX3BhbmVsICpmaW5kX3BhbmVsX2J5X2Z3bm9kZShjb25zdCBzdHJ1Y3QgZndub2RlX2hhbmRs
ZSAqZndub2RlCj4gPgo+ID4gICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShwYW5lbCwgJnBhbmVs
X2xpc3QsIGxpc3QpIHsKPiA+ICAgICAgICAgICAgICAgaWYgKGRldl9md25vZGUocGFuZWwtPmRl
dikgPT0gZndub2RlKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZHJtX3BhbmVsX2dldChw
YW5lbCk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZwYW5lbF9sb2Nr
KTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcGFuZWw7Cj4gPiAgICAgICAgICAg
ICAgIH0KPgo+IFRoaXMgcGFydCBzaG91bGQgcHJvYmFibHkgYmUgaW4gYSBzZXBhcmF0ZSBwYXRj
aAoKWWVzLiBUaGlzIGlzIGFub3RoZXIgcGxhY2Ugd2hlcmUgSSBoZXNpdGF0ZWQgb24gb3JnYW5p
emF0aW9uLCBhcyBpdCBpcwp2ZXJ5IHNpbWlsYXIgdG8gb2ZfZHJtX2ZpbmRfcGFuZWwoKSBmaXgu
IEJ1dCBmaW5kX3BhbmVsX2J5X2Z3bm9kZSgpIGlzCm11Y2ggbW9yZSBzZWxmLWNvbnRhaW5lZCAo
aXQgaXMgZGVjbGFyZWQgc3RhdGljIHRvIGJlZ2luIHdpdGgpLiBTbyBpdAptYWtlcyBzZW5zZSB0
byBzcGxpdCB0aGVtLiBJIHdpbGwgZG8gc28gaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4KPiA+IEBA
IC02ODYsNiArNjk3LDcgQEAgdm9pZCBkcm1fcGFuZWxfcmVtb3ZlX2ZvbGxvd2VyKHN0cnVjdCBk
cm1fcGFuZWxfZm9sbG93ZXIgKmZvbGxvd2VyKQo+ID4gICAgICAgbXV0ZXhfdW5sb2NrKCZwYW5l
bC0+Zm9sbG93ZXJfbG9jayk7Cj4gPgo+ID4gICAgICAgcHV0X2RldmljZShwYW5lbC0+ZGV2KTsK
PiA+ICsgICAgIGRybV9wYW5lbF9wdXQocGFuZWwpOwo+ID4gIH0KPiA+ICBFWFBPUlRfU1lNQk9M
KGRybV9wYW5lbF9yZW1vdmVfZm9sbG93ZXIpOwo+Cj4gdG9nZXRoZXIgd2l0aCB0aGlzIG9uZT8K
Pgo+IE1heGltZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
