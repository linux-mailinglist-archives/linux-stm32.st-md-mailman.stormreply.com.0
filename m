Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3726AB5177
	for <lists+linux-stm32@lfdr.de>; Tue, 13 May 2025 12:14:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91C7BC7A835;
	Tue, 13 May 2025 10:14:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04707C7A833
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 May 2025 10:14:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E119F62A25;
 Tue, 13 May 2025 10:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A53C4CEE4;
 Tue, 13 May 2025 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747131280;
 bh=TudxigjBRZmDuW3JVuS0UdXgbmBBti/+Bcm5HABZycc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gO9Odf6yxgKQ/tjlCyh718juS1TDEPZcF+wxJN+UoX2qvYyLv8aw+tAO+keDPD+i1
 IT03ndNxQJAga5CuP135TsbcLg59TiGomAO/x9C2N6LKAd9YqVC6qE00olsjRw3hCx
 WXWuat4XwWf2z/1JE75K9uADTwx4eLKypgSmhme5ihpDSAUnFLC/4pgVEc0m2lW4y7
 58BF5P4XzyGI4VLqc2GZcsJ8NliIeOMYsDPOZmQkYZlQ1HkINCT9x+Xi+sTJGSVDoF
 XPmrqJviP7NQA8mzw6HYC3+y0IOz6rSNaovSt+T8xdHz0ATUsQrpzPDYDXAC4G4zwH
 wgoQ/7utBR43g==
From: Lee Jones <lee@kernel.org>
To: daniel.lezcano@linaro.org, lee@kernel.org, alexandre.torgue@foss.st.com, 
 tglx@linutronix.de, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
Message-Id: <174713127684.4157861.15977616973399970511.b4-ty@kernel.org>
Date: Tue, 13 May 2025 11:14:36 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-b75d9
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

T24gVHVlLCAyOSBBcHIgMjAyNSAxNDo1MToyNiArMDIwMCwgRmFicmljZSBHYXNuaWVyIHdyb3Rl
Ogo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgU1RNMzJNUDI1IHRvIE1GRCBQV00sIElJ
TywgY291bnRlciBhbmQKPiBjbG9ja3NvdXJjZSBsb3ctcG93ZXIgdGltZXIgKExQVElNKSBkcml2
ZXJzLgo+IFRoaXMgbmV3IHZhcmlhbnQgaXMgbWFuYWdlZCBieSB1c2luZyBhIG5ldyBEVCBjb21w
YXRpYmxlIHN0cmluZywgaGFyZHdhcmUKPiBjb25maWd1cmF0aW9uIGFuZCB2ZXJzaW9uIHJlZ2lz
dGVycy4KPiBJdCBjb21lcyB3aXRoIGEgc2xpZ2h0bHkgdXBkYXRlZCByZWdpc3RlciBzZXQsIHNv
bWUgbmV3IGZlYXR1cmVzIGFuZCBuZXcKPiBpbnRlcmNvbm5lY3Qgc2lnbmFscyBpbnNpZGUgdGhl
IFNvQy4KPiBTYW1lIGZlYXR1cmUgbGlzdCBhcyBvbiBTVE0zMk1QMXggaXMgc3VwcG9ydGVkIGN1
cnJlbnRseS4KPiBUaGUgZGV2aWNlIHRyZWUgZmlsZXMgYWRkIGFsbCBpbnN0YW5jZXMgaW4gc3Rt
MzJtcDI1MSBkdHNpIGZpbGUuCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzddIGR0
LWJpbmRpbmdzOiBtZmQ6IHN0bTMyLWxwdGltZXI6IGFkZCBzdXBwb3J0IGZvciBzdG0zMm1wMjUK
ICAgICAgY29tbWl0OiAzZjljZTlkMDc2MGFkNjhhOWMyMDE2NzY2NGQwMjZkOTFkYTY2ODc5Clsy
LzddIG1mZDogc3RtMzItbHB0aW1lcjogYWRkIHN1cHBvcnQgZm9yIHN0bTMybXAyNQogICAgICBj
b21taXQ6IDRmOGNlYjAzMDJiMzZjNWY3OGJjYzhkMGU3Y2ZhMjM3MmZiYTEzNGMKWzMvN10gY2xv
Y2tzb3VyY2U6IHN0bTMyLWxwdGltZXI6IGFkZCBzdXBwb3J0IGZvciBzdG0zMm1wMjUKICAgICAg
Y29tbWl0OiA1NDE0YmM4YzU3YzQxMDM4YjE5OTRjZDIxYTJjYzBiODQxNWMxNTQ0Cls0LzddIHB3
bTogc3RtMzItbHA6IGFkZCBzdXBwb3J0IGZvciBzdG0zMm1wMjUKICAgICAgY29tbWl0OiAzZjUx
YjIzMmMxZGE4ZTU5ZWI1NjJmMWQ4MTUzMzMzNDgyN2E0Nzk5CgotLQpMZWUgSm9uZXMgW+adjueQ
vOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
