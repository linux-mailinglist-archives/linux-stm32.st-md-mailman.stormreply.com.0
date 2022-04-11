Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C04424FBE46
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 16:04:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D550C628A6;
	Mon, 11 Apr 2022 14:04:52 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5323EC60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 14:04:51 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id q3so2691328plg.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=HxOmBDd+ZffgklGgbHnwMBpdgHlZMicdAtEhFhUS5fk=;
 b=pLYN47u+ukYGU2o/HJwVjI4zbKTBrD7kfKOMeHrN21CWiwFzoR9lq6dEFG3C9n0oIU
 zfYlG86hF2Mdc9zcCIgVZtwhsUCVS0IN/M40TnJZAoMUeKKfEcbAG7ISYQp/JS8ThGbx
 B/EJ27qU2wcFHO3v6THnHNh1OT15tXN6X+A6U1qwaDm1Fll+MmzQQ4qJMIstWQEEf4r2
 DmB9+diRqjdsr4Q1grn7Ek72d65ker/J7HIpFOhqhAa80aPz3O7rS6Wmt234bi488j93
 1qK4krlGY8HU4SwGp7cGJdRcuWHeUGBoBx4eNo4W09jVCncTKK1hwvtZQ5j+I56OT7i0
 8dmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HxOmBDd+ZffgklGgbHnwMBpdgHlZMicdAtEhFhUS5fk=;
 b=6Fba9MSj/lBwMGoCYH8KZ3fixO2Pri6Yqbgk5Gh2GyCfa8RjiGKcetq8pdZGWuhi0f
 s7cjGEOezG0nJpJOQK8NAVSBvwOM5+Hapq6dYFv5GWw+0nQM0HBXW9l2qI41nMcyLMZX
 h7Yl3Cnvz4Cxz8XzLitfGDyKPMuwM97O9Y1tIyph9yNEq/WGTT6Etdn3+6L4ipeDTAlo
 3u4qC8dvbJ/M2NwmH7OX9HR/1YB8zWEnsoV6HUdsWTBpbbjD8oORaX0ch1DSxnEICP8a
 YeydarV+tsLNA+cELhgVflMWneQqpKNYHm0qT/oAE38aqT08fkC2/iDO0xMIrP5DKONd
 HqdA==
X-Gm-Message-State: AOAM532nhpIM3z3K2G6QSnCrFPVOsDTWGSOmtR6e4otK/Cs0z903C+aS
 3Bc7S3eu6Q+tS/7zgaHRyF8=
X-Google-Smtp-Source: ABdhPJxFhZsZJrc0CubOdHvN+RQXQffBGIwYtZ3PVdsfllhqaBrYZvH+6sdRZTjPlxTzjzZbEKOrZQ==
X-Received: by 2002:a17:903:248:b0:155:e660:b774 with SMTP id
 j8-20020a170903024800b00155e660b774mr32999779plh.174.1649685889726; 
 Mon, 11 Apr 2022 07:04:49 -0700 (PDT)
Received: from [172.16.10.243] ([219.143.128.237])
 by smtp.gmail.com with ESMTPSA id
 h189-20020a636cc6000000b0039841f669bcsm30013312pgc.78.2022.04.11.07.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 07:04:49 -0700 (PDT)
Message-ID: <60e67c07-7e40-4187-a90a-1be9acdfe757@gmail.com>
Date: Mon, 11 Apr 2022 22:04:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Philippe Schenker <philippe.schenker@toradex.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "jic23@kernel.org" <jic23@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220411103032.14038-1-linmq006@gmail.com>
 <8b40cdebc07ff7ca29aa9fc03b8d9c40754ab4bd.camel@toradex.com>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <8b40cdebc07ff7ca29aa9fc03b8d9c40754ab4bd.camel@toradex.com>
Subject: Re: [Linux-stm32] [PATCH] iio: stmpe-adc: Fix
 wait_for_completion_timeout return value check
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

