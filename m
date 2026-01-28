Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE8oGACQeWl9xgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 05:26:40 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BE09CF6B
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 05:26:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72AAFC0693D;
	Wed, 28 Jan 2026 04:26:39 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C69AC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 04:26:37 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-40427db1300so3932793fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 20:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769574397; x=1770179197;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VklwEd5dwuBjikrAPpEFP/UQPzhOaAWoIKJ/0tvPqOU=;
 b=g7cHvUuPqNNq7xr929lS3ygSqWwJd+Wjef1U2a/cSeRj1CXkcYUmb2tv0yPVCMW/Fi
 CrvnWNZ4nmW7zg0B1Pmr84k5ZbOI8qFRhVT819knecv0b4VBvpG1n7MyWtyZ/QG/k6Wz
 +gCFqZbLoh7kaLOwQ7y4rbfxKFt2Mqnb5p7Uc0gCSxlQtA/yeQ4IzanxgB9+/X1/i8Ua
 7XwL8P/2/D52Xt3kIza3g4dDCeCpSnZkuF1fjH+jcZhImBhati9w5JlmTKzw/GIyxnAB
 eCN4tj4r3Y5y1V8OioDO+rxTspsli+rD8AdrX5rUQiOLbheu3LamUoeBFeAgEy3CzGmu
 vuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769574397; x=1770179197;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VklwEd5dwuBjikrAPpEFP/UQPzhOaAWoIKJ/0tvPqOU=;
 b=sJmx0Q8LBuHi8Q5cmhD9Eu3E1MO7cI9NBOftgDBLoh2HrBUaxwpVyBxU/vj1U+i7j3
 4UitJ5dl5A4Il9WOby2pHW5rv6zPS95ELJARLzDSwylXLzCvvdz2dhEOSpCjL+4fOuQs
 Iw/8C5wZ7Oyn122IFpfE+aLGQOxGcUVwKgQaQZavhxVZRXuqpI+BuWhlRiQQBPHnw5xY
 5gax9iRb/v2IGo3g9kgXMYEJ2R3Achb+CS/41HFo4A3j+xIIGf7VZA8xvdyU/UVtpMjE
 ctaR15I84fYGW9glypFmTwKD3Ez/jQK52sjg3gV1QaIXKFeFwqU4C4V2OMCM/L6ZanUJ
 pQzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCGojq+yHidbYuWktpppt49zZS3d8OqgtA2KB+qWLpHGtAX2c2PTs9TghRI8jrYAT0apAG/QLp6+LgmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxvFeR4CVTpZpJ+JH4Clat7kzILwlOqTh+Ca7WylHKN19OcjATv
 nK5RB2cFuyPNq3sxQ6lWjcLIfk7/BJDRUTWpA0BIf8CQH0f0tApPi2wTjI14oA==
X-Gm-Gg: AZuq6aKYnxBOQXrj+V2BdCLQG1umioO2xQbLkvNRyuY3iZI6Nd8fQGoMrH5jDgtROG0
 m/rfRtcwsDGVUAbleGSJzwD9YOrsA4fseWuMn4D1LjolyNZp3Hw+Ow6g9UChsIoQkZ+Q9EBmViB
 aZq9DeDJ5aAV2VzDVmit0gzi+i5w3IbU96N/XEcQNiGdJxN2uW3pBKqrv9IqEvxo9+OFT1+9hWB
 W8BAhZYq3BrlcmvvLC2rvywYQr/r016eGANdcjuScucj06jIRuWh2OyCUi7oBJJFD+ruoTfgO0V
 FrEzThzE8bjpgzjabeMDSx9ruKoin3GCSqhn4HoQQ1HvN4aWCdPEM9dNJsa5SeZxPnr1MOXV/2A
 nPKYJXmISWB9ADbJB+kyuTLZXWKmR8XP4Ne2gmJi8UQ/4U5BV12B7NUyfwuYjXEslDTq7TV46kx
 gwPxGqQDX8PSJJNxuRSdbcQDqDSUubgurF8fg=
X-Received: by 2002:a05:7022:1099:b0:123:3488:89a3 with SMTP id
 a92af1059eb24-124a00bd734mr1918278c88.24.1769567650952; 
 Tue, 27 Jan 2026 18:34:10 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b7a1addafesm780825eec.25.2026.01.27.18.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 18:34:10 -0800 (PST)
