Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDC99E627D
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 01:51:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38B93C78036;
	Fri,  6 Dec 2024 00:51:17 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AC83C7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 00:51:15 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7b66a740de4so118313285a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2024 16:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733446274; x=1734051074;
 darn=st-md-mailman.stormreply.com; 
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78rE7sFM5hMSVUktXfM1DYZzRFvqYEeXK7x5OI2RSGM=;
 b=TXyb+050ckOSm5ArNswlZZ8H+76uZ/UYLyfmgNCqGk6ObFhxcU0GC+YCR6RizODRyt
 jbxkCz86yOuGNLsXhfMaKbTCsQufxiw+QxkxH15s3mjV82iMSGY6FRBUY8yGCzTpXNca
 1rF/obBJscIC9064jKBXj7GSZgg2Oi/mr94cXvz3dOnSU/kVCTVatRVBrvCr0NFIhFhn
 73eX5g414vFvTPtXVcHetrcs5BZJ0F0kwVYKsl3H5SLALwzNJpac1FW0mXMXLN+DMGL6
 FkNCz5XP0szz58Bv4XbZ/YWYQvGhOF4u3CYNMqiTiGzc+EIz+mbYtnddvDO52F/nG5zG
 R7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733446274; x=1734051074;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=78rE7sFM5hMSVUktXfM1DYZzRFvqYEeXK7x5OI2RSGM=;
 b=umtKVMEizzQ2vFZyOdHecPfnRBT+IqkADdN2wlmIUy4BeuSqsf5YYc7B3PUZbLdn2b
 BYrveaf+kAFF20benOAcxiI5kVSKMXzConiyzogxgMc7o99i9Zdyz+79Es9uefXKIhJ2
 Qjsv5ildwdgBb6hf/X8uTo5VR/11XyZrb3EGTA0CMWFWA7728c9/F6eXH+C6tU1TG+CA
 zkzD/nQ/rOD8VMPGeLRaiStHBSiWHr1z8CuD/5HESkJm/rCgE1Vfx+7otgcfe3S8pFjL
 wmJcpBLqr2J+TNXddIEHuhZJfoKuQAxUh33Rs/7/kuALSWPcKGnKX+mSKB48GbyFZ7wg
 kmkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtm8E3N5Zr0Mo3NiAxoMux/n7CWL6HJ76tKxr8r2HIcC/pSnXF8fGo0cnuGK6nfpKOU1KHoWvPIvHYfw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzdOfTJrWdBn9OOQuFDRVZcuGBU4lzqb7hxxHN1cjIa+z3lQvHT
 aBFiXsoOu3nGWN0v9IBEd4DXNZENhlDYkf2Aad9Dwmcr+KZk1M1K
X-Gm-Gg: ASbGncskv44g9U7s0jzSIOS0bZAlkCJVHNW5OiEKJyICOU2nXd/txubkXqcHjLePYsJ
 hKLwGFPOmsEKZUl+hoV3ppa3zK55OP9oJHsTUwZ68HKPZbTxFSuawSuXjwXH7uoQs/57ZfOMfd2
 GYp5FBEHXc3Wvmh4dZ6ajr5xcsJC21gu8ruT7agdxt65R0bBQ0fiIbA84ZJp4+skayVNSEYdpRP
 RgzteKbx84dwjcw6gPGlKFnCyZLoGmtvGJphjxDjQqgNMaE6yCf3MWzB369MA/kfoO38ZFiOZ0=
X-Google-Smtp-Source: AGHT+IF/sk9ZB235pUfB0O6hz42Upg4C3T7QSAhoiMqwmiLWKznlOnX/VWzkLXPVN06gb5l37ZaJIQ==
X-Received: by 2002:a05:6214:ac2:b0:6d8:d240:9f26 with SMTP id
 6a1803df08f44-6d8e713feb7mr22257846d6.16.1733446274340; 
 Thu, 05 Dec 2024 16:51:14 -0800 (PST)
