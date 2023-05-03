Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5826F577C
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 14:01:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A91A9C6A60C;
	Wed,  3 May 2023 12:01:16 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06BA5C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 12:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1683115274;
 x=1714651274; h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ix7N5q3ZVqpzch8HgBmAf+2RPj4ErJP5ku/rS3Udqzo=;
 b=MAic0kEZqcTwr6D9ByrWmVi4axuFLoEENo2yreHWpkQ5YGZdbCJlM0oz
 /4wSumHltHy403nng8Qdp9/DkpSXSalY0HK+eqHet+79/ayTw0RReWCaP
 aHXHfu+RKPiClyJutp4m4hygsSUQLl73grs+rbLtfvoz42sf3GDgjcwIQ
 uPa7Egp09zUZtXU9BGr+OUlssmlTNz61TmvHIL5D0Ba1UDcU7SCKLKUIM
 PSiAmCjhQ6QB919djYqLcY/B+cjpEFkXc1F+sPquQ8iASr92Al/FCoXeq
 F3UvRqAv81YQWNBdR3c0W40I7YaEFdNtVxIM2k02wC9/2jEEkkxwlE6G3 g==;
Date: Wed, 3 May 2023 14:01:12 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Rob Herring <robh+dt@kernel.org>
Message-ID: <20230503120112.GC19396@axis.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
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

T24gVHVlLCBNYXkgMDIsIDIwMjMgYXQgMDI6NDA6MTlQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVHVlLCBNYXkgMiwgMjAyMyBhdCAzOjE14oCvQU0gQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4gd3JvdGU6Cj4gSSd2ZSBkdXN0ZWQgb2ZmIG15IHNjcmlwdCBhbmQgbWFkZSBh
IGJyYW5jaFsxXSB3aXRoIHRoZSByZXN1bHQuCj4gVGhlcmUncyBqdXN0IGEgY291cGxlIG9mIGZp
eGVzIG5lZWRlZCBhZnRlciB0aGUgc2NyaXB0IGlzIHJ1biAoc2VlIHRoZQo+IHRvcCBjb21taXQp
LiBUaGUgY3Jvc3MgYXJjaCBpbmNsdWRlcyBhcmUgYWxsIGZpeGVkIHVwIGJ5IHRoZSBzY3JpcHQu
Cj4gZHRic19pbnN0YWxsIG1haW50YWlucyBhIGZsYXQgaW5zdGFsbC4gSSBjb21wYXJlZCB0aGUg
bnVtYmVyIG9mIC5kdGJzCj4gYmVmb3JlIGFuZCBhZnRlciB0byBjaGVjayB0aGUgc2NyaXB0Lgo+
IAo+IEkgdGhpbmsgdGhlIG9ubHkgaXNzdWUgcmVtYWluaW5nIGlzIGZpbmFsaXppbmcgdGhlIG1h
cHBpbmcgb2YKPiBwbGF0Zm9ybXMgdG8gc3ViZGlycy4gV2hhdCBJIGhhdmUgY3VycmVudGx5IGlz
IGEgbWl4dHVyZSBvZiBTb0MKPiBmYW1pbGllcyBhbmQgdmVuZG9ycy4gVGhlIG1vc3Qgbm90YWJs
ZSBhcmUgYWxsIHRoZSBGcmVlc2NhbGUvTlhQCj4gcGxhdGZvcm1zLCBweGEsIHNvY2ZwZ2EsIGFu
ZCBzdG0zMi4gSXQncyBub3QgY29uc2lzdGVudCB3aXRoIGFybTY0Cj4gZWl0aGVyLiBPbmNlIHRo
YXQncyBmaW5hbGl6ZWQsIEkgc3RpbGwgbmVlZCB0byBnbyB1cGRhdGUgTUFJTlRBSU5FUlMuCj4g
Cj4gSGVyZSdzIHRoZSBjdXJyZW50IG1hcHBpbmc6Cj4gCj4gdmVuZG9yX21hcCA9IHsKPiBbLi4u
XQo+ICAgICAnYXJ0cGVjJyA6ICdheGlzJywKCkxvb2tzIGdvb2QgZm9yIG91ciBwbGF0Zm9ybXMg
YWxzbywgdGhhbmtzIQoKL15KTiAtIEplc3BlciBOaWxzc29uCi0tIAogICAgICAgICAgICAgICBK
ZXNwZXIgTmlsc3NvbiAtLSBqZXNwZXIubmlsc3NvbkBheGlzLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
