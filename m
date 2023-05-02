Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D576F500C
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 08:24:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1BAFC6A60C;
	Wed,  3 May 2023 06:24:36 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED7E5C69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 22:01:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso43876735e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 May 2023 15:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683064867; x=1685656867;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TdcAdDdlf9uHq0BGWP12DCyO25DhnUOTFA60Cufr6eI=;
 b=RT0q3Tq/QobRc7VhWSA058nWN/Za5XYXvPGAIJlI1ZUNAUDMj5BN+lfBvNOL7lOsvi
 wsgGV7KrmVwWv/KMOdekp8C7pQaON1LAK5t9ubx19ePpGuEftKgJC/l7k+ML6sxx8JK9
 UlUulOSSkFQPIDL+zYjvJKrqSMzaiEy1GG+3oxDl6PSn1KoVPFpl6qS5BdSJSBjjC2b8
 bwX53rYuzNXwiPyy0bXgSp2J2HTLqVbctbilWo7XLgkDv9sLOmwJ//iCqRERemcfFjBs
 YRmeM+KtYqqC91FnNE0ka6uEtbetCHByeOTjm2Jt4RVi90NmQdapH1J4YBNcEwBPOh/O
 LYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683064867; x=1685656867;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TdcAdDdlf9uHq0BGWP12DCyO25DhnUOTFA60Cufr6eI=;
 b=ZCHlEQhaCyZId76RhVrqlx9Sp4uhofcS2U1b8/MZy8igUwUw5OJYG1wl6w1y13vOaz
 Y65IcXMyi8JpmooHl3cCh+p9tI+GE5gLldM0HTJ3Z062aNum4/KNB55XicanMC6VCroW
 9I3pq40j2mi/s8PCCnGz8Yo4VQV5cSBnd5voHjeN2oOQdkSPl8sRczaY2xFkno93HQFC
 Xfk7e8Z0s6Dce5Eh03V2JKFucTdffuLT1kRV3Rj+Yl7i4X+cZlbRg85Gu5K5ANw6xb4l
 3qm/tGdtMvSOk695KWdyKANJBoyye/OuFASXrsNerWI2027lIxC5rqhsmfDsDau9daZ/
 slLg==
X-Gm-Message-State: AC+VfDysuCleg4bN8uf1fhGxW63ol6bo7dzZCm7DbamraEgazap4ywAd
 sIQikCmo8i9ixUAdhXtJHPg=
X-Google-Smtp-Source: ACHHUZ5ybUYKWTDV7iyMT3UD1OcV6iuMEt21qUpy9BFWRJB0WpmP8MgHZQVEdSajDh7czeTwLAcS3Q==
X-Received: by 2002:a7b:c7d4:0:b0:3f1:9ca1:cac3 with SMTP id
 z20-20020a7bc7d4000000b003f19ca1cac3mr13020245wmk.34.1683064867148; 
 Tue, 02 May 2023 15:01:07 -0700 (PDT)
Received: from smtpclient.apple ([91.135.9.67])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a05600c364400b003f175954e71sm1965wmq.32.2023.05.02.15.01.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 May 2023 15:01:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
Date: Tue, 2 May 2023 23:01:04 +0100
Message-Id: <AEB0917D-37B0-428B-8FF5-90125BBA7D18@gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
X-Mailman-Approved-At: Wed, 03 May 2023 06:24:36 +0000
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
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

