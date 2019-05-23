Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF4F278E0
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 11:09:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7531AC0B5F7
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 09:09:46 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8344FC0B5F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 09:09:45 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z19so2974574qtz.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 02:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZDRg3ieis6hoh/yJ9a80gOidWlG1G6Pw/YGxgRuSE94=;
 b=kA31TSrggwsJxxWDnJJPIOo3MgixNqwLlwlFlwOzYC28Qzv9rkp8BWwHIdODxR99Nt
 d7IFt6+f5xHBItXGp2Eu/3CYh18PpggLnYDWOPGEhC58NLAK8u/eOGkbZkra0hb+DjIW
 5fb8+ypRJRIiFczeHfu1xVkpxzf1gcGRUnImDzPZUWqkbSgL6KAMHL9W7a8Fu8M5DujO
 90V5srCCUOkBo351510PYMPxAxjqB4JtbYWAJ2PHaAarEBwCMnecaut6HWHq4qz/oqfM
 qo2HNtUzDfnS3OXjBi1JU+j+hPnA/OKdCeWoN/pvQm7TpUNlroxutZ/9RIUPko5fruIR
 BCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZDRg3ieis6hoh/yJ9a80gOidWlG1G6Pw/YGxgRuSE94=;
 b=H7ub6qTi0PqUgJ+aLyaPE5Hqq+0F+NM1EufP5mJ/6sycfc7OLY31zSgUVBUk4I13k8
 u50By1ideZljWTSkqdowvU0tk47uXsEHcLxF3Z9pjxrYmT7O+PMhR2oNaJlwdDYShK+C
 XcYDDTSBVOy5ZVtjtlLe0nMp59rdxKxdbhKts7qk/A6vfnuvyN1+cwKznc7hVrvn9XPh
 fLocRURiJjGoG7YaFwqpoWeeAXt+0ni51eVahLoT0crp50YhPWMEcZxsivrC6AIdZbDn
 2uJzDZoPdKrJRoOzsZHpB3kkWGoaMujIk/91PZtZcVYaTRswO6SQ1g8Q22iFaUYFIaeM
 AHyw==
X-Gm-Message-State: APjAAAUpl/Zfx5WjAlQYvAGq7niH9VDZdTQYc/qnNLUyXj07PZNPrxnt
 N8p45t5yYZ6xuB9hqGJ6Dgi8rKtBJlXJxsxQXCXVeQ==
X-Google-Smtp-Source: APXvYqzPHWai2cPVbmyi53PtZyW+rD0M2Kck+rs0vgo/buY2HBfBi20KQ1+3WaNRxJAeDdyBzyejy/NHzp/5Y2dGtco=
X-Received: by 2002:ac8:352d:: with SMTP id y42mr78662075qtb.209.1558602584218; 
 Thu, 23 May 2019 02:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <1555580267-29299-1-git-send-email-fabrice.gasnier@st.com>
 <45e934af-d677-d7d4-09ea-3ed01872dab6@st.com>
In-Reply-To: <45e934af-d677-d7d4-09ea-3ed01872dab6@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 23 May 2019 11:09:33 +0200
Message-ID: <CA+M3ks5O9YpZ-4f3x=bFn_LxJu+6i3pu7jsWv_93pe14y8V71w@mail.gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 tduszyns@gmail.com, Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PWM List <linux-pwm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, u.kleine-koenig@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [RESEND PATCH v5 0/3] Add PM support to STM32 LP
	Timer drivers
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

