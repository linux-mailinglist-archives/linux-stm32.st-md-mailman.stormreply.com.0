Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1BB08BE6
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jul 2025 13:47:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F107C36B38;
	Thu, 17 Jul 2025 11:47:24 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D3E7C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 11:47:22 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-556fd896c99so797350e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 04:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752752842; x=1753357642;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hUzQnHUphnbfFgIY49ERlZzZ414PTUWI3wMK+KFf1L8=;
 b=HCYIsBlqmG9pOmwCGBsss2pDT8YbYctKmWgmYPgFdvNv1mhokPL8wbftLy/6nLQ35a
 MqnV2AjVfZm0YbnMbEbhkIgqAzBsWJ+ithi2C2zFDKb290Z4xhJZyED9m2SdrhMeCRP4
 AOXd6SK0vDF/IQp2o+gdISxr5GqTXPAYM/LGRGmaFwkH+OyowHP5pojPvCmx06WFpMQ0
 hprFCrhzoPQJrZdDjmTvI2iAgjYyI9c8JJp7UWLMOl7DOyp/TdzVW2jXzRcwooPT4XMi
 D3raGot6l03wJ+AdPDzBpkpsqlJ2iWdobY/gkaUAN84VwupiBSorXOi3VuLvu3oKhlUP
 Sb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752752842; x=1753357642;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hUzQnHUphnbfFgIY49ERlZzZ414PTUWI3wMK+KFf1L8=;
 b=lYBykOnkqNXuF5iToT+g5lfHr+Rc4azKSZwe/dB4OvscOM122tCUsJcGMJ9dKjW0f8
 fgW1ghCrIvWnUNZKDZavcV3Y/7Vw4WTEutbwwv4bUIHXhdlQgTdxKA44/rMz+0QZy45j
 ohB+DDX1aXfhs9a6K/LFqt2+XAYVxN3i0oi0Ko2U2pQn+KER3wv4UkP50KqNiknUNg8w
 O4Qh4VZCu2i+EJcczUPewEgLfvXzj/Yuj9WTJL7sMd+OTgkHfzkWAQwVfTyZvN6m28jf
 xN/oCDduI4AJeaI8snbuXy+1zi38yKjCRbwz2CiL6URdYqC7MUFgdaVWipFYSXOSTlRc
 C7MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5542StMJqeTCqiOSTEcuqUGdYA+tkxKTyb1779iOZowmuyctNPcZpKL09WOCnPNMt6MoMD7jRNWemCw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwgePBlWlWU0X8CiAR1H0J1kzjr01wV4AOhoEKc61I6ILrVZW1+
 7KxivmRhYNpgfj5hVO0TMnow8G9sxCaAOQm4bYAV0UgS3royVQz2jQyY
X-Gm-Gg: ASbGncuSvaTP57wNnqHvAqyQwARpT8P1IaRMPwHso3EgLWuJarnuL1sB9XgkzsiiOFj
 ZG/BSbny7ySTvkzQ5x35jIQ7kCbJFqPJ/6+CePOCwxMSip10av9A3ij9JQ639tXM6XlNDO5+GuM
 y2yFkw6tHsji7hrKl71OMOIrp6u0J68zF+z2cIZrA0dlbGjJf4iCdskYKtBhUesW6Egv2sFGFET
 W+4lKzwLjrxXMJ0tNXNQa9O/pIC4J4+eOobLnwih7s1S596DBTZc6tzz2UX5X3SPpf3Y6Hj1vtM
 RVe1W4/KnrH+W4ge1hZn00d+Y69v/fabsUZ3Za3mOPrQew8j5nFMysDINHU7l3lMCOBFid2fGZF
 d9bc9pB1DxRyFAi1g+qzmxp/FfI+bXQ==
X-Google-Smtp-Source: AGHT+IEeUss8ZBlPkHLakvGxJF2K58yDRc8vQWOCbMdXUi501yCOkwF9vYWrYBaVVUbMnozeWCQi6Q==
X-Received: by 2002:a05:6512:33c1:b0:553:d910:9340 with SMTP id
 2adb3069b0e04-55a23f72cf3mr1951594e87.46.1752752841436; 
 Thu, 17 Jul 2025 04:47:21 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c7bca2asm3021540e87.29.2025.07.17.04.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 04:47:20 -0700 (PDT)
Date: Thu, 17 Jul 2025 14:47:14 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <6fsqayppkyubkucghk5i6m7jjgytajtzm4wxhtdkh7i2v3znk5@vwqbzz5uffyy>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
 <b192c96a-2989-4bdf-ba4f-8b7bcfd09cfa@lunn.ch>
 <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: xgmac: Correct
 supported speed modes
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

