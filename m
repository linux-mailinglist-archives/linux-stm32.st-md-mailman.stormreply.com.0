Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D0047BEA7
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Dec 2021 12:12:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5253BC5E2D4;
	Tue, 21 Dec 2021 11:12:34 +0000 (UTC)
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1451C5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=y3MWVmCp4IRkq6xyrY/A4eXrUjdzp1WMmlbBYxWpWKA=; b=QofDzbsztPc29qGZbjjZr9M4qq
 dv2dd6AWsghoIzKpoJkhuJYGXN6Kz9REkp2qCVAskQE9z/pAXdI/fnIuEyTyCi/nZUnENaulCOXxG
 zpk/cKUN2jR6BFY4v5/AuXbi9r2GR5yYL3NkSmfIMhvYv/xKUqXFFWGCx2J2/EVPL9mYwF6ntYCVz
 QwIKVNaGJuwyAjfKNlfA4Mr4Qwwr7oIpWpidmAb1ZJAFocZ+6dRB1rPYmZdQKa8iiRuRnHSSzl719
 JaWF4NNp4P9LBTAotvzwECAqoL1CQSGO9hgYs+dcKOYNQMb79UO9+tJ2Ej53Ff2O5lsBFWJv5rLF6
 fglotcsQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mzd41-000DYW-B5; Tue, 21 Dec 2021 12:12:13 +0100
Received: from [2001:a61:2bc8:8501:9e5c:8eff:fe01:8578]
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mzd40-000FN1-VF; Tue, 21 Dec 2021 12:12:12 +0100
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 David Lechner <david@lechnology.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>
References: <20211221104546.214066-1-u.kleine-koenig@pengutronix.de>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <dadb79b2-ac21-1899-48b9-1c6723afb1b4@metafoo.de>
Date: Tue, 21 Dec 2021 12:12:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221104546.214066-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26395/Tue Dec 21 10:18:41 2021)
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/8] counter: Remove struct
	counter_device::priv
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

T24gMTIvMjEvMjEgMTE6NDUgQU0sIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEhlbGxvLAo+
Cj4gc2ltaWxhciB0byBwYXRjaAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvNGJkZTdjYmQ5
ZTQzYTU5MDkyMDgxMDIwOTQ0NDQyMTlkMzE1NDQ2Ni4xNjQwMDcyODkxLmdpdC52aWxoZWxtLmdy
YXlAZ21haWwuY29tCj4gdGhlIHVzYWdlIG9mIHN0cnVjdCBjb3VudGVyX2RldmljZTo6cHJpdiBj
YW4gYmUgcmVwbGFjZWQgYnkKPiBjb250YWluZXJfb2Ygd2hpY2ggaW1wcm92ZXMgdHlwZSBzYWZl
dHkgYW5kIGNvZGUgc2l6ZS4KPgo+IFRoaXMgc2VyaWVzIGRlcGVuZHMgb24gYWJvdmUgcGF0Y2gs
IGNvbnZlcnRzIHRoZSByZW1haW5pbmcgZHJpdmVycyBhbmQKPiBmaW5hbGx5IGRyb3BzIHN0cnVj
dCBjb3VudGVyX2RldmljZTo6cHJpdi4KCk5vdCBzdXJlIGlmIHRoaXMgaXMgc3VjaCBhIGdvb2Qg
aWRlYS4gc3RydWN0IGNvdW50ZXJfZGV2aWNlIHNob3VsZCBub3QgCmJlIGVtYmVkZGVkIGluIHRo
ZSBkcml2ZXJzIHN0YXRlIHN0cnVjdCBpbiB0aGUgZmlyc3QgcGxhY2UuCgpzdHJ1Y3QgY291bnRl
cl9kZXZpY2UgY29udGFpbnMgYSBzdHJ1Y3QgZGV2aWNlLCB3aGljaCBpcyBhIHJlZmVyZW5jZSAK
Y291bnRlZCBvYmplY3QuIEJ1dCBieSBlbWJlZGRpbmcgaXQgaW4gdGhlIGRyaXZlciBzdGF0ZSBz
dHJ1Y3QgdGhlIGxpZmUgCnRpbWUgb2YgYm90aCB0aGUgc3RydWN0IGNvdW50ZXJfZGV2aWNlIGFu
ZCBhbmQgc3RydWN0IGRldmljZSBhcmUgYm91bmQgCnRvIHRoZSBsaWZlIHRpbWUgb2YgdGhlIGRy
aXZlciBzdGF0ZSBzdHJ1Y3QuCgpXaGljaCBtZWFucyB0aGUgc3RydWN0IGRldmljZSBtZW1vcnkg
Y2FuIGdldCBmcmVlZCBiZWZvcmUgdGhlIGxhc3QgCnJlZmVyZW5jZSBpcyBkcm9wcGVkLCB3aGlj
aCBsZWFkcyB0byBhIHVzZS1hZnRlci1mcmVlIGFuZCB1bmRlZmluZWQgCmJlaGF2aW9yLgoKVGhl
IGZyYW1ld29yayBzaG91bGQgYmUgY2hhbmdlZCB0byByYXRoZXIgdGhlbiBlbWJlZGRpbmcgdGhl
IHN0cnVjdCAKY291bnRlcl9kZXZpY2UgaW4gdGhlIHN0YXRlIHN0cnVjdCB0byBqdXN0IGhhdmUg
YSBwb2ludGVyIHRvIGl0LiBXaXRoIAp0aGUgc3RydWN0IGNvdW50ZXJfZGV2aWNlIGhhdmluZyBp
dHMgb3duIGFsbG9jYXRpb24gdGhhdCB3aWxsIGJlIGZyZWVkIAp3aGVuIHRoZSBsYXN0IHJlZmVy
ZW5jZSB0byB0aGUgc3RydWN0IGRldmljZSBpcyBkcm9wcGVkLgoKLSBMYXJzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