Received: from smtpclient.apple ([2601:803:8180:ace0:901f:f4c2:743b:7118])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8dabfb438sm12583646d6.106.2024.12.05.16.51.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Dec 2024 16:51:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
From: Mingwei Zheng <zmw12306@gmail.com>
In-Reply-To: <geyicxufezkbu7cdvnbgnr2qeuwrn5ubz5ent3spk5biuozxrs@gsqx2chgiiot>
Date: Thu, 5 Dec 2024 19:51:00 -0500
Message-Id: <5778D1D6-9C2B-4456-9765-213120076C62@gmail.com>
References: <20241205051746.2465490-1-zmw12306@gmail.com>
 <geyicxufezkbu7cdvnbgnr2qeuwrn5ubz5ent3spk5biuozxrs@gsqx2chgiiot>
To: =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
Cc: linux-pwm@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, coquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32-lp: Add check for clk_enable()
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

Cgo+IE9uIERlYyA1LCAyMDI0LCBhdCAzOjM0IEFNLCBVd2UgS2xlaW5lLUvDtm5pZyA8dWtsZWlu
ZWtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4gT24gVGh1LCBEZWMgMDUsIDIwMjQgYXQgMTI6MTc6
NDZBTSAtMDUwMCwgTWluZ3dlaSBaaGVuZyB3cm90ZToKPj4gQWRkIGNoZWNrIGZvciB0aGUgcmV0
dXJuIHZhbHVlIG9mIGNsa19lbmFibGUoKSB0byBjYXRjaCB0aGUgcG90ZW50aWFsCj4+IGVycm9y
Lgo+IAo+IElzIHRoaXMgc29tZXRoaW5nIHRoYXQgeW91IGFjdHVhbGx5IGhpdCwgb3IganVzdCBh
IGphbml0b3JhbCBmaXggeW91Cj4gbm90aWNlZCB3aGlsZSBicm93c2luZyB0aGUgY29kZSAob3Ig
cmVhZGluZyBzb21lIGNoZWNrZXIgb3V0cHV0KT8KCldlIGRldGVjdGVkIHRoaXMgdGhyb3VnaCBz
dGF0aWMgYW5hbHlzaXMsIGluc3RlYWQgb2YgYWN0dWFsbHkgaGl0LgoKPiAKPj4gRml4ZXM6IGU3
MGE1NDBiNGUwMiAoInB3bTogQWRkIFNUTTMyIExQVGltZXIgUFdNIGRyaXZlciIpCj4+IFNpZ25l
ZC1vZmYtYnk6IE1pbmd3ZWkgWmhlbmcgPHptdzEyMzA2QGdtYWlsLmNvbT4KPj4gU2lnbmVkLW9m
Zi1ieTogSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5namlhbmdjb29sQGdtYWlsLmNvbT4KPj4gLS0t
Cj4+IGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jIHwgOCArKysrKystLQo+PiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMK
Pj4gaW5kZXggOTg5NzMxMjU2ZjUwLi40YWJlZjMwNDQxN2QgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvcHdtL3B3bS1zdG0zMi1scC5jCj4+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5j
Cj4+IEBAIC0xNjMsMTIgKzE2MywxNiBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9scF9nZXRfc3Rh
dGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLAo+PiB1bnNpZ25lZCBsb25nIHJhdGUgPSBjbGtfZ2V0
X3JhdGUocHJpdi0+Y2xrKTsKPj4gdTMyIHZhbCwgcHJlc2MsIHByZDsKPj4gdTY0IHRtcDsKPj4g
KyBpbnQgcmV0Owo+IAo+IFBsZWFzZSBtb3ZlIHRoaXMgdmFyaWFibGUgdG8gdGhlIGJsb2NrIHdo
ZXJlIGl0J3MgdXNlZC4gTm8gbmVlZCBmb3Igc3VjaAo+IGEgYmlnIHNjb3BlLgo+IAo+IE90aGVy
d2lzZSBsb29rcyBmaW5lLgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKVGhhbmsgeW91ISBXZSB3
aWxsIHN1Ym1pdCBhIHYyIHBhdGNoIGZvciB5b3UgdG8gcmV2aWV3IQoKQmVzdCwKTWluZ3dlaQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
