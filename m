Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBiXG6OG72lPCAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 346274759E1
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDADCC5A4DB;
	Mon, 27 Apr 2026 15:54:09 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C76C4C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2026 12:49:35 +0000 (UTC)
Received: from [127.0.1.1] (unknown [52.179.129.152])
 by linux.microsoft.com (Postfix) with ESMTPSA id DF16820B6F01;
 Wed, 22 Apr 2026 05:49:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DF16820B6F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1776862175;
 bh=p44cSbI9ojfU2tdH6qP4ry3HyO5ReEpQUeVPNbJdJzY=;
 h=From:Date:Subject:To:Cc:From;
 b=O3RM0N6EpJIHq08SQ89lMIFxMPMjNDBI+f5c6Upxdy5vjkd0JUY8+gHshTG9sw3GV
 nTCQROVqANQjZjmOjXZCGycVTFWArh78AM+/b39x8fhF8Ig8wv3QmT2WiLZLsbnaos
 Iuhfiairepl9YVg5XV7Zn3ojwiaWblA/XIhezySA=
From: jeffbarnes@linux.microsoft.com
Date: Wed, 22 Apr 2026 08:49:30 -0400
MIME-Version: 1.0
Message-Id: <20260422-disallow_rsa_sha1_signing_in_fips_mode-v1-1-1359bc7d41be@microsoft.com>
X-B4-Tracking: v=1; b=H4sIANnD6GkC/x3N0QrCMAxA0V8ZebawhTnUXxEJmU27wExHAyqM/
 bvFx/Ny7w4uVcXh1u1Q5a2uxRqGUwfPhS1L0NgM2OPUj4ghqvO6lg9VZ/KFB3LNppZJjZJuTq8
 SJVzSPE+IV47nEVpsq5L0+x/dH8fxA5f263x4AAAA
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Spam-Status: No, score=-3.0 required=1.7 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU autolearn=ham autolearn_force=no
 version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
