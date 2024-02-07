Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC14851714
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Feb 2024 15:35:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F1CAC6C83D;
	Mon, 12 Feb 2024 14:35:37 +0000 (UTC)
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C51B2C6DD99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 13:13:08 +0000 (UTC)
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
 by ni.piap.pl (Postfix) with ESMTPS id 2CA3FC3F2A57;
 Wed,  7 Feb 2024 14:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 2CA3FC3F2A57
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240206134155.GB2827@pendragon.ideasonboard.com> (Laurent
 Pinchart's message of "Tue, 6 Feb 2024 15:41:55 +0200")
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
Date: Wed, 07 Feb 2024 14:13:05 +0100
Message-ID: <m3il30zace.fsf@t19.piap.pl>
MIME-Version: 1.0
X-KLMS-Rule-ID: 3
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30,
 not scanned, whitelist
X-Mailman-Approved-At: Mon, 12 Feb 2024 14:35:35 +0000
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
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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

TGF1cmVudCwKCkxhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT4gd3JpdGVzOgoKPj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvYWR2NzYwNC5jCj4+IEBA
IC0zMjA1LDcgKzMyMDUsNyBAQCBzdGF0aWMgaW50IGFkdjc2eHhfcGFyc2VfZHQoc3RydWN0IGFk
djc2eHhfc3RhdGUgKnN0YXRlKQo+PiAgICAgICBucCA9IHN0YXRlLT5pMmNfY2xpZW50c1tBRFY3
NlhYX1BBR0VfSU9dLT5kZXYub2Zfbm9kZTsKPj4KPj4gICAgICAgLyogUGFyc2UgdGhlIGVuZHBv
aW50LiAqLwo+PiAtICAgICBlbmRwb2ludCA9IG9mX2dyYXBoX2dldF9uZXh0X2VuZHBvaW50KG5w
LCBOVUxMKTsKPj4gKyAgICAgZW5kcG9pbnQgPSBvZl9ncmFwaF9nZXRfZW5kcG9pbnRfYnlfcmVn
cyhucCwgMCwgLTEpOwo+Cj4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBwb3J0IDEgZm9yIHRoZSBh
ZHY3NjExIGFuZCBwb3J0MiBmb3IgdGhlIGFkdjc2MTIuCj4gVGhlIGFkdjc2MTAgbWF5IG5lZWQg
dG8gdXNlIHBvcnQgMSB0b28sIGJ1dCB0aGUgYmluZGluZ3MgbGlrZWx5IG5lZWQgdG8KPiBiZSB1
cGRhdGVkLgoKVG8gYmUgaG9uZXN0IEkgaGF2ZSBubyBpZGVhIGFib3V0IEFEVjc2MTEgYW5kIDc2
MTIuClRoZSA3NjEwIEkgaGF2ZSBvbiBUaW55cmV4ICJtb2JvIiBzZWVtcyB0byBiZSBzaW5nbGUg
cG9ydC4KCkFEVjc2MTEgc2VlbXMgdG8gYmUgbW9zdGx5IGEgNzYxMCBpbiBhIGRpZmZlcmVudCBw
YWNrYWdlIChMUUZQIDY0Cmluc3RlYWQgb2Ygc29tZSBCR0EgNzYpLiBUaGUgZHJpdmVyIHNpbXBs
eSB0cmVhdHMgQURWNzYxMCBhcyBhIDc2MTEuCgpBRFY3NjEyIGlzIGFwcGFyZW50bHkgZHVhbCBw
b3J0IChvbmx5IG9uZSBwb3J0IGNhbiBiZSB1c2VkIGF0IGEgdGltZSkKdGhvdWdoOgoKW0FEVjc2
MTJdID0gewogICAgICAgIC50eXBlID0gQURWNzYxMiwKICAgICAgICAuaGFzX2FmZSA9IGZhbHNl
LAogICAgICAgIC5tYXhfcG9ydCA9IEFEVjc2WFhfUEFEX0hETUlfUE9SVF9BLCAgICAvKiBCIG5v
dCBzdXBwb3J0ZWQgKi8KICAgICAgICAubnVtX2R2X3BvcnRzID0gMSwgICAgICAgICAgICAgICAg
ICAgICAgLyogbm9ybWFsbHkgMiAqLwoKCkFsbCByZWxhdGVkIGluLXRyZWUgRFRTIGVudHJpZXMg
KGFzIG9mIHY2LjguMC1yYzEpIHNlZW0gdG8gYmUgQURWNzYxMi4KClRvIG1lIGl0IHNlZW1zIGFs
bCBrbm93biBkZXZpY2VzIHVzZSB0aGUgZmlyc3QgcG9ydCBvbmx5LgotLSAKS3J6eXN6dG9mICJD
aHJpcyIgSGHFgmFzYQoKU2llxIcgQmFkYXdjemEgxYF1a2FzaWV3aWN6ClByemVteXPFgm93eSBJ
bnN0eXR1dCBBdXRvbWF0eWtpIGkgUG9taWFyw7N3IFBJQVAKQWwuIEplcm96b2xpbXNraWUgMjAy
LCAwMi00ODYgV2Fyc3phd2EKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
