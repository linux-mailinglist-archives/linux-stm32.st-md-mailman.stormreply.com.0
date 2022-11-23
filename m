Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46821635C76
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 13:11:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE624C6506F;
	Wed, 23 Nov 2022 12:11:45 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE796C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 12:11:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2882CB81F1B;
 Wed, 23 Nov 2022 12:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC45C433B5;
 Wed, 23 Nov 2022 12:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669205501;
 bh=LVCS/9pspNUOtJim3pqK4CvI0blKDQrkaBc4pcfzuoI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rj3QTsNVa7ZgOuhLfBy9tx18KCIlTIJMB4cSkte+RplU+eSl/lFO/EDez7bdjVFd9
 9fX+DaKr8ANAhizoOsbjkLgSttlC83xklILjmy49JcJ/UwvKoN7SQ7eR139VwePc6M
 Gfek6syflcEVKoSML/mJta2HjhsXv47WgeUfGOK/KJQ1oGPhZEsEp+xISfzHjYqXec
 stw+LHBzRC2ZFa54Xibl4uXodosL+xXoxv0Z1tmFct2dTM8wNNExw5hthuZ2IBYSZU
 Y6pqeJovtUL6HrNGLMCQs4x2+LJFh8jEtzGnS7s5OAFYw+0Z3KNg7FLhXUarYVeKWK
 Qwq1WYu1OFoqA==
From: Mark Brown <broonie@kernel.org>
To: Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>, Uwe Kleine-König <uwe@kleine-koenig.org>,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Message-Id: <166920549294.105268.4063772555451021149.b4-ty@kernel.org>
Date: Wed, 23 Nov 2022 12:11:32 +0000
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, patches@opensource.cirrus.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] (subset) [PATCH 000/606] i2c: Complete conversion
	to i2c_probe_new
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

