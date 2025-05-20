Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC40ABCC22
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 03:13:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BFDCC78F96;
	Tue, 20 May 2025 01:13:17 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0771CC78F94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 01:13:15 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-af523f4511fso4011277a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 May 2025 18:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747703594; x=1748308394;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=l+bh9yDJlVVImj9+6PkfxMDDt8Anc9GhnNIfLGfFu/k=;
 b=bpjD9dJTDGt1y9/vxlWp4eH4HPKcvwjJhm7bgjefnL/cev2nK4Kc8t3dgd9O9woHn2
 rU91qiO1Chxwv3A4j3sUdBdBOXvqGL+PUx6ZBqTGy1O5KVIeQQnFX8jaJHla29eu0l+M
 67VW7sPjSW78vfgphGVBGghyAQRJuYW7mcvX49KIDdoxrcN/jhzJNLCoxm9HSNwZUon5
 1phsUspfa/3sXLKXj9QX1B4mgWXjPa5VkvtN29INAHvXSbSzzOFsHgc6l5COJAZHOYOq
 ZTdYJAaGzab4rOl8yyyKCDKYkzA9pAaJyiUOYXCQ1j0J9Kk3W1Crxv3ze7OfNrk7YS7b
 1a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747703594; x=1748308394;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+bh9yDJlVVImj9+6PkfxMDDt8Anc9GhnNIfLGfFu/k=;
 b=igPR9wltkbSz9ACtiVL0ZpXSGjdnj7mY1xBRz7grhATaWPsL/zzw1tBRsDIOH+VZlC
 DLtxgv+Bt/PydkV2NtGE1ybFDqh6AL3zs2uaOsF09yaGYrRSesbMERJPnGEkOOSGmxq2
 c4HEnLQYBMCF2rGW21zCXqiYpVy0I4fTuCOGBR9PnL+kEz+01zy//Nx0AB5AftgmBTb5
 7vKoL7X+RzhgFxVOCOrnOdnFtC22gBahN+H0sOKoOXqH3VFQO/aFo8zfc79bbE51bSoE
 70FuwE24nQ/+HOjpGb1GPcVwk0TRx9bk2TLVixzL8kjDPUsrwV1Ow7JSEy1rOa1JyQQd
 DQqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJL51RpdCMtdq3DLFAMsIus5cgWhVihH7m3DJ+W2YdSENNLIAWIktVyhlubd+kBANfefL03z5pNmUxbQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwGgM3rm84I1pFVjzGhst+6k14trTW6NbPa0CGjLLSEiKjPzKh4
 LK4/2MA3rSRy7Jue6i1RTLL8o+mJ8hOx6gDByoMDEzKjZMTEi5vADhVE
X-Gm-Gg: ASbGncvcCQsY+6aY3jBK5A5lkyD2Fzr4KNiPtyWbmWJkuWLokrsl13/LQat5XolCvVr
 rh2tJQMlaPhkZKuTK1+t9oTuevOvMdjoL+Wz8PeKGI0laIghJzm0OvAKSY0Qrid/77ZmJYNLEHV
 4AJ/NaotLIfjtJOM1Q/uHQEEh3hxVhpzKSMvMehYb9eEsG4ajzu2F4NUpgz7fc+yhj8Ld4BphE7
 db3OT/YoHVv++IkRvvlrMhJaTvvvmcol4npYbcGhLrqvtoMsC0YDJ2EJgiMedWCev+gDbaBs77Q
 rUd8XZ4p64WBly/fui6/hDMeVS5qWMmtyFkrM/FsrmRmY2e1zkx0uQ/wn0mE5sd9AvCa7f4OtAp
 yWmslRWIUcZGTwNgVd0IIJ85Cjv2mQhrl2hM=
X-Google-Smtp-Source: AGHT+IFhYagJYSr486ndbkbSDxTnhJeL2TXjMGcxVjfwTQJzwvLcCbi4D3PmDnre+Q1oJmDILXXLVg==
X-Received: by 2002:a17:902:ea01:b0:231:97ab:9544 with SMTP id
 d9443c01a7336-231d452d4f0mr233183945ad.41.1747703594376; 
 Mon, 19 May 2025 18:13:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4adba6dsm66227095ad.68.2025.05.19.18.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 18:13:13 -0700 (PDT)
