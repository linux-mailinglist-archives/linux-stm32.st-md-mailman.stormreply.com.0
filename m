Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1BBA7048B
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 16:05:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C71FC78F7F;
	Tue, 25 Mar 2025 15:05:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC7D7C78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 15:05:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D31E43C45;
 Tue, 25 Mar 2025 15:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41210C4CEE4;
 Tue, 25 Mar 2025 15:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742915139;
 bh=pxDDzt3nXUXBJ/7Nv/uhVEfW6KoJT8d7Gu3T3cGsCac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rKdFWddW8jtX6bS9n8hjOA976IYOYP7nA6athtLfM+7hFY0ixM+smcB30Vj+9uSF7
 ktsCSkppAznydPwy03iNQ1gukIoxNeM41eVmsgJ0a1M1cbbSLCfNpyInFrSqUl/Aw5
 jMObZVGVY+cSvnVNsEYx1xIGvGY9gyG5Uey708/ZV16iPutpSKHhN3to+upNO6Uayq
 P7J91fFRG5NZImijGtk6IlwSccukWf9jUYE92yLjebGO0eGmmuGVtwyPTUNpx2qSig
 fK5o4aukrUrMzRpwOqmSb/Qjc5r2MDTrSClmITbLV/IdmO9iXR5XzQ+AV/w0BGfTKD
 23m9njrR00J6A==
Date: Tue, 25 Mar 2025 10:05:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Message-ID: <174291508527.2051452.5158369080088647376.robh@kernel.org>
References: <20250325110409.2323611-1-goran.radni@gmail.com>
 <20250325110409.2323611-3-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250325110409.2323611-3-goran.radni@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <gradenovic@ultratronik.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/3] dt-bindings: arm: stm32: Document
 Ultratronik's Fly board DT binding
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

Ck9uIFR1ZSwgMjUgTWFyIDIwMjUgMTI6MDQ6MDYgKzAxMDAsIEdvcmFuIFJhxJFlbm92acSHIHdy
b3RlOgo+IEZyb206IEdvcmFuIFJhxJFlbm92acSHIDxncmFkZW5vdmljQHVsdHJhdHJvbmlrLmRl
Pgo+IAo+IFRoaXMgY29tbWl0IGRvY3VtZW50cyB1bHRyYS1mbHktc2JjIGRldmljZXRyZWUgYmlu
ZGluZyBiYXNlZCBvbgo+IFNUTTMyTVAxNTcgU29DLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdvcmFu
IFJhxJFlbm92acSHIDxnb3Jhbi5yYWRuaUBnbWFpbC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCB8IDUgKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAoKClBsZWFzZSBhZGQgQWNrZWQtYnkv
UmV2aWV3ZWQtYnkgdGFncyB3aGVuIHBvc3RpbmcgbmV3IHZlcnNpb25zLiBIb3dldmVyLAp0aGVy
ZSdzIG5vIG5lZWQgdG8gcmVwb3N0IHBhdGNoZXMgKm9ubHkqIHRvIGFkZCB0aGUgdGFncy4gVGhl
IHVwc3RyZWFtCm1haW50YWluZXIgd2lsbCBkbyB0aGF0IGZvciBhY2tzIHJlY2VpdmVkIG9uIHRo
ZSB2ZXJzaW9uIHRoZXkgYXBwbHkuCgpJZiBhIHRhZyB3YXMgbm90IGFkZGVkIG9uIHB1cnBvc2Us
IHBsZWFzZSBzdGF0ZSB3aHkgYW5kIHdoYXQgY2hhbmdlZC4KCk1pc3NpbmcgdGFnczoKCkFja2Vk
LWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
