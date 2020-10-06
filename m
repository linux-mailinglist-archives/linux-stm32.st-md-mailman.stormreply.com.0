Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA9C28548B
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 00:28:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CD57C32EA5;
	Tue,  6 Oct 2020 22:28:00 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7693BC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Oct 2020 22:27:56 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m11so334140otk.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Oct 2020 15:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bIxfwcUKhwWi5PXEHY2oibtjWm53f5qOOJ6d+hhSij8=;
 b=tVB51g9E2Aje5EFzpFB084t1OWFz4cuDOSxsVwCtBFXazJolABZs7kJCb9i6v7zcKS
 7JJ/75detK0789H94ODLApZ6BC65JK6wLSio2cC1uIu3RDCdlTt/b0t2yjdRReB8m4oI
 EVrFpBQRza3TuCqXyKxPVSgs5fQFVMp1PyIKm9rotTbg+EeAPPwU6lbyeQLNMAmi3GKH
 uWWu/SIaJzmn929JwQPMAZiYPQ+60ozH/ZIwtm7Feys+qtLlcgSrwRY0swOa0u1kW7hs
 pb5ZZX2lThSpcV0TphSH5yEqEFe5Ddo1BDJNXza927Vf4HGx6a02xWZZEv2e8zNErM2s
 jEKw==
X-Gm-Message-State: AOAM533yJyiQcXfKLdhmZyWdXYCxNs3ZYPs3KbbnfMUY/zQlnWuqqa8D
 YkRMqaeQFa1dVh0nAD3hew==
X-Google-Smtp-Source: ABdhPJxRwMszI2DlfXiX8dwjERn3YfMK8ci9QTyyCK5c1CqJYSx11XCGap5FgjPbZZOpuJCAn1RIGg==
X-Received: by 2002:a05:6830:138f:: with SMTP id
 d15mr85548otq.342.1602023275282; 
 Tue, 06 Oct 2020 15:27:55 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t5sm96136otl.22.2020.10.06.15.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 15:27:54 -0700 (PDT)
Received: (nullmailer pid 2969307 invoked by uid 1000);
 Tue, 06 Oct 2020 22:27:53 -0000
Date: Tue, 6 Oct 2020 17:27:53 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Message-ID: <20201006222753.GA2965477@bogus>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
 <20201006021729.GA4822@labundy.com> <3367098.sbkyfNuaKI@ada>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3367098.sbkyfNuaKI@ada>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-omap@vger.kernel.org,
 Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 Jeff LaBundy <jeff@labundy.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 03/12] dt-bindings: mfd: Fix schema
 warnings for pwm-leds
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

