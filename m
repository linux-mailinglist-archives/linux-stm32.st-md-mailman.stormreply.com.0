Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B357F53C961
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jun 2022 13:32:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A971C5E2CC;
	Fri,  3 Jun 2022 11:32:45 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54736C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jun 2022 11:32:44 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nx5Xf-0004zn-BQ; Fri, 03 Jun 2022 13:32:35 +0200
Message-ID: <2c0ff9ae-dc13-6884-a806-29939f34f648@pengutronix.de>
Date: Fri, 3 Jun 2022 13:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Leonard_G=c3=b6hrs?= <l.goehrs@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220603094422.2112746-1-l.goehrs@pengutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20220603094422.2112746-1-l.goehrs@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: fix missing
 internally connected voltage regulator for OSD32MP1
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

T24gMDMuMDYuMjIgMTE6NDQsIExlb25hcmQgR8O2aHJzIHdyb3RlOgo+IEFjY29yZGluZyB0byB0
aGUgT1NEMzJNUDEgUG93ZXIgU3lzdGVtIG92ZXJ2aWV3WzFdIGxkbzMncyBpbnB1dCBpcyBhbHdh
eXMKPiBpbnRlcm5hbGx5IGNvbm5lY3RlZCB0byB2ZGRfZGRyLgo+IAo+IFsxXTogaHR0cHM6Ly9v
Y3Rhdm9zeXN0ZW1zLmNvbS9hcHBfbm90ZXMvb3NkMzJtcDEtcG93ZXItc3lzdGVtLW92ZXJ2aWV3
LyNjb25uZWN0aW9ucwo+IAo+IFNpZ25lZC1vZmYtYnk6IExlb25hcmQgR8O2aHJzIDxsLmdvZWhy
c0BwZW5ndXRyb25peC5kZT4KClJldmlld2VkLWJ5OiBBaG1hZCBGYXRvdW0gPGEuZmF0b3VtQHBl
bmd1dHJvbml4LmRlPgoKVGhhbmtzLApBaG1hZAoKPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMv
c3RtMzJtcDE1eHgtb3NkMzIuZHRzaSB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3Nk
MzIuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LW9zZDMyLmR0c2kKPiBpbmRl
eCA2NzA2ZDgzMTFhNjYuLmU5OTdjNDk1M2ZkMSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTV4eC1vc2QzMi5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1eHgtb3NkMzIuZHRzaQo+IEBAIC03OCw2ICs3OCw3IEBAIHJlZ3VsYXRvcnMgewo+ICAJ
CQljb21wYXRpYmxlID0gInN0LHN0cG1pYzEtcmVndWxhdG9ycyI7Cj4gIAo+ICAJCQlsZG8xLXN1
cHBseSA9IDwmdjN2Mz47Cj4gKwkJCWxkbzMtc3VwcGx5ID0gPCZ2ZGRfZGRyPjsKPiAgCQkJbGRv
Ni1zdXBwbHkgPSA8JnYzdjM+Owo+ICAJCQlwd3Jfc3cxLXN1cHBseSA9IDwmYnN0X291dD47Cj4g
IAoKCi0tIApQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfApTdGV1ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAgICAg
ICAgICAgICAgICAgfCBodHRwOi8vd3d3LnBlbmd1dHJvbml4LmRlLyAgfAozMTEzNyBIaWxkZXNo
ZWltLCBHZXJtYW55ICAgICAgICAgICAgICAgICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTAg
ICAgfApBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6ICAg
KzQ5LTUxMjEtMjA2OTE3LTU1NTUgfApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
