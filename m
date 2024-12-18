Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B67869F60DB
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 10:06:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B656C78014;
	Wed, 18 Dec 2024 09:06:53 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9BE7C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 09:06:52 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2efded08c79so4326702a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 01:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734512811; x=1735117611;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GCGMCINTHycaSUk/d2i6Tkx5PMoxq8giUl7PZqrxQnU=;
 b=QcyCS1nfrp4lzDvEED1TjTANY247G9jlYe712Mcmp0pOsqGuJc4BVGpMcF6vZkG6nP
 P4qOGtsxYm8ipXd3IX1GwPwMDsp6oCwOJMEHZZFdXI3jTSCBXOnY8q3GoFJMbvYX6S/c
 F1+Q+nySh17so7S1rdNDWq8jtmfrAApIGDPZ5zjzoE++NC7/mg7TfIzim7NSm/btsBfB
 BsjSIpq98LBQdRBq/ejYQ+WAFvu1SK6pAzZMSECcYUV3TkuNj5+7fgIeuGLceUPji7it
 IKkbtIqBFBzUFY5oNpx13f/TqbpGZ2f7rhkJzccpRR+l/hbYqSA+kSSaWhi18k9Iq53o
 hPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734512811; x=1735117611;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GCGMCINTHycaSUk/d2i6Tkx5PMoxq8giUl7PZqrxQnU=;
 b=TNX0uT/p+atbGr1qg2oVS7Yww7Q1rnpcd6LhUDXCtAKZm0RKI5Y/4+XEP7k92QH6Qx
 J+Ul+u9PdWleLu8ZATx7b6Ovf+spXm1t+PkcjVu5TqnVtZYAbSlAwlDxisL1xvFdvoCd
 Crxyld0mkKCv9emv9vLba7TSuuzafgoNEFiaHCwJbtEj2hLrR7AWlGVAfU2M6hF4pY0Z
 2X6IxYwRCS2hxbo8ydcfJtec0hzWFWn66T0n5xM4K+AFo6W78WgnqMzANZjFmIsFGXng
 JQl7yHAFDb48+hgMZuzpIra58LAEa0YQipk6KAYsbejtlEDiQ4nPfatBCpJcDp42u58y
 ncOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhyVR3sU91luPVf5iOYSHRKHfvgMIk97BHseHb+Ns1dZBPGeQ6PKPqCYk9rO5EoQ8yFQyF4eqJbPwywQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyiZ4VD/yQrDoh96QK9laVhsKjK8yJK4roC9aMGHGsv51oRhGWH
 0Bn1B0Fk8vFys9fUZGqBm7aJGFFlfG5b6YT88LSABwSnDXtVZ2PYc8d7//31Ww==
X-Gm-Gg: ASbGncsV6goE3oUUemNn3PD3mX30e2criDzycyj+/Yh3i6PmokXH0q89Ami+LsAB9jP
 bHCR9WMOOee8kvLs1Qik3oKW6X0EuBs8Iv8ZcyhopEy3Fz+lgCaXoOG8hYk0kcCVbPrkbwiF4tG
 mCTohjTsvkJLgmYMM0vjQE/G+6ITz4yfjGDaeiuaCakEjyF6uFUE6P6WdcN8X1l2892/uI5LwRW
 RbToaUUSAezqXPu+YeG7m88Dvc5tuRdR2s1dbyGAMpz2fl0J1tWL0cQmNy/rRK5t7rE
X-Google-Smtp-Source: AGHT+IHyd0rjMU5k67UAqjTzwzFPT1nFixbQFJlYVvsZ8oxYL1YYOQHvMxEIakRysvdaXHIwPi972g==
X-Received: by 2002:a17:90b:2b8f:b0:2ee:df57:b194 with SMTP id
 98e67ed59e1d1-2f2e91fef48mr2602950a91.21.1734512811162; 
 Wed, 18 Dec 2024 01:06:51 -0800 (PST)
