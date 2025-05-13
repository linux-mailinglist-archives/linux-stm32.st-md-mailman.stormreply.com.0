Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E4DAB51A2
	for <lists+linux-stm32@lfdr.de>; Tue, 13 May 2025 12:17:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4E4EC7A835;
	Tue, 13 May 2025 10:17:28 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9438FC7A833
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 May 2025 10:17:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 873B1A4D488;
 Tue, 13 May 2025 10:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A91CC4CEED;
 Tue, 13 May 2025 10:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747131446;
 bh=1gM1XLcPgvrG+ys+qc6lxYqS0BilUpTT/Xx1KYUfe40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGeVCKf5BhAzUcwQrQNKICGlkgCNdN3dH/UoO/2nAPKY9brPthNPn8gUGIf70g9YL
 TMf8n+iVRsClxw1Va7+bTGdReYr/vKD3+z2XaEWycSj0tjnfF6K4StAwWXmIEGGM2t
 CVdPEf7vLcUe9uiUFWZc0RtAZw6TRwAtwYOoPByVro1hqMizQnD0Ffzm5/oIR7K3EF
 iAtCQrA0g6iL9FD+8KfsGzSIzrcuK6tU2Q4LczOxUzE7GFd2fCdi51Xx+JUlRDQIB/
 yfgUiX7a4O2nR/rDMwFZ5vVlaRR8NV/dAjfW9/SNuHaOJiVEaxK9i6DkmBFFSnQfWq
 EoKuvHVSEYLkw==
Date: Tue, 13 May 2025 11:17:20 +0100
From: Lee Jones <lee@kernel.org>
To: daniel.lezcano@linaro.org, alexandre.torgue@foss.st.com,
 tglx@linutronix.de, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250513101720.GH2936510@google.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
 <174713127684.4157861.15977616973399970511.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174713127684.4157861.15977616973399970511.b4-ty@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH v6 0/7] Add STM32MP25 LPTIM
 support: MFD, PWM, IIO, counter, clocksource
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

T24gVHVlLCAxMyBNYXkgMjAyNSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBUdWUsIDI5IEFwciAy
MDI1IDE0OjUxOjI2ICswMjAwLCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4gPiBUaGlzIHNlcmll
cyBhZGRzIHN1cHBvcnQgZm9yIFNUTTMyTVAyNSB0byBNRkQgUFdNLCBJSU8sIGNvdW50ZXIgYW5k
Cj4gPiBjbG9ja3NvdXJjZSBsb3ctcG93ZXIgdGltZXIgKExQVElNKSBkcml2ZXJzLgo+ID4gVGhp
cyBuZXcgdmFyaWFudCBpcyBtYW5hZ2VkIGJ5IHVzaW5nIGEgbmV3IERUIGNvbXBhdGlibGUgc3Ry
aW5nLCBoYXJkd2FyZQo+ID4gY29uZmlndXJhdGlvbiBhbmQgdmVyc2lvbiByZWdpc3RlcnMuCj4g
PiBJdCBjb21lcyB3aXRoIGEgc2xpZ2h0bHkgdXBkYXRlZCByZWdpc3RlciBzZXQsIHNvbWUgbmV3
IGZlYXR1cmVzIGFuZCBuZXcKPiA+IGludGVyY29ubmVjdCBzaWduYWxzIGluc2lkZSB0aGUgU29D
Lgo+ID4gU2FtZSBmZWF0dXJlIGxpc3QgYXMgb24gU1RNMzJNUDF4IGlzIHN1cHBvcnRlZCBjdXJy
ZW50bHkuCj4gPiBUaGUgZGV2aWNlIHRyZWUgZmlsZXMgYWRkIGFsbCBpbnN0YW5jZXMgaW4gc3Rt
MzJtcDI1MSBkdHNpIGZpbGUuCj4gPiAKPiA+IFsuLi5dCj4gCj4gQXBwbGllZCwgdGhhbmtzIQo+
IAo+IFsxLzddIGR0LWJpbmRpbmdzOiBtZmQ6IHN0bTMyLWxwdGltZXI6IGFkZCBzdXBwb3J0IGZv
ciBzdG0zMm1wMjUKPiAgICAgICBjb21taXQ6IDNmOWNlOWQwNzYwYWQ2OGE5YzIwMTY3NjY0ZDAy
NmQ5MWRhNjY4NzkKPiBbMi83XSBtZmQ6IHN0bTMyLWxwdGltZXI6IGFkZCBzdXBwb3J0IGZvciBz
dG0zMm1wMjUKPiAgICAgICBjb21taXQ6IDRmOGNlYjAzMDJiMzZjNWY3OGJjYzhkMGU3Y2ZhMjM3
MmZiYTEzNGMKPiBbMy83XSBjbG9ja3NvdXJjZTogc3RtMzItbHB0aW1lcjogYWRkIHN1cHBvcnQg
Zm9yIHN0bTMybXAyNQo+ICAgICAgIGNvbW1pdDogNTQxNGJjOGM1N2M0MTAzOGIxOTk0Y2QyMWEy
Y2MwYjg0MTVjMTU0NAo+IFs0LzddIHB3bTogc3RtMzItbHA6IGFkZCBzdXBwb3J0IGZvciBzdG0z
Mm1wMjUKPiAgICAgICBjb21taXQ6IDNmNTFiMjMyYzFkYThlNTllYjU2MmYxZDgxNTMzMzM0ODI3
YTQ3OTkKCkluIGZ1dHVyZSwgcGxlYXNlIG1hdGNoIHRoZSBzdWJqZWN0IGZvcm1hdCB3aXRoIHRo
YXQgZXhwZWN0ZWQgYnkgdGhlCnN1YnN5c3RlbS4gIEZvciB0aGlzLCBgZ2l0IGxvZyAtLW9uZWxp
bmUgLS0gPHN1YnN5c3RlbT5gIGlzIHlvdXIgZnJpZW5kLgoKSSBjaGFuZ2VkIHRoZW0gYWxsIGZv
ciB5b3UgdGhpcyB0aW1lLgoKVGhlIGFib3ZlIHBhdGNoZXMgaGF2ZSBiZWVuIGFwcGxpZWQgYW5k
IHN1Ym1pdHRlZCBmb3IgYnVpbGQgdGVzdGluZy4KT25jZSBjb21wbGV0ZSwgSSdsbCBmb2xsb3ct
dXAgd2l0aCBhbiBQUiBmb3IgdGhlIG90aGVyIG1haW50YWluZXJzIHRvCnB1bGwgZnJvbS4KCk5v
dGUgdG8gc2VsZjogaWItbWZkLWNsb2Nrc291cmNlLXB3bS02LjE2CgotLSAKTGVlIEpvbmVzIFvm
nY7nkLzmlq9dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
