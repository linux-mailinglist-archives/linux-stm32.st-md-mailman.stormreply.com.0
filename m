Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NtgHd5vlmlqfQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 03:05:18 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FC015B779
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 03:05:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 090E0C8F275;
	Thu, 19 Feb 2026 02:05:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90A2BC8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 02:05:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9076D61855;
 Thu, 19 Feb 2026 02:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B13C19425;
 Thu, 19 Feb 2026 02:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771466715;
 bh=CJhzGH3sAa0J4fOkP0CpNIISd/xcJc3TRjy4YycFwTY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n74SW63m3g2vdXmFe3PM5znz6KRPmNRYMfgHOkvKjEl98qnQTDDxvmylU6XbUbAXg
 lUdFncUSLM1ksgLt6Odpy0PbmiQaHrtGuGmuh89xzmS9EORRxSz2MMKLf7ZmbxGGuc
 NloIThis473MS7v/DH5MkWbffUHpZNHXIJt4gVg6neLGGxKIhmPpYEBAdmfX9cb5Tv
 /mAD+Hx9iaJvTjlGHOtnbrHRxbiXJj+RU54z2Ih3MwFJ7QRGq0NXCN1YBN7XV6jA72
 kDGj6YPpYX5EfuWm7cHJDIahKfDHgHIeZkhjKffXO/9aa9wa5aozGF0UEn16vFabmX
 QfO3OysVSxRRg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Wed, 18 Feb 2026 21:04:16 -0500
