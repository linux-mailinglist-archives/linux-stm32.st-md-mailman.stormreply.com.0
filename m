Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E157774B3
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:35:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13234C6B469;
	Thu, 10 Aug 2023 09:35:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7BDEC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:35:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37A7sSNr008184; Thu, 10 Aug 2023 11:35:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=zGTx/TPYvNkGvWVgmB1ZlY4LSYz/JQyApXK4ovlxMGU=; b=Tv
 BqwBEIGCeYndObMm1vFfuQakqEwlAE6ymXG8v9JDStGQ5f1tUPQ1ADWXtnWJfA9m
 mHCrufTvq8yXEQKGCWoOBnJ3xfQZLHHOU6wNulOwu7NBlsXkTwpMFT8IhRxQAMTc
 v1hO9Ekd48hOsbVyP47GbTgWVwoRelIbUXyMm+W53Ia+/c/nedemQ94CGCVY/RTE
 NhG60yfJOEyAwpC50hr0HmeVVebrmdsMR35xSiRt9OS9SCEXSp1upd3tmTYqm6PI
 KglTUkrfWWkcjnycGiqfCnkwg0ZlyJlm5in0XZWEPSITwxZbZjF23567LB2iubP2
 v9/qw8MxwWbt9dRHCLYw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3scdv7n0bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 11:35:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 558CC100053;
 Thu, 10 Aug 2023 11:35:22 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13F552138D5;
 Thu, 10 Aug 2023 11:35:22 +0200 (CEST)
Received: from [10.201.21.98] (10.201.21.98) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 10 Aug
 2023 11:35:21 +0200
Message-ID: <78eedd86-bc3b-9e0a-96b2-a16018aa0c62@foss.st.com>
Date: Thu, 10 Aug 2023 11:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230731165456.799784-1-u.kleine-koenig@pengutronix.de>
 <20230731165456.799784-2-u.kleine-koenig@pengutronix.de>
 <f9ddac2f-28c0-1804-a1de-b8c8e9972638@foss.st.com>
 <20230809105820.5yp3jzv4spe47qb4@pengutronix.de>
From: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
In-Reply-To: <20230809105820.5yp3jzv4spe47qb4@pengutronix.de>
X-Originating-IP: [10.201.21.98]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_09,2023-08-09_01,2023-05-22_02
Cc: kernel@pengutronix.de, Herbert Xu <herbert@gondor.apana.org.au>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

SGVsbG8sCgpPbiA4LzkvMjMgMTI6NTgsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEkgdXN1
YWxseSBsZXQgbWFpbnRhaW5lcnMgZGVjaWRlIGlmIHRoZXkgd2FudCB0aGlzIENjIGxpbmUgYW5k
IGluCj4gcHJhY3Rpc2UgdGhlIEZpeGVzOiBsaW5lIHNlZW1zIHRvIGJlIGVub3VnaCBmb3IgdGhl
IHN0YWJsZSB0ZWFtIHRvIHBpY2sKPiB1cCBhIGNvbW1pdCBmb3IgYmFja3BvcnRpbmcuCgpPaywg
SSB0aG91Z2h0IHRoaXMgd2FzIHJlcXVpcmVkIHRvIGFwcGx5IHRoZSBwYXRjaCBjb3JyZWN0bHkg
b24gcHJldmlvdXMgCnN0YWJsZSByZWxlYXNlcy4gKFNvbWVvbmUgYXNrZWQgbWUgdG8gZG8gaXQg
b24gb25lIG9mIG15IHByZXZpb3VzIHBhdGNoKQoKPiBJZiB5b3VyIG1haWwgbWVhbnMgSSBzaG91
bGQgcmVzZW5kIHRoZSBwYXRjaCBqdXN0IHRvIGFkZCB0aGUgQ2M6IGxpbmUsCj4gcGxlYXNlIHRl
bGwgbWUgYWdhaW4uIFNob3VsZCBJIHJlc2VudCBwYXRjaGVzIDIgYW5kIDMgdGhlbiwgdG9vPwoK
Tm8sIHBhdGNoIDMgd2lsbCBicmVhayB0aGUgZHJpdmVyIG9uIHByZXZpb3VzIHZlcnNpb24gYmVj
YXVzZSByZW1vdmVfbmV3CmRvZXMgbm90IGV4aXN0LgpJIGRvbid0IHRoaW5rIGl0J3MgbWFuZGF0
b3J5IGZvciBwYXRjaCAyLCBpdCdzIGFuIG9wdGltaXNhdGlvbiBpdCBkb2VzIApub3QgZml4IHNv
bWV0aGluZyBicm9rZW4uIFRoZSBkcml2ZXIgd29ya3MgYXMgaW50ZW5kZWQgd2l0aCB0aGUgCmNv
bmRpdGlvbiBzbyBubyBuZWVkIHRvIHJlbW92ZSBpdC4KClRob21hcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