Message-ID: <2bb28691-def0-4365-98e0-7f53d4d19966@roeck-us.net>
Date: Mon, 19 May 2025 18:13:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julius Werner <jwerner@chromium.org>
References: <20250519170055.205544-1-antonio.borneo@foss.st.com>
 <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
 <CAODwPW-gEOotp8KGhzk3E11PqF9xdan8dOwxe_SW4txh+uQp=w@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAODwPW-gEOotp8KGhzk3E11PqF9xdan8dOwxe_SW4txh+uQp=w@mail.gmail.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Evan Benn <evanbenn@chromium.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] watchdog: arm_smc_wdt: get wdt status
 through SMCWD_GET_TIMELEFT
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

T24gNS8xOS8yNSAxNzoxMiwgSnVsaXVzIFdlcm5lciB3cm90ZToKPiBJIGRvbid0IHJlYWxseSBr
bm93IGFib3V0IHRoZSBpc3N1ZSBHdWVudGVyIG1lbnRpb25lZCwgYnV0IG90aGVyd2lzZSwKPiBm
cm9tIHRoZSBkcml2ZXIncyBzaWRlIHRoaXMgbG9va3MgZ29vZCB0byBtZS4KPiAKCkl0IHNob3Vs
ZCBqdXN0IGJlCglzZXRfYml0KFdET0dfSFdfUlVOTklORywgJndkZC0+c3RhdHVzKTsKClRoZXJl
IHNob3VsZCBiZSBubyBkZXBlbmRlbmN5IG9uIENPTkZJR19XQVRDSERPR19IQU5ETEVfQk9PVF9F
TkFCTEVELgoKR3VlbnRlcgoJCj4gUmV2aWV3ZWQtYnk6IEp1bGl1cyBXZXJuZXIgPGp3ZXJuZXJA
Y2hyb21pdW0ub3JnPgo+IAo+IE9uIE1vbiwgTWF5IDE5LCAyMDI1IGF0IDEwOjU44oCvQU0gR3Vl
bnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cm90ZToKPj4KPj4gT24gNS8xOS8yNSAx
MDowMCwgQW50b25pbyBCb3JuZW8gd3JvdGU6Cj4+PiBUaGUgb3B0aW9uYWwgU01DV0RfR0VUX1RJ
TUVMRUZUIGNvbW1hbmQgY2FuIGJlIHVzZWQgdG8gZGV0ZWN0IGlmCj4+PiB0aGUgd2F0Y2hkb2cg
aGFzIGFscmVhZHkgYmVlbiBzdGFydGVkLgo+Pj4gU2VlIHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBP
UC1URUUgc2VjdXJlIE9TIFsxXS4KPj4+Cj4+PiBJZiBDT05GSUdfV0FUQ0hET0dfSEFORExFX0JP
T1RfRU5BQkxFRCBpcyBzZXQsIGF0IHByb2JlIHRpbWUgY2hlY2sKPj4+IGlmIHRoZSB3YXRjaGRv
ZyBpcyBhbHJlYWR5IHN0YXJ0ZWQgYW5kIHRoZW4gc2V0IFdET0dfSFdfUlVOTklORyBpbgo+Pj4g
dGhlIHdhdGNoZG9nIHN0YXR1cy4gVGhpcyB3aWxsIGNhdXNlIHRoZSB3YXRjaGRvZyBmcmFtZXdv
cmsgdG8KPj4+IHBpbmcgdGhlIHdhdGNoZG9nIHVudGlsIGEgdXNlcnNwYWNlIHdhdGNoZG9nIGRh
ZW1vbiB0YWtlcyBvdmVyIHRoZQo+Pj4gY29udHJvbC4KPj4+Cj4+PiBMaW5rOiBodHRwczovL2dp
dGh1Yi5jb20vT1AtVEVFL29wdGVlX29zL2NvbW1pdC9hN2YyZDRiZDg2MzIgWzFdCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29t
Pgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJzL3dhdGNoZG9nL2FybV9zbWNfd2R0LmMgfCAxOCArKysr
KysrKysrKysrKystLS0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL2FybV9z
bWNfd2R0LmMgYi9kcml2ZXJzL3dhdGNoZG9nL2FybV9zbWNfd2R0LmMKPj4+IGluZGV4IDhmM2Qw
YzNhMDA1ZmIuLmYxMjY4ZjQzMzI3ZWEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9n
L2FybV9zbWNfd2R0LmMKPj4+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvYXJtX3NtY193ZHQuYwo+
Pj4gQEAgLTQ2LDYgKzQ2LDggQEAgc3RhdGljIGludCBzbWN3ZF9jYWxsKHN0cnVjdCB3YXRjaGRv
Z19kZXZpY2UgKndkZCwgZW51bSBzbWN3ZF9jYWxsIGNhbGwsCj4+PiAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT0RFVjsKPj4+ICAgICAgICBpZiAocmVzLT5hMCA9PSBQU0NJX1JFVF9JTlZBTElE
X1BBUkFNUykKPj4+ICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gKyAgICAgaWYg
KHJlcy0+YTAgPT0gUFNDSV9SRVRfRElTQUJMRUQpCj4+PiArICAgICAgICAgICAgIHJldHVybiAt
RU5PREFUQTsKPj4+ICAgICAgICBpZiAocmVzLT5hMCAhPSBQU0NJX1JFVF9TVUNDRVNTKQo+Pj4g
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87Cj4+PiAgICAgICAgcmV0dXJuIDA7Cj4+PiBAQCAt
MTMxLDEwICsxMzMsMjAgQEAgc3RhdGljIGludCBzbWN3ZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+Pj4KPj4+ICAgICAgICB3ZGQtPmluZm8gPSAmc21jd2RfaW5mbzsKPj4+
ICAgICAgICAvKiBnZXRfdGltZWxlZnQgaXMgb3B0aW9uYWwgKi8KPj4+IC0gICAgIGlmIChzbWN3
ZF9jYWxsKHdkZCwgU01DV0RfR0VUX1RJTUVMRUZULCAwLCBOVUxMKSkKPj4+IC0gICAgICAgICAg
ICAgd2RkLT5vcHMgPSAmc21jd2Rfb3BzOwo+Pj4gLSAgICAgZWxzZQo+Pj4gKyAgICAgZXJyID0g
c21jd2RfY2FsbCh3ZGQsIFNNQ1dEX0dFVF9USU1FTEVGVCwgMCwgTlVMTCk7Cj4+PiArICAgICBz
d2l0Y2ggKGVycikgewo+Pj4gKyAgICAgY2FzZSAwOgo+Pj4gKyAgICAgICAgICAgICBpZiAoSVNf
RU5BQkxFRChDT05GSUdfV0FUQ0hET0dfSEFORExFX0JPT1RfRU5BQkxFRCkpCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgc2V0X2JpdChXRE9HX0hXX1JVTk5JTkcsICZ3ZGQtPnN0YXR1cyk7Cj4+
Cj4+IFRoaXMgaXMgdGhlIHdyb25nIHVzZSBvZiB0aGlzIGNvbmZpZ3VyYXRpb24gb3B0aW9uLiBJ
dCBpcyBvbmx5IG5lZWRlZAo+PiBpbiBhIGRyaXZlciBpZiB0aGUgd2F0Y2hkb2cgc3RhdHVzIGNh
biBub3QgYmUgcmVhZCBmcm9tIGhhcmR3YXJlLgo+PiBUaGF0IGlzIG5vdCB0aGUgY2FzZSBoZXJl
LiBXb3JzZSwgdXNpbmcgaXQgaW4gYSBkcml2ZXIgbGlrZSB0aGlzCj4+IG92ZXJyaWRlcyB0aGUg
d2F0Y2hkb2cgY29yZSBtb2R1bGUgcGFyYW1ldGVyICJoYW5kbGVfYm9vdF9lbmFibGVkIi4KPj4K
Pj4gR3VlbnRlcgo+Pgo+Pj4gKyAgICAgICAgICAgICBmYWxsdGhyb3VnaDsKPj4+ICsgICAgIGNh
c2UgLUVOT0RBVEE6Cj4+PiAgICAgICAgICAgICAgICB3ZGQtPm9wcyA9ICZzbWN3ZF90aW1lbGVm
dF9vcHM7Cj4+PiArICAgICAgICAgICAgIGJyZWFrOwo+Pj4gKyAgICAgZGVmYXVsdDoKPj4+ICsg
ICAgICAgICAgICAgd2RkLT5vcHMgPSAmc21jd2Rfb3BzOwo+Pj4gKyAgICAgICAgICAgICBicmVh
azsKPj4+ICsgICAgIH0KPj4+ICsKPj4+ICAgICAgICB3ZGQtPnRpbWVvdXQgPSByZXMuYTI7Cj4+
PiAgICAgICAgd2RkLT5tYXhfdGltZW91dCA9IHJlcy5hMjsKPj4+ICAgICAgICB3ZGQtPm1pbl90
aW1lb3V0ID0gcmVzLmExOwo+Pj4KPj4+IGJhc2UtY29tbWl0OiBhNTgwNmNkNTA2YWY1YTdjMTli
Y2Q1OTZlNDcwOGI1YzQ2NGJmZDIxCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
