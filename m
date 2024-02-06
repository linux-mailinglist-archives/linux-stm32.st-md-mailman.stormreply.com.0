Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDE084B153
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 10:33:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8837EC6907A;
	Tue,  6 Feb 2024 09:33:38 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6BB1C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 09:33:35 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6048313efb4so251767b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 01:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707212014; x=1707816814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wv8aVTQt1PkjH10jXoXAhUeu0btco/HHsLNCr4o/nTU=;
 b=oqAf4L7advci8ti90NoZlR2PR2GOP4A5fRiHhj8r+rzuOI125KV4JgDChaUCqxGKd4
 anJceA9Sd8MbZofTu9NTIH1wEqZwHVv47QV8U/lYo7+z8DBCDjX8B/7X4DEn9zk5XLRD
 gnAy7Lo0FTaZnMWs/JC9QMStXWyTPXVTfKFqs1JxqV5m3NUwteddyEYpGyaPhgig/9nT
 eISR5tSb9EfAfwTKIcRlV+igjdO1Je8hqR249yRvUc2JXhVJIu6zD/MjP0ukgsNSjN2y
 No3aiHMHnXQUEdxfFFg2ETObet7zznW1iOTyCmN1a6DC3tuPFO+q715nXsrj8jFeHV42
 sC5A==
X-Gm-Message-State: AOJu0Yyx7G6lUkH5ZKfHjSS8KZksECDESPcJB/5X7P6RsS9Ncq5k993X
 xoeKh8qUlNsFvNnoYLZ52XVR1UO43Zp5i0vgKvPitDZRTlSLvFKk7GEnQce+FNc=
X-Google-Smtp-Source: AGHT+IGf5ouEdHx6NqKafErEO7M79FbachW7O+1+iwk2U0OsrlyFqz37taHRtlnI4DpXO4KVcFh8Pw==
X-Received: by 2002:a81:9996:0:b0:5ff:7dd8:26cc with SMTP id
 q144-20020a819996000000b005ff7dd826ccmr1040565ywg.22.1707212014423; 
 Tue, 06 Feb 2024 01:33:34 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWoYIw231RvmkEeRyrDxpqUJwZtxaZiB/+uOz0SDjKCoHh1xjPdIf21nCmcYBLhsjdvJYzB+gpurL79bnsNowpwN8rm0PNCI3LpHTpNDF+QFQEinQEgOqM8
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 b76-20020a0dd94f000000b005f9673cb763sm403016ywe.126.2024.02.06.01.33.34
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:33:34 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dc6d9a8815fso5126535276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 01:33:34 -0800 (PST)
X-Received: by 2002:a5b:711:0:b0:dc6:4c9e:9e4d with SMTP id
 g17-20020a5b0711000000b00dc64c9e9e4dmr1100023ybq.20.1707212014034; Tue, 06
 Feb 2024 01:33:34 -0800 (PST)
MIME-Version: 1.0
References: <20240206071314.8721-1-liubo03@inspur.com>
In-Reply-To: <20240206071314.8721-1-liubo03@inspur.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Feb 2024 10:33:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
Message-ID: <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
To: Bo Liu <liubo03@inspur.com>
Cc: neil.armstrong@linaro.org, ckeepax@opensource.cirrus.com,
 support.opensource@diasemi.com, mazziesaccount@gmail.com,
 linux-kernel@vger.kernel.org, lee@kernel.org, rf@opensource.cirrus.com,
 linux-renesas-soc@vger.kernel.org, wens@csie.org,
 Mark Brown <broonie@kernel.org>, mcoquelin.stm32@gmail.com,
 patches@opensource.cirrus.com, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 marek.vasut+renesas@gmail.com
Subject: Re: [Linux-stm32] [PATCH 00/18] mfd: convert to use maple tree
	register cache
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

SGkgQm8sCgpDQyBicm9vbmllCgpUaGFua3MgZm9yIHlvdXIgc2VyaWVzIQoKT24gVHVlLCBGZWIg
NiwgMjAyNCBhdCA4OjE24oCvQU0gQm8gTGl1IDxsaXVibzAzQGluc3B1ci5jb20+IHdyb3RlOgo+
IFRoZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlIGlzIGJhc2VkIG9uIGEgbXVjaCBtb3JlIG1v
ZGVybiBkYXRhIHN0cnVjdHVyZQo+IHRoYW4gdGhlIHJidHJlZSBjYWNoZSBhbmQgbWFrZXMgb3B0
aW1pc2F0aW9uIGNob2ljZXMgd2hpY2ggYXJlIHByb2JhYmx5Cgpwcm9iYWJseT8KCj4gbW9yZSBh
cHByb3ByaWF0ZSBmb3IgbW9kZXJuIHN5c3RlbXMgdGhhbiB0aG9zZSBtYWRlIGJ5IHRoZSByYnRy
ZWUgY2FjaGUuCj4KPiBCbyBMaXUgKDE4KToKPiAgIG1mZDogYWMxMDA6IGNvbnZlcnQgdG8gdXNl
IG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAgIG1mZDogYXMzNzExOiBjb252ZXJ0IHRvIHVz
ZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBtZmQ6IGFzMzcyMjogY29udmVydCB0byB1
c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQo+ICAgbWZkOiBheHAyMHg6IGNvbnZlcnQgdG8g
dXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAgIG1mZDogYmNtNTkweHg6IGNvbnZlcnQg
dG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAgIG1mZDogYmQ5NTcxbXd2OiBjb252
ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBtZmQ6IGRpYWxvZzogY29u
dmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQo+ICAgbWZkOiBraGFkYXMtbWN1
OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBtZmQ6IGxvY2hu
YWdhci1pMmM6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAgIG1m
ZDogd29sZnNvbjogY29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQo+ICAg
bWZkOiByb2htOiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBt
ZmQ6IHJrOHh4OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBt
ZmQ6IHJuNXQ2MTg6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAg
IG1mZDogcnNtdV9pMmM6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUK
PiAgIG1mZDogc2k0NzZ4OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hl
Cj4gICBtZmQ6IHN0bWZ4OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hl
Cj4gICBtZmQ6IHN0cG1pYzE6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2Fj
aGUKPiAgIG1mZDogcmM1dDU4MzogY29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBj
YWNoZQoKSWYgYWxsIG9mIHRoaXMgaXMgdHJ1ZSwgaXMgdGhlcmUgYW55IHJlYXNvbiB0byBrZWVw
IFJFR0NBQ0hFX1JCVFJFRQphcm91bmQ/ICBJZiBub3QsIHBlcmhhcHMgUkVHQ0FDSEVfUkJUUkVF
IHNob3VsZCBiZSB0cmVhdGVkIGFzClJFR0NBQ0hFX01BUExFIGluIHRoZSByZWdtYXAgY29yZSBj
b2RlIGZpcnN0LCBmb2xsb3dlZCBieSBhIHNpbmdsZQp0cmVlLXdpZGUgcGF0Y2ggdG8gcmVwbGFj
ZSBSRUdDQUNIRV9SQlRSRUU/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0CgoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
