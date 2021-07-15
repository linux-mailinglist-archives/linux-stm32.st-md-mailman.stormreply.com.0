Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1063E3CA313
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 18:47:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B23BEC59781;
	Thu, 15 Jul 2021 16:47:14 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12DC0C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 16:47:13 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3770D81FA1;
 Thu, 15 Jul 2021 18:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626367632;
 bh=JQlwDzU+MQWTblw4hJLIznMLsIv1LF5EwgaCb5b+uEY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aNuyYrDdmCzqUHlvc1cbtZwTJ2d3RLD5EQP++HOsfOA2wM5wkpE2fI5kn+YaldT3t
 JSTpd/rgLWDV2/OVTZ0079VNscE3a5N7VQrQvqZImlvRViLV57l2JfkTiocYiASLzE
 72GB5g08Zpj63t5cErqHqdW/gOehPkxNfYpBAn87CaZbcYlc7ZzYmVAvW+XkfQTcbj
 7ydw3oOcoDMiuQwmjfE6hdi2f2pqzOTXWpAKdjHLxxv6nR81h5RD1iopYuCqls88LI
 CRVdk3NyA3UAee9qX0ATkC34f/krgcaghj9UhjuM0uzk1Ar3lLCb8myOBLef0aaSVt
 NTEV5Q9BmAAqw==
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20210610150306.30072-1-marex@denx.de>
 <a393eb0b-a8d6-e29a-62c8-8988429c9139@foss.st.com>
 <8ab267d3-3b89-878c-861d-c53a672f213a@denx.de>
 <091a126a-bd57-8f3d-9f36-821715441fcd@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <7423f86e-2fdc-9904-f88d-83d7a7ac94ac@denx.de>
Date: Thu, 15 Jul 2021 18:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <091a126a-bd57-8f3d-9f36-821715441fcd@foss.st.com>
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

T24gNy8xNS8yMSA1OjQzIFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IE9uIDcvMTUvMjEg
NTozOCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDcvMTUvMjEgNToyNyBQTSwgQWxleGFu
ZHJlIFRPUkdVRSB3cm90ZToKPj4+IEhpIE1hcmVrCj4+Cj4+IEhpLAo+Pgo+PiBbLi4uXQo+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1ka3guZHRzaSAK
Pj4+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRreC5kdHNpCj4+Pj4gaW5kZXgg
NTlmMTg4NDZjZjVkLi41ODZhYWM4YTk5OGMgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvc3RtMzJtcDE1eHgtZGt4LmR0c2kKPj4+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTV4eC1ka3guZHRzaQo+Pj4+IEBAIC0yMjAsMTUgKzIyMCwxNSBAQCBjczQybDUxX3Bv
cnQ6IHBvcnQgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNzNDJsNTFfdHhfZW5k
cG9pbnQ6IGVuZHBvaW50QDAgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVnID0gPDA+Owo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVt
b3RlLWVuZHBvaW50ID0gPCZzYWkyYV9lbmRwb2ludD47Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmcmFtZS1tYXN0ZXI7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBiaXRjbG9jay1tYXN0ZXI7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmcmFtZS1tYXN0ZXIgPSA8JmNzNDJsNTFfdHhfZW5kcG9pbnQ+Owo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYml0Y2xvY2stbWFzdGVyID0gPCZjczQybDUxX3R4X2Vu
ZHBvaW50PjsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNzNDJsNTFfcnhfZW5kcG9pbnQ6IGVuZHBvaW50QDEgewo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDE+Owo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVtb3RlLWVuZHBvaW50ID0gPCZzYWkyYl9l
bmRwb2ludD47Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcmFtZS1tYXN0
ZXI7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaXRjbG9jay1tYXN0ZXI7
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcmFtZS1tYXN0ZXIgPSA8JmNz
NDJsNTFfcnhfZW5kcG9pbnQ+Owo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Yml0Y2xvY2stbWFzdGVyID0gPCZjczQybDUxX3J4X2VuZHBvaW50PjsKPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4+IMKgwqDC
oMKgwqAgfTsKPj4+Pgo+Pj4KPj4+IEFwcGxpZWQgb24gc3RtMzItbmV4dC4gVGhhbmtzIHRvIHVw
ZGF0ZSB0aGUgREt4IGJvYXJkLiBOb3RlIHRoYXQgCj4+PiAiY2lycnVzLGNzNDJsNTEueWFtbCIg
aGFzIHRvIGJlIGFsc28gdXBkYXRlZC4gRGlkIHlvdSBhbHNvIHNlbnQgeWFtbCAKPj4+IHVwZGF0
ZSBhc2lkZSB0aGlzIHBhdGNoID8KPj4KPj4gTm9wZSwgc29ycnkuCj4gCj4gTm8gcGIsIHdlJ2xs
IGRvLgoKVGhhbmsgeW91Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