Message-ID: <973f2b4b-bf8d-4a77-a27a-47495bc21ff8@gmail.com>
Date: Tue, 27 Jan 2026 18:38:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Min Lin <linmin@eswincomputing.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
 <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
 <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
 <73ea5619.2b71.19bf847c80d.Coremail.linmin@eswincomputing.com>
 <aXeydXuWEMDz-yVM@shell.armlinux.org.uk>
 <32a1f814.2c79.19bfe173225.Coremail.linmin@eswincomputing.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <32a1f814.2c79.19bfe173225.Coremail.linmin@eswincomputing.com>
Cc: robh@kernel.org, Andrew Lunn <andrew@lunn.ch>, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ningyu@eswincomputing.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 Krzysztof Kozlowski <krzk@kernel.org>, weishangjuan@eswincomputing.com,
 andrew+netdev@lunn.ch, =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com
Subject: Re: [Linux-stm32] [PATCH v1 1/2] dt-bindings: ethernet: eswin: add
 clock sampling control
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ganboing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linmin@eswincomputing.com,m:linux@armlinux.org.uk,m:robh@kernel.org,m:andrew@lunn.ch,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:ningyu@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:edumazet@google.com,m:krzk@kernel.org,m:weishangjuan@eswincomputing.com,m:andrew+netdev@lunn.ch,m:lizhi2@eswincomputing.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ganboing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,vger.kernel.org,eswincomputing.com,st-md-mailman.stormreply.com,google.com,gmail.com,redhat.com,davemloft.net,lists.infradead.org,einfochips.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns,einfochips.com:email,st.com:email,stormreply.com:url,stormreply.com:email,nxp.com:url,eswincomputing.com:email,davemloft.net:email,infradead.org:email,lunn.ch:email]
X-Rspamd-Queue-Id: C5BE09CF6B
X-Rspamd-Action: no action

