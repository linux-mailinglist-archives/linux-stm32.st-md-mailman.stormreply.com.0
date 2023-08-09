Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA4F77545C
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Aug 2023 09:45:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A29ABC6B472;
	Wed,  9 Aug 2023 07:45:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5C3EC6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Aug 2023 07:45:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3795L1ge008160; Wed, 9 Aug 2023 09:44:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=nz0H1Z+OBWW1YMb0cFHjQXSIrxZdBeUAIrANTmveQkI=; b=UR
 Rc7iEG20nYN3g8UCo6wRUif/BuGIWfLp8pg1OUPuMJcQQmBFZJCj/Yu7JdomTuvH
 f3FMNMGNaWic1Yxr+NPqKRyyIEHGlBUns+oV8WHCIL3XZu1QC6EbK7yKee7Zr2Dr
 A4CUPdhdsx0UBnDtzwywFuL311Pjh68iQIehTA8gOF0cfSG9D19w3PMPARdNwmeL
 OkoBHa5tVFooPAvxXzsC077iAzSbcC80U85o88WHju9603wBrkZ5R0D0aWMFhD1d
 6XOp1SJtTslWknrSbPy+SO8HZya+DitI/DbptG7Jj93cFXPw7pmnGLDkxRuKH8kU
 Zir/WGSJ+Ikfwd8yzC0w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sbjfn6yx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Aug 2023 09:44:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1A05100061;
 Wed,  9 Aug 2023 09:44:47 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9463E212FAA;
 Wed,  9 Aug 2023 09:44:47 +0200 (CEST)
Received: from [10.201.21.98] (10.201.21.98) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 9 Aug
 2023 09:44:46 +0200
Message-ID: <f9ddac2f-28c0-1804-a1de-b8c8e9972638@foss.st.com>
Date: Wed, 9 Aug 2023 09:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Linus Walleij
 <linus.walleij@linaro.org>, Lionel Debieve <lionel.debieve@foss.st.com>
References: <20230731165456.799784-1-u.kleine-koenig@pengutronix.de>
 <20230731165456.799784-2-u.kleine-koenig@pengutronix.de>
From: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
In-Reply-To: <20230731165456.799784-2-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.201.21.98]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_06,2023-08-08_01,2023-05-22_02
Cc: kernel@pengutronix.de, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] crypto: stm32/hash - Properly handle
 pm_runtime_get failing
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

SGVsbG8sCgpUaGFua3MgZm9yIHRoZSBtb2RpZmljYXRpb24uClRoaXMgc2hvdWxkIGJlIGFwcGxp
ZWQgZm9yIGZpeGVzL3N0YWJsZS4KUGxlYXNlIGFkZCBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
ZyBpbiB5b3VyIGNvbW1pdCBtZXNzYWdlLgoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCgpPbiA3LzMx
LzIzIDE4OjU0LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBJZiBwbV9ydW50aW1lX2dldCgp
IChkaXNndWlzZWQgYXMgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpKSBmYWlscywgdGhpcwo+
IG1lYW5zIHRoZSBjbGsgd2Fzbid0IHByZXBhcmVkIGFuZCBlbmFibGVkLiBSZXR1cm5pbmcgZWFy
bHkgaW4gdGhpcyBjYXNlCj4gaG93ZXZlciBpcyB3cm9uZyBhcyB0aGVuIHRoZSBmb2xsb3dpbmcg
cmVzb3VyY2UgZnJlZXMgYXJlIHNraXBwZWQgYW5kIHRoaXMKPiBpcyBuZXZlciBjYXRjaGVkIHVw
LiBTbyBkbyBhbGwgdGhlIGNsZWFudXBzIGJ1dCBjbGtfZGlzYWJsZV91bnByZXBhcmUoKS4KPiAK
PiBBbHNvIGRvbid0IGVtaXQgYSB3YXJuaW5nLCBhcyBzdG0zMl9oYXNoX3J1bnRpbWVfcmVzdW1l
KCkgYWxyZWFkeSBlbWl0dGVkCj4gb25lLgo+IAo+IE5vdGUgdGhhdCB0aGUgcmV0dXJuIHZhbHVl
IG9mIHN0bTMyX2hhc2hfcmVtb3ZlKCkgaXMgbW9zdGx5IGlnbm9yZWQgYnkKPiB0aGUgZGV2aWNl
IGNvcmUuIFRoZSBvbmx5IGVmZmVjdCBvZiByZXR1cm5pbmcgemVybyBpbnN0ZWFkIG9mIGFuIGVy
cm9yCj4gdmFsdWUgaXMgdG8gc3VwcHJlc3MgYW5vdGhlciB3YXJuaW5nIGluIHBsYXRmb3JtX3Jl
bW92ZSgpLiBTbyByZXR1cm4gMAo+IGV2ZW4gaWYgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgp
IGZhaWxlZC4KPiAKPiBGaXhlczogOGI0ZDU2NmRlNmE1ICgiY3J5cHRvOiBzdG0zMi9oYXNoIC0g
QWRkIHBvd2VyIG1hbmFnZW1lbnQgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgIGRyaXZl
cnMvY3J5cHRvL3N0bTMyL3N0bTMyLWhhc2guYyB8IDcgKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jcnlwdG8vc3RtMzIvc3RtMzItaGFzaC5jIGIvZHJpdmVycy9jcnlwdG8vc3RtMzIvc3Rt
MzItaGFzaC5jCj4gaW5kZXggODhhMTg2YzNkZDc4Li43NWQyODFlZGFlMmEgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItaGFzaC5jCj4gKysrIGIvZHJpdmVycy9jcnlw
dG8vc3RtMzIvc3RtMzItaGFzaC5jCj4gQEAgLTIxMjEsOSArMjEyMSw3IEBAIHN0YXRpYyBpbnQg
c3RtMzJfaGFzaF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAlpZiAo
IWhkZXYpCj4gICAJCXJldHVybiAtRU5PREVWOwo+ICAgCj4gLQlyZXQgPSBwbV9ydW50aW1lX3Jl
c3VtZV9hbmRfZ2V0KGhkZXYtPmRldik7Cj4gLQlpZiAocmV0IDwgMCkKPiAtCQlyZXR1cm4gcmV0
Owo+ICsJcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhoZGV2LT5kZXYpOwo+ICAgCj4gICAJc3Rt
MzJfaGFzaF91bnJlZ2lzdGVyX2FsZ3MoaGRldik7Cj4gICAKPiBAQCAtMjEzOSw3ICsyMTM3LDgg
QEAgc3RhdGljIGludCBzdG0zMl9oYXNoX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICAgCXBtX3J1bnRpbWVfZGlzYWJsZShoZGV2LT5kZXYpOwo+ICAgCXBtX3J1bnRpbWVf
cHV0X25vaWRsZShoZGV2LT5kZXYpOwo+ICAgCj4gLQljbGtfZGlzYWJsZV91bnByZXBhcmUoaGRl
di0+Y2xrKTsKPiArCWlmIChyZXQgPj0gMCkKPiArCQljbGtfZGlzYWJsZV91bnByZXBhcmUoaGRl
di0+Y2xrKTsKPiAgIAo+ICAgCXJldHVybiAwOwo+ICAgfQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
