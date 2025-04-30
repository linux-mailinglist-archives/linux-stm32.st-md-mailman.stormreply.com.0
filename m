Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F26DAA50CF
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 17:52:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D43B3C78032;
	Wed, 30 Apr 2025 15:52:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6199C78028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 15:52:06 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2255003f4c6so30535ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1746028325; x=1746633125;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
 b=gIm0CWGG02QGwfakej3iVutNXnTAJIg83yxhdn0dgyF7sQa1h/uZZrayqVBCgt3r6v
 B/hc1dTYFbGQph5eWpzqYKLPPf6N79Mfy4/fUas2pvNLfi98LhRNESt1CwcttE5aDAvv
 OMGNLWxOF/op0JwGMf/wAEbPLGhBcCHOvB7UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746028325; x=1746633125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
 b=XVfXz/o2fWRoHvS7kJIP4cMKVLcFQwF/ZF1yqffUVeAjLoH821JrrcBSWVo/0IVP3K
 3IHbIYwdiUIHs+WN1uWr6F/YiojcXj89W86/rjnBKdMzqxdrQFYAyESah1cxYPwd5tfj
 fFJEIK4V2jcKdNAYZpzk1Wmvk2vLQxQfIf4bfRo18mhzP9mofXPnnc2DqgFNvryDrl//
 Mmlv//e5ea4zYt0Q+4yzT1RMUqBuij7JzNQNBpRvQYUDZYTKpCn+1HKMHehnDVdL87/X
 PPKEDdJJvyZKHcd0G8o7bOSYYmpOOuQw5s8TIISoY9mnFOMbyUEkHlaf5ENukSP1MRdZ
 Qm5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW11FLIQhVwlg8DIPyIwRcKqK2Vi5LFAJ7umBSiNtyj4w2cDqvCsjvg6LWgInNhf5ViDCB+i8T/a/1jDg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz3MyHmaq2Yk1JEFb/qAbR8jUU01kQhnAbwPVeK8MRFxz8VqDyU
 7eYRp8eYK6btAoBl0+K4hUV4/0VpF9Tud56wj+pSR1meOsFmzwCZhxkFIYLqRSTV/bV9Qa33+C0
 =
X-Gm-Gg: ASbGncshADtmuiYgVB+9FWJpTJLSzyauyMTQuJ81sNWhX4e3bzTmiNX2IlXMax4vvSG
 VapJQyX08TMtP+lrxNhlNexwtnpHNZ9JdQ9hX5qhAu+j3SU0/X9/SlIN92C44Vk4QFB6Rl7ZTSr
 j2ITqkICP+XzbocHNGSsLm1y4K2Hptp2S1BGNsZvkgST+Uo1MKEhy9bP+Iehmf/9ohHUJqeLb9K
 EaqWeW1bamahKiqXbgaIeYDyZ6DUN3pGfiqYmB7Gk8DRZ9XMR/BLr+1GuUiJ5BfYFfvVBgplNop
 tSIDDGIc52xDF71AB4ugbG4YllC3fXKlFR/bkcz3KPLvi6DA8hvw056o/uGBoqycI4S2lhWV8dE
 vi7yp
X-Google-Smtp-Source: AGHT+IGwNdVSMdSu5u+PlyKU/Cg4efyt3KofATU9Xua3PI/z4tHyFdQdWvxG0N0P09bW0uuPixv/Dw==
X-Received: by 2002:a17:903:2308:b0:226:3781:379d with SMTP id
 d9443c01a7336-22df358fdd0mr55341255ad.33.1746028325105; 
 Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com.
 [209.85.216.51]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db50e7613sm123444165ad.143.2025.04.30.08.52.04
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3054ef26da3so52309a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSZlExS0JAaRIxQvaOfwVNAfjSzo3tKqiHeQKb1BfnkwwDAejPmHB8qtxorm8/JLVez5p5zZO2aAO6ew==@st-md-mailman.stormreply.com
X-Received: by 2002:a17:90b:17d0:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-30a3330bd2amr6121407a91.17.1746028323966; Wed, 30 Apr 2025
 08:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
 <20250430123557.3d8b1de4@booty>
