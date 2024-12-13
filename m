Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76E9F0837
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 10:42:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31E20C78006;
	Fri, 13 Dec 2024 09:42:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17ACDC7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 09:42:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A92E45C62B2;
 Fri, 13 Dec 2024 09:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E4DC4CED0;
 Fri, 13 Dec 2024 09:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734082936;
 bh=++bhXlD9Y7I5XHvBU93y5RbnTsWThKKRO/NBUtN7RhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c+ggrJGbh8WNoUrxYl6GHuDtRMflrlTKIiKD4tKOzvcS2g9SJInRK698lYvhUVeGb
 EgczYJPPbg23J8BurEC0ZSp9z5DEjG8AIADfXygLsLX3ynxNkXMdCu2ADMynvX7R2Z
 huv/FCOPgcg+bUZmZqoL977JQX1+nfgZfSyW07yAFXgQJhQWjCUiI3disR4RVeqbkv
 bVDj/7fmWzrVcg2xuYeuexsoC/J+wbAh4a1i3HTPal62NbKuaWinnb3GMQGobg1gjL
 K2OkbKS64+Ywa4hQ80ylj9sGM3lKBedeVAs5dCnyGn8awlEn6EdpGW1I3ndWGoaqRi
 9yxZqSJgfhjgA==
Date: Fri, 13 Dec 2024 10:42:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <h5gcnt6g5py4shyjpxlr77njkihwepdrn62poii6vyoyvwximv@fmb4becmsvwq>
References: <20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de>
 <20241210-lxa-fairytux-v1-1-9aea01cdb83e@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241210-lxa-fairytux-v1-1-9aea01cdb83e@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH stm32-next 1/2] dt-bindings: arm: stm32:
 add compatible strings for Linux Automation GmbH LXA FairyTux 2
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

T24gVHVlLCBEZWMgMTAsIDIwMjQgYXQgMTA6MzI6MjdBTSArMDEwMCwgTWFyYyBLbGVpbmUtQnVk
ZGUgd3JvdGU6Cj4gRnJvbTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRl
Pgo+IAo+IFRoZSBMaW51eCBBdXRvbWF0aW9uIEdtYkggRmFpcnlUdXgyIGlzIGEgc21hbGwgTGlu
dXggZGV2aWNlIGJhc2VkIG9uCj4gYW4gT2N0YXZvIFN5c3RlbXMgT1NEMzJNUDE1M2MgU2lQLCB0
aGF0IG9jY3VwaWVzIGp1c3QgdHdvIHNsb3RzIG9uIGEKPiBESU4gcmFpbC4KPiAKPiBBZGQgY29t
cGF0aWJsZSBmb3IgdGhlIGdlbmVyYXRpb24gMSBhbmQgMiBiYXNlZCBvbiB0aGUgU1RNMzJNUDE1
M2MuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJv
bml4LmRlPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmMgS2xlaW5lLUJ1ZGRlIDxta2xAcGVuZ3V0cm9u
aXguZGU+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3Rt
MzIvc3RtMzIueWFtbCB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
QWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJv
Lm9yZz4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
