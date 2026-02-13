Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CHYIwYOj2kgHgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Feb 2026 12:41:58 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2265C135CE7
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Feb 2026 12:41:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2DDBC87EDC;
	Fri, 13 Feb 2026 11:41:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D7F6C87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Feb 2026 11:41:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EBDC76001A;
 Fri, 13 Feb 2026 11:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6D6C116C6;
 Fri, 13 Feb 2026 11:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770982914;
 bh=//FUPQtiHgkA6+8ggCTux5TUR6pLkT0fZp0gFDq5xRk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KQTI1b3u0Q4pyuXy0AQhK+daoEjRVYcgNTOfFMrdfdZ/HhxV617xG2c28/P8pq1D9
 iD6Nks4akO4w62sa5jNdbS1F3SbFTTRPizMUdXq1cLYFHPAp4bKBlvjlTaRgILYdoP
 yr2bOqqRtlh5pbgCIlnuOlrak4uvTjq6VUbgw+bWGAJs7gDbZSS9Oz80rWkzus5pmr
 LQ9t52v1iig1a0ANoVlL58TPaRATwVW6B4fAuR0VCVM7Pqsk8YrSNBf9BzttKJ4j+v
 UDPatfhhstyabt8VHBDQo07Uu8TWw2eXjm5ROfA4Slm+pmClEI6C7f5EzgQt3ZOw6D
 zYN4e8eHOIZ7w==
Date: Fri, 13 Feb 2026 17:11:43 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Message-ID: <aY8N90jMp25bBZhi@sumit-xelite>
References: <20250325200740.3645331-1-m.felsch@pengutronix.de>
 <Z-Pc6C1YUqLyej3Z@casper.infradead.org>
 <20250326110718.qzbwpmaf6xlcb4xf@pengutronix.de>
 <CAHUa44FUK_73oKSaqGdiPqB3geZbTNDFsC1Mh=KN3YPWr9=7gQ@mail.gmail.com>
 <Z-TXMIXzaro0w60M@sumit-X1>
 <CAHUa44HEsMkzQHZZufdwutQyZRtig6e0qWomhwgDZAhy2qDyhg@mail.gmail.com>
 <20260212125830.jfwos3flga2l5uwk@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260212125830.jfwos3flga2l5uwk@pengutronix.de>
Cc: linux-efi@vger.kernel.org, mcoquelin.stm32@gmail.com,
 jan.kiszka@siemens.com, ilias.apalodimas@linaro.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 masahisa.kojima@linaro.org, akpm@linux-foundation.org,
 Jens Wiklander <jens.wiklander@linaro.org>, vbabka@suse.cz
Subject: Re: [Linux-stm32] [PATCH v2] tee: shm: fix slab page refcounting
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:linux-efi@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:jan.kiszka@siemens.com,m:ilias.apalodimas@linaro.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:op-tee@lists.trustedfirmware.org,m:linux-arm-kernel@lists.infradead.org,m:kernel@pengutronix.de,m:masahisa.kojima@linaro.org,m:akpm@linux-foundation.org,m:jens.wiklander@linaro.org,m:vbabka@suse.cz,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sumit.garg@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,siemens.com,linaro.org,infradead.org,st-md-mailman.stormreply.com,lists.trustedfirmware.org,lists.infradead.org,pengutronix.de,linux-foundation.org,suse.cz];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2265C135CE7
X-Rspamd-Action: no action

