Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A5282AD59
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 12:27:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2360DC6DD66;
	Thu, 11 Jan 2024 11:27:14 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCA15C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 11:27:12 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dbed430ef5eso4307806276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 03:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704972432; x=1705577232;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e7JiucPuK5mIn3VsB07u7y+OPsd0Eht681B5IDggD3Q=;
 b=qoiBKrah0HEqnDCfYl6omR+/eY/Oal82k4dpAloW9CcyzKllLhdYyMYiZEQnfE3WDb
 bouhTbkKP+X7/LFngvbkzu6dogYRoRiExMvHmWxsjhqfajVWg4SAlgqZ3YkWlZ2X1Vyv
 B1LKotOdo4Jg879WnfD3ZEbrUNgsprcWtGJ00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704972432; x=1705577232;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e7JiucPuK5mIn3VsB07u7y+OPsd0Eht681B5IDggD3Q=;
 b=Qm7pSTlVMa2wXD0OQ3P45/RCEe14kGloKh7DuNG5C/kFFyaDj/rVD8UglG5OPqd6TN
 FhOrOfb4DH94ow2MikCgJNtAayLWipkjvL1ls8EGSA1NknC7uL7CJB2hgmsfjTGu3x+u
 OKk7UaapBowfIelfVdiW9i+FLUxsnWkj8rMjaNu3Wtmrf6XHV8Jp2GNciP+K2iwaFa8G
 /1hsxGwzS5hZQ54nvI2P1dxa206gLDrPvr0KWL2AnfKBZ5srB2tvScEwndHSA34dRNQJ
 3mT3v7Qh8b24vzP3WWxzyyk3uORthjHBq23Y434B0MbQDqIP4rzebg4nRERsRKNotZO3
 ezLg==
X-Gm-Message-State: AOJu0YwJpEe0xSZGzNFgEd8+ci71bpL4jtd6/M50A2o8nzDqYYE9VV4W
 QA9S0QomZcEUcY//NEGrKlp+bTq5AGPNsqf4QrJGTlbmBo3Q8A==
X-Google-Smtp-Source: AGHT+IEJB+Qnxg6nM+JT5HuGkpy4wIhVH7/I5L9g6bPm+oKIAEIYU5M688AvqqnEcIedqWHcdj7tivFvlabNsODp5ng=
X-Received: by 2002:a25:ad14:0:b0:dbe:a48f:8322 with SMTP id
 y20-20020a25ad14000000b00dbea48f8322mr1087326ybi.71.1704972431668; Thu, 11
 Jan 2024 03:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20240110080729.3238251-1-dario.binacchi@amarulasolutions.com>
 <20240110080729.3238251-6-dario.binacchi@amarulasolutions.com>
 <7889dff7-2c38-43c0-b6f7-281a20ae9733@foss.st.com>
In-Reply-To: <7889dff7-2c38-43c0-b6f7-281a20ae9733@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 11 Jan 2024 12:27:00 +0100
Message-ID: <CABGWkvoatqxz2_8_7khHAC8n4gFNyvfDPR3A88fsfuppJxN_5Q@mail.gmail.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org,
 Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 5/5] ARM: dts: add
	stm32f769-disco-mb1225-revb03-mb1166-reva09
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

