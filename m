Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s825L843I2qdkwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 22:55:42 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F0864B3B0
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 22:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=tCPRrNLM;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0537FC87ED6;
	Fri,  5 Jun 2026 20:55:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A941CC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 20:55:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2E1DA4E40905;
 Fri,  5 Jun 2026 20:55:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EAF5C5FED1;
 Fri,  5 Jun 2026 20:55:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 67478106A2684; 
 Fri,  5 Jun 2026 22:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1780692938; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Aiwy3kAG6tiKneQoUFU8UKdj2pAYVKoirLWT3K+q80M=;
 b=tCPRrNLMs0jPN/GZmfj6j7TNfAJSCbK33+CrNODdKLuKoXXzYFyGf6js5mihWECprObzso
 3BJZESVmDMgPN0teDEoTlR3lY0QZ7t+cAmL2jRosNN4r4vhs0MGKQk10zfWuvU9OZS9lEh
 F2wNMgtKa6n36oasUCqPWwZytY8yY3m74xvinp9WpkRuO+tYebj4fx+KeZOGJJ+mDpru0h
 vKP5hqkMrjRQ5JCFMY/f4hu0H17eH+txMdhmiuaQpQuUbfOewS5nO5reBzB8czYrCTbnH8
 lKHOm0N1cxkfMmWsKyAW9CxQX2fT11pPjvgoVXw+SSku7tgW+Hr+1G4I6zwy1g==
Mime-Version: 1.0
Date: Fri, 05 Jun 2026 22:55:25 +0200
Message-Id: <DJ1EYKOXV11H.25EJOUKFI81T4@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Yonghong Song" <yonghong.song@linux.dev>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Jiri
 Olsa" <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-8-c066e627fda8@bootlin.com>
 <13b87293-5237-43d3-9f91-33c13041cb43@linux.dev>
 <DJ18PD6QWGA2.2HOYGKU7RUB68@bootlin.com>
 <f73d0971-0544-4a92-bde7-b2fbfcdaf28b@linux.dev>
In-Reply-To: <f73d0971-0544-4a92-bde7-b2fbfcdaf28b@linux.dev>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, Bastien Curutchet <bastien.curutchet@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 8/8] selftests/bpf: add tests
 to validate KASAN on JIT programs
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yonghong.song@linux.dev,m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.dev,bootlin.com,kernel.org,iogearbox.net,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:from_mime,bootlin.com:url,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51F0864B3B0

