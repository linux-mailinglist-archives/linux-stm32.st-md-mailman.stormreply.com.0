Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFF44438CD
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Nov 2021 23:54:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58CD7C5AB60;
	Tue,  2 Nov 2021 22:54:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECA5BC5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Nov 2021 22:54:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 808776113D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Nov 2021 22:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635893667;
 bh=vZAm7ovxBi6d/ZH+uziWTG6NBTualBYKsCvLvL3Gx7g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=opY/abwJOWe66VHhwlVSS287YA1M9yULIi5wQIYoJ96jO4hPky0vB6vi6tafilMD7
 rFkhmoLtQ0JjoO8LGuoGLus6tF2fIduGVRZrrxl51/4nWYnKX6dKCQmBd2uSI9wlMD
 UO1XahuUVS5GKl3M0Aq9gJC4BEv6fCqD0q/CztW5e7meAcaEELHE3R2JXtckUw0jPy
 z9VAQruKylB+jiZA16OORnFfBMF6rFzu7wr/0EvG1Cg0KZUTyId6/tOrFKoGJf1Uai
 AP8H78hxGwQ6Ru8B4/CqaU93n8Gf4J+XTNIO9nFkSdgPnmTW9hS6RjiTF0OsrhHByR
 HNvU7DC6mlsLg==
Received: by mail-ed1-f47.google.com with SMTP id f8so2758812edy.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Nov 2021 15:54:27 -0700 (PDT)
X-Gm-Message-State: AOAM532RAn8DEfZ9wOG7eQI618aKk4ql4eOTlBl4rKSLXuNMQm5hhDTD
 bHXu8ufOIDglh5inYNWBth+NxF3wu5ZTBLv/ZA==
X-Google-Smtp-Source: ABdhPJwvOPkHrOahXa3xj/c9OSX7wBr+wcK0xwNgYPaLagkYmgf2JQOlOc1GXKmuNsno2PWPju9ZZUGHXtyfOv39J7g=
X-Received: by 2002:a17:907:2ce1:: with SMTP id
 hz1mr49090047ejc.241.1635893665770; 
 Tue, 02 Nov 2021 15:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211026155911.17651-1-jason-jh.lin@mediatek.com>
 <20211026155911.17651-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026155911.17651-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 3 Nov 2021 06:54:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY__cyFB6VyKFUZsy+-9+Nz7QTR4QiGUXQApOdiFXQESi4g@mail.gmail.com>
