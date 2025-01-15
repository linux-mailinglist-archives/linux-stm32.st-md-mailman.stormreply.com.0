Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F5A12210
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 12:05:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D3F2C78F77;
	Wed, 15 Jan 2025 11:05:41 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C723C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 11:05:33 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2eeb4d643a5so11234352a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 03:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736939132; x=1737543932;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DZhmJVX2Z/1on+VLI7mM1RgJuJ/QDUUV3rq29Mr1CH4=;
 b=HTbPDT3/fwdG77PoC9qgJJWRMMPqoQr/nbZImqFlwOE2G+gJte/KD+Da5EAFTeiZFJ
 FKxxdWIUqzaVkrzTeJDQWap8JGZgTK37WWCi1i7xhTCK+QZnM09B6np+72611fv1pjtt
 Cm4prMcIKuP1imloV1Lr8f1p9/O1aK+OaV2OQ7U7P4ttKxkJQZv0ONBClion5FthxKlX
 G1UzAOEo3EjGJdA55Mt0YBEFT2mZKN1ayO1ZlmJ9BOmsyH68gWGJ4lcAuPW+waH2y0S2
 l9G9YhfUNDU4K0IM/Fphl41UvXEWtZZ1y/09u9K83jz0MRDdYifm83h2JPBm2Hh1JLrj
 lqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736939132; x=1737543932;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DZhmJVX2Z/1on+VLI7mM1RgJuJ/QDUUV3rq29Mr1CH4=;
 b=d1sp0hvFc0lQ206XfUIbbcKpAL7WkfvEX6vX2PhaffmwThWck4I/uRrr2bMDbIhyVX
 eEcqiOJhlnUJsl2v5wDJPdjmVLlqByXK6BDisqXvN3GiH33MjxwbvB26aNA+BWW8io3R
 xymSNX5LMHe5Wscs6pn2vt2B6lGdF0FbIUOCSo3KJXscG/qxQITMORwcn9xhaS2HeJ8E
 NdGnhHidxP1yI/v30xQ+Ck5L34PzRQ63aFx2KUWdHxV0lhJREdedv/vGWSnzJhOQ6fyR
 5JOJBuapfACM6ELcZrjFB7b5fkzQ23sbgZJ0T20pSUvRMh33edbmiA9Mxev4RxASy7dc
 0KJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvqmdzbUdQSfsFw5orwJAiRQmqjzXXP+3IV6Tlo3gJIxrpeRe+13UlMw0Y71+QqaDy6uakYWVlz79sMA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyH/JdKgVMLknh/oew61uVJqOrYRm8fWO3NckpD7hOklhh5kRNI
 Stt/KWgYyn9cXgR6wwCsEY/O8Xnglxkj4ceLJFxZaTv+jJlnuaZo
X-Gm-Gg: ASbGncsDrtpos6KQvWxWBIWTKZEmj+h6IZsWMEpLmdswWbBsAI1Mn557/tZs/vowvSF
 HLr1tF0g1QGFy/kUfm/B5QO8abBKEPw2ghTkT4Nwnr/e4G6LqQ+c943HSMOAca1PY8HSqj0RMHP
 KX5z3R0QmxsY5/aaOaqRkVDbVavEfM92EOBX8djNgefPwbzegftxkpWSAhgZBoFGz2lGOUysHef
 NsbzwTh/RywiRWc+tvFUSNNkJHiQuy3GBGe1pf66Ez+kCBIBycvTFeNZc9jnjBjgvauArfESDvS
 Dpeide9qqk93bWm5srfi69HhAiLqgtbx2d4=
X-Google-Smtp-Source: AGHT+IEIUJ161wQLQ7M7tzPplUbCNDBmqlqWnABZRELuVW2sGY23Vkufmemaywh2bkhh0gVhD2Yq9A==
X-Received: by 2002:a17:90b:264c:b0:2ee:9b2c:3253 with SMTP id
 98e67ed59e1d1-2f5490c20e7mr40326717a91.30.1736939131935; 
 Wed, 15 Jan 2025 03:05:31 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f72c22b474sm1111164a91.44.2025.01.15.03.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 03:05:31 -0800 (PST)
Message-ID: <da332a44-8fbe-40c3-8053-c4c9fdfc8746@gmail.com>
Date: Wed, 15 Jan 2025 19:05:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
 <2cf758f2-529e-4ccd-9dc1-18fc29ad5ac0@gmail.com>
 <990a3fc9-7fd6-49b6-8918-d5bf4ae48953@molgen.mpg.de>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <990a3fc9-7fd6-49b6-8918-d5bf4ae48953@molgen.mpg.de>
