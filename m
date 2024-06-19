Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 397F490E2D4
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 07:47:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDA58C71282;
	Wed, 19 Jun 2024 05:47:42 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51A52C5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 05:47:35 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso79746371fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 22:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718776054; x=1719380854;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=b+kcrBGBf3/GydIe+LcjfY0IvCfWEER0PGXVlE1muRc=;
 b=KNiRw3ZYnfs0I+lztd15zmzOuaWgLRThEq33Lh/aH9XAcdy+Emy/77hx4dx5FWGee3
 4dN+Ps0p/nD6Giun0NASmIpU1KbT3fzglwOqQ+AoJoWsR+d6mYKjIVeVYy25IT8hbltk
 aE064+bDBiZYi+pCLHl4dQRvXum2895NuYKjNtHNboR4TA5IzwUhHJ5GuAycGS26vJeV
 DFb+TdzeBjrOGQI6V8Jv5HS5CQbo9nIOqoYL6V25LG53O0tSMMQt5v7ZEHM4ZpPm/ri4
 6ciltYISnD2rpWrjKVRIc+7D1Arvv8snlocbj8ggjvdwZ3I/i8IS4EK4AYCymR17xsVL
 GZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718776054; x=1719380854;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b+kcrBGBf3/GydIe+LcjfY0IvCfWEER0PGXVlE1muRc=;
 b=b07sK4MoBspTjzkKWrXEWDy4Gv9XdtFe/S8T0/ojz82ogAC6oyiNoWrPW0dBOS2V3Q
 dJ6iAtc6yHfiqi14fHI8B0A4xyIu9JvDd0kdm6ju3N4S+F/OsjYLkH+WzDlCgwYXhGT6
 0C3yEuBFMJbeyTSqt+anlBNcbPxDJ2sItla5QygkbDtaLofbi+Mm+hAywe65UkC5U+WN
 Xhj5fOv4oOODZJF2CeALQV8KEUdz0Vye2YEY/gtDYe1BGBCjnX7M/D9rQXMg7wgRN0Uj
 fQaSU72o4T6Rs1ZTtJHYh/owQWP+4dcc7yQ68TwXvSyGpu3V1keLaHiE/cvxCnFJXs5V
 2U+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2SC4IDKJr+BFfsRMWzR/jY3m0O4Qt71SCKDw4hXqm4zryaNZCsK6ksWhCxLmG7SK8EZO2tBBHWDMhbTCvN32tTGAQrYQo/SiHVGeLozrTk0PWielah+4O
X-Gm-Message-State: AOJu0YxXoqzkmJige07poo+6QesGe/yu2Dn4dK+8Oy0enOvR4AlsNYbH
 HKJrmsABMbSbas1dh3a2hhif/1s1YGOifmBjnsWJGYCULmloKDQK
X-Google-Smtp-Source: AGHT+IFf9QjDMZRxdXpeiL5O2FJdHK57x+se5bfjdMDBd3Pt/O+4ZdRb6IFP3txtqXmhYbvcKBOTpw==
X-Received: by 2002:a2e:2a01:0:b0:2ec:3f6c:ac37 with SMTP id
 38308e7fff4ca-2ec3f6cac9cmr3948431fa.48.1718776054200; 
 Tue, 18 Jun 2024 22:47:34 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42286eef9c1sm252656375e9.7.2024.06.18.22.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 22:47:33 -0700 (PDT)
Message-ID: <a0bd26a9e159e54f1b6effcdd45756ecfddf973f.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 19 Jun 2024 07:47:33 +0200
In-Reply-To: <20240618160836.945242-9-olivier.moysan@foss.st.com>
References: <20240618160836.945242-1-olivier.moysan@foss.st.com>
 <20240618160836.945242-9-olivier.moysan@foss.st.com>
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 8/8] iio: adc: stm32-dfsdm: add scaling
	support to dfsdm
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

