Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E81C387BCB4
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Mar 2024 13:23:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85D48C6DD73;
	Thu, 14 Mar 2024 12:23:40 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A602C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 21:17:32 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1dc29f1956cso2208345ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 14:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710364650; x=1710969450;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NUlXrKT9EnIj18amwCty7VMhLzOsFE6rwuzLJc3R0iA=;
 b=IWsiFU5f87hKiEL6DnQ7Yetc4yzN/vHQ3lfRYZIaiY5mJ/aevnNI8dn/ryR/OzatEp
 V9bY3m7SnG0/LqgS2CBeVUB9US/dmHecgAlYaFhkxenMQhPjTDMSuVISvvuuhMl/2Yi4
 Mrx/zQZ7co0Bh5wHllNhP5xNlqRheSI+ba6FiCfPata8KcGtmbLvuJm10f+FZgonTlNS
 gZo9Mxx2iCOc57V8LggxFiq+f8skjCWqbkHrRa4TVieEb/zT4svccnqRA0y+Ipa1jica
 6RFyTguluTq2z9/P8r8/L/zSr6qhSKa1i1z0YETMGuOOVcqaKIuSwhuTVi1jMRMItc1H
 2n/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710364650; x=1710969450;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NUlXrKT9EnIj18amwCty7VMhLzOsFE6rwuzLJc3R0iA=;
 b=Oypquk62JJSjjIo9oGrGFEFdTIAGAaXc/nHSjwsOC/4qfwQvG4kMo0WddnOyDcqIPT
 AhgyAwF2FMZQOsWEPHgj7uwEM65mAAv6N9JO28n39Hh/IkwDg6puk0d6cupIv5BLFHll
 wvjri3hJpZNM4lFVhJU4ttJ6bWpTkZ1TpHC0GERxE0PZ0LYI3eKvWFDRv30+4OsH/OxL
 5sHKD0OjJHgQPZKzMxa7SjM/0LdUnOyglxw88zRagqc9v9EHA3q68UQMEzwE6BHTvj9J
 lLaL+CVk0VjQ6j47ghi5T5/1f5/JNPSCFcssP1kN37y9EeHR10mt1EongzsTYnhDqpNj
 ruYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNMvjxHjvYWOzwT1qmrBu3sFxXFFjfZxi/GtglDMWnr0y+fxNqd1wfe8m8NZ1ZFWSI8pdV8rXMPoWKNvrA8kVPMXkwdu5MgYwGmgRen30qdEWjOraci4WP
X-Gm-Message-State: AOJu0Yw0b2vLg7QU5jQ1aaqyuLxcKyJbrdQeq1dvibKYlBAUid6reFLJ
 0EdqAvifU4ZHmPUE5QhdoD/ja6rkP5AvTGWRhOBsD2wUN7BFK9dY
X-Google-Smtp-Source: AGHT+IG9I+hDSxyD1Im6G/LLTkYoz1TmcbofHmjXyd16Vyd3jct6bToKtjs1/z8pGQeFpGSefzEBMg==
X-Received: by 2002:a17:902:ea01:b0:1db:55cc:d226 with SMTP id
 s1-20020a170902ea0100b001db55ccd226mr14449454plg.66.1710364650361; 
 Wed, 13 Mar 2024 14:17:30 -0700 (PDT)
Received: from [192.168.254.38] ([50.39.172.77])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a170902da8700b001da15580ca8sm65107plx.52.2024.03.13.14.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 14:17:29 -0700 (PDT)
Message-ID: <db86cba4-0e61-441d-8e66-405a13b61a3c@gmail.com>
Date: Wed, 13 Mar 2024 14:17:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Biggers <ebiggers@kernel.org>
References: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
 <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
 <f2dcbe55-0f0e-4173-8e21-f899c6fc802a@gmail.com>
 <20240313194423.GA1111@sol.localdomain>
 <b838e729-dc30-4e18-b928-c34c16b08606@gmail.com>
 <20240313202223.GB1111@sol.localdomain>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20240313202223.GB1111@sol.localdomain>
X-Mailman-Approved-At: Thu, 14 Mar 2024 12:23:39 +0000
Cc: linux-wireless@vger.kernel.org, herbert@gondor.apana.org.au,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Karel Balej <balejk@matfyz.cz>, dhowells@redhat.com, mcgrof@kernel.org,
 keyrings@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-modules@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 iwd@lists.linux.dev, davem@davemloft.net, dimitri.ledkov@canonical.com,
 linux-crypto@vger.kernel.org
Subject: Re: [Linux-stm32] [REGRESSION] Re: [PATCH] crypto: pkcs7: remove
	sha1 support
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

