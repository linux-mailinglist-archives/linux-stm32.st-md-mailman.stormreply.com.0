Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6752A557008
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jun 2022 03:44:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 071DCC57B6C;
	Thu, 23 Jun 2022 01:44:17 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12ACBC0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jun 2022 01:44:15 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e63so16215543pgc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jun 2022 18:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=8OYLl95mf9+YxDcCBNvZSRU5aHDebQNBoQMTob1Sdeg=;
 b=qxZY0UQ4su1To4vMkojOPanPe2kdRw7d+t26ToDi4Y0iFSVfRLSE6Iw+BVSwpTU2Eh
 FnuMaWl20DljeYow8xp8Qp+pQ5FqDyV+jenzjIo3mGkEx+DtJQcNHddsF5PrcbEyZAxH
 WNgPuuh+he0G6agaZ73XzSWcEz+T+11DSFTReZBqn7UNJ2iTaIY9sfLqmOvnQusyPMOY
 nG5PXoIlJfR/xY26TxpqYluvBYG7GITfQryoq+trWXP92Ea/+K/wU02NsXaizU7MD97+
 2PXgjMPOsmzyA7W42p5+mjmIC1BjKmFzAKGn52q7wDflbOzcG1UEfbjBSZjlsPaiBOGw
 xOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=8OYLl95mf9+YxDcCBNvZSRU5aHDebQNBoQMTob1Sdeg=;
 b=NEbe+jXf8Jriyt3RO7k2xG5hEhbUx0l1TEYhR1Xn6G9UQaLMeaUMbws02cF1BSfzMQ
 pyofgDgD4DVdJDuWMS0ZM0FiCPNJhgiVTsOUegIasr8VDGrz+pGCGJNQLfR7Y+ITcsTP
 HQeGRBxCeMRAVOc4XO5LueGzex+CaHjFajr1CI8KFW7EOx4eN0cINy9KBsnm6CS5YSPE
 5n4zSYdc41kch9C8BqSoxi5V64nLhSDxRbWYxGgN7T88ajG5uc2HmlvsCf00QPLJkjkI
 oRBCa+869XC34CbQEcwanGlGKkR75I1T1+5tzufF1jMaEiADiUDeOfptPhQNx3jBEwx3
 m32g==
X-Gm-Message-State: AJIora+Qf0y8pffJIXZTvA1mmK4+zeKymhDlUOcSqyGjnr8uKt9l80bV
 ngNuBqM5O/Tv5SvkR8/WypA=
X-Google-Smtp-Source: AGRyM1tHsth2D+8SWRUl0QfIlT0e02ZW+58iaAtiK8+/XIA/PjhfGZ3Heo+y2rA3m1jZN6lfLstExg==
X-Received: by 2002:a05:6a00:179e:b0:518:9e1d:1cbd with SMTP id
 s30-20020a056a00179e00b005189e1d1cbdmr38052645pfg.12.1655948653642; 
 Wed, 22 Jun 2022 18:44:13 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 h8-20020aa79f48000000b00525251ce47esm7117430pfr.103.2022.06.22.18.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 18:44:13 -0700 (PDT)
Message-ID: <17b9ef27-028c-06ac-a2d9-7cb46b3951cb@gmail.com>
Date: Thu, 23 Jun 2022 09:44:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
From: Hangyu Hua <hbh25y@gmail.com>
To: alexander.shishkin@linux.intel.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, gregkh@linuxfoundation.org,
 mathieu.poirier@linaro.org
References: <20220418081632.35121-1-hbh25y@gmail.com>
 <3e01d35c-e748-3e03-4417-8b7dea09075e@gmail.com>
 <45ae7332-074e-cb76-2674-7431fc58b886@gmail.com>
In-Reply-To: <45ae7332-074e-cb76-2674-7431fc58b886@gmail.com>
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

T24gMjAyMi81LzIzIDA5OjU1LCBIYW5neXUgSHVhIHdyb3RlOgo+IEdlbnRlbCBwaW5nLgo+IAo+
IE9uIDIwMjIvNS81IDA5OjI5LCBIYW5neXUgSHVhIHdyb3RlOgo+PiBQaW5nCj4+Cj4+IE9uIDIw
MjIvNC8xOCAxNjoxNiwgSGFuZ3l1IEh1YSB3cm90ZToKPj4+IHB1dF9kZXZpY2UoKSB3aWxsIGNh
bGwgc3RtX2RldmljZV9yZWxlYXNlKCkgdG8gZnJlZSBzdG0gd2hlbgo+Pj4gc3RtX3JlZ2lzdGVy
X2RldmljZSgpIGZhaWxzLiBTbyB0aGVyZSBpcyBubyBuZWVkIHRvIGNhbGwgdmZyZWUoKSBhZ2Fp
bi4KPj4+Cj4+PiBGaXggdGhpcyBieSBhZGRpbmcgYSByZXR1cm4gYWZ0ZXIgcHV0X2RldmljZSgp
Lgo+Pj4KPj4+IEZpeGVzOiA3YmQxZDQwOTNjMmYgKCJzdG0gY2xhc3M6IEludHJvZHVjZSBhbiBh
YnN0cmFjdGlvbiBmb3IgU3lzdGVtIAo+Pj4gVHJhY2UgTW9kdWxlIGRldmljZXMiKQo+Pj4gU2ln
bmVkLW9mZi1ieTogSGFuZ3l1IEh1YSA8aGJoMjV5QGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gwqAg
ZHJpdmVycy9od3RyYWNpbmcvc3RtL2NvcmUuYyB8IDEgKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHd0cmFjaW5nL3N0
bS9jb3JlLmMgYi9kcml2ZXJzL2h3dHJhY2luZy9zdG0vY29yZS5jCj4+PiBpbmRleCAyNzEyZTY5
OWJhMDguLjQwM2I0ZjQxYmIxYiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvaHd0cmFjaW5nL3N0
bS9jb3JlLmMKPj4+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb3JlLmMKPj4+IEBAIC05
MTUsNiArOTE1LDcgQEAgaW50IHN0bV9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRldmljZSAqcGFy
ZW50LCAKPj4+IHN0cnVjdCBzdG1fZGF0YSAqc3RtX2RhdGEsCj4+PiDCoMKgwqDCoMKgIC8qIG1h
dGNoZXMgZGV2aWNlX2luaXRpYWxpemUoKSBhYm92ZSAqLwo+Pj4gwqDCoMKgwqDCoCBwdXRfZGV2
aWNlKCZzdG0tPmRldik7Cj4+PiArwqDCoMKgIHJldHVybiBlcnI7Cj4+PiDCoCBlcnJfZnJlZToK
Pj4+IMKgwqDCoMKgwqAgdmZyZWUoc3RtKTsKCkdlbnRlbCBwaW5nLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