Message-ID: <CAAOTY__cyFB6VyKFUZsy+-9+Nz7QTR4QiGUXQApOdiFXQESi4g@mail.gmail.com>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Fei Shao <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>, DTML <devicetree@vger.kernel.org>,
 Nancy Lin <nancy.lin@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 roy-cw.yeh@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Moudy Ho <moudy.ho@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v12 05/16] dt-bindings: display: mediatek:
 merge: add additional prop for mt8195
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDEw5pyIMjbml6Ug6YCx5LqMIOS4i+WNiDExOjU55a+r6YGT77yaCj4KPiBhZGQgTUVS
R0UgYWRkaXRpb25hbCBwcm9wZXJ0aWVzIGRlc2NyaXB0aW9uIGZvciBtdDgxOTU6Cj4gMS4gYXN5
bmMgY2xvY2sKPiAyLiBmaWZvIHNldHRpbmcgZW5hYmxlCj4gMy4gcmVzZXQgY29udHJvbGxlcgoK
UmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+
IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4K
PiAtLS0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbCAgICAgIHwg
MzggKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZS55YW1sCj4gaW5kZXgg
NzViZWViMjA3Y2ViLi42MTQ3MjFiZGJmNzMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLG1lcmdlLnlhbWwKPiBAQCAtMzYsOCArMzYsMjggQEAgcHJvcGVydGllczoKPiAg
ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3Bvd2VyLWRvbWFp
bi55YW1sIGZvciBkZXRhaWxzLgo+Cj4gICAgY2xvY2tzOgo+ICsgICAgbWF4SXRlbXM6IDIKPiAg
ICAgIGl0ZW1zOgo+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBNRVJHRSBDbG9jawo+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBNRVJHRSBBc3luYyBDbG9jawo+ICsgICAgICAgICAgQ29udHJvbGxpbmcg
dGhlIHN5bmNocm9ub3VzIHByb2Nlc3MgYmV0d2VlbiBNRVJHRSBhbmQgb3RoZXIgZGlzcGxheQo+
ICsgICAgICAgICAgZnVuY3Rpb24gYmxvY2tzIGNyb3NzIGNsb2NrIGRvbWFpbi4KPiArCj4gKyAg
Y2xvY2stbmFtZXM6Cj4gKyAgICBtYXhJdGVtczogMgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0g
Y29uc3Q6IG1lcmdlCj4gKyAgICAgIC0gY29uc3Q6IG1lcmdlX2FzeW5jCj4gKwo+ICsgIG1lZGlh
dGVrLG1lcmdlLWZpZm8tZW46Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhlIHNldHRp
bmcgb2YgbWVyZ2UgZmlmbyBpcyBtYWlubHkgcHJvdmlkZWQgZm9yIHRoZSBkaXNwbGF5IGxhdGVu
Y3kKPiArICAgICAgYnVmZmVyIHRvIGVuc3VyZSB0aGF0IHRoZSBiYWNrLWVuZCBwYW5lbCBkaXNw
bGF5IGRhdGEgd2lsbCBub3QgYmUKPiArICAgICAgdW5kZXJydW4sIGEgbGl0dGxlIG1vcmUgZGF0
YSBpcyBuZWVkZWQgaW4gdGhlIGZpZm8uCj4gKyAgICAgIEFjY29yZGluZyB0byB0aGUgbWVyZ2Ug
ZmlmbyBzZXR0aW5ncywgd2hlbiB0aGUgd2F0ZXIgbGV2ZWwgaXMgZGV0ZWN0ZWQKPiArICAgICAg
dG8gYmUgaW5zdWZmaWNpZW50LCBpdCB3aWxsIHRyaWdnZXIgUkRNQSBzZW5kaW5nIHVsdHJhIGFu
ZCBwcmV1bHJhCj4gKyAgICAgIGNvbW1hbmQgdG8gU01JIHRvIHNwZWVkIHVwIHRoZSBkYXRhIHJh
dGUuCj4gKyAgICB0eXBlOiBib29sZWFuCj4KPiAgICBtZWRpYXRlayxnY2UtY2xpZW50LXJlZzoK
PiAgICAgIGRlc2NyaXB0aW9uOgo+IEBAIC01MCw2ICs3MCwxMSBAQCBwcm9wZXJ0aWVzOgo+ICAg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+
ICAgICAgbWF4SXRlbXM6IDEKPgo+ICsgIHJlc2V0czoKPiArICAgIGRlc2NyaXB0aW9uOiByZXNl
dCBjb250cm9sbGVyCj4gKyAgICAgIFNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmVzZXQvcmVzZXQudHh0IGZvciBkZXRhaWxzLgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4g
IHJlcXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0gcmVnCj4gQEAgLTY3LDMgKzkyLDE2
IEBAIGV4YW1wbGVzOgo+ICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxNzNfUE9X
RVJfRE9NQUlOX01NPjsKPiAgICAgICAgICBjbG9ja3MgPSA8Jm1tc3lzIENMS19NTV9ESVNQX01F
UkdFPjsKPiAgICAgIH07Cj4gKwo+ICsgICAgbWVyZ2U1OiBkaXNwX3ZwcF9tZXJnZTVAMWMxMTAw
MDAgewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRpc3AtbWVyZ2Ui
Owo+ICsgICAgICAgIHJlZyA9IDwwIDB4MWMxMTAwMDAgMCAweDEwMDA+Owo+ICsgICAgICAgIGlu
dGVycnVwdHMgPSA8R0lDX1NQSSA1MDcgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKPiArICAgICAg
ICBjbG9ja3MgPSA8JnZkb3N5czEgQ0xLX1ZETzFfVlBQX01FUkdFND4sCj4gKyAgICAgICAgICAg
ICAgICAgPCZ2ZG9zeXMxIENMS19WRE8xX01FUkdFNF9ETF9BU1lOQz47Cj4gKyAgICAgICAgY2xv
Y2stbmFtZXMgPSAibWVyZ2UiLCJtZXJnZV9hc3luYyI7Cj4gKyAgICAgICAgcG93ZXItZG9tYWlu
cyA9IDwmc3BtIE1UODE5NV9QT1dFUl9ET01BSU5fVkRPU1lTMT47Cj4gKyAgICAgICAgbWVkaWF0
ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZTEgU1VCU1lTXzFjMTFYWFhYIDB4MDAwMCAweDEwMDA+
Owo+ICsgICAgICAgIG1lZGlhdGVrLG1lcmdlLWZpZm8tZW4gPSA8MT47Cj4gKyAgICAgICAgcmVz
ZXRzID0gPCZ2ZG9zeXMxIE1UODE5NV9WRE9TWVMxX1NXMF9SU1RfQl9NRVJHRTRfRExfQVNZTkM+
Owo+ICsgICAgfTsKPiAtLQo+IDIuMTguMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
