Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCo/BgQ23Wl9agkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:29:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CCA3F208C
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:29:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B845C57A52;
	Mon, 13 Apr 2026 18:29:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 074BBC57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 18:29:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 792FDC5B1AD;
 Mon, 13 Apr 2026 18:29:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C3B5B5FFB9;
 Mon, 13 Apr 2026 18:29:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 001941045055E; 
 Mon, 13 Apr 2026 20:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776104960; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nPa2ZZONaBOGLFMfEfBDzaDZgsD31jakJQraeqbgRCw=;
 b=Qm0jaSwT24/GdK/EsyzadjCMRmdSwzojdFiBoEhz9mF9mr7uXKqUeMuFzrXmwZ8OzPseYj
 rTiosoU1qw/9rhsO2QAeObwHnb3U0BdA/GKu2X7zqF4XwbXU+sdENJYYJMHV+epMpE+WAE
 5wXX4mFLdnQpzrapducllk94LpMksGi5QQSsfjn+ECbIMOEFADC7qab70hxaKQz0r/EyiW
 +qT+y9jj+fwS4YIkWHcExGPabkcLddCDpfG8oxYqSCHg5OjMFegpaJ+esDIoGjiCGVX++x
 o1cerD3IbFhwDzv5lAIPNVJ37KUVFvTRPwtdsH6wD3ffqjvZudD30QIMdhw1KQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Mon, 13 Apr 2026 20:28:46 +0200
MIME-Version: 1.0
Message-Id: <20260413-kasan-v1-6-1a5831230821@bootlin.com>
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
In-Reply-To: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, netdev@vger.kernel.org,
 ebpf@linuxfoundation.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, Xu Kuohai <xukuohai@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC bpf-next 6/8] selftests/bpf: do not run
 verifier JIT tests when BPF_JIT_KASAN is enabled
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:akpm@linux-foundation.org,m:linux-kselftest@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:netdev@vger.kernel.org,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:bpf@vger.kernel.org,m:xukuohai@huawei.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead
 .org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,linux.dev,gmail.com,davemloft.net,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com,google.com,arm.com,linux-foundation.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	NEURAL_HAM(-0.00)[-0.918];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C1CCA3F208C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