Message-ID: <20260219020422.1539798-40-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219020422.1539798-1-sashal@kernel.org>
References: <20260219020422.1539798-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
Cc: Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 6.19-6.1] dmaengine: stm32-mdma:
	initialize m2m_hw_period and ccr to fix warnings
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,foss.st.com,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:sashal@kernel.org,m:clement.legoffic@foss.st.com,m:linux-kernel@vger.kernel.org,m:vkoul@kernel.org,m:legoffic.clement@gmail.com,m:mcoquelin.stm32@gmail.com,m:dmaengine@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.896];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 43FC015B779
X-Rspamd-Action: no action

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgYWFmM2JjMDI2NTc0NGFkYmMyZDM2NDk2NGVmNDA5Y2YxMThkMTkz
ZCBdCgptMm1faHdfcGVyaW9kIGlzIGluaXRpYWxpemVkIG9ubHkgd2hlbiBjaGFuX2NvbmZpZy0+
bTJtX2h3IGlzIHRydWUuIFRoaXMKdHJpZ2dlcnMgYSB3YXJuaW5nOgrigJhtMm1faHdfcGVyaW9k
4oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgWy1XbWF5YmUtdW5pbml0aWFsaXplZF0KQWx0
aG91Z2ggbTJtX2h3X3BlcmlvZCBpcyBvbmx5IHVzZWQgd2hlbiBjaGFuX2NvbmZpZy0+bTJtX2h3
IGlzIHRydWUgYW5kCmlnbm9yZWQgb3RoZXJ3aXNlLCBpbml0aWFsaXplIGl0IHVuY29uZGl0aW9u
YWxseSB0byAwLgoKY2NyIGlzIGluaXRpYWxpemVkIGJ5IHN0bTMyX21kbWFfc2V0X3hmZXJfcGFy
YW0oKSB3aGVuIHRoZSBzZyBsaXN0IGlzIG5vdAplbXB0eS4gVGhpcyB0cmlnZ2VycyBhIHdhcm5p
bmc6CuKAmGNjcuKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIFstV21heWJlLXVuaW5pdGlh
bGl6ZWRdCkluZGVlZCwgaXQgY291bGQgYmUgdXNlZCB1bmluaXRpYWxpemVkIGlmIHRoZSBzZyBs
aXN0IGlzIGVtcHR5LiBJbml0aWFsaXplCml0IHRvIDAuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+ClJldmlld2VkLWJ5OiBD
bMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRAZ21haWwuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5kZWxhdW5heUBmb3NzLnN0LmNvbT4KTGluazog
aHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjUxMjE3LW1kbWFfd2FybmluZ3NfZml4LXYyLTEt
MzQwMjAwZTBiYjU1QGZvc3Muc3QuY29tClNpZ25lZC1vZmYtYnk6IFZpbm9kIEtvdWwgPHZrb3Vs
QGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9y
Zz4KLS0tCgpMTE0gR2VuZXJhdGVkIGV4cGxhbmF0aW9ucywgbWF5IGJlIGNvbXBsZXRlbHkgYm9n
dXM6CgpJIGNhbiBzZWUgYHNnX2xlbmAgaXMgcGFzc2VkIGZyb20gdGhlIERNQSBmcmFtZXdvcmsn
cyBgcHJlcF9zbGF2ZV9zZ2AKY2FsbGJhY2suIFdoaWxlIHRoZSBETUEgZnJhbWV3b3JrIGdlbmVy
YWxseSBkb2Vzbid0IGNhbGwgdGhpcyB3aXRoCmBzZ19sZW4gPT0gMGAsIHRoZXJlJ3Mgbm8gZXhw
bGljaXQgZ3VhcmQgYWdhaW5zdCBpdCBpbiB0aGlzIGZ1bmN0aW9uLgpUaGUgYHN0bTMyX21kbWFf
YWxsb2NfZGVzY2Agd2l0aCBgc2dfbGVuID09IDBgIG1pZ2h0IHN1Y2NlZWQgKGFsbG9jYXRpbmcK
YSBkZXNjcmlwdG9yIHdpdGggMCBub2RlcyksIGFsbG93aW5nIGV4ZWN1dGlvbiB0byByZWFjaApg
c3RtMzJfbWRtYV9zZXR1cF94ZmVyYCB3aXRoIGFuIGVtcHR5IGxpc3QuCgojIyMgVmVyaWZpY2F0
aW9uCgotICoqUmVhZCB0aGUgYWN0dWFsIGNvZGUqKjogQ29uZmlybWVkIGBjY3JgIGlzIHVzZWQg
YXQgbGluZXMgNzc3LTc3OQogIGFmdGVyIHRoZSBmb3JfZWFjaF9zZyBsb29wLCBhbmQgaWYgYHNn
X2xlbiA9PSAwYCwgYGNjcmAgaXMgbmV2ZXIKICBpbml0aWFsaXplZCBieSBgc3RtMzJfbWRtYV9z
ZXRfeGZlcl9wYXJhbSgpYC4KLSAqKkNhbGxlciBhbmFseXNpcyoqOiBgc3RtMzJfbWRtYV9zZXR1
cF94ZmVyYCBpcyBjYWxsZWQgZnJvbQogIGBzdG0zMl9tZG1hX3ByZXBfc2xhdmVfc2dgIGF0IGxp
bmUgODA5IHdpdGggYHNnX2xlbmAgZnJvbSB0aGUgRE1BCiAgZnJhbWV3b3JrIC0gbm8gZXhwbGlj
aXQgZ3VhcmQgZm9yIGBzZ19sZW4gPT0gMGAuCi0gKiptMm1faHdfcGVyaW9kKio6IENvbmZpcm1l
ZCBhdCBsaW5lcyA3MzctNzM4IGFuZCA3NDktNzUwLzc1OC03NTkgdGhhdAogIGl0J3Mgb25seSB1
c2VkIHdoZW4gYGNoYW5fY29uZmlnLT5tMm1faHdgIGlzIHRydWUgKGZhbHNlIHBvc2l0aXZlCiAg
d2FybmluZykuCi0gKipSaXNrIGFzc2Vzc21lbnQqKjogVGhlIGNoYW5nZSBpcyBhIHRyaXZpYWwg
aW5pdGlhbGl6YXRpb24sIHplcm8KICByZWdyZXNzaW9uIHJpc2suCi0gKipDb3VsZCBOT1QgdmVy
aWZ5Kio6IFdoZXRoZXIgYW55IHJlYWwtd29ybGQgY29kZSBwYXRoIGFjdHVhbGx5IHBhc3Nlcwog
IGBzZ19sZW4gPT0gMGAgdG8gYHByZXBfc2xhdmVfc2dgICh1bnZlcmlmaWVkLCBidXQgZGVmZW5z
aXZlCiAgaW5pdGlhbGl6YXRpb24gaXMgY29ycmVjdCBwcmFjdGljZSkuCgojIyMgQ29uY2x1c2lv
bgoKVGhpcyBpcyBhIHZlcnkgbG93LXJpc2sgZml4IHRoYXQ6CjEuIFNpbGVuY2VzIGNvbXBpbGVy
IHdhcm5pbmdzICh1c2VmdWwgZm9yIGNsZWFuIGJ1aWxkcykKMi4gRml4ZXMgYSByZWFsIChpZiBw
b3RlbnRpYWxseSByYXJlKSB1bmluaXRpYWxpemVkIHZhcmlhYmxlIGJ1ZyBmb3IKICAgYGNjcmAK
ClRoZSBmaXggaXMgdHJpdmlhbGx5IGNvcnJlY3QsIG9uZSBsaW5lLCB6ZXJvIHJlZ3Jlc3Npb24g
cmlzaywgYW5kIGZpeGVzCmEgZ2VudWluZSBjb2RlIGNvcnJlY3RuZXNzIGlzc3VlLiBXaGlsZSBp
dCdzIGJvcmRlcmxpbmUgYmVjYXVzZSB0aGUKcHJpbWFyeSBmcmFtaW5nIGlzICJmaXggd2Fybmlu
Z3MiIGFuZCB0aGUgYWZmZWN0ZWQgZHJpdmVyIGlzClNUTTMyLXNwZWNpZmljLCB0aGUgYGNjcmAg
dW5pbml0aWFsaXplZCB2YXJpYWJsZSBpcyBhIHJlYWwgYnVnIHRoYXQKY291bGQgY2F1c2UgRE1B
IGhhcmR3YXJlIG1pc2NvbmZpZ3VyYXRpb24sIGFuZCB0aGUgZml4IGhhcyBhYnNvbHV0ZWx5IG5v
CmRvd25zaWRlLgoKKipZRVMqKgoKIGRyaXZlcnMvZG1hL3N0bTMyL3N0bTMyLW1kbWEuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZG1hL3N0bTMyL3N0bTMyLW1kbWEuYyBiL2RyaXZlcnMvZG1hL3N0bTMy
L3N0bTMyLW1kbWEuYwppbmRleCAwODBjMWM3MjUyMTZjLi5iODdkNDFiMjM0ZGYxIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2RtYS9zdG0zMi9zdG0zMi1tZG1hLmMKKysrIGIvZHJpdmVycy9kbWEvc3Rt
MzIvc3RtMzItbWRtYS5jCkBAIC03MzEsNyArNzMxLDcgQEAgc3RhdGljIGludCBzdG0zMl9tZG1h
X3NldHVwX3hmZXIoc3RydWN0IHN0bTMyX21kbWFfY2hhbiAqY2hhbiwKIAlzdHJ1Y3Qgc3RtMzJf
bWRtYV9jaGFuX2NvbmZpZyAqY2hhbl9jb25maWcgPSAmY2hhbi0+Y2hhbl9jb25maWc7CiAJc3Ry
dWN0IHNjYXR0ZXJsaXN0ICpzZzsKIAlkbWFfYWRkcl90IHNyY19hZGRyLCBkc3RfYWRkcjsKLQl1
MzIgbTJtX2h3X3BlcmlvZCwgY2NyLCBjdGNyLCBjdGJyOworCXUzMiBtMm1faHdfcGVyaW9kID0g
MCwgY2NyID0gMCwgY3RjciwgY3RicjsKIAlpbnQgaSwgcmV0ID0gMDsKIAogCWlmIChjaGFuX2Nv
bmZpZy0+bTJtX2h3KQotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
