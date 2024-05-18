Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC5C8CAE65
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 14:35:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E487C6C83C;
	Tue, 21 May 2024 12:35:54 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43271C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 May 2024 12:12:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-351d4909711so525612f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 May 2024 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716034369; x=1716639169;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VjQuoZFHMHA8S1ZSu4KweX7Wc6yX45qb5CUfF3JC+3g=;
 b=GR5daTGUqBU6zYAXHdLOMoZeJ/ZCHb4jgdMDR5YEYl1Vc+ttryIuUiyMhYO1Xo9DuC
 Zuhf0ZpO1sJqQ2GtHFpRVf4kqzXg6C49d38QLfbJdE4q1/1viHagSzRxJok051N//yFI
 jkbgWOmMeEiY86DS/xiT3bih4tb7N7Loziladq/UTGKucRK+kSuv73W/6SqLI0NLWZ73
 ZV2IRF8IAW+gNIRi53ZsDemwJFsnUAwfbGPtIec0OpbC9eQAQChFqRJ1nA+PeT/Yn/0Y
 9qdibmhvq/U2fqSwNE5Eo45rKyBsCUV2M/KdRZW4W06nzu+iiNVuSW3SkYJLdr0bV2da
 FBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716034369; x=1716639169;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VjQuoZFHMHA8S1ZSu4KweX7Wc6yX45qb5CUfF3JC+3g=;
 b=WlOsOc0+AK7R6I2ynhk8TWTB1imJr58/vVdWKwJ1Q+tZ7ZKvSgahDHk3SFxmZGj1O4
 4dd/3iaKvLxSwo+JEOglXO2uZXIoKT/4qxKc1FZJuHvq3whzQK9mVWaUswKfufZHeG1X
 Tk5jNkn1s7gu/kDsh5GnvC61R+QUjBe4K5qDGSXyhRc7QC48wOSYeXlE8KiN3JlVCVNi
 LrPaV8B1/k3JbtRMooWFNZzhkBKo+99C5mAj+5ahfEExbgw60eqwobpEC7gYbvV1hDpb
 9o5iWxWlWQ5q1dxv5Z26HG04rnMqWQd0Y9lLIv53GBwZ5VX4WA5dhYRA+jEDZ60JHMCU
 ePSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT/9dCnAkaDbtWpUlPU4Bp529qzz2t1bVqW6LgMLhGUs8VNLePUS/nZrX9AoYrM0kue8p8hAP7KLeClGMkHDFoeUhrsYhmoamnwlVQgjLKtbkzyG/Pobml
X-Gm-Message-State: AOJu0YwblvwhuMtuOp0eKZxRIogKGQ98CLgFrYuy3427H482za3lWJ0X
 AXEgKL7kxkIHwzbs9RTGafSfQWTTAJMza0VVk38TQfHaXS7Y2/Cl
X-Google-Smtp-Source: AGHT+IGPNIPUXCl8p9mcn96OQDjPifRyietNIMcyjKmJFSVcHTvDZHbrKpLqRbHX7v2igTtLoYFISQ==
X-Received: by 2002:a5d:4484:0:b0:34c:e0d6:bea6 with SMTP id
 ffacd0b85a97d-354b8e3733bmr1436214f8f.29.1716034368352; 
 Sat, 18 May 2024 05:12:48 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a76e6sm24059321f8f.62.2024.05.18.05.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 05:12:48 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sat, 18 May 2024 14:12:03 +0200
Message-Id: <20240518-thermal-v1-0-7dfca3ed454b@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABObSGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDU0ML3ZKM1KLcxBxdizQzI1MTI4vE5DRLJaDqgqLUtMwKsEnRsbW1AJA
 ZiwxZAAAA
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.13.0
X-Mailman-Approved-At: Tue, 21 May 2024 12:35:52 +0000
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/3] Add thermal management support for STi
	platform
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

