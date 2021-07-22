Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D63D1E9B
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jul 2021 09:03:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A536C5A4C0;
	Thu, 22 Jul 2021 07:03:47 +0000 (UTC)
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81234C597BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 07:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=geimImWkk+j3UI43YmrbXT0NGSrWz41IEgo4SUWY5x0=; b=vyIh5gzNB1430AHxLZ/3RRB97P
 h3ohXM9uO7sST+trD0bY/4oh3g+BNyJ/TnvbagXk7G/C+nwuOedAiLFn51tRUUZddYyFX8pFOxQVc
 UwNMkiqjQQpP6m3mH+oor2vJlvZSpg6JeF2rGIqTFI7zPKrWQ+V4BldVhLfMH3hPGRDFS8hYlp6Jp
 NJkhwIMxdvn3IHGiZphKYAo/omRaLhHZf26fft+gt58oSlKM2zs4TgB7YT6kBp69u1FMYt1kFjPJJ
 IO9+UYaq3W8C9Uwa05V2WK+3Vdgwd7hQLZ2lc11Wf17rjrQFU1RyX1xBmvkzvNROCLxx3O2It8LhA
 RMBX4yMA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57951
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1m6SkC-0006us-Cm; Thu, 22 Jul 2021 09:03:44 +0200
To: Dillon Min <dillon.minfei@gmail.com>
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
 <8e091b9c-764d-d410-559e-3c5e25de2a3c@tronnes.org>
 <CAL9mu0K2yLsG0MXOd4ke8N8zn7311CJ54hL-JcbocJOK+H7W9A@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <1e4743b0-250f-975a-f83d-5d000c6496e3@tronnes.org>
Date: Thu, 22 Jul 2021 09:03:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0K2yLsG0MXOd4ke8N8zn7311CJ54hL-JcbocJOK+H7W9A@mail.gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] drm/panel: Add ilitek ili9341
	panel driver
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

