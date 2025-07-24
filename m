Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3D7B109E8
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jul 2025 14:09:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 090DAC3F92E;
	Thu, 24 Jul 2025 12:09:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F08AAC3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 12:09:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OBrGXN014397;
 Thu, 24 Jul 2025 14:08:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3RnDGhuhVntOp6Bg9NBCgGc0N9Ug1qhTvHYB+v00dW0=; b=0tZ/WVhYUJ/aOg/R
 scH3RUnxsqa9j+TqXSLg0ad6+qeu5Yqpc/MO5HTw5hmwdUFL1QzorTPoLIP7+UYA
 9wYcFoLw5Yy0Skm/sktJp2umdkzY1Mwii/e30qhvAHPqFrov6hKaOhSKmARNZHwD
 5yafeHYwLujwoaz7glh5PvGL2ylvQkPapjtz9NWbValnpD6rMlqFsL0mmSMhNrxA
 gTCJLGsoq3PBljWlAx5e8r4eGDZwvF+lR6iwuTbzs9Gmt762tvw26HAhZclAru3b
 gYDmLxKEW59nHDZuPSy/Jes3VhnT+ED2QLp47DT9136WAx7VjD8JEBuLSA0r9MZR
 GIMM7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q2hdar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jul 2025 14:08:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BFB5840046;
 Thu, 24 Jul 2025 14:07:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 810B56C49AC;
 Thu, 24 Jul 2025 14:07:20 +0200 (CEST)
Received: from [10.48.86.103] (10.48.86.103) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 14:07:19 +0200
Message-ID: <7ef4ce0e-8690-43ab-90c4-84cebb4e58e7@foss.st.com>
Date: Thu, 24 Jul 2025 14:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Colin Ian King <colin.i.king@gmail.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-crypto@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20250724105754.140400-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Maxime MERE <maxime.mere@foss.st.com>
In-Reply-To: <20250724105754.140400-1-colin.i.king@gmail.com>
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH][next] crypto: stm32: Fix spelling mistake
 "STMicrolectronics" -> "STMicroelectronics"
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

SGksIHRoYW5rcyBmb3IgdGhlIHR5cG8gZml4LgoKQWNrZWQtYnk6IE1heGltZSBNw6lyw6kgPG1h
eGltZS5tZXJlQGZvc3Muc3QuY29tPgoKT24gNy8yNC8yNSAxMjo1NywgQ29saW4gSWFuIEtpbmcg
d3JvdGU6Cj4gVGhlcmUgaXMgYSBzcGVsbGluZyBtaXN0YWtlIGluIHRoZSBtb2R1bGUgZGVzY3Jp
cHRpb24gdGV4dC4gRml4IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxj
b2xpbi5pLmtpbmdAZ21haWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9jcnlwdG8vc3RtMzIvc3Rt
MzItY3J5cC5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWNy
eXAuYyBiL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWNyeXAuYwo+IGluZGV4IGE4OWI0YzVk
NjJhMC4uNWU4MmU4YTFmNzFhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0
bTMyLWNyeXAuYwo+ICsrKyBiL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWNyeXAuYwo+IEBA
IC0yNzgxLDUgKzI3ODEsNSBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9j
cnlwX2RyaXZlciA9IHsKPiAgIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoc3RtMzJfY3J5cF9kcml2
ZXIpOwo+ICAgCj4gICBNT0RVTEVfQVVUSE9SKCJGYWJpZW4gRGVzc2VubmUgPGZhYmllbi5kZXNz
ZW5uZUBzdC5jb20+Iik7Cj4gLU1PRFVMRV9ERVNDUklQVElPTigiU1RNaWNyb2xlY3Ryb25pY3Mg
U1RNMzIgQ1JZUCBoYXJkd2FyZSBkcml2ZXIiKTsKPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJTVE1p
Y3JvZWxlY3Ryb25pY3MgU1RNMzIgQ1JZUCBoYXJkd2FyZSBkcml2ZXIiKTsKPiAgIE1PRFVMRV9M
SUNFTlNFKCJHUEwiKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
