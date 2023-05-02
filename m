Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C756F4A07
	for <lists+linux-stm32@lfdr.de>; Tue,  2 May 2023 21:01:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6889C6A5FD;
	Tue,  2 May 2023 19:01:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69BFCC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 19:01:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39EBC62816
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 19:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2584CC433B0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683054076;
 bh=prkycoKFrtYOB9sqzJph1/Wh7+dUYl73V0ySsrK86tE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rf/Ymu/EiSQOPePfJMJv1847ZBWRjnjneowURtOqNMODuCRTfcl2GQ0h/jO2AdmCs
 leEyX7R6GR2dka6/IsiyySID/QcvyxsSv7fNtmEEy0Cm9A6hC1sqxMJ+9jfUBya5xj
 ODLup2MnZzYCOUMdIZzoCrk5OSl4AOnL/7/DJbtkd5lptoW7/0YbgOkcgOH14mk6Au
 qACeCdnoaBW8B9rF8o7n7shq7gT7w0jQTaVjP3mXHg69IyA+TLldeHm4Y1C5mj86Z3
 uRYRPp4016gJq/2Xf9LklNYOIaWs99spKYSrk9MtOv6rk+8yKfvzOFwqXzWomFJ/+X
 cezzz3yUhjKtA==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so30189116e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 May 2023 12:01:16 -0700 (PDT)
X-Gm-Message-State: AC+VfDywhSNXTo4BP1OKu4WgWwtkuz2igDo99xmzq66sgPmVt8ML5Ycv
 2WpxQzvsjzwy67OjDNZ7lKULMd+6fj95mHSEpA==
X-Google-Smtp-Source: ACHHUZ4aQAyOb+PGJ7PQfIp0PiLUMh7I0dBEHOyVsVppKRO7n40/yktfmotxwSexv0gCD3XVcEmYB9ah5iQIzUMa54Q=
X-Received: by 2002:a05:6512:3b07:b0:4eb:412e:b06a with SMTP id
 f7-20020a0565123b0700b004eb412eb06amr237890lfv.22.1683054074001; Tue, 02 May
 2023 12:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <4ff4f171-c5f8-87af-aad1-5e7686292288@microchip.com>
 <45bc13a8-1442-2dd3-b9ea-1ed2f5962bac@arm.com>
In-Reply-To: <45bc13a8-1442-2dd3-b9ea-1ed2f5962bac@arm.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 May 2023 14:01:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL7t47x-5U6STynwW-+4wJUhs_R9wuaQ0YOgX59aJ=vew@mail.gmail.com>
Message-ID: <CAL_JsqL7t47x-5U6STynwW-+4wJUhs_R9wuaQ0YOgX59aJ=vew@mail.gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 Daniel Palmer <daniel@0x0f.com>, linux-arm-kernel@axis.com,
 linux-rockchip@lists.infradead.org, Ansuel Smith <ansuelsmth@gmail.com>,
 Cristian Birsan <Cristian.Birsan@microchip.com>,
 DTML <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Santiago Esteban <Santiago.Esteban@microchip.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>
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

