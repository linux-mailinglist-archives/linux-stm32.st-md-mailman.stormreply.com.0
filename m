Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FE06B499C
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 16:14:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D98FC6A60C;
	Fri, 10 Mar 2023 15:14:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCB8AC640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 15:14:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3D9861976
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 15:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C1AC433A4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678461261;
 bh=sgc8sIikzUKf8oaUnbtaXcTY2+rUOaKm8L45dmJWIxw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XsSdofoMEl9DiYAK/5ZfZwS39YNneCyCkE2OMaRWREuFbfAKyFkSbPfX7MGZcG4M7
 JAeBtbixw/gZHCVfI2L/DClYn6pJa7qjBMGz08lE6JrnCEkh0hSOMt43r5/aUqmZSz
 OH855hrU5l1onGHH6KfbzuDFtdHssh/uoofSzr19FlyR2g9v+q5I70AUu22M+BmnRO
 b8+zztOPCyBsxmSt4a6CqbzxeWH73JK8u/OCwRnI6XUMFF6eeqPuu0PTriEqEY1Asx
 1WnD7DVAkpnF8vMtJpiy6LsQrLt/e0y4uqrj2F4+wPGAlLSnraGi8gEAXKDxdBpMdK
 ELb1vvyozXFrw==
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-53916ab0c6bso103351897b3.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 07:14:21 -0800 (PST)
X-Gm-Message-State: AO0yUKV5LQJ5605oCIQ8tyFNAVHdaF9bEHnre64EL8zXyYht4F9XV9zZ
 ymmBCn6RJR0wSyQAPoBUtPBQt0wwf5ZW8JpNfg==
X-Google-Smtp-Source: AK7set9VS13tgdT+DzbUPAyK1hhAFX+2x0Vswnb9c7OreYxCI/2ydgI/cIMuWNP/8hWsvzFznbnbU6n4F1bUdn7w/qM=
X-Received: by 2002:a81:ad5a:0:b0:536:4d58:54b2 with SMTP id
 l26-20020a81ad5a000000b005364d5854b2mr17238450ywk.4.1678461260807; Fri, 10
 Mar 2023 07:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20230310144732.1546328-1-robh@kernel.org>
 <a23852d7-c70c-a03c-99fb-b453bdc750a1@linux.intel.com>