T24gVHVlLCBKdWwgMTUsIDIwMjUgYXQgMDc6MDM6NThQTSArMDUzMCwgRyBUaG9tYXMsIFJvaGFu
IHdyb3RlOgo+IEhpIEFuZHJldywKPiAKPiBUaGFua3MgZm9yIHJldmlld2luZyB0aGUgcGF0Y2gu
Cj4gCj4gT24gNy8xNC8yMDI1IDc6MTIgUE0sIEFuZHJldyBMdW5uIHdyb3RlOgo+ID4gT24gTW9u
LCBKdWwgMTQsIDIwMjUgYXQgMDM6NTk6MThQTSArMDgwMCwgUm9oYW4gRyBUaG9tYXMgdmlhIEI0
IFJlbGF5IHdyb3RlOgo+ID4gPiBGcm9tOiBSb2hhbiBHIFRob21hcyA8cm9oYW4uZy50aG9tYXNA
YWx0ZXJhLmNvbT4KPiA+ID4gCj4gPiA+IENvcnJlY3Qgc3VwcG9ydGVkIHNwZWVkIG1vZGVzIGFz
IHBlciB0aGUgWEdNQUMgZGF0YWJvb2suCj4gPiA+IENvbW1pdCA5Y2I1NGFmMjE0YTcgKCJuZXQ6
IHN0bW1hYzogRml4IElQLWNvcmVzIHNwZWNpZmljCj4gPiA+IE1BQyBjYXBhYmlsaXRpZXMiKSBy
ZW1vdmVzIHN1cHBvcnQgZm9yIDEwTSwgMTAwTSBhbmQKPiA+ID4gMTAwMEhELiAxMDAwSEQgaXMg
bm90IHN1cHBvcnRlZCBieSBYR01BQyBJUCwgYnV0IGl0IGRvZXMKPiA+ID4gc3VwcG9ydCAxME0g
YW5kIDEwME0gRkQgbW9kZSwgYW5kIGl0IGFsc28gc3VwcG9ydHMgMTBNIGFuZAo+ID4gPiAxMDBN
IEhEIG1vZGUgaWYgdGhlIEhEU0VMIGJpdCBpcyBzZXQgaW4gdGhlIE1BQ19IV19GRUFUVVJFMAo+
ID4gPiByZWcuIFRoaXMgY29tbWl0IGFkZHMgc3VwcG9ydCBmb3IgMTBNIGFuZCAxMDBNIHNwZWVk
IG1vZGVzCj4gPiA+IGZvciBYR01BQyBJUC4KPiA+IAo+ID4gPiArKysgYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd3hnbWFjMl9kbWEuYwo+ID4gPiBAQCAtNDA1LDYgKzQw
NSw3IEBAIHN0YXRpYyBpbnQgZHd4Z21hYzJfZ2V0X2h3X2ZlYXR1cmUodm9pZCBfX2lvbWVtICpp
b2FkZHIsCj4gPiA+ICAgCWRtYV9jYXAtPnNtYV9tZGlvID0gKGh3X2NhcCAmIFhHTUFDX0hXRkVB
VF9TTUFTRUwpID4+IDU7Cj4gPiA+ICAgCWRtYV9jYXAtPnZsaGFzaCA9IChod19jYXAgJiBYR01B
Q19IV0ZFQVRfVkxIQVNIKSA+PiA0Owo+ID4gPiAgIAlkbWFfY2FwLT5oYWxmX2R1cGxleCA9ICho
d19jYXAgJiBYR01BQ19IV0ZFQVRfSERTRUwpID4+IDM7Cj4gPiA+ICsJZG1hX2NhcC0+bWJwc18x
MF8xMDAgPSAoaHdfY2FwICYgWEdNQUNfSFdGRUFUX0dNSUlTRUwpID4+IDE7Cj4gPiAKPiA+IFRo
ZSBjb21taXQgbWVzc2FnZSBkb2VzIG5vdCBtZW50aW9uIHRoaXMgY2hhbmdlLgo+IAo+IEFncmVl
ZC4gV2lsbCBkbyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+IAo+ID4gCj4gPiBXaGF0IGRvZXMgWEdN
QUNfSFdGRUFUX0dNSUlTRUwgbWVhbj8gVGhhdCBhIFNFUkRFUyBzdHlsZSBpbnRlcmZhY2UgaXMK
PiA+IG5vdCBiZWluZyB1c2VkPyBDb3VsZCB0aGF0IGJlIHdoeSBTZXJnZSByZW1vdmVkIHRoZXNl
IHNwZWVkcz8gSGUgd2FzCj4gPiBsb29raW5nIGF0IHN5c3RlbXMgd2l0aCBhIFNFUkRFUywgYW5k
IHRoZXkgZG9uJ3Qgc3VwcG9ydCBzbG93ZXIKPiA+IHNwZWVkcz8KPiA+IAo+ID4gCUFuZHJldwo+
IEFzIHBlciB0aGUgWEdNQUMgZGF0YWJvb2sgdmVyIDMuMTBhLCBHTUlJU0VMIGJpdCBvZiBNQUNf
SFdfRmVhdHVyZV8wCj4gcmVnaXN0ZXIgaW5kaWNhdGVzIHdoZXRoZXIgdGhlIFhHTUFDIElQIG9u
IHRoZSBTT0MgaXMgc3ludGhlc2l6ZWQgd2l0aAo+IERXQ1hHX0dNSUlfU1VQUE9SVC4gU3BlY2lm
aWNhbGx5LCBpdCBzdGF0ZXM6Cj4gIjEwMDAvMTAwLzEwIE1icHMgU3VwcG9ydC4gVGhpcyBiaXQg
aXMgc2V0IHRvIDEgd2hlbiB0aGUgR01JSSBJbnRlcmZhY2UKPiBvcHRpb24gaXMgc2VsZWN0ZWQu
Igo+IAo+IFNvIHllcywgaXTigJlzIGxpa2VseSB0aGF0IFNlcmdlIHdhcyB3b3JraW5nIHdpdGgg
YSBTRVJERVMgaW50ZXJmYWNlIHdoaWNoCj4gZG9lc24ndCBzdXBwb3J0IDEwLzEwME1icHMgc3Bl
ZWRzLiBEbyB5b3UgdGhpbmsgaXQgd291bGQgYmUgYXBwcm9wcmlhdGUKPiB0byBhZGQgYSBjaGVj
ayBmb3IgdGhpcyBiaXQgYmVmb3JlIGVuYWJsaW5nIDEwLzEwME1icHMgc3BlZWRzPwoKRFcgWEdN
QUMgSVAtY29yZSBvZiB2Mi54IGFuZCBvbGRlciBkb24ndCBzdXBwb3J0IDEwLzEwME1icHMgbW9k
ZXMKbmVpdGhlciBpbiB0aGUgWEdNSUkgbm9yIGluIHRoZSBHTUlJIGludGVyZmFjZXMuIFRoYXQn
cyB3aHkgSSBkcm9wcGVkCnRoZSAxMC8xMDBNYnBzIGxpbmsgY2FwYWJpbGl0aWVzIHJldGFpbmlu
ZyAxRywgMi41RyBhbmQgMTBHIHNwZWVkcwpvbmx5ICh0aGUgb25seSBzcGVlZHMgc3VwcG9ydGVk
IGZvciBEVyBYR01BQyAxLjIwYS8yLjExYSBUeCBpbiB0aGUKTUFDX1R4X0NvbmZpZ3VyYXRpb24u
U1MgcmVnaXN0ZXIgZmllbGQpLiBBbHRob3VnaCBJIHNob3VsZCBoYXZlCmRyb3BwZWQgdGhlIE1B
Q181MDAwRkQgdG9vIHNpbmNlIGl0IGhhcyBiZWVuIHN1cHBvcnRlZCBzaW5jZSB2My4wCklQLWNv
cmUgdmVyc2lvbi4gTXkgYmFkLigKClN0YXJ0aW5nIGZyb20gRFcgWEdNQUMgdjMuMDBhIElQLWNv
cmUgdGhlIGxpc3Qgb2YgdGhlIHN1cHBvcnRlZCBzcGVlZHMKaGFzIGJlZW4gZXh0ZW5kZWQgdG86
IDEwLzEwME1icHMgKE1JSSksIDFHLzIuNUcgKEdNSUkpLCAyLjVHLzVHLzEwRwooWEdNSUkpLiBU
aHVzIHRoZSBtb3JlIGFwcHJvcHJpYXRlIGZpeCBoZXJlIHNob3VsZCB0YWtlIGludG8gYWNjb3Vu
dAp0aGUgSVAtY29yZSB2ZXJzaW9uLiBMaWtlIHRoaXM6CglpZiAoZG1hX2NhcC0+bWJwc18xMDAw
ICYmIE1BQ19WZXJzaW9uLlNOUFNWRVIgPj0gMHgzMCkKCQlkbWFfY2FwLT5tYnBzXzEwXzEwMCA9
IDE7CgpUaGVuIHlvdSBjYW4gdXNlIHRoZSBtYnBzXzEwMDAgYW5kIG1icHNfMTBfMTAwIGZsYWdz
IHRvIHNldCB0aGUgcHJvcGVyCk1BQy1jYXBhYmlsaXRpZXMgdG8gaHctPmxpbmsuY2FwcyBpbiB0
aGUgZHd4Z21hYzJfc2V0dXAoKSBtZXRob2QuIEkKd291bGQgaGF2ZSBhZGRlZCB0aGUgWEdNSUkg
Mi41Ry81RyBNQUMtY2FwYWJpbGl0aWVzIHNldHRpbmcgdXAgdG8gdGhlCmR3eGdtYWMyX3NldHVw
KCkgbWV0aG9kIHRvbyBmb3IgdGhlIHYzLnggSVAtY29yZXMgYW5kIG5ld2VyLgoKLVNlcmdlKHkp
Cgo+IAo+IEJlc3QgUmVnYXJkcywKPiBSb2hhbgo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
