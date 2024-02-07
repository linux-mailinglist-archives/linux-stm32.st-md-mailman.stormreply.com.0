Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6CD84CC1F
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 14:55:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B14F2C6C85A;
	Wed,  7 Feb 2024 13:55:50 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9817C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 13:55:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF0C8A27;
 Wed,  7 Feb 2024 14:54:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707314065;
 bh=V3+jKoIBUGBZBTis/sYDfzFW5Z0QpV8or9q0zkUW4ZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mkka2GuJ08eb1sItKZOfQ6+lvDhWNuhZSkErIkhowx0OfLH5FXDJCy+mUrQOWyIkT
 n7HoPVGhYijKr2feP9hJ2+1HF7xmn6I51qe4PTkCYmt80xyiNo62xjYa24d9mOiluy
 BHSqKP/V8J4lMwbXO/TTZY9fogWeN/PrkFfJGZnM=
Date: Wed, 7 Feb 2024 15:55:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Message-ID: <20240207135551.GH2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
 <m3il30zace.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m3il30zace.fsf@t19.piap.pl>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, Helge Deller <deller@gmx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-media@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Eugen Hristev <eugen.hristev@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-samsung-soc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-fbdev@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] media: i2c: replace
	of_graph_get_next_endpoint()
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

T24gV2VkLCBGZWIgMDcsIDIwMjQgYXQgMDI6MTM6MDVQTSArMDEwMCwgS3J6eXN6dG9mIEhhxYJh
c2Egd3JvdGU6Cj4gTGF1cmVudCwKPiAKPiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyaXRlczoKPiAKPiA+PiArKysgYi9kcml2ZXJzL21lZGlh
L2kyYy9hZHY3NjA0LmMKPiA+PiBAQCAtMzIwNSw3ICszMjA1LDcgQEAgc3RhdGljIGludCBhZHY3
Nnh4X3BhcnNlX2R0KHN0cnVjdCBhZHY3Nnh4X3N0YXRlICpzdGF0ZSkKPiA+PiAgICAgICBucCA9
IHN0YXRlLT5pMmNfY2xpZW50c1tBRFY3NlhYX1BBR0VfSU9dLT5kZXYub2Zfbm9kZTsKPiA+Pgo+
ID4+ICAgICAgIC8qIFBhcnNlIHRoZSBlbmRwb2ludC4gKi8KPiA+PiAtICAgICBlbmRwb2ludCA9
IG9mX2dyYXBoX2dldF9uZXh0X2VuZHBvaW50KG5wLCBOVUxMKTsKPiA+PiArICAgICBlbmRwb2lu
dCA9IG9mX2dyYXBoX2dldF9lbmRwb2ludF9ieV9yZWdzKG5wLCAwLCAtMSk7Cj4gPgo+ID4gSSB0
aGluayB0aGlzIHNob3VsZCBiZSBwb3J0IDEgZm9yIHRoZSBhZHY3NjExIGFuZCBwb3J0MiBmb3Ig
dGhlIGFkdjc2MTIuCj4gPiBUaGUgYWR2NzYxMCBtYXkgbmVlZCB0byB1c2UgcG9ydCAxIHRvbywg
YnV0IHRoZSBiaW5kaW5ncyBsaWtlbHkgbmVlZCB0bwo+ID4gYmUgdXBkYXRlZC4KPiAKPiBUbyBi
ZSBob25lc3QgSSBoYXZlIG5vIGlkZWEgYWJvdXQgQURWNzYxMSBhbmQgNzYxMi4KPiBUaGUgNzYx
MCBJIGhhdmUgb24gVGlueXJleCAibW9ibyIgc2VlbXMgdG8gYmUgc2luZ2xlIHBvcnQuCgpPbmUg
aXNzdWUgaXMgdGhhdCB0aGUgY29tbWl0IHRoYXQgYWRkZWQgdGhlIGFkdjc2MTAgY29tcGF0aWJs
ZSBzdHJpbmcgdG8KdGhlIERUIGJpbmRpbmdzIChjb21taXQgOTAxYTUyYzQzMzU5LCAibWVkaWE6
IEFkZCBBRFY3NjEwIHN1cHBvcnQgZm9yCmFkdjc2MDQgZHJpdmVyIC0gRFQgZG9jcy4iKSBkaWRu
J3QgZXh0ZW5kIHRoZSBjb25kaXRpb25hbCBydWxlcyBmdXJ0aGVyCmRvd24gaW4gdGhlIGZpbGUg
dGhhdCBkZWZpbmVzIHdoYXQgcG9ydHMgYXJlIG5lZWRlZC4gVGhhdCdzIHdoeSBJIGRvbid0Cmtu
b3cgd2hhdCB3YXMgaW50ZW5kZWQuIEkgYmVsaWV2ZSB0aGUgYWR2NzYxMCBzaG91bGQgYmUgdHJl
YXRlZCBsaWtlIHRoZQphZHY3NjExLCBnaXZlbiB0aGF0IHRoZSBkcml2ZXIgaGFzCgogICAgICAg
IHsgLmNvbXBhdGlibGUgPSAiYWRpLGFkdjc2MTAiLCAuZGF0YSA9ICZhZHY3Nnh4X2NoaXBfaW5m
b1tBRFY3NjExXSB9LAogICAgICAgIHsgLmNvbXBhdGlibGUgPSAiYWRpLGFkdjc2MTEiLCAuZGF0
YSA9ICZhZHY3Nnh4X2NoaXBfaW5mb1tBRFY3NjExXSB9LAoKQ291bGQgeW91IHNlbmQgYSBwYXRj
aCB0byBhZGRyZXNzIHRoYXQgaW4gdGhlIERUIGJpbmRpbmdzID8KCj4gQURWNzYxMSBzZWVtcyB0
byBiZSBtb3N0bHkgYSA3NjEwIGluIGEgZGlmZmVyZW50IHBhY2thZ2UgKExRRlAgNjQKPiBpbnN0
ZWFkIG9mIHNvbWUgQkdBIDc2KS4gVGhlIGRyaXZlciBzaW1wbHkgdHJlYXRzIEFEVjc2MTAgYXMg
YSA3NjExLgo+IAo+IEFEVjc2MTIgaXMgYXBwYXJlbnRseSBkdWFsIHBvcnQgKG9ubHkgb25lIHBv
cnQgY2FuIGJlIHVzZWQgYXQgYSB0aW1lKQo+IHRob3VnaDoKPiAKPiBbQURWNzYxMl0gPSB7Cj4g
ICAgICAgICAudHlwZSA9IEFEVjc2MTIsCj4gICAgICAgICAuaGFzX2FmZSA9IGZhbHNlLAo+ICAg
ICAgICAgLm1heF9wb3J0ID0gQURWNzZYWF9QQURfSERNSV9QT1JUX0EsICAgIC8qIEIgbm90IHN1
cHBvcnRlZCAqLwo+ICAgICAgICAgLm51bV9kdl9wb3J0cyA9IDEsICAgICAgICAgICAgICAgICAg
ICAgIC8qIG5vcm1hbGx5IDIgKi8KPiAKPiAKPiBBbGwgcmVsYXRlZCBpbi10cmVlIERUUyBlbnRy
aWVzIChhcyBvZiB2Ni44LjAtcmMxKSBzZWVtIHRvIGJlIEFEVjc2MTIuCj4gCj4gVG8gbWUgaXQg
c2VlbXMgYWxsIGtub3duIGRldmljZXMgdXNlIHRoZSBmaXJzdCBwb3J0IG9ubHkuCgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
