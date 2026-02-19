Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EhgN9hvlmlqfQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 03:05:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 743BF15B76B
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 03:05:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC322C8F275;
	Thu, 19 Feb 2026 02:05:11 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A3ABC8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 02:05:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 078C844164;
 Thu, 19 Feb 2026 02:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E80C19425;
 Thu, 19 Feb 2026 02:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771466708;
 bh=frX33pev+XR4l6oz6+xiDXC5X50uJZtofsvGkHEY7RA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wil0D8ZPPDa/S/GwFA0Vt8A7F+18QXRUJX7g1qSxJ8KtCPtQnuacBrPrFwKlrGyHu
 JgVpr2O1y77ZO47EzS29aj4W38oN2jH+LqivTGB+V1QW6LnJbMcg4cpYPpCLK8b0Qe
 QUuGrLtVyW8ddNVjP4YWaCEz4jI+6kdKiDb6q6oHqWbEMSQywfwantQ4JP0fVJWEZH
 +tAlhiet9F/1S5iA0V5yO3wyQFOz3PutsJ8hoBLcNF0s0pM32Juu7vBJYZzh4tx1Ni
 x+JXQeLhdbCbdjVheDdGiYc87WyL20aa84aIxKCDefJhnpS2Cp58vQRTHIjbTg3Pgl
 sxH+9dvSEM9hw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Wed, 18 Feb 2026 21:04:11 -0500
Message-ID: <20260219020422.1539798-35-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219020422.1539798-1-sashal@kernel.org>
References: <20260219020422.1539798-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 6.19-6.12] dmaengine: stm32-dma3: use
	module_platform_driver
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linaro.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:sashal@kernel.org,m:linux-kernel@vger.kernel.org,m:vkoul@kernel.org,m:eugen.hristev@linaro.org,m:mcoquelin.stm32@gmail.com,m:dmaengine@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[sashal@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.897];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 743BF15B76B
X-Rspamd-Action: no action

RnJvbTogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAZm9zcy5zdC5jb20+CgpbIFVw
c3RyZWFtIGNvbW1pdCAwZDQxZWQ0ZWE0OTZmYWJiYjRkYzIxMTcxZTMyZDlhOTI0YzJhNjYxIF0K
CldpdGhvdXQgbW9kdWxlX3BsYXRmb3JtX2RyaXZlcigpLCBzdG0zMi1kbWEzIGRvZXNuJ3QgaGF2
ZSBhCm1vZHVsZV9leGl0IHByb2NlZHVyZS4gT25jZSBzdG0zMi1kbWEzIG1vZHVsZSBpcyBpbnNl
cnRlZCwgaXQKY2FuJ3QgYmUgcmVtb3ZlZCwgbWFya2VkIGJ1c3kuClVzZSBtb2R1bGVfcGxhdGZv
cm1fZHJpdmVyKCkgaW5zdGVhZCBvZiBzdWJzeXNfaW5pdGNhbGwoKSB0byByZWdpc3RlcgooaW5z
bW9kKSBhbmQgdW5yZWdpc3RlciAocm1tb2QpIHN0bTMyLWRtYTMgZHJpdmVyLgoKUmV2aWV3ZWQt
Ynk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1i
eTogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAZm9zcy5zdC5jb20+Ckxpbms6IGh0
dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI1MTEyMS1kbWEzX2ltcHJvdi12Mi0xLTc2YTIwN2Ix
M2VhNkBmb3NzLnN0LmNvbQpTaWduZWQtb2ZmLWJ5OiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwu
b3JnPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQoK
TExNIEdlbmVyYXRlZCBleHBsYW5hdGlvbnMsIG1heSBiZSBjb21wbGV0ZWx5IGJvZ3VzOgoKSW50
ZXJlc3RpbmcgLSBhbGwgdGhyZWUgU1RNMzIgRE1BIGRyaXZlcnMgdXNlIGBzdWJzeXNfaW5pdGNh
bGwoKWAuIFRoZQpvdGhlciB0d28gKHN0bTMyLWRtYSBhbmQgc3RtMzItbWRtYSkgYWxzbyBsYWNr
IG1vZHVsZV9leGl0LiBUaGlzIGNvbW1pdApvbmx5IGNoYW5nZXMgc3RtMzItZG1hMy4KCiMjIEFu
YWx5c2lzIFN1bW1hcnkKCiMjIyBXaGF0IHRoZSBjb21taXQgZml4ZXMKVGhlIHN0bTMyLWRtYTMg
ZHJpdmVyIHJlZ2lzdGVycyB1c2luZyBgc3Vic3lzX2luaXRjYWxsKClgIGJ1dCBoYXMgbm8KYG1v
ZHVsZV9leGl0KClgIGZ1bmN0aW9uLiBUaGlzIG1lYW5zIHRoZSBtb2R1bGUgY2FuIGJlIGxvYWRl
ZCAoYGluc21vZGApCmJ1dCBuZXZlciB1bmxvYWRlZCAoYHJtbW9kYCksIGFzIHRoZSBrZXJuZWwg
bWFya3MgaXQgYXMgYnVzeSBkdWUgdG8KaGF2aW5nIG5vIGV4aXQvY2xlYW51cCBwYXRoLgoKIyMj
IENoYW5nZSBpbXBsaWNhdGlvbnMKVGhlIGZpeCByZXBsYWNlcyBgc3Vic3lzX2luaXRjYWxsKClg
IChwcmlvcml0eSBsZXZlbCA0KSB3aXRoCmBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKClgIHdoaWNo
IHVzZXMgYG1vZHVsZV9pbml0KClgIC8KYGRldmljZV9pbml0Y2FsbCgpYCAocHJpb3JpdHkgbGV2
ZWwgNikuIFRoaXMgaXMgYSAqKmJlaGF2aW9yYWwgY2hhbmdlKioKLSB0aGUgZHJpdmVyIHdpbGwg
bm93OgoxLiBJbml0aWFsaXplIGxhdGVyIGluIHRoZSBib290IHNlcXVlbmNlIChkZXZpY2VfaW5p
dGNhbGwgaW5zdGVhZCBvZgogICBzdWJzeXNfaW5pdGNhbGwpCjIuIEJlIHVubG9hZGFibGUgdmlh
IHJtbW9kCgojIyMgUmlzayBBc3Nlc3NtZW50Ci0gKipQb3NpdGl2ZSoqOiBGaXhlcyBpbmFiaWxp
dHkgdG8gdW5sb2FkIHRoZSBtb2R1bGUgLSB0aGlzIGlzIGEgZ2VudWluZQogIGJ1ZyBmaXgKLSAq
KlJpc2sqKjogVGhlIGluaXQgbGV2ZWwgY2hhbmdlIGZyb20gYHN1YnN5c19pbml0Y2FsbGAgKGxl
dmVsIDQpIHRvCiAgYGRldmljZV9pbml0Y2FsbGAgKGxldmVsIDYpIGNvdWxkIGNhdXNlIHByb2Jl
IG9yZGVyaW5nIGlzc3Vlcy4gRE1BCiAgY29udHJvbGxlcnMgYXJlIG9mdGVuIG5lZWRlZCBlYXJs
eSBieSBvdGhlciBzdWJzeXN0ZW1zLiBIb3dldmVyLCB3aXRoCiAgZGV2aWNlIHRyZWUgYW5kIGRl
ZmVycmVkIHByb2JpbmcgaW4gbW9kZXJuIGtlcm5lbHMsIHRoaXMgc2hvdWxkIGJlCiAgaGFuZGxl
ZC4gVGhlIGZhY3QgdGhhdCA1NCBvdGhlciBETUEgZHJpdmVycyB1c2UKICBgbW9kdWxlX3BsYXRm
b3JtX2RyaXZlcigpYCBzdWNjZXNzZnVsbHkgc3VwcG9ydHMgdGhpcy4KLSAqKlNjb3BlKio6IFZl
cnkgc21hbGwgY2hhbmdlIC0gcmVtb3ZlcyA2IGxpbmVzLCBhZGRzIDEgbGluZS4gU2luZ2xlCiAg
ZmlsZSwgc2luZ2xlIGRyaXZlci4KLSAqKkFmZmVjdGVkIHN0YWJsZSB0cmVlcyoqOiBPbmx5IDYu
MTErIChkcml2ZXIgaW50cm9kdWNlZCBpbgogIHY2LjExLXJjMSksIHNvIHRoaXMgd291bGQgYXBw
bHkgdG8gdjYuMTIueSBhbmQgdjYuMTMueSBzdGFibGUgdHJlZXMuCgojIyMgU3RhYmxlIGNyaXRl
cmlhIGFzc2Vzc21lbnQKLSAqKkZpeGVzIGEgcmVhbCBidWcqKjogWWVzIC0gbW9kdWxlIGNhbm5v
dCBiZSB1bmxvYWRlZAotICoqT2J2aW91c2x5IGNvcnJlY3QqKjogTW9zdGx5LiBUaGUgYG1vZHVs
ZV9wbGF0Zm9ybV9kcml2ZXIoKWAgbWFjcm8gaXMKICB0aGUgc3RhbmRhcmQgcGF0dGVybiB1c2Vk
IGJ5IHRoZSBtYWpvcml0eSBvZiBETUEgZHJpdmVycy4gSG93ZXZlciwgdGhlCiAgaW5pdCBsZXZl
bCBjaGFuZ2UgYWRkcyBhIHNtYWxsIHJpc2suCi0gKipTbWFsbCBhbmQgY29udGFpbmVkKio6IFll
cyAtIDcgbGluZXMgY2hhbmdlZCBpbiBvbmUgZmlsZQotICoqTm8gbmV3IGZlYXR1cmVzKio6IFRo
ZSBhYmlsaXR5IHRvIHVubG9hZCBhIG1vZHVsZSBpcyByZXN0b3JpbmcKICBleHBlY3RlZCBiZWhh
dmlvciwgbm90IGEgbmV3IGZlYXR1cmUKLSAqKlRlc3RlZCoqOiBIYXMgYSBSZXZpZXdlZC1ieSB0
YWcgZnJvbSBFdWdlbiBIcmlzdGV2CgojIyMgQ29uY2VybnMKMS4gVGhlIGluaXRpYWxpemF0aW9u
IG9yZGVyIGNoYW5nZSAoYHN1YnN5c19pbml0Y2FsbGAg4oaSCiAgIGBkZXZpY2VfaW5pdGNhbGxg
KSBpcyB0aGUgbWFpbiBjb25jZXJuLiBETUEgZW5naW5lcyBhcmUKICAgaW5mcmFzdHJ1Y3R1cmUg
dGhhdCBvdGhlciBkcml2ZXJzIGRlcGVuZCBvbi4gSWYgYW55dGhpbmcgcHJvYmVzCiAgIGJlZm9y
ZSB0aGUgRE1BIGNvbnRyb2xsZXIgaXMgcmVhZHkgYW5kIGRvZXNuJ3QgaGFuZGxlIGRlZmVycmVk
CiAgIHByb2JpbmcgY29ycmVjdGx5LCB0aGlzIGNvdWxkIGNhdXNlIHJlZ3Jlc3Npb25zLgoyLiBI
b3dldmVyLCB0aGlzIGlzIG1pdGlnYXRlZCBieSB0aGUgZmFjdCB0aGF0IG1vZGVybiBkZXZpY2Ug
dHJlZQogICBwbGF0Zm9ybXMgYW5kIHByb2JlIGRlZmVycmFsIHNob3VsZCBoYW5kbGUgdGhpcyBn
cmFjZWZ1bGx5LgozLiBUaGUgYnVnIChpbmFiaWxpdHkgdG8gcm1tb2QpIHByaW1hcmlseSBhZmZl
Y3RzIGRldmVsb3BtZW50L2RlYnVnZ2luZwogICB3b3JrZmxvd3MgYW5kIG1vZHVsYXIga2VybmVs
IGNvbmZpZ3VyYXRpb25zLCBub3QgcHJvZHVjdGlvbiBlbWJlZGRlZAogICBzeXN0ZW1zIHRoYXQg
dHlwaWNhbGx5IGJ1aWxkIERNQSBkcml2ZXJzIGluLgoKIyMgVmVyaWZpY2F0aW9uCgotICoqZ2l0
IGxvZyoqIGNvbmZpcm1lZCBzdG0zMi1kbWEzLmMgd2FzIGludHJvZHVjZWQgYnkgY29tbWl0CiAg
ZjU2MWVjOGIyYjMzZCwgd2hpY2ggaXMgaW4gdjYuMTEtcmMxCi0gKipSZWFkIG9mIGN1cnJlbnQg
c291cmNlKiogKGxpbmUgMTkxNy0xOTIyKSBjb25maXJtZWQgdGhlCiAgYHN1YnN5c19pbml0Y2Fs
bGAgd2l0aG91dCBgbW9kdWxlX2V4aXRgIHBhdHRlcm4gbWF0Y2hlcyB0aGUgcHJlLXBhdGNoCiAg
c3RhdGUKLSAqKkdyZXAgb2YgZHJpdmVycy9kbWEvc3RtMzIvKiogY29uZmlybWVkIGFsbCB0aHJl
ZSBTVE0zMiBETUEgZHJpdmVycwogIHVzZSBzdWJzeXNfaW5pdGNhbGwgLSB0aGlzIGNvbW1pdCBv
bmx5IGNoYW5nZXMgc3RtMzItZG1hMwotICoqR3JlcCBvZiBkcml2ZXJzL2RtYS8qKiBmb3VuZCAy
MSBETUEgZHJpdmVycyB1c2luZyBzdWJzeXNfaW5pdGNhbGwKICBhbmQgNTQgdXNpbmcgbW9kdWxl
X3BsYXRmb3JtX2RyaXZlciwgY29uZmlybWluZyBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyCiAgaXMg
dGhlIGRvbWluYW50IHBhdHRlcm4KLSAqKmdpdCB0YWcqKiBjb25maXJtZWQgdGhlIGRyaXZlciBl
eGlzdHMgb25seSBpbiA2LjExKyBzdGFibGUgdHJlZXMKLSBUaGUgYC5yZW1vdmVgIGNhbGxiYWNr
IChgc3RtMzJfZG1hM19yZW1vdmVgKSBpcyBhbHJlYWR5IGRlZmluZWQgaW4gdGhlCiAgcGxhdGZv
cm1fZHJpdmVyIHN0cnVjdCAobGluZSAxOTA5KSwgY29uZmlybWluZyB0aGUgcmVtb3ZhbCBwYXRo
IHdhcwogIGludGVuZGVkIHRvIHdvcmsKCiMjIENvbmNsdXNpb24KClRoaXMgZml4ZXMgYSByZWFs
IGJ1ZyAobW9kdWxlIGNhbm5vdCBiZSB1bmxvYWRlZCkgd2l0aCBhIG1pbmltYWwsIHdlbGwtCnVu
ZGVyc3Rvb2QgY2hhbmdlIHVzaW5nIGEgc3RhbmRhcmQga2VybmVsIG1hY3JvLiBUaGUgcmlzayBp
cyB0aGUgaW5pdApsZXZlbCBjaGFuZ2UsIGJ1dCB0aGlzIGZvbGxvd3MgdGhlIHBhdHRlcm4gb2Yg
dGhlIG1ham9yaXR5IG9mIERNQQpkcml2ZXJzLiBUaGUgZml4IGlzIHNtYWxsLCByZXZpZXdlZCwg
YW5kIGFwcHJvcHJpYXRlIGZvciBzdGFibGUuIFRoZQpkcml2ZXIgb25seSBleGlzdHMgaW4gNi4x
MSssIGxpbWl0aW5nIHRoZSBzY29wZSBvZiBiYWNrcG9ydC4gRm9yCmVtYmVkZGVkL1NUTTMyIGRl
dmVsb3BlcnMgd2hvIGxvYWQgdGhlIERNQTMgZHJpdmVyIGFzIGEgbW9kdWxlLCB0aGlzIGlzCmEg
bWVhbmluZ2Z1bCBmaXguCgoqKllFUyoqCgogZHJpdmVycy9kbWEvc3RtMzIvc3RtMzItZG1hMy5j
IHwgNyArLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEvc3RtMzIvc3RtMzItZG1hMy5jIGIvZHJpdmVy
cy9kbWEvc3RtMzIvc3RtMzItZG1hMy5jCmluZGV4IDUwZTcxMDZjNWNiNzMuLjk1MDAxNjRjOGY2
ODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hL3N0bTMyL3N0bTMyLWRtYTMuYworKysgYi9kcml2
ZXJzL2RtYS9zdG0zMi9zdG0zMi1kbWEzLmMKQEAgLTE5MTQsMTIgKzE5MTQsNyBAQCBzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9kbWEzX2RyaXZlciA9IHsKIAl9LAogfTsKIAot
c3RhdGljIGludCBfX2luaXQgc3RtMzJfZG1hM19pbml0KHZvaWQpCi17Ci0JcmV0dXJuIHBsYXRm
b3JtX2RyaXZlcl9yZWdpc3Rlcigmc3RtMzJfZG1hM19kcml2ZXIpOwotfQotCi1zdWJzeXNfaW5p
dGNhbGwoc3RtMzJfZG1hM19pbml0KTsKK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoc3RtMzJfZG1h
M19kcml2ZXIpOwogCiBNT0RVTEVfREVTQ1JJUFRJT04oIlNUTTMyIERNQTMgY29udHJvbGxlciBk
cml2ZXIiKTsKIE1PRFVMRV9BVVRIT1IoIkFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5
QGZvc3Muc3QuY29tPiIpOwotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
