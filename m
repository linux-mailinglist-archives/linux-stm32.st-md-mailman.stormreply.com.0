Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pvh9IZARQmq5zgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 08:32:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F18DB6D6599
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 08:32:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=redhat.com header.s=mimecast20190719 header.b=cLmglm0f;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=redhat.com (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 111DAC8F283;
	Mon, 29 Jun 2026 06:25:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80D33C424DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 13:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782479515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
 b=cLmglm0fFtdT+tIAZb6uKVEXMr65V0gMWXMmZyYqtbeIF6nMdAu+bEKeh2VZ+R1JfpLlrc
 pU7ZGeCtvqzRnHmVrQsaAAOCvrSNFIjeCgKSqIqGo84Yq7T70fQAU4eNrDSa/MAhN2vjmY
 3rFzQKQT3MKDDLHfxYtEgTvV8Ku8MIo=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-EtHDRk2KNDOVgXpwAahumQ-1; Fri, 26 Jun 2026 09:11:54 -0400
X-MC-Unique: EtHDRk2KNDOVgXpwAahumQ-1
X-Mimecast-MFC-AGG-ID: EtHDRk2KNDOVgXpwAahumQ_1782479514
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-7ff58c89959so21320097b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 06:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782479514; x=1783084314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
 b=d4Jq5VqsNJfI5IaspW7zdSyJc9NN21XfUAwwapA9MLjGMvCeXE+sXidgrOjx2U2joU
 3Z1bzmsP7EC9PcEP3iuKttOJ98Vb+Cve9pJMc3e9RWEZEeqje0hKc74hs2Q3E8CdGEUX
 jLhTiMyQYao2AfbhGvKYApgGTOOoWYNbrNwjHAaI0bMCDfdJmHQmZrOVKq0EpbWIvhDI
 I2kgJ1qvckX0UDMwrHrmfeTgJPx1VZTXbs5WUOpc3SQUUZBbAqiSRX4J9bBT9/Xi3072
 IgsD9Dxc8sBmsTAgK6Zc8cT3cdcELTKhL8GIntt8Smp9eBtR69taR2/Tusx4S6duMnhv
 lmdQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqgAydwe+oFU64BOHsPpno5dSXLuVgtf9wLQF5GLSiguMAzNc9YO3pSntHMs57MUn8ZOPwjQtJVNkaHgQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxriHiR2ObItG5JwtZAxGTHWeS/6NxerOzPSuUeXyDbbpIraxdV
 gf/cmAon44ri/kItvn6TOEidoQp+hGI0o70RaTWv78duecvpI9ObDIEQ/94cIaR/xjKzNDEnThK
 CKdKSYSLYjl/tyqc/OX7JF7gypbmjWQnV/IMDAbGXj748JfxIBDo1GpneQhvcXkc/WEKvyUr/vH
 S69JrLwbKPp2Yi+bydNxPR0Gu7si7nmgpHfhWSlDe7h/aPVDUt39DqKCg7
X-Gm-Gg: AfdE7cl4BT+WuKF//ynKqbnKRVGdBCWzvXyqSTVI+TSm5oj9A9SDvn4nu5ZPuX6F3eE
 2CMcXLtJWXllYM9qmePlV+0V+4J/YR+cNptS/s5G5FRjMIrBSLj4YbZK9rApctseMCAWzuDPAZF
 1OStORlN/Wxz7s1WZ9+d00cbk30SiI5T6KJiybBTLZ96DAiN0wQ0XvhUkz90x5Zew+
X-Received: by 2002:a05:690c:2601:b0:80b:ef0a:7aad with SMTP id
 00721157ae682-80bef0a8585mr15809837b3.31.1782479513454; 
 Fri, 26 Jun 2026 06:11:53 -0700 (PDT)
X-Received: by 2002:a05:690c:2601:b0:80b:ef0a:7aad with SMTP id
 00721157ae682-80bef0a8585mr15808937b3.31.1782479512984; Fri, 26 Jun 2026
 06:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-4-cca1a7b3bdef@redhat.com>
 <20260626-manipulative-rainbow-rhino-d73b65@houat>
In-Reply-To: <20260626-manipulative-rainbow-rhino-d73b65@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 15:11:41 +0200
X-Gm-Features: AVVi8CcW-L7vrM5Bm_e3_mA7DiL0CVsM1LDa8FwSzsOcNktoquvN-pr6tbwgp5U
Message-ID: <CADSE00+1m1ASzJzefO2bLuMYAJa3kSmW4py7Qng70VnZSUv0sg@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -GBBx8j1hacPPz3YzO9elXnJfJ6JYyaUz5Y0SB-BNUk_1782479514
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
Subject: Re: [Linux-stm32] [PATCH 4/5] drm/bridge: release panel reference
 on all lookup exit paths
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
	DATE_IN_PAST(1.00)[65];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:imx@lists.linux.dev,m:heiko@sntech.de,m:geert+renesas@glider.be,m:tomi.valkeinen@ideasonboard.com,m:Frank.Li@nxp.com,m:stefan@agner.ch,m:mperttunen@nvidia.com,m:paul@crapouillou.net,m:linux-tegra@vger.kernel.org,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:m.szyprowski@samsung.com,m:simona@ffwll.ch,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:rfoss@kernel.org,m:samuel@sholland.org,m:airlied@gmail.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:peter.griffin@linaro.org,m:linux-rockchip@lists.infradead.org,m:jagan@amarulasolutions.com,m:alim.akhtar@samsung.com,m:linux-mips@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:linux-sunxi@lists.linux.dev,m:mcoquelin.stm32@gmail.com,m:marex@denx.de,m:kernel@pengutronix.de,m:jonas@kwiboo.se,m:s.hauer@pengutronix.de,m:alison.wang@nxp.c
 om,m:maarten.lankhorst@linux.intel.com,m:inki.dae@samsung.com,m:linux-samsung-soc@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:laurentiu.palcu@oss.nxp.com,m:biju.das.jz@bp.renesas.com,m:krzk@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:jingoohan1@gmail.com,m:linusw@kernel.org,m:sw0312.kim@samsung.com,m:hjc@rock-chips.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:jesszhan0024@gmail.com,m:kyungmin.park@samsung.com,m:kieran.bingham+renesas@ideasonboard.com,m:philippe.cornu@foss.st.com,m:tzimmermann@suse.de,m:andy.yan@rock-chips.com,m:paulk@sys-base.io,m:jyri.sarha@iki.fi,m:yannick.fertre@foss.st.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:laurent.pinchart@ideasonboard.com,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aesteve@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F18DB6D6599

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMjo1M+KAr1BNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAyNiwgMjAyNiBhdCAwMjowMzoyNlBN
ICswMjAwLCBBbGJlcnQgRXN0ZXZlIHdyb3RlOgo+ID4gb2ZfZHJtX2ZpbmRfcGFuZWwoKSBhbmQg
ZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCkgbm93IHJldHVybiBhCj4gPiBjb3VudGVkIHJl
ZmVyZW5jZSB0aGF0IHRoZSBjYWxsZXIgbXVzdCByZWxlYXNlIHdpdGggZHJtX3BhbmVsX3B1dCgp
Lgo+ID4KPiA+IEZvciBicmlkZ2UgZHJpdmVycyB0aGF0IGltbWVkaWF0ZWx5IHdyYXAgdGhlIHBh
bmVsIGluIGEgcGFuZWxfYnJpZGdlCj4gPiAod2hpY2ggYWNxdWlyZXMgaXRzIG93biByZWZlcmVu
Y2UpLCByZWxlYXNlIHRoZSBsb29rdXAgcmVmZXJlbmNlIHJpZ2h0Cj4gPiBhZnRlciB0aGUgYnJp
ZGdlIGNyZWF0aW9uIGNhbGwuCj4gPgo+ID4gRm9yIGFuYWxvZ2l4LWFueDYzNDUsIHdoaWNoIHN0
b3JlcyB0aGUgcGFuZWwgZm9yIGRpcmVjdCB1c2UsIHJlbGVhc2UKPiA+IHRoZSByZWZlcmVuY2Ug
aW4gdGhlIGkyYyByZW1vdmUgcGF0aC4KPiA+Cj4gPiBGb3IgcGxhdGZvcm0gZHJpdmVycyB1c2lu
ZyBhbmFsb2dpeF9kcF9jb3JlIHdpdGggYSBjb21wb25lbnQgbGlmZWN5Y2xlCj4gPiAoZXh5bm9z
X2RwLCByb2NrY2hpcCBhbmFsb2dpeF9kcCksIHJlbGVhc2UgdGhlIGxvb2t1cCByZWZlcmVuY2Ug
aW4gdGhlCj4gPiBwbGF0Zm9ybSByZW1vdmUoKSBmdW5jdGlvbi4gVGhlIHBhbmVsX2JyaWRnZSBj
cmVhdGVkIGR1cmluZyBiaW5kKCkgaG9sZHMKPiA+IGEgc2VwYXJhdGUgcmVmZXJlbmNlIHRoYXQg
ZGV2bSBjbGVhbnVwIHJlbGVhc2VzIGFmdGVyIHJlbW92ZSgpIHJldHVybnMuCj4gPgo+ID4gQWxz
byBmaXggZGV2bV9kcm1fb2ZfZ2V0X2JyaWRnZSgpIGFuZCBkcm1tX29mX2dldF9icmlkZ2UoKSBp
bgo+ID4gYnJpZGdlL3BhbmVsLmMgaXRzZWxmOiBib3RoIGNhbGwgZHJtX29mX2ZpbmRfcGFuZWxf
b3JfYnJpZGdlKCkgYW5kCj4gPiB0aGVuIHBhc3MgdGhlIHBhbmVsIHRvIGRldm0vZHJtbV9wYW5l
bF9icmlkZ2VfYWRkKCksIHdoaWNoIGFjcXVpcmVzCj4gPiBpdHMgb3duIHJlZmVyZW5jZSB2aWEg
ZHJtX3BhbmVsX2JyaWRnZV9hZGRfdHlwZWQoKS4gVGhlIGxvb2t1cAo+ID4gcmVmZXJlbmNlIHdh
cyBuZXZlciByZWxlYXNlZDsgYWRkIGRybV9wYW5lbF9wdXQoKSBhZnRlciBlYWNoIGJyaWRnZQo+
ID4gY3JlYXRpb24gY2FsbC4KPiA+Cj4gPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVz
LTQtNgo+ID4gU2lnbmVkLW9mZi1ieTogQWxiZXJ0IEVzdGV2ZSA8YWVzdGV2ZUByZWRoYXQuY29t
Pgo+Cj4gSSB0aGluayB0aGlzIG9uZSBzaG91bGQgYmUgZWl0aGVyIHNwbGl0IGludG8gb25lIHBh
dGNoIHBlciBkcml2ZXIsIG9yCj4gbWVyZ2VkIHdpdGggdGhlIG9mX2RybV9maW5kX3BhbmVsIHBh
dGNoLiBJJ20gc3RpbGwgbm90IHF1aXRlIHN1cmUgd2hpY2gKPiB3b3VsZCBiZSB0aGUgYmVzdCwg
bWF5YmUgdGhlIGxhdHRlcj8KCkkgaGF2ZSBzcGVudCBzb21lIHRpbWUgbXlzZWxmIHRoaW5raW5n
IGFib3V0IGhvdyB0byBhcHByb2FjaCB0aGlzLgpJbml0aWFsbHkgSSB0aG91Z2h0IGFib3V0IGRv
aW5nIG9uZSBwYXRjaCBwZXIgZHJpdmVyIGFzIHlvdSBzdWdnZXN0ZWQsCmJ1dCBzaW5jZSB0aGVy
ZSBhcmUgbWFueSBzaW1pbGFyIGZpeGVzIHRoYXQgYXJlIG1vc3RseSBvbmUtbGluZXJzLCBJbgp0
aGUgZW5kIEkgZGVjaWRlZCB0aGF0IGdyb3VwaW5nIHRoZW0gd291bGQgbWFrZSB0aGUgcmV2aWV3
IGVhc2llciBhbmQKcmVzdWx0IGluIGEgbGVzcyBpbmZsYXRlZCBzZXJpZXMuIE1heWJlIG1lcmdp
bmcgd2l0aCBvZl9kcm1fZmluZF9wYW5lbApwYXRjaCBtYWtlcyBzZW5zZSB0byBhdm9pZCBoYXZp
bmcgb25lIHBhdGNoIGludHJvZHVjaW5nIGEgdHJhbnNpZW50CnJlZmVyZW5jZSBsZWFrIChldmVu
IGlmIGl0IGlzIGZpeGVkIHJpZ2h0IGFmdGVyIGFuZCBpcyBiaXNlY3RhYmxlKS4KQnV0IHRoYXQg
d2lsbCBhbHNvIGNyZWF0ZSBhIGdpYW50IHBhdGNoIChoYXJkZXIgdG8gcmV2aWV3PykuIEFub3Ro
ZXIKb3B0aW9uIGNvdWxkIGJlIHRvIG1lcmdlIHBhdGNoZXMgNCBhbmQgNSwgd2hpY2ggYmFzaWNh
bGx5IHVwZGF0ZSBhbGwKY2FsbGVycywgYW5kIGtlZXAgdGhlIEFQSSB1cGRhdGUgc2VwYXJhdGVk
LiBFaXRoZXIgd2F5LCBJIGFtIGhhcHB5CndpdGggd2hhdGV2ZXIgeW91IGRlY2lkZSBpcyBiZXR0
ZXIuIEkgd2lsbCB0YWtlIG5vdGUgb2YgdGhpcyBmb3IgdjIuCgo+Cj4gTWF4aW1lCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
