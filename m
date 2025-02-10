Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3594AA2F3E3
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2025 17:44:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3A65C78F94;
	Mon, 10 Feb 2025 16:44:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 260ACC78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 16:44:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E2265C5BBC;
 Mon, 10 Feb 2025 16:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6BDC4CED1;
 Mon, 10 Feb 2025 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739205855;
 bh=pJIYPWJ+5c+OJAajVySyzvOkJYxLdGI/XLkulyWGlJA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Sap1xWyb/Xua4wOkYzVszhdi1qatQ6+kI68L3yl8aizC4TP6ZfceuQNPR4xa3UP4a
 GcGTPc4GzCih4oxnvKRM/JRcfJuxnwVJIPoBOP1pO4+IDJnyNmdLDruSE2QX9xhwvX
 EhUrumg/0Jp5TOiR5H4oAa8Nh6yapeQllKnvCKasdsEqs/3JdNOjgUxdnbJMtu2bKj
 uu5e23d5Ub57GKgZKwkPFpklHe4zyCPoxx37+rrOX/YBbmpHvx75c8jQAkjW+Mm5Ih
 f6h4+4B0fGSmfE1IbxIjpBOqxH9dXNOp9s5TIWkHXgqzUov/To0QI/h/YJy73ztR71
 aOcRpvV+6+PbA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, ukleinek@kernel.org, alexandre.torgue@foss.st.com, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
Message-Id: <173920585199.1896384.5521926980550161552.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:44:11 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH v3 0/8] Add STM32MP25 timers
 support: MFD, PWM, IIO and counter drivers
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

T24gRnJpLCAxMCBKYW4gMjAyNSAxMDoxOToxNCArMDEwMCwgRmFicmljZSBHYXNuaWVyIHdyb3Rl
Ogo+IFRoaXMgc2VyaWVzIGFkZHMgU1RNMzJNUDI1IHN1cHBvcnQgb24gTUZEIFBXTSwgSUlPLCBj
b3VudGVyIHRpbWVyIGRyaXZlcnMuCj4gVGhpcyBuZXcgdGltZXIgdmFyaWFudCBpcyBtYW5hZ2Vk
IGJ5IHVzaW5nIGEgbmV3IERUIGNvbXBhdGlibGUgc3RyaW5nLgo+IEl0IGNvbWVzIHdpdGggYSBz
bGlnaHRseSB1cGRhdGVkIHJlZ2lzdGVyIHNldCwgc29tZSBuZXcgZmVhdHVyZXMgYW5kIG5ldwo+
IGludGVyY29ubmVjdCBzaWduYWxzIGluc2lkZSB0aGUgU29DLiBUaGVyZSBpcyBhbHNvIGEgbmV3
IGluc3RhbmNlIChUSU0yMCkuCj4gU2FtZSBmZWF0dXJlIGxpc3QgYXMgb24gU1RNMzJNUDF4IGlz
IHN1cHBvcnRlZCBjdXJyZW50bHksIGV4Y2VwdCBmb3IgUFdNCj4gY2FwdHVyZSAobm90IGVuYWJs
ZWQsIGJ5IERUKS4KPiBUaGUgZGV2aWNlIHRyZWUgZmlsZXMgYWRkIGFsbCBpbnN0YW5jZXMgaW4g
c3RtMzJtcDI1MSBkdHNpLiBQV00sIGNvdW50ZXIKPiBhbmQgdHJpZ2dlciBleGFtcGxlcyBhcmUg
cHJvdmlkZWQgZm9yIHN0bTMybXAyNTdmLWV2MSBib2FyZC4KPiAKPiBbLi4uXQoKQXBwbGllZCwg
dGhhbmtzIQoKWzEvOF0gZHQtYmluZGluZ3M6IG1mZDogc3RtMzItdGltZXJzOiBhZGQgc3VwcG9y
dCBmb3Igc3RtMzJtcDI1CiAgICAgIGNvbW1pdDogNGMxZDA0ZDAxM2UzZTUwNzNhN2U3OGU1N2Ni
YTgyYzNjZDgxZDU4NgpbMi84XSBtZmQ6IHN0bTMyLXRpbWVyczogYWRkIHN1cHBvcnQgZm9yIHN0
bTMybXAyNQogICAgICBjb21taXQ6IDNjODFkNDIzNTY4YWQyODU0MGE3ZGFiNGNhOGVhNjZkZWQ5
YjM1MmYKCi0tCkxlZSBKb25lcyBb5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