T24gVHVlLCAyMDI0LTA2LTE4IGF0IDE4OjA4ICswMjAwLCBPbGl2aWVyIE1veXNhbiB3cm90ZToK
PiBBZGQgc2NhbGluZyBzdXBwb3J0IHRvIFNUTTMyIERGU0RNLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE9saXZpZXIgTW95c2FuIDxvbGl2aWVyLm1veXNhbkBmb3NzLnN0LmNvbT4KPiAtLS0KCkp1c3Qg
c29tZSBnZW5lcmFsIGNvbW1lbnRzLi4uIAoKQWNrZWQtYnk6IE51bm8gU2EgPG51bm8uc2FAYW5h
bG9nLmNvbT4KCj4gwqBkcml2ZXJzL2lpby9hZGMvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAxICsKPiDCoGRyaXZlcnMvaWlvL2FkYy9zdG0zMi1kZnNkbS1hZGMuYyB8IDk0ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgOTIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRj
L0tjb25maWcgYi9kcml2ZXJzL2lpby9hZGMvS2NvbmZpZwo+IGluZGV4IGYzZGZkYWE4MDY3OC4u
ODU4YWU4MTYxZmE0IDEwMDY0NAo+IAoKLi4uCgo+IEBAIC0xMzAxLDYgKzEzMzksOCBAQCBzdGF0
aWMgaW50IHN0bTMyX2Rmc2RtX3JlYWRfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCj4g
wqAJCXJldCA9IHN0bTMyX2Rmc2RtX3NpbmdsZV9jb252KGluZGlvX2RldiwgY2hhbiwgdmFsKTsK
PiDCoAkJaWYgKGFkYy0+aHdjKQo+IMKgCQkJaWlvX2h3X2NvbnN1bWVyX2Rpc2FibGUoYWRjLT5o
d2MpOwo+ICsJCWlmIChhZGMtPmJhY2tlbmRbaWR4XSkKPiArCQkJaWlvX2JhY2tlbmRfZGlzYWJs
ZSgmaW5kaW9fZGV2LT5kZXYsIGFkYy0+YmFja2VuZFtpZHhdKTsKPiDCoAkJaWYgKHJldCA8IDAp
IHsKPiDCoAkJCWRldl9lcnIoJmluZGlvX2Rldi0+ZGV2LAo+IMKgCQkJCSIlczogQ29udmVyc2lv
biBmYWlsZWQgKGNoYW5uZWwgJWQpXG4iLAo+IEBAIC0xMzIwLDYgKzEzNjAsNDUgQEAgc3RhdGlj
IGludCBzdG0zMl9kZnNkbV9yZWFkX3JhdyhzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAo+IMKg
CQkqdmFsID0gYWRjLT5zYW1wbGVfZnJlcTsKPiDCoAo+IMKgCQlyZXR1cm4gSUlPX1ZBTF9JTlQ7
Cj4gKwo+ICsJY2FzZSBJSU9fQ0hBTl9JTkZPX1NDQUxFOgo+ICsJCS8qCj4gKwkJICogU2NhbGUg
aXMgZXhwcmVzc2VkIGluIG1WLgo+ICsJCSAqIFdoZW4gZmFzdCBtb2RlIGlzIGRpc2FibGVkLCBh
Y3R1YWwgcmVzb2x1dGlvbiBtYXkgYmUgbG93ZXIKPiArCQkgKiB0aGFuIDJebiwgd2hlcmUgbj1y
ZWFsYml0cy0xLgo+ICsJCSAqIFRoaXMgbGVhZHMgdG8gdW5kZXJlc3RpbWF0aW5nIGlucHV0IHZv
bHRhZ2UuIFRvCj4gKwkJICogY29tcGVuc2F0ZSB0aGlzIGRldmlhdGlvbiwgdGhlIHZvbHRhZ2Ug
cmVmZXJlbmNlIGNhbiBiZQo+ICsJCSAqIGNvcnJlY3RlZCB3aXRoIGEgZmFjdG9yID0gcmVhbGJp
dHMgcmVzb2x1dGlvbiAvIGFjdHVhbCBtYXgKPiArCQkgKi8KPiArCQlpZiAoYWRjLT5iYWNrZW5k
W2lkeF0pIHsKPiArCQkJaWlvX2JhY2tlbmRfcmVhZF9yYXcoYWRjLT5iYWNrZW5kW2lkeF0sIHZh
bCwgdmFsMiwgbWFzayk7Cj4gKwoKVGhpcyBpcyBzb21ldGhpbmcgdGhhdCBJJ3ZlIGJlZW4gdGhp
bmtpbmcgYWJvdXQgc2luY2UgdGhlIGJlZ2lubmluZyBvZiBiYWNrZW5kcwpzdXBwb3J0LiBCYXNp
Y2FsbHkgaGF2aW5nIHRoZSAiY2F0Y2ggYWxsIiByZWFkX3JhdygpL3dyaXRlX3JhdygpIG9yIG1v
cmUgZGVkaWNhdGVkCmludGVyZmFjZXMuIEZvciBleGFtcGxlLCBpbiB5b3VyIHVzZWNhc2UgSSB0
aGluayBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgdG8gaGF2ZQpkZWRpY2F0ZWQgQVBJJ3MgbGlr
ZSBpaW9fYmFja2VuZF9yZWFkX3NjYWxlKCkgYW5kIGlpb19iYWNrZW5kX3JlYWRfb2Zmc2V0KCkg
YXMgeW91J3JlCmV4dGVuZGluZyB0aGF0IGZ1bmN0aW9uYWxpdHkuIENhbGxpbmcgaWlvX2JhY2tl
bmRfcmVhZF9yYXcoKSBzZWVtcyBhIGJpdCB3ZWlyZCB0byBtZS4KCk9UT0gsIGlpb19iYWNrZW5k
X3JlYWRfcmF3KCkgY291bGQgYmUgdXNlZnVsIGluIGNhc2VzIHdoZXJlIGZyb250ZW5kcyBjYWxs
Cmlpb19iYWNrZW5kX2V4dGVuZF9jaGFuX3NwZWMoKSBhbmQgbWF5IGdldCBzb21lIGZ1bmN0aW9u
YWxpdHkgdGhleSBhcmUgbm90IGF3YXJlIG9mLgpBbmQgc28sIGluIHRoZSBkZWZhdWx0OiBzdGF0
ZW1lbnQgdGhpcyAiY2F0Y2ggYWxsIiBBUEkgY291bGQgYmUgdXNlZC4KCkFueXdheXMsIHRoaXMg
YXJlIHJlYWxseSBtaW5vciAobGlrZWx5IHBlZGFudGljKSBkZXRhaWxzIGFuZCB5b3Uga2luZCBv
ZiBjYW1lIGZpcnN0CmFuZCBtYWRlIHRoZSBkZWNpc2lvbiBmb3IgbWUuIEFzIEkgZG9uJ3QgcmVh
bGx5IGhhdmUgc3Ryb25nIGZlZWxpbmdzIGFib3V0IGl0LCBJJ20KZmluZSB3aXRoIGl0IGFzLWlz
LgoKPiArCQkJKnZhbCA9IGRpdl91NjQoKHU2NCkqdmFsICogKHU2NClCSVQoREZTRE1fREFUQV9S
RVMgLSAxKSwKPiBtYXgpOwo+ICsJCQkqdmFsMiA9IGNoYW4tPnNjYW5fdHlwZS5yZWFsYml0czsK
PiArCQkJaWYgKGNoYW4tPmRpZmZlcmVudGlhbCkKPiArCQkJCSp2YWwgKj0gMjsKPiArCQl9Cj4g
KwkJcmV0dXJuIElJT19WQUxfRlJBQ1RJT05BTF9MT0cyOwo+ICsKPiArCWNhc2UgSUlPX0NIQU5f
SU5GT19PRkZTRVQ6Cj4gKwkJLyoKPiArCQkgKiBERlNETSBvdXRwdXQgZGF0YSBhcmUgaW4gdGhl
IHJhbmdlIFstMl5uLDJebl0sCj4gKwkJICogd2l0aCBuPXJlYWxiaXRzLTEuCj4gKwkJICogLSBE
aWZmZXJlbnRpYWwgbW9kdWxhdG9yOgo+ICsJCSAqIE9mZnNldCBjb3JyZXNwb25kIHRvIFNEIG1v
ZHVsYXRvciBvZmZzZXQuCj4gKwkJICogLSBTaW5nbGUgZW5kZWQgbW9kdWxhdG9yOgo+ICsJCSAq
IElucHV0IGlzIGluIFswVixWcmVmXSByYW5nZSwgd2hlcmUgMFYgY29ycmVzcG9uZHMgdG8gLTJe
biwgYW5kCj4gVnJlZiB0byAyXm4uCj4gKwkJICogQWRkIDJebiB0byBvZmZzZXQuIChpLmUuIG1p
ZGRsZSBvZiBpbnB1dCByYW5nZSkKPiArCQkgKiBvZmZzZXQgPSBvZmZzZXQoc2QpICogdnJlZiAv
IHJlcyhzZCkgKiBtYXggLyB2cmVmLgo+ICsJCSAqLwo+ICsJCWlmIChhZGMtPmJhY2tlbmRbaWR4
XSkgewo+ICsJCQlpaW9fYmFja2VuZF9yZWFkX3JhdyhhZGMtPmJhY2tlbmRbaWR4XSwgdmFsLCB2
YWwyLCBtYXNrKTsKPiArCj4gKwkJCSp2YWwgPSBkaXZfdTY0KCh1NjQpbWF4ICogKnZhbCwgQklU
KCp2YWwyIC0gMSkpOwo+ICsJCQlpZiAoIWNoYW4tPmRpZmZlcmVudGlhbCkKPiArCQkJCSp2YWwg
Kz0gbWF4Owo+ICsJCX0KPiArCQlyZXR1cm4gSUlPX1ZBTF9JTlQ7Cj4gwqAJfQo+IMKgCj4gwqAJ
cmV0dXJuIC1FSU5WQUw7Cj4gQEAgLTE0NDksNyArMTUyOCwxNSBAQCBzdGF0aWMgaW50IHN0bTMy
X2Rmc2RtX2FkY19jaGFuX2luaXRfb25lKHN0cnVjdCBpaW9fZGV2Cj4gKmluZGlvX2Rldiwgc3Ry
dWN0IGlpb19jCj4gwqAJICogSUlPX0NIQU5fSU5GT19SQVc6IHVzZWQgdG8gY29tcHV0ZSByZWd1
bGFyIGNvbnZlcnNpb24KPiDCoAkgKiBJSU9fQ0hBTl9JTkZPX09WRVJTQU1QTElOR19SQVRJTzog
dXNlZCB0byBzZXQgb3ZlcnNhbXBsaW5nCj4gwqAJICovCj4gLQljaC0+aW5mb19tYXNrX3NlcGFy
YXRlID0gQklUKElJT19DSEFOX0lORk9fUkFXKTsKPiArCWlmIChjaGlsZCkgewo+ICsJCWNoLT5p
bmZvX21hc2tfc2VwYXJhdGUgPSBCSVQoSUlPX0NIQU5fSU5GT19SQVcpIHwKPiArCQkJCQlCSVQo
SUlPX0NIQU5fSU5GT19TQ0FMRSkgfAo+ICsJCQkJCUJJVChJSU9fQ0hBTl9JTkZPX09GRlNFVCk7
CgpOb3Qgc3VyZSBpZiB0aGUgYWJvdmUgU0NBTEUgYW5kIE9GRlNFVCBhcmUgc29sZWx5IHByb3Bl
cnRpZXMgaWYgdGhlIGJhY2tlbmQuIElmIHNvLAp5b3UgY291bGQgbWF5YmUgdXNlIGlpb19iYWNr
ZW5kX2V4dGVuZF9jaGFuX3NwZWMoKS4KCi0gTnVubyBTw6EKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
