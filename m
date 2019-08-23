Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 780A49E36E
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2019 10:58:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 376A9CFAC61;
	Tue, 27 Aug 2019 08:58:32 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 782A7C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2019 16:10:11 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id go14so5819729plb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2019 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=brEz57KSv9M0lzRju932ZTp5uWTNGJMBeYQNt57q3B8=;
 b=LSk4JaiG3kNahJym5ph4p7/DJszhGCxXYsNz9CSryZBvZSEWdvgKnM9o/iYlhJpnhY
 CIxBe/BWxYQDTnOwVGPWaxb7855aVGTWS2LKsP+jgxko4VMfvsyEeaWp11bI5zR40AxO
 SmqZ1nUYR4g85pD5hbkGczt5q5VVEQvWbckzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=brEz57KSv9M0lzRju932ZTp5uWTNGJMBeYQNt57q3B8=;
 b=WTox9wIGk78mOfKQkXhuxEF9K3dDgdnWFRo7PxOc8THgsYIQ9wpOorzip6DhvEP0u2
 UlG8zQtzmoVupqdDdhj+l8ZX12MPM+hNQ/sQIZZmFo6xu6T7GI04nW3rv6Pqd+54tbfs
 L0mCJmom/A7o4vKG9DXawHYHWXUmVs7vIQ4YB36aeh7j1yDf2g1yt0SQZErBY+eG6kBv
 OEp/+FHBGftgmSExEATsT9fEXEyZFHz0vDFnqmP7gMUjwvuPV7PBF/+VEMrDEi5vKza8
 e7nRctN0GFM8iMxkY2yp5D6Qj9QT+ohg+uqH6pKEizSt1xoD1jdgif2w7yN+3YMtv0L/
 +/Mw==
X-Gm-Message-State: APjAAAWleK14+ORzOIyvLHsXAlTFJToWRqp2xl5gRqZZ4+TwQMyuZjke
 LjD9y6rYK7TPqTZKV+OncPmMZw==
X-Google-Smtp-Source: APXvYqxiP2ekIBBxAiFgPENCMVwHMGc68Z6hyNSBFfdXPSdkPG9bT4Of774IUlvHarZSaUjmecbKzA==
X-Received: by 2002:a17:902:f24:: with SMTP id
 33mr3626425ply.309.1566576609501; 
 Fri, 23 Aug 2019 09:10:09 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id a142sm3342737pfd.147.2019.08.23.09.10.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 09:10:08 -0700 (PDT)
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, intel-wired-lan@lists.osuosl.org,
 bcm-kernel-feedback-list@broadcom.com, UNGLinuxDriver@microchip.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Allison Randal <allison@lohutok.net>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, Doug Berger <opendmb@gmail.com>,
 Douglas Miller <dougmill@linux.ibm.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 Jilayne Lovejoy <opensource@jilayne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Kate Stewart <kstewart@linuxfoundation.org>
References: <af1ae1cf-4a01-5e3a-edc2-058668487137@web.de>
 <4ab7f2a5-f472-f462-9d4c-7c8d5237c44e@wanadoo.fr>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <c90f0649-0dc0-df9a-21e6-ae6566ca5935@broadcom.com>
Date: Fri, 23 Aug 2019 09:10:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4ab7f2a5-f472-f462-9d4c-7c8d5237c44e@wanadoo.fr>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 27 Aug 2019 08:58:26 +0000
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32]
 =?utf-8?q?=5BPATCH=5D_ethernet=3A_Delete_unnecessar?=
 =?utf-8?q?y_checks_before_the_macro_call_=E2=80=9Cdev=5Fkfree=5Fskb?=
 =?utf-8?b?4oCd?=
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