Cgo+IE9uIDIgTWF5IDIwMjMsIGF0IDg6NDAgcG0sIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+IHdyb3RlOgo+IAo+IE9uIFR1ZSwgTWF5IDIsIDIwMjMgYXQgMzoxNeKAr0FNIEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+PiAKPj4gT24gVHVlLCBBcHIgMjUsIDIw
MjMsIGF0IDE3OjU3LCBSb2IgSGVycmluZyB3cm90ZToKPj4+IE9uIFR1ZSwgQXByIDI1LCAyMDIz
IGF0IDI6MjjigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3
cm90ZToKPj4+IAo+Pj4+IERvZXMgeW91ciBzY3JpcHQgYWxzbyBjYXRlciBmb3IgLmR0cyBmaWxl
cyBub3QgbWF0Y2hpbmcgYW55IHBhdHRlcm4sCj4+Pj4gYnV0IGluY2x1ZGluZyBhIC5kdHNpIGZp
bGUgdGhhdCBkb2VzIG1hdGNoIGEgcGF0dGVybj8KPj4+IAo+Pj4gSSBhc3N1bWUgSSBidWlsdCBl
dmVyeXRoaW5nIGFmdGVyIG1vdmluZywgYnV0IG1heWJlIG5vdC4uLgo+Pj4gCj4+PiBUaGF0J3Mg
YWxsIGp1c3QgImRldGFpbHMiLiBGaXJzdCwgd2UgbmVlZCBhZ3JlZW1lbnQgb24gYSkgbW92aW5n
Cj4+PiB0aGluZ3MgdG8gc3ViZGlycyBhbmQgYikgZG9pbmcgaXQgMS1ieS0xIG9yIGFsbCBhdCBv
bmNlLiBTbyBmYXIgd2UndmUKPj4+IGJlZW4gc3R1Y2sgb24gYSkgZm9yIGJlaW5nICd0b28gbXVj
aCBjaHVybicuCj4+IAo+PiBTb3JyeSBmb3IgbWlzc2luZyBtb3N0IG9mIHRoZSBkaXNjdXNzaW9u
IGxhc3Qgd2Vlay4gVGhlIHNjcmlwdCBzb3VuZHMKPj4gZmluZSB0byBtZSwgdGhlIG9ubHkgcmVh
c29uIEkgZGlkbid0IHdhbnQgdG8gZG8gdGhpcyBpbiB0aGUgcGFzdCBpcyB0aGF0Cj4+IHdlIGhh
ZCB0aGUgcGxhbiB0byBtb3ZlIHBsYXRmb3JtcyBvdXQgb2YgdGhlIGtlcm5lbCB0cmVlIHRvIGFu
IGV4dGVybmFsCj4+IHJlcG9zaXRvcnkgYW5kIEkgd2FudGVkIHRvIGRvIHRoaXMgcGxhdGZvcm0g
YXQgYSB0aW1lIGFuZCBhbHNvIG9ubHkgbW92ZQo+PiBlYWNoIG9uZSBvbmNlLiBJIGRvbid0IHRo
aW5rIHRoYXQgaXMgZ29pbmcgdG8gaGFwcGVuIGFueXRpbWUgc29vbiBub3csCj4+IHNvIGxldCdz
IGp1c3QgZG8geW91ciBzY3JpcHQuCj4+IAo+PiBDYW4geW91IHNlbmQgbWUgdGhlIHNjcmlwdCBh
bmQvb3IgYSBwdWxsIHJlcXVlc3Qgb2YgdGhlIHJlc3VsdGluZwo+PiB0cmVlIGJhc2VkIG9uIG15
IHNvYy9kdCBicmFuY2g/IEV2ZXJ5dGhpbmcgaXMgbWVyZ2VkIHVwc3RyZWFtLAo+PiBhbmQgSSB0
aGluayBnaXQtbWVyZ2Ugd291bGQgaGFuZGxlIHRoZSByZW1haW5pbmcgbWVyZ2VzIHdpdGggYW55
Cj4+IG90aGVyIGNoYW5nZXMgaW4gbWFpbmxpbmUuCj4gCj4gSSd2ZSBkdXN0ZWQgb2ZmIG15IHNj
cmlwdCBhbmQgbWFkZSBhIGJyYW5jaFsxXSB3aXRoIHRoZSByZXN1bHQuCj4gVGhlcmUncyBqdXN0
IGEgY291cGxlIG9mIGZpeGVzIG5lZWRlZCBhZnRlciB0aGUgc2NyaXB0IGlzIHJ1biAoc2VlIHRo
ZQo+IHRvcCBjb21taXQpLiBUaGUgY3Jvc3MgYXJjaCBpbmNsdWRlcyBhcmUgYWxsIGZpeGVkIHVw
IGJ5IHRoZSBzY3JpcHQuCj4gZHRic19pbnN0YWxsIG1haW50YWlucyBhIGZsYXQgaW5zdGFsbC4g
SSBjb21wYXJlZCB0aGUgbnVtYmVyIG9mIC5kdGJzCj4gYmVmb3JlIGFuZCBhZnRlciB0byBjaGVj
ayB0aGUgc2NyaXB0Lgo+IAo+IEkgdGhpbmsgdGhlIG9ubHkgaXNzdWUgcmVtYWluaW5nIGlzIGZp
bmFsaXppbmcgdGhlIG1hcHBpbmcgb2YKPiBwbGF0Zm9ybXMgdG8gc3ViZGlycy4gV2hhdCBJIGhh
dmUgY3VycmVudGx5IGlzIGEgbWl4dHVyZSBvZiBTb0MKPiBmYW1pbGllcyBhbmQgdmVuZG9ycy4g
VGhlIG1vc3Qgbm90YWJsZSBhcmUgYWxsIHRoZSBGcmVlc2NhbGUvTlhQCj4gcGxhdGZvcm1zLCBw
eGEsIHNvY2ZwZ2EsIGFuZCBzdG0zMi4gSXQncyBub3QgY29uc2lzdGVudCB3aXRoIGFybTY0Cj4g
ZWl0aGVyLiBPbmNlIHRoYXQncyBmaW5hbGl6ZWQsIEkgc3RpbGwgbmVlZCB0byBnbyB1cGRhdGUg
TUFJTlRBSU5FUlMuCj4gCj4gSGVyZSdzIHRoZSBjdXJyZW50IG1hcHBpbmc6Cj4gCj4gdmVuZG9y
X21hcCA9IHsKPiAgICAnYWxwaGFzY2FsZScgOiAnYWxwaGFzY2FsZScsCj4gICAgJ2FscGluZScg
OiAnYWxwaW5lJywKPiAgICAnYXJ0cGVjJyA6ICdheGlzJywKPiAgICAnYXhtJyA6ICdsc2knLAo+
ICAgICdjeDknIDogJ2NueHQnLAo+ICAgICdlY3gnIDogJ2NhbHhlZGEnLAo+ICAgICdoaWdoYmFu
aycgOiAnY2FseGVkYScsCj4gICAgJ2VwNycgOiAnY2lycnVzJywKPiAgICAnbXhzJzogJ214cycs
Cj4gICAgJ2lteDIzJzogJ214cycsCj4gICAgJ2lteDI4JzogJ214cycsCj4gICAgJ3N1bicgOiAn
YWxsd2lubmVyJywKPiAgICAnaW14JzogJ2lteCcsCj4gICAgJ2U2JyA6ICdpbXgnLAo+ICAgICdl
NycgOiAnaW14JywKPiAgICAnbWJhNicgOiAnaW14JywKPiAgICAnbHMnOiAnZnNsJywKPiAgICAn
dmYnOiAnZnNsJywKPiAgICAncWNvbSc6ICdxY29tJywKPiAgICAnYW0zJyA6ICd0aScsCj4gICAg
J2FtNCcgOiAndGknLAo+ICAgICdhbTUnIDogJ3RpJywKPiAgICAnZHJhJyA6ICd0aScsCj4gICAg
J2tleXN0b25lJyA6ICd0aScsCj4gICAgJ29tYXAnIDogJ3RpJywKPiAgICAnY29tcHVsYWInIDog
J3RpJywKPiAgICAnbG9naWNwZCcgOiAndGknLAo+ICAgICdlbHBpZGEnIDogJ3RpJywKPiAgICAn
bW90b3JvbGEnIDogJ3RpJywKPiAgICAndHdsJyA6ICd0aScsCj4gICAgJ2RhJyA6ICd0aScsCj4g
ICAgJ2RtJyA6ICd0aScsCj4gICAgJ25zcGlyZScgOiAnbnNwaXJlJywKPiAgICAnYXJtYWRhJyA6
ICdtYXJ2ZWxsJywKPiAgICAnZG92ZScgOiAnbWFydmVsbCcsCj4gICAgJ2tpcmt3b29kJyA6ICdt
YXJ2ZWxsJywKPiAgICAnb3Jpb24nIDogJ21hcnZlbGwnLAo+ICAgICdtdmVidScgOiAnbWFydmVs
bCcsCj4gICAgJ21tcCcgOiAnbWFydmVsbCcsCj4gICAgJ2JlcmxpbicgOiAnYmVybGluJywKPiAg
ICAncHhhMicgOiAncHhhJywKPiAgICAncHhhMycgOiAncHhhJywKPiAgICAncHhhJyA6ICdtYXJ2
ZWxsJywKPiAgICAnYXJtLScgOiAnYXJtJywKPiAgICAnaW50ZWcnIDogJ2FybScsCj4gICAgJ21w
cycgOiAnYXJtJywKPiAgICAndmUnIDogJ2FybScsCj4gICAgJ2FzcGVlZCcgOiAnYXNwZWVkJywK
PiAgICAnYXN0MicgOiAnYXNwZWVkJywKPiAgICAnZmFjZWJvb2snIDogJ2FzcGVlZCcsCj4gICAg
J2libScgOiAnYXNwZWVkJywKPiAgICAnb3BlbmJtYycgOiAnYXNwZWVkJywKPiAgICAnZW43JyA6
ICdhaXJvaGEnLAo+ICAgICdhdDkxJyA6ICdtaWNyb2NoaXAnLAo+ICAgICdzYW1hJyA6ICdtaWNy
b2NoaXAnLAo+ICAgICdzYW05JyA6ICdtaWNyb2NoaXAnLAo+ICAgICd1c2JfJyA6ICdtaWNyb2No
aXAnLAo+ICAgICd0bnlfJyA6ICdtaWNyb2NoaXAnLAo+ICAgICdtcGExNjAwJyA6ICdtaWNyb2No
aXAnLAo+ICAgICdhbmltZW9faXAnIDogJ21pY3JvY2hpcCcsCj4gICAgJ2Frcy1jZHUnIDogJ21p
Y3JvY2hpcCcsCj4gICAgJ2V0aGVybnV0NScgOiAnbWljcm9jaGlwJywKPiAgICAnZXZrLXBybzMn
IDogJ21pY3JvY2hpcCcsCj4gICAgJ3BtOWc0NScgOiAnbWljcm9jaGlwJywKPiAgICAnZ2U4Nicg
OiAnbWljcm9jaGlwJywKPiAgICAnYmNtJyA6ICdicmNtJywKPiAgICAnZXh5bm9zJyA6ICdzYW1z
dW5nJywKPiAgICAnczNjJyA6ICdzYW1zdW5nJywKPiAgICAnczVwJyA6ICdzYW1zdW5nJywKPiAg
ICAnZ2VtaW5pJyA6ICdnZW1pbmknLAo+ICAgICdoaTMnIDogJ2hpc2lsaWNvbicsCj4gICAgJ2hp
cCcgOiAnaGlzaWxpY29uJywKPiAgICAnaGlzaScgOiAnaGlzaWxpY29uJywKPiAgICAnc2Q1JyA6
ICdoaXNpbGljb24nLAo+ICAgICdocGUnIDogJ2hwZScsCj4gICAgJ2ludGVsJzogJ2ludGVsJywK
PiAgICAnbXQnIDogJ21lZGlhdGVrJywKPiAgICAnbWVzb24nIDogJ21lc29uJywKCuKAmG1lc29u
4oCZIDog4oCYYW1sb2dpY+KAmSwKCl4gdG8gbWF0Y2ggdGhlIFNvQyB2ZW5kb3IgbmFtZSAoYW5k
IGFybTY0KQoKQ2hyaXN0aWFuCgo+ICAgICdtb3hhJyA6ICdtb3hhJywKPiAgICAnbXN0YXInIDog
J21zdGFyJywKPiAgICAnbnV2bycgOiAnbnV2b3RvbicsCj4gICAgJ2xwYycgOiAnbHBjJywKPiAg
ICAnbGFuOTYnIDogJ21pY3JvY2hpcCcsCj4gICAgJ293bCcgOiAnYWN0aW9ucycsCj4gICAgJ294
OCcgOiAnb3hzZW1pJywKPiAgICAncmRhJyA6ICdyZGEnLAo+ICAgICdydGQnIDogJ3JlYWx0ZWsn
LAo+ICAgICdyNycgOiAncmVuZXNhcycsCj4gICAgJ3I4JyA6ICdyZW5lc2FzJywKPiAgICAncjkn
IDogJ3JlbmVzYXMnLAo+ICAgICdlbWV2MicgOiAncmVuZXNhcycsCj4gICAgJ3NoNzNhJyA6ICdy
ZW5lc2FzJywKPiAgICAnZ3ItJyA6ICdyZW5lc2FzJywKPiAgICAnaXdnJyA6ICdyZW5lc2FzJywK
PiAgICAncmsnIDogJ3JvY2tjaGlwJywKPiAgICAncnYxMScgOiAncm9ja2NoaXAnLAo+ICAgICdy
b2NrY2hpcCcgOiAncm9ja2NoaXAnLAo+ICAgICdzb2NmcGdhJyA6ICdzb2NmcGdhJywKPiAgICAn
c3RtJyA6ICdzdG0zMicsCj4gICAgJ3N0aScgOiAnc3RpJywKPiAgICAnc3QtcGluJyA6ICdzdGkn
LAo+ICAgICdzdGUnIDogJ3N0LWVyaWNzc29uJywKPiAgICAnc3BlYXInIDogJ3NwZWFyJywKPiAg
ICAnYXhwJyA6ICdhbGx3aW5uZXInLAo+ICAgICd0ZWdyYScgOiAnbnZpZGlhJywKPiAgICAnbWls
YmVhdXQnIDogJ3NvY2lvbmV4dCcsCj4gICAgJ3VuaXBoJyA6ICdzb2Npb25leHQnLAo+ICAgICd2
dDg1MDAnIDogJ3Z0ODUwMCcsCj4gICAgJ3dtOCcgOiAndnQ4NTAwJywKPiAgICAneGVuJyA6ICd4
ZW4nLAo+ICAgICd6eCcgOiAnenRlJywKPiAgICAnenlucScgOiAneGlsaW54JywKPiB9Cj4gCj4g
Um9iCj4gCj4gWzFdIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9yb2JoL2xpbnV4LmdpdCBhcm0tZHRzLW1vdmUtdjIKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
Cj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
