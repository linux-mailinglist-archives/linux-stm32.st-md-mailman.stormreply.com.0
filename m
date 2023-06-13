Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89072ECFA
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 22:32:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 142F3C6A61A;
	Tue, 13 Jun 2023 20:32:58 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 490FAC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 20:32:56 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-bc379e4c1cbso4358390276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 13:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686688375; x=1689280375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dvJUa63SYtpqln5w0oMr9sRT2OZaa51HeQdSCgfliM0=;
 b=ahUth5LJeQaubKUs26hW0k3imv9oTxzJURnn2OsEM8iaQhJzPzGNwBYsNzpjTXXavT
 P+0P8W/1a8sABIoBxuK0jSyuHrxmjNABaJ+VwgtLJTJpluK8p5iq1MSaPUIIgTi2Tkg2
 HOUkRiXc5tcU6fze3UCaO9E9iaVmk7LyGePmJLppFzJqlOPWu9sW6IvhiYbDRCLt92Ay
 Xy7dcwigL99F+6BC+mFBY0yeUXcaUbXZ91CfPlbBTM1SxK7m8FVyqgaGvqylcHkUjJeO
 Llp+nInmtJeKBTju/jdf2nEQwgNQFgYgjqluFcjKqa0kN2h/34OSH892Y00H+tz07sXH
 RB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686688375; x=1689280375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dvJUa63SYtpqln5w0oMr9sRT2OZaa51HeQdSCgfliM0=;
 b=dA60dQWfOhAu34eOM4p1uqk0G5s2lKwE2ejPH8f/2HkkG/qQ4yhBYaRHGjspcdWYds
 9F5hlvWZn1rxEd2xNMCRdLx9Ui208mtrq+jg1l4RsD9LlfPOH1Pzi5QBCYo+tfVrpZ2t
 tiqSsVl627maJFCnsfZ0x2mHHWcm8XTJHJlrhajrf2R6H8RXUth72ta8u5F6jFFTe05Y
 tQWL3oT3KEgYLrVRAfepPC6PSJFdlXeVGFSoR7s6OPRFDNj7pKtsiaFkwORyGOrGyNN6
 1rx5QQbh3F0ZmLevypPeUlVUlWNZd9toGDumkx4Wh7lsH5gPlmGqRYLmfzPiXHsHAC1T
 mBRA==
X-Gm-Message-State: AC+VfDzWeW4k5PjX1GFk3NRtI+6hO3xIAbtki2VlDQEag7FY7pTNdLhr
 tqt37l6nM5/1lWjrvhmoV4C4DxLvbzm4M8PGspcf6A==
X-Google-Smtp-Source: ACHHUZ4Q0zl75kxgo29sxb7h3KaImD0S7jPsix+2MlhAl2bVKHBTEAWt8S40lqMUM8ZoqbDP+nyyA+qYJtQErDEhFc4=
X-Received: by 2002:a25:b096:0:b0:bac:69be:9494 with SMTP id
 f22-20020a25b096000000b00bac69be9494mr266028ybj.36.1686688375119; Tue, 13 Jun
 2023 13:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
 <20230405-pl180-busydetect-fix-v3-10-cd3d5925ae64@linaro.org>
 <CAPDyKFqxvNxFqLdpj15Gz+zDNT04YzxEAh-svKvRuaM52dCV3g@mail.gmail.com>
In-Reply-To: <CAPDyKFqxvNxFqLdpj15Gz+zDNT04YzxEAh-svKvRuaM52dCV3g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jun 2023 22:32:43 +0200
Message-ID: <CACRpkdbg5UXnU=WcQa2HoGH54UK-C8+vU8t+7iLChvd__iJiMg@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 10/10] mmc: mmci: Add busydetect timeout
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

