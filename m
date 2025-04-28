Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEDFA9F0E2
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 14:37:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EDE9C78F6F;
	Mon, 28 Apr 2025 12:37:54 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39826C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 12:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=vtjvgZup4DO5ywnw9b4E1q8kivNev25eB77ifmZ/sTs=; b=m
 tCJR9N9x3gtZGhoQsEufXu5MN0AoGgBnc9N9lSkAgpBJLZQPG1Lo+OSqFi93JRvI
 ngq1on+ZxdIr8jyTfxe0JF0drb2Ew9vZJy2Hf/W6P8m2RPPwWSr8TXM061kV2MgE
 mJxqzzkAClVAGiil0kSOzSY7vw1Ezm8kRampFKLAZk=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-137 (Coremail) ; Mon, 28 Apr 2025 20:29:36 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 28 Apr 2025 20:29:36 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-3-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-3-8f91a404d86b@bootlin.com>
X-NTES-SC: AL_Qu2fB/SfvEss4CGcZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jBLo1zItdntMFln1/t+OJCOIkReYbzJI9MlIe6VRY6sPAVnVyjji8TlWtnuinPbeFw==
MIME-Version: 1.0
Message-ID: <45fac756.a42e.1967c5fd015.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iSgvCgD33wCwdA9oe4WhAA--.62923W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqA49XmgPasP6GgADso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Mon, 28 Apr 2025 12:37:52 +0000
Cc: imx@lists.linux.dev, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
 linux-amlogic@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 03/34] drm/bridge: analogix-anx6345:
 convert to devm_drm_bridge_alloc() API
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

CkhpLAoKQXQgMjAyNS0wNC0yNSAwMjo1OToxMCwgIkx1Y2EgQ2VyZXNvbGkiIDxsdWNhLmNlcmVz
b2xpQGJvb3RsaW4uY29tPiB3cm90ZToKPlRoaXMgaXMgdGhlIG5ldyBBUEkgZm9yIGFsbG9jYXRp
bmcgRFJNIGJyaWRnZXMuCj4KPlNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+CgpSZXZpZXdlZC1ieTogQW5keSBZYW4gPGFuZHlzaHJrQDE2My5j
b20+Cgo+Cj4tLS0KPgo+Q2M6ICJVd2UgS2xlaW5lLUvDtm5pZyIgPHUua2xlaW5lLWtvZW5pZ0Bi
YXlsaWJyZS5jb20+Cj5DYzogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+Q2M6
IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KPkNj
OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+Q2M6IFN1aSBKaW5nZmVuZyA8
c3VpLmppbmdmZW5nQGxpbnV4LmRldj4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5h
bG9naXgvYW5hbG9naXgtYW54NjM0NS5jIHwgOCArKysrLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jCj5pbmRleCBmMmJhZmE2Y2Y3Nzk1
NmVjYWZjODdhYWUzYTJiNjg5MGJkYjM2Y2ZhLi5mM2ZlNDdiMTJlZGNhMWY5MmRkZDMwNmQxNTJi
ZTE0NGRmNTY0OWI1IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dp
eC9hbmFsb2dpeC1hbng2MzQ1LmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW5hbG9naXgtYW54NjM0NS5jCj5AQCAtNjY0LDkgKzY2NCwxMCBAQCBzdGF0aWMgaW50IGFu
eDYzNDVfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gCXN0cnVjdCBkZXZp
Y2UgKmRldjsKPiAJaW50IGksIGVycjsKPiAKPi0JYW54NjM0NSA9IGRldm1fa3phbGxvYygmY2xp
ZW50LT5kZXYsIHNpemVvZigqYW54NjM0NSksIEdGUF9LRVJORUwpOwo+LQlpZiAoIWFueDYzNDUp
Cj4tCQlyZXR1cm4gLUVOT01FTTsKPisJYW54NjM0NSA9IGRldm1fZHJtX2JyaWRnZV9hbGxvYygm
Y2xpZW50LT5kZXYsIHN0cnVjdCBhbng2MzQ1LCBicmlkZ2UsCj4rCQkJCQkmYW54NjM0NV9icmlk
Z2VfZnVuY3MpOwo+KwlpZiAoSVNfRVJSKGFueDYzNDUpKQo+KwkJcmV0dXJuIFBUUl9FUlIoYW54
NjM0NSk7Cj4gCj4gCW11dGV4X2luaXQoJmFueDYzNDUtPmxvY2spOwo+IAo+QEAgLTczOCw3ICs3
MzksNiBAQCBzdGF0aWMgaW50IGFueDYzNDVfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQpCj4gCS8qIExvb2sgZm9yIHN1cHBvcnRlZCBjaGlwIElEICovCj4gCWFueDYzNDVfcG93
ZXJvbihhbng2MzQ1KTsKPiAJaWYgKGFueDYzNDVfZ2V0X2NoaXBfaWQoYW54NjM0NSkpIHsKPi0J
CWFueDYzNDUtPmJyaWRnZS5mdW5jcyA9ICZhbng2MzQ1X2JyaWRnZV9mdW5jczsKPiAJCWRybV9i
cmlkZ2VfYWRkKCZhbng2MzQ1LT5icmlkZ2UpOwo+IAo+IAkJcmV0dXJuIDA7Cj4KPi0tIAo+Mi40
OS4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
