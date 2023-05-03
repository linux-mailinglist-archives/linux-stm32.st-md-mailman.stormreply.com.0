Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDE16F4E4C
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 03:04:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B9C7C6A5FD;
	Wed,  3 May 2023 01:04:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72683C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 01:04:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AA2E629D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 01:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B33C433A7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 01:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683075872;
 bh=3tzUPFXqJgNCRsublfj+ZgGaTs7KzeK4/lauS5NgXbw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QoGLyyHrVl2A+YTplbrnYiMEIz6wk+jP9SV8dz5UCtY76MWzNfxcDGsWDt7XzaFbR
 Xr4LoafVLAa94EjThKoFMtXLMkvCzIlI51WqQfPmq+42ZRGmwhqCuG73rtNFS7wUkc
 +fEXrSTR/j+xouT44ufNnuT7bR771W/YBDuqC0FtyyPhTIzbPY4lJHmmC4JrKp+LqL
 VUXrPWi4q/OV1Ezdi6st//MbXuMfXSMqmAVFzsUiMTdstEd3wZmJZlVLjAXQcv6nMA
 7k3X1222URsa6zFwyiuGaddxH/mAzA1qAvda1W1zjhNGD1pbVwdRUepxFlVrtRcox8
 yQNSGRSC9H6BA==
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ac70c975fcso2907621fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 May 2023 18:04:32 -0700 (PDT)
X-Gm-Message-State: AC+VfDxlxNwSnNCoGZc1sLArj/Ds+NrpZWit/ZUmGhRA1E4zVdUlQb6W
 qskSl9jSAdpUK9AdtZf2tlHDA5Ympfkl7AiD4Q==
X-Google-Smtp-Source: ACHHUZ4mSLqb1ExsMkOjNsdZYIFyOMFO5WWfDnvfwZvuM9fv3TyrxmQhN6hT67g4AYdNW/MVo7uZ6IBv6mL14dd4tuc=
X-Received: by 2002:a2e:8402:0:b0:2a8:d103:dc8 with SMTP id
 z2-20020a2e8402000000b002a8d1030dc8mr4705375ljg.2.1683075870337; Tue, 02 May
 2023 18:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
In-Reply-To: <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 May 2023 20:04:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
Message-ID: <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
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