Ck9uIDIwMTktMDgtMjMgNzowOCBhLm0uLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3JvdGU6Cj4gSGks
Cj4KPiBpbiB0aGlzIHBhdGNoLCB0aGVyZSBpcyBvbmUgcGllY2UgdGhhdCBsb29rZWQgYmV0dGVy
IGJlZm9yZS4gKHNlZSBiZWxvdykKPgo+IFJlbW92aW5nIHRoZSAnaWYgKHNrYiknIGlzIGZpbmUs
IGJ1dCBjb25jYXRlbmluZyBldmVyeXRoaW5nIGluIG9uZSAKPiBzdGF0ZW1lbnQganVzdCB0byBz
YXZlIDIgdmFyaWFibGVzIGFuZCBhIGZldyBMT0MgaXMgb2Ygbm8gdXNlLCBJTUhPLCAKPiBhbmQg
dGhlIGNvZGUgaXMgbGVzcyByZWFkYWJsZS4KQWdyZWVkLgo+Cj4ganVzdCBteSAyYy4KPgo+Cj4g
Q0oKPgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2Jyb2FkY29tL2dlbmV0
L2JjbWdlbmV0LmMgCj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9icm9hZGNvbS9nZW5ldC9iY21n
ZW5ldC5jCj4gaW5kZXggZDNhMGI2MTRkYmZhLi44YjE5ZGRjZGFmYWEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvYnJvYWRjb20vZ2VuZXQvYmNtZ2VuZXQuYwo+ICsrKyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2Jyb2FkY29tL2dlbmV0L2JjbWdlbmV0LmMKPiBAQCAtMjUxNSwx
OSArMjUxNSwxNCBAQCBzdGF0aWMgaW50IGJjbWdlbmV0X2RtYV90ZWFyZG93bihzdHJ1Y3QgCj4g
YmNtZ2VuZXRfcHJpdiAqcHJpdikKPiDCoHN0YXRpYyB2b2lkIGJjbWdlbmV0X2ZpbmlfZG1hKHN0
cnVjdCBiY21nZW5ldF9wcml2ICpwcml2KQo+IMKgewo+IMKgwqDCoMKgIHN0cnVjdCBuZXRkZXZf
cXVldWUgKnR4cTsKPiAtwqDCoMKgIHN0cnVjdCBza19idWZmICpza2I7Cj4gLcKgwqDCoCBzdHJ1
Y3QgZW5ldF9jYiAqY2I7Cj4gwqDCoMKgwqAgaW50IGk7Cj4KPiDCoMKgwqDCoCBiY21nZW5ldF9m
aW5pX3J4X25hcGkocHJpdik7Cj4gwqDCoMKgwqAgYmNtZ2VuZXRfZmluaV90eF9uYXBpKHByaXYp
Owo+Cj4gLcKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgcHJpdi0+bnVtX3R4X2JkczsgaSsrKSB7Cj4g
LcKgwqDCoMKgwqDCoMKgIGNiID0gcHJpdi0+dHhfY2JzICsgaTsKPiAtwqDCoMKgwqDCoMKgwqAg
c2tiID0gYmNtZ2VuZXRfZnJlZV90eF9jYigmcHJpdi0+cGRldi0+ZGV2LCBjYik7Cj4gLcKgwqDC
oMKgwqDCoMKgIGlmIChza2IpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2tmcmVlX3Nr
Yihza2IpOwo+IC3CoMKgwqAgfQo+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IHByaXYtPm51bV90
eF9iZHM7IGkrKykKPiArIGRldl9rZnJlZV9za2IoYmNtZ2VuZXRfZnJlZV90eF9jYigmcHJpdi0+
cGRldi0+ZGV2LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwcml2LT50eF9jYnMgKyBpKSk7Cj4KPiDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwg
cHJpdi0+aHdfcGFyYW1zLT50eF9xdWV1ZXM7IGkrKykgewo+IMKgwqDCoMKgwqDCoMKgwqAgdHhx
ID0gbmV0ZGV2X2dldF90eF9xdWV1ZShwcml2LT5kZXYsIHByaXYtPnR4X3JpbmdzW2ldLnF1ZXVl
KTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
