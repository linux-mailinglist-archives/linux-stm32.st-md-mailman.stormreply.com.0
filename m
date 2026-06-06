Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZCkWNZb+J2pp6wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:52:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EADA65FAD3
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:52:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linux.dev header.s=key1 header.b="ax/Sr5yu";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linux.dev (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43D9AC8F290;
	Tue,  9 Jun 2026 11:52:54 +0000 (UTC)
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D68A6C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Jun 2026 04:09:52 +0000 (UTC)
Message-ID: <d717e193-f3b3-4022-8b0f-5e94595dd69b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1780718991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zf8N71EUgiyD6Wduy1O+u0nq6u0a8d3gfrz5jZ1oWN4=;
 b=ax/Sr5yuepOsGT/g/0aFCUw2e59PpwGFTV3YtjVNpcj1qlT2Ce5e5XpVspBLWKV2rc3Bzc
 W4lZcSE21EEXOr6T+JSCBiRfX0W9r99DnZt8jTJxfdbzbWCYdf3C1NaeraTZ/1ZUecgMyk
 KYneJRXR7EwufNUw3DM4KSri5YTNPig=
Date: Fri, 5 Jun 2026 21:09:28 -0700
MIME-Version: 1.0
Content-Language: en-GB
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-8-c066e627fda8@bootlin.com>
 <13b87293-5237-43d3-9f91-33c13041cb43@linux.dev>
 <DJ18PD6QWGA2.2HOYGKU7RUB68@bootlin.com>
 <f73d0971-0544-4a92-bde7-b2fbfcdaf28b@linux.dev>
 <DJ1EYKOXV11H.25EJOUKFI81T4@bootlin.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <DJ1EYKOXV11H.25EJOUKFI81T4@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 09 Jun 2026 11:52:48 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[79];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,iogearbox.net,linux.dev,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[yonghong.song@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yonghong.song@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[linux.dev:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,linux.dev:mid,linux.dev:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,qemu.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EADA65FAD3

CgpPbiA2LzUvMjYgMTo1NSBQTSwgQWxleGlzIExvdGhvcsOpIHdyb3RlOgo+IE9uIEZyaSBKdW4g
NSwgMjAyNiBhdCA3OjIwIFBNIENFU1QsIFlvbmdob25nIFNvbmcgd3JvdGU6Cj4KPiBbLi4uXQo+
Cj4+PiBBcmUgeW91IHNlZWluZyBhbnkga2FzYW4gcmVwb3J0IHdoZW4geW91IG1hbnVhbGx5IGNo
ZWNrIHlvdXIga2VybmVsCj4+PiBsb2dzLCBvciBub3QgYXQgYWxsID8gSWYgbm90IGF0IGFsbCwg
YXJlIHlvdSB1c2luZyB0aGUgIkNJIiBkZWZjb25maWcgPwo+PiBJIGRvIHNlZSBvbmUgcmVwb3J0
Ogo+Pgo+PiBbICAgNzkuNTAzMDU5XSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gWyAgIDc5LjUwMzcxNV0gQlVHOiBL
QVNBTjogc2xhYi11c2UtYWZ0ZXItZnJlZSBpbiBicGZfcHJvZ19iYjc1M2IyZWUxZjY5YWEwX3N0
X25vdF9vbl9zdGFjaysweDExNS8weDE2MAo+PiBbICAgNzkuNTAzNzE1XSBXcml0ZSBvZiBzaXpl
IDEgYXQgYWRkciBmZjExMDAwMTE3MjEwYTIwIGJ5IHRhc2sgdGVzdF9wcm9ncy8yMTUzCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4+IFsgICA3OS41
MDM3MTVdIENQVTogNiBVSUQ6IDAgUElEOiAyMTUzIENvbW06IHRlc3RfcHJvZ3MgVGFpbnRlZDog
RyAgICAgICAgICAgT0UgICAgICAgNy4xLjAtcmM1LWdkNTUyYTE1NmMyZmEgIzE5MjYgUFJFRU1Q
VChmdWxsKQo+PiBbICAgNzkuNTAzNzE1XSBUYWludGVkOiBbT109T09UX01PRFVMRSwgW0VdPVVO
U0lHTkVEX01PRFVMRQo+PiBbICAgNzkuNTAzNzE1XSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5k
YXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUyByZWwtMS4xNC4wLTAtZzE1NTgyMWEx
OTkwYi1wcmVidWlsdC5xZW11Lm9yZyAwNC8wMS8yMDE0Cj4+IFsgICA3OS41MDM3MTVdIENhbGwg
VHJhY2U6Cj4+IFsgICA3OS41MDM3MTVdICA8VEFTSz4KPj4gWyAgIDc5LjUwMzcxNV0gIGR1bXBf
c3RhY2tfbHZsKzB4NmQvMHhhMAo+PiBbICAgNzkuNTAzNzE1XSAgcHJpbnRfYWRkcmVzc19kZXNj
cmlwdGlvbisweDc3LzB4MjAwCj4+IFsgICA3OS41MDM3MTVdICBwcmludF9yZXBvcnQrMHg1OC8w
eDcwCj4+IFsgICA3OS41MDM3MTVdICA/IGJwZl9wcm9nX2JiNzUzYjJlZTFmNjlhYTBfc3Rfbm90
X29uX3N0YWNrKzB4MTE1LzB4MTYwCj4+IFsgICA3OS41MDM3MTVdICBrYXNhbl9yZXBvcnQrMHhh
Mi8weGUwCj4+IFsgICA3OS41MDM3MTVdICA/IGJwZl9wcm9nX2JiNzUzYjJlZTFmNjlhYTBfc3Rf
bm90X29uX3N0YWNrKzB4MTE1LzB4MTYwCj4+IFsgICA3OS41MDM3MTVdICA/IGJwZl90ZXN0X3J1
bisweDIwOC8weDc3MAo+PiBbICAgNzkuNTAzNzE1XSAgYnBmX3Byb2dfYmI3NTNiMmVlMWY2OWFh
MF9zdF9ub3Rfb25fc3RhY2srMHgxMTUvMHgxNjAKPj4gWyAgIDc5LjUwMzcxNV0gIGJwZl90ZXN0
X3J1bisweDQ3Mi8weDc3MAo+PiBbICAgNzkuNTAzNzE1XSAgPyBzcnNvX2FsaWFzX3JldHVybl90
aHVuaysweDUvMHhmYmVmNQo+PiBbICAgNzkuNTAzNzE1XSAgPyBfX2xvY2tfYWNxdWlyZSsweGU0
YS8weDJhMTAKPj4gWyAgIDc5LjUwMzcxNV0gID8gX19wZnhfX19jc3NfcnN0YXRfdXBkYXRlZCsw
eDEwLzB4MTAKPj4gWyAgIDc5LjUwMzcxNV0gID8gX19sb2NrX2FjcXVpcmUrMHhlNGEvMHgyYTEw
Cj4+IFsgICA3OS41MDM3MTVdICA/IF9fcGZ4X2JwZl90ZXN0X3J1bisweDEwLzB4MTAKPj4gWyAg
IDc5LjUwMzcxNV0gID8gc3Jzb19hbGlhc19yZXR1cm5fdGh1bmsrMHg1LzB4ZmJlZjUKPj4gWyAg
IDc5LjUwMzcxNV0gID8gbG9ja19hY3F1aXJlKzB4ZmQvMHgyYjAKPj4gWyAgIDc5LjUwMzcxNV0g
ID8gc3Jzb19hbGlhc19yZXR1cm5fdGh1bmsrMHg1LzB4ZmJlZjUKPj4gWyAgIDc5LjUwMzcxNV0g
ID8gc3Jzb19hbGlhc19yZXR1cm5fdGh1bmsrMHg1LzB4ZmJlZjUKPj4gWyAgIDc5LjUwMzcxNV0g
ID8gcmN1X2lzX3dhdGNoaW5nKzB4MWYvMHhhMAo+PiBbICAgNzkuNTAzNzE1XSAgPyBzcnNvX2Fs
aWFzX3JldHVybl90aHVuaysweDUvMHhmYmVmNQo+PiBbICAgNzkuNTAzNzE1XSAgPyBfX2thc2Fu
X2tyZWFsbG9jKzB4ZTkvMHgxMTAKPj4gWyAgIDc5LjUwMzcxNV0gID8gZXRoX3R5cGVfdHJhbnMr
MHg0YjkvMHg1ZjAKPj4gWyAgIDc5LjUwMzcxNV0gIGJwZl9wcm9nX3Rlc3RfcnVuX3NrYisweGRk
Zi8weDIyZjAKPj4gWyAgIDc5LjUwMzcxNV0gID8gX19mZ2V0X2ZpbGVzKzB4MjkvMHgzNTAKPj4g
WyAgIDc5LjUwMzcxNV0gID8gc3Jzb19hbGlhc19yZXR1cm5fdGh1bmsrMHg1LzB4ZmJlZjUKPj4g
WyAgIDc5LjUwMzcxNV0gID8gX19mZ2V0X2ZpbGVzKzB4MjkvMHgzNTAKPj4gWyAgIDc5LjUwMzcx
NV0gIGJwZl9wcm9nX3Rlc3RfcnVuKzB4MWNjLzB4MmQwCj4+IFsgICA3OS41MDM3MTVdICBfX3N5
c19icGYrMHg3NDAvMHhhMzAKPj4gWyAgIDc5LjUwMzcxNV0gID8gX19wZnhfX19zeXNfYnBmKzB4
MTAvMHgxMAo+PiBbICAgNzkuNTAzNzE1XSAgPyBfcHJiX3JlYWRfdmFsaWQrMHgzMzQvMHg3NzAK
Pj4gWyAgIDc5LjUwMzcxNV0gID8gaGFuZGxlX21tX2ZhdWx0KzB4OTFiLzB4YzAwCj4+IFsgICA3
OS41MDM3MTVdICBfX3g2NF9zeXNfYnBmKzB4YmEvMHhkMAo+PiBbICAgNzkuNTAzNzE1XSAgZG9f
c3lzY2FsbF82NCsweGVlLzB4NDAwCj4+IFsgICA3OS41MDM3MTVdICA/IGVudHJ5X1NZU0NBTExf
NjRfYWZ0ZXJfaHdmcmFtZSsweDc2LzB4N2UKPj4gWyAgIDc5LjUwMzcxNV0gIGVudHJ5X1NZU0NB
TExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc2LzB4N2UKPj4gWyAgIDc5LjUwMzcxNV0gUklQOiAwMDMz
OjB4N2Y5MmQ4Y2ZlMWFkCj4+IFsgICA3OS41MDM3MTVdIENvZGU6IGZmIGMzIDY2IDJlIDBmIDFm
IDg0IDAwIDAwIDAwIDAwIDAwIDkwIGYzIDBmIDFlIGZhIDQ4IDg5IGY4IDQ4IDg5IGY3IDQ4IDg5
IGQ2IDQ4IDg5IGNhIDRkIDg5IGMyIDRkIDg5IGM4IDRjIDhiIDRjIDI0IDA4IDBmIDA1IDw0OD4g
M2QgMDEgOAo+PiBbICAgNzkuNTAzNzE1XSBSU1A6IDAwMmI6MDAwMDdmZmU0MjM3ZmVlOCBFRkxB
R1M6IDAwMDAwMjA2IE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMTQxCj4+IFsgICA3OS41MDM3MTVd
IFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDA3ZmZlNDIzODA3YjggUkNYOiAwMDAwN2Y5
MmQ4Y2ZlMWFkCj4+IFsgICA3OS41MDM3MTVdIFJEWDogMDAwMDAwMDAwMDAwMDA1MCBSU0k6IDAw
MDA3ZmZlNDIzN2ZmNzAgUkRJOiAwMDAwMDAwMDAwMDAwMDBhCj4+IFsgICA3OS41MDM3MTVdIFJC
UDogMDAwMDdmZmU0MjM3ZmYxMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAw
MDAwMDUwCj4+IFsgICA3OS41MDM3MTVdIFIxMDogMDAwMDAwMDAwMDAwMDA2NCBSMTE6IDAwMDAw
MDAwMDAwMDAyMDYgUjEyOiAwMDAwMDAwMDAwMDAwMDAwCj4+IFsgICA3OS41MDM3MTVdIFIxMzog
MDAwMDdmZmU0MjM4MDdkOCBSMTQ6IDAwMDA3ZjkyZDhlYjkwMDAgUjE1OiAwMDAwNTU4NTc3OGRk
MTUwCj4+IFsgICA3OS41MDM3MTVdICA8L1RBU0s+Cj4+Cj4+IFsgICA3OS41MDM3MTVdIEFsbG9j
YXRlZCBieSB0YXNrIDIxNTM6Cj4+IFsgICA3OS41MDM3MTVdICBrYXNhbl9zYXZlX3RyYWNrKzB4
MmYvMHg3MAo+PiBbICAgNzkuNTAzNzE1XSAgX19rYXNhbl9rbWFsbG9jKzB4NzIvMHg5MAo+PiBb
ICAgNzkuNTAzNzE1XSAgX19rbWFsbG9jX25vZGVfbm9wcm9mKzB4MzRjLzB4NzMwCj4+IFsgICA3
OS41MDM3MTVdICBicGZfbWFwX2FyZWFfYWxsb2MrMHg0YS8weDExMAo+PiBbICAgNzkuNTAzNzE1
XSAgYXJyYXlfbWFwX2FsbG9jKzB4MTllLzB4NTgwCj4+IFsgICA3OS41MDM3MTVdICBtYXBfY3Jl
YXRlKzB4OGIyLzB4MTUwMAo+PiBbICAgNzkuNTAzNzE1XSAgX19zeXNfYnBmKzB4N2VhLzB4YTMw
Cj4+IFsgICA3OS41MDM3MTVdICBfX3g2NF9zeXNfYnBmKzB4YmEvMHhkMAo+PiBbICAgNzkuNTAz
NzE1XSAgZG9fc3lzY2FsbF82NCsweGVlLzB4NDAwCj4+IFsgICA3OS41MDM3MTVdICBlbnRyeV9T
WVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3Ni8weDdlCj4+Cj4+IFsgICA3OS41MDM3MTVdIFRo
ZSBidWdneSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIG9iamVjdCBhdCBmZjExMDAwMTE3MjEwODAw
Cj4+ICAgICAgICAgICAgICAgICAgIHdoaWNoIGJlbG9uZ3MgdG8gdGhlIGNhY2hlIGttYWxsb2Mt
Y2ctMWsgb2Ygc2l6ZSAxMDI0Cj4+IFsgICA3OS41MDM3MTVdIFRoZSBidWdneSBhZGRyZXNzIGlz
IGxvY2F0ZWQgMCBieXRlcyB0byB0aGUgcmlnaHQgb2YKPj4gICAgICAgICAgICAgICAgICAgZnJl
ZWQgNTQ0LWJ5dGUgcmVnaW9uIFtmZjExMDAwMTE3MjEwODAwLCBmZjExMDAwMTE3MjEwYTIwKQo+
Pgo+PiBbICAgNzkuNTAzNzE1XSBUaGUgYnVnZ3kgYWRkcmVzcyBiZWxvbmdzIHRvIHRoZSBwaHlz
aWNhbCBwYWdlOgo+PiBbICAgNzkuNTAzNzE1XSBwYWdlOiByZWZjb3VudDowIG1hcGNvdW50OjAg
bWFwcGluZzowMDAwMDAwMDAwMDAwMDAwIGluZGV4OjB4MCBwZm46MHgxMTcyMTAKPj4gWyAgIDc5
LjUwMzcxNV0gaGVhZDogb3JkZXI6MyBtYXBjb3VudDowIGVudGlyZV9tYXBjb3VudDowIG5yX3Bh
Z2VzX21hcHBlZDowIHBpbmNvdW50OjAKPj4gWyAgIDc5LjUwMzcxNV0gbWVtY2c6ZmYxMTAwMDEx
NzIxMDQxMQo+PiBbICAgNzkuNTAzNzE1XSBmbGFnczogMHgyMDAwMDAwMDAwMDAwNDAoaGVhZHxu
b2RlPTB8em9uZT0yKQo+PiBbICAgNzkuNTAzNzE1XSBwYWdlX3R5cGU6IGY1KHNsYWIpCj4+IFsg
ICA3OS41MDM3MTVdIHJhdzogMDIwMDAwMDAwMDAwMDA0MCBmZjExMDAwMTAwMDcyMDAwIGRlYWQw
MDAwMDAwMDAxMDAgZGVhZDAwMDAwMDAwMDEyMgo+PiBbICAgNzkuNTAzNzE1XSByYXc6IDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDA4MDAwMDEwMDAxMCAwMDAwMDAwMGY1MDAwMDAwIGZmMTEwMDAxMTcy
MTA0MTEKPj4gWyAgIDc5LjUwMzcxNV0gaGVhZDogMDIwMDAwMDAwMDAwMDA0MCBmZjExMDAwMTAw
MDcyMDAwIGRlYWQwMDAwMDAwMDAxMDAgZGVhZDAwMDAwMDAwMDEyMgo+PiBbICAgNzkuNTAzNzE1
XSBoZWFkOiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwODAwMDAxMDAwMTAgMDAwMDAwMDBmNTAwMDAw
MCBmZjExMDAwMTE3MjEwNDExCj4+IFsgICA3OS41MDM3MTVdIGhlYWQ6IDAyMDAwMDAwMDAwMDAw
MDMgZmZmZmZmZmZmZmZmZmUwMSAwMDAwMDAwMGZmZmZmZmZmIDAwMDAwMDAwZmZmZmZmZmYKPj4g
WyAgIDc5LjUwMzcxNV0gaGVhZDogMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAw
MDAwMDAwZmZmZmZmZmYgMDAwMDAwMDAwMDAwMDAwOAo+PiBbICAgNzkuNTAzNzE1XSBwYWdlIGR1
bXBlZCBiZWNhdXNlOiBrYXNhbjogYmFkIGFjY2VzcyBkZXRlY3RlZAo+Pgo+PiBbICAgNzkuNTAz
NzE1XSBNZW1vcnkgc3RhdGUgYXJvdW5kIHRoZSBidWdneSBhZGRyZXNzOgo+PiBbICAgNzkuNTAz
NzE1XSAgZmYxMTAwMDExNzIxMDkwMDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAKPj4gWyAgIDc5LjUwMzcxNV0gIGZmMTEwMDAxMTcyMTA5ODA6IDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwCj4+IFsgICA3OS41MDM3
MTVdID5mZjExMDAwMTE3MjEwYTAwOiAwMCAwMCAwMCAwMCBmYiBmYiBmYyBmYyBmYyBmYyBmYyBm
YyBmYyBmYyBmYyBmYwo+PiBbICAgNzkuNTAzNzE1XSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXgo+PiBbICAgNzkuNTAzNzE1XSAgZmYxMTAwMDExNzIxMGE4MDogZmMgZmMgZmMgZmMg
ZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMgZmMKPj4gWyAgIDc5LjUwMzcxNV0gIGZm
MTEwMDAxMTcyMTBiMDA6IGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZj
IGZjIGZjCj4+IFsgICA3OS41MDM3MTVdID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Pgo+Pgo+PiBCdXQgd2hlbiBJIGFt
IHJ1bm5pbmcgYW5vdGhlciBzYW1lIHRlc3QgJy4vdGVzdF9wcm9ncyAtdCBrYXNhbicsIHRoZXJl
IGlzIG5vIGthc2FuIHJlcG9ydHMuCj4gT2ssIEkgZ3Vlc3MgeW91IGFyZSBtaXNzaW5nIGthc2Fu
X211bHRpX3Nob3Qgb24geW91ciBrZXJuZWwgY29tbWFuZAo+IGxpbmU6IHdpdGhvdXQgdGhpcyBv
cHRpb24sIG9ubHkgdGhlIGZpcnN0IHJlcG9ydCBpcyBnZW5lcmF0ZWQsIHRoZW4KPiBLQVNBTiBk
b2VzIG5vdCBlbWl0IGFkZGl0aW9uYWwgcmVwb3J0IHVudGlsIHlvdSByZXN0YXJ0IHlvdXIga2Vy
bmVsLgo+IENvdWxkIHlvdSBwbGVhc2UgdHJ5IGFkZGluZyBpdCBhbmQgcnVubmluZyB0aGUgdGVz
dHMgYWdhaW4gPwoKVGhhbmtzISBBZGRpbmcgJ2thc2FuX211bHRpX3Nob3QnIHRvIHRoZSBrZXJu
ZWwgY29tbWFuZCBsaW5lIGluZGVlZCBmaXhlZCB0aGUgcHJvYmxlbS4KSXQgd291bGQgYmUgZ3Jl
YXQgaWYgeW91IGNhbiBtZW50aW9uICdrYXNhbl9tdWx0aV9zaG90JyBpcyBuZWVkZWQgaW4ga2Vy
bmVsIGNvbW1hbmQKbGluZSBpbiBjb3ZlciBsZXR0ZXIgYW5kIGluIHBhdGNoIDguCgo+Cj4gVGhh
bmtzLAo+Cj4gQWxleGlzCj4KPj4+ICAgICBjYXQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBm
L3tjb25maWcsY29uZmlnLnZtLGNvbmZpZy54ODZfNjR9ID4gLmNvbmZpZyAmJiBtYWtlIG9sZGRl
ZmNvbmZpZwo+Pj4KPj4+IElmIG5vdCwgd291bGQgeW91IG1pbmQgc2hhcmluZyB5b3VyIGRlZmNv
bmZpZyA/Cj4+IEF0dGFjaGVkLgo+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+IEFsZXhpcwo+Cj4KPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
