Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A06F0208
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Apr 2023 09:47:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36ABAC6907C;
	Thu, 27 Apr 2023 07:47:01 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3DCEC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 07:46:59 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-b8f557b241fso6392449276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 00:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682581618; x=1685173618;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EEqTvNM+jsZjZI+7JGQt1mFWY94TcOH6GPmA2DQxr8s=;
 b=BRQsh/ODbrLieX5x0QSLTY71uRf+GxcsfRhtVQag1jzMI3tHXa6RhUSwRE9KRLUM0g
 hlPyMukoNfeTsdDXF12KhXRFIQ/dM+Za3DLLzsRJJ6CgMhJ9DUBZTIuq/dmKfzTtQUSk
 QHgyA//kvZDkvauIqTif9ToL1CsKzAVJpojlS340hj/pC4qDefRaMHx4M3gpCsPrQzud
 vTRA731gytpkE00Bh6+ZICsQysAc7yo7o1dW+Kewry/GCRKSISeDDnsYW3+pZgXRcjIg
 +3dBWWgeSA/b220Gj0OtbAsURqYQaGCMc+C0lPTxJ7PJMrnamkAaGJkadwZw0l7sRWlw
 J0nw==
X-Gm-Message-State: AC+VfDy2msZO8cjSUD39OkKRmzoMvab2Wk+Pk7oojlIkdhf8H0Z9VGQU
 0roB4uXdsNlEdl0YH4RhC+TyJvma4zUfnQ==
X-Google-Smtp-Source: ACHHUZ5VWRu6GTrTLvqwtqDu1Oml6PPdjysy8t+j9OcNNCkKb8fYyMvXRhNBeqpiw/9PYXP+p0sSZQ==
X-Received: by 2002:a81:9112:0:b0:54f:b994:e258 with SMTP id
 i18-20020a819112000000b0054fb994e258mr586092ywg.4.1682581618385; 
 Thu, 27 Apr 2023 00:46:58 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 k65-20020a819344000000b00545a08184efsm4692710ywg.127.2023.04.27.00.46.56
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 00:46:56 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-54f6f0dae19so63611177b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 00:46:56 -0700 (PDT)
X-Received: by 2002:a0d:d712:0:b0:54e:ed46:6b39 with SMTP id
 z18-20020a0dd712000000b0054eed466b39mr582224ywd.31.1682581616022; Thu, 27 Apr
 2023 00:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
In-Reply-To: <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Apr 2023 09:46:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
Message-ID: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

T24gVGh1LCBBcHIgMjcsIDIwMjMgYXQgOTozN+KAr0FNIE1hdHRoaWFzIEJydWdnZXIgPG1hdHRo
aWFzLmJnZ0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIDI1LzA0LzIwMjMgMTc6NTcsIFJvYiBIZXJy
aW5nIHdyb3RlOgo+ID4gT24gVHVlLCBBcHIgMjUsIDIwMjMgYXQgMjoyOOKAr0FNIEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4+IE9uIFR1ZSwgQXBy
IDI1LCAyMDIzIGF0IDEyOjE24oCvQU0gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPj4+IEkgaGF2ZSBhIHNjcmlwdFsxXSB0aGF0IGRvZXMgdGhlIGNvbnZlcnNpb24g
d3JpdHRlbiB0aGUgbGFzdCB0aW1lIHRoaXMKPiA+Pj4gY2FtZSB1cC4gSnVzdCBoYXZlIHRvIGFn
cmVlIG9uIGRpcmVjdG9yeSBuYW1lcy4gSSB0aGluayB0aGUgZWFzaWVzdAo+ID4+PiB3b3VsZCBi
ZSBmb3IgQXJuZC9PbG9mIHRvIHJ1biBpdCBhdCB0aGUgZW5kIG9mIGEgbWVyZ2Ugd2luZG93IGJl
Zm9yZQo+ID4+PiByYzEuCj4gPj4KPiA+PiAiZW1ldjIiIGFuZCAic2g3IiBhcmUgbWlzc2luZyBm
b3IgcmVuZXNhcy4KPiA+Cj4gPiBObyBkb3VidCBpdCdzIGJlZW4gYml0cm90dGluZyAob3IgSSBt
YXkgaGF2ZSBtaXNzZWQgc29tZSkuCj4gPgo+ID4+IERvZXMgeW91ciBzY3JpcHQgYWxzbyBjYXRl
ciBmb3IgLmR0cyBmaWxlcyBub3QgbWF0Y2hpbmcgYW55IHBhdHRlcm4sCj4gPj4gYnV0IGluY2x1
ZGluZyBhIC5kdHNpIGZpbGUgdGhhdCBkb2VzIG1hdGNoIGEgcGF0dGVybj8KPiA+Cj4gPiBJIGFz
c3VtZSBJIGJ1aWx0IGV2ZXJ5dGhpbmcgYWZ0ZXIgbW92aW5nLCBidXQgbWF5YmUgbm90Li4uCj4g
Pgo+ID4gVGhhdCdzIGFsbCBqdXN0ICJkZXRhaWxzIi4gRmlyc3QsIHdlIG5lZWQgYWdyZWVtZW50
IG9uIGEpIG1vdmluZwo+ID4gdGhpbmdzIHRvIHN1YmRpcnMgYW5kIGIpIGRvaW5nIGl0IDEtYnkt
MSBvciBhbGwgYXQgb25jZS4gU28gZmFyIHdlJ3ZlCj4gPiBiZWVuIHN0dWNrIG9uIGEpIGZvciBi
ZWluZyAndG9vIG11Y2ggY2h1cm4nLgo+ID4KPgo+IEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8g
bW92ZSB0aGVtIGFuZCBwcm9iYWJseSB0aGUgYmVzdCB3YXkgdG8gZG8gc28gaXMsIGFzCj4geW91
IHByb3Bvc2VkOiB0aGF0IEFybmQgb3IgT2xvZiBydW4gdGhlIHNjcmlwdCB0byBtb3ZlIHRoZW0g
anVzdCBiZWZvcmUgLXJjMQoKRlRSLCBubyBvYmplY3Rpb25zIGZyb20gbXkgc2lkZS4KCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