Cc: Jeff Barnes <jeffbarnes@linux.microsoft.com>,
 Jeff Barnes <jeffbarnes@microsoft.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] crypto: testmgr - disallow RSA PKCS#1 SHA-1
 sig algs in FIPS mode
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
X-Rspamd-Queue-Id: 346274759E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[123];
	R_DKIM_REJECT(1.00)[linux.microsoft.com:s=default];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.microsoft.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,gmail.com,foss.st.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jeffbarnes@linux.microsoft.com,m:jeffbarnes@microsoft.com,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[jeffbarnes@linux.microsoft.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeffbarnes@linux.microsoft.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[linux.microsoft.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.460];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

RnJvbTogSmVmZiBCYXJuZXMgPGplZmZiYXJuZXNAbWljcm9zb2Z0LmNvbT4KCldoZW4gYm9vdGVk
IHdpdGggZmlwcz0xLCBSU0Egc2lnbmF0dXJlIGdlbmVyYXRpb24gdXNpbmcgU0hBLTEgbXVzdCBu
b3QgYmUKYXZhaWxhYmxlLiAgSG93ZXZlciwgcGtjczFwYWQocnNhLHNoYTEpIGNhbiBjdXJyZW50
bHkgYmUgaW5zdGFudGlhdGVkCmJlY2F1c2UgaXQgaXMgbm90IHByZXNlbnQgaW4gYWxnX3Rlc3Rf
ZGVzY3M7IGFsZ190ZXN0KCkgZmFsbHMgdGhyb3VnaCB0aGUKbm9fdGVzdCBwYXRoIGFuZCBzdWNj
ZWVkcywgYWZ0ZXIgd2hpY2ggdGhlIGFsZ29yaXRobSBhcHBlYXJzIGluIC9wcm9jL2NyeXB0bwph
cyBmaXBzLWNhcGFibGUuIOOAkDEtZWJkOWRm44CRCgpBZGQgZXhwbGljaXQgYWxnX3Rlc3RfZGVz
Y3MgZW50cmllcyBmb3IgcGtjczFwYWQocnNhLHNoYTEpIGFuZCBwa2NzMShyc2Esc2hhMSkKd2l0
aG91dCBtYXJraW5nIHRoZW0gZmlwc19hbGxvd2VkLCBzbyB0aGV5IGFyZSB0cmVhdGVkIGFzIG5v
dCBGSVBTLWFsbG93ZWQKd2hlbiBmaXBzPTEgaXMgZW5hYmxlZC4KCkluY2x1ZGUgYm90aCBuYW1l
cyB0byBjb3ZlciBrZXJuZWxzIHdoZXJlIFJTQSBzaWduL3ZlcmlmeSBpcyBwcm92aWRlZCB2aWEK
dGhlIHBrY3MxKC4uLikgc2lnbmF0dXJlIHRlbXBsYXRlLCB3aGlsZSBwa2NzMXBhZCguLi4pIHJl
bWFpbnMgZm9yIHRoZQp0cmFkaXRpb25hbCB3cmFwcGVyIG5hbWluZyBhbmQvb3IgUlNBRVMgb3Bl
cmF0aW9ucy4g44CQMi0xN2NjMTTjgJEKClNpZ25lZC1vZmYtYnk6IEplZmYgQmFybmVzIDxqZWZm
YmFybmVzQGxpbnV4Lm1pY3Jvc29mdC5jb20+Ci0tLQpUaGlzIHNlcmllcyBmaXhlcyBhbiBpc3N1
ZSB3aGVyZSBTSEEtMSBSU0Egc2lnbmF0dXJlIGdlbmVyYXRpb24gcmVtYWlucwphdmFpbGFibGUg
d2hlbiBib290ZWQgd2l0aCBmaXBzPTEuCgpPbiBhIEZJUFMtZW5hYmxlZCBzeXN0ZW0sIHBrY3Mx
cGFkKHJzYSxzaGExKSBjYW4gYmUgaW5zdGFudGlhdGVkIGV2ZW4KdGhvdWdoIFNIQS0xIG11c3Qg
bm90IGJlIGF2YWlsYWJsZSBmb3Igc2lnbmF0dXJlIGdlbmVyYXRpb24uIFRoZSByZWFzb24KaXMg
dGhhdCB0aGUgYWxnb3JpdGhtIGlzIG5vdCBsaXN0ZWQgaW4gY3J5cHRvL3Rlc3RtZ3IuYydzIGFs
Z190ZXN0X2Rlc2NzLApzbyBhbGdfdGVzdCgpIGZhbGxzIHRocm91Z2ggdGhlIG5vX3Rlc3QgcGF0
aCBhbmQgc3VjY2VlZHMuIE9uY2UKaW5zdGFudGlhdGVkLCAvcHJvYy9jcnlwdG8gcmVwb3J0cyB0
aGUgYWxnb3JpdGhtIGFzICJmaXBzOiB5ZXMiLgoKVGhpcyBwYXRjaCBhZGRzIGV4cGxpY2l0IGFs
Z190ZXN0X2Rlc2NzIGVudHJpZXMgZm9yOgoKICAtIHBrY3MxcGFkKHJzYSxzaGExKQogIC0gcGtj
czEocnNhLHNoYTEpCgp3aXRob3V0IHNldHRpbmcgZmlwcz0xLCBzbyB0aGV5IGFyZSB0cmVhdGVk
IGFzIG5vdCBGSVBTLWFsbG93ZWQgaW4KRklQUyBtb2RlLgoKQm90aCBuYW1lcyBhcmUgY292ZXJl
ZCB0byBoYW5kbGUga2VybmVscyB3aGVyZSBSU0Egc2lnbmF0dXJlIG9wZXJhdGlvbnMKYXJlIHBy
b3ZpZGVkIHZpYSB0aGUgcGtjczEoLi4uKSBzaWduYXR1cmUgdGVtcGxhdGUsIHdoaWxlIHBrY3Mx
cGFkKC4uLikKcmVtYWlucyBmb3IgdGhlIGhpc3RvcmljYWwgd3JhcHBlciBuYW1pbmcgYW5kL29y
IFJTQUVTIG9wZXJhdGlvbnMuCgpSZXByb2R1Y2VyIC8gZXZpZGVuY2UgKGN1cnJlbnQgYmVoYXZp
b3IpOgogIDEpIEJvb3Qgd2l0aCBmaXBzPTEgKGNvbmZpcm0gL3Byb2Mvc3lzL2NyeXB0by9maXBz
X2VuYWJsZWQgPT0gMSkKICAyKSBBbGxvY2F0ZSB0aGUgdHJhbnNmb3JtOgogICAgICAgY3J5cHRv
X2FsbG9jX2FrY2lwaGVyKCJwa2NzMXBhZChyc2Esc2hhMSkiLCAwLCAwKQogIDMpIE9ic2VydmUg
dGhhdCAvcHJvYy9jcnlwdG8gbm93IGNvbnRhaW5zOgogICAgICAgbmFtZSAgIDogcGtjczFwYWQo
cnNhLHNoYTEpCiAgICAgICBmaXBzICAgOiB5ZXMKICAgICAgIHNlbGZ0ZXN0OiBwYXNzZWQKICA0
KSBBIHNpbXBsZSBpbi1rZXJuZWwgZGVtbyBtb2R1bGUgY2FuIGluc3RhbnRpYXRlIHRoZSB0cmFu
c2Zvcm0gYW5kIHJlYWNoCiAgICAgdGhlIHNpZ25pbmcgcGF0aCBpbiBGSVBTIG1vZGUuCgpXaXRo
IHRoaXMgY2hhbmdlLCBhdHRlbXB0cyB0byBpbnN0YW50aWF0ZSB0aGVzZSBTSEEtMSBSU0Egc2ln
bmluZwp0ZW1wbGF0ZXMgaW4gRklQUyBtb2RlIGFyZSByZWplY3RlZCwgcHJldmVudGluZyBTSEEt
MSBzaWduYXR1cmUKZ2VuZXJhdGlvbiBpbiBhcHByb3ZlZCBtb2RlLgoKVGhhbmtzIGZvciB0YWtp
bmcgYSBsb29rLgoKU2lnbmVkLW9mZi1ieTogSmVmZiBCYXJuZXMgPGplZmZiYXJuZXNAbWljcm9z
b2Z0LmNvbT4KLS0tCiBjcnlwdG8vdGVzdG1nci5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9jcnlwdG8vdGVzdG1nci5jIGIvY3J5cHRv
L3Rlc3RtZ3IuYwppbmRleCAzMDY3MWU3YmMzNDkuLmU1NGQyOThhMjZjMSAxMDA2NDQKLS0tIGEv
Y3J5cHRvL3Rlc3RtZ3IuYworKysgYi9jcnlwdG8vdGVzdG1nci5jCkBAIC01MzA2LDYgKzUzMDYs
OSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFsZ190ZXN0X2Rlc2MgYWxnX3Rlc3RfZGVzY3NbXSA9
IHsKIAkJLnN1aXRlID0gewogCQkJLnNpZyA9IF9fVkVDUyhwa2NzMV9yc2Ffbm9uZV90dl90ZW1w
bGF0ZSkKIAkJfQorCX0sIHsKKwkJLmFsZyA9ICJwa2NzMShyc2Esc2hhMSkiLAorCQkudGVzdCA9
IGFsZ190ZXN0X251bGwsCiAJfSwgewogCQkuYWxnID0gInBrY3MxKHJzYSxzaGEyMjQpIiwKIAkJ
LnRlc3QgPSBhbGdfdGVzdF9udWxsLApAQCAtNTM0MSw2ICs1MzQ0LDkgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBhbGdfdGVzdF9kZXNjIGFsZ190ZXN0X2Rlc2NzW10gPSB7CiAJCS5hbGcgPSAicGtj
czFwYWQocnNhKSIsCiAJCS50ZXN0ID0gYWxnX3Rlc3RfbnVsbCwKIAkJLmZpcHNfYWxsb3dlZCA9
IDEsCisJfSwgeworCQkuYWxnID0gInBrY3MxcGFkKHJzYSxzaGExKSIsCisJCS50ZXN0ID0gYWxn
X3Rlc3RfbnVsbCwKIAl9LCB7CiAJCS5hbGcgPSAicmZjMzY4NihjdHIoYWVzKSkiLAogCQkuZ2Vu
ZXJpY19kcml2ZXIgPSAicmZjMzY4NihjdHIoYWVzLWxpYikpIiwKCi0tLQpiYXNlLWNvbW1pdDog
ODg3OWEzYzExMGNiOGNhNWE2OWM5Mzc2NDNmMjI2Njk3YWE1NTFkOQpjaGFuZ2UtaWQ6IDIwMjYw
NDIyLWRpc2FsbG93X3JzYV9zaGExX3NpZ25pbmdfaW5fZmlwc19tb2RlLThmYmI2MjI5YWQ1NAoK
QmVzdCByZWdhcmRzLAotLSAKSmVmZiBCYXJuZXMgPGplZmZiYXJuZXNAbWljcm9zb2Z0LmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