TXVsdGlwbGUgdmVyaWZpZXIgdGVzdHMgdmFsaWRhdGUgdGhlIGV4YWN0IGxpc3Qgb2YgSklUZWQg
aW5zdHJ1Y3Rpb25zLgpFdmVuIGlmIHRoZSB0ZXN0IG9mZmVycyBzb21lIGZsZXhpYmlsaXR5IGlu
IGl0cyBjaGVja3MgKGVnOiBub3QKZW5mb3JjaW5nIHRoZSBmaXJzdCBpbnN0cnVjdGlvbiB0byBi
ZSB2ZXJpZmllZCByaWdodCBhdCB0aGUgYmVnaW5uaW5nIG9mCmppdGVkIGNvZGUsIGJ1dCByYXRo
ZXIgc2VhcmNoaW5nIHdoZXJlIHRoZSBleHBlY3RlZCBKSVQgaW5zdHJ1Y3Rpb25zCmNvdWxkIGJl
IGxvY2F0ZWQpLCBpdCBpcyBjb25mdXNlZCBieSB0aGUgbmV3IEtBU0FOIGluc3RydW1lbnRhdGlv
biBKSVRlZAppbiBwcm9ncmFtczogdGhpcyBpbnN0cnVtZW50YXRpb24gY2FuIGJlIGluc2VydGVk
IGFueXdoZXJlIGluLWJldHdlZW4Kc2VhcmNoZWQgaW5zdHJ1Y3Rpb25zLCBsZWFkaW5nIHRvIHRl
c3QgZmFpbHVyZXMgZGVzcGl0ZSB0aGUgY29ycmVjdAppbnN0cnVjdGlvbnMgYmVpbmcgZ2VuZXJh
dGVkLgoKUHJldmVudCB0aG9zZSBmYWlsdXJlcyBieSBza2lwcGluZyB0ZXN0cyBpbnZvbHZpbmcg
SklUZWQgaW5zdHJ1Y3Rpb25zCmNoZWNrcyB3aGVuIGtlcm5lbCBpcyBidWlsdCB3aXRoIEtBU0FO
IF9hbmRfIEpJVCBpcyBlbmFibGVkLCBhcyB0aG9zZQp0d28gY29uZGl0aW9ucyBsZWFkIHRoZSBK
SVRlZCBjb2RlIHRvIGNvbnRhaW5zIEtBU0FOIGNoZWNrcy4KClNpZ25lZC1vZmYtYnk6IEFsZXhp
cyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3RfbG9hZGVyLmMgICAgfCA1ICsr
KysrCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdW5wcml2X2hlbHBlcnMuYyB8IDUgKysr
KysKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi91bnByaXZfaGVscGVycy5oIHwgMSArCiAz
IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9sb2FkZXIuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi90ZXN0X2xvYWRlci5jCmluZGV4IGM0YzM0Y2FlNjEwMi4uZDJjMDA2MmVmMzFhIDEwMDY0
NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9sb2FkZXIuYworKysgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9sb2FkZXIuYwpAQCAtMTE3NSw2ICsxMTc1
LDExIEBAIHZvaWQgcnVuX3N1YnRlc3Qoc3RydWN0IHRlc3RfbG9hZGVyICp0ZXN0ZXIsCiAJCXJl
dHVybjsKIAl9CiAKKwlpZiAoaXNfaml0X2VuYWJsZWQoKSAmJiBzdWJzcGVjLT5qaXRlZC5jbnQg
JiYgZ2V0X2thc2FuX2ppdF9lbmFibGVkKCkpIHsKKwkJdGVzdF9fc2tpcCgpOworCQlyZXR1cm47
CisJfQorCiAJaWYgKHVucHJpdikgewogCQlpZiAoIWNhbl9leGVjdXRlX3VucHJpdih0ZXN0ZXIs
IHNwZWMpKSB7CiAJCQl0ZXN0X19za2lwKCk7CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvdW5wcml2X2hlbHBlcnMuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Jw
Zi91bnByaXZfaGVscGVycy5jCmluZGV4IGY5OTdkN2VjOGZkMC4uMjViZDA4NjQ4ZjVmIDEwMDY0
NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdW5wcml2X2hlbHBlcnMuYworKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdW5wcml2X2hlbHBlcnMuYwpAQCAtMTQyLDMg
KzE0Miw4IEBAIGJvb2wgZ2V0X3VucHJpdl9kaXNhYmxlZCh2b2lkKQogCX0KIAlyZXR1cm4gbWl0
aWdhdGlvbnNfb2ZmOwogfQorCitib29sIGdldF9rYXNhbl9qaXRfZW5hYmxlZCh2b2lkKQorewor
CXJldHVybiBjb25maWdfY29udGFpbnMoIkNPTkZJR19CUEZfSklUX0tBU0FOPXkiKTsKK30KZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi91bnByaXZfaGVscGVycy5oIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3VucHJpdl9oZWxwZXJzLmgKaW5kZXggMTUxZjY3
MzI5NjY1Li5iYzVmNGM5NTNjOWQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi91bnByaXZfaGVscGVycy5oCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi91
bnByaXZfaGVscGVycy5oCkBAIC01LDMgKzUsNCBAQAogI2RlZmluZSBVTlBSSVZfU1lTQ1RMICJr
ZXJuZWwvdW5wcml2aWxlZ2VkX2JwZl9kaXNhYmxlZCIKIAogYm9vbCBnZXRfdW5wcml2X2Rpc2Fi
bGVkKHZvaWQpOworYm9vbCBnZXRfa2FzYW5faml0X2VuYWJsZWQodm9pZCk7CgotLSAKMi41My4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
