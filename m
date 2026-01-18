Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D508D39A72
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Jan 2026 23:19:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 405ABC555BE;
	Sun, 18 Jan 2026 22:19:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79FA7C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Jan 2026 22:19:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 129A6443D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Jan 2026 22:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BA9C2BC9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Jan 2026 22:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768774761;
 bh=GitHHN55bP3Z4V21wbsged0zJmuhu+nzwlOmja3RnZg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P+PbVGY6wyQ+DXIVvI6TnoL2/Fg5DPML01L50fh/oVt62XxZyVY2bfGpVdJ0zZ7rH
 fSP8gd0yNjZ5OD9ile+eKD+e32roRN8JwXDZ25d0Bwr3YgVgS4YRwm4dcZQtH5S8E7
 fFwJ0maQDfFuuIYHnycbvfZKlQjqbkeZFnk20iozJy3Ce5U22yyv/chpdsT722NjsQ
 ScZKB/Kkyr52Y+2QLHaHvELf0iDvEISiE0xN2aiUpSL3fTAecYngTD5kIITB0uL0BB
 rkRuRncqJkbquctqy1qNh6BQy6X7/y5v+6gV8MKFYiwbanR1GZ6mQ0XgL8+uG4Cr6o
 dTp2ibrkvdxow==
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-6446d7a8eadso3217324d50.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Jan 2026 14:19:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX0mDCP6uCuF+iLJR5AzfZhGvKGtIv+qQEKDQmr9bsfAM15LzuYBYS6g5YtTMAdXvkqJZLWcfnXYwfmVQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzowP5EOuENPPksQMcvKYh91ShsmC/UPQxzux/TO/yK+YmVx/Vx
 c/W/X0DhA+IWi8eO/Hq2YX7vDYEKWJReg9BF7lq5OlSSewlo+dAR4ueqSUvYki6jk5afErD/Uph
 FSMKiaLu9D2CeK4VjaJEpfB2Hx6+KD3c=
X-Received: by 2002:a05:690e:1349:b0:640:caa5:57be with SMTP id
 956f58d0204a3-64916499c54mr7608440d50.28.1768774761075; Sun, 18 Jan 2026
 14:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
 <20260114-debug_bus-v2-11-5475c7841569@foss.st.com>
In-Reply-To: <20260114-debug_bus-v2-11-5475c7841569@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 18 Jan 2026 23:19:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmW5_xDnA9UtKynaSzdM8aC439sB_n6suFmLY1TJ0cYbg@mail.gmail.com>
X-Gm-Features: AZwV_QgYRBdpelcux3ZwYKaetoDVqJ1ncGRc8cQV81PLPvRQ_gfit3YePhm3xx0
Message-ID: <CAD++jLmW5_xDnA9UtKynaSzdM8aC439sB_n6suFmLY1TJ0cYbg@mail.gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, jens.wiklander@linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 11/11] pinctrl: stm32: add firewall
 checks before probing the HDP driver
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

