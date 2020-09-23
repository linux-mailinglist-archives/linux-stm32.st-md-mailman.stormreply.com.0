Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC91E275D57
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 18:26:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E155C3FADE;
	Wed, 23 Sep 2020 16:26:04 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9A20C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 16:26:03 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BxNpM1TQlz1qs0H;
 Wed, 23 Sep 2020 18:26:03 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BxNpM0rzTz1qwT6;
 Wed, 23 Sep 2020 18:26:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id w1hVWZh_pu_0; Wed, 23 Sep 2020 18:26:01 +0200 (CEST)
X-Auth-Info: 8PRXXz6bBcM1LGy99IdAQOtX3hg4DTPEf7DFW0Yn0Fg=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 23 Sep 2020 18:26:01 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200822203255.61295-1-marex@denx.de>
 <f6e8619d-ff66-2f70-d22e-88ed763cf96c@st.com>
 <a3c0348b-bf5e-0382-6a6e-bbf74f5a00ce@denx.de>
 <2a8f7f92-1c3e-b474-7574-c1f7a37e1fb1@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <48810754-5b1c-ac2e-71fb-f2a247abef97@denx.de>
Date: Wed, 23 Sep 2020 18:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2a8f7f92-1c3e-b474-7574-c1f7a37e1fb1@st.com>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix DH PDK2 display PWM
	channel
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

T24gOS8yMy8yMCA2OjIzIFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IAo+IAo+IE9uIDkv
MjMvMjAgNjowNCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDkvMjMvMjAgNDozMiBQTSwg
QWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4+IEhpIE1hcmVrCj4+Cj4+IEhpLAo+Pgo+Pj4gT24g
OC8yMi8yMCAxMDozMiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+Pj4gVGhlIGRpc3BsYXkgUFdN
IGNoYW5uZWwgaXMgbnVtYmVyIDMgKFBXTTIgQ0g0KSwgbWFrZSBpdCBzby4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+Pj4+IENjOiBBbGV4YW5k
cmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4KPj4+PiBDYzogTWF4aW1lIENvcXVl
bGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+Pj4+IENjOiBQYXRyaWNlIENob3RhcmQg
PHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+Cj4+Pj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJp
Y2suZGVsYXVuYXlAc3QuY29tPgo+Pj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCj4+Pj4gVG86IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+Pj4+IC0tLQo+Pj4+IMKgwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20t
cGRrMi5kdHNpIHwgMiArLQo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
c3RtMzJtcDE1eHgtZGhjb20tcGRrMi5kdHNpCj4+Pj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0z
Mm1wMTV4eC1kaGNvbS1wZGsyLmR0c2kKPj4+PiBpbmRleCA3YzRiZDYxNWIzMTEuLjA3NWUyYTk1
NzEzZiAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNv
bS1wZGsyLmR0c2kKPj4+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNv
bS1wZGsyLmR0c2kKPj4+PiBAQCAtMjYsNyArMjYsNyBAQCBjbGtfZXh0X2F1ZGlvX2NvZGVjOiBj
bG9jay1jb2RlYyB7Cj4+Pj4gwqDCoCDCoMKgwqDCoMKgIGRpc3BsYXlfYmw6IGRpc3BsYXktYmwg
ewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7
Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHB3bXMgPSA8JnB3bTIgMCA1MDAwMDAgUFdNX1BPTEFSSVRZ
X0lOVkVSVEVEPjsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcHdtcyA9IDwmcHdtMiAzIDUwMDAwMCBQ
V01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyaWdodG5l
c3MtbGV2ZWxzID0gPDAgMTYgMjIgMzAgNDAgNTUgNzUgMTAyIDEzOCAxODggMjU1PjsKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWwgPSA8OD47Cj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZW5hYmxlLWdwaW9zID0gPCZncGlvaSAwIEdQSU9fQUNUSVZF
X0hJR0g+Owo+Pj4+Cj4+Pgo+Pj4KPj4+IEFwcGxpZWQgb24gc3RtMzItbmV4dC4KPj4KPj4gRG9u
J3QgeW91IHdhbnQgdG8gcGljayB0aGUgb25lIHdpdGggdGhlIEZpeGVzOiB0YWcgPyA6KQo+Pgo+
IAo+IFllcyBJIGRpZC4gSSBqdXN0IHJlc3BvbmRlZCBvbiB0aGUgYmFkIG9uZSA7KQoKQWgsIHJp
Z2h0LCBPSyA6KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