Ck9uIDIwMjIvNC8xMSAyMDowNSwgUGhpbGlwcGUgU2NoZW5rZXIgd3JvdGU6Cj4gT24gTW9uLCAy
MDIyLTA0LTExIGF0IDEwOjMwICswMDAwLCBNaWFvcWlhbiBMaW4gd3JvdGU6Cj4+IHdhaXRfZm9y
X2NvbXBsZXRpb25fdGltZW91dCgpIHJldHVybnMgdW5zaWduZWQgbG9uZyBub3QgbG9uZy4KPj4g
aXQgcmV0dXJucyAwIGlmIHRpbWVkIG91dCwgYW5kIHBvc2l0aXZlIGlmIGNvbXBsZXRlZC4KPj4g
VGhlIGNoZWNrIGZvciA8PSAwIGlzIGFtYmlndW91cyBhbmQgc2hvdWxkIGJlID09IDAgaGVyZQo+
PiBpbmRpY2F0aW5nIHRpbWVvdXQgd2hpY2ggaXMgdGhlIG9ubHkgZXJyb3IgY2FzZQo+IEhlbGxv
IGFuZCB0aGFua3MgZm9yIHlvdXIgZml4LiBBbnkgc3BlY2lmaWMgcmVhc29uIHlvdSBkaWRuJ3Qg
YXBwbHkgdGhpcwo+IGFsc28gaW4gZnVuY3Rpb24gc3RtcGVfcmVhZF90ZW1wPwoKSGnvvIxzb3Jy
eSBJIGp1c3QgbWlzc2VkIHRoYXQuIEkgd2lsbCBzZW5kIHYyIHRvIGZpeCB0aGlzLgoKCj4+IEZp
eGVzOiBlODEzZGRlNmY4MzMgKCJpaW86IHN0bXBlLWFkYzogVXNlCj4+IHdhaXRfZm9yX2NvbXBs
ZXRpb25fdGltZW91dCIpCj4+IFNpZ25lZC1vZmYtYnk6IE1pYW9xaWFuIExpbiA8bGlubXEwMDZA
Z21haWwuY29tPgo+PiAtLS0KPj4gwqBkcml2ZXJzL2lpby9hZGMvc3RtcGUtYWRjLmMgfCA0ICsr
LS0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL3N0bXBlLWFkYy5jIGIvZHJpdmVycy9p
aW8vYWRjL3N0bXBlLWFkYy5jCj4+IGluZGV4IGQyZDQwNTM4ODQ5OS4uZDQ3NWQxYzE3YmZjIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2lpby9hZGMvc3RtcGUtYWRjLmMKPj4gKysrIGIvZHJpdmVy
cy9paW8vYWRjL3N0bXBlLWFkYy5jCj4+IEBAIC02MSw3ICs2MSw3IEBAIHN0cnVjdCBzdG1wZV9h
ZGMgewo+PiDCoHN0YXRpYyBpbnQgc3RtcGVfcmVhZF92b2x0YWdlKHN0cnVjdCBzdG1wZV9hZGMg
KmluZm8sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGlpb19jaGFu
X3NwZWMgY29uc3QgKmNoYW4sIGludCAqdmFsKQo+PiDCoHsKPj4gLcKgwqDCoMKgwqDCoMKgbG9u
ZyByZXQ7Cj4+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgcmV0Owo+PiDCoAo+PiDCoMKg
wqDCoMKgwqDCoMKgbXV0ZXhfbG9jaygmaW5mby0+bG9jayk7Cj4+IMKgCj4+IEBAIC03OSw3ICs3
OSw3IEBAIHN0YXRpYyBpbnQgc3RtcGVfcmVhZF92b2x0YWdlKHN0cnVjdCBzdG1wZV9hZGMKPj4g
KmluZm8sCj4+IMKgCj4+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSB3YWl0X2Zvcl9jb21wbGV0aW9u
X3RpbWVvdXQoJmluZm8tPmNvbXBsZXRpb24sCj4+IFNUTVBFX0FEQ19USU1FT1VUKTsKPj4gwqAK
Pj4gLcKgwqDCoMKgwqDCoMKgaWYgKHJldCA8PSAwKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoGlmIChy
ZXQgPT0gMCkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0bXBlX3JlZ193
cml0ZShpbmZvLT5zdG1wZSwgU1RNUEVfUkVHX0FEQ19JTlRfU1RBLAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgU1RNUEVf
QURDX0NIKGluZm8tPmNoYW5uZWwpKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBtdXRleF91bmxvY2soJmluZm8tPmxvY2spOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