T24gVHVlLCBKdW4gMTMsIDIwMjMgYXQgMjowOOKAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKCj4gVHlwaWNhbGx5LCB0aGUgY21kLT5idXN5X3RpbWVvdXQg
Y29udGFpbnMgdGhlIGN1cnJlbnQgdmFsdWUgb2YgdGhlCj4gdGltZW91dCB0aGF0IHNob3VsZCBi
ZSB1c2VkIGZvciB0aGUgY29tbWFuZHMgdGhhdCBoYXZlIHRoZSBmbGFncwo+IE1NQ19SU1BfQlVT
WSBzZXQgZm9yIGl0Lgo+Cj4gVGhlIHN0bSB2YXJpYW50IGFscmVhZHkgdXNlcyBjbWQtPmJ1c3lf
dGltZW91dCwgYnV0IGFsc28gYXNzaWducyBhCj4gZGVmYXVsdCB0aW1lb3V0LCBqdXN0IHRvIG1h
a2Ugc3VyZSBpZiB0aGUgY29yZSBoYXMgZmFpbGVkIHRvIHNldAo+IGNtZC0+YnVzeV90aW1lb3V0
IChpdCBzaG91bGRuJ3QgYnV0IHdobyBrbm93cykuCgpJIGdlbmVyYWxpemVkIHRoZSBTVE0zMiBz
b2x1dGlvbiB3aXRoIHRoZSBjb3JlLXNwZWNpZmllZCB0aW1lb3V0CmFuZCBkZWZhdWx0IGFuZCB1
c2VkIHRoYXQuCgpJZiB3ZSBrbm93IHRoZSBjb3JlIHdpbGwgYWx3YXlzIHByb3ZpZGUgY29ycmVj
dCB0aW1lb3V0cyB3ZSBzaG91bGQKcHJvYmFibHkgZGVsZXRlIGhhY2tzIGxpa2UgdGhpcyB0aG91
Z2ggKGJ1dCB0aGF0IHdvdWxkIGJlIGEgc2VwYXJhdGUKcGF0Y2gpLgoKPiA+ICtzdGF0aWMgdm9p
ZCBidXN5X3RpbWVvdXRfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gPiArewo+ID4g
KyAgICAgICBzdHJ1Y3QgbW1jaV9ob3N0ICpob3N0ID0KPiA+ICsgICAgICAgICAgICAgICBjb250
YWluZXJfb2Yod29yaywgc3RydWN0IG1tY2lfaG9zdCwgYnVzeV90aW1lb3V0X3dvcmsud29yayk7
Cj4gPiArICAgICAgIHUzMiBzdGF0dXM7Cj4gPiArCj4gPiArICAgICAgIGRldl9kYmcobW1jX2Rl
dihob3N0LT5tbWMpLCAidGltZW91dCB3YWl0aW5nIGZvciBidXN5IElSUVxuIik7Cj4gPiArICAg
ICAgIHN0YXR1cyA9IHJlYWRsKGhvc3QtPmJhc2UgKyBNTUNJU1RBVFVTKTsKPiA+ICsgICAgICAg
bW1jaV9jbWRfaXJxKGhvc3QsIGhvc3QtPmNtZCwgc3RhdHVzKTsKPgo+IFRoZXJlJ3Mgbm8gbG9j
a2luZyBoZXJlLiBJIGFzc3VtZSB0aGF0J3MgYmVjYXVzZSB3ZSBjYWxsCj4gY2FuY2VsX2RlbGF5
ZWRfd29ya19zeW5jKCkgZnJvbSBhbiBhdG9taWMgY29udGV4dCBhbmQgd2UgZG9uJ3Qgd2FudAo+
IHRoYXQgdG8gaGFuZy4KPgo+IEhvd2V2ZXIsIGNhbid0IHRoZSBjYWxsIHRvIG1tY2lfY21kX2ly
cSgpIHJhY2Ugd2l0aCBhIHByb3BlciBpcnEgYmVpbmcKPiBtYW5hZ2VkIGluIHBhcmFsbGVsPwoK
SXQgd2lsbCBub3QgYmUgYSBwcm9ibGVtIEFGQUlDOiB0aGUgTU1DSSBpcyB1c2luZyBsZXZlbCBJ
UlFzLCBtZWFuaW5nIGl0CndpbGwgaGFuZGxlIGFsbCBmbGFncyB0aGF0IGFyZSBzZXQgZm9yIGNv
bW1hbmQgb3IgZGF0YSBJUlFzIGJlZm9yZSBleGl0aW5nCnRoZSBJUlEgaGFuZGxlciwgdGhlIG9y
ZGVyIG9mIHRoZSBJUlEgaGFuZGxpbmcgaWYgc2V2ZXJhbCBmaXJlIGF0IHRoZSBzYW1lCnRpbWUg
aXMgYWN0dWFsbHkgZGVwZW5kZW50IG9uIHRoZSBvcmRlciB0aGUgSVJRIGZsYWdzIGFyZSBjaGVj
a2VkIGluIHRoZQpjb2RlLgoKV2hlbiB0aGUgaW50ZXJydXB0IGhhbmRsZXIgZXhpdHMsIGFsbCBJ
UlFzIHNob3VsZCBiZSBoYW5kbGVkIGFuZCB0aGUKcmVzcGVjdGl2ZSBJUlEgbGluZXMgYW5kIHRo
dXMgdGhlIElSUSBmcm9tIHRoZSBNTUNJIHNob3VsZCBiZQpkZS1hc3NlcnRlZC4KCkluIHRoaXMg
Y2FzZSwgb3VyIHByb2JsZW0gaXMgdGhhdCBhbiBpbnRlcnJ1cHQgaXMgbm90IGZpcmVkIGF0IGFs
bCwgYnV0IGlmCnRoZSBhY3R1YWwgSVJRICh0aGF0IHNob3VsZCBoYXZlIGJlZW4gZmlyZWQpIG9y
IGEgdG90YWxseSBkaWZmZXJlbnQgSVJRCihzdWNoIGFzIGFuIGVycm9yKSBpcyBmaXJlZCBhdCB0
aGUgc2FtZSB0aW1lIGRvZXNuJ3QgbWF0dGVyOiB0aGUgcGVuZGluZwpJUlFzIHdpbGwgYmUgaGFu
ZGxlZCwgYW5kIGlmIHRoZSB0aW1lciB0aGVuIGZpcmVzIGFuIGFkZGl0aW9uYWwgSVJRCnRoZSBJ
UlEgaGFuZGxlciB3aWxsIGNoZWNrIGlmIHRoZXJlIGFyZSBhbnkgSVJRcyB0byBoYW5kbGUgYW5k
IHRoZW4KY29uY2x1ZGUgdGhlcmUgaXNuJ3QgYW5kIHRoZW4ganVzdCByZXR1cm4uCgpBdCBsZWFz
dCB0aGUgd2F5IEkgcmVhZCBpdC4KCkkgbWFkZSBhIHY0LCBzZW5kaW5nIGl0IG91dCBzbyB5b3Ug
Y2FuIGNoZWNrIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