VGhpcyBwYXRjaCBzZXJpZXMgZW5oYW5jZXMgdGhlIHN0X3RoZXJtYWwgZHJpdmVyIGluIG9yZGVy
IHRvIGVuYWJsZQpzdXBwb3J0IGZvciB0aGVybWFsIHpvbmVzLiBUaGUgY2hhbmdlcyBpbmNsdWRl
OgoKMS4gUmVwbGFjZSBkZXByZWNhdGVkIFBNIHJ1bnRpbWUgbWFjcm9zIHdpdGggdGhlaXIgdXBk
YXRlZCBjb3VudGVycGFydHMuCjIuIEltcGxlbWVudGluZyBkZXZtXyogYmFzZWQgdGhlcm1hbCBv
ZiB6b25lIGZ1bmN0aW9ucyB3aXRoaW4gdGhlIGRyaXZlci4KMy4gVXBkYXRpbmcgdGhlIHN0aWg0
MTggZGV2aWNlLXRyZWUuCgpUaGUgZGV2aWNlLXRyZWUgcGF0Y2ggZGVwZW5kcyBvbiBhbiBlYXJs
aWVyIHBhdGNoIHNlbnQgdG8gdGhlIG1haWxpbmcKbGlzdCBbMV0uCgpBcyBpdCBpcyBjdXJyZW50
bHkgaW1wbGVtZW50ZWQsIGFuIGFsZXJ0IHRocmVzaG9sZCBvZiA4NcKwQyBpcyBzZXQgdG8KdHJp
Z2dlciB0aGUgQ1BVIHRocm90dGxpbmcsIGFuZCB3aGVuIHRoZSB0ZW1wZXJhdHVyZSBleGNlZWRz
IHRoZQpjcml0aWNhbCB0aHJlc2hvbGQgb2YgOTXCsEMsIHRoZSBzeXN0ZW0gc2h1dHMgZG93bi4g
VGhlcmUgaXMgZm9yIG5vdyBubwphY3RpdmUgY29vbGluZyBkZXZpY2Ugb24gdGhlIHBsYXRmb3Jt
LCB3aGljaCBleHBsYWlucyB0aGUgdXNlIG9mIHRoZQpjcHVmcmVxIGZyYW1ld29yay4KClsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwMzIwLXRoZXJtYWwtdjMtMi03MDAyOTY2
OTRjNGFAZ21haWwuY29tCgpUbzogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3Jn
PgpUbzogRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+ClRvOiBaaGFu
ZyBSdWkgPHJ1aS56aGFuZ0BpbnRlbC5jb20+ClRvOiBMdWthc3ogTHViYSA8bHVrYXN6Lmx1YmFA
YXJtLmNvbT4KVG86IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4K
VG86IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+ClRvOiBQ
YXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KVG86IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+ClRvOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtl
cm5lbC5vcmc+ClRvOiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+CkNjOiBsaW51
eC1wbUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKQ2M6
IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KQ2M6IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcK
ClNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNv
bT4KLS0tClJhcGhhZWwgR2FsbGFpcy1Qb3UgKDMpOgogICAgICB0aGVybWFsOiBzdDogc3dpdGNo
IGZyb20gQ09ORklHX1BNX1NMRUVQIGd1YXJkcyB0byBwbV9zbGVlcF9wdHIoKQogICAgICB0aGVy
bWFsOiBzdGk6IGRlcGVuZCBvbiBUSEVSTUFMX09GIHN1YnN5c3RlbQogICAgICBBUk06IGR0czog
c3RpOiBhZGQgdGhlcm1hbC16b25lcyBzdXBwb3J0IG9uIHN0aWg0MTgKCiBhcmNoL2FybS9ib290
L2R0cy9zdC9zdGloNDA3LWZhbWlseS5kdHNpIHwgIDYgKysrLS0KIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0aWg0MTguZHRzaSAgICAgICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLQogZHJpdmVycy90aGVybWFsL3N0L0tjb25maWcgICAgICAgICAgICAgICB8ICAxICsKIGRy
aXZlcnMvdGhlcm1hbC9zdC9zdF90aGVybWFsLmMgICAgICAgICAgfCAyNCArKysrKysrKystLS0t
LS0tLS0tCiBkcml2ZXJzL3RoZXJtYWwvc3Qvc3RfdGhlcm1hbF9tZW1tYXAuYyAgIHwgIDIgKy0K
IGRyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5jICAgICAgICAgfCAgOCArKystLS0tCiA2
IGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQotLS0KYmFz
ZS1jb21taXQ6IGM3NTk2MjE3MGU0OWYyNDM5OTE0MTI3NmFlMTE5ZTZhODc5ZjM2ZGMKY2hhbmdl
LWlkOiAyMDI0MDUxOC10aGVybWFsLThmNjI1NDI4YWNmOQoKQmVzdCByZWdhcmRzLAotLSAKUmFw
aGFlbCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNwb3VAZ21haWwuY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
