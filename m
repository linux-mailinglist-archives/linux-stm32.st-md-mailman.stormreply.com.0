Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B951B159
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 09:43:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C425C5B642
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 07:43:33 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E546EC5B641
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 07:43:31 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f204so7220552wme.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 00:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=2SVkcixuV+vIKx8xDNZuyAT9UK0fzjYF/b5ce8pCl+U=;
 b=LvnhpyUOg/fe+RLGQXLz1XqoioBuGPsaZYetsZRYzhCP7PHiNcJAXKVPD3pg02fLCn
 H/TUqrAnssQmBiq4xA5XnuFUu01cp9MB7+7fYw/Ai+FxQbcMCexvAVfnVbmVNJQttTUe
 ael2fjcPqteB/83JAJjEIkEUBnerHvAhdN/+QJUjYVFX5ljyUuCsBNmEMr6ExStjRXaX
 jwUs9obpnSHdBZ8XrLQZJAOYwhEHxDPcEgEvVzlf0O+s8tGzhT3UXVum2YXsOTzhT3dv
 6q9FuQ3Vibk3KNcBC1FpBC3kc41XXNX/AB62vxLCAizVrIjoa9ciUMgs4enwYft749hd
 5qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2SVkcixuV+vIKx8xDNZuyAT9UK0fzjYF/b5ce8pCl+U=;
 b=lNF/nQu6iiYZQoRIYLDD75His0W7HeiS07wQHKD7qnJ9X8BC8Sgvjsrrc9FAfa+2Zv
 PSA4Ou/muN/ZDAjMuaPRZG/wbNuO8yT0Pjigabn4M/aokwBkxRT6tZDKk+phTswhTUyV
 j46FiCzT6ILXWv9wxQbY6FA4bR19oxcAUM1tDDY5n2dRhQBSbl5nKDIeEvqOghkI78oK
 lw3JmI7Ls6j2h63bVuGAfuqWceLVrAjKOR/X540YxJD2ZRlBn6bXsNYZ37my28DG5Oij
 IEaVn1PWoYVu+gcxlbrVqzo4PsdvdQBguUBT6avPbijahjgc/0PS5yqU+qyePG+8wtSq
 CUWw==
X-Gm-Message-State: APjAAAUXlW+A7KMANsq1+oiEGFtSrJoRrHzltXMEtcMKkW6gfPIGHLoH
 KkjgSZ5S3isKFWmFlOD/mNMZPw==
X-Google-Smtp-Source: APXvYqwp8nAXWcx1osFAjj9b+GA8DgpLgKaUzmyU2T2zcrbCMz9vA5t8VV7tfWYcz6KGhz3E6C8uYw==
X-Received: by 2002:a05:600c:247:: with SMTP id
 7mr15179643wmj.31.1557733411492; 
 Mon, 13 May 2019 00:43:31 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id 24sm3859594wmo.3.2019.05.13.00.43.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 00:43:30 -0700 (PDT)
Date: Mon, 13 May 2019 08:43:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20190513074329.GJ4319@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <20190510072314.GC7321@dell> <20190510151556.GA4319@dell>
 <20190510151912.GB4319@dell> <20190513074237.GI4319@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513074237.GI4319@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [GIT PULL v3] Immutable branch between MFD and
 Pinctrl due for the v5.2 merge window
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

T24gTW9uLCAxMyBNYXkgMjAxOSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBFbmpveSEKClNob3VsZCBo
YXZlIHNhaWQ6IG5vdyBjb250YWlucyBmaXhlcyBmb3IgcmVwb3J0ZWQgU21hdGNoIHdhcm5pbmdz
LgoKPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGU5M2M5Yzk5YTYyOWM2MTgz
N2Q1YTdmYzIxMjBjZDJiNmM3MGRiZGQ6Cj4gCj4gICBMaW51eCA1LjEgKDIwMTktMDUtMDUgMTc6
NDI6NTggLTA3MDApCj4gCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
Cj4gCj4gICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGVl
L21mZC5naXQgdGFncy9pYi1tZmQtcGluY3RybC12NS4yLTIKPiAKPiBmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gZDE3ZWQ3OTdiOGZkNWM4NzY1Y2Q5NTlhYzQ0YWFhMmYwOTBmNWE4OToK
PiAKPiAgIHBpbmN0cmw6IHN0bWZ4OiBGaXggJ3dhcm46IGJpdHdpc2UgQU5EIGNvbmRpdGlvbiBp
cyBmYWxzZSBoZXJlJyAoMjAxOS0wNS0xMyAwODoyODoyNiArMDEwMCkKPiAKPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
SW1tdXRhYmxlIGJyYW5jaCBiZXR3ZWVuIE1GRCBhbmQgUGluY3RybCBkdWUgZm9yIHRoZSB2NS4y
IG1lcmdlIHdpbmRvdwo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBBbWVsaWUgRGVsYXVuYXkgKDUpOgo+ICAgICAg
IGR0LWJpbmRpbmdzOiBtZmQ6IEFkZCBTVCBNdWx0aS1GdW5jdGlvbiBlWHBhbmRlciAoU1RNRlgp
IGNvcmUgYmluZGluZ3MKPiAgICAgICBtZmQ6IEFkZCBTVCBNdWx0aS1GdW5jdGlvbiBlWHBhbmRl
ciAoU1RNRlgpIGNvcmUgZHJpdmVyCj4gICAgICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IGRvY3Vt
ZW50IHRoZSBTVE1GWCBwaW5jdHJsIGJpbmRpbmdzCj4gICAgICAgcGluY3RybDogQWRkIFNUTUZY
IEdQSU8gZXhwYW5kZXIgUGluY3RybC9HUElPIGRyaXZlcgo+ICAgICAgIHBpbmN0cmw6IEtjb25m
aWc6IEZpeCBTVE1GWCBHUElPIGV4cGFuZGVyIFBpbmN0cmwvR1BJTyBkcml2ZXIgZGVwZW5kZW5j
aWVzCj4gCj4gTGVlIEpvbmVzICgyKToKPiAgICAgICBwaW5jdHJsOiBzdG1meDogRml4ICd3YXJu
OiB1bnNpZ25lZCA8VkFSPiBpcyBuZXZlciBsZXNzIHRoYW4gemVybycKPiAgICAgICBwaW5jdHJs
OiBzdG1meDogRml4ICd3YXJuOiBiaXR3aXNlIEFORCBjb25kaXRpb24gaXMgZmFsc2UgaGVyZScK
PiAKPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdG1meC50eHQgICAg
fCAgMjggKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtc3RtZngu
dHh0ICB8IDExNiArKysKPiAgZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMTMgKwo+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL21mZC9zdG1meC5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDU0NSArKysrKysrKysrKysrKwo+ICBkcml2ZXJzL3Bp
bmN0cmwvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNCArCj4gIGRyaXZl
cnMvcGluY3RybC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAg
ZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYyAgICAgICAgICAgICAgICAgICAgfCA4MTkg
KysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvbWZkL3N0bWZ4LmggICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTIzICsrKysKPiAgOSBmaWxlcyBjaGFuZ2VkLCAxNjYwIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3RtZngudHh0Cj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLXN0
bWZ4LnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvc3RtZnguYwo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYwo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvc3RtZnguaAo+IAoKLS0gCkxlZSBKb25lcyBb
5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIg
T3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29r
IHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