T24gVHVlLCBBcHIgMjUsIDIwMjMgYXQgMTE6MjHigK9BTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11
cnBoeUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDI5LzAzLzIwMjIgOTo1MCBhbSwgTmljb2xhcyBG
ZXJyZSB3cm90ZToKPiA+IEFuc3VlbCwgQWxsLAo+ID4KPiA+IE9uIDI4LzAzLzIwMjIgYXQgMTA6
NTUsIERhbmllbCBQYWxtZXIgd3JvdGU6Cj4gPj4gSGkgQW5zdWVsCj4gPj4KPiA+PiBPbiBNb24s
IDI4IE1hciAyMDIyIGF0IDA5OjA5LCBBbnN1ZWwgU21pdGggPGFuc3VlbHNtdGhAZ21haWwuY29t
PiB3cm90ZToKPiA+Pj4KPiA+Pj4gSGksCj4gPj4+IGFzIHRoZSB0aXRsZSBzYXksIHRoZSBpbnRl
bnRpb24gb2YgdGhpcyAiInNlcmllcyIiIGlzIHRvIGZpbmFsbHkKPiA+Pj4gY2F0ZWdvcml6ZQo+
ID4+PiB0aGUgQVJNIGR0cyBkaXJlY3RvcnkgaW4gc3ViZGlyZWN0b3J5IGZvciBlYWNoIG9lbS4K
PiA+Pgo+ID4+IFdoaWxlIEkgYWdyZWUgd2l0aCB0aGlzIGNoYW5nZSBhbmQgdGhpbmsgaXQncyBm
b3IgdGhlIGdvb2QgKGJyb3dzaW5nCj4gPj4gdGhlIEFSTSBkdHMgZGlyZWN0b3J5IGF0IHRoZSBt
b21lbnQgaXMgZnJ1c3RyYXRpbmcuLikgSSB0aGluawo+ID4+IGJ1aWxkcm9vdCBhbmQgb3RoZXJz
IG5lZWQgdG8gYmUgdG9sZCBhYm91dCB0aGlzIGFzIGl0J2xsIHBvdGVudGlhbGx5Cj4gPj4gYnJl
YWsgdGhlaXIga2VybmVsIGJ1aWxkIHNjcmlwdGluZyBmb3IgQVJNIGFuZCBwcm9iYWJseSBtZXNz
ZXMgdXAgdGhlCj4gPj4gY29uZmlncyB0aGV5IGhhdmUgZm9yIGV4aXN0aW5nIGJvYXJkcy4KPiA+
Cj4gPiBUaGlzIGFzcGVjdCBtdXN0bid0IGJlIHVuZGVyZXN0aW1hdGVkIGFuZCBJIGFudGljaXBh
dGUgbG90cyBvZiBpc3N1ZXMKPiA+IGR1cmluZyBhIGxvbmcgdGltZSBvbiB0aGlzIHBhcnRpY3Vs
YXIgdG9waWMgb2YgImJ1aWxkIHN5c3RlbXMiLgo+ID4KPiA+IEFub3RoZXIgYXNwZWN0IGlzIENJ
IGFuZCBwdWJsaWMgb3IgcHJpdmF0ZSB0ZXN0aW5nIGZhcm1zIHdlIGFsbCBoYXZlCj4gPiBydW5u
aW5nLgo+Cj4gWWV0IGFub3RoZXIgaXMgaWYgdGhpcyBhZmZlY3RzIHdoYXQgYG1ha2UgZHRic19p
bnN0YWxsYCBkb2VzIChJIGRvbid0Cj4ga25vdyBmb3Igc3VyZSwgYnV0IEknZCBiZSBpbmNsaW5l
ZCB0byBzdXNwZWN0IGl0IG1pZ2h0KS4gU29tZSBkaXN0cm9zCj4gdXNlIHRoYXQgdG8gZGVsaXZl
ciB0aGUgRFRCcyBhcyBwYXJ0IG9mIHRoZWlyIGtlcm5lbCBwYWNrYWdlLCBzbyBpZgo+IHBhdGhz
IHN1ZGRlbmx5IGNoYW5nZSBpdCBjb3VsZCBicmVhayBlbmQgdXNlcnMnIGJvb3Rsb2FkZXIgc2V0
dXBzIHRvby4KCkluZGVlZCwgdGhpcyBjYW1lIHVwIGxhc3QgdGltZS4gVHVybnMgb3V0IEkgaGFk
IGFscmVhZHkgaW1wbGVtZW50ZWQKc3VwcG9ydCB0byBtYWludGFpbiB0aGUgZmxhdCBpbnN0YWxs
LiBJIGp1c3QgcmUtd3JvdGUgaXQgc2luY2UKTWFrZWZpbGUuZHRiaW5zdCBjaGFuZ2VkIGNvbXBs
ZXRlbHkgc2luY2UgdGhlbi4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