T24gVHVlLCBPY3QgMDYsIDIwMjAgYXQgMDg6MzQ6MjNBTSArMDIwMCwgQWxleGFuZGVyIERhaGwg
d3JvdGU6Cj4gSGVsbG8gSmVmZiwKPiAKPiBBbSBEaWVuc3RhZywgNi4gT2t0b2JlciAyMDIwLCAw
NDoxNzoyOSBDRVNUIHNjaHJpZWIgSmVmZiBMYUJ1bmR5Ogo+ID4gSGkgQWxleGFuZGVyLAo+ID4g
Cj4gPiBPbiBNb24sIE9jdCAwNSwgMjAyMCBhdCAxMDozNDo0MlBNICswMjAwLCBBbGV4YW5kZXIg
RGFobCB3cm90ZToKPiA+ID4gVGhlIG5vZGUgbmFtZXMgZm9yIGRldmljZXMgdXNpbmcgdGhlIHB3
bS1sZWRzIGRyaXZlciBmb2xsb3cgYSBjZXJ0YWluCj4gPiA+IG5hbWluZyBzY2hlbWUgKG5vdyku
ICBQYXJlbnQgbm9kZSBuYW1lIGlzIG5vdCBlbmZvcmNlZCwgYnV0IHJlY29tbWVuZGVkCj4gPiA+
IGJ5IERUIHByb2plY3QuCj4gPiA+IAo+ID4gPiAgIERUQyAgICAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MnguZXhhbXBsZS5kdC55YW1sCj4gPiA+ICAgQ0hFQ0sg
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC5leGFtcGxlLmR0
LnlhbWwKPiA+ID4gCj4gPiA+IC9ob21lL2FsZXgvYnVpbGQvbGludXgvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MnguZXhhbXBsCj4gPiA+IGUuZHQueWFtbDogcHdt
bGVkczogJ3BhbmVsJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6Cj4gPiA+ICde
bGVkKC1bMC05YS1mXSspPyQnLCAncGluY3RybC1bMC05XSsnPiAKPiA+ID4gICAgICAgICBGcm9t
IHNjaGVtYToKPiA+ID4gICAgICAgICAvaG9tZS9hbGV4L3NyYy9saW51eC9sZWRzL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzLwo+ID4gPiAgICAgICAgIGxlZHMtcHdtLnlh
bWw+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgRGFobCA8cG9zdEBsZXNwb2NreS5k
ZT4KPiA+ID4gLS0tCj4gPiA+IAo+ID4gPiBOb3RlczoKPiA+ID4gICAgIHY2IC0+IHY3Ogo+ID4g
PiAgICAgICAqIGFkZGVkIHdhcm5pbmcgbWVzc2FnZSB0byBjb21taXQgbWVzc2FnZSAoS3J6eXN6
dG9mIEtvemxvd3NraSkKPiA+ID4gICAgIAo+ID4gPiAgICAgdjY6Cj4gPiA+ICAgICAgICogYWRk
ZWQgdGhpcyBwYXRjaCB0byBzZXJpZXMKPiA+ID4gIAo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MngueWFtbCB8IDUgKysrLS0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MngueWFt
bAo+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4Lnlh
bWwgaW5kZXgKPiA+ID4gNTQxYjA2ZDgwZTczLi45MmRjNDhhOGRmYTcgMTAwNjQ0Cj4gPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LnlhbWwKPiA+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MngueWFt
bAo+ID4gPiAKPiA+ID4gQEAgLTkwLDEwICs5MCwxMSBAQCBleGFtcGxlczoKPiA+ID4gICAgICAg
ICAgICAgIH07Cj4gPiA+ICAgICAgCj4gPiA+ICAgICAgfTsKPiA+ID4gCj4gPiA+IC0gICAgcHdt
bGVkcyB7Cj4gPiA+ICsgICAgbGVkLWNvbnRyb2xsZXIgewo+ID4gPiAKPiA+ID4gICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAicHdtLWxlZHMiOwo+ID4gPiAKPiA+ID4gLSAgICAgICAgICAgIHBh
bmVsIHsKPiA+ID4gKyAgICAgICAgICAgIGxlZC0xIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgbGFiZWwgPSAicGFuZWwiOwo+ID4gPiAKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgcHdt
cyA9IDwmaXFzNjIwYV9wd20gMCAxMDAwMDAwPjsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
bWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKPiA+ID4gICAgICAgICAgICAgIAo+ID4gPiAgICAgICAg
ICAgICAgfTsKPiA+IAo+ID4gSSBsaWtlIHRoZSBjb25zaXN0ZW5jeSB0aGlzIGJyaW5ncy4gTXkg
b25seSBmZWVkYmFjayBpcyB0aGF0IGluIHRoZSBvdGhlcgo+ID4gZXhhbXBsZXMgSSBmb3VuZCAo
Y29tbW9uLnlhbWwgYW5kIGxlZHMtZ3Bpby55YW1sKSwgdGhlIGNoaWxkcmVuIGNvdW50IG9mZgo+
ID4gZnJvbSAwIChlLmcuIGxlZC0wKSBpbnN0ZWFkIG9mIDEgYXMgeW91ciBzZXJpZXMgYXBwZWFy
cyB0by4KPiAKPiBZb3UncmUgcmlnaHQuICBBbmQgdGhhdCdzIGFsc28gdGhlIHNhbWUgaW4gbGVk
cy1scDUweHgueWFtbCBhbmQg4oCmIHdlbGwgSSBkaWQgCj4gbm90IGxvb2sgY2xvc2UgZW5vdWdo
LCBtYXliZSB0aGUgbnVtYmVyaW5nIHNjaGVtZSBvbiB0aGUgUENCIG9uIG15IGRlc2sgCj4gY29u
ZnVzZWQgbWUuCgpJZiB5b3UgY2FuIHRpZSB0aGUgbnVtYmVyaW5nIHRvIHRoZSBQQ0IsIHRoZW4g
ZG8gdGhhdC4KCj4gT2theSwgd2UgYXJlIGFscmVhZHkgdGFsa2luZyBhYm91dCBzdGFydGluZyBp
bmRleC4gIFdoYXQgYWJvdXQgdGhlIHBhcmVudCAKPiBub2RlJ3MgImxlZC1jb250cm9sbGVyIiB0
aGVuIGluIGNhc2UgdGhlcmUgYXJlIG1vcmUgdGhhbiBvbmU/ICBJSVJDIFJvYiAKPiBhY2tub3ds
ZWRnZWQgc3RhcnRpbmcgZnJvbSAxIGxpa2UgImxlZC1jb250cm9sbGVyLTEiLCAibGVkLWNvbnRy
b2xsZXItMiIgYW5kIAo+IHNvIG9uLgoKTm8sIEknZCBhc3N1bWUgd2Ugc3RhcnQgYXQgMC4KCj4g
PiBUaGF0J3Mgbm90IGEgaHVnZSBkZWFsOyBpdCBzaW1wbHkgc2VlbXMgbW9yZSBjb25zaXN0ZW50
IHRvIGNvdW50IGZyb20gdGhlCj4gPiBmaXJzdCBpbmRleCBhbGxvd2VkIGJ5IHRoZSByZWdleCAo
MCkuIFRoZSBwYXRjaCBpcyBzdGlsbCBmaW5lLCBhbmQgc286Cj4gPiAKPiA+IEFja2VkLWJ5OiBK
ZWZmIExhQnVuZHkgPGplZmZAbGFidW5keS5jb20+Cj4gCj4gVGhhbmtzLgo+IAo+IEknbSBub3Qg
c3VyZSBob3cgbWFueSBtb3JlIGl0ZXJhdGlvbnMgb2YgdGhpcyBzZXJpZXMgd2Ugd2lsbCBuZWVk
LCBhdCBsZWFzdCAKPiBvbmUgZm9yIHRoZSBiaW5kaW5nIGxpY2Vuc2UgYWNrcyBJIGd1ZXNzLCBz
byBJIGNvdWxkIGFsc28gYWRhcHQgdGhlIGNoaWxkIG5vZGUgCj4gaW5kZXhlcyBpbiBzY2hlbWEg
YW5kIGFjdHVhbCBkdHMgZmlsZXMgaW4gdjggb3Igc28uCj4gCj4gR3JlZXRzCj4gQWxleAo+IAo+
IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
