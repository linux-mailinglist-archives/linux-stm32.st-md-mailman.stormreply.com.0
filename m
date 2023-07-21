Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B175CF40
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 18:29:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 985BBC6B452;
	Fri, 21 Jul 2023 16:29:37 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DA94C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 16:29:36 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-76754b9eac0so202519185a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689956975; x=1690561775;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MCj4f/yqTqvC1Zfh8gaP5TMsrhfBrc1W+dHH5Na+xwg=;
 b=eDb8MvRcZ/ocaVOutwcjpC5W4QiIwzu61K6N4KTRKQxemrXBslXIrFHPzy9QHwUOT4
 oqEVnYiBTiOeQL3oTSP6HjI61ObacNFcuRHsBPyiY10CTMvqPTRkfNc6A1vKb7cFS4CZ
 ZWbRE/4bD5XV/Gn8TtSdUvqqlnQaRT7cDGf471jedUvmQArXrwHLbKAVxVFZHPTn284s
 A4RhG4ViLjX8n3dITdM7IX3NqvmwUOQKam3NHOHqBrqGdMxGq69SUvzrJjsCpcTiiSiZ
 7UFUkRGE3Bd2exW8+j0HbNagrf42KBAuyfTWZHdNfz9WNz6NqeTv101RvGTu4GkB6luv
 ulQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689956975; x=1690561775;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MCj4f/yqTqvC1Zfh8gaP5TMsrhfBrc1W+dHH5Na+xwg=;
 b=UKROhrHETLlcyZHOp5sb789bF88E50p9k1e48O3tiVhIVN/yuiKns9bg5bgshkGf3v
 jzMOYpL/nm8Sa0l3+LetDgj3tIkLUZKJqgBfzj+vhl+Vyr6pxkkD6CWoipusXPwvuMGy
 ngPjpw1l4uB5XJlLYkYyw2hVm1h6TZX+eFeMFDkfeYKp8fYR0Hqph4VULqkzcKba9vfR
 GJG4sBhD54O4k5z/YJIxsuzIg/D2OCbPG/p9Qeh86mcQq6NW9v0uYVuiYfq8QSw5HCRv
 NPSVKIy7vs13zH6HbtOn1DrTXuRZhD3Hxd56zg0On89B+yKhTiFXWzsFCEK1H8kgQiGN
 AjcA==
X-Gm-Message-State: ABy/qLYje8yMmFDGIbvniB/GZi/DThPblqjsmUoI9jqyK1/3KY+UDKUt
 jRDyTCJPOkAU9ZDbfLDL3+I=
X-Google-Smtp-Source: APBJJlEyWH2COTt0xU4de216+mzXeZPVL+8ty6G4n2U6Ab92rUovUUNSjJ0zaAZ73WBRseqgDOAZsg==
X-Received: by 2002:a05:620a:2545:b0:769:542:b3fd with SMTP id
 s5-20020a05620a254500b007690542b3fdmr504663qko.8.1689956975345; 
 Fri, 21 Jul 2023 09:29:35 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a05620a075b00b00765a7843382sm1201448qki.74.2023.07.21.09.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jul 2023 09:29:34 -0700 (PDT)
Message-ID: <4dbc07fa-e446-8694-3371-fa2d0432fbc6@gmail.com>
Date: Fri, 21 Jul 2023 09:29:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "Ng, Boon Khai" <boon.khai.ng@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Boon@ecsmtp.png.intel.com" <Boon@ecsmtp.png.intel.com>,
 "Khai@ecsmtp.png.intel.com" <Khai@ecsmtp.png.intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
 <20230721062617.9810-3-boon.khai.ng@intel.com>
 <cfba8fa4-47e5-7553-f40e-9e34b25d1405@kernel.org>
 <DM8PR11MB5751E5388AEFCFB80BCB483FC13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
 <7549a014-4f5e-cf87-f07d-c4980ab44dc1@gmail.com>
 <DM8PR11MB5751B68955275006A16E1C75C13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <DM8PR11MB5751B68955275006A16E1C75C13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
Cc: "Swee, Leong Ching" <leong.ching.swee@intel.com>, "G Thomas,
 Rohan" <rohan.g.thomas@intel.com>,
 Shevchenko Andriy <andriy.shevchenko@linux.intel.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, "Tham,
 Mun Yew" <mun.yew.tham@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 2/2] net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN Stripping
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

