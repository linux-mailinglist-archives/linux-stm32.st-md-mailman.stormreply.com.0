Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA4438DB25
	for <lists+linux-stm32@lfdr.de>; Sun, 23 May 2021 14:17:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D2E2C57B7A;
	Sun, 23 May 2021 12:17:17 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E8D6C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 May 2021 12:17:14 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id o5so19664337edc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 May 2021 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3tzEvnJ635tC2Suexfcwo2/SMYwrMnTRuJbRrXUefrg=;
 b=qLzt2Q8zgmZbiflD5+5P7ElMN2z5A5uPW8NRXtteO4uyLUUDRrn2IKkRaMvKWKF65W
 1cfWZUBsHQFj1InumAA50YINqUE+1gGMQa6vawhc32wnMK1JPFqy+ZWs+yK3N/lhIrZB
 tFzU7CEWgebc10cYE5ViNhI9KqJ0BhAzNgASIXHqW9Pvbic5Mbf7n+1hTPPnGTy2gyoF
 KIpNNID+LMnrZr9hOeF1GqZZFlAGZkUq4n5yICVxd5jeKSPa46Y9ikqlIlB9JT7xuTyE
 P+9+6vpZcRqQG7UUVVCq9WhiE6nWh3BKUbJrAhmJbHLt2xZ+1Xri6sMQDKQymr2NNUCG
 TF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3tzEvnJ635tC2Suexfcwo2/SMYwrMnTRuJbRrXUefrg=;
 b=LaBwNDlR358kkmAdS8CNE/ciYvaHUIagkz0oLRiFCmZVpxER8aIIhzph0U7ZW8FwiC
 sP1AcrpobHKCEpyRMWCCyQnYqCpCDRcgZgCNr2M3cnKdfuUGAGVtN8TPtyTCSFYXW64V
 Vxp1P+3goXHFQR68xNcTN7f1uSOhndQovtANChIK9V/NxodQsEFNQkvn9i/LO+Tt35CK
 8RdL7ZJIHnbSHY8usTaDMwH59TsDWvR+TDfy56LUY2gNZmPDiWbps1w4AZSO1ti+524/
 u9aIIIrsk87dTk5l64NCfM2+5EFFzWpo4OR7+EI6RHNQEvmF1Zu1mNZ6bDV9GVECCgKB
 R2bg==
X-Gm-Message-State: AOAM532but3XHp4XjG/XSLhsgSWJMGv9+EuHbX8FjNRKyhKDD6mGO8aY
 c5ettPv1niixhgidefczqvyuQJ3PFdSbKM4gGnU=
X-Google-Smtp-Source: ABdhPJwPxmA4JArahzruRum264WKfGGbHUJh6bex9S7VrYwga+yKcdKWZft9UnfQIVsWH4AZBM7E8wWiBet0Lx5Pf5o=
X-Received: by 2002:a50:fb17:: with SMTP id d23mr19981613edq.338.1621772233437; 
 Sun, 23 May 2021 05:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-6-daniel.vetter@ffwll.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 May 2021 14:17:02 +0200
Message-ID: <CAFBinCDXgjevHr9wRn8gQ8pJhiSpZb5A7ChhQqk17yK8Tooa3Q@mail.gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-sunxi@lists.linux.dev,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 06/11] drm/<driver>:
 drm_gem_plane_helper_prepare_fb is now the default
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

T24gRnJpLCBNYXkgMjEsIDIwMjEgYXQgMTE6MTAgQU0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBObyBuZWVkIHRvIHNldCBpdCBleHBsaWNpdGx5Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Cj4gQ2M6IExhdXJlbnRpdSBQYWxjdSA8bGF1cmVudGl1LnBhbGN1QG9zcy5ueHAuY29tPgo+IENj
OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiBDYzogU2hhd24gR3VvIDxz
aGF3bmd1b0BrZXJuZWwub3JnPgo+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU+Cj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXgu
ZGU+Cj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiBDYzogTlhQIExp
bnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgo+IENjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVs
QHBlbmd1dHJvbml4LmRlPgo+IENjOiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5l
dD4KPiBDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gQ2M6IE1h
dHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gQ2M6IE5laWwgQXJtc3Ry
b25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiBDYzogS2V2aW4gSGlsbWFuIDxraGlsbWFu
QGJheWxpYnJlLmNvbT4KPiBDYzogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+
Cj4gQ2M6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+Cj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IENjOiBTdGVmYW4gQWdu
ZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiBDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNv
bT4KPiBDYzogIkhlaWtvIFN0w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPgo+IENjOiBZYW5uaWNr
IEZlcnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4gQ2M6IFBoaWxpcHBlIENvcm51
IDxwaGlsaXBwZS5jb3JudUBmb3NzLnN0LmNvbT4KPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJl
bmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVl
bGluLnN0bTMyQGdtYWlsLmNvbT4KPiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRv
cmd1ZUBmb3NzLnN0LmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3Jn
Pgo+IENjOiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cj4gQ2M6IEplcm5laiBTa3JhYmVj
IDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+Cj4gQ2M6IEp5cmkgU2FyaGEgPGp5cmkuc2FyaGFA
aWtpLmZpPgo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9tYmFAa2VybmVsLm9yZz4KPiBDYzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LW1pcHNAdmdlci5r
ZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzog
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXJvY2tjaGlwQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQo+IENjOiBsaW51eC1zdW54aUBsaXN0cy5saW51eC5kZXYKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2lteC9kY3NzL2Rjc3MtcGxhbmUuYyAgICAgICB8IDEgLQo+ICBkcml2ZXJzL2dw
dS9kcm0vaW14L2lwdXYzLXBsYW5lLmMgICAgICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pbmdlbmljL2luZ2VuaWMtZHJtLWRydi5jICAgfCAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL2lu
Z2VuaWMvaW5nZW5pYy1pcHUuYyAgICAgICB8IDEgLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9wbGFuZS5jICAgIHwgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9vdmVybGF5LmMgICAgICAgfCAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3Bs
YW5lLmMgICAgICAgICB8IDEgLQpGb3IgZHJpdmVycy9ncHUvZHJtL21lc29uLyo6CkFja2VkLWJ5
OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29t
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
