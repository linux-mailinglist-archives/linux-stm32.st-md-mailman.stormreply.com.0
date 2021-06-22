Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE7D3B08E3
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jun 2021 17:25:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3D67C597AF;
	Tue, 22 Jun 2021 15:25:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DD72C59780
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 15:25:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C068931B;
 Tue, 22 Jun 2021 08:25:55 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F59C3F792;
 Tue, 22 Jun 2021 08:25:55 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 63299683943; Tue, 22 Jun 2021 16:25:54 +0100 (BST)
Date: Tue, 22 Jun 2021 16:25:54 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210622152554.vc7mnohj5u2trxpi@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622141002.11590-6-tzimmermann@suse.de>
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
Subject: Re: [Linux-stm32] [PATCH v2 05/22] drm/komeda: Don't set struct
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

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgMDQ6MDk6NDVQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGZpZWxkIGRybV9kZXZpY2UuaXJxX2VuYWJsZWQgaXMgb25seSB1c2Vk
IGJ5IGxlZ2FjeSBkcml2ZXJzCj4gd2l0aCB1c2Vyc3BhY2UgbW9kZXNldHRpbmcuIERvbid0IHNl
dCBpdCBpbiBrb21lZGEuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFy
bS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9rbXMuYwo+IGluZGV4IGZmNDVmMjNmM2Q1Ni4uNTJhNmRiNTcwN2EzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMK
PiBAQCAtMzAxLDggKzMwMSw2IEBAIHN0cnVjdCBrb21lZGFfa21zX2RldiAqa29tZWRhX2ttc19h
dHRhY2goc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gIAlpZiAoZXJyKQo+ICAJCWdvdG8gZnJl
ZV9jb21wb25lbnRfYmluZGluZzsKPiAgCj4gLQlkcm0tPmlycV9lbmFibGVkID0gdHJ1ZTsKPiAt
Cj4gIAlkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQoZHJtKTsKPiAgCj4gIAllcnIgPSBkcm1fZGV2
X3JlZ2lzdGVyKGRybSwgMCk7Cj4gQEAgLTMxMyw3ICszMTEsNiBAQCBzdHJ1Y3Qga29tZWRhX2tt
c19kZXYgKmtvbWVkYV9rbXNfYXR0YWNoKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ICAKPiAg
ZnJlZV9pbnRlcnJ1cHRzOgo+ICAJZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKGRybSk7Cj4gLQlk
cm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4gIGZyZWVfY29tcG9uZW50X2JpbmRpbmc6Cj4gIAlj
b21wb25lbnRfdW5iaW5kX2FsbChtZGV2LT5kZXYsIGRybSk7Cj4gIGNsZWFudXBfbW9kZV9jb25m
aWc6Cj4gQEAgLTMzMSw3ICszMjgsNiBAQCB2b2lkIGtvbWVkYV9rbXNfZGV0YWNoKHN0cnVjdCBr
b21lZGFfa21zX2RldiAqa21zKQo+ICAJZHJtX2Rldl91bnJlZ2lzdGVyKGRybSk7Cj4gIAlkcm1f
a21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJtKTsKPiAgCWRybV9hdG9taWNfaGVscGVyX3NodXRkb3du
KGRybSk7Cj4gLQlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4gIAljb21wb25lbnRfdW5iaW5k
X2FsbChtZGV2LT5kZXYsIGRybSk7Cj4gIAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkcm0pOwo+
ICAJa29tZWRhX2ttc19jbGVhbnVwX3ByaXZhdGVfb2JqcyhrbXMpOwo+IC0tIAo+IDIuMzIuMAo+
IAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhl
IHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291
cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8KvCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
