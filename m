Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1598425FAF
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 10:41:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B50CAC9E800
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 08:41:38 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A66CCBD2F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 08:41:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f204so1291826wme.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=q7L1/sUPR8W9L8sXprMVyL5Z/bzVpXnH1aOKj/GG+/A=;
 b=n69/2+lx5ga5KpFONpiST2P4CX7PPHu2WceXSABiNdhAyiDvk8C+SCACxIwNaL2x9N
 cPJo848qpz6mgcUMpwNgiOvQfmiAyRBFmL+cP7i+cWKeP7HUW/lfrpQAYK4u1cFQn10z
 ojiLKlRLkE5cbhH9A7s2FMUtzFRxim2ipoXrvUa3DFtFqX8zQLSxkWtPlb7j4jj+kwBc
 SEKoopT21GfIZhHs7OBJHWXImJBXHqG9avaIOnHpT93VTAByAWbNVfMPVzprWMQTBcEK
 /Xl7dk+EW/rugC26Cm1IR+tnlktJj2mv1S2NfqKzpal8eQqC7E/YLGy54eGX/6C4+gMS
 577g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=q7L1/sUPR8W9L8sXprMVyL5Z/bzVpXnH1aOKj/GG+/A=;
 b=OuGYAm9wOs/1qs+buIjdDSBptlF3zwP1u0mcCRcgH/N9k7Xe/YgUcqDTJPJ1FfO90/
 FRPJPSxZolm19iAMWrVNTQ/Iw0G40+L8FXR1KmV4DpL44dswT1F22jQ2CkrsiC/7qDoT
 Ziugp4BYN9SwfrQ2KnMA7YKmYw3izMpaLiWcM9RGzGj8WnI6n793kFis715doHh3c6Dj
 PGlSHvf5xBjumW7wsZceq7sPwVzyrjPEf1YZRLTKK6n2WdyNlCGTQDDuE6ZkP3u5mHXu
 eiCHKgTgy9pBRhtHJ1eMKt+Y3Jor1oxXp/ugB1M1QUnR7rjfsxsNiNUCWKODlJ5JCDpC
 nbDw==
X-Gm-Message-State: APjAAAWQcYL9vkpMePbZwcyxK+GaOA6jrs+S21wUDTMNxiKBJazHv8Hy
 EjGlINxst7m6Ynb8bH7MxeIgEg==
X-Google-Smtp-Source: APXvYqymC4/6/Dt/5Im40Dr4o+wcxROcVrKiMvQ98uY3QS+nO3KOw2P2dBJz6PSyiQem8zGp3U2B9w==
X-Received: by 2002:a1c:a00a:: with SMTP id j10mr1164973wme.41.1558514496607; 
 Wed, 22 May 2019 01:41:36 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id j13sm21086795wru.78.2019.05.22.01.41.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 01:41:35 -0700 (PDT)
Date: Wed, 22 May 2019 09:41:33 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <20190522084133.GF4574@dell>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell>
 <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "kbuild-all@01.org" <kbuild-all@01.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stmfx: Fix compile issue when
 CONFIG_OF_GPIO is not defined
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

