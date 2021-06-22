Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C21D3B08EB
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jun 2021 17:26:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23E50C597AF;
	Tue, 22 Jun 2021 15:26:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9853AC59780
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 15:26:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 000FBED1;
 Tue, 22 Jun 2021 08:26:33 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D10493F792;
 Tue, 22 Jun 2021 08:26:33 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 938E46850D7; Tue, 22 Jun 2021 16:26:32 +0100 (BST)
Date: Tue, 22 Jun 2021 16:26:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210622152632.647akpp5nqcdfozk@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622141002.11590-7-tzimmermann@suse.de>
Cc: heiko@sntech.de, emma@anholt.net, airlied@linux.ie,
 nouveau@lists.freedesktop.org, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 mihail.atanassov@arm.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, krzysztof.kozlowski@canonical.com,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wens@csie.org, jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 john.stultz@linaro.org, laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com,
 tomba@kernel.org, jyri.sarha@iki.fi, yannick.fertre@foss.st.com,
 Xinhui.Pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 christian.koenig@amd.com, kyungmin.park@samsung.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, tiantao6@hisilicon.com, shawnguo@kernel.org,
 brian.starkey@arm.com, zackr@vmware.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2 06/22] drm/malidp: Don't set struct
 drm_device.irq_enabled
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

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgMDQ6MDk6NDZQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGZpZWxkIGRybV9kZXZpY2UuaXJxX2VuYWJsZWQgaXMgb25seSB1c2Vk
IGJ5IGxlZ2FjeSBkcml2ZXJzCj4gd2l0aCB1c2Vyc3BhY2UgbW9kZXNldHRpbmcuIERvbid0IHNl
dCBpdCBpbiBtYWxpZHAuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFy
bS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJt
L21hbGlkcF9kcnYuYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYwo+IGluZGV4IGRlNTlmMzMwMjUxNi4uNzhkMTVi
MDRiMTA1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKPiBAQCAtODQ3LDggKzg0Nyw2
IEBAIHN0YXRpYyBpbnQgbWFsaWRwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJaWYgKHJl
dCA8IDApCj4gIAkJZ290byBpcnFfaW5pdF9mYWlsOwo+ICAKPiAtCWRybS0+aXJxX2VuYWJsZWQg
PSB0cnVlOwo+IC0KPiAgCXJldCA9IGRybV92YmxhbmtfaW5pdChkcm0sIGRybS0+bW9kZV9jb25m
aWcubnVtX2NydGMpOwo+ICAJaWYgKHJldCA8IDApIHsKPiAgCQlEUk1fRVJST1IoImZhaWxlZCB0
byBpbml0aWFsaXNlIHZibGFua1xuIik7Cj4gQEAgLTg3NCw3ICs4NzIsNiBAQCBzdGF0aWMgaW50
IG1hbGlkcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgdmJsYW5rX2ZhaWw6Cj4gIAltYWxp
ZHBfc2VfaXJxX2ZpbmkoaHdkZXYpOwo+ICAJbWFsaWRwX2RlX2lycV9maW5pKGh3ZGV2KTsKPiAt
CWRybS0+aXJxX2VuYWJsZWQgPSBmYWxzZTsKPiAgaXJxX2luaXRfZmFpbDoKPiAgCWRybV9hdG9t
aWNfaGVscGVyX3NodXRkb3duKGRybSk7Cj4gIAljb21wb25lbnRfdW5iaW5kX2FsbChkZXYsIGRy
bSk7Cj4gQEAgLTkwOSw3ICs5MDYsNiBAQCBzdGF0aWMgdm9pZCBtYWxpZHBfdW5iaW5kKHN0cnVj
dCBkZXZpY2UgKmRldikKPiAgCWRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKGRybSk7Cj4gIAlt
YWxpZHBfc2VfaXJxX2ZpbmkoaHdkZXYpOwo+ICAJbWFsaWRwX2RlX2lycV9maW5pKGh3ZGV2KTsK
PiAtCWRybS0+aXJxX2VuYWJsZWQgPSBmYWxzZTsKPiAgCWNvbXBvbmVudF91bmJpbmRfYWxsKGRl
diwgZHJtKTsKPiAgCW9mX25vZGVfcHV0KG1hbGlkcC0+Y3J0Yy5wb3J0KTsKPiAgCW1hbGlkcC0+
Y3J0Yy5wb3J0ID0gTlVMTDsKPiAtLSAKPiAyLjMyLjAKPiAKCi0tIAo9PT09PT09PT09PT09PT09
PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdy
ZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0t
LS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
