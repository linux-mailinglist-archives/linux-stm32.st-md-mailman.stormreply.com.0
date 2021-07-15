Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6693CA191
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 17:38:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14542C59781;
	Thu, 15 Jul 2021 15:38:58 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2BA0C57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 15:38:55 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0E66C81E47;
 Thu, 15 Jul 2021 17:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626363535;
 bh=bnsA5QD8sGVhSy/ndZwbJ2QlhLsN0kDMswgXrngbAr8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ivOTMq+8Htd5fz7QGxosMaopSEVDrZ4EZB5eGjiAzcbvT/rP4x0WKU11WIrOFPGgj
 WFUVTMYXNDGmDZyxuvCQLtLDUhsmZqxTdUVeXQgqSHHdthR4ofNPPcq19Jf6aYAixW
 zJ0j7MbXXjxnaLT8QhvsHCxQ6pj0CcdauVHkZnSmntIG2KWnL9EwoxWAIncehVA6a/
 Srm7zmXZcz9RDvyyUIKp5yE24Rgvto5IEiDk9rapMOHFUjdVmcRdSNqV/RossQMZ2E
 24NVsi3TTlPqhxtRwypXEyPuGXd10uu+nSXWAf1C2j88mEVSguyMD92r73egsukzEq
 wqPDqMaAcOiAg==
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20210610150306.30072-1-marex@denx.de>
 <a393eb0b-a8d6-e29a-62c8-8988429c9139@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <8ab267d3-3b89-878c-861d-c53a672f213a@denx.de>
Date: Thu, 15 Jul 2021 17:38:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a393eb0b-a8d6-e29a-62c8-8988429c9139@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Set {bitclock,
 frame}-master phandles on ST DKx
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

T24gNy8xNS8yMSA1OjI3IFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IEhpIE1hcmVrCgpI
aSwKClsuLi5dCgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgt
ZGt4LmR0c2kgCj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGt4LmR0c2kKPj4g
aW5kZXggNTlmMTg4NDZjZjVkLi41ODZhYWM4YTk5OGMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRreC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNXh4LWRreC5kdHNpCj4+IEBAIC0yMjAsMTUgKzIyMCwxNSBAQCBjczQybDUxX3Bv
cnQ6IHBvcnQgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjczQybDUxX3R4X2VuZHBv
aW50OiBlbmRwb2ludEAwIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZWcgPSA8MD47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVtb3RlLWVu
ZHBvaW50ID0gPCZzYWkyYV9lbmRwb2ludD47Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZnJhbWUtbWFzdGVyOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJp
dGNsb2NrLW1hc3RlcjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcmFtZS1t
YXN0ZXIgPSA8JmNzNDJsNTFfdHhfZW5kcG9pbnQ+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJpdGNsb2NrLW1hc3RlciA9IDwmY3M0Mmw1MV90eF9lbmRwb2ludD47Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNzNDJsNTFfcnhfZW5kcG9pbnQ6IGVuZHBvaW50QDEgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwxPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZW1vdGUtZW5kcG9pbnQgPSA8JnNhaTJiX2VuZHBvaW50PjsKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcmFtZS1tYXN0ZXI7Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYml0Y2xvY2stbWFzdGVyOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZyYW1lLW1hc3RlciA9IDwmY3M0Mmw1MV9yeF9lbmRwb2ludD47Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYml0Y2xvY2stbWFzdGVyID0gPCZjczQybDUxX3J4
X2VuZHBvaW50PjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIH07Cj4+IMKgwqDCoMKgwqAgfTsKPj4KPiAKPiBBcHBsaWVkIG9uIHN0bTMyLW5l
eHQuIFRoYW5rcyB0byB1cGRhdGUgdGhlIERLeCBib2FyZC4gTm90ZSB0aGF0IAo+ICJjaXJydXMs
Y3M0Mmw1MS55YW1sIiBoYXMgdG8gYmUgYWxzbyB1cGRhdGVkLiBEaWQgeW91IGFsc28gc2VudCB5
YW1sIAo+IHVwZGF0ZSBhc2lkZSB0aGlzIHBhdGNoID8KCk5vcGUsIHNvcnJ5LgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