CgpPbiA3LzIxLzIwMjMgOToxMiBBTSwgTmcsIEJvb24gS2hhaSB3cm90ZToKPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBn
bWFpbC5jb20+Cj4+IFNlbnQ6IEZyaWRheSwgSnVseSAyMSwgMjAyMyAxMTo1OSBQTQo+PiBUbzog
TmcsIEJvb24gS2hhaSA8Ym9vbi5raGFpLm5nQGludGVsLmNvbT47IEtyenlzenRvZiBLb3psb3dz
a2kKPj4gPGtyemtAa2VybmVsLm9yZz47IEJvb25AZWNzbXRwLnBuZy5pbnRlbC5jb207IEtoYWlA
ZWNzbXRwLnBuZy5pbnRlbC5jb207Cj4+IE5nLCBCb29uIEtoYWkgPGJvb24ua2hhaS5uZ0BpbnRl
bC5jb20+OyBHaXVzZXBwZSBDYXZhbGxhcm8KPj4gPHBlcHBlLmNhdmFsbGFyb0BzdC5jb20+OyBB
bGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPjsKPj4gSm9zZSBB
YnJldSA8am9hYnJldUBzeW5vcHN5cy5jb20+OyBEYXZpZCBTIC4gTWlsbGVyIDxkYXZlbUBkYXZl
bWxvZnQubmV0PjsKPj4gRXJpYyBEdW1hemV0IDxlZHVtYXpldEBnb29nbGUuY29tPjsgSmFrdWIg
S2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz47Cj4+IFBhb2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0
LmNvbT47IE1heGltZSBDb3F1ZWxpbgo+PiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT47IG5l
dGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXN0bTMyQHN0LW1kLQo+PiBtYWlsbWFuLnN0b3Jt
cmVwbHkuY29tOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQo+
PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+IENjOiBTaGV2Y2hlbmtvLCBBbmRyaXkgPGFuZHJp
eS5zaGV2Y2hlbmtvQGludGVsLmNvbT47IFRoYW0sIE11biBZZXcKPj4gPG11bi55ZXcudGhhbUBp
bnRlbC5jb20+OyBTd2VlLCBMZW9uZyBDaGluZwo+PiA8bGVvbmcuY2hpbmcuc3dlZUBpbnRlbC5j
b20+OyBHIFRob21hcywgUm9oYW4KPj4gPHJvaGFuLmcudGhvbWFzQGludGVsLmNvbT47IFNoZXZj
aGVua28gQW5kcml5Cj4+IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4+IFN1
YmplY3Q6IFJlOiBbRW5hYmxlIERlc2lnbndhcmUgWEdNQUMgVkxBTiBTdHJpcHBpbmcgRmVhdHVy
ZSAyLzJdIG5ldDoKPj4gc3RtbWFjOiBkd3hnbWFjMjogQWRkIHN1cHBvcnQgZm9yIEhXLWFjY2Vs
ZXJhdGVkIFZMQU4gU3RyaXBwaW5nCj4+Cj4+Cj4+Cj4+IE9uIDcvMjEvMjAyMyA4OjMwIEFNLCBO
ZywgQm9vbiBLaGFpIHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4g
RnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+Pj4+IFNlbnQ6IEZy
aWRheSwgSnVseSAyMSwgMjAyMyA2OjExIFBNCj4+Pj4gVG86IEJvb25AZWNzbXRwLnBuZy5pbnRl
bC5jb207IEtoYWlAZWNzbXRwLnBuZy5pbnRlbC5jb207ICJOZwo+Pj4+IDxib29uLmtoYWkubmci
QGludGVsLmNvbTsgR2l1c2VwcGUgQ2F2YWxsYXJvCj4+Pj4gPHBlcHBlLmNhdmFsbGFyb0BzdC5j
b20+OyBBbGV4YW5kcmUgVG9yZ3VlCj4+Pj4gPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+
OyBKb3NlIEFicmV1IDxqb2FicmV1QHN5bm9wc3lzLmNvbT47Cj4+Pj4gRGF2aWQgUyAuIE1pbGxl
ciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47IEVyaWMgRHVtYXpldAo+Pj4+IDxlZHVtYXpldEBnb29n
bGUuY29tPjsgSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz47IFBhb2xvIEFiZW5pCj4+
Pj4gPHBhYmVuaUByZWRoYXQuY29tPjsgTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJA
Z21haWwuY29tPjsKPj4+PiBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1zdG0zMkBzdC0g
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbTsKPj4+PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGxpbnV4LSBrZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+Pj4gQ2M6IE5nLCBC
b29uIEtoYWkgPGJvb24ua2hhaS5uZ0BpbnRlbC5jb20+OyBTaGV2Y2hlbmtvLCBBbmRyaXkKPj4+
PiA8YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29tPjsgVGhhbSwgTXVuIFlldwo+Pj4+IDxtdW4u
eWV3LnRoYW1AaW50ZWwuY29tPjsgU3dlZSwgTGVvbmcgQ2hpbmcKPj4+PiA8bGVvbmcuY2hpbmcu
c3dlZUBpbnRlbC5jb20+OyBHIFRob21hcywgUm9oYW4KPj4+PiA8cm9oYW4uZy50aG9tYXNAaW50
ZWwuY29tPjsgU2hldmNoZW5rbyBBbmRyaXkKPj4+PiA8YW5kcml5LnNoZXZjaGVua29AbGludXgu
aW50ZWwuY29tPgo+Pj4+IFN1YmplY3Q6IFJlOiBbRW5hYmxlIERlc2lnbndhcmUgWEdNQUMgVkxB
TiBTdHJpcHBpbmcgRmVhdHVyZSAyLzJdIG5ldDoKPj4+PiBzdG1tYWM6IGR3eGdtYWMyOiBBZGQg
c3VwcG9ydCBmb3IgSFctYWNjZWxlcmF0ZWQgVkxBTiBTdHJpcHBpbmcKPj4+Pgo+Pj4+IE9uIDIx
LzA3LzIwMjMgMDg6MjYsIEJvb25AZWNzbXRwLnBuZy5pbnRlbC5jb20gd3JvdGU6Cj4+Pj4+IEZy
b206IEJvb24gS2hhaSBOZyA8Ym9vbi5raGFpLm5nQGludGVsLmNvbT4KPj4+Pj4KPj4+Pj4gQ3Vy
cmVudGx5LCBWTEFOIHRhZyBzdHJpcHBpbmcgaXMgZG9uZSBieSBzb2Z0d2FyZSBkcml2ZXIgaW4K
Pj4+Pj4gc3RtbWFjX3J4X3ZsYW4oKS4gVGhpcyBwYXRjaCBpcyB0byBBZGQgc3VwcG9ydCBmb3Ig
VkxBTiB0YWcKPj4+Pj4gc3RyaXBwaW5nIGJ5IHRoZSBNQUMgaGFyZHdhcmUgYW5kIE1BQyBkcml2
ZXJzIHRvIHN1cHBvcnQgaXQuCj4+Pj4+IFRoaXMgaXMgZG9uZSBieSBhZGRpbmcgcnhfaHdfdmxh
bigpIGFuZCBzZXRfaHdfdmxhbl9tb2RlKCkgY2FsbGJhY2tzCj4+Pj4+IGF0IHN0bW1hY19vcHMg
c3RydWN0IHdoaWNoIGFyZSBjYWxsZWQgZnJvbSB1cHBlciBzb2Z0d2FyZSBsYXllci4KPj4+PiAu
Li4KPj4+Pgo+Pj4+PiAgICAJaWYgKHByaXYtPmRtYV9jYXAudmxoYXNoKSB7Cj4+Pj4+ICAgIAkJ
bmRldi0+ZmVhdHVyZXMgfD0gTkVUSUZfRl9IV19WTEFOX0NUQUdfRklMVEVSOwo+Pj4+PiAgICAJ
CW5kZXYtPmZlYXR1cmVzIHw9IE5FVElGX0ZfSFdfVkxBTl9TVEFHX0ZJTFRFUjsgZGlmZiAtLQo+
Pj4+IGdpdAo+Pj4+PiBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19wbGF0Zm9ybS5jCj4+Pj4+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
c3RtbWFjX3BsYXRmb3JtLmMKPj4+Pj4gaW5kZXggMjNkNTNlYTA0YjI0Li5iZDdmMzMyNmE0NGMg
MTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0
bW1hY19wbGF0Zm9ybS5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL3N0bW1hY19wbGF0Zm9ybS5jCj4+Pj4+IEBAIC01NDMsNiArNTQzLDEyIEBAIHN0bW1h
Y19wcm9iZV9jb25maWdfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+Pj4+ICpwZGV2LCB1OCAq
bWFjKQo+Pj4+PiAgICAJCQlwbGF0LT5mbGFncyB8PSBTVE1NQUNfRkxBR19UU09fRU47Cj4+Pj4+
ICAgIAl9Cj4+Pj4+Cj4+Pj4+ICsJLyogUnggVkxBTiBIVyBTdHJpcHBpbmcgKi8KPj4+Pj4gKwlp
ZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAic25wcyxyeC12bGFuLW9mZmxvYWQiKSkgewo+
Pj4+PiArCQlkZXZfaW5mbygmcGRldi0+ZGV2LCAiUlggVkxBTiBIVyBTdHJpcHBpbmdcbiIpOwo+
Pj4+Cj4+Pj4gV2h5PyBEcm9wLgo+Pj4+Cj4+Pgo+Pj4gVGhpcyBpcyBhbiBkdHMgb3B0aW9uIGV4
cG9ydCB0byBkdHMgZm9yIHVzZXIgdG8gY2hvb3NlIHdoZXRoZXIgb3Igbm90Cj4+PiB0aGV5IFdh
bnQgYSBIYXJkd2FyZSBzdHJpcHBpbmcgb3IgYSBzb2Z0d2FyZSBzdHJpcHBpbmcuCj4+Pgo+Pj4g
TWF5IEkga25vdyB3aGF0IGlzIHRoZSByZWFzb24gdG8gZHJvcCB0aGlzPwo+Pgo+PiBCZWNhdXNl
IHRoZSBuZXR3b3JraW5nIHN0YWNrIGFscmVhZHkgZXhwb3NlcyBrbm9icyBmb3IgZHJpdmVycyB0
byBhZHZlcnRpc2UgYW5kCj4+IGNvbnRyb2wgVkxBTiBzdHJpcHBpbmcvaW5zZXJ0aW9uIG9uIFJY
L1RYIHVzaW5nIGV0aHRvb2wgYW5kIGZlYXR1cmUgYml0cwo+PiAoTkVUSUZfRl9IV19WTEFOX0NU
QUdfUlgsIE5FVElGX0ZfSFdfVkxBTl9DVEFHX1RYKS4KPj4KPiAKPiBIaSBGbG9yaWFuLAo+IAo+
IFVuZGVyc3Rvb2QsIGJ1dCBob3cgZG9lcyB1c2VyIGNob29zZSB0byBoYXZlIHRoZSBkZWZhdWx0
IG9wdGlvbgo+IGVpdGhlciBoYXJkd2FyZSBzdHJpcCBvciBzb2Z0d2FyZSBzdHJpcCwgd2hlbiB0
aGUgZGV2aWNlIGp1c3QgYm9vdCB1cD8KCllvdSBuZWVkIHRoZSBoYXJkd2FyZSB0byBhZHZlcnRp
c2UgaXQgYW5kIGRlY2lkZSBhcyBhIG1haW50YWluZXIgb2YgdGhhdCAKZHJpdmVyIHdoZXRoZXIg
aXQgbWFrZXMgc2Vuc2UgdG8gaGF2ZSBvbmUgb3IgdGhlIG90aGVyIGJlaGF2aW9yIGJ5IGRlZmF1
bHQuCgo+IAo+IEkgZG9u4oCZdCB0aGluayBldGhvb2wgY2FuICJyZW1lbWJlciIgdGhlIHNldHRp
bmcgb25jZSB0aGUgZGV2aWNlIGdldCByZWJvb3RlZD8KCklmIGJ5ICJkZXZpY2UiIHlvdSBtZWFu
IGEgc3lzdGVtIHRoYXQgaW5jb3Jwb3JhdGVzIGEgWEdNQUMgY29yZSwgdGhlbiBJIApzdXBwb3Nl
IHRoYXQgaXMgdHJ1ZSwgdGhvdWdoIHlvdSBjb3VsZCBoYXZlIHNvbWUgdXNlci1zcGFjZSBsb2dp
YyB0aGF0IApkb2VzIHJlbWVtYmVyIHRoZSB2YXJpb3VzIGV0aHRvb2wgb3B0aW9ucyBhbmQgcmUt
YXBwbGllcyB0aGVtIGFzIHNvb24gYXMgCnRoZSBkZXZpY2UgaXMgbWFkZSBhdmFpbGFibGUgdG8g
dXNlci1zcGFjZSwgdGhpcyB3b3VsZCBub3QgYmUgdG9vIGZhciAKZmV0Y2hlZC4KCj4gQW55IG90
aGVyIHN1Z2dlc3Rpb24gb2YgZG9pbmcgaXQgb3RoZXIgdGhhbiB1c2luZyB0aGUgZHRzIG1ldGhv
ZD8KCkxldCBtZSBhc2sgeW91IHRoaXMgcXVlc3Rpb246IHdoYXQgYXJlIHlvdSB0cnlpbmcgdG8g
c29sdmUgYnkgbWFraW5nIAp0aGlzIGNvbmZpZ3VyYWJsZT8gSFcgc3RyaXBwaW5nIHNob3VsZCBh
bHdheXMgYmUgbW9yZSBlZmZpY2llbnQsIHNob3VsZCAKbm90IGl0LCBpZiBzbywgd2hhdCB3b3Vs
ZCBiZSB0aGUgcmVhc29ucyBmb3Igbm90IGVuYWJsaW5nIHRoYXQgYnkgCmRlZmF1bHQ/IElmIG5v
dCwgdGhlbiBsZWF2ZSBpdCBvZmYgYW5kIGxldCB1c2VycyBlbmFibGUgaXQgaWYgdGhleSBmZWVs
IApsaWtlIHRoZXkgd2FudCBpdC4KLS0gCkZsb3JpYW4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