In-Reply-To: <20250430123557.3d8b1de4@booty>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 08:51:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
X-Gm-Features: ATxdqUFfYEEYqvpO67K1TXBYapYURxE3d7Z_gt9FzIWHk5tUMzE1QBIfnvJL-xI
Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vitalii Mordan <mordan@ispras.ru>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Paul Kocialkowski <paulk@sys-base.io>, platform-driver-x86@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Simona Vetter <simona@ffwll.ch>, chrome-platform@lists.linux.dev,
 Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Janne Grunau <j@jannau.net>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Phong LE <ple@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jesse Van Gavere <jesseevg@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Christoph Fritz <chf.fritz@googlemail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Aleksandr Mishin <amishin@t-argos.ru>
Subject: Re: [Linux-stm32] [PATCH v2 01/34] drm: convert many bridge drivers
 from devm_kzalloc() to devm_drm_bridge_alloc() API
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

SGksCgpPbiBXZWQsIEFwciAzMCwgMjAyNSBhdCAzOjM24oCvQU0gTHVjYSBDZXJlc29saSA8bHVj
YS5jZXJlc29saUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBEb3VnLAo+Cj4gT24gTW9u
LCAyOCBBcHIgMjAyNSAxMzo1OTo1MCAtMDcwMAo+IERvdWcgQW5kZXJzb24gPGRpYW5kZXJzQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBbLi4uXQo+Cj4gPiBSZXZpZXdlZC1ieTogRG91Z2xhcyBB
bmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiAjIHBhcmFkZS1wczg2NDAKPiA+IFRlc3Rl
ZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiAjIHBhcmFkZS1w
czg2NDAKPgo+IFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchCj4KPiBIb3dldmVyIEknbGwgYmUg
c2VuZGluZyB2MyB3aXRoIHNvbWUgZGlmZmVyZW5jZXMgdy5yLnQuIHYyLCBpbiBvcmRlciB0bwo+
IGZpeCB0aGUgMyBidWdzIHJlcG9ydGVkIGJ5IEFuZHkgWWFuIHBsdXMgYSBzaW1pbGFyIG9uZSBJ
IHNwb3R0ZWQuIFRoZQo+IGZpeCBqdXN0IGlzIHJlcGxhY2luZyBQVFJfRVJSKCkgd2l0aCBFUlJf
Q0FTVCgpIGluIHRoZSA0IGNhc2VzIHdoZXJlIHRoZQo+IGludm9sdmVkIGZ1bmN0aW9uIGlzIHJl
dHVybmluZyBhIHBvaW50ZXIgaW5zdGVhZCBvZiBhbiBpbnQuCj4KPiBZb3VyIHJldmlldy90ZXN0
IHRhZ3MgYXBwZWFyIGdsb2JhbCB0byB0aGUgd2hvbGUgcGF0Y2gsIHRodXMgYmVpbmcgdGhlCj4g
cGF0Y2ggZGlmZmVyZW50IEkgdGhpbmsgSSBjYW5ub3QgaW5jbHVkZSB5b3VyIHRhZ3MgaW4gdjMu
Cj4KPiBMZXQgbWUga25vdyBpZiB5b3UgdGhpbmsgSSBzaG91bGQgZG8gZGlmZmVyZW50bHkuCj4K
PiBTb3JyeSBhYm91dCB0aGF0LgoKSXQncyBmaW5lIGlmIHlvdSB3YW50IHRvIGRyb3AgbXkgdGFn
LiBJIGRpZG4ndCBoYXZlIHRpbWUgdG8gcmV2aWV3IHRoZQp3aG9sZSB0aGluZyBidXQgSSBmZWx0
IGxpa2UgSSBzaG91bGQgYXQgbGVhc3QgcmV2aWV3IHRoZSBkcml2ZXJzIEknbQpzaWduZWQgdXAg
YXMgYSByZXZpZXdlciBmb3IuIFRoYXQgYmVpbmcgc2FpZCwgSSdtIG5vdCBjb3VudGluZyB0YWdz
IG9yCmFueXRoaW5nIHNvIEknbSBub3Qgb2ZmZW5kZWQgaWYgdGhleSdyZSBkcm9wcGVkLgoKTXkg
dW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBoYXNodGFnIGF0IHRoZSBlbmQgaXMgYXQgbGVhc3Qg
YQpzZW1pLXN0YW5kYXJkIHdheSB0byBzYXkgdGhhdCBteSB0YWcgb25seSBhcHBsaWVzIHRvIGEg
c21hbGwgcGFydCBvZgp0aGUgcGF0Y2gsIHNvIGl0IHNlZW1zIGxpa2UgaXQgd291bGQgYmUgT0sg
dG8gY2FycnkgaXQsIHRob3VnaC4uLgoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