T24gV2VkLCAyMiBNYXkgMjAxOSwgQW1lbGllIERFTEFVTkFZIHdyb3RlOgo+IE9uIDUvMjIvMTkg
Nzo0OCBBTSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gTW9uLCAyMCBNYXkgMjAxOSwgQW1lbGll
IERlbGF1bmF5IHdyb3RlOgo+ID4gCj4gPj4gV2hlbiBDT05GSUdfR1BJT19PRiBpcyBub3QgZGVm
aW5lZCwgc3RydWN0IGdwaW9fY2hpcCAnb2Zfbm9kZScgbWVtYmVyIGRvZXMKPiA+PiBub3QgZXhp
c3Q6Cj4gPj4gZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYzogSW4gZnVuY3Rpb24gJ3N0
bWZ4X3BpbmN0cmxfcHJvYmUnOgo+ID4+IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmM6
NjUyOjE3OiBlcnJvcjogJ3N0cnVjdCBncGlvX2NoaXAnIGhhcyBubyBtZW1iZXIgbmFtZWQgJ29m
X25vZGUnCj4gPj4gICAgICAgcGN0bC0+Z3Bpb19jaGlwLm9mX25vZGUgPSBucDsKPiA+Pgo+ID4+
IEZpeGVzOiAxNDkwZDlmODQxYjEgKCJwaW5jdHJsOiBBZGQgU1RNRlggR1BJTyBleHBhbmRlciBQ
aW5jdHJsL0dQSU8gZHJpdmVyIikKPiA+PiBSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQW1lbGllIERlbGF1bmF5IDxhbWVs
aWUuZGVsYXVuYXlAc3QuY29tPgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9waW5jdHJsL3BpbmN0
cmwtc3RtZnguYyB8IDIgKysKPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
PiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jIGIv
ZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYwo+ID4+IGluZGV4IGViYTg3MmMuLmJiNjRh
YTAgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYwo+ID4+
ICsrKyBiL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMKPiA+PiBAQCAtNjQ4LDcgKzY0
OCw5IEBAIHN0YXRpYyBpbnQgc3RtZnhfcGluY3RybF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ID4+ICAgCXBjdGwtPmdwaW9fY2hpcC5iYXNlID0gLTE7Cj4gPj4gICAJcGN0
bC0+Z3Bpb19jaGlwLm5ncGlvID0gcGN0bC0+cGN0bF9kZXNjLm5waW5zOwo+ID4+ICAgCXBjdGwt
PmdwaW9fY2hpcC5jYW5fc2xlZXAgPSB0cnVlOwo+ID4+ICsjaWZkZWYgQ09ORklHX09GX0dQSU8K
PiA+PiAgIAlwY3RsLT5ncGlvX2NoaXAub2Zfbm9kZSA9IG5wOwo+ID4+ICsjZW5kaWYKPiA+IAo+
ID4gVGhpcyBpcyBwcmV0dHkgdWdseS4gIFdpbGwgU1RNRlggZXZlciBiZSB1c2VkIHdpdGhvdXQg
T0Ygc3VwcG9ydD8gIElmCj4gPiBub3QsIGl0IG1pZ2h0IGJlIGJldHRlciB0byBwbGFjZSB0aGlz
IHJlc3RyaWN0aW9uIG9uIHRoZSBkcml2ZXIgYXMgYQo+ID4gd2hvbGUuCj4gPiAKPiA+IEluY2lk
ZW50YWxseSwgd2h5IGlzIHRoaXMgYmxhbmtlZCBvdXQgaW4gdGhlIHN0cnVjdHVyZSBkZWZpbml0
aW9uPwo+ID4gRXZlbiAnc3RydWN0IGRldmljZScgZG9lc24ndCBkbyB0aGlzLgo+ID4gCj4gY29u
ZmlnIFBJTkNUUkxfU1RNRlgKPiAJdHJpc3RhdGUgIlNUTWljcm9lbGVjdHJvbmljcyBTVE1GWCBH
UElPIGV4cGFuZGVyIHBpbmN0cmwgZHJpdmVyIgo+IAlkZXBlbmRzIG9uIEkyQwo+IAlkZXBlbmRz
IG9uIE9GIHx8IENPTVBJTEVfVEVTVAo+IAlzZWxlY3QgR0VORVJJQ19QSU5DT05GCj4gCXNlbGVj
dCBHUElPTElCX0lSUUNISVAKPiAJc2VsZWN0IE1GRF9TVE1GWAo+IAo+IFRoZSBpc3N1ZSBpcyBk
dWUgdG8gQ09NUElMRV9URVNUOiB3b3VsZCAiZGVwZW5kcyBvbiBPRiB8fCAoT0YgJiYgCj4gQ09N
UElMRV9URVNUKSIgYmUgYmV0dGVyID8KCkxpbnVzIHdvdWxkIGJlIGluIGEgYmV0dGVyIHBvc2l0
aW9uIHRvIHJlc3BvbmQsIGJ1dCBmcm9tIHdoYXQgSSBjYW4Kc2VlLCBtYXliZToKCiAgZGVwZW5k
cyBvbiBPRiB8fCAoT0ZfR1BJTyAmJiBDT01QSUxFX1RFU1QpCgpBbHRob3VnaCwgSSdtIHVuc3Vy
ZSB3aHkgb3RoZXIgQ09NUElMRV9URVNUcyBoYXZlbid0IGhpZ2hsaWdodGVkIHRoaXMKaXNzdWUu
ICBQZXJoYXBzIGJlY2F1c2UgdGhleSBoYXZlIGFsbCBiZWVuIGxvY2tlZCBkb3duIHRvIGEgcGFy
dGljdWxhcgphcmNoOgoKJCBncmVwIENPTVBJTEVfVEVTVCAtLSBkcml2ZXJzL3BpbmN0cmwvS2Nv
bmZpZyAKCWJvb2wgIlN1cHBvcnQgcGluIG11bHRpcGxleGluZyBjb250cm9sbGVycyIgaWYgQ09N
UElMRV9URVNUCglib29sICJTdXBwb3J0IHBpbiBjb25maWd1cmF0aW9uIGNvbnRyb2xsZXJzIiBp
ZiBDT01QSUxFX1RFU1QKCWRlcGVuZHMgb24gT0YgJiYgKEFSQ0hfREFWSU5DSV9EQTg1MCB8fCBD
T01QSUxFX1RFU1QpCglkZXBlbmRzIG9uIE9GICYmIChBUkNIX0RJR0lDT0xPUiB8fCBDT01QSUxF
X1RFU1QpCglkZXBlbmRzIG9uIE9GICYmIChBUkNIX0xQQzE4WFggfHwgQ09NUElMRV9URVNUKQoJ
ZGVwZW5kcyBvbiBBUkNIX1I3UzcyMTAwIHx8IENPTVBJTEVfVEVTVAoJZGVwZW5kcyBvbiBBUkNI
X1I3UzkyMTAgfHwgQ09NUElMRV9URVNUCglkZXBlbmRzIG9uIEFSQ0hfUlpOMSB8fCBDT01QSUxF
X1RFU1QKCWRlcGVuZHMgb24gTUlQUyB8fCBDT01QSUxFX1RFU1QKCldoYXQgYWJvdXQgYWRkaW5n
IHRoaXMgdG8geW91ciBLY29uZmlnIGVudHJ5OgoKICBzZWxlY3QgT0ZfR1BJTwoKPiA+PiAgIAlw
Y3RsLT5ncGlvX2NoaXAubmVlZF92YWxpZF9tYXNrID0gdHJ1ZTsKPiA+PiAgIAo+ID4+ICAgCXJl
dCA9IGRldm1fZ3Bpb2NoaXBfYWRkX2RhdGEocGN0bC0+ZGV2LCAmcGN0bC0+Z3Bpb19jaGlwLCBw
Y3RsKTsKPiA+IAoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVj
aG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
