Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E576F500D
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 08:24:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEC3FC6A611;
	Wed,  3 May 2023 06:24:36 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70058C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 22:52:26 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4ec8148f73eso5157945e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 May 2023 15:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683067945; x=1685659945;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T1p8PAJD9DFCngojw0T3kSd1c2uyqBORxfNEmDK3GJ4=;
 b=BUUnQw61aCluaeaOfOjylr17lq4wyiS3svEJzNGaImPvwBFbxjY1AYjKa65LSPa2ym
 yE16k3jpuP3N8wCSlIVKGAALWKur7gs6Ffzu8U/kGAiuA1Xyx/x2hK/JJfWNLEFbZFh+
 gw5Uv9OoWoi9etQy1IAyVFsO7YWXlAUhhQim+LNTWB6y3zMhsYaevaqfbTuzGPLNMccY
 J+vqS7x9RyTltzOUQDkaayM18bum3WFZAKA4wqgFiMMBPsbYfXaNiW1/rSr4VdyK3Fqn
 5j1I0Zeq+WoDj447GF++RwHlJ/hGKjEKpd2ivZT8M021uOxvON7tTCA8VLC+2Vt7SgLR
 uLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683067945; x=1685659945;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T1p8PAJD9DFCngojw0T3kSd1c2uyqBORxfNEmDK3GJ4=;
 b=bJaJUVSOhkc+GW9K4jt8MzC/mZv9x8YuGgBqoH161Iw8TBl/d063tC78mLfnzdlepH
 fdmu8zz8fNEdsySxot0kyXTjjL55QnT88WbuHX1Rt7ATM5Mgbzn6odMli2W/C+0w3nKP
 0/KE1eUFclbs5/Eb9ZhRBUnUzIbc6KCiBsG7gJx6Tkp9cL9BC6gJOm2NuIWCj4BpsTbC
 pH7MQ01cmLscqAJJPDezBOpej/jCpc6Kk+8Y4t6lUoJC5MEdIYSx4RpJZAYcyv020FWm
 MuaUy4y2Pr67LmyZ+RwgNA0p4udF87x4eDB/Cu8jPHrf+rW7tvCAhf2xt7LG93gdpJ3X
 QH4g==
X-Gm-Message-State: AC+VfDwkTwpzShWixyseOqQh9E0BwkdJBndp6spazLE6g7iW5tF5FSBd
 Gu62eUKhTGmFaif8x3ku+RofZw==
X-Google-Smtp-Source: ACHHUZ6Oo6CNJusINV9/L7Xt1q+0o1hyr6U1jjDYvnM0ZlUDdwA1vrQ5KYtmvDXiiUxPR0FKQ1HT5g==
X-Received: by 2002:a19:c204:0:b0:4f1:223c:dc83 with SMTP id
 l4-20020a19c204000000b004f1223cdc83mr355945lfc.48.1683067945539; 
 Tue, 02 May 2023 15:52:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r16-20020ac24d10000000b004ddaea30ba6sm5607156lfi.235.2023.05.02.15.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 15:52:24 -0700 (PDT)
