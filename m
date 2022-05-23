Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB125530756
	for <lists+linux-stm32@lfdr.de>; Mon, 23 May 2022 03:55:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 900DBC57183;
	Mon, 23 May 2022 01:55:22 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61D08C5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 01:55:21 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c14so12417185pfn.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 May 2022 18:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=VBuGEekfhW36ZamTc8kfC9Ud28TI3GJRyBkADMSHALk=;
 b=hP5ItfvKy/VamMIj0OMEs9LREs6SAvpSf3VagPR0d/OXk31w9muOX5oJG/B+8l3+9T
 Ru0JyEfEHROS866aZzCge1fgJHCy3+m4aFhRai1+wBKumGSBgIUeruN/kWCvdl+ayqf4
 v+08bFBXRvbFOkRwl7PIWY47SaTUXNGKs1eR9kagenPMVMKN2ElWvFom532lwK3VsD00
 rxJq7uTkVJ0L1Jo3MhMZohq9+Yq/53WLXnKgHoTpX1h2V5rduWtIj0p2TUGLiSgfUznd
 US2y77FP8ghpyRKdzM+nivoIiQ+dLJZ0pQ66fSCyuh1Ije0Eoc1gAJTFZ/Ix4AKBT+Dx
 O9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=VBuGEekfhW36ZamTc8kfC9Ud28TI3GJRyBkADMSHALk=;
 b=jMFEP89a3srlz3y/t79ByjXq65HM8XcDd8B9rSOTIqQCpKRZkX688FBU92s+0+yca4
 zDQAF5E0e1ZOdJgnwdTP8f26/Kdcl77wowE8mr2dvvJuMVw0vzCX57PNr3RxOrkdmeQi
 eBzZEAhD9hFy3ZXj1hiQqX/aPvPTzYzY8YcIkPHw8EstnvmgmkKXIiclJACjuE5pgXGi
 MxUBdnbKUVnKB8R0adhk8ITfbVBqTwz20k4Klh6LlM+GEwRuAvRlenueTb3JziGLyW4w
 vQuuDKQNfLj4H6Nq0lexbqQQ35BifJyQ5AQS425a3DEc88GRUfxdDFfR0vewEc8+q2xa
 U1Ug==
X-Gm-Message-State: AOAM531cEPD9lF9pGPon5np2P3rNX9rWOgdujQoOMawKdBNZ0wIUNDCA
 S5xY9CrYKer1SLFwk3Tx//E=
X-Google-Smtp-Source: ABdhPJzgnvBYyRUoxgBtCbBVodKUaelFPWG4FA7tUsw6CR6KbjQOAAfvw8I3RXZTFeuGuaf2VebhLw==
X-Received: by 2002:a63:87c7:0:b0:3f9:c4d1:b550 with SMTP id
 i190-20020a6387c7000000b003f9c4d1b550mr10749783pge.310.1653270919909; 
 Sun, 22 May 2022 18:55:19 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a17090a450d00b001df955c28f6sm5519102pjg.37.2022.05.22.18.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 18:55:19 -0700 (PDT)
Message-ID: <45ae7332-074e-cb76-2674-7431fc58b886@gmail.com>
Date: Mon, 23 May 2022 09:55:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Hangyu Hua <hbh25y@gmail.com>
To: alexander.shishkin@linux.intel.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, gregkh@linuxfoundation.org,
 mathieu.poirier@linaro.org
References: <20220418081632.35121-1-hbh25y@gmail.com>
 <3e01d35c-e748-3e03-4417-8b7dea09075e@gmail.com>
In-Reply-To: <3e01d35c-e748-3e03-4417-8b7dea09075e@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] hwtracing: stm: fix possible double free
 in stm_register_device()
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

R2VudGVsIHBpbmcuCgpPbiAyMDIyLzUvNSAwOToyOSwgSGFuZ3l1IEh1YSB3cm90ZToKPiBQaW5n
Cj4gCj4gT24gMjAyMi80LzE4IDE2OjE2LCBIYW5neXUgSHVhIHdyb3RlOgo+PiBwdXRfZGV2aWNl
KCkgd2lsbCBjYWxsIHN0bV9kZXZpY2VfcmVsZWFzZSgpIHRvIGZyZWUgc3RtIHdoZW4KPj4gc3Rt
X3JlZ2lzdGVyX2RldmljZSgpIGZhaWxzLiBTbyB0aGVyZSBpcyBubyBuZWVkIHRvIGNhbGwgdmZy
ZWUoKSBhZ2Fpbi4KPj4KPj4gRml4IHRoaXMgYnkgYWRkaW5nIGEgcmV0dXJuIGFmdGVyIHB1dF9k
ZXZpY2UoKS4KPj4KPj4gRml4ZXM6IDdiZDFkNDA5M2MyZiAoInN0bSBjbGFzczogSW50cm9kdWNl
IGFuIGFic3RyYWN0aW9uIGZvciBTeXN0ZW0gCj4+IFRyYWNlIE1vZHVsZSBkZXZpY2VzIikKPj4g
U2lnbmVkLW9mZi1ieTogSGFuZ3l1IEh1YSA8aGJoMjV5QGdtYWlsLmNvbT4KPj4gLS0tCj4+IMKg
IGRyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb3JlLmMgfCAxICsKPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9zdG0v
Y29yZS5jIGIvZHJpdmVycy9od3RyYWNpbmcvc3RtL2NvcmUuYwo+PiBpbmRleCAyNzEyZTY5OWJh
MDguLjQwM2I0ZjQxYmIxYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcvc3RtL2Nv
cmUuYwo+PiArKysgYi9kcml2ZXJzL2h3dHJhY2luZy9zdG0vY29yZS5jCj4+IEBAIC05MTUsNiAr
OTE1LDcgQEAgaW50IHN0bV9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRldmljZSAqcGFyZW50LCAK
Pj4gc3RydWN0IHN0bV9kYXRhICpzdG1fZGF0YSwKPj4gwqDCoMKgwqDCoCAvKiBtYXRjaGVzIGRl
dmljZV9pbml0aWFsaXplKCkgYWJvdmUgKi8KPj4gwqDCoMKgwqDCoCBwdXRfZGV2aWNlKCZzdG0t
PmRldik7Cj4+ICvCoMKgwqAgcmV0dXJuIGVycjsKPj4gwqAgZXJyX2ZyZWU6Cj4+IMKgwqDCoMKg
wqAgdmZyZWUoc3RtKTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