T24gVHVlLCBNYXkgMiwgMjAyMyBhdCA2OjAy4oCvUE0gRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWlu
ZWxsaUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gNS8yLzIzIDEyOjQwLCBSb2IgSGVycmluZyB3
cm90ZToKPiA+IE9uIFR1ZSwgTWF5IDIsIDIwMjMgYXQgMzoxNeKAr0FNIEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+ID4+Cj4gPj4gT24gVHVlLCBBcHIgMjUsIDIwMjMsIGF0
IDE3OjU3LCBSb2IgSGVycmluZyB3cm90ZToKPiA+Pj4gT24gVHVlLCBBcHIgMjUsIDIwMjMgYXQg
MjoyOOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3Rl
Ogo+ID4+Pgo+ID4+Pj4gRG9lcyB5b3VyIHNjcmlwdCBhbHNvIGNhdGVyIGZvciAuZHRzIGZpbGVz
IG5vdCBtYXRjaGluZyBhbnkgcGF0dGVybiwKPiA+Pj4+IGJ1dCBpbmNsdWRpbmcgYSAuZHRzaSBm
aWxlIHRoYXQgZG9lcyBtYXRjaCBhIHBhdHRlcm4/Cj4gPj4+Cj4gPj4+IEkgYXNzdW1lIEkgYnVp
bHQgZXZlcnl0aGluZyBhZnRlciBtb3ZpbmcsIGJ1dCBtYXliZSBub3QuLi4KPiA+Pj4KPiA+Pj4g
VGhhdCdzIGFsbCBqdXN0ICJkZXRhaWxzIi4gRmlyc3QsIHdlIG5lZWQgYWdyZWVtZW50IG9uIGEp
IG1vdmluZwo+ID4+PiB0aGluZ3MgdG8gc3ViZGlycyBhbmQgYikgZG9pbmcgaXQgMS1ieS0xIG9y
IGFsbCBhdCBvbmNlLiBTbyBmYXIgd2UndmUKPiA+Pj4gYmVlbiBzdHVjayBvbiBhKSBmb3IgYmVp
bmcgJ3RvbyBtdWNoIGNodXJuJy4KPiA+Pgo+ID4+IFNvcnJ5IGZvciBtaXNzaW5nIG1vc3Qgb2Yg
dGhlIGRpc2N1c3Npb24gbGFzdCB3ZWVrLiBUaGUgc2NyaXB0IHNvdW5kcwo+ID4+IGZpbmUgdG8g
bWUsIHRoZSBvbmx5IHJlYXNvbiBJIGRpZG4ndCB3YW50IHRvIGRvIHRoaXMgaW4gdGhlIHBhc3Qg
aXMgdGhhdAo+ID4+IHdlIGhhZCB0aGUgcGxhbiB0byBtb3ZlIHBsYXRmb3JtcyBvdXQgb2YgdGhl
IGtlcm5lbCB0cmVlIHRvIGFuIGV4dGVybmFsCj4gPj4gcmVwb3NpdG9yeSBhbmQgSSB3YW50ZWQg
dG8gZG8gdGhpcyBwbGF0Zm9ybSBhdCBhIHRpbWUgYW5kIGFsc28gb25seSBtb3ZlCj4gPj4gZWFj
aCBvbmUgb25jZS4gSSBkb24ndCB0aGluayB0aGF0IGlzIGdvaW5nIHRvIGhhcHBlbiBhbnl0aW1l
IHNvb24gbm93LAo+ID4+IHNvIGxldCdzIGp1c3QgZG8geW91ciBzY3JpcHQuCj4gPj4KPiA+PiBD
YW4geW91IHNlbmQgbWUgdGhlIHNjcmlwdCBhbmQvb3IgYSBwdWxsIHJlcXVlc3Qgb2YgdGhlIHJl
c3VsdGluZwo+ID4+IHRyZWUgYmFzZWQgb24gbXkgc29jL2R0IGJyYW5jaD8gRXZlcnl0aGluZyBp
cyBtZXJnZWQgdXBzdHJlYW0sCj4gPj4gYW5kIEkgdGhpbmsgZ2l0LW1lcmdlIHdvdWxkIGhhbmRs
ZSB0aGUgcmVtYWluaW5nIG1lcmdlcyB3aXRoIGFueQo+ID4+IG90aGVyIGNoYW5nZXMgaW4gbWFp
bmxpbmUuCj4gPgo+ID4gSSd2ZSBkdXN0ZWQgb2ZmIG15IHNjcmlwdCBhbmQgbWFkZSBhIGJyYW5j
aFsxXSB3aXRoIHRoZSByZXN1bHQuCj4gPiBUaGVyZSdzIGp1c3QgYSBjb3VwbGUgb2YgZml4ZXMg
bmVlZGVkIGFmdGVyIHRoZSBzY3JpcHQgaXMgcnVuIChzZWUgdGhlCj4gPiB0b3AgY29tbWl0KS4g
VGhlIGNyb3NzIGFyY2ggaW5jbHVkZXMgYXJlIGFsbCBmaXhlZCB1cCBieSB0aGUgc2NyaXB0Lgo+
ID4gZHRic19pbnN0YWxsIG1haW50YWlucyBhIGZsYXQgaW5zdGFsbC4gSSBjb21wYXJlZCB0aGUg
bnVtYmVyIG9mIC5kdGJzCj4gPiBiZWZvcmUgYW5kIGFmdGVyIHRvIGNoZWNrIHRoZSBzY3JpcHQu
Cj4gPgo+ID4gSSB0aGluayB0aGUgb25seSBpc3N1ZSByZW1haW5pbmcgaXMgZmluYWxpemluZyB0
aGUgbWFwcGluZyBvZgo+ID4gcGxhdGZvcm1zIHRvIHN1YmRpcnMuIFdoYXQgSSBoYXZlIGN1cnJl
bnRseSBpcyBhIG1peHR1cmUgb2YgU29DCj4gPiBmYW1pbGllcyBhbmQgdmVuZG9ycy4gVGhlIG1v
c3Qgbm90YWJsZSBhcmUgYWxsIHRoZSBGcmVlc2NhbGUvTlhQCj4gPiBwbGF0Zm9ybXMsIHB4YSwg
c29jZnBnYSwgYW5kIHN0bTMyLiBJdCdzIG5vdCBjb25zaXN0ZW50IHdpdGggYXJtNjQKPiA+IGVp
dGhlci4gT25jZSB0aGF0J3MgZmluYWxpemVkLCBJIHN0aWxsIG5lZWQgdG8gZ28gdXBkYXRlIE1B
SU5UQUlORVJTLgo+ID4KPiA+IEhlcmUncyB0aGUgY3VycmVudCBtYXBwaW5nOgo+ID4KPiA+IHZl
bmRvcl9tYXAgPSB7Cj4gPiAgICAgICdhbHBoYXNjYWxlJyA6ICdhbHBoYXNjYWxlJywKPiA+ICAg
ICAgJ2FscGluZScgOiAnYWxwaW5lJywKPiA+ICAgICAgJ2FydHBlYycgOiAnYXhpcycsCj4gPiAg
ICAgICdheG0nIDogJ2xzaScsCj4gPiAgICAgICdjeDknIDogJ2NueHQnLAo+ID4gICAgICAnZWN4
JyA6ICdjYWx4ZWRhJywKPiA+ICAgICAgJ2hpZ2hiYW5rJyA6ICdjYWx4ZWRhJywKPiA+ICAgICAg
J2VwNycgOiAnY2lycnVzJywKPiA+ICAgICAgJ214cyc6ICdteHMnLAo+ID4gICAgICAnaW14MjMn
OiAnbXhzJywKPiA+ICAgICAgJ2lteDI4JzogJ214cycsCj4gPiAgICAgICdzdW4nIDogJ2FsbHdp
bm5lcicsCj4gPiAgICAgICdpbXgnOiAnaW14JywKPiA+ICAgICAgJ2U2JyA6ICdpbXgnLAo+ID4g
ICAgICAnZTcnIDogJ2lteCcsCj4gPiAgICAgICdtYmE2JyA6ICdpbXgnLAo+ID4gICAgICAnbHMn
OiAnZnNsJywKPiA+ICAgICAgJ3ZmJzogJ2ZzbCcsCj4gPiAgICAgICdxY29tJzogJ3Fjb20nLAo+
ID4gICAgICAnYW0zJyA6ICd0aScsCj4gPiAgICAgICdhbTQnIDogJ3RpJywKPiA+ICAgICAgJ2Ft
NScgOiAndGknLAo+ID4gICAgICAnZHJhJyA6ICd0aScsCj4gPiAgICAgICdrZXlzdG9uZScgOiAn
dGknLAo+ID4gICAgICAnb21hcCcgOiAndGknLAo+ID4gICAgICAnY29tcHVsYWInIDogJ3RpJywK
PiA+ICAgICAgJ2xvZ2ljcGQnIDogJ3RpJywKPiA+ICAgICAgJ2VscGlkYScgOiAndGknLAo+ID4g
ICAgICAnbW90b3JvbGEnIDogJ3RpJywKPiA+ICAgICAgJ3R3bCcgOiAndGknLAo+ID4gICAgICAn
ZGEnIDogJ3RpJywKPiA+ICAgICAgJ2RtJyA6ICd0aScsCj4gPiAgICAgICduc3BpcmUnIDogJ25z
cGlyZScsCj4gPiAgICAgICdhcm1hZGEnIDogJ21hcnZlbGwnLAo+ID4gICAgICAnZG92ZScgOiAn
bWFydmVsbCcsCj4gPiAgICAgICdraXJrd29vZCcgOiAnbWFydmVsbCcsCj4gPiAgICAgICdvcmlv
bicgOiAnbWFydmVsbCcsCj4gPiAgICAgICdtdmVidScgOiAnbWFydmVsbCcsCj4gPiAgICAgICdt
bXAnIDogJ21hcnZlbGwnLAo+ID4gICAgICAnYmVybGluJyA6ICdiZXJsaW4nLAo+ID4gICAgICAn
cHhhMicgOiAncHhhJywKPiA+ICAgICAgJ3B4YTMnIDogJ3B4YScsCj4gPiAgICAgICdweGEnIDog
J21hcnZlbGwnLAo+ID4gICAgICAnYXJtLScgOiAnYXJtJywKPiA+ICAgICAgJ2ludGVnJyA6ICdh
cm0nLAo+ID4gICAgICAnbXBzJyA6ICdhcm0nLAo+ID4gICAgICAndmUnIDogJ2FybScsCj4gPiAg
ICAgICdhc3BlZWQnIDogJ2FzcGVlZCcsCj4gPiAgICAgICdhc3QyJyA6ICdhc3BlZWQnLAo+ID4g
ICAgICAnZmFjZWJvb2snIDogJ2FzcGVlZCcsCj4gPiAgICAgICdpYm0nIDogJ2FzcGVlZCcsCj4g
PiAgICAgICdvcGVuYm1jJyA6ICdhc3BlZWQnLAo+ID4gICAgICAnZW43JyA6ICdhaXJvaGEnLAo+
ID4gICAgICAnYXQ5MScgOiAnbWljcm9jaGlwJywKPiA+ICAgICAgJ3NhbWEnIDogJ21pY3JvY2hp
cCcsCj4gPiAgICAgICdzYW05JyA6ICdtaWNyb2NoaXAnLAo+ID4gICAgICAndXNiXycgOiAnbWlj
cm9jaGlwJywKPiA+ICAgICAgJ3RueV8nIDogJ21pY3JvY2hpcCcsCj4gPiAgICAgICdtcGExNjAw
JyA6ICdtaWNyb2NoaXAnLAo+ID4gICAgICAnYW5pbWVvX2lwJyA6ICdtaWNyb2NoaXAnLAo+ID4g
ICAgICAnYWtzLWNkdScgOiAnbWljcm9jaGlwJywKPiA+ICAgICAgJ2V0aGVybnV0NScgOiAnbWlj
cm9jaGlwJywKPiA+ICAgICAgJ2V2ay1wcm8zJyA6ICdtaWNyb2NoaXAnLAo+ID4gICAgICAncG05
ZzQ1JyA6ICdtaWNyb2NoaXAnLAo+ID4gICAgICAnZ2U4NicgOiAnbWljcm9jaGlwJywKPiA+ICAg
ICAgJ2JjbScgOiAnYnJjbScsCj4KPiBIb3cgYWJvdXQgd2UgdXNlICdicm9hZGNvbScgaGVyZSwg
dG8gZm9sbG93IHdoYXQgYXJtNjQgZG9lcz8gSSBjb3VsZAo+IHJlbmFtZSBhcmNoL21pcHMvYm9v
dC9kdHMvYnJjbSB0byBhcmNoL21pcHMvYm9vdC9kdHMvYnJvYWRjb20gZm9yCj4gY29uc2lzdGVu
Y3ksIHRvbz8KCk9rYXksIHRob3VnaCBpZiBzdGFydGluZyBjbGVhbiBJJ2Qgc29tZXdoYXQgcHJl
ZmVyIHRvIHVzZSB0aGUgdmVuZG9yCnByZWZpeC4gSSBndWVzcyBzaW5jZSBhcm0gYW5kIGFybTY0
IHNoYXJlIGR0c2kgZmlsZXMsIHRoZXkgc2hvdWxkCm1hdGNoLgoKUm9iCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