SGkgTWFyY28sCgpPbiBUaHUsIEZlYiAxMiwgMjAyNiBhdCAwMTo1ODozMFBNICswMTAwLCBNYXJj
byBGZWxzY2ggd3JvdGU6Cj4gSGkgU3VtaXQsCj4gCj4gVEJIOiBJIHdhcyBob3BpbmcgdGhhdCB5
b3Ugd2lsbCB0YWtlIGNhcmUgb2YgdGhpcyBzaW5jZSB5b3UncmUgbWFya2VkIGFzCj4gbWFpbnRh
aW5lciBmb3IgdGhlIHRlZS10cnVzdGVkLWtleSBhbmQgd2Ugbm90aWNlZCB0aGUgd2FybmluZyB3
aXRoIDYuMTQKPiBhbmQgc3RpbGwgbm8gZml4IGF2YWlsYWJsZSA6LwoKTWF0aGV3IGRpZCBzdWdn
ZXN0ZWQgYSBmaXggbG9uZyBiYWNrIG9uIHdoaWNoIGV2ZXJ5Ym9keSBhZ3JlZWQgYnV0CmRpZG4n
dCBnb3QgZW5vdWdoIGF0dGVudGlvbiBmcm9tIHlvdSB0byB0ZXN0IGFuZCByZXBvcnQgaWYgdGhh
dCBmaXhlZAp5b3VyIGlzc3VlLiBTaW5jZSB5b3UgaW5zaXN0ZWQgZnVydGhlciwgSSBoYXZlIGNy
ZWF0ZWQgYSBmb3JtYWwgZml4CnBhdGNoIGJhc2VkIG9uIHRoYXQgaGVyZSBbMV0uIENhcmUgdG8g
dGVzdCB0aGF0PwoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDIxMzExMzMx
Ny4xNzI4NzY5LTEtc3VtaXQuZ2FyZ0BrZXJuZWwub3JnLwoKPiAKPiBIb3dldmVyIHBsZWFzZSBz
ZWUgYmVsb3cgZm9yIGZ1cnRoZXIgZGlzY3Vzc2lvbi4KPiAKPiBPbiAyNS0wNC0yOCwgSmVucyBX
aWtsYW5kZXIgd3JvdGU6Cj4gPiBPbiBUaHUsIE1hciAyNywgMjAyNSBhdCA1OjQy4oCvQU0gU3Vt
aXQgR2FyZyA8c3VtaXQuZ2FyZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2Vk
LCBNYXIgMjYsIDIwMjUgYXQgMDI6NDc6NDZQTSArMDEwMCwgSmVucyBXaWtsYW5kZXIgd3JvdGU6
Cj4gPiA+ID4gT24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgMTI6MDfigK9QTSBNYXJjbyBGZWxzY2gg
PG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiAy
NS0wMy0yNiwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFR1ZSwgTWFyIDI1
LCAyMDI1IGF0IDA5OjA3OjM5UE0gKzAxMDAsIE1hcmNvIEZlbHNjaCB3cm90ZToKPiA+ID4gPiA+
ID4gPiBTa2lwIG1hbmlwdWxhdGluZyB0aGUgcmVmY291bnQgaW4gY2FzZSBvZiBzbGFiIHBhZ2Vz
IGFjY29yZGluZyBjb21taXQKPiA+ID4gPiA+ID4gPiBiOWMwZTQ5YWJmY2EgKCJtbTogZGVjbGlu
ZSB0byBtYW5pcHVsYXRlIHRoZSByZWZjb3VudCBvbiBhIHNsYWIgcGFnZSIpLgo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBUaGlzIGFsbW9zdCBjZXJ0YWlubHkgaXNuJ3QgcmlnaHQuICBJIGtub3cg
bm90aGluZyBhYm91dCBURUUsIGJ1dCB0aGF0Cj4gPiA+ID4gPiA+IHlvdSBhcmUgZG9pbmcgdGhp
cyBpbmRpY2F0ZXMgYSBwcm9ibGVtLiAgVGhlIGhhY2sgdGhhdCB3ZSBwdXQgaW50bwo+ID4gPiA+
ID4gPiBuZXR3b3JraW5nIHNob3VsZCBub3QgYmUgYmxpbmRseSByZXBsaWNhdGVkLgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBXaHkgYXJlIHlvdSB0YWtpbmcgYSByZWZlcmVuY2Ugb24gdGhlIHBh
Z2VzIHRvIGJlZ2luIHdpdGg/ICBJcyBpdCBjb3B5Cj4gPiA+ID4gPiA+IGFuZCBwYXN0ZWQgZnJv
bSBzb21ld2hlcmUgZWxzZSwgb3Igd2FzIHRoZXJlIGFjdHVhbCB0aG91Z2h0IHB1dCBpbnRvIGl0
Pwo+ID4gPiA+ID4KPiA+ID4gPiA+IE5vdCBzdXJlLCB0aGlzIGJlbG9uZ3MgdG8gdGhlIFRFRSBt
YWludGFpbmVycy4KPiA+ID4gPgo+ID4gPiA+IEkgZG9uJ3Qga25vdy4gV2Ugd2VyZSBnZXR0aW5n
IHRoZSB1c2VyIHBhZ2VzIGZpcnN0LCBzbyBJIGFzc3VtZSB3ZQo+ID4gPiA+IGp1c3QgZGlkIHRo
ZSBzYW1lIHRoaW5nIHdoZW4gd2UgYWRkZWQgc3VwcG9ydCBmb3Iga2VybmVsIHBhZ2VzLgo+ID4g
PiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJZiBpdCdzICJwcmV2ZW50IHRoZSBjYWxsZXIgZnJv
bSBmcmVlaW5nIHRoZSBhbGxvY2F0aW9uIiwgd2VsbCwgaXQgbmV2ZXIKPiA+ID4gPiA+ID4gYWNj
b21wbGlzaGVkIHRoYXQgd2l0aCBzbGFiIGFsbG9jYXRpb25zLiAgU28gZm9yIGNhbGxlcnMgdGhh
dCBkbyBrbWFsbG9jCj4gPiA+ID4gPiA+IChlZyBzZXR1cF9tbV9oZHIoKSAgaW4gZHJpdmVycy9m
aXJtd2FyZS9lZmkvc3RtbS90ZWVfc3RtbV9lZmkuYyksIHlvdQo+ID4gPiA+ID4gPiBoYXZlIHRv
IHJlbHkgb24gdGhlbSBub3QgZnJlZWluZyB0aGUgYWxsb2NhdGlvbiB3aGlsZSB0aGUgVEVFIGRy
aXZlcgo+ID4gPiA+ID4gPiBoYXMgaXQuCj4gPiA+Cj4gPiA+IEl0J3Mgbm90IGp1c3QgYWJvdXQg
dGhlIFRFRSBkcml2ZXIgYnV0IHJhdGhlciBpZiB0aGUgVEVFIGltcGxlbWVudGF0aW9uCj4gPiA+
IChhIHRydXN0ZWQgT1MpIHRvIHdob20gdGhlIHBhZ2UgaXMgcmVnaXN0ZXJlZCB3aXRoLiBXZSBk
b24ndCB3YW50IHRoZQo+ID4gPiB0cnVzdGVkIE9TIHRvIHdvcmsgb24gcmVnaXN0ZXJlZCBrZXJu
ZWwgcGFnZXMgaWYgdGhleSBnZXRzIGZyZWUgc29tZWhvdwo+ID4gPiBpbiB0aGUgVEVFIGNsaWVu
dCBkcml2ZXIuIEhhdmluZyBhIHJlZmVyZW5jZSBpbiB0aGUgVEVFIHN1YnN5c3RlbQo+ID4gPiBh
c3N1cmVkIHVzIHRoYXQgd29uJ3QgaGFwcGVuLiBCdXQgaWYgeW91IHNheSBzbGFiIGFsbG9jYXRp
b25zIGFyZSBzdGlsbAo+ID4gPiBwcm9uZSB0aGUga2VybmVsIHBhZ2VzIGdldHRpbmcgZnJlZWQg
ZXZlbiBhZnRlciByZWZjb3VudCB0aGVuIGNhbiB5b3UKPiA+ID4gc3VnZ2VzdCBob3cgc2hvdWxk
IHdlIGhhbmRsZSB0aGlzIGJldHRlcj8KPiA+ID4KPiA+ID4gQXMgb3RoZXJ3aXNlIGl0IGNhbiBj
YXVzZSB2ZXJ5IGhhcmQgdG8gZGVidWcgcHJvYmxlbXMgaWYgdHJ1c3RlZCBPUyBjYW4KPiA+ID4g
bWFuaXB1bGF0ZSBrZXJuZWwgcGFnZXMgdGhhdCBhcmUgbm8gbG9uZ2VyIGF2YWlsYWJsZS4KPiA+
IAo+ID4gV2UgbXVzdCBiZSBhYmxlIHRvIHJlbHkgb24gdGhlIGtlcm5lbCBjYWxsZXJzIHRvIGhh
dmUgdGhlIG5lZWRlZAo+ID4gcmVmZXJlbmNlcyBiZWZvcmUgY2FsbGluZyB0ZWVfc2htX3JlZ2lz
dGVyX2tlcm5lbF9idWYoKSBhbmQgdG8ga2VlcAo+ID4gdGhvc2UgdW50aWwgYWZ0ZXIgY2FsbGlu
ZyB0ZWVfc2htX2ZyZWUoKS4KPiAKPiBJIGNoZWNrZWQgdGhlIGNvZGUgb25jZSBhZ2FpbiBhbmQg
ZmlndXJlZCB0aGF0IHdlIGNvdWxkIGRyb3AvcmVwbGFjZQo+IHRlZV9zaG1fcmVnaXN0ZXJfa2Vy
bmVsX2J1ZigpIHdpdGggdGVlX3NobV9hbGxvY19rZXJuZWxfYnVmKCkuIEkgZG9uJ3QKPiBzZWUg
d2h5IGEga2VybmVsIGRyaXZlciBuZWVkcyB0byB0ZWVfc2htX3JlZ2lzdGVyX2tlcm5lbF9idWYo
KSBpbiB0aGUKPiBmaXJzdCBwbGFjZSwgbWF5YmUgdGhpcyBpcyBsZWdhY3kuIFRoZSBvbmx5IHVz
ZXJzIG9mCj4gdGVlX3NobV9yZWdpc3Rlcl9rZXJuZWxfYnVmKCkgYXJlIHRydXN0ZWRfdGVlLmMg
YW5kIHRlZV9zdG1tX2VmaS5jLgoKTm8gaXQncyBub3QgbGVnYWN5IGJ1dCBhbGxvd3MgZm9yIGVm
ZmljaWVudCBtZW1vcnkgcmV1c2Ugd2l0aGluIHRoZQprZXJuZWwgYXMgdG8gbm90IGNyZWF0ZSBi
b3VuY2UgYnVmZmVycyB0byBzaGFyZSBkYXRhIHdpdGggVEVFLgoKLVN1bWl0Cgo+IAo+ICtDYyB0
aGUgZWZpLXN0bW0gZm9sa3Mgc2luY2UgdGhleSB3aWxsIGJlIGFmZmVjdGVkIGJ5IHRoaXMgY2hh
bmdlIGFzCj4gd2VsbC4KPiAKPiBSZWdhcmRzLAo+ICAgTWFyY28KPiAKPiAKPiA+ID4gPiA+ID4g
QW5kIGlmIHRoYXQncyB5b3VyIEFQSSBjb250cmFjdCwgdGhlbiB0aGVyZSdzIG5vIHBvaW50IGlu
IHRha2luZwo+ID4gPiA+ID4gPiByZWZjb3VudHMgb24gb3RoZXIga2luZHMgb2YgcGFnZXMgZWl0
aGVyOyBpdCdzIGp1c3QgdW5uZWNlc3NhcnkgYXRvbWljCj4gPiA+ID4gPiA+IGluc3RydWN0aW9u
cy4gIFNvIHRoZSByaWdodCBwYXRjaCBtaWdodCBiZSBzb21ldGhpbmcgbGlrZSB0aGlzOgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3RlZS90ZWVfc2htLmMKPiA+ID4gPiA+
ID4gQEAgLTE1LDI5ICsxNSwxMSBAQAo+ID4gPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2hpZ2ht
ZW0uaD4KPiA+ID4gPiA+ID4gICNpbmNsdWRlICJ0ZWVfcHJpdmF0ZS5oIgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEkgaGFkIHRoZSBzYW1lIGRpZmYgYnV0IGRpZG4ndCB3ZW50IHRoaXMgd2F5IHNpbmNl
IHdlIGNhbid0IGJlIHN1cmUgdGhhdAo+ID4gPiA+ID4gaW92J3MgYXJlIGFsd2F5cyBzbGFiIGJh
Y2tlZC4gQXMgZmFyIGFzIEkgdW5kZXJzdG9vZCBJT1ZzLiBJbgo+ID4gPiA+ID4gJ3dvcnN0LWNh
c2UnIHNjZW5hcmlvIGFuIGlvdiBjYW4gYmUgYmFja2VkIGJ5IGRpZmZlcmVudCBwYWdlIHR5cGVz
IHRvby4KPiA+ID4gPgo+ID4gPiA+IFdlJ3JlIG9ubHkgdXNpbmcga3ZlYydzLiBCcmllZmx5LCBi
ZWZvcmUgY29tbWl0IDdiZGVlNDE1NzU5MSAoInRlZToKPiA+ID4gPiBVc2UgaW92X2l0ZXIgdG8g
YmV0dGVyIHN1cHBvcnQgc2hhcmVkIGJ1ZmZlciByZWdpc3RyYXRpb24iKSB3ZSBjaGVja2VkCj4g
PiA+ID4gd2l0aCBpc192bWFsbG9jX2FkZHIoKSB8fCBpc19rbWFwX2FkZHIoKS4gSSBsaWtlIE1h
dHRoZXcncyBzdWdnZXN0aW9uLAo+ID4gPiA+IGl0J3MgbmljZSB0byBmaXggcHJvYmxlbXMgYnkg
ZGVsZXRpbmcgY29kZS4gOi0pCj4gPiA+ID4KPiA+ID4gPiBTdW1pdCwgeW91IGtub3cgdGhlIGNh
bGxlcnMgYmV0dGVyLiBXaGF0IGRvIHlvdSB0aGluaz8KPiA+ID4KPiA+ID4gSWYgd2UgZG9uJ3Qg
aGF2ZSBhIHNhbmUgd2F5IHRvIHJlZmNvbnQgcmVnaXN0ZXJlZCBrZXJuZWwgcGFnZXMgaW4gVEVF
Cj4gPiA+IHN1YnN5c3RlbSB0aGVuIHllYWggd2UgaGF2ZSB0byBzb2xlbHkgcmVseSBvbiB0aGUg
Y2xpZW50IGRyaXZlcnMgdG8KPiA+ID4gYmVoYXZlIHByb3Blcmx5LiBOZXZlcnRoZWxlc3MsIGl0
J3Mgc3RpbGwgd2l0aGluIHRoZSBrZXJuZWwgYm91bmRhcmllcwo+ID4gPiB3aGljaCB3ZSBjYW4g
cmVseSB1cG9uLgo+ID4gCj4gPiBZZXMuCj4gPiAKPiA+IENoZWVycywKPiA+IEplbnMKPiAKPiAt
LSAKPiAjZ2VybnBlckR1IAo+ICNDYWxsTWVCeU15Rmlyc3ROYW1lCj4gCj4gUGVuZ3V0cm9uaXgg
ZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwKPiBTdGV1ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAgICAgICAgICAgICAgICAgfCBodHRw
czovL3d3dy5wZW5ndXRyb25peC5kZS8gfAo+IDMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAg
ICAgICAgICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMCAgICB8Cj4gQW10c2dlcmlj
aHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkx
Ny05ICAgIHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