CgpEZW4gMjIuMDcuMjAyMSAwNC4wNywgc2tyZXYgRGlsbG9uIE1pbjoKPiBIaSBOb3JhbGYKPiAK
PiBUaGFua3MgZm9yIHlvdXIgdGltZSB0byByZXZpZXcgbXkgcGF0Y2guCj4gCj4gT24gVGh1LCAy
MiBKdWwgMjAyMSBhdCAwMTo0MiwgTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+
IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBEZW4gMjEuMDcuMjAyMSAwOS40MSwgc2tyZXYgZGlsbG9uLm1p
bmZlaUBnbWFpbC5jb206Cj4+PiBGcm9tOiBEaWxsb24gTWluIDxkaWxsb24ubWluZmVpQGdtYWls
LmNvbT4KPj4+Cj4+PiBUaGlzIGRyaXZlciBjb21iaW5lIHRpbnkvaWxpOTM0MS5jIG1pcGlfZGJp
X2ludGVyZmFjZSBkcml2ZXIKPj4+IHdpdGggbWlwaV9kcGlfaW50ZXJmYWNlIGRyaXZlciwgY2Fu
IHN1cHBvcnQgaWxpOTM0MSB3aXRoIHNlcmlhbAo+Pj4gbW9kZSBvciBwYXJhbGxlbCByZ2IgaW50
ZXJmYWNlIG1vZGUgYnkgcmVnaXN0ZXIgY29uZmlndXJhdGlvbi4KPj4+Cj4+PiBDYzogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+Pj4gU2lnbmVkLW9mZi1ieTogRGls
bG9uIE1pbiA8ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20+Cj4+PiAtLS0KPj4KPj4+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBpbGk5MzQxX29mX21hdGNoW10gPSB7Cj4+PiArICAg
ICB7Cj4+PiArICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gInN0LHNmLXRjMjQwdC05MzcwLXQi
LAo+Pj4gKyAgICAgICAgICAgICAuZGF0YSA9ICZpbGk5MzQxX3N0bTMyZjQyOV9kaXNjb19kYXRh
LAo+Pj4gKyAgICAgfSwKPj4+ICsgICAgIHsKPj4+ICsgICAgICAgICAgICAgLyogcG9ydGluZyBm
cm9tIHRpbnkvaWxpOTM0MS5jCj4+PiArICAgICAgICAgICAgICAqIGZvciBvcmlnaW5hbCBtaXBp
IGRiaSBjb21waXRhYmxlCj4+PiArICAgICAgICAgICAgICAqLwo+Pj4gKyAgICAgICAgICAgICAu
Y29tcGF0aWJsZSA9ICJhZGFmcnVpdCx5eDI0MHF2MjkiLAo+Pgo+PiBJIGRvbid0IHVuZGVyc3Rh
bmQgdGhpcywgbm93IHRoZXJlIHdpbGwgYmUgMiBkcml2ZXJzIHRoYXQgc3VwcG9ydCB0aGUKPj4g
c2FtZSBkaXNwbGF5Pwo+IAo+IFRoZXJlIGlzIG5vIHJlYXNvbiB0byBjcmVhdGUgdHdvIGRyaXZl
cnMgdG8gc3VwcG9ydCB0aGUgc2FtZSBkaXNwbGF5Lgo+IAo+IFRvIHN1cHBvcnQgb25seS1kYmkg
YW5kIGRiaStkcGkgcGFuZWwgYXQgZHJtL3BhbmVsIG9yIGRybS90aW55IGJvdGgKPiBmaW5lIHdp
dGggbWUuCj4gCj4+Cj4+IEFGQUlDVCBkcm0vdGlueS9pbGk5MzQxLmMgaXMganVzdCBjb3BpZWQg
aW50byB0aGlzIGRyaXZlciwgaXMgdGhlIHBsYW4KPj4gdG8gcmVtb3ZlIHRoZSB0aW55LyBkcml2
ZXI/IElmIHNvIEkgY291bGRuJ3Qgc2VlIHRoaXMgbWVudGlvbmVkIGFueXdoZXJlLgo+IAo+IFll
cywgSSdkIGxpa2UgdG8gbWVyZ2UgdGhlIGNvZGUgZnJvbSBkcm0vdGlueS9pbGk5MzQxLmMgdG8g
dGhpcyBkcml2ZXIKPiAodG8gbWFrZSBhIHNpbmdsZSBkcml2ZXIgdG8gc3VwcG9ydCBkaWZmZXJl
bnQgYnVzKS4KPiAKPiBJIGhhdmUgdHdvIHB1cnBvc2UgdG8gZXh0ZW5kIHRoZSBmZWF0dXJlIGRy
bS90aW55L2lsaTkzNDEuYwo+IAo+IC0ga2VlcCBjb21wYXRpYmxlID0gImFkYWZydWl0LHl4MjQw
cXYyOSIsIGFkZCBidXMgbW9kZSBkdHMgYmluZGluZ3MgKHBhbmVsX2J1cykKPiAgIHRvIGRlZmlu
ZSB0aGUgaW50ZXJmYWNlIHdoaWNoIGhvc3Qgd2FudHMgdG8gdXNlLiBzdWNoIGFzCj4gcGFuZWxf
YnVzPSJkYmkiIG9yICJyZ2IiCj4gICBvciAiaTgwIiBmb3IgdGhpcyBjYXNlLCBpIHdpbGwgYWRk
IGRwaSBjb2RlIHRvIGRybS90aW55L2lsaTkzNDEuYy4KPiAKPiAtIG1lcmdlIHRpbnkvaWxpOTM0
MS5jIHRvIHRoaXMgZHJpdmVyLHJlbW92ZSBkcm0vdGlueS9pbGk5MzQxLmMsIGFkZAo+IG5ldyBk
dHMgY29tcGF0aWJsZQo+ICAgc3RyaW5nIHRvIHN1cHBvcnQgb3RoZXIgaW50ZXJmYWNlcy4ganVz
dCBsaWtlIHdoYXQgaSdtIGRvaW5nIG5vdy4KPiAKPiBJIGhhdmUgbm8gaWRlYSBhYm91dCB5b3Vy
IHBsYW4gb24gZHJtL3RpbnkgZHJpdmVycywgYWN0dWFsbHkgc29tZSBvZgo+IHRoZXNlIHBhbmVs
cyB1bmRlcgo+IHRoZSBkaW55IGZvbGRlciBjYW4gc3VwcG9ydCBib3RoIGRiaSBhbmQgZGJpK2Rw
aSAobXVjaCBmYXN0ZXIsIG5lZWQKPiBtb3JlIHBpbnMpLiBubwo+IGRvdWJ0IHRoZSByZXF1aXJl
bWVudCB0byBzdXBwb3J0IGRwaSBpcyBhbHdheXMgdGhlcmUuCj4gCj4gV2hhdCBpcyB5b3VyIHBy
ZWZlcmVuY2U/Cj4gCgpJIGhhdmUgbm8gcGxhbnMgZm9yIHRpbnkvLCBpdCdzIGp1c3QgYSBwbGFj
ZSB0byBwdXQgdGlueSBEUk0gZHJpdmVycyBvZgphbGwgc29ydHMuCgpXaGV0aGVyIG9yIG5vdCB0
byBoYXZlICJmdWxsIiBEUk0gZHJpdmVycyBpbiBwYW5lbC8gaXMgdXAgdG8gU2FtIGFuZApMYXVy
ZW50IEkgZ3Vlc3MsIGN1cnJlbnRseSB0aGVyZSdzIG9ubHkgZHJtX3BhbmVsIGRyaXZlcnMgaW4g
dGhlcmUuIEkKaGF2ZSBubyBvYmplY3Rpb25zIHRvIGRvaW5nIHRoYXQgdGhvdWdoLgoKSSBqdXN0
IHdhbnRlZCB0byBtYWtlIHN1cmUgd2UgZG9uJ3QgaGF2ZSAyIGRyaXZlcnMgZm9yIHRoZSBzYW1l
IGRpc3BsYXkuCgpOb3JhbGYuCgo+IFRoYW5rcyAmIFJlZ2FyZHMKPiBEaWxsb24KPiAKPj4KPj4g
Tm9yYWxmLgo+Pgo+Pj4gKyAgICAgICAgICAgICAuZGF0YSA9IE5VTEwsCj4+PiArICAgICB9LAo+
Pj4gK307Cj4+PiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgaWxpOTM0MV9vZl9tYXRjaCk7Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