T24gRnJpIEp1biA1LCAyMDI2IGF0IDc6MjAgUE0gQ0VTVCwgWW9uZ2hvbmcgU29uZyB3cm90ZToK
ClsuLi5dCgo+PiBBcmUgeW91IHNlZWluZyBhbnkga2FzYW4gcmVwb3J0IHdoZW4geW91IG1hbnVh
bGx5IGNoZWNrIHlvdXIga2VybmVsCj4+IGxvZ3MsIG9yIG5vdCBhdCBhbGwgPyBJZiBub3QgYXQg
YWxsLCBhcmUgeW91IHVzaW5nIHRoZSAiQ0kiIGRlZmNvbmZpZyA/Cj4KPiBJIGRvIHNlZSBvbmUg
cmVwb3J0Ogo+Cj4gWyAgIDc5LjUwMzA1OV0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gWyAgIDc5LjUwMzcxNV0gQlVH
OiBLQVNBTjogc2xhYi11c2UtYWZ0ZXItZnJlZSBpbiBicGZfcHJvZ19iYjc1M2IyZWUxZjY5YWEw
X3N0X25vdF9vbl9zdGFjaysweDExNS8weDE2MAo+IFsgICA3OS41MDM3MTVdIFdyaXRlIG9mIHNp
emUgMSBhdCBhZGRyIGZmMTEwMDAxMTcyMTBhMjAgYnkgdGFzayB0ZXN0X3Byb2dzLzIxNTMKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gWyAgIDc5LjUw
MzcxNV0gQ1BVOiA2IFVJRDogMCBQSUQ6IDIxNTMgQ29tbTogdGVzdF9wcm9ncyBUYWludGVkOiBH
ICAgICAgICAgICBPRSAgICAgICA3LjEuMC1yYzUtZ2Q1NTJhMTU2YzJmYSAjMTkyNiBQUkVFTVBU
KGZ1bGwpCj4gWyAgIDc5LjUwMzcxNV0gVGFpbnRlZDogW09dPU9PVF9NT0RVTEUsIFtFXT1VTlNJ
R05FRF9NT0RVTEUKPiBbICAgNzkuNTAzNzE1XSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJk
IFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUyByZWwtMS4xNC4wLTAtZzE1NTgyMWExOTkw
Yi1wcmVidWlsdC5xZW11Lm9yZyAwNC8wMS8yMDE0Cj4gWyAgIDc5LjUwMzcxNV0gQ2FsbCBUcmFj
ZToKPiBbICAgNzkuNTAzNzE1XSAgPFRBU0s+Cj4gWyAgIDc5LjUwMzcxNV0gIGR1bXBfc3RhY2tf
bHZsKzB4NmQvMHhhMAo+IFsgICA3OS41MDM3MTVdICBwcmludF9hZGRyZXNzX2Rlc2NyaXB0aW9u
KzB4NzcvMHgyMDAKPiBbICAgNzkuNTAzNzE1XSAgcHJpbnRfcmVwb3J0KzB4NTgvMHg3MAo+IFsg
ICA3OS41MDM3MTVdICA/IGJwZl9wcm9nX2JiNzUzYjJlZTFmNjlhYTBfc3Rfbm90X29uX3N0YWNr
KzB4MTE1LzB4MTYwCj4gWyAgIDc5LjUwMzcxNV0gIGthc2FuX3JlcG9ydCsweGEyLzB4ZTAKPiBb
ICAgNzkuNTAzNzE1XSAgPyBicGZfcHJvZ19iYjc1M2IyZWUxZjY5YWEwX3N0X25vdF9vbl9zdGFj
aysweDExNS8weDE2MAo+IFsgICA3OS41MDM3MTVdICA/IGJwZl90ZXN0X3J1bisweDIwOC8weDc3
MAo+IFsgICA3OS41MDM3MTVdICBicGZfcHJvZ19iYjc1M2IyZWUxZjY5YWEwX3N0X25vdF9vbl9z
dGFjaysweDExNS8weDE2MAo+IFsgICA3OS41MDM3MTVdICBicGZfdGVzdF9ydW4rMHg0NzIvMHg3
NzAKPiBbICAgNzkuNTAzNzE1XSAgPyBzcnNvX2FsaWFzX3JldHVybl90aHVuaysweDUvMHhmYmVm
NQo+IFsgICA3OS41MDM3MTVdICA/IF9fbG9ja19hY3F1aXJlKzB4ZTRhLzB4MmExMAo+IFsgICA3
OS41MDM3MTVdICA/IF9fcGZ4X19fY3NzX3JzdGF0X3VwZGF0ZWQrMHgxMC8weDEwCj4gWyAgIDc5
LjUwMzcxNV0gID8gX19sb2NrX2FjcXVpcmUrMHhlNGEvMHgyYTEwCj4gWyAgIDc5LjUwMzcxNV0g
ID8gX19wZnhfYnBmX3Rlc3RfcnVuKzB4MTAvMHgxMAo+IFsgICA3OS41MDM3MTVdICA/IHNyc29f
YWxpYXNfcmV0dXJuX3RodW5rKzB4NS8weGZiZWY1Cj4gWyAgIDc5LjUwMzcxNV0gID8gbG9ja19h
Y3F1aXJlKzB4ZmQvMHgyYjAKPiBbICAgNzkuNTAzNzE1XSAgPyBzcnNvX2FsaWFzX3JldHVybl90
aHVuaysweDUvMHhmYmVmNQo+IFsgICA3OS41MDM3MTVdICA/IHNyc29fYWxpYXNfcmV0dXJuX3Ro
dW5rKzB4NS8weGZiZWY1Cj4gWyAgIDc5LjUwMzcxNV0gID8gcmN1X2lzX3dhdGNoaW5nKzB4MWYv
MHhhMAo+IFsgICA3OS41MDM3MTVdICA/IHNyc29fYWxpYXNfcmV0dXJuX3RodW5rKzB4NS8weGZi
ZWY1Cj4gWyAgIDc5LjUwMzcxNV0gID8gX19rYXNhbl9rcmVhbGxvYysweGU5LzB4MTEwCj4gWyAg
IDc5LjUwMzcxNV0gID8gZXRoX3R5cGVfdHJhbnMrMHg0YjkvMHg1ZjAKPiBbICAgNzkuNTAzNzE1
XSAgYnBmX3Byb2dfdGVzdF9ydW5fc2tiKzB4ZGRmLzB4MjJmMAo+IFsgICA3OS41MDM3MTVdICA/
IF9fZmdldF9maWxlcysweDI5LzB4MzUwCj4gWyAgIDc5LjUwMzcxNV0gID8gc3Jzb19hbGlhc19y
ZXR1cm5fdGh1bmsrMHg1LzB4ZmJlZjUKPiBbICAgNzkuNTAzNzE1XSAgPyBfX2ZnZXRfZmlsZXMr
MHgyOS8weDM1MAo+IFsgICA3OS41MDM3MTVdICBicGZfcHJvZ190ZXN0X3J1bisweDFjYy8weDJk
MAo+IFsgICA3OS41MDM3MTVdICBfX3N5c19icGYrMHg3NDAvMHhhMzAKPiBbICAgNzkuNTAzNzE1
XSAgPyBfX3BmeF9fX3N5c19icGYrMHgxMC8weDEwCj4gWyAgIDc5LjUwMzcxNV0gID8gX3ByYl9y
ZWFkX3ZhbGlkKzB4MzM0LzB4NzcwCj4gWyAgIDc5LjUwMzcxNV0gID8gaGFuZGxlX21tX2ZhdWx0
KzB4OTFiLzB4YzAwCj4gWyAgIDc5LjUwMzcxNV0gIF9feDY0X3N5c19icGYrMHhiYS8weGQwCj4g
WyAgIDc5LjUwMzcxNV0gIGRvX3N5c2NhbGxfNjQrMHhlZS8weDQwMAo+IFsgICA3OS41MDM3MTVd
ICA/IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc2LzB4N2UKPiBbICAgNzkuNTAz
NzE1XSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzYvMHg3ZQo+IFsgICA3OS41
MDM3MTVdIFJJUDogMDAzMzoweDdmOTJkOGNmZTFhZAo+IFsgICA3OS41MDM3MTVdIENvZGU6IGZm
IGMzIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDkwIGYzIDBmIDFlIGZhIDQ4IDg5IGY4
IDQ4IDg5IGY3IDQ4IDg5IGQ2IDQ4IDg5IGNhIDRkIDg5IGMyIDRkIDg5IGM4IDRjIDhiIDRjIDI0
IDA4IDBmIDA1IDw0OD4gM2QgMDEgOAo+IFsgICA3OS41MDM3MTVdIFJTUDogMDAyYjowMDAwN2Zm
ZTQyMzdmZWU4IEVGTEFHUzogMDAwMDAyMDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAxNDEKPiBb
ICAgNzkuNTAzNzE1XSBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwN2ZmZTQyMzgwN2I4
IFJDWDogMDAwMDdmOTJkOGNmZTFhZAo+IFsgICA3OS41MDM3MTVdIFJEWDogMDAwMDAwMDAwMDAw
MDA1MCBSU0k6IDAwMDA3ZmZlNDIzN2ZmNzAgUkRJOiAwMDAwMDAwMDAwMDAwMDBhCj4gWyAgIDc5
LjUwMzcxNV0gUkJQOiAwMDAwN2ZmZTQyMzdmZjEwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6
IDAwMDAwMDAwMDAwMDAwNTAKPiBbICAgNzkuNTAzNzE1XSBSMTA6IDAwMDAwMDAwMDAwMDAwNjQg
UjExOiAwMDAwMDAwMDAwMDAwMjA2IFIxMjogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICA3OS41MDM3
MTVdIFIxMzogMDAwMDdmZmU0MjM4MDdkOCBSMTQ6IDAwMDA3ZjkyZDhlYjkwMDAgUjE1OiAwMDAw
NTU4NTc3OGRkMTUwCj4gWyAgIDc5LjUwMzcxNV0gIDwvVEFTSz4KPgo+IFsgICA3OS41MDM3MTVd
IEFsbG9jYXRlZCBieSB0YXNrIDIxNTM6Cj4gWyAgIDc5LjUwMzcxNV0gIGthc2FuX3NhdmVfdHJh
Y2srMHgyZi8weDcwCj4gWyAgIDc5LjUwMzcxNV0gIF9fa2FzYW5fa21hbGxvYysweDcyLzB4OTAK
PiBbICAgNzkuNTAzNzE1XSAgX19rbWFsbG9jX25vZGVfbm9wcm9mKzB4MzRjLzB4NzMwCj4gWyAg
IDc5LjUwMzcxNV0gIGJwZl9tYXBfYXJlYV9hbGxvYysweDRhLzB4MTEwCj4gWyAgIDc5LjUwMzcx
NV0gIGFycmF5X21hcF9hbGxvYysweDE5ZS8weDU4MAo+IFsgICA3OS41MDM3MTVdICBtYXBfY3Jl
YXRlKzB4OGIyLzB4MTUwMAo+IFsgICA3OS41MDM3MTVdICBfX3N5c19icGYrMHg3ZWEvMHhhMzAK
PiBbICAgNzkuNTAzNzE1XSAgX194NjRfc3lzX2JwZisweGJhLzB4ZDAKPiBbICAgNzkuNTAzNzE1
XSAgZG9fc3lzY2FsbF82NCsweGVlLzB4NDAwCj4gWyAgIDc5LjUwMzcxNV0gIGVudHJ5X1NZU0NB
TExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc2LzB4N2UKPgo+IFsgICA3OS41MDM3MTVdIFRoZSBidWdn
eSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIG9iamVjdCBhdCBmZjExMDAwMTE3MjEwODAwCj4gICAg
ICAgICAgICAgICAgICB3aGljaCBiZWxvbmdzIHRvIHRoZSBjYWNoZSBrbWFsbG9jLWNnLTFrIG9m
IHNpemUgMTAyNAo+IFsgICA3OS41MDM3MTVdIFRoZSBidWdneSBhZGRyZXNzIGlzIGxvY2F0ZWQg
MCBieXRlcyB0byB0aGUgcmlnaHQgb2YKPiAgICAgICAgICAgICAgICAgIGZyZWVkIDU0NC1ieXRl
IHJlZ2lvbiBbZmYxMTAwMDExNzIxMDgwMCwgZmYxMTAwMDExNzIxMGEyMCkKPgo+IFsgICA3OS41
MDM3MTVdIFRoZSBidWdneSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIHBoeXNpY2FsIHBhZ2U6Cj4g
WyAgIDc5LjUwMzcxNV0gcGFnZTogcmVmY291bnQ6MCBtYXBjb3VudDowIG1hcHBpbmc6MDAwMDAw
MDAwMDAwMDAwMCBpbmRleDoweDAgcGZuOjB4MTE3MjEwCj4gWyAgIDc5LjUwMzcxNV0gaGVhZDog
b3JkZXI6MyBtYXBjb3VudDowIGVudGlyZV9tYXBjb3VudDowIG5yX3BhZ2VzX21hcHBlZDowIHBp
bmNvdW50OjAKPiBbICAgNzkuNTAzNzE1XSBtZW1jZzpmZjExMDAwMTE3MjEwNDExCj4gWyAgIDc5
LjUwMzcxNV0gZmxhZ3M6IDB4MjAwMDAwMDAwMDAwMDQwKGhlYWR8bm9kZT0wfHpvbmU9MikKPiBb
ICAgNzkuNTAzNzE1XSBwYWdlX3R5cGU6IGY1KHNsYWIpCj4gWyAgIDc5LjUwMzcxNV0gcmF3OiAw
MjAwMDAwMDAwMDAwMDQwIGZmMTEwMDAxMDAwNzIwMDAgZGVhZDAwMDAwMDAwMDEwMCBkZWFkMDAw
MDAwMDAwMTIyCj4gWyAgIDc5LjUwMzcxNV0gcmF3OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwODAw
MDAxMDAwMTAgMDAwMDAwMDBmNTAwMDAwMCBmZjExMDAwMTE3MjEwNDExCj4gWyAgIDc5LjUwMzcx
NV0gaGVhZDogMDIwMDAwMDAwMDAwMDA0MCBmZjExMDAwMTAwMDcyMDAwIGRlYWQwMDAwMDAwMDAx
MDAgZGVhZDAwMDAwMDAwMDEyMgo+IFsgICA3OS41MDM3MTVdIGhlYWQ6IDAwMDAwMDAwMDAwMDAw
MDAgMDAwMDA4MDAwMDEwMDAxMCAwMDAwMDAwMGY1MDAwMDAwIGZmMTEwMDAxMTcyMTA0MTEKPiBb
ICAgNzkuNTAzNzE1XSBoZWFkOiAwMjAwMDAwMDAwMDAwMDAzIGZmZmZmZmZmZmZmZmZlMDEgMDAw
MDAwMDBmZmZmZmZmZiAwMDAwMDAwMGZmZmZmZmZmCj4gWyAgIDc5LjUwMzcxNV0gaGVhZDogMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwZmZmZmZmZmYgMDAwMDAwMDAw
MDAwMDAwOAo+IFsgICA3OS41MDM3MTVdIHBhZ2UgZHVtcGVkIGJlY2F1c2U6IGthc2FuOiBiYWQg
YWNjZXNzIGRldGVjdGVkCj4KPiBbICAgNzkuNTAzNzE1XSBNZW1vcnkgc3RhdGUgYXJvdW5kIHRo
ZSBidWdneSBhZGRyZXNzOgo+IFsgICA3OS41MDM3MTVdICBmZjExMDAwMTE3MjEwOTAwOiAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMAo+IFsgICA3OS41MDM3
MTVdICBmZjExMDAwMTE3MjEwOTgwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMAo+IFsgICA3OS41MDM3MTVdID5mZjExMDAwMTE3MjEwYTAwOiAwMCAwMCAw
MCAwMCBmYiBmYiBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYwo+IFsgICA3OS41MDM3MTVd
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gWyAgIDc5LjUwMzcxNV0gIGZmMTEw
MDAxMTcyMTBhODA6IGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZj
IGZjCj4gWyAgIDc5LjUwMzcxNV0gIGZmMTEwMDAxMTcyMTBiMDA6IGZjIGZjIGZjIGZjIGZjIGZj
IGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjCj4gWyAgIDc5LjUwMzcxNV0gPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Cj4KPgo+IEJ1dCB3aGVuIEkgYW0gcnVubmluZyBhbm90aGVyIHNhbWUgdGVzdCAnLi90ZXN0X3By
b2dzIC10IGthc2FuJywgdGhlcmUgaXMgbm8ga2FzYW4gcmVwb3J0cy4KCk9rLCBJIGd1ZXNzIHlv
dSBhcmUgbWlzc2luZyBrYXNhbl9tdWx0aV9zaG90IG9uIHlvdXIga2VybmVsIGNvbW1hbmQKbGlu
ZTogd2l0aG91dCB0aGlzIG9wdGlvbiwgb25seSB0aGUgZmlyc3QgcmVwb3J0IGlzIGdlbmVyYXRl
ZCwgdGhlbgpLQVNBTiBkb2VzIG5vdCBlbWl0IGFkZGl0aW9uYWwgcmVwb3J0IHVudGlsIHlvdSBy
ZXN0YXJ0IHlvdXIga2VybmVsLgpDb3VsZCB5b3UgcGxlYXNlIHRyeSBhZGRpbmcgaXQgYW5kIHJ1
bm5pbmcgdGhlIHRlc3RzIGFnYWluID8KClRoYW5rcywKCkFsZXhpcwoKPj4KPj4gICAgY2F0IHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi97Y29uZmlnLGNvbmZpZy52bSxjb25maWcueDg2XzY0
fSA+IC5jb25maWcgJiYgbWFrZSBvbGRkZWZjb25maWcKPj4KPj4gSWYgbm90LCB3b3VsZCB5b3Ug
bWluZCBzaGFyaW5nIHlvdXIgZGVmY29uZmlnID8KPgo+IEF0dGFjaGVkLgo+Cj4+Cj4+IFRoYW5r
cywKPj4KPj4gQWxleGlzCgoKCgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
