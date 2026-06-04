Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vzraIYXeIWrZPwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 22:22:29 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE556433EB
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 22:22:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=GvDDw8u3;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C63ECC8F273;
	Thu,  4 Jun 2026 20:22:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89541C8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 20:22:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E835A1A0785;
 Thu,  4 Jun 2026 20:22:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A651F5FED1;
 Thu,  4 Jun 2026 20:22:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8E11106A19CA; 
 Thu,  4 Jun 2026 22:22:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1780604544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=wOljlMat6RAb/iGwhJiSN0/00+BKRzGXIX9CN4zoVrw=;
 b=GvDDw8u35k8xGEs3fqF3paacKHdP03w3PMEwyMaIVfGX75EedJ8YWBTHTKad7ujmELnH2j
 80H7knPMdmUaEK11JcRfoeBv+W1qgm2Wkgf8OkrEhwdUAq7AkM0q9GT/mDJXaL5v73eBd6
 JzxtWYB0/xdr5UA47rO6IbWcGp1smjMqQO47xFGChHMsy8VmHx0h43u0PiA0r0eJiW4bBl
 y/iGHkmjGLzOYIdeepjsDwpX3OcGVAhZWB4BcoOhm+B8Oyb/sQZXZHRdUhY98YlpalQKT5
 aWLmUYma0sCV9myA3ZuGLD7c6mo8UOijyvfT75GeEdsJBnTYDRrpeEjQGO4u4g==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Thu, 04 Jun 2026 22:21:58 +0200
Message-Id: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQ7CIBAFf6XZsxiWVmw8+R+mB6BgNyo0QJqah
 n+XEI+TeZl3QLKRbIJbd0C0GyUKvoI4dWAW5Z+W0VwZBBeSo5DspZLyzJlZjk4OZr5qqNs1Wkd
 76zxAr455u2eYqlko5RC/7WDD5ltrwP7f2pBxhuoy9ih6Pgq86xDym/zZhA9MpZQf6CODbqYAA
 AA=
