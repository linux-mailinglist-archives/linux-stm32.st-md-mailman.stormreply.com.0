Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4EF637D71
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Nov 2022 17:04:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16FEAC65E44;
	Thu, 24 Nov 2022 16:04:16 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5863C6507C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Nov 2022 16:04:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 382A7B82874;
 Thu, 24 Nov 2022 16:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4356C433D6;
 Thu, 24 Nov 2022 16:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669305852;
 bh=IvHYWDLn1DgR8LH4t7rSubz36Ju+jzSqmPmYrOhNPlo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WlxvzM22NwMDCoQChrQhXcrqFDVCZNvtWkzovYYg2PyBCYEXL4YaJuKbp1dQByKcF
 FmlwRuCiw0oQRKp2ZSDzDV/aqXNW4V8kWhrIBPIdh+/S7edLrqRPFuSS4MdSBm7BLH
 IDnPtjktIvP1hka5/d8VaQhqX7Yn6GZ5Hx+IOBEDhJbY4qMOFPtHIuaB8I1wIuGdL6
 g1de0tQjk0TcZc+A64jFItQC3XsxmvpZZRqGF7esQ3Lb9AgP1rdwW/lFgi93zL+mqf
 sGYMjME4SGIBJuwf4qC9yYSwep3N56gpSQJ5vy76O58xNPbhd+xJcjeFicKz9acOhD
 lG4G9UHzWi0mA==
