Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DEAnD9ryImpsfgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 18:01:30 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1856498C1
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 18:01:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b="aKf/6ctG";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAE68C87ED6;
	Fri,  5 Jun 2026 16:01:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEB29C87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 16:01:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0E8124E40760;
 Fri,  5 Jun 2026 16:01:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C8EEB5FED1;
 Fri,  5 Jun 2026 16:01:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1167106A252C; 
 Fri,  5 Jun 2026 18:01:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1780675281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yZoPOqViDfS1ZaI7CjlclPfaVfp0hwRDdItmht55EEI=;
 b=aKf/6ctG9t/yPGcfoTJ9gphRxx+xRgto8JRT9kZ7mJy8y6Q4YabfcLOUTB/vsucB/M/VXK
 EZ3DvYEVjXFEBn/NYWNuDq3I+8cgFW9jPFXfEEpYSwsDyUNtbMMkqiP32pJ9PvrAwQtqz3
 8tVPEzvj9W0qcNj6AwEK8nHUc5aW0zl1zF6AoaEzpIQT8Ay0G+fFlsvYOYV0OsqS+Iix+o
 NktDJvpeDGZ+nZKWs6pK3jt45/PETYDs/FAWkyh6jKk80L1seulIdVo7X8hlsBr03q+Ocp
 CGFNfBZE8FwkjODbf6nZV/pOWKDjdaDD2OWADJ7IrnCXxG17zU1z5Rz6LpRWtg==
Mime-Version: 1.0
Date: Fri, 05 Jun 2026 18:01:16 +0200
Message-Id: <DJ18PD6QWGA2.2HOYGKU7RUB68@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Yonghong Song" <yonghong.song@linux.dev>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Jiri Olsa"
 <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Shuah Khan"
 <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-8-c066e627fda8@bootlin.com>
 <13b87293-5237-43d3-9f91-33c13041cb43@linux.dev>
In-Reply-To: <13b87293-5237-43d3-9f91-33c13041cb43@linux.dev>
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yonghong.song@linux.dev,m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[linux.dev,bootlin.com,kernel.org,iogearbox.net,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-stm32.st-md-mailman.stormreply.com:query timed out];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,bootlin.com:mid,bootlin.com:from_mime,bootlin.com:url,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F1856498C1