SGkgTWluLCBSdXNzZWxsLCBLcnp5c3p0b2YsCgpPbiAxLzI2LzI2IDIyOjE0LCBNaW4gTGluIHdy
b3RlOgo+IEhpIFJ1c3NlbGwsCj4gCj4gCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZXMtLS0tLQo+
PiBGcm9tOiAiUnVzc2VsbCBLaW5nIChPcmFjbGUpIiA8bGludXhAYXJtbGludXgub3JnLnVrPgo+
PiBTZW5kIHRpbWU6VHVlc2RheSwgMjcvMDEvMjAyNiAwMjoyOTowOQo+PiBUbzogIk1pbiBMaW4i
IDxsaW5taW5AZXN3aW5jb21wdXRpbmcuY29tPgo+PiBDYzogIkJvIEdhbiIgPGdhbmJvaW5nQGdt
YWlsLmNvbT4sICJBbmRyZXcgTHVubiIgPGFuZHJld0BsdW5uLmNoPiwgIktyenlzenRvZiBLb3ps
b3dza2kiIDxrcnprQGtlcm5lbC5vcmc+LCDmnY7lv5cgPGxpemhpMkBlc3dpbmNvbXB1dGluZy5j
b20+LCBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgYW5kcmV3K25ldGRldkBsdW5uLmNoLCBk
YXZlbUBkYXZlbWxvZnQubmV0LCBlZHVtYXpldEBnb29nbGUuY29tLCBrdWJhQGtlcm5lbC5vcmcs
IHJvYmhAa2VybmVsLm9yZywga3J6aytkdEBrZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3Jn
LCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBwYWJlbmlAcmVkaGF0LmNvbSwgbWNvcXVlbGluLnN0
bTMyQGdtYWlsLmNvbSwgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbSwgbGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBuaW5neXVAZXN3aW5jb21w
dXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVhbkBl
c3dpbmNvbXB1dGluZy5jb20KPj4gU3ViamVjdDogUmU6IFJlOiBbUEFUQ0ggdjEgMS8yXSBkdC1i
aW5kaW5nczogZXRoZXJuZXQ6IGVzd2luOiBhZGQgY2xvY2sgc2FtcGxpbmcgY29udHJvbAo+Pgo+
PiBPbiBNb24sIEphbiAyNiwgMjAyNiBhdCAxMToxMDoxMkFNICswODAwLCBNaW4gTGluIHdyb3Rl
Ogo+Pj4gRHVlIHRvIGNoaXAgYmFja2VuZCByZWFzb25zLCB0aGVyZSBpcyBhbHJlYWR5IGEgfjQt
NW5zIHNrZXcgYmV0d2VlbiB0aGUgUlgKPj4+IGNsb2NrIGFuZCBkYXRhIG9mIHRoZSBldGgxIE1B
QyBjb250cm9sbGVyIGluc2lkZSB0aGUgc2lsaWNvbi4KPj4KPj4gTGV0J3MgYW5hbHlzZSB0aGlz
Lgo+Pgo+PiAJVFhDIC8gUlhDCVRYQyAvIFJYQwo+PiBTcGVlZAlDbG9jayByYXRlCUNsb2NrIHBl
cmlvZAo+PiAxRwkxMjVNSHoJCThucwo+PiAxMDBNCTI1TUh6CQk0MG5zCj4+IDEwTQkyLjVNSHoJ
CTQwMG5zCj4+Cj4+IFRoZSByZXF1aXJlZCBza2V3IGZvciBUWEMgYW5kIFJYQyBhdCB0aGUgcmVj
ZWl2ZXIgaXMgc3BlY2lmaWVkIHRvIGJlCj4+IGJldHdlZW4gMSBhbmQgMi42bnMgaXJyZXNwZWN0
aXZlIG9mIHRoZSBzcGVlZC4gVGhlIGVkZ2Ugb2YgdGhlIGNsb2NrCj4+IGlzIGFsc28gaW1wb3J0
YW50OiB0aGUgcmlzaW5nIGVkZ2UgaW5kaWNhdGVzIHRoZSBsb3dlciA0IGJpdHMsIGFuZAo+PiB0
aGUgZmFsbGluZyBlZGdlIGluZGljYXRlcyB0aGUgdXBwZXIgNCBiaXRzLgo+Pgo+PiBBdCAxRyBz
cGVlZCwgd2l0aCBhICI0IHRvIDVucyIgc2tldyBpbiB0aGUgY2hpcC4gSWYgdGhpcyBpcyBhY2N1
cmF0ZSwKPj4gdGhlbiBpbnZlcnRpbmcgdGhlIGNsb2NrIGFuZCBhZGRpbmcgMW5zIG9mIGFkZGl0
aW9uYWwgc2tldyBieSBzb21lCj4+IG1lYW5zIChQQ0IgdHJhY2UsIG9yIGF0IHRoZSBNQUMgb3Ig
UEhZKSB3aWxsIGdpdmUgdGhlIHJlcXVpcmVkIGNsb2NrCj4+IGF0IHRoZSByZWNlaXZlci4KPj4K
PiAKPiBZZXMsIHRoYXQncyBleGFjdGx5IHRoZSBjYXNlLgo+IAo+PiBUaGUgdGltaW5nIHRhYmxl
IGluIHRoZSBSR01JSSBzdGFuZGFyZCAoMy4zKSBhbGxvd3MgZm9yIFRjeWMgKHRoZQo+PiBjbG9j
ayByYXRlKSB0byBiZSBzY2FsZWQsIGJ1dCB0aGVyZSBpcyBubyBhbGxvd2FuY2UgZm9yIHNjYWxp
bmcKPj4gVHNrZXdSICh0aGUgcmVxdWlyZWQgMSB0byAyLjZucyBza2V3LikgVGhpcyBza2V3IHBh
cmFtZXRlciBpcwo+PiBmaXhlZC4KPj4KPj4gU28sIGF0IHRoZSBvdGhlciBzcGVlZHMsIHlvdSBh
cmUgY29tcGxldGVseSB1bmFibGUgdG8gbWVldCB0aGUgdGltaW5nCj4+IHNwZWNpZmljYXRpb24s
IHdoZXRoZXIgaXJyZXNwZWN0aXZlIG9mIHRoZSBjbG9jayBpbnZlcnNpb24uIEluIGVmZmVjdCwK
Pj4gdGhlIG9ubHkgc3BlZWQgdGhhdCB5b3UgY2FuIG1lZXQgdGhlIHNwZWNpZmljYXRpb24gaXMg
MUcuCj4+Cj4gCj4gVGhlIHRpbWluZyB0YWJsZSBpbiB0aGUgUkdNSUkgc3RhbmRhcmQoMy4zKSBz
YXlzIHRoZSBtYXggdmFsdWUgb2YgVHNrZXcKPiBmb3IgMTAvMTAwIGlzIHVuc3BlY2lmaWVkLgo+
IFF1b3RhdGlvbjoibm90ZTE6IC4uLixGb3IgMTAvMTAwIHRoZSBNYXggdmFsdWUgaXMgdW5zcGVj
aWZpZWQuIgo+IAo+IEkgdGhpbmsgZm9yIDEwLzEwMCwgdGhlICI0IHRvIDVucyIgc2tldyBpbiB0
aGUgY2hpcCBkb2Vzbid0IGJyZWFrIHRoZQo+IHN0YW5kYXJkLiBBdCAxMC8xMDAgc3BlZWRzLCBp
dCBtZWV0cyB0aGUgdGltaW5nIHNwZWNpZmljYXRpb24gd2l0aG91dAo+IGhhdmluZyB0byB0byBh
ZGQgY2xvY2sgaW52ZXJzaW9uLgo+IEluIHByYWN0aWNlLCBpdCB3b3JrcyBhdCAxMC8xMDAgc3Bl
ZWRzIGluIHRoZSByZ21paS1pZCBwaHkgbW9kZS4KPiAKPj4gVGh1cywgSSB0aGluayB0aGlzIGlz
IHNvbWV0aGluZyB0aGF0IG5lZWRzIGEgbG90IG1vcmUgdGhhbiBqdXN0ICJkbwo+PiB3ZSBuZWVk
IHRvIGludmVydCB0aGUgY2xvY2siLiBZb3UgYWxzbyBuZWVkIHRvIHByZXZlbnQgMTBNIGFuZCAx
MDBNCj4+IGJlaW5nIHN1cHBvcnRlZCBJTUhPLgo+Pgo+IAo+IFJlZ2FyZHMsCj4gTGluIE1pbgoK
SSBoYWQgYW4gb2ZmbGluZSBkaXNjdXNzaW9uIHdpdGggWWFvIFppIGFuZCBvdGhlcnMgcmVnYXJk
aW5nIHRoaXMuIFdlIGZlZWwKbGlrZSB0aGUgcHJvcGVyIHdheSBmb3IgRVNXSU4gdG8gZGVhbCB3
aXRoIHRoaXMgYnJva2VuIGV0aDEgaXMgdG8gaGF2ZSBhCmRpZmZlcmVudCBjb21wYXRpYmxlIHN0
cmluZyBqdXN0IGZvciBldGgxLCB3aGVyZSBpdCBjYW4gYmUgYXNzb2NpYXRlZCB3aXRoCnBsYXRm
b3JtIGRhdGEgd2l0aCBxdWlya3MgdG8gZG8gZXN3aW4scngtY2xrLWludmVydCBhdCAxRy4gVGhl
IHByb3BlcnR5IGlzCnRoZXJlZm9yZSBub3QgcmVxdWlyZWQgdG8gYmUgZXhwb3NlZCBpbiBEVC4g
KFByZXRlbmQgaXQgY29uZm9ybXMgdG8gc3BlYwpmb3IgMUcpLiBOZWVkIGNvbmZpcm1hdGlvbiBm
b3IgMTBNLzEwME0sIHRob3VnaC4gSSBkb3VibGUgY2hlY2tlZCBMaW4gTWluJ3MKY2xhaW0sIGFu
ZCBpbmRlZWQgdGhlIHNwZWMgc2F5cyAiRm9yIDEwLzEwMCB0aGUgTWF4IHZhbHVlIGlzIHVuc3Bl
Y2lmaWVkIjoKaHR0cHM6Ly9jb21tdW5pdHkubnhwLmNvbS9wd214eTg3NjU0L2F0dGFjaG1lbnRz
L3B3bXh5ODc2NTQvaW14LXByb2Nlc3NvcnMvMjA2NTUvMS9SR01JSXYyXzBfZmluYWxfaHAucGRm
CgpUaG91Z2h0cz8KCkJvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
