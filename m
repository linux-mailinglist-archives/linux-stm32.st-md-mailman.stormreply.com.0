Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6206F3BA3D3
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Jul 2021 20:07:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA1EFC597AE;
	Fri,  2 Jul 2021 18:07:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F736C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jul 2021 18:07:37 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 337A680A22;
 Fri,  2 Jul 2021 20:07:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1625249256;
 bh=DVXT6/CYOSAyDwpNFBEXfSTGeNkDxbgh/EoHZVqJm+A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Z/ej3xyycbNljAT+gmegjwcoP7YhWYaTK2I6wvT1bVp8h/7NUDq2uPR4QwZzKkWhe
 zHYhQtz/dPNMedT2FYFOJCV4Ey9Y/KE3UFXBRO60fPEzup5u3VaZziTz27Un4+UDpv
 Bw5EuevxgUCe7J5wRFX/OMDW6I7W3iJS6xJfJdr+3ZUKizs/ned4a184h8cHXtqGtO
 ZJSncVBluzXST22RIr9yvbvPUURj3NH3VCajJUEASJ6YDN5SGiG/vYcynv13+4ioaE
 5Ill8a0Dm3B6111SPf/3AGXYgS11Fdv8qwxgtyZknIn+kW0D+XkkIAA1tKIp797nYx
 8ACgqLHj3BQ4g==
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
References: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
 <420e243d-7541-a07e-177b-d2db11c26aef@denx.de>
 <3bb823e4-4724-7072-fe9f-7b8a355c8e50@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <5d65ca80-4f94-49e1-5de1-cf29e8231a6a@denx.de>
Date: Fri, 2 Jul 2021 20:07:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3bb823e4-4724-7072-fe9f-7b8a355c8e50@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: improve pm_runtime to stop
	clocks
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

T24gNy8yLzIxIDExOjIzIEFNLCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+IEhlbGxvIE1h
cmVrLAoKSGksCgo+IFNvcnJ5IGZvciB0aGUgbGF0ZSBhbnN3ZXIuCgpObyB3b3JyaWVzLCB0YWtl
IHlvdXIgdGltZQoKPiBPbiA2LzMwLzIxIDI6MzUgQU0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBP
biA2LzI5LzIxIDE6NTggUE0sIFJhcGhhZWwgR0FMTEFJUy1QT1UgLSBmb3NzIHdyb3RlOgo+Pgo+
PiBbLi4uXQo+Pgo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPj4+IEBAIC00
MjUsMTAgKzQyNSwxNyBAQCBzdGF0aWMgdm9pZCBsdGRjX2NydGNfYXRvbWljX2VuYWJsZShzdHJ1
Y3QgCj4+PiBkcm1fY3J0YyAqY3J0YywKPj4+IMKgIHsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IGx0
ZGNfZGV2aWNlICpsZGV2ID0gY3J0Y190b19sdGRjKGNydGMpOwo+Pj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgZHJtX2RldmljZSAqZGRldiA9IGNydGMtPmRldjsKPj4+ICvCoMKgwqAgaW50IHJldDsKPj4+
IMKgIMKgwqDCoMKgwqAgRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsKPj4+IMKgIC3CoMKgwqAgcG1f
cnVudGltZV9nZXRfc3luYyhkZGV2LT5kZXYpOwo+Pj4gK8KgwqDCoCBpZiAoIXBtX3J1bnRpbWVf
YWN0aXZlKGRkZXYtPmRldikpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBwbV9ydW50aW1l
X2dldF9zeW5jKGRkZXYtPmRldik7Cj4+Cj4+IEFsbCB0aGVzZSBpZiAoIXBtX3J1bnRpbWVfYWN0
aXZlKCkpIHRoZW4gcG1fcnVudGltZV9nZXRfc3luYygpIGNhbGxzIAo+PiBsb29rIGxpa2Ugd29y
a2Fyb3VuZCBmb3Igc29tZSBsYXJnZXIgaXNzdWUuIFNob3VsZG4ndCB0aGUgcG1fcnVudGltZSAK
Pj4gZG8gc29tZSByZWZjb3VudGluZyBvbiBpdHMgb3duICwgc28gdGhpcyBzaG91bGRuJ3QgYmUg
bmVlZGVkID8KPiAKPiAKPiBUaGlzIHByb2JsZW0gcHVyZWx5IGNvbWVzIGZyb20gdGhlIGRyaXZl
ciBpbnRlcm5hbHMsIHNvIEkgZG9uJ3QgdGhpbmsgaXQgCj4gaXMgYSB3b3JrYXJvdW5kLgo+IAo+
IEJlY2F1c2Ugb2YgdGhlICJsdGRjX2NydGNfbW9kZV9zZXRfbm9mYiIgZnVuY3Rpb24gd2hpY2gg
ZG9lcyBub3QgaGF2ZSAKPiBhbnkgInN5bW1ldHJpY2FsIiBjYWxsLCBzdWNoIGFzIGVuYWJsZS9k
aXNhYmxlIGZ1bmN0aW9ucywgdGhlcmUgd2FzIHR3byAKPiBjYWxscyB0byBwbV9ydW50aW1lX2dl
dF9zeW5jIGFnYWluc3Qgb25lIGNhbGwgdG8gcG1fcnVudGltZV9wdXRfc3luYy4KPiAKPiBUaGlz
IGluc3RhYmlsaXR5IHJlc3VsdGVkIGluIHRoZSBMVERDIGNsb2NrcyBiZWluZyBhbHdheXMgZW5h
YmxlZCwgZXZlbiAKPiB3aGVuIHRoZSBwZXJpcGhlcmFsIHdhcyBkaXNhYmxlZC4gVGhpcyBjb3Vs
ZCBiZSBzZWVuIGluIHRoZSBjbGtfc3VtbWFyeSAKPiBhcyBleHBsYWluZWQgaW4gdGhlIHBhdGNo
IHN1bW1hcnkgYW1vbmcgb3RoZXIgdGhpbmdzLgo+IAo+IEJ5IGRvaW5nIHNvLCB3ZSBmaXJzdCBj
aGVjayBpZiB0aGUgY2xvY2tzIGFyZSBub3QgYWxyZWFkeSBhY3RpdmF0ZWQsIGFuZCAKPiBpbiB0
aGF0IGNhc2Ugd2UgY2FsbCBwbV9ydW50aW1lX2dldF9zeW5jLgoKSSBqdXN0IGhhdmUgdG8gd29u
ZGVyLCBob3cgY29tZSBvdGhlciBkcml2ZXJzIGRvbid0IG5lZWQgdGhlc2UgaWYgCighcG1fcnVu
dGltZV9hY3RpdmUoKSkgcG1fcnVudGltZV9nZXRfc3luYygpIGNvbmRpdGlvbnMuIEkgdGhpbmsg
dGhleSAKanVzdCBnZXQvcHV0IHRoZSBydW50aW1lIFBNIHdpdGhpbiBhIGNhbGwgaXRzZWxmLCBu
b3QgYWNyb3NzIGZ1bmN0aW9uIApjYWxscy4gTWF5YmUgdGhhdCBjb3VsZCBiZSB0aGUgcmlnaHQg
Zml4IGhlcmUgdG9vID8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