From: Mark Brown <broonie@kernel.org>
To: Uwe Kleine-König <uwe@kleine-koenig.org>, Lee Jones <lee.jones@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Grant Likely <grant.likely@linaro.org>
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Message-Id: <166930584463.436148.7438729312416805991.b4-ty@kernel.org>
Date: Thu, 24 Nov 2022 16:04:04 +0000
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
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
LXJlZ3VsYXRvcjogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIGNvbW1p
dDogM2QyYTc4YWU1ZGY1ZDdmNDhjMDAyZTVmNzNkMThkOGM3NjI4ZDI2NgpbNTM5LzYwNl0gcmVn
dWxhdG9yOiBhZDUzOTg6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBj
b21taXQ6IDdmNjllZGJhOTYwYmJkY2JjODI5ZDhkMDk5NWIxMTE3Y2UyOWU4YjEKWzU0MC82MDZd
IHJlZ3VsYXRvcjogZGE5MTIxLXJlZ3VsYXRvcjogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3
KCkKICAgICAgICAgIGNvbW1pdDogMDIwY2Y3M2I0NzQxNGE4NGI2NjZkM2U2NzM2YTZhZTk1N2Uy
Nzg0MApbNTQxLzYwNl0gcmVndWxhdG9yOiBmYW41MzU1NTogQ29udmVydCB0byBpMmMncyAucHJv
YmVfbmV3KCkKICAgICAgICAgIGNvbW1pdDogNjU1NDI1NjUwZjVlMzYxMjI0YTg2YWExMWJmM2Mw
NDRiZjA0ZGYyYQpbNTQyLzYwNl0gcmVndWxhdG9yOiBpc2w2MjcxYS1yZWd1bGF0b3I6IENvbnZl
cnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBjb21taXQ6IDY5NTE4ZDIxZGVhYTQ0
OGJlNjViN2MwYmU2N2FhYjIzMGU4OGVhYTcKWzU0My82MDZdIHJlZ3VsYXRvcjogbHAzOTcyOiBD
b252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiAyNTMyZDVmOGQ1
YzIwZDVhMGE4YTBkNTdhMzExYmM1ZGYwMGRlYTA0Cls1NDQvNjA2XSByZWd1bGF0b3I6IGxwODcy
eDogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIGNvbW1pdDogODdmZWNj
YjM0N2IyNWY1ZGM2ZmY0NTExMjNiODMyYzlhZDVkZGRmZQpbNTQ1LzYwNl0gcmVndWxhdG9yOiBs
cDg3NTU6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBjb21taXQ6IGNi
MjhmNzRiNDgwOWEwMGI0MGZkZjBjNDRjY2Y1MWFiOTUwNTgxZDMKWzU0Ni82MDZdIHJlZ3VsYXRv
cjogbHRjMzU4OTogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIGNvbW1p
dDogNzhjOGY2Y2RiNTFkNDcxOTI4ZDQ4MWVkM2IyYzgyZGJjMTEwYTFlZApbNTQ3LzYwNl0gcmVn
dWxhdG9yOiBtYXgxNTg2OiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAg
Y29tbWl0OiAzZDU0ZjdiYTI0OGIwYWQxNzkxYmMzNTZlOWFkM2Q5MDIwYTFjNDcyCls1NDgvNjA2
XSByZWd1bGF0b3I6IG1heDg2NDk6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAg
ICAgICBjb21taXQ6IDNjZjQ0MTczODVkMGFjOGYwMmYyMjg4OGUxMmE2ZDIxZDk3ZDg5ZmMKWzU0
OS82MDZdIHJlZ3VsYXRvcjogbWF4ODY2MDogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkK
ICAgICAgICAgIGNvbW1pdDogZGJmMzFkYWM3MDMwMDkxNzQyMjZiYjg3YjM5MTRiZDA5MjA0MDMy
NwpbNTUwLzYwNl0gcmVndWxhdG9yOiBtYXg4OTUyOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9u
ZXcoKQogICAgICAgICAgY29tbWl0OiBjMjBjMzY3MzU5NDliM2I3OTg0NjkyZmJhYjNkOTJiMGU4
YTg0NWVjCls1NTEvNjA2XSByZWd1bGF0b3I6IG1heDg5NzMtcmVndWxhdG9yOiBDb252ZXJ0IHRv
IGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiA0ZTg1ZTVkNjRmNjZhYzVlNGIw
Mjg2ZWU0YjZmOGU4Y2UxMDQ0ZDQyCls1NTIvNjA2XSByZWd1bGF0b3I6IHBjYTk0NTAtcmVndWxh
dG9yOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiBlZDU2
ZmE2ZTgwNGNiMTNiYmUyOWU5MjE0NzkyMzA4ODE3ZjZlNTUzCls1NTMvNjA2XSByZWd1bGF0b3I6
IHBmdXplMTAwLXJlZ3VsYXRvcjogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAg
ICAgIGNvbW1pdDogODM0OGM3MTBiNTFiYWM3MTNhNmZkMmUwN2Q2NGViNzFkNTY4MGUyZQpbNTU0
LzYwNl0gcmVndWxhdG9yOiBwdjg4MDgwLXJlZ3VsYXRvcjogQ29udmVydCB0byBpMmMncyAucHJv
YmVfbmV3KCkKICAgICAgICAgIGNvbW1pdDogYzlmOWVmMTViODQyMjJmNGNjNjg2YjEwMTNlZTNm
ZDE5MmIwYmFiOApbNTU1LzYwNl0gcmVndWxhdG9yOiBycGktcGFuZWwtYXR0aW55LXJlZ3VsYXRv
cjogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIGNvbW1pdDogZDg1ZDAy
ZDE3YTYwOGI1NThkNDQ1MTBlOTgyNDY2OGM1ZDRmZTVkOApbNTU2LzYwNl0gcmVndWxhdG9yOiB0
cHM1MTYzMi1yZWd1bGF0b3I6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAg
ICBjb21taXQ6IGQ0ODg1ZjMwNjMwNGZmMjllZWMwNmI5YWQ1ZjUyNmExMDk5ZTA0MTgKWzU1Ny82
MDZdIHJlZ3VsYXRvcjogdHBzNjIzNjAtcmVndWxhdG9yOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9i
ZV9uZXcoKQogICAgICAgICAgY29tbWl0OiAxODgwNDE2MDI3N2VjMmFiOTkyMzczMzg1Zjg2YzZh
ZjIzMjJiMjhiCls1NTgvNjA2XSByZWd1bGF0b3I6IHRwczYyODZ4LXJlZ3VsYXRvcjogQ29udmVy
dCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIGNvbW1pdDogZTM0NzgyMzE2MjgxYzc4
YzU5MTFmODZkNDY5OWQ0ZjM1YTYwN2M5ZApbNTU5LzYwNl0gcmVndWxhdG9yOiB0cHM2NTAyMy1y
ZWd1bGF0b3I6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBjb21taXQ6
IDNiNWIwN2RkZTk5OGY2YWRlNzQzM2E4ZGIwMTljZjgxNmM3ZTM1YWYKCkFsbCBiZWluZyB3ZWxs
IHRoaXMgbWVhbnMgdGhhdCBpdCB3aWxsIGJlIGludGVncmF0ZWQgaW50byB0aGUgbGludXgtbmV4
dAp0cmVlICh1c3VhbGx5IHNvbWV0aW1lIGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2VudCB0
byBMaW51cyBkdXJpbmcKdGhlIG5leHQgbWVyZ2Ugd2luZG93IChvciBzb29uZXIgaWYgaXQgaXMg
YSBidWcgZml4KSwgaG93ZXZlciBpZgpwcm9ibGVtcyBhcmUgZGlzY292ZXJlZCB0aGVuIHRoZSBw
YXRjaCBtYXkgYmUgZHJvcHBlZCBvciByZXZlcnRlZC4KCllvdSBtYXkgZ2V0IGZ1cnRoZXIgZS1t
YWlscyByZXN1bHRpbmcgZnJvbSBhdXRvbWF0ZWQgb3IgbWFudWFsIHRlc3RpbmcKYW5kIHJldmll
dyBvZiB0aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBlb3BsZSByZXBvcnRpbmcgcHJvYmxl
bXMgYW5kCnNlbmQgZm9sbG93dXAgcGF0Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhhdCBh
cmUgcmVwb3J0ZWQgaWYgbmVlZGVkLgoKSWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9yIHlv
dSBhcmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQpzaG91bGQgYmUgc2VudCBhcyBp
bmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0aW5nCnBhdGNoZXMg
d2lsbCBub3QgYmUgcmVwbGFjZWQuCgpQbGVhc2UgYWRkIGFueSByZWxldmFudCBsaXN0cyBhbmQg
bWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nCnRvIHRoaXMgbWFpbC4KClRoYW5r
cywKTWFyawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