SGksCgpPbiAzLzEzLzI0IDE6MjIgUE0sIEVyaWMgQmlnZ2VycyB3cm90ZToKPiBPbiBXZWQsIE1h
ciAxMywgMjAyNCBhdCAwMToxMjo1NFBNIC0wNzAwLCBKYW1lcyBQcmVzdHdvb2Qgd3JvdGU6Cj4+
IEhpLAo+Pgo+PiBPbiAzLzEzLzI0IDEyOjQ0IFBNLCBFcmljIEJpZ2dlcnMgd3JvdGU6Cj4+PiBP
biBXZWQsIE1hciAxMywgMjAyNCBhdCAxMDoyNjowNkFNIC0wNzAwLCBKYW1lcyBQcmVzdHdvb2Qg
d3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBPbiAzLzEzLzI0IDE6NTYgQU0sIEpvaGFubmVzIEJl
cmcgd3JvdGU6Cj4+Pj4+IE5vdCBzdXJlIHdoeSB5b3UncmUgQ0MnaW5nIHRoZSB3b3JsZCwgYnV0
IEkgZ3Vlc3MgYWRkaW5nIGEgZmV3IG1vcmUKPj4+Pj4gZG9lc24ndCBodXJ0IC4uLgo+Pj4+Pgo+
Pj4+PiBPbiBXZWQsIDIwMjQtMDMtMTMgYXQgMDk6NTAgKzAxMDAsIEthcmVsIEJhbGVqIHdyb3Rl
Ogo+Pj4+Pj4gICAgIGFuZCBJIHVzZSBpd2QKPj4+Pj4gVGhpcyBpcyB5b3VyIHByb2JsZW0sIHRo
ZSB3aXJlbGVzcyBzdGFjayBpbiB0aGUga2VybmVsIGRvZXNuJ3QgdXNlIGFueQo+Pj4+PiBrZXJu
ZWwgY3J5cHRvIGNvZGUgZm9yIDgwMi4xWC4KPj4+PiBZZXMsIHRoZSB3aXJlbGVzcyBzdGFjayBo
YXMgemVybyBiZWFyaW5nIG9uIHRoZSBpc3N1ZS4gSSB0aGluayB0aGF0J3Mgd2hhdAo+Pj4+IHlv
dSBtZWFudCBieSAicHJvYmxlbSIuCj4+Pj4KPj4+PiBJV0QgaGFzIHVzZWQgdGhlIGtlcm5lbCBj
cnlwdG8gQVBJIGZvcmV2ZXIgd2hpY2ggd2FzIGFicnVwdGx5IGJyb2tlbiwgdGhhdAo+Pj4+IGlz
IHRoZSBwcm9ibGVtLgo+Pj4+Cj4+Pj4gVGhlIG9yaWdpbmFsIGNvbW1pdCBzYXlzIGl0IHdhcyB0
byByZW1vdmUgc3VwcG9ydCBmb3Igc2hhMSBzaWduZWQga2VybmVsCj4+Pj4gbW9kdWxlcywgYnV0
IGl0IGRpZCBtb3JlIHRoYW4gdGhhdCBhbmQgYnJva2UgdGhlIGtleWN0bCBBUEkuCj4+Pj4KPj4+
IFdoaWNoIHNwZWNpZmljIEFQSSBpcyBpd2QgdXNpbmcgdGhhdCBpcyByZWxldmFudCBoZXJlPwo+
Pj4gSSBjbG9uZWQgaHR0cHM6Ly9rZXJuZWwuZ29vZ2xlc291cmNlLmNvbS9wdWIvc2NtL25ldHdv
cmsvd2lyZWxlc3MvaXdkCj4+PiBhbmQgZ3JlcHBlZCBmb3Iga2V5Y3RsIGFuZCBBRl9BTEcsIGJ1
dCB0aGVyZSBhcmUgbm8gbWF0Y2hlcy4KPj4gSVdEIHVzZXMgRUxMIGZvciBpdHMgY3J5cHRvLCB3
aGljaCB1c2VzIHRoZSBBRl9BTEcgQVBJOgo+Pgo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGlicy9lbGwvZWxsLmdpdC8KPiBUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGF0IHRo
ZSByZWxldmFudCBjb2RlIGlzIHJlYWxseSBpbiB0aGF0IHNlcGFyYXRlCj4gcmVwb3NpdG9yeS4g
IE5vdGUsIGl0IHNlZW1zIHRoYXQga2V5Y3RsKCkgaXMgdGhlIHByb2JsZW0gaGVyZSwgbm90IEFG
X0FMRy4gIFRoZQo+IGJsYW1lZCBjb21taXQgZGlkbid0IGNoYW5nZSBhbnl0aGluZyBmb3IgQUZf
QUxHLgo+Cj4+IEkgYmVsaWV2ZSB0aGUgZmFpbHVyZSBpcyB3aGVuIGNhbGxpbmc6Cj4+Cj4+IEtF
WUNUTF9QS0VZX1FVRVJZIGVuYz0ieDk2MiIgaGFzaD0ic2hhMSIKPj4KPj4gIEZyb20gbG9ncyBN
aWNoYWVsIHBvc3RlZCBvbiB0aGUgSVdEIGxpc3QsIHRoZSBFTEwgQVBJIHRoYXQgZmFpbHMgaXM6
Cj4+Cj4+IGxfa2V5X2dldF9pbmZvIChlbGwuZ2l0L2VsbC9rZXkuYzo0MTYpCj4gT2theSwgSSBn
dWVzcyB0aGF0J3Mgd2hhdCdzIGFjdHVhbGx5IGNhdXNpbmcgdGhlIHByb2JsZW0uICBLRVlDVExf
UEtFWV8qIGFyZSBhCj4gd2VpcmQgc2V0IG9mIEFQSXMgd2hlcmUgdXNlcnNwYWNlIGNhbiBhc2sg
dGhlIGtlcm5lbCB0byBkbyBhc3ltbWV0cmljIGtleQo+IG9wZXJhdGlvbnMuICBJdCdzIHVuY2xl
YXIgd2h5IHRoZXkgZXhpc3QsIGFzIHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkgaXMgYXZhaWxhYmxl
Cj4gaW4gdXNlcnNwYWNlIGNyeXB0byBsaWJyYXJpZXMuCj4KPiBJIHN1cHBvc2UgdGhhdCB0aGUg
YmxhbWVkIGNvbW1pdCwgb3IgYXQgbGVhc3QgcGFydCBvZiBpdCwgd2lsbCBuZWVkIHRvIGJlCj4g
cmV2ZXJ0ZWQgdG8ga2VlcCB0aGVzZSB3ZWlyZCBrZXljdGxzIHdvcmtpbmcuCj4KPiBGb3IgdGhl
IGZ1dHVyZSwgd2h5IGRvZXNuJ3QgaXdkIGp1c3QgdXNlIGEgdXNlcnNwYWNlIGNyeXB0byBsaWJy
YXJ5IHN1Y2ggYXMKPiBPcGVuU1NMPwoKSSB3YXMgbm90IGFyb3VuZCB3aGVuIHRoZSBvcmlnaW5h
bCBkZWNpc2lvbiB3YXMgbWFkZSwgYnV0IGEgZmV3IHJlYXNvbnMgCkkga25vdyB3ZSBkb24ndCB1
c2Ugb3BlblNTTDoKCiDCoC0gSVdEIGhhcyB2aXJ0dWFsbHkgemVybyBkZXBlbmRlbmNpZXMuCgog
wqAtIE9wZW5TU0wgKyBmcmllbmRzIGFyZSByYXRoZXIgbGFyZ2UgbGlicmFyaWVzLgoKIMKgLSBB
Rl9BTEcgaGFzIHRyYW5zcGFyZW50IGhhcmR3YXJlIGFjY2VsZXJhdGlvbiAobm90IHN1cmUgaWYg
b3BlblNTTCAKZG9lcyB0b28pLgoKQW5vdGhlciBjb25zaWRlcmF0aW9uIGlzIG9uY2UgeW91IHN1
cHBvcnQgb3BlblNTTCBzb21lb25lIHdhbnRzIHdvbGZTU0wsIAp0aGVuIGJvcmluZ1NTTCBldGMu
IEV2ZW4gaWYgdXNlcnMgaW1wbGVtZW50IHN1cHBvcnQgaXQganVzdCBiZWNvbWVzIGEgCmh1Z2Ug
YnVyZGVuIHRvIGNhcnJ5IGZvciB0aGUgcHJvamVjdC4gSnVzdCBsb29rIGF0IHdwYV9zdXBwbGlj
YW50J3MgCnNyYy9jcnlwdG8vIGZvbGRlciwgbmVhcmx5IDQwayBMT0MgaW4gdGhlcmUsIGNvbXBh
cmVkIHRvIEVMTCdzIGNyeXB0byAKbW9kdWxlcyB3aGljaCBpcyB+NWsuIFlvdSBoYXZlIHRvIHNv
cnQgb3V0IGFsbCB0aGUgbml0dHkgZ3JpdHR5IGRldGFpbHMgCm9mIGVhY2ggbGlicmFyeSwgYW5k
IHByb3ZpZGUgYSBjb21tb24gZHJpdmVyL0FQSSBmb3IgdGhlIGNvcmUgY29kZSwgCmRpZmZlcmVu
Y2VzIGJldHdlZW4gb3BlbnNzbCB2ZXJzaW9ucywgdGhlIGxpc3QgZ29lcyBvbi4KClRoYW5rcywK
CkphbWVzCgoKPgo+IC0gRXJpYwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