Received: from thinkpad ([117.193.214.60]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-218a1e6d87asm71760635ad.264.2024.12.18.01.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 01:06:50 -0800 (PST)
Date: Wed, 18 Dec 2024 14:36:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20241218090641.dtn4niamg6gcvxml@thinkpad>
References: <20241205172022.GA3053765@bhelgaas>
 <d976d74c-80c0-4446-bb9b-960a990c552b@foss.st.com>
 <20241217172502.borj2oy4rpxcteag@thinkpad>
 <5b835381-55bc-4fc8-b848-535f6e881420@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b835381-55bc-4fc8-b848-535f6e881420@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, quic_schintav@quicinc.com, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, cassel@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 mcoquelin.stm32@gmail.com, linux-pci@vger.kernel.org, bhelgaas@google.com,
 krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25
 PCIe root complex bindings
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMDk6NDI6NDVBTSArMDEwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IAo+IAo+IE9uIDEyLzE3LzI0IDE4OjI1LCBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
d3JvdGU6Cj4gPiBPbiBUdWUsIERlYyAxNywgMjAyNCBhdCAwNDo1Mzo0OFBNICswMTAwLCBDaHJp
c3RpYW4gQnJ1ZWwgd3JvdGU6Cj4gPiA+IAo+ID4gPiA+IE1ha2VzIHNlbnNlLiAgV2hhdCBhYm91
dCBwaHlzLCByZXNldHMsIGV0Yz8gIEknbSBwcmV0dHkgc3VyZSBhIFBIWQo+ID4gPiA+IHdvdWxk
IGJlIGEgcGVyLVJvb3QgUG9ydCB0aGluZywgYW5kIHNvbWUgcmVzZXRzIGFuZCB3YWtldXAgc2ln
bmFscwo+ID4gPiA+IGFsc28uCj4gPiA+ID4gCj4gPiA+ID4gRm9yIG5ldyBkcml2ZXJzLCBJIHRo
aW5rIHdlIHNob3VsZCBzdGFydCBhZGRpbmcgUm9vdCBQb3J0IHN0YW56YXMgdG8KPiA+ID4gPiBz
cGVjaWZpY2FsbHkgYXNzb2NpYXRlIHRob3NlIHRoaW5ncyB3aXRoIHRoZSBSb290IFBvcnQsIGUu
Zy4sCj4gPiA+ID4gc29tZXRoaW5nIGxpa2UgdGhpcz8KPiA+ID4gPiAKPiA+ID4gPiAgICAgcGNp
ZUA0ODQwMDAwMCB7Cj4gPiA+ID4gICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjUtcGNp
ZS1yYyI7Cj4gPiA+ID4gCj4gPiA+ID4gICAgICAgcGNpZUAwLDAgewo+ID4gPiA+ICAgICAgICAg
cmVnID0gPDB4MDAwMCAwIDAgMCAwPjsKPiA+ID4gPiAgICAgICAgIHBoeXMgPSA8JmNvbWJvcGh5
IFBIWV9UWVBFX1BDSUU+Owo+ID4gPiA+ICAgICAgICAgcGh5LW5hbWVzID0gInBjaWUtcGh5IjsK
PiA+ID4gPiAgICAgICB9Owo+ID4gPiA+ICAgICB9Owo+ID4gPiA+IAo+ID4gPiA+IGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbWVkaWF0ZWssbXQ3
NjIxLXBjaWUueWFtbD9pZD12Ni4xMiNuMTExCj4gPiA+ID4gaXMgb25lIGJpbmRpbmcgdGhhdCBk
b2VzIHRoaXMsIG90aGVycyBpbmNsdWRlIGFwcGxlLHBjaWUueWFtbCwKPiA+ID4gPiBicmNtLHN0
Yi1wY2llLnlhbWwsIGhpc2lsaWNvbixraXJpbi1wY2llLnlhbWwuCj4gPiA+ID4gCj4gPiA+IAo+
ID4gPiBPbiBhIHNlY29uZCB0aG91Z2h0LCBtb3ZpbmcgdGhlIFBIWSB0byB0aGUgcm9vdC1wb3J0
IHBhcnQgd291bGQgaW50cm9kdWNlIGEKPiA+ID4gZGlzY3JlcGFuY3kgd2l0aCB0aGUgcGNpZV9l
cCBiaW5kaW5nLCB3aGVyZWFzIHRoZSBQSFkgaXMgcmVxdWlyZWQgb24gdGhlCj4gPiA+IHBjaWVf
ZXAgbm9kZS4KPiA+ID4gCj4gPiA+IEV2ZW4gZm9yIHRoZSBwY2llX3JjLCB0aGUgUEhZIGlzIG5l
ZWRlZCB0byBlbmFibGUgdGhlIGNvcmVfY2xrIHRvIGFjY2Vzcwo+ID4gPiB0aGUgUENJZSBjb3Jl
IHJlZ2lzdGVycywKPiA+ID4gCj4gPiAKPiA+IEJ1dCB3aHkgdGhhdCBtYXR0ZXJzPyBZb3UgY2Fu
IHN0aWxsIHBhcnNlIHRoZSBjaGlsZCBub2RlcywgZW5hYmxlIFBIWSBhbmQKPiA+IGNvbmZpZ3Vy
ZSBQQ0llIHJlZ2lzdGVycy4gPgo+ID4gPiBTbyB0aGF0IHdvdWxkIG1ha2UgMiBkaWZmZXJlbnQg
cmVxdWlyZWQgUEhZIGxvY2F0aW9ucyBmb3IgUkMgYW5kIEVQOgo+ID4gPiAKPiA+ID4gICAgICBw
Y2llX3JjOiBwY2llQDQ4NDAwMDAwIHsKPiA+ID4gICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3Rt
MzJtcDI1LXBjaWUtcmMiOwo+ID4gPiAKPiA+ID4gICAgICAgIHBjaWVAMCwwIHsKPiA+ID4gICAg
ICAgICAgcmVnID0gPDB4MDAwMCAwIDAgMCAwPjsKPiA+ID4gICAgICAgICAgcGh5cyA9IDwmY29t
Ym9waHkgUEhZX1RZUEVfUENJRT47Cj4gPiA+ICAgICAgICAgIHBoeS1uYW1lcyA9ICJwY2llLXBo
eSI7Cj4gPiA+ICAgICAgICB9Owo+ID4gPiAgICAgIH07Cj4gPiA+IAo+ID4gPiAgICAgIHBjaWVf
ZXAgcGNpZUA0ODQwMDAwMCB7Cj4gPiA+ICAgICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMybXAy
NS1wY2llLWVwIjsKPiA+ID4gICAgICAgIHBoeXMgPSA8JmNvbWJvcGh5IFBIWV9UWVBFX1BDSUU+
Owo+ID4gPiAgICAgICAgcGh5LW5hbWVzID0gInBjaWUtcGh5IjsKPiA+ID4gICAgICB9Owo+ID4g
PiAKPiA+ID4gU2ltcGxlc3Qgc2VlbXMgdG8ga2VlcCB0aGUgUEhZIHJlcXVpcmVkIGZvciB0aGUg
cGNpZSBjb3JlIHJlZ2FyZGxlc3Mgb2YgdGhlCj4gPiA+IG1vZGUgYW5kIGtlZXAgdGhlIGVtcHR5
IHJvb3QgcG9ydCB0byBzcGxpdCB0aGUgZGVzaWduCj4gPiA+IAo+ID4gCj4gPiBObyBwbGVhc2Uu
IFRyeSB0byBkbyB0aGUgcmlnaHQgdGhpbmcgZnJvbSB0aGUgc3RhcnQgaXRzZWxmLgo+IAo+IFBh
cnNpbmcgdGhlIGNoaWxkIG5vZGUgdG8gY2xvY2sgdGhlIElQIHNlZW1zIHdlaXJkLiBOb3RlIHRo
YXQKPiBoaXNpbGljb24sa2lyaW4tcGNpZS55YW1sIGFsc28gZGVjbGFyZXMgdGhlIFBIWSBhdCB0
aGUgY29udHJvbGxlciBsZXZlbC4KPiAKCk5vdGhpbmcgaXMgd2VpcmQgaGVyZS4gQWxtb3N0IGFs
bCBtdWx0aSBwb3J0IGNvbnRyb2xsZXIgZHJpdmVycyBkb2VzIHRoZSBzYW1lLgpNb3N0IG9mIHRo
ZSBzaW5nbGUgcG9ydCBjb250cm9sbGVyIGluc3RhbmNlcyBkZWZpbmUgcG9ydCBwcm9wZXJ0aWVz
IGluCmNvbnRyb2xsZXIgbm9kZSBvbmx5LCBidXQgdGhhdCdzIHdoYXQgd2Ugd2FudCB0byBhdm9p
ZCBub3cuCgotIE1hbmkKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+
4K6a4K6/4K614K6u4K+NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