SGkgUmFwaGFlbCwKCk9uIFRodSwgSmFuIDExLCAyMDI0IGF0IDEyOjIy4oCvUE0gUmFwaGFlbCBH
YWxsYWlzLVBvdQo8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4KPgo+
IE9uIDEvMTAvMjQgMDk6MDUsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+ID4gQXMgcmVwb3J0ZWQg
aW4gdGhlIHNlY3Rpb24gOC4zIChpLiBlLiBCb2FyZCByZXZpc2lvbiBoaXN0b3J5KSBvZiBkb2N1
bWVudAo+ID4gVU0yMDMzIChpLiBlLiBEaXNjb3Zlcnkga2l0IHdpdGggU1RNMzJGNzY5TkkgTUNV
KSB0aGVzZSBhcmUgdGhlIGNoYW5nZXMKPiA+IHJlbGF0ZWQgdG8gdGhlIGJvYXJkIHJldmlzaW9u
cyBhZGRyZXNzZWQgYnkgdGhlIHBhdGNoOgo+ID4gLSBCb2FyZCBNQjEyMjUgcmV2aXNpb24gQi0w
MzoKPiA+ICAgLSBNZW1vcnkgTUlDUk9OIE1UNDhMQzRNMzJCMkI1LTZBIHJlcGxhY2VkIGJ5IElT
U0kgSVM0MlMzMjQwMEYtNkJMCj4gPiAtIEJvYXJkIE1CMTE2NiByZXZpc2lvbiBBLTA5Ogo+ID4g
ICAtIExDRCBGUklEQSBGUkQzOTdCMjUwMDktRC1DVEsgcmVwbGFjZWQgYnkgRlJJREEgRlJENDAw
QjI1MDI1LUEtQ1RLCj4gPgo+ID4gVGhlIHBhdGNoIG9ubHkgYWRkcyB0aGUgRFRTIHN1cHBvcnQg
Zm9yIHRoZSBuZXcgZGlzcGxheSB3aGljaCBiZWxvbmdzIHRvCj4gPiB0byB0aGUgTm92YXRlayBO
VDM1NTEwLWJhc2VkIHBhbmVsIGZhbWlseS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBC
aW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPgo+ID4gLS0t
Cj4gPgo+ID4gQ2hhbmdlcyBpbiB2NjoKPiA+IC0gRHJvcCBwYXRjaGVzCj4gPiAgIC0gWzUvOF0g
ZHQtYmluZGluZ3M6IG50MzU1MTA6IGFkZCBjb21wYXRpYmxlIGZvciBGUklEQSBGUkQ0MDBCMjUw
MjUtQS1DVEsKPiA+ICAgLSBbNy84XSBkcm0vcGFuZWw6IG50MzU1MTA6IG1vdmUgaGFyZHdpcmVk
IHBhcmFtZXRlcnMgdG8gY29uZmlndXJhdGlvbgo+ID4gICAtIFs4LzhdIGRybS9wYW5lbDogbnQz
NTUxMDogc3VwcG9ydCBGUklEQSBGUkQ0MDBCMjUwMjUtQS1DVEsKPiA+ICAgYmVjYXVzZSBhcHBs
aWVkIGJ5IHRoZSBtYWludGFpbmVyIExpbnVzIFdhbGxlaWoKPiA+Cj4gPiBDaGFuZ2VzIGluIHY1
Ogo+ID4gLSBSZXBsYWNlIEdQSU9EX0FTSVMgd2l0aCBHUElPRF9PVVRfSElHSCBpbiB0aGUgY2Fs
bCB0byBkZXZtX2dwaW9kX2dldF9vcHRpb25hbCgpLgo+ID4KPiA+IENoYW5nZXMgaW4gdjI6Cj4g
PiAtIENoYW5nZSB0aGUgc3RhdHVzIG9mIHBhbmVsX2JhY2tsaWdodCBub2RlIHRvICJkaXNhYmxl
ZCIKPiA+IC0gRGVsZXRlIGJhY2tsaWdodCBwcm9wZXJ0eSBmcm9tIHBhbmVsMCBub2RlLgo+ID4g
LSBSZS13cml0ZSB0aGUgcGF0Y2ggWzgvOF0gImRybS9wYW5lbDogbnQzNTUxMDogc3VwcG9ydCBG
UklEQSBGUkQ0MDBCMjUwMjUtQS1DVEsiCj4gPiAgIGluIHRoZSBzYW1lIHN0eWxlIGFzIHRoZSBv
cmlnaW5hbCBkcml2ZXIuCj4gPgo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgLi4uMmY3NjktZGlzY28tbWIxMjI1LXJldmIwMy1t
YjExNjYtcmV2YTA5LmR0cyB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9i
b290L2R0cy9zdC9zdG0zMmY3NjktZGlzY28tbWIxMjI1LXJldmIwMy1tYjExNjYtcmV2YTA5LmR0
cwo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9NYWtlZmlsZSBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlCj4gPiBpbmRleCA3ODkyYWQ2OWI0NDEuLjM5MGRi
ZDMwMGE1NyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlCj4g
PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9NYWtlZmlsZQo+ID4gQEAgLTIzLDYgKzIzLDcg
QEAgZHRiLSQoQ09ORklHX0FSQ0hfU1RNMzIpICs9IFwKPiA+ICAgICAgIHN0bTMyZjQ2OS1kaXNj
by5kdGIgXAo+ID4gICAgICAgc3RtMzJmNzQ2LWRpc2NvLmR0YiBcCj4gPiAgICAgICBzdG0zMmY3
NjktZGlzY28uZHRiIFwKPgo+IEhpIERhcmlvLAo+Cj4KPiBEaWQgeW91IG1lYW50IGR0YiBoZXJl
ID8gOykKR29vZCBjYXRjaCEKVGhhbmtzIGZvciB0aGUgcmV2aWV3IQoKUmVnYXJkcywKRGFyaW8K
Cj4KPgo+IFJlZ2FyZHMsCj4KPiBSYXBoYcOrbAo+Cj4gPiArICAgICBzdG0zMmY3NjktZGlzY28t
bWIxMjI1LXJldmIwMy1tYjExNjYtcmV2YTA5LmR0cyBcCj4gPiAgICAgICBzdG0zMjQyOWktZXZh
bC5kdGIgXAo+ID4gICAgICAgc3RtMzI3NDZnLWV2YWwuZHRiIFwKPiA+ICAgICAgIHN0bTMyaDc0
M2ktZXZhbC5kdGIgXAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMy
Zjc2OS1kaXNjby1tYjEyMjUtcmV2YjAzLW1iMTE2Ni1yZXZhMDkuZHRzIGIvYXJjaC9hcm0vYm9v
dC9kdHMvc3Qvc3RtMzJmNzY5LWRpc2NvLW1iMTIyNS1yZXZiMDMtbWIxMTY2LXJldmEwOS5kdHMK
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjAxNGNhYzE5
MjM3NQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJmNzY5LWRpc2NvLW1iMTIyNS1yZXZiMDMtbWIxMTY2LXJldmEwOS5kdHMKPiA+IEBAIC0wLDAg
KzEsMTggQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gKy8q
Cj4gPiArICogQ29weXJpZ2h0IChjKSAyMDIzIERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2No
aUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+ICsgKi8KPiA+ICsKPiA+ICsjaW5jbHVkZSAic3Rt
MzJmNzY5LWRpc2NvLmR0cyIKPiA+ICsKPiA+ICsmcGFuZWxfYmFja2xpZ2h0IHsKPiA+ICsgICAg
IHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiArfTsKPiA+ICsKPiA+ICsmcGFuZWwwIHsKPiA+ICsg
ICAgIGNvbXBhdGlibGUgPSAiZnJpZGEsZnJkNDAwYjI1MDI1IiwgIm5vdmF0ZWssbnQzNTUxMCI7
Cj4gPiArICAgICB2ZGRpLXN1cHBseSA9IDwmdmNjXzN2Mz47Cj4gPiArICAgICB2ZGQtc3VwcGx5
ID0gPCZ2Y2NfM3YzPjsKPiA+ICsgICAgIC9kZWxldGUtcHJvcGVydHkvYmFja2xpZ2h0Owo+ID4g
KyAgICAgL2RlbGV0ZS1wcm9wZXJ0eS9wb3dlci1zdXBwbHk7Cj4gPiArfTsKCgoKLS0gCgpEYXJp
byBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNj
aGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJl
dmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlv
bnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