Message-ID: <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org>
Date: Wed, 3 May 2023 01:52:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
X-Mailman-Approved-At: Wed, 03 May 2023 06:24:36 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMDIvMDUvMjAyMyAyMjo0MCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVHVlLCBNYXkgMiwg
MjAyMyBhdCAzOjE14oCvQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4+
Cj4+IE9uIFR1ZSwgQXByIDI1LCAyMDIzLCBhdCAxNzo1NywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+
PiBPbiBUdWUsIEFwciAyNSwgMjAyMyBhdCAyOjI44oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4+Pgo+Pj4+IERvZXMgeW91ciBzY3JpcHQgYWxz
byBjYXRlciBmb3IgLmR0cyBmaWxlcyBub3QgbWF0Y2hpbmcgYW55IHBhdHRlcm4sCj4+Pj4gYnV0
IGluY2x1ZGluZyBhIC5kdHNpIGZpbGUgdGhhdCBkb2VzIG1hdGNoIGEgcGF0dGVybj8KPj4+Cj4+
PiBJIGFzc3VtZSBJIGJ1aWx0IGV2ZXJ5dGhpbmcgYWZ0ZXIgbW92aW5nLCBidXQgbWF5YmUgbm90
Li4uCj4+Pgo+Pj4gVGhhdCdzIGFsbCBqdXN0ICJkZXRhaWxzIi4gRmlyc3QsIHdlIG5lZWQgYWdy
ZWVtZW50IG9uIGEpIG1vdmluZwo+Pj4gdGhpbmdzIHRvIHN1YmRpcnMgYW5kIGIpIGRvaW5nIGl0
IDEtYnktMSBvciBhbGwgYXQgb25jZS4gU28gZmFyIHdlJ3ZlCj4+PiBiZWVuIHN0dWNrIG9uIGEp
IGZvciBiZWluZyAndG9vIG11Y2ggY2h1cm4nLgo+Pgo+PiBTb3JyeSBmb3IgbWlzc2luZyBtb3N0
IG9mIHRoZSBkaXNjdXNzaW9uIGxhc3Qgd2Vlay4gVGhlIHNjcmlwdCBzb3VuZHMKPj4gZmluZSB0
byBtZSwgdGhlIG9ubHkgcmVhc29uIEkgZGlkbid0IHdhbnQgdG8gZG8gdGhpcyBpbiB0aGUgcGFz
dCBpcyB0aGF0Cj4+IHdlIGhhZCB0aGUgcGxhbiB0byBtb3ZlIHBsYXRmb3JtcyBvdXQgb2YgdGhl
IGtlcm5lbCB0cmVlIHRvIGFuIGV4dGVybmFsCj4+IHJlcG9zaXRvcnkgYW5kIEkgd2FudGVkIHRv
IGRvIHRoaXMgcGxhdGZvcm0gYXQgYSB0aW1lIGFuZCBhbHNvIG9ubHkgbW92ZQo+PiBlYWNoIG9u
ZSBvbmNlLiBJIGRvbid0IHRoaW5rIHRoYXQgaXMgZ29pbmcgdG8gaGFwcGVuIGFueXRpbWUgc29v
biBub3csCj4+IHNvIGxldCdzIGp1c3QgZG8geW91ciBzY3JpcHQuCj4+Cj4+IENhbiB5b3Ugc2Vu
ZCBtZSB0aGUgc2NyaXB0IGFuZC9vciBhIHB1bGwgcmVxdWVzdCBvZiB0aGUgcmVzdWx0aW5nCj4+
IHRyZWUgYmFzZWQgb24gbXkgc29jL2R0IGJyYW5jaD8gRXZlcnl0aGluZyBpcyBtZXJnZWQgdXBz
dHJlYW0sCj4+IGFuZCBJIHRoaW5rIGdpdC1tZXJnZSB3b3VsZCBoYW5kbGUgdGhlIHJlbWFpbmlu
ZyBtZXJnZXMgd2l0aCBhbnkKPj4gb3RoZXIgY2hhbmdlcyBpbiBtYWlubGluZS4KPiAKPiBJJ3Zl
IGR1c3RlZCBvZmYgbXkgc2NyaXB0IGFuZCBtYWRlIGEgYnJhbmNoWzFdIHdpdGggdGhlIHJlc3Vs
dC4KPiBUaGVyZSdzIGp1c3QgYSBjb3VwbGUgb2YgZml4ZXMgbmVlZGVkIGFmdGVyIHRoZSBzY3Jp
cHQgaXMgcnVuIChzZWUgdGhlCj4gdG9wIGNvbW1pdCkuIFRoZSBjcm9zcyBhcmNoIGluY2x1ZGVz
IGFyZSBhbGwgZml4ZWQgdXAgYnkgdGhlIHNjcmlwdC4KPiBkdGJzX2luc3RhbGwgbWFpbnRhaW5z
IGEgZmxhdCBpbnN0YWxsLiBJIGNvbXBhcmVkIHRoZSBudW1iZXIgb2YgLmR0YnMKPiBiZWZvcmUg
YW5kIGFmdGVyIHRvIGNoZWNrIHRoZSBzY3JpcHQuCj4gCj4gSSB0aGluayB0aGUgb25seSBpc3N1
ZSByZW1haW5pbmcgaXMgZmluYWxpemluZyB0aGUgbWFwcGluZyBvZgo+IHBsYXRmb3JtcyB0byBz
dWJkaXJzLiBXaGF0IEkgaGF2ZSBjdXJyZW50bHkgaXMgYSBtaXh0dXJlIG9mIFNvQwo+IGZhbWls
aWVzIGFuZCB2ZW5kb3JzLiBUaGUgbW9zdCBub3RhYmxlIGFyZSBhbGwgdGhlIEZyZWVzY2FsZS9O
WFAKPiBwbGF0Zm9ybXMsIHB4YSwgc29jZnBnYSwgYW5kIHN0bTMyLiBJdCdzIG5vdCBjb25zaXN0
ZW50IHdpdGggYXJtNjQKPiBlaXRoZXIuIE9uY2UgdGhhdCdzIGZpbmFsaXplZCwgSSBzdGlsbCBu
ZWVkIHRvIGdvIHVwZGF0ZSBNQUlOVEFJTkVSUy4KPiAKPiBIZXJlJ3MgdGhlIGN1cnJlbnQgbWFw
cGluZzoKPiAKPiB2ZW5kb3JfbWFwID0gewo+ICAgICAgJ2FscGhhc2NhbGUnIDogJ2FscGhhc2Nh
bGUnLAo+ICAgICAgJ2FscGluZScgOiAnYWxwaW5lJywKPiAgICAgICdhcnRwZWMnIDogJ2F4aXMn
LAo+ICAgICAgJ2F4bScgOiAnbHNpJywKPiAgICAgICdjeDknIDogJ2NueHQnLAo+ICAgICAgJ2Vj
eCcgOiAnY2FseGVkYScsCj4gICAgICAnaGlnaGJhbmsnIDogJ2NhbHhlZGEnLAo+ICAgICAgJ2Vw
NycgOiAnY2lycnVzJywKPiAgICAgICdteHMnOiAnbXhzJywKPiAgICAgICdpbXgyMyc6ICdteHMn
LAo+ICAgICAgJ2lteDI4JzogJ214cycsCj4gICAgICAnc3VuJyA6ICdhbGx3aW5uZXInLAo+ICAg
ICAgJ2lteCc6ICdpbXgnLAo+ICAgICAgJ2U2JyA6ICdpbXgnLAo+ICAgICAgJ2U3JyA6ICdpbXgn
LAo+ICAgICAgJ21iYTYnIDogJ2lteCcsCj4gICAgICAnbHMnOiAnZnNsJywKPiAgICAgICd2Zic6
ICdmc2wnLAo+ICAgICAgJ3Fjb20nOiAncWNvbScsCj4gICAgICAnYW0zJyA6ICd0aScsCj4gICAg
ICAnYW00JyA6ICd0aScsCj4gICAgICAnYW01JyA6ICd0aScsCj4gICAgICAnZHJhJyA6ICd0aScs
Cj4gICAgICAna2V5c3RvbmUnIDogJ3RpJywKPiAgICAgICdvbWFwJyA6ICd0aScsCj4gICAgICAn
Y29tcHVsYWInIDogJ3RpJywKPiAgICAgICdsb2dpY3BkJyA6ICd0aScsCj4gICAgICAnZWxwaWRh
JyA6ICd0aScsCj4gICAgICAnbW90b3JvbGEnIDogJ3RpJywKPiAgICAgICd0d2wnIDogJ3RpJywK
PiAgICAgICdkYScgOiAndGknLAo+ICAgICAgJ2RtJyA6ICd0aScsCj4gICAgICAnbnNwaXJlJyA6
ICduc3BpcmUnLAo+ICAgICAgJ2FybWFkYScgOiAnbWFydmVsbCcsCj4gICAgICAnZG92ZScgOiAn
bWFydmVsbCcsCj4gICAgICAna2lya3dvb2QnIDogJ21hcnZlbGwnLAo+ICAgICAgJ29yaW9uJyA6
ICdtYXJ2ZWxsJywKPiAgICAgICdtdmVidScgOiAnbWFydmVsbCcsCj4gICAgICAnbW1wJyA6ICdt
YXJ2ZWxsJywKPiAgICAgICdiZXJsaW4nIDogJ2JlcmxpbicsCj4gICAgICAncHhhMicgOiAncHhh
JywKPiAgICAgICdweGEzJyA6ICdweGEnLAo+ICAgICAgJ3B4YScgOiAnbWFydmVsbCcsCgpJJ2Qg
cXVlc3Rpb24gaWYgaXQgbWFrZXMgc2Vuc2UgdG8gc3BsaXQgdGhlIHB4YSBsaW5lLiBZZXMsIGl0
IHdhcyBzb2xkIApieSBJbnRlbCB0byBNYXJ2ZWxsLCBidXQgSUlSQyB0aGUgZGV2aWNlcyBzdGls
bCBoYWQgc29tZSBpbmhlcml0YW5jZS4gClNvLCBpZiB3ZSBoYXZlIHRoZSAncHhhJyBzdWJkaXIs
IEknZCBtb3ZlIE1hcnZlbGwgUFhBcyB0byB0aGF0IGRpciB0b28uCgo+ICAgICAgJ2FybS0nIDog
J2FybScsCj4gICAgICAnaW50ZWcnIDogJ2FybScsCj4gICAgICAnbXBzJyA6ICdhcm0nLAo+ICAg
ICAgJ3ZlJyA6ICdhcm0nLAo+ICAgICAgJ2FzcGVlZCcgOiAnYXNwZWVkJywKPiAgICAgICdhc3Qy
JyA6ICdhc3BlZWQnLAo+ICAgICAgJ2ZhY2Vib29rJyA6ICdhc3BlZWQnLAo+ICAgICAgJ2libScg
OiAnYXNwZWVkJywKPiAgICAgICdvcGVuYm1jJyA6ICdhc3BlZWQnLAo+ICAgICAgJ2VuNycgOiAn
YWlyb2hhJywKPiAgICAgICdhdDkxJyA6ICdtaWNyb2NoaXAnLAo+ICAgICAgJ3NhbWEnIDogJ21p
Y3JvY2hpcCcsCj4gICAgICAnc2FtOScgOiAnbWljcm9jaGlwJywKPiAgICAgICd1c2JfJyA6ICdt
aWNyb2NoaXAnLAo+ICAgICAgJ3RueV8nIDogJ21pY3JvY2hpcCcsCj4gICAgICAnbXBhMTYwMCcg
OiAnbWljcm9jaGlwJywKPiAgICAgICdhbmltZW9faXAnIDogJ21pY3JvY2hpcCcsCj4gICAgICAn
YWtzLWNkdScgOiAnbWljcm9jaGlwJywKPiAgICAgICdldGhlcm51dDUnIDogJ21pY3JvY2hpcCcs
Cj4gICAgICAnZXZrLXBybzMnIDogJ21pY3JvY2hpcCcsCj4gICAgICAncG05ZzQ1JyA6ICdtaWNy
b2NoaXAnLAo+ICAgICAgJ2dlODYnIDogJ21pY3JvY2hpcCcsCj4gICAgICAnYmNtJyA6ICdicmNt
JywKPiAgICAgICdleHlub3MnIDogJ3NhbXN1bmcnLAo+ICAgICAgJ3MzYycgOiAnc2Ftc3VuZycs
Cj4gICAgICAnczVwJyA6ICdzYW1zdW5nJywKPiAgICAgICdnZW1pbmknIDogJ2dlbWluaScsCj4g
ICAgICAnaGkzJyA6ICdoaXNpbGljb24nLAo+ICAgICAgJ2hpcCcgOiAnaGlzaWxpY29uJywKPiAg
ICAgICdoaXNpJyA6ICdoaXNpbGljb24nLAo+ICAgICAgJ3NkNScgOiAnaGlzaWxpY29uJywKPiAg
ICAgICdocGUnIDogJ2hwZScsCj4gICAgICAnaW50ZWwnOiAnaW50ZWwnLAo+ICAgICAgJ210JyA6
ICdtZWRpYXRlaycsCj4gICAgICAnbWVzb24nIDogJ21lc29uJywKPiAgICAgICdtb3hhJyA6ICdt
b3hhJywKPiAgICAgICdtc3RhcicgOiAnbXN0YXInLAo+ICAgICAgJ251dm8nIDogJ251dm90b24n
LAo+ICAgICAgJ2xwYycgOiAnbHBjJywKPiAgICAgICdsYW45NicgOiAnbWljcm9jaGlwJywKPiAg
ICAgICdvd2wnIDogJ2FjdGlvbnMnLAo+ICAgICAgJ294OCcgOiAnb3hzZW1pJywKPiAgICAgICdy
ZGEnIDogJ3JkYScsCj4gICAgICAncnRkJyA6ICdyZWFsdGVrJywKPiAgICAgICdyNycgOiAncmVu
ZXNhcycsCj4gICAgICAncjgnIDogJ3JlbmVzYXMnLAo+ICAgICAgJ3I5JyA6ICdyZW5lc2FzJywK
PiAgICAgICdlbWV2MicgOiAncmVuZXNhcycsCj4gICAgICAnc2g3M2EnIDogJ3JlbmVzYXMnLAo+
ICAgICAgJ2dyLScgOiAncmVuZXNhcycsCj4gICAgICAnaXdnJyA6ICdyZW5lc2FzJywKPiAgICAg
ICdyaycgOiAncm9ja2NoaXAnLAo+ICAgICAgJ3J2MTEnIDogJ3JvY2tjaGlwJywKPiAgICAgICdy
b2NrY2hpcCcgOiAncm9ja2NoaXAnLAo+ICAgICAgJ3NvY2ZwZ2EnIDogJ3NvY2ZwZ2EnLAo+ICAg
ICAgJ3N0bScgOiAnc3RtMzInLAo+ICAgICAgJ3N0aScgOiAnc3RpJywKPiAgICAgICdzdC1waW4n
IDogJ3N0aScsCj4gICAgICAnc3RlJyA6ICdzdC1lcmljc3NvbicsCj4gICAgICAnc3BlYXInIDog
J3NwZWFyJywKPiAgICAgICdheHAnIDogJ2FsbHdpbm5lcicsCj4gICAgICAndGVncmEnIDogJ252
aWRpYScsCj4gICAgICAnbWlsYmVhdXQnIDogJ3NvY2lvbmV4dCcsCj4gICAgICAndW5pcGgnIDog
J3NvY2lvbmV4dCcsCj4gICAgICAndnQ4NTAwJyA6ICd2dDg1MDAnLAo+ICAgICAgJ3dtOCcgOiAn
dnQ4NTAwJywKPiAgICAgICd4ZW4nIDogJ3hlbicsCj4gICAgICAnengnIDogJ3p0ZScsCj4gICAg
ICAnenlucScgOiAneGlsaW54JywKPiB9Cj4gCj4gUm9iCj4gCj4gWzFdIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yb2JoL2xpbnV4LmdpdCBhcm0tZHRzLW1v
dmUtdjIKCi0tIApXaXRoIGJlc3Qgd2lzaGVzCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