TGUgdmVuLiAxMCBtYWkgMjAxOSDDoCAwOTo1MSwgRmFicmljZSBHYXNuaWVyIDxmYWJyaWNlLmdh
c25pZXJAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiA0LzE4LzE5IDExOjM3IEFNLCBGYWJyaWNl
IEdhc25pZXIgd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHBvd2VyIG1hbmFnZW1l
bnQgc3VwcG9ydCBmb3IgU1RNMzIgTFAgVGltZXI6Cj4gPiAtIFBXTSBkcml2ZXIKPiA+IC0gRG9j
dW1lbnQgdGhlIHBpbmN0cmwgc3RhdGVzIGZvciBzbGVlcCBtb2RlCj4gPgo+ID4gSXQgYWxzbyBh
ZGRzIGRldmljZSBsaW5rIGJldHdlZW4gdGhlIFBXTSBjb25zdW1lciBhbmQgdGhlIFBXTSBwcm92
aWRlci4KPiA+IFRoaXMgYWxsb3dzIHByb3BlciBzZXF1ZW5jaW5nIGZvciBzdXNwZW5kL3Jlc3Vt
ZSAoZS5nLiB1c2VyIHdpbGwgbGlrZWx5Cj4gPiBkbyBhIHB3bV9kaXNhYmxlKCkgYmVmb3JlIHRo
ZSBQV00gcHJvdmlkZXIgc3VzcGVuZCBleGVjdXRlcyksIHNlZSBbMV0uCj4gPgo+ID4gWzFdIGh0
dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzIvNS83NzAKPiA+Cj4KPiBIaSBUaGllcnJ5LAo+Cj4g
UGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIHNvbWUgbW9yZSBjb21tZW50cyBvbiB0aGlz
IHNlcmllcy4gSXQncwo+IGJlZW4gdW5kZXIgcmV2aWV3IHNpbmNlIHF1aXRlIHNvbWUgdGltZSBu
b3cuCj4KCkhpIFRoaWVycnksCgpEb2VzIHNvbWV0aGluZyBpcyBibG9ja2luZyBvbiB0aGlzIHNl
cmllcyA/CkhvdyBjYW4gd2UgcHJvZ3Jlc3Mgb24gaXQgPwoKUmVnYXJkcywKQmVuamFtaW4KCj4g
VGhhbmtzIGluIGFkdmFuY2UsCj4gQmVzdCBSZWdhcmRzLAo+IEZhYnJpY2UKPgo+ID4gLS0tCj4g
PiByZXNlbmQgdjU6Cj4gPiAtIHVwZGF0ZSBjb2xsZWN0ZWQgYWNrcwo+ID4KPiA+IENoYW5nZXMg
aW4gdjU6Cj4gPiAtIGltcHJvdmUgYSB3YXJuaW5nIG1lc3NhZ2UsIGZpeCBhIHN0eWxlIGlzc3Vl
Lgo+ID4KPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiAtIGltcHJvdmUgZXJyb3IgaGFuZGxpbmcgd2hl
biBhZGRpbmcgdGhlIFBXTSBjb25zdW1lciBkZXZpY2UgbGluay4KPiA+Cj4gPiBDaGFuZ2VzIGlu
IHYzOgo+ID4gLSBNb3ZlIHRoZSBkZXZpY2VfbGlua19hZGQoKSBjYWxsIHRvIG9mX3B3bV9nZXQo
KSBhcyBkaXNjdXNzZWQgd2l0aCBVd2UuCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+IC0gRG9u
J3QgZGlzYWJsZSBQV00gY2hhbm5lbCBpbiBQV00gcHJvdmlkZXI6IHJhdGhlciByZWZ1c2UgdG8g
c3VzcGVuZAo+ID4gICBhbmQgcmVwb3J0IGFuIGVycm9yIGFzIHN1Z2dlc3RlZCBieSBVd2UgYW5k
IFRoaWVycnkuCj4gPiAtIEFkZCBwYXRjaCAzLzMgdG8gcHJvcG9zZSBkZXZpY2UgbGluayBhZGRp
dGlvbi4KPiA+IC0gTm8gdXBkYXRlcyBmb3IgU1RNMzIgTFAgVGltZXIgSUlPIGRyaXZlci4gUGF0
Y2hlcyBjYW4gYmUgc2VuZCBzZXBhcmF0ZWx5Lgo+ID4KPiA+IEZhYnJpY2UgR2FzbmllciAoMyk6
Cj4gPiAgIGR0LWJpbmRpbmdzOiBwd20tc3RtMzItbHA6IGRvY3VtZW50IHBpbmN0cmwgc2xlZXAg
c3RhdGUKPiA+ICAgcHdtOiBzdG0zMi1scDogQWRkIHBvd2VyIG1hbmFnZW1lbnQgc3VwcG9ydAo+
ID4gICBwd206IGNvcmU6IGFkZCBjb25zdW1lciBkZXZpY2UgbGluawo+ID4KPiA+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLXN0bTMyLWxwLnR4dCAgICAgICB8ICA5ICsrLS0KPiA+
ICBkcml2ZXJzL3B3bS9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUw
ICsrKysrKysrKysrKysrKysrKysrLS0KPiA+ICBkcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYyAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDI1ICsrKysrKysrKysrCj4gPiAgaW5jbHVkZS9saW51
eC9wd20uaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKy0KPiA+ICA0IGZp
bGVzIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPgo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hcm0t
a2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