Cc: Andrew Lunn <andrew@lunn.ch>, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, ychuang3@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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

RGVhciBQYXVsLAoKVGhhbmsgeW91IGZvciB5b3VyIGtpbmQgcmVwbHkuCgpQYXVsIE1lbnplbCDm
lrwgMS8xNS8yMDI1IDU6MjIgUE0g5a+r6YGTOgo+IERlYXIgSm9leSwKPgo+Cj4gVGhhbmsgeW91
IGZvciB5b3VyIHByb21wdCByZXBseS4KPgo+Cj4gQW0gMTUuMDEuMjUgdW0gMTA6MDMgc2Nocmll
YiBKb2V5IEx1Ogo+Cj4+IFBhdWwgTWVuemVsIOaWvCAxLzE0LzIwMjUgOTo0OSBBTSDlr6vpgZM6
Cj4KPiBb4oCmXQo+Cj4+PiBBbSAxMy4wMS4yNSB1bSAwMDo1NCBzY2hyaWViIEpvZXkgTHU6Cj4+
Pj4gQWRkIHN1cHBvcnQgZm9yIEdpZ2FiaXQgRXRoZXJuZXQgb24gTnV2b3RvbiBNQTM1IHNlcmll
cyB1c2luZyBkd21hYyAKPj4+PiBkcml2ZXIuCj4KPiBb4oCmXQo+Cj4+PiBBbHNvLCBwbGVhc2Ug
ZG9jdW1lbnQgaG93IHRlc3RlZCB0aGUgZHJpdmVyLiBNYXliZSBldmVuIHBhc3RlIG5ldyAKPj4+
IGxvZyBtZXNzYWdlcy4KPj4KPj4gVGhlc2UgYXJlIHRoZSBrZXJuZWwgY29uZmlndXJhdGlvbnMg
Zm9yIHRlc3RpbmcgdGhlIE1BMzVEMSBHTUFDIAo+PiBkcml2ZXI6IEFSQ0hfTUEzNSwgU1RNTUFD
X1BMQVRGT1JNLCBEV01BQ19OVVZPVE9OLgo+Pgo+PiBJJ20gbm90IHN1cmUgaWYgdGhpcyBpbmZv
cm1hdGlvbiBpcyBzdWZmaWNpZW50LCBzbyBwbGVhc2UgcHJvdmlkZSAKPj4gc29tZSBndWlkYW5j
ZSBvbiB3aGF0IGVsc2UgSSBzaG91bGQgaW5jbHVkZSB0byBtZWV0IHlvdXIgcmVxdWlyZW1lbnRz
Lgo+Cj4gSeKAmWQgYmUgaW50ZXJlc3RlZCBvbiB3aGF0IGhhcmR3YXJlIHlvdSB0ZXN0ZWQgaXQu
IFByb2JhYmx5IHNvbWUgCj4gZXZhbHVhdGlvbiBvciBjdXN0b21lciByZWZlcmVuY2UgYm9hcmQu
ClRoZSBkcml2ZXIgaGFzIGJlZW4gdmFsaWRhdGVkIG9uIG91ciBkZXZlbG9wbWVudCBib2FyZHMs
IApOdU1ha2VyLUlvVC1NQTM1RDEtQTEgYW5kIE51TWFrZXItSE1JLU1BMzVEMS1TMS4KPgo+PiBJ
IHdpbGwgaW5jbHVkZSB0aGUgbG9nIG1lc3NhZ2VzIGF0IHRoZSBlbmQgb2YgdGhlIGVtYWlsLgo+
Cj4gQXdlc29tZS4gVGhhbmsgeW91LiBQZXJzb25hbGx5LCBJIGFsc28gbGlrZSB0byBzZWUgdGhv
c2UgaW4gdGhlIGNvbW1pdCAKPiBtZXNzYWdlLgpVbmRlcnN0b29kLiBJIHdpbGwgaW5jbHVkZSBp
biB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gdGhlIG5leHQgcGF0Y2guCj4KPj4+PiBSZXZpZXdlZC1i
eTogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvZXkg
THUgPGEwOTg3MjAzMDY5QGdtYWlsLmNvbT4KPj4+Cj4+PiBBcyB5b3UgdXNlIHlvdXIgY29tcGFu
eSBlbWFpbCBhZGRyZXNzIGluIHRoZSBBVVRIT1IgbGluZSBiZWxvdywgCj4+PiBwbGVhc2UgYWxz
byBhZGQgdGhhdCBlbWFpbCBhZGRyZXNzIHRvIHRoZSBjb21taXQgbWVzc2FnZSAoYW5kIG1heWJl
IAo+Pj4gZXZlbiBhcyB0aGUgYXV0aG9yKS4KPj4KPj4gSSB3aWxsIHVwZGF0ZSB0aGUgQVVUSE9S
IHRvIHVzZSBteSBwZXJzb25hbCBlbWFpbCBhZGRyZXNzIGluc3RlYWQgb2YgCj4+IHRoZSBjb21w
YW55IGVtYWlsLgo+Cj4gVW5kZXJzdG9vZC4gKHljbHU0QG51dm90b24uY29tIGlzIGFsc28gcGVy
c29uYWwsIGJ1dCB0aGUgR21haWwgYWRkcmVzcyAKPiBpcyBwcml2YXRlLCBJIGd1ZXNzLiA7LSkp
LgpPb3BzLCBJIG1lYW50IHRvIHNheSAicHJpdmF0ZSIgaW5zdGVhZC4KPgo+IEZvciBzdGF0aXN0
aWNzLCBob3cgY29tcGFuaWVzIGNvbnRyaWJ1dGUgdG8gdGhlIExpbnV4IGtlcm5lbCwgaGF2aW5n
IAo+IHRoZSBjb21wYW55IGFkZHJlc3Mgc29tZXdoZXJlIHdvdWxkIGJlIG5pY2UgdGhvdWdoLCBh
cyB5b3UgYXJlIGRvaW5nIAo+IHRoaXMgYXMgeW91ciB3b3JrIGF0IE51dm90b24sIHJpZ2h0PwpJ
IHdpbGwga2VlcCB0aGUgY29tcGFueSBpbmZvcm1hdGlvbiBpbiB0aGUgZHJpdmVyIGhlYWRlciBh
cyB5b3UgbWVudGlvbmVkLgo+Cj4+Pj4gLS0tCj4+Pj4gwqAgZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvS2NvbmZpZ8KgwqAgfMKgIDExICsrCj4+Pj4gwqAgZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvTWFrZWZpbGXCoCB8wqDCoCAxICsKPj4+PiDCoCAuLi4v
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbnV2b3Rvbi5jwqDCoCB8IDE3OSAKPj4+PiAr
KysrKysrKysrKysrKysrKysKPj4+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDE5MSBpbnNlcnRpb25z
KCspCj4+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+Pj4+IGRyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLW51dm90b24uYwo+Cj4gW+KApl0KPgo+PiBsb2c6Cj4+Cj4+
IFvCoMKgwqAgVDBdIEJvb3RpbmcgTGludXggb24gcGh5c2ljYWwgQ1BVIDB4MDAwMDAwMDAwMCBb
MHg0MTFmZDA0MF0KPgo+IE91dCBvZiBjdXJpb3NpdHksIGhvdyBkbyB5b3UgZ2V0IHRoZXNlIHRp
bWVzdGFtcHMgVDAsIFQxLCDigKY/Cj4KPiBb4oCmXQo+Cj4KPiBUaGFuayB5b3UgYW5kIGtpbmQg
cmVnYXJkcywKPgo+IFBhdWwKCkkgc2ltcGx5IGZvcmdvdCB0byBlbmFibGUgQ09ORklHX1BSSU5U
S19USU1FLiBIZXJlIGlzIHdoYXQgdGhlIGxvZyBsb29rcyAKbGlrZSBhZnRlciBlbmFibGluZyBp
dC4KClvCoMKgwqAgMS44ODYxMDBdIG51dm90b24tZHdtYWMgNDAxMjAwMDAuZXRoZXJuZXQ6IFRY
IENoZWNrc3VtIGluc2VydGlvbiAKc3VwcG9ydGVkClvCoMKgwqAgMS44OTMxMDRdIG51dm90b24t
ZHdtYWMgNDAxMjAwMDAuZXRoZXJuZXQ6IEVuaGFuY2VkL0FsdGVybmF0ZSAKZGVzY3JpcHRvcnMK
W8KgwqDCoCAxLjkwMDA0OF0gbnV2b3Rvbi1kd21hYyA0MDEyMDAwMC5ldGhlcm5ldDogRW5hYmxl
ZCBleHRlbmRlZCBkZXNjcmlwdG9ycwpbwqDCoMKgIDEuOTA2ODA2XSBudXZvdG9uLWR3bWFjIDQw
MTIwMDAwLmV0aGVybmV0OiBSaW5nIG1vZGUgZW5hYmxlZApbwqDCoMKgIDEuOTEyNjExXSBudXZv
dG9uLWR3bWFjIDQwMTIwMDAwLmV0aGVybmV0OiBFbmFibGUgUlggTWl0aWdhdGlvbiB2aWEgCkhX
IFdhdGNoZG9nIFRpbWVyCgpCUiwKCkpvZXkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