T24gRnJpLCAxOCBOb3YgMjAyMiAyMzozNTozNCArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gc2luY2UgY29tbWl0IGI4YTFhNGNkNWE5OCAoImkyYzogUHJvdmlkZSBhIHRlbXBvcmFy
eSAucHJvYmVfbmV3KCkKPiBjYWxsLWJhY2sgdHlwZSIpIGZyb20gMjAxNiB0aGVyZSBpcyBhICJ0
ZW1wb3JhcnkiIGFsdGVybmF0aXZlIHByb2JlCj4gY2FsbGJhY2sgZm9yIGkyYyBkcml2ZXJzLgo+
IAo+IFRoaXMgc2VyaWVzIGNvbXBsZXRlcyBhbGwgZHJpdmVycyB0byB0aGlzIG5ldyBjYWxsYmFj
ayAodW5sZXNzIEkgbWlzc2VkCj4gc29tZXRoaW5nKS4gSXQncyBiYXNlZCBvbiBjdXJyZW50IG5l
eHQvbWFzdGVyLgo+IEEgcGFydCBvZiB0aGUgcGF0Y2hlcyBkZXBlbmQgb24gY29tbWl0IDY2MjIz
MzczMWQ2NiAoImkyYzogY29yZToKPiBJbnRyb2R1Y2UgaTJjX2NsaWVudF9nZXRfZGV2aWNlX2lk
IGhlbHBlciBmdW5jdGlvbiIpLCB0aGVyZSBpcyBhIGJyYW5jaCB0aGF0Cj4geW91IGNhbiBwdWxs
IGludG8geW91ciB0cmVlIHRvIGdldCBpdDoKPiAKPiBbLi4uXQoKQXBwbGllZCB0bwoKICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9yZWd1
bGF0b3IuZ2l0IGZvci1uZXh0CgpUaGFua3MhCgpbNTM4LzYwNl0gcmVndWxhdG9yOiBhY3Q4ODY1
LXJlZ3VsYXRvcjogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBj
b21taXQgaW5mbykKWzUzOS82MDZdIHJlZ3VsYXRvcjogYWQ1Mzk4OiBDb252ZXJ0IHRvIGkyYydz
IC5wcm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbNTQwLzYwNl0gcmVndWxh
dG9yOiBkYTkxMjEtcmVndWxhdG9yOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAg
ICAgICAgY29tbWl0OiAwMjBjZjczYjQ3NDE0YTg0YjY2NmQzZTY3MzZhNmFlOTU3ZTI3ODQwCls1
NDEvNjA2XSByZWd1bGF0b3I6IGZhbjUzNTU1OiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXco
KQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbNTQyLzYwNl0gcmVndWxhdG9yOiBpc2w2Mjcx
YS1yZWd1bGF0b3I6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICAobm8g
Y29tbWl0IGluZm8pCls1NDMvNjA2XSByZWd1bGF0b3I6IGxwMzk3MjogQ29udmVydCB0byBpMmMn
cyAucHJvYmVfbmV3KCkKICAgICAgICAgIGNvbW1pdDogMjUzMmQ1ZjhkNWMyMGQ1YTBhOGEwZDU3
YTMxMWJjNWRmMDBkZWEwNApbNTQ0LzYwNl0gcmVndWxhdG9yOiBscDg3Mng6IENvbnZlcnQgdG8g
aTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICAobm8gY29tbWl0IGluZm8pCls1NDUvNjA2XSBy
ZWd1bGF0b3I6IGxwODc1NTogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAg
IGNvbW1pdDogY2IyOGY3NGI0ODA5YTAwYjQwZmRmMGM0NGNjZjUxYWI5NTA1ODFkMwpbNTQ2LzYw
Nl0gcmVndWxhdG9yOiBsdGMzNTg5OiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAg
ICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbNTQ3LzYwNl0gcmVndWxhdG9yOiBtYXgxNTg2OiBDb252
ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiAzZDU0ZjdiYTI0OGIw
YWQxNzkxYmMzNTZlOWFkM2Q5MDIwYTFjNDcyCls1NDgvNjA2XSByZWd1bGF0b3I6IG1heDg2NDk6
IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBjb21taXQ6IDNjZjQ0MTcz
ODVkMGFjOGYwMmYyMjg4OGUxMmE2ZDIxZDk3ZDg5ZmMKWzU0OS82MDZdIHJlZ3VsYXRvcjogbWF4
ODY2MDogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQg
aW5mbykKWzU1MC82MDZdIHJlZ3VsYXRvcjogbWF4ODk1MjogQ29udmVydCB0byBpMmMncyAucHJv
YmVfbmV3KCkKICAgICAgICAgIGNvbW1pdDogYzIwYzM2NzM1OTQ5YjNiNzk4NDY5MmZiYWIzZDky
YjBlOGE4NDVlYwpbNTUxLzYwNl0gcmVndWxhdG9yOiBtYXg4OTczLXJlZ3VsYXRvcjogQ29udmVy
dCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzU1Mi82
MDZdIHJlZ3VsYXRvcjogcGNhOTQ1MC1yZWd1bGF0b3I6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2Jl
X25ldygpCiAgICAgICAgICBjb21taXQ6IGVkNTZmYTZlODA0Y2IxM2JiZTI5ZTkyMTQ3OTIzMDg4
MTdmNmU1NTMKWzU1My82MDZdIHJlZ3VsYXRvcjogcGZ1emUxMDAtcmVndWxhdG9yOiBDb252ZXJ0
IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbNTU0LzYw
Nl0gcmVndWxhdG9yOiBwdjg4MDgwLXJlZ3VsYXRvcjogQ29udmVydCB0byBpMmMncyAucHJvYmVf
bmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzU1NS82MDZdIHJlZ3VsYXRvcjogcnBp
LXBhbmVsLWF0dGlueS1yZWd1bGF0b3I6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAg
ICAgICAgICBjb21taXQ6IGQ4NWQwMmQxN2E2MDhiNTU4ZDQ0NTEwZTk4MjQ2NjhjNWQ0ZmU1ZDgK
WzU1Ni82MDZdIHJlZ3VsYXRvcjogdHBzNTE2MzItcmVndWxhdG9yOiBDb252ZXJ0IHRvIGkyYydz
IC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiBkNDg4NWYzMDYzMDRmZjI5ZWVjMDZiOWFk
NWY1MjZhMTA5OWUwNDE4Cls1NTcvNjA2XSByZWd1bGF0b3I6IHRwczYyMzYwLXJlZ3VsYXRvcjog
Q29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykK
WzU1OC82MDZdIHJlZ3VsYXRvcjogdHBzNjI4NngtcmVndWxhdG9yOiBDb252ZXJ0IHRvIGkyYydz
IC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiBlMzQ3ODIzMTYyODFjNzhjNTkxMWY4NmQ0
Njk5ZDRmMzVhNjA3YzlkCls1NTkvNjA2XSByZWd1bGF0b3I6IHRwczY1MDIzLXJlZ3VsYXRvcjog
Q29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykK
CkFsbCBiZWluZyB3ZWxsIHRoaXMgbWVhbnMgdGhhdCBpdCB3aWxsIGJlIGludGVncmF0ZWQgaW50
byB0aGUgbGludXgtbmV4dAp0cmVlICh1c3VhbGx5IHNvbWV0aW1lIGluIHRoZSBuZXh0IDI0IGhv
dXJzKSBhbmQgc2VudCB0byBMaW51cyBkdXJpbmcKdGhlIG5leHQgbWVyZ2Ugd2luZG93IChvciBz
b29uZXIgaWYgaXQgaXMgYSBidWcgZml4KSwgaG93ZXZlciBpZgpwcm9ibGVtcyBhcmUgZGlzY292
ZXJlZCB0aGVuIHRoZSBwYXRjaCBtYXkgYmUgZHJvcHBlZCBvciByZXZlcnRlZC4KCllvdSBtYXkg
Z2V0IGZ1cnRoZXIgZS1tYWlscyByZXN1bHRpbmcgZnJvbSBhdXRvbWF0ZWQgb3IgbWFudWFsIHRl
c3RpbmcKYW5kIHJldmlldyBvZiB0aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBlb3BsZSBy
ZXBvcnRpbmcgcHJvYmxlbXMgYW5kCnNlbmQgZm9sbG93dXAgcGF0Y2hlcyBhZGRyZXNzaW5nIGFu
eSBpc3N1ZXMgdGhhdCBhcmUgcmVwb3J0ZWQgaWYgbmVlZGVkLgoKSWYgYW55IHVwZGF0ZXMgYXJl
IHJlcXVpcmVkIG9yIHlvdSBhcmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQpzaG91
bGQgYmUgc2VudCBhcyBpbmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4
aXN0aW5nCnBhdGNoZXMgd2lsbCBub3QgYmUgcmVwbGFjZWQuCgpQbGVhc2UgYWRkIGFueSByZWxl
dmFudCBsaXN0cyBhbmQgbWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nCnRvIHRo
aXMgbWFpbC4KClRoYW5rcywKTWFyawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