X-Change-ID: 20260126-kasan-fcd68f64cd7b
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, Bastien Curutchet <bastien.curutchet@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf-next v2 0/8] bpf: add support for KASAN
 checks in JITed programs
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
X-Spamd-Result: default: False [5.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,linux.dev,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:alexis.lothore@bootlin.com,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BE556433EB

SGVsbG8sCnRoaXMgc2VyaWVzIGFpbXMgdG8gYnJpbmcgYmFzaWMgc3VwcG9ydCBmb3IgS0FTQU4g
Y2hlY2tzIHRvIEJQRiBKSVRlZApwcm9ncmFtcy4gVGhpcyB2MiBkcm9wcyB0aGUgUkZDIHByZWZp
eCBhbmQgYnJpbmdzIG1hbnkgdXBkYXRlcyByZWdhcmRpbmcKdGhlIHRvcGljcyBhbmQgaXNzdWVz
IG1lbnRpb25lZCBvbiB0aGUgUkZDIG9yIGF0IExTRk1NQlBGLiBUaGFua3MgdG8KSWhvcidzIHVw
ZGF0ZSBvbiBDSSwgdGhlIGluc3RydW1lbnRhdGlvbiBjYW4gbm93IHRyaWdnZXIgcHJvcGVybHkg
aW4gQ0kKYXMgd2VsbC4KCiJUcmFkaXRpb25hbCIgS0FTQU4gYWxsb3dzIHRvIHNwb3QgbWVtb3J5
IG1hbmFnZW1lbnQgbWlzdGFrZXMgYnkKcmVzZXJ2aW5nIGEgZnJhY3Rpb24gb2YgbWVtb3J5IGFz
ICJzaGFkb3cgbWVtb3J5IiB0aGF0IHdpbGwgbWFwIHRvIHRoZQpyZXN0IG9mIHRoZSBtZW1vcnkg
YW5kIGFsbG93IGl0cyBtb25pdG9yaW5nLiBFYWNoIG1lbW9yeS1hY2Nlc3NpbmcKaW5zdHJ1Y3Rp
b24gaXMgdGhlbiBpbnN0cnVtZW50ZWQgYXQgYnVpbGQgdGltZSB0byBjYWxsIHNvbWUgQVNBTiBj
aGVjawpmdW5jdGlvbiwgdGhhdCB3aWxsIGFuYWx5emUgdGhlIGNvcnJlc3BvbmRpbmcgYml0cyBp
biBzaGFkb3cgbWVtb3J5LCBhbmQKaWYgaXQgZGV0ZWN0cyB0aGUgYWNjZXNzIGFzIGludmFsaWQs
IHRyaWdnZXIgYSBkZXRhaWxlZCByZXBvcnQuIFRoZSBnb2FsCm9mIHRoaXMgc2VyaWVzIGlzIHRv
IHJlcGxpY2F0ZSB0aGlzIG1lY2hhbmlzbSBmb3IgQlBGIHByb2dyYW1zIHdoZW4gdGhleQphcmUg
YmVpbmcgSklUZWQgaW50byBuYXRpdmUgaW5zdHJ1Y3Rpb25zOiB0aGF0J3MgdGhlbiB0aGUgSklU
IGNvbXBpbGVyCnRoYXQgaXMgaW4gY2hhcmdlIG9mIGluc2VydGluZyBjYWxscyB0byB0aGUgY29y
cmVzcG9uZGluZyBrYXNhbiBjaGVja3MsCndoZW4gYSBwcm9ncmFtIGlzIGJlaW5nIGxvYWRlZCBp
bnRvIHRoZSBrZXJuZWwuIFRoaXMgdGFzayBpbnZvbHZlczoKLSBpZGVudGlmeWluZyBhdCBwcm9n
cmFtIGxvYWQgdGltZSB0aGUgaW5zdHJ1Y3Rpb25zIHBlcmZvcm1pbmcgbWVtb3J5CiAgYWNjZXNz
ZXMKLSBpZGVudGlmeWluZyB0aG9zZSBhY2Nlc3NlcyBwcm9wZXJ0aWVzIChzaXplID8gcmVhZCBv
ciB3cml0ZSA/KSB0bwogIGRlZmluZSB0aGUgcmVsZXZhbnQga2FzYW4gY2hlY2sgZnVuY3Rpb24g
dG8gY2FsbAotIGp1c3QgYmVmb3JlIHRoZSBpZGVudGlmaWVkIGluc3RydWN0aW9uczoKICAtIHBl
cmZvcm0gdGhlIGJhc2ljIGNvbnRleHQgc2F2aW5nIChpZTogc2F2aW5nIHJlZ2lzdGVycykKICAt
IGluc2VydGluZyBhIGNhbGwgdG8gdGhlIHJlbGV2YW50IGthc2FuIGNoZWNrIGZ1bmN0aW9uCiAg
LSByZXN0b3JlIGNvbnRleHQKLSB3aGVuZXZlciB0aGUgaW5zdHJ1bWVudGVkIHByb2dyYW0gZXhl
Y3V0ZXMsIGlmIGl0IHBlcmZvcm1zIGFuIGludmFsaWQKICBhY2Nlc3MsIGl0IHRyaWdnZXJzIGEg
a2FzYW4gcmVwb3J0IGlkZW50aWNhbCB0byB0aG9zZSBpbnN0cnVtZW50ZWQgb24KICBrZXJuZWwg
c2lkZSBhdCBidWlsZCB0aW1lLgoKQXMgZGlzY3Vzc2VkIGluIFsxXSwgdGhpcyBzZXJpZXMgaXMg
YmFzZWQgb24gc29tZSBjaG9pY2VzIGFuZAphc3N1bXB0aW9uczoKLSBpdCBmb2N1c2VzIG9uIHg4
Nl82NCBmb3Igbm93LCBhbmQgc28gb25seSBvbiBLQVNBTl9HRU5FUklDCi0gbm90IGFsbCBtZW1v
cnkgYWNjZXNzaW5nIEJQRiBpbnN0cnVjdGlvbnMgYXJlIGJlaW5nIGluc3RydW1lbnRlZDoKICAt
IGl0IGRpc2NhcmRzIGluc3RydWN0aW9ucyBhY2Nlc3NpbmcgQlBGIHByb2dyYW0gc3RhY2sgKGFs
cmVhZHkKICAgIG1vbml0b3JlZCBieSBwYWdlIGd1YXJkcykKICAtIGl0IGRpc2NhcmRzIHBvc3Np
Ymx5IGZhdWx0aW5nIGluc3RydWN0aW9ucywgbGlrZSBCUEZfUFJPQkVfTUVNIG9yCiAgICBCUEZf
UFJPQkVfQVRPTUlDIGluc25zCgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBkZWNsYXJlIGFzYW4gZnVu
Y3Rpb25zIGFzIGV4dGVybiBpbiBKSVQgY29tcGlsZXIgcmF0aGVyIHRoYW4gZXhwb3NpbmcKICB0
aGVtIGluIGthc2FuIGhlYWRlcgotIGludmVydCBzdGFjay1hY2Nlc3NpbmcgaW5zdHJ1Y3Rpb25z
IG1hcmtpbmcgdG8gbWFrZSBzdXJlIG5vdCB0byBza2lwCiAgaW5zdHJ1Y3Rpb25zIHRoYXQgY291
bGQgZW5kIHVwIGFjY2Vzc2luZyB0by1iZS1jaGVja2VkIG1lbW9yeQotIGZpeCBzdGFjayBhY2Nl
c3NlcyBtYXJraW5nIHdoZW4gdmVyaWZpZXIgcGF0Y2hlcyBpbnN0cnVjdGlvbnMKLSBhZGQgYmVz
dCBlZmZvcnQgbWFya2luZyBmb3IgY0JQRgotIGFkZCBtaXNzaW5nIGNhbGwgZGVwdGggYWNjb3Vu
dGluZyBpbiBqaXRlZCBpbnN0cnVtZW50YXRpb24KLSBza2lwIHVudXNlZCByZWdpc3RlcnMgaW4g
a2FzYW4gaW5zdHJ1bWVudGF0aW9uIHNhdmUvcmVzdG9yZQotIHJlbW92ZSBmYXVsdHkgc3RhY2sg
YWxpZ24gaW4ga2FzYW4gaW5zdHJ1bWVudGF0aW9uCi0gZHJvcCBjb21taXQgc2tpcHBpbmcgc29t
ZSBqaXQtcmVsYXRlZCB0ZXN0cwotIGNvdmVyIG1pc3NpbmcgaW5zdHJ1Y3Rpb25zOiBCUEZfU1Qg
YW5kIGF0b21pY3MKLSBjb21wbGV0ZWx5IHJld29yayB0ZXN0czogZGlyZWN0bHkgdHVuZSBzaGFk
b3cgbWVtb3J5LCBpbmNyZWFzZQogIGNvdmVyYWdlLCBkbyBub3QgY29uc3VtZSBrZXJuZWwgbG9n
cwotIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDQxMy1rYXNhbi12
MS0wLTFhNTgzMTIzMDgyMUBib290bGluLmNvbQoKVG86IEFsZXhlaSBTdGFyb3ZvaXRvdiA8YXN0
QGtlcm5lbC5vcmc+ClRvOiBEYW5pZWwgQm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0PgpU
bzogQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWlAa2VybmVsLm9yZz4KVG86IE1hcnRpbiBLYUZhaSBM
YXUgPG1hcnRpbi5sYXVAbGludXguZGV2PgpUbzogRWR1YXJkIFppbmdlcm1hbiA8ZWRkeXo4N0Bn
bWFpbC5jb20+ClRvOiBLdW1hciBLYXJ0aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWlsLmNvbT4K
VG86IFNvbmcgTGl1IDxzb25nQGtlcm5lbC5vcmc+ClRvOiBZb25naG9uZyBTb25nIDx5b25naG9u
Zy5zb25nQGxpbnV4LmRldj4KVG86IEppcmkgT2xzYSA8am9sc2FAa2VybmVsLm9yZz4KVG86IEpv
aG4gRmFzdGFiZW5kIDxqb2huLmZhc3RhYmVuZEBnbWFpbC5jb20+ClRvOiBUaG9tYXMgR2xlaXhu
ZXIgPHRnbHhAa2VybmVsLm9yZz4KVG86IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgpU
bzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+ClRvOiBEYXZlIEhhbnNlbiA8ZGF2ZS5o
YW5zZW5AbGludXguaW50ZWwuY29tPgpUbzogeDg2QGtlcm5lbC5vcmcKVG86ICJILiBQZXRlciBB
bnZpbiIgPGhwYUB6eXRvci5jb20+ClRvOiBTaHVhaCBLaGFuIDxzaHVhaEBrZXJuZWwub3JnPgpU
bzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgpUbzogQWxleGFu
ZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KVG86IElob3IgU29sb2Ry
YWkgPGlob3Iuc29sb2RyYWlAbGludXguZGV2PgpDYzogZWJwZkBsaW51eGZvdW5kYXRpb24ub3Jn
CkNjOiBCYXN0aWVuIEN1cnV0Y2hldCA8YmFzdGllbi5jdXJ1dGNoZXRAYm9vdGxpbi5jb20+CkNj
OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgpDYzogYnBm
QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
dXgta3NlbGZ0ZXN0QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
CgotLS0KQWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pICg4KToKICAgICAgYnBmOiBt
YXJrIGluc3RydWN0aW9ucyBhY2Nlc3NpbmcgcHJvZ3JhbSBzdGFjawogICAgICBicGY6IGFkZCBC
UEZfSklUX0tBU0FOIGZvciBLQVNBTiBpbnN0cnVtZW50YXRpb24gb2YgSklUZWQgcHJvZ3JhbXMK
ICAgICAgYnBmLCB4ODY6IGFkZCBoZWxwZXIgdG8gZW1pdCBrYXNhbiBjaGVja3MgaW4geDg2IEpJ
VGVkIHByb2dyYW1zCiAgICAgIGJwZiwgeDg2OiByZWZhY3RvciBCUEZfU1QgbWFuYWdlbWVudCBp
biBkb19qaXQKICAgICAgYnBmLCB4ODY6IGVtaXQgS0FTQU4gY2hlY2tzIGludG8geDg2IEpJVGVk
IHByb2dyYW1zCiAgICAgIGJwZiwgeDg2OiBlbmFibGUgS0FTQU4gZm9yIEpJVGVkIHByb2dyYW1z
IG9uIHg4NgogICAgICBzZWxmdGVzdHMvYnBmOiBhZGQgaGVscGVyIHRvIGNoZWNrIHdoZXRoZXIg
ZUJQRiBLQVNBTiBpcyBhY3RpdmUKICAgICAgc2VsZnRlc3RzL2JwZjogYWRkIHRlc3RzIHRvIHZh
bGlkYXRlIEtBU0FOIG9uIEpJVCBwcm9ncmFtcwoKIGFyY2gveDg2L0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gveDg2L25ldC9icGZfaml0X2Nv
bXAuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMjA5ICsrKysrKysrKy0tCiBpbmNsdWRlL2xp
bnV4L2JwZi5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiBpbmNsdWRl
L2xpbnV4L2JwZl92ZXJpZmllci5oICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiBrZXJu
ZWwvYnBmL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArCiBr
ZXJuZWwvYnBmL2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNyAr
CiBrZXJuZWwvYnBmL2ZpeHVwcy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
NiArLQoga2VybmVsL2JwZi92ZXJpZmllci5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDkgKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dfdGVzdHMva2FzYW4uYyAg
ICAgfCAzNTYgKysrKysrKysrKysrKysrKysrKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBm
L3Byb2dzL2thc2FuLmMgICAgICAgICAgfCAzODIgKysrKysrKysrKysrKysrKysrKysrCiAuLi4v
dGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3Rfa21vZHMvYnBmX3Rlc3Rtb2QuYyB8ICAyMiArKwog
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3VucHJpdl9oZWxwZXJzLmMgICAgICAgfCAgIDUg
KwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3VucHJpdl9oZWxwZXJzLmggICAgICAgfCAg
IDEgKwogMTMgZmlsZXMgY2hhbmdlZCwgOTk0IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygt
KQotLS0KYmFzZS1jb21taXQ6IGIxYzg1ZWU3MWUyYWI5ZWQ3YTEyZDdmM2VlMzg5ODg1MDliYWEz
NjgKY2hhbmdlLWlkOiAyMDI2MDEyNi1rYXNhbi1mY2Q2OGY2NGNkN2IKCkJlc3QgcmVnYXJkcywK
LS0gIApBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3JlQGJv
b3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