In-Reply-To: <a23852d7-c70c-a03c-99fb-b453bdc750a1@linux.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Mar 2023 09:14:08 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+XBzEMWrz=quxq4TkrejMMFRRvo0UinghmBphtmr=XXw@mail.gmail.com>
Message-ID: <CAL_Jsq+XBzEMWrz=quxq4TkrejMMFRRvo0UinghmBphtmr=XXw@mail.gmail.com>
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] ASoC: Use of_property_present() for
	testing DT property presence
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgOTowMeKAr0FNIEFtYWRldXN6IFPFgmF3acWEc2tpCjxh
bWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiAzLzEwLzIw
MjMgMzo0NyBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBJdCBpcyBwcmVmZXJyZWQgdG8gdXNl
IHR5cGVkIHByb3BlcnR5IGFjY2VzcyBmdW5jdGlvbnMgKGkuZS4KPiA+IG9mX3Byb3BlcnR5X3Jl
YWRfPHR5cGU+IGZ1bmN0aW9ucykgcmF0aGVyIHRoYW4gbG93LWxldmVsCj4gPiBvZl9nZXRfcHJv
cGVydHkvb2ZfZmluZF9wcm9wZXJ0eSBmdW5jdGlvbnMgZm9yIHJlYWRpbmcgcHJvcGVydGllcy4g
QXMKPiA+IHBhcnQgb2YgdGhpcywgY29udmVydCBvZl9nZXRfcHJvcGVydHkvb2ZfZmluZF9wcm9w
ZXJ0eSBjYWxscyB0byB0aGUKPiA+IHJlY2VudGx5IGFkZGVkIG9mX3Byb3BlcnR5X3ByZXNlbnQo
KSBoZWxwZXIgd2hlbiB3ZSBqdXN0IHdhbnQgdG8gdGVzdAo+ID4gZm9yIHByZXNlbmNlIG9mIGEg
cHJvcGVydHkgYW5kIG5vdGhpbmcgbW9yZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgIHNvdW5kL3NvYy9jb2RlY3MvbHBh
c3MtbWFjcm8tY29tbW9uLmMgfCAyICstCj4gPiAgIHNvdW5kL3NvYy9nZW5lcmljL2F1ZGlvLWdy
YXBoLWNhcmQuYyAgfCAyICstCj4gPiAgIHNvdW5kL3NvYy9nZW5lcmljL2F1ZGlvLWdyYXBoLWNh
cmQyLmMgfCAyICstCj4gPiAgIHNvdW5kL3NvYy9teHMvbXhzLXNndGw1MDAwLmMgICAgICAgICAg
fCAyICstCj4gPiAgIHNvdW5kL3NvYy9zYW1zdW5nL2kycy5jICAgICAgICAgICAgICAgfCAyICst
Cj4gPiAgIHNvdW5kL3NvYy9zaC9mc2kuYyAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiAg
IHNvdW5kL3NvYy9zdG0vc3RtMzJfaTJzLmMgICAgICAgICAgICAgfCAyICstCj4gPiAgIHNvdW5k
L3NvYy9zdG0vc3RtMzJfc2FpX3N1Yi5jICAgICAgICAgfCA0ICsrLS0KPiA+ICAgc291bmQvc29j
L3RlZ3JhL3RlZ3JhX2Fzb2NfbWFjaGluZS5jICB8IDIgKy0KPiA+ICAgOSBmaWxlcyBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
c291bmQvc29jL2NvZGVjcy9scGFzcy1tYWNyby1jb21tb24uYyBiL3NvdW5kL3NvYy9jb2RlY3Mv
bHBhc3MtbWFjcm8tY29tbW9uLmMKPiA+IGluZGV4IDFiOTA4MmQyMzdjMS4uZjU0YmFhYWQ1NGQ0
IDEwMDY0NAo+ID4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9scGFzcy1tYWNyby1jb21tb24uYwo+
ID4gKysrIGIvc291bmQvc29jL2NvZGVjcy9scGFzcy1tYWNyby1jb21tb24uYwo+ID4gQEAgLTE2
LDcgKzE2LDcgQEAgc3RydWN0IGxwYXNzX21hY3JvICpscGFzc19tYWNyb19wZHNfaW5pdChzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gPiAgICAgICBzdHJ1Y3QgbHBhc3NfbWFjcm8gKmxfcGRzOwo+ID4g
ICAgICAgaW50IHJldDsKPiA+Cj4gPiAtICAgICBpZiAoIW9mX2ZpbmRfcHJvcGVydHkoZGV2LT5v
Zl9ub2RlLCAicG93ZXItZG9tYWlucyIsIE5VTEwpKQo+ID4gKyAgICAgaWYgKCFvZl9wcm9wZXJ0
eV9wcmVzZW50KGRldi0+b2Zfbm9kZSwgInBvd2VyLWRvbWFpbnMiKSkKPiA+ICAgICAgICAgICAg
ICAgcmV0dXJuIE5VTEw7Cj4gPgo+ID4gICAgICAgbF9wZHMgPSBkZXZtX2t6YWxsb2MoZGV2LCBz
aXplb2YoKmxfcGRzKSwgR0ZQX0tFUk5FTCk7Cj4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2dl
bmVyaWMvYXVkaW8tZ3JhcGgtY2FyZC5jIGIvc291bmQvc29jL2dlbmVyaWMvYXVkaW8tZ3JhcGgt
Y2FyZC5jCj4gPiBpbmRleCA1ZGFhODI0YTRmZmMuLmQ3ODhmNWYyM2E4YSAxMDA2NDQKPiA+IC0t
LSBhL3NvdW5kL3NvYy9nZW5lcmljL2F1ZGlvLWdyYXBoLWNhcmQuYwo+ID4gKysrIGIvc291bmQv
c29jL2dlbmVyaWMvYXVkaW8tZ3JhcGgtY2FyZC5jCj4gPiBAQCAtNzgsNyArNzgsNyBAQCBzdGF0
aWMgaW50IGdyYXBoX2dldF9kYWlfaWQoc3RydWN0IGRldmljZV9ub2RlICplcCkKPiA+ICAgICAg
ICAgICAgICAgICogb25seSBvZl9ncmFwaF9wYXJzZV9lbmRwb2ludCgpLgo+ID4gICAgICAgICAg
ICAgICAgKiBXZSBuZWVkIHRvIGNoZWNrICJyZWciIHByb3BlcnR5Cj4gPiAgICAgICAgICAgICAg
ICAqLwo+ID4gLSAgICAgICAgICAgICBpZiAob2ZfZ2V0X3Byb3BlcnR5KGVwLCAgICJyZWciLCBO
VUxMKSkKPiA+ICsgICAgICAgICAgICAgaWYgKG9mX3Byb3BlcnR5X3ByZXNlbnQoZXAsICAgInJl
ZyIpKQo+Cj4gQml0IG9mIG5pdCBwaWNraW5nLCBidXQgYW55IHJlYXNvbiwgd2h5IHRoZXJlIGFy
ZSBtdWx0aXBsZSBzcGFjZXMsCj4gYmVmb3JlICJyZWciIGhlcmU/CgpPbmx5IGJlY2F1c2UgdGhl
cmUgd2FzIGJlZm9yZSBhbmQgaXQgd2FzIGEgc2NyaXB0ZWQgY2hhbmdlLgoKUm9iCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