T24gRnJpIEp1biA1LCAyMDI2IGF0IDU6NDcgUE0gQ0VTVCwgWW9uZ2hvbmcgU29uZyB3cm90ZToK
ClsuLi5dCgo+IFtyb290QGFyY2gtZmItdm0xIGJwZl0jIC4vdGVzdF9wcm9ncyAtbiAxNjQKPiB0
ZXN0X2thc2FuOlBBU1M6YWxsb2MgdGVzdCBjdHggMCBuc2VjCj4gZ3pvcGVuIC9ib290L2NvbmZp
Zy03LjEuMC1yYzUtZ2VjODZjODE1NmJkNjogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+IHRl
c3Rfa2FzYW46UEFTUzpvcGVuIHByb2cgMCBuc2VjCj4gdGVzdF9rYXNhbjpQQVNTOmZpbmQgcm5k
X2hpMzIgcHJvZyAwIG5zZWMKPiAuLi4KPiBBbGwgZXJyb3IgbG9nczoKPiB0ZXN0X2thc2FuOlBB
U1M6YWxsb2MgdGVzdCBjdHggMCBuc2VjCj4gZ3pvcGVuIC9ib290L2NvbmZpZy03LjEuMC1yYzUt
Z2VjODZjODE1NmJkNjogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+IHRlc3Rfa2FzYW46UEFT
UzpvcGVuIHByb2cgMCBuc2VjCj4gdGVzdF9rYXNhbjpQQVNTOmZpbmQgcm5kX2hpMzIgcHJvZyAw
IG5zZWMKPiB0ZXN0X2thc2FuOlBBU1M6bG9hZCBwcm9nIDAgbnNlYwo+IHRlc3Rfa2FzYW46UEFT
UzpvcGVuIGtlcm5lbCBsb2dzIDAgbnNlYwo+IHRlc3Rfa2FzYW46UEFTUzpnZXQgbWFwIDAgbnNl
Ywo+IHRlc3Rfa2FzYW46UEFTUzpzZXQgbWFwIDAgbnNlYwo+IHJ1bl9zdWJ0ZXN0X3dpdGhfc2l6
ZV9hbmRfbG9jYXRpb246UEFTUzpmaW5kIHRlc3QgcHJvZyAwIG5zZWMKPiBydW5fc3VidGVzdF93
aXRoX3NpemVfYW5kX2xvY2F0aW9uOlBBU1M6ZmV0Y2ggbG9hZGVkIHByb2dyYW0gaW5mbyAwIG5z
ZWMKPiBydW5fc3VidGVzdF93aXRoX3NpemVfYW5kX2xvY2F0aW9uOlBBU1M6cnVuIHByb2cgMCBu
c2VjCj4gcnVuX3N1YnRlc3Rfd2l0aF9zaXplX2FuZF9sb2NhdGlvbjpQQVNTOnJlYWQga2VybmVs
IGxvZ3MgMCBuc2VjCj4gcnVuX3N1YnRlc3Rfd2l0aF9zaXplX2FuZF9sb2NhdGlvbjpGQUlMOnJl
cG9ydCBzaG91bGQgYmUgZ2VuZXJhdGVkIHVuZXhwZWN0ZWQgZXJyb3I6IDEgKGVycm5vIDExKQo+
ICMxNjQvMSAgIGthc2FuL3N0XzFfbm90X29uX3N0YWNrOkZBSUwKClsuLi5dCgo+ICMxNjQgICAg
IGthc2FuOkZBSUwKPgo+IEkgY2hlY2tlZCB0aGUgc3VidGVzdCAxNjQvMSwKPgo+IEZvcgo+Cj4g
ICAgICAgICAgcmV0ID0gY2hlY2tfa2FzYW5fcmVwb3J0X2luX2tlcm5lbF9sb2dzKGtsb2dfYnVm
ZmVyLCBjdHgsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHRlc3QtPmlzX3dyaXRlLCBhY2Nlc3Nfc2l6ZSk7Cj4gICAgICAgICAgaWYgKG9uX3N0YWNr
IHx8IHRlc3QtPmV4cGVjdF9ub19yZXBvcnQpCj4gICAgICAgICAgICAgICAgICBBU1NFUlRfTkVR
KHJldCwgMCwgIm5vIHJlcG9ydCBzaG91bGQgYmUgZ2VuZXJhdGVkIik7Cj4gICAgICAgICAgZWxz
ZQo+ICAgICAgICAgICAgICAgICAgQVNTRVJUX09LKHJldCwgInJlcG9ydCBzaG91bGQgYmUgZ2Vu
ZXJhdGVkIik7Cj4KPiB0aGUgcmV0IGlzIGVxdWFsIHRvIDEgYXMga2xvZ19idWZmZXIgaXMgZW1w
dHkuIFRoaXMgY2F1c2VkIHRoZSBmYWlsdXJlLgoKQXJlIHlvdSBzZWVpbmcgYW55IGthc2FuIHJl
cG9ydCB3aGVuIHlvdSBtYW51YWxseSBjaGVjayB5b3VyIGtlcm5lbApsb2dzLCBvciBub3QgYXQg
YWxsID8gSWYgbm90IGF0IGFsbCwgYXJlIHlvdSB1c2luZyB0aGUgIkNJIiBkZWZjb25maWcgPwoK
ICBjYXQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3tjb25maWcsY29uZmlnLnZtLGNvbmZp
Zy54ODZfNjR9ID4gLmNvbmZpZyAmJiBtYWtlIG9sZGRlZmNvbmZpZwoKSWYgbm90LCB3b3VsZCB5
b3UgbWluZCBzaGFyaW5nIHlvdXIgZGVmY29uZmlnID8KClRoYW5rcywKCkFsZXhpcwotLSAKQWxl
eGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
