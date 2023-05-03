Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 192AD6F5894
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 15:09:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2DA8C6A60C;
	Wed,  3 May 2023 13:09:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2343AC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 13:09:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4AA462D16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 13:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34ECCC4339C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683119343;
 bh=5Xok1b5Bon4dNBT/EG9uKl/6cvSusA5y9BN7upmEzC8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=glYqs7G41Oe7Vr2QNmHMivzZ6SgZQ51erxLwa4NoyJylHIWGgJZiJbFOEF9eZRS9n
 xWx6cluWIvaqTZt7zXRHgIkq6tJbMsx2DRAeJtYjsXE4g6fbmacJoLd1zt/7Kc+RNb
 DVYTcfIMk4llzEHHC0AIYjcc1NqABxKW5it0P7I3y/6ACXPplEVw9mnPneYwqWJE1j
 DXf0Ve1xZPIJYMX1EQqZ/49QrXBsnJubhquY8wuE6I2y8dSs6L+d1Z35PcqDp/q7zl
 io5DshylXLfwwhBVdAWKtYrKz5bhQuXIbmxPDl7QiyFIMDTq/uAziVDre8vjyLHGtq
 jmFJ8ehjTEdAg==
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ac675d84b5so17511541fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 May 2023 06:09:03 -0700 (PDT)
X-Gm-Message-State: AC+VfDwFmK5yptXaGrOCaXEO1VZmjc79l02WG9DSMJBl294xz7hwWKtZ
 erKCjwI8LzFSR+X2Bv1S/oao4n0IaBhyGqD5lw==
X-Google-Smtp-Source: ACHHUZ50B+ONgazRTst79ZMphnWydxujQ+xpsmD1oxBiJc6OIwSZRmXeOONoaPS4VdIBDlX9Htpoiog7d0wWQm74E6U=
X-Received: by 2002:a2e:80ca:0:b0:2a5:f82e:e2a6 with SMTP id
 r10-20020a2e80ca000000b002a5f82ee2a6mr239ljg.47.1683119341121; Wed, 03 May
 2023 06:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
In-Reply-To: <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 3 May 2023 08:08:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL-WMNxHrgCzn=LfH6gpE_Yb3uRwo97ssHPoZenK3CEeQ@mail.gmail.com>
Message-ID: <CAL_JsqL-WMNxHrgCzn=LfH6gpE_Yb3uRwo97ssHPoZenK3CEeQ@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
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

T24gV2VkLCBNYXkgMywgMjAyMyBhdCA2OjAy4oCvQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyLCAyMDIzLCBhdCAyMTo0MCwgUm9iIEhlcnJp
bmcgd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSAyLCAyMDIzIGF0IDM6MTXigK9BTSBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPgo+ID4gdmVuZG9yX21hcCA9IHsKPiA+ICAgICAn
YWxwaGFzY2FsZScgOiAnYWxwaGFzY2FsZScsCj4gPiAgICAgJ2FscGluZScgOiAnYWxwaW5lJywK
Pgo+IEkgd291bGQgbWFrZSB0aGlzIG9uZSAnYW1hem9uJyBpZiB3ZSBnbyB3aXRoIGN1cnJlbnQg
bWFudWZhY3R1cmVycy4KPgo+ID4gICAgICduc3BpcmUnIDogJ25zcGlyZScsCj4KPiBuc3BpcmUg
aXMgdGhlIG5hbWUgb2YgdGhlIGVuZC11c2VyIHByb2R1Y3QsIHNvIHRoYXQgZG9lc24ndCBxdWl0
ZQo+IGZpdC4gVGhlIFNvQyB3YXMgYXBwYXJlbnRseSBhbiBMU0kgbG9naWMgWmV2aW8sIHdoaWNo
IGlzIG5vdyBvd25lZAo+IGJ5IEJyb2FkY29tLgoKSSdtIGluY2xpbmVkIHRvIGxlYXZlIGl0LiBJ
IHB1dCBpdCBpbiB0aGUgY2F0ZWdvcnkgb2YgYSBvbmUtb2ZmIHRoaW5nCnRoYXQncyBub3Qgc2hh
cmluZyBhbnl0aGluZwoKPiA+ICAgICAnbXZlYnUnIDogJ21hcnZlbGwnLAo+ID4gICAgICdtbXAn
IDogJ21hcnZlbGwnLAo+ID4gICAgICdiZXJsaW4nIDogJ2JlcmxpbicsCj4KPiBXaGlsZSBiZXJs
aW4gaXMgcmVsYXRlZCB0byBweGEvbW1wLCB0aGlzIG9uZSBpcyBub3cgb3duZWQKPiBieSBTeW5h
cHRpY3MsIGFuZCB0aGUgNjQtYml0IHZlcnNpb25zIGFyZSBhbHJlYWR5IGluIHRoZQo+IHN5bmFw
dGljcyBzdWJkaXIsIHNvIEknZCBnbyB3aXRoIHRlaCBzYW1lIGhlcmUuCj4KPiA+ICAgICAnb3Bl
bmJtYycgOiAnYXNwZWVkJywKPiA+ICAgICAnZW43JyA6ICdhaXJvaGEnLAo+Cj4gYWlyb2hhIGlz
IGEgc2VwYXJhdGUgY29tcGFueSBub3csIGJ1dCB0aGUgaGFyZHdhcmUgaXMgc3RpbGwKPiBzaGFy
ZWQgd2l0aCBtZWRpYXRlaywgc28gd2UgY291bGQgY29uc2lkZXIgbHVtcGluZyBpdCBpbnRvCj4g
dGhhdCBzdWJkaXIsIGJ1dCBhIHNlcGFyYXRlIG9uZSBtYXkgYmUgYmV0dGVyIGxvbmctdGVybS4K
Pgo+ID4gICAgICdnZW1pbmknIDogJ2dlbWluaScsCj4KPiBUaGlzIG9uZSBpcyBhbHNvIGEgcHJv
ZHVjdCBuYW1lLCBub3QgYSBjb21wYW55LiBBcHBhcmVudGx5LAo+IGdlbWluaSB3YXMgb3JpZ2lu
YWxseSBtYWRlIGJ5IFN0b3JtIFNlbWljb25kdWN0b3IsIGFuZCB0aGVuCj4gYnkgQ29ydGluYSwg
d2hpY2ggd2FzIHN1YnNlcXVlbnRseSBhY3F1aXJlZCBieSBJbnBoaSwgYW5kIHRoYXQgZW5kZWQK
PiB1cCBpbiBNYXJ2ZWxsIGFmdGVyIHRoZSBwcm9kdWN0IHdhcyBhbHJlYWR5IGRpc2NvbnRpbnVl
ZC4KPgo+IE91dCBvZiB0aGUgZm91ciwgSSdkIHByb2JhYmx5IGdvIHdpdGggJ2NvcnRpbmEnIGFz
IHRoZQo+IGRpcmVjdG9yeSBuYW1lLgoKSSBoYWQgJ2NvcnRpbmEnIHByZXZpb3VzbHkuIExpbnVz
IHdhbnRlZCBnZW1pbmkuLi4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