SGkgR2F0aWVuLAoKdGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gV2VkLCBKYW4gMTQsIDIwMjYg
YXQgMTE6MzHigK9BTSBHYXRpZW4gQ2hldmFsbGllcgo8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5z
dC5jb20+IHdyb3RlOgoKPiBCZWNhdXNlIHRoZSBIRFAgcGVyaXBoZXJhbCBib3RoIGRlcGVuZHMg
b24gZGVidWcgYW5kIGZpcmV3YWxsCj4gY29uZmlndXJhdGlvbiwgd2hlbiBDT05GSUdfU1RNMzJf
RklSRVdBTEwgaXMgcHJlc2VudCwgdXNlIHRoZQo+IHN0bTMyIGZpcmV3YWxsIGZyYW1ld29yayB0
byBiZSBhYmxlIHRvIGNoZWNrIHRoZXNlIGNvbmZpZ3VyYXRpb24gYWdhaW5zdAo+IHRoZSByZWxl
dmFudCBjb250cm9sbGVycy4KPgo+IFNpZ25lZC1vZmYtYnk6IEdhdGllbiBDaGV2YWxsaWVyIDxn
YXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4KKC4uLikKPiArI2luY2x1ZGUgPGxpbnV4L2J1
cy9zdG0zMl9maXJld2FsbF9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+ICAj
aW5jbHVkZSA8bGludXgvZ3Bpby9kcml2ZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2dwaW8vZ2Vu
ZXJpYy5oPgo+IEBAIC02MDUsMTAgKzYwNiw1MCBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBz
dG0zMl9oZHBfb2ZfbWF0Y2gpOwo+ICBzdGF0aWMgaW50IHN0bTMyX2hkcF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgZ3Bpb19nZW5lcmlj
X2NoaXBfY29uZmlnIGNvbmZpZzsKPiArICAgICAgIHN0cnVjdCBzdG0zMl9maXJld2FsbCAqZmly
ZXdhbGwgPSBOVUxMOwo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsK
PiAgICAgICAgIHN0cnVjdCBzdG0zMl9oZHAgKmhkcDsKPiArICAgICAgIGludCBuYl9maXJld2Fs
bDsKPiAgICAgICAgIHU4IHZlcnNpb247Cj4gICAgICAgICBpbnQgZXJyOwo+ICsgICAgICAgaW50
IGk7Cj4gKwo+ICsgICAgICAgbmJfZmlyZXdhbGwgPSBvZl9jb3VudF9waGFuZGxlX3dpdGhfYXJn
cyhwZGV2LT5kZXYub2Zfbm9kZSwgImFjY2Vzcy1jb250cm9sbGVycyIsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIjYWNjZXNzLWNvbnRyb2xsZXIt
Y2VsbHMiKTsKPiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19TVE0zMl9GSVJFV0FMTCkg
JiYgbmJfZmlyZXdhbGwgIT0gLUVOT0VOVCkgewo+ICsgICAgICAgICAgICAgICBpZiAobmJfZmly
ZXdhbGwgPD0gMCkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAr
Cj4gKyAgICAgICAgICAgICAgIGZpcmV3YWxsID0gZGV2bV9rY2FsbG9jKGRldiwgbmJfZmlyZXdh
bGwsIHNpemVvZigqZmlyZXdhbGwpLCBHRlBfS0VSTkVMKTsKPiArICAgICAgICAgICAgICAgaWYg
KCFmaXJld2FsbCkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiAr
Cj4gKyAgICAgICAgICAgICAgIC8qIEdldCBzdG0zMiBmaXJld2FsbCBpbmZvcm1hdGlvbiAqLwo+
ICsgICAgICAgICAgICAgICBlcnIgPSBzdG0zMl9maXJld2FsbF9nZXRfZmlyZXdhbGwoZGV2LT5v
Zl9ub2RlLCBmaXJld2FsbCwgbmJfZmlyZXdhbGwpOwo+ICsgICAgICAgICAgICAgICBpZiAoZXJy
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgZXJy
LCAiRmFpbGVkIHRvIGdldCBmaXJld2FsbCBjb250cm9sbGVyXG4iKTsKPiArCj4gKyAgICAgICAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBuYl9maXJld2FsbDsgaSsrKSB7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZXJyID0gc3RtMzJfZmlyZXdhbGxfZ3JhbnRfYWNjZXNzX2J5X2lkKGZpcmV3
YWxsICsgaSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZmlyZXdhbGxbaV0uZmlyZXdhbGxfaWQpOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChlcnIpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHdoaWxlIChpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUz
MiBpZDsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGktLTsK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWQgPSBmaXJld2FsbFtp
XS5maXJld2FsbF9pZDsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RtMzJfZmlyZXdhbGxfcmVsZWFzZV9hY2Nlc3NfYnlfaWQoZmlyZXdhbGwgKyBpLCBpZCk7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoZXJyID09IC1FQUNDRVMpIHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGV2X2luZm8oZGV2LCAiTm8gZmlyZXdhbGwgYWNjZXNzXG4iKTsK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBlcnIsICJFcnJvciBj
aGVja2luZyBmaXJld2FsbCBhY2Nlc3NcbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0K
PiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfQoKRG9lc24ndCB0aGlzIHdob2xlIHBpZWNl
IG9mIGNvZGUgbG9vayB2ZXJ5IGdlbmVyaWM/CgpQb2ludCBvdXQgdG8gbWUgaWYgc29tZXRoaW5n
IGlzIHBpbiBjb250cm9sLXNwZWNpZmljIGFib3V0IGl0PwoKQ2FuJ3Qgd2UganVzdCBhZGQgYSBo
ZWxwZXIgZnVuY3Rpb24gc3VjaCBhcwoKc3RtMzJfZmlyZXdhbGxfb2ZfY2hlY2tfYWNjZXNzKHN0
cnVjdCBkZXZpY2UgKmRldikKewogICAgc3RydWN0IHN0bTMyX2ZpcmV3YWxsICpmaXJld2FsbCA9
IE5VTEw7CiAgICBpbnQgbmJfZmlyZXdhbGw7CgogICAgbmJfZmlyZXdhbGwgPSBvZl9jb3VudF9w
aGFuZGxlX3dpdGhfYXJncyhwZGV2LT5kZXYub2Zfbm9kZSwKImFjY2Vzcy1jb250cm9sbGVycyIs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiI2FjY2Vzcy1jb250cm9s
bGVyLWNlbGxzIik7CiguLi4pCn0KClRoZW4gcGxhY2UgdGhlIHByb3RvdHlwZSBmb3IgdGhpcyBp
biA8bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsX2RldmljZS5oPi4KCkkgdGhpbmsgdGhpcyB3aWxs
IGJlIGhlbHBmdWwgZm9yIHRoZSBuZXh0IGRyaXZlciB0aGF0IG5lZWRzIHRvIGNoZWNrCmZpcmV3
YWxsIGFjY2VzcwpiZWZvcmUgY29udGludWluZy4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
