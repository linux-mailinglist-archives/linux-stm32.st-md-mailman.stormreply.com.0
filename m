Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1B6932F2B
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jul 2024 19:35:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E12EFC78014;
	Tue, 16 Jul 2024 17:35:20 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FD6EC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2024 17:35:13 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52e9fe05354so8065277e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2024 10:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721151312; x=1721756112;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kchnNo8yPLFh2dK5IcV05EsWvdVMiZ16c0fFJ750TxA=;
 b=dbKlP5EsNZ3SdyY4nfhA/j7t1znfo+cRd1aD/BlejIRwUQF1mMawI96AyyO52ZMOdK
 zVtes9Kw4eQbRNYB5q0/0y+0px5/7bHVAPjMISV0Db71gXIVRtwZe4i9bhHNIKoAWm1f
 XIeXM2xleotSsQu0HmBmBGyOdpEjmy6gonUTVnIfWTYZG1Pax/k6l/QE5LrqKrxmaLGM
 Bbcovor7r1wx33iP0lKF8uEtF9JusJFZ2pllMLpNeH2jrv4mcQ4/Ww8Z5OqxWbGmhbPw
 mFt/yl8AytzQGOpJsHl43ig5ssQIR7nsNhV3igXoQHQ2h4ZEdNLSO4JPvHMdY4+VixWx
 9pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721151312; x=1721756112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kchnNo8yPLFh2dK5IcV05EsWvdVMiZ16c0fFJ750TxA=;
 b=RIDKTUtZ+AkMWhqiOgXT0z6MB1/gPbUCQXJYpj1ajossKRmYsdnqLR4IKQuGtzMKYN
 HbW22RPCI04Rvyf2wiRy9192r8LERCrbECMUraCnMZShzQXmd4ZXBai625QQObIsGt+1
 6o4n/fkvz7/EP+np1jrD62/NjEuds9bbTlEq8ifPVlkaHeHk9NLTzsAgbQ3ghIlE6Gtf
 vVg+jtnRqWe11VuD7BylNDRVNbPd2sV5TOdDgeKFtYGz6Xp8e2uoTiuTIpCZNKTD7pTT
 8sfWRUzUiOe/gDKjiOfr1gq0VVJxxBTfmkKQwBnREnt6s8/2+tBtMU63ShHD0HpZr2UQ
 e6ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaBCztGiSN485ScELLy9PbIgMfD4afmSTtcX45PgOnH3J7bVy/BrYK8NPSBholreDrjDarNqdUTWiNU7x3I1QYoHkOWdThcLzRfLCmVwfLMMY71YObHT4n
X-Gm-Message-State: AOJu0Yxt5VJaOC+w7CJP7ZtmeSXuhTWY8V8v2wEYQ5ZgoDgNZuDL8btT
 AUeV7IICGt0WfuQnKS6OO7bDKRTSC1Jd1pKikzLhNBestsXyhLXB
X-Google-Smtp-Source: AGHT+IE2mB4oZTOTvFDO5DkXK2tpo0pPHe/jgiUbxjLLBf4wAR3RggsbcbiEp4YgqrGFa1ldiV2H0w==
X-Received: by 2002:a05:6512:e93:b0:52c:8e00:486a with SMTP id
 2adb3069b0e04-52edf038979mr2407374e87.55.1721151311803; 
 Tue, 16 Jul 2024 10:35:11 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2397easm172599675e9.6.2024.07.16.10.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 10:35:11 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Tue, 16 Jul 2024 19:34:50 +0200
Message-Id: <20240716-thermal-v4-0-947b327e165c@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADqvlmYC/2XNTQ7CIBCG4as0rMUUGCx15T2MCwpDS9IfA02ja
 Xp3aTcYXX4TnpeVRAweI7kWKwm4+OinMQ04FcR0emyReps24SWHUjJF5w7DoHuq3IVL4EobV5P
 0+hnQ+ddRuj/S7nycp/A+wgvbr/+NhdGSVtYZLdCChObWDtr3ZzMNZG8sPLv0W3Y8ucYpIQGtZ
 Ii/TmRXMchOJKeU46BqdJWV327btg/VmqHEDgEAAA==
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 0/2] Add thermal management support for STi
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
OTRjNGFAZ21haWwuY29tCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyZ2Fs
bGFpc3BvdUBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIGluIHY0OgotIFsyLzJdIG9wdGltaXplIGRl
cGVuZGVuY2llcwotIFsyLzJdIGRvIG5vdCByZXR1cm4gZGV2bV8qIGV4aXQgY29kZQotIExpbmsg
dG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA3MTQtdGhlcm1hbC12My0wLTg4
ZjI0ODllZjdkNUBnbWFpbC5jb20KCkNoYW5nZXMgaW4gdjM6Ci0gRml4IHVubWV0IGRlcGVuZGVu
Y3kgaW4gWzIvMl0KLSBSZW1vdmUgbm8gbW9yZSB1c2VkIHZhcmlhYmxlIGluIFsyLzJdCi0gUmVt
b3ZlIGFscmVhZHkgbWVyZ2VkIHBhdGNoIGluIHNvYyB0cmVlCi0gTGluayB0byB2MjogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDYyNS10aGVybWFsLXYyLTAtYmY4MzU0ZWQ1MWVlQGdt
YWlsLmNvbQoKQ2hhbmdlcyBpbiB2MjoKLSBBZGQgUGF0cmljZSdzIFItYgotIEVkaXQgcGF0Y2gg
WzIvM10gdG8gcmVtb3ZlIHVudXNlZCBzdHJ1Y3QKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjQwNTE4LXRoZXJtYWwtdjEtMC03ZGZjYTNlZDQ1NGJAZ21haWwuY29t
CgotLS0KUmFwaGFlbCBHYWxsYWlzLVBvdSAoMik6CiAgICAgIHRoZXJtYWw6IHN0OiBzd2l0Y2gg
ZnJvbSBDT05GSUdfUE1fU0xFRVAgZ3VhcmRzIHRvIHBtX3NsZWVwX3B0cigpCiAgICAgIHRoZXJt
YWw6IHN0aTogZGVwZW5kIG9uIFRIRVJNQUxfT0Ygc3Vic3lzdGVtCgogZHJpdmVycy90aGVybWFs
L0tjb25maWcgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy90aGVybWFsL3N0L3N0X3Ro
ZXJtYWwuYyAgICAgICAgfCAzMiArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJp
dmVycy90aGVybWFsL3N0L3N0X3RoZXJtYWxfbWVtbWFwLmMgfCAgMiArLQogZHJpdmVycy90aGVy
bWFsL3N0L3N0bV90aGVybWFsLmMgICAgICAgfCAgOCArKystLS0tLQogNCBmaWxlcyBjaGFuZ2Vk
LCAxNyBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiA0ZjQw
YmU2MWFmOTlhNjdkNTU4MGMxNDQ4YWNkOWI3NGMwMzc2Mzg5CmNoYW5nZS1pZDogMjAyNDA1MTgt
dGhlcm1hbC04ZjYyNTQyOGFjZjkKCkJlc3QgcmVnYXJkcywKLS0gClJhcGhhZWwgR2FsbGFpcy1Q
b3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
