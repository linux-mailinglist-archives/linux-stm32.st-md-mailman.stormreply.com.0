Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMAJIJDOjWn87AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 13:58:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701112DAE1
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 13:58:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BD79C87ED3;
	Thu, 12 Feb 2026 12:58:55 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D43FFC87EC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Feb 2026 12:58:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1vqWHB-0008LE-0f; Thu, 12 Feb 2026 13:58:33 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vqWH7-000PUE-2A;
 Thu, 12 Feb 2026 13:58:31 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vqWH8-00DseC-2p;
 Thu, 12 Feb 2026 13:58:30 +0100
Date: Thu, 12 Feb 2026 13:58:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Jens Wiklander <jens.wiklander@linaro.org>
Message-ID: <20260212125830.jfwos3flga2l5uwk@pengutronix.de>
References: <20250325200740.3645331-1-m.felsch@pengutronix.de>
 <Z-Pc6C1YUqLyej3Z@casper.infradead.org>
 <20250326110718.qzbwpmaf6xlcb4xf@pengutronix.de>
 <CAHUa44FUK_73oKSaqGdiPqB3geZbTNDFsC1Mh=KN3YPWr9=7gQ@mail.gmail.com>
 <Z-TXMIXzaro0w60M@sumit-X1>
 <CAHUa44HEsMkzQHZZufdwutQyZRtig6e0qWomhwgDZAhy2qDyhg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHUa44HEsMkzQHZZufdwutQyZRtig6e0qWomhwgDZAhy2qDyhg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, jan.kiszka@siemens.com, ilias.apalodimas@linaro.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 op-tee@lists.trustedfirmware.org, Sumit Garg <sumit.garg@kernel.org>,
 kernel@pengutronix.de, masahisa.kojima@linaro.org, akpm@linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, vbabka@suse.cz
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
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-efi@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:jan.kiszka@siemens.com,m:ilias.apalodimas@linaro.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:op-tee@lists.trustedfirmware.org,m:sumit.garg@kernel.org,m:kernel@pengutronix.de,m:masahisa.kojima@linaro.org,m:akpm@linux-foundation.org,m:linux-stm32@st-md-mailman.stormreply.com,m:vbabka@suse.cz,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[m.felsch@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com,siemens.com,linaro.org,infradead.org,lists.trustedfirmware.org,kernel.org,pengutronix.de,linux-foundation.org,st-md-mailman.stormreply.com,suse.cz];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 1701112DAE1
X-Rspamd-Action: no action

SGkgU3VtaXQsCgpUQkg6IEkgd2FzIGhvcGluZyB0aGF0IHlvdSB3aWxsIHRha2UgY2FyZSBvZiB0
aGlzIHNpbmNlIHlvdSdyZSBtYXJrZWQgYXMKbWFpbnRhaW5lciBmb3IgdGhlIHRlZS10cnVzdGVk
LWtleSBhbmQgd2Ugbm90aWNlZCB0aGUgd2FybmluZyB3aXRoIDYuMTQKYW5kIHN0aWxsIG5vIGZp
eCBhdmFpbGFibGUgOi8KCkhvd2V2ZXIgcGxlYXNlIHNlZSBiZWxvdyBmb3IgZnVydGhlciBkaXNj
dXNzaW9uLgoKT24gMjUtMDQtMjgsIEplbnMgV2lrbGFuZGVyIHdyb3RlOgo+IE9uIFRodSwgTWFy
IDI3LCAyMDI1IGF0IDU6NDLigK9BTSBTdW1pdCBHYXJnIDxzdW1pdC5nYXJnQGtlcm5lbC5vcmc+
IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgTWFyIDI2LCAyMDI1IGF0IDAyOjQ3OjQ2UE0gKzAxMDAs
IEplbnMgV2lrbGFuZGVyIHdyb3RlOgo+ID4gPiBPbiBXZWQsIE1hciAyNiwgMjAyNSBhdCAxMjow
N+KAr1BNIE1hcmNvIEZlbHNjaCA8bS5mZWxzY2hAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4g
PiA+Cj4gPiA+ID4gT24gMjUtMDMtMjYsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+ID4gPiA+ID4g
T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMDk6MDc6MzlQTSArMDEwMCwgTWFyY28gRmVsc2NoIHdy
b3RlOgo+ID4gPiA+ID4gPiBTa2lwIG1hbmlwdWxhdGluZyB0aGUgcmVmY291bnQgaW4gY2FzZSBv
ZiBzbGFiIHBhZ2VzIGFjY29yZGluZyBjb21taXQKPiA+ID4gPiA+ID4gYjljMGU0OWFiZmNhICgi
bW06IGRlY2xpbmUgdG8gbWFuaXB1bGF0ZSB0aGUgcmVmY291bnQgb24gYSBzbGFiIHBhZ2UiKS4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIGFsbW9zdCBjZXJ0YWlubHkgaXNuJ3QgcmlnaHQuICBJ
IGtub3cgbm90aGluZyBhYm91dCBURUUsIGJ1dCB0aGF0Cj4gPiA+ID4gPiB5b3UgYXJlIGRvaW5n
IHRoaXMgaW5kaWNhdGVzIGEgcHJvYmxlbS4gIFRoZSBoYWNrIHRoYXQgd2UgcHV0IGludG8KPiA+
ID4gPiA+IG5ldHdvcmtpbmcgc2hvdWxkIG5vdCBiZSBibGluZGx5IHJlcGxpY2F0ZWQuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gV2h5IGFyZSB5b3UgdGFraW5nIGEgcmVmZXJlbmNlIG9uIHRoZSBwYWdl
cyB0byBiZWdpbiB3aXRoPyAgSXMgaXQgY29weQo+ID4gPiA+ID4gYW5kIHBhc3RlZCBmcm9tIHNv
bWV3aGVyZSBlbHNlLCBvciB3YXMgdGhlcmUgYWN0dWFsIHRob3VnaHQgcHV0IGludG8gaXQ/Cj4g
PiA+ID4KPiA+ID4gPiBOb3Qgc3VyZSwgdGhpcyBiZWxvbmdzIHRvIHRoZSBURUUgbWFpbnRhaW5l
cnMuCj4gPiA+Cj4gPiA+IEkgZG9uJ3Qga25vdy4gV2Ugd2VyZSBnZXR0aW5nIHRoZSB1c2VyIHBh
Z2VzIGZpcnN0LCBzbyBJIGFzc3VtZSB3ZQo+ID4gPiBqdXN0IGRpZCB0aGUgc2FtZSB0aGluZyB3
aGVuIHdlIGFkZGVkIHN1cHBvcnQgZm9yIGtlcm5lbCBwYWdlcy4KPiA+ID4KPiA+ID4gPgo+ID4g
PiA+ID4gSWYgaXQncyAicHJldmVudCB0aGUgY2FsbGVyIGZyb20gZnJlZWluZyB0aGUgYWxsb2Nh
dGlvbiIsIHdlbGwsIGl0IG5ldmVyCj4gPiA+ID4gPiBhY2NvbXBsaXNoZWQgdGhhdCB3aXRoIHNs
YWIgYWxsb2NhdGlvbnMuICBTbyBmb3IgY2FsbGVycyB0aGF0IGRvIGttYWxsb2MKPiA+ID4gPiA+
IChlZyBzZXR1cF9tbV9oZHIoKSAgaW4gZHJpdmVycy9maXJtd2FyZS9lZmkvc3RtbS90ZWVfc3Rt
bV9lZmkuYyksIHlvdQo+ID4gPiA+ID4gaGF2ZSB0byByZWx5IG9uIHRoZW0gbm90IGZyZWVpbmcg
dGhlIGFsbG9jYXRpb24gd2hpbGUgdGhlIFRFRSBkcml2ZXIKPiA+ID4gPiA+IGhhcyBpdC4KPiA+
Cj4gPiBJdCdzIG5vdCBqdXN0IGFib3V0IHRoZSBURUUgZHJpdmVyIGJ1dCByYXRoZXIgaWYgdGhl
IFRFRSBpbXBsZW1lbnRhdGlvbgo+ID4gKGEgdHJ1c3RlZCBPUykgdG8gd2hvbSB0aGUgcGFnZSBp
cyByZWdpc3RlcmVkIHdpdGguIFdlIGRvbid0IHdhbnQgdGhlCj4gPiB0cnVzdGVkIE9TIHRvIHdv
cmsgb24gcmVnaXN0ZXJlZCBrZXJuZWwgcGFnZXMgaWYgdGhleSBnZXRzIGZyZWUgc29tZWhvdwo+
ID4gaW4gdGhlIFRFRSBjbGllbnQgZHJpdmVyLiBIYXZpbmcgYSByZWZlcmVuY2UgaW4gdGhlIFRF
RSBzdWJzeXN0ZW0KPiA+IGFzc3VyZWQgdXMgdGhhdCB3b24ndCBoYXBwZW4uIEJ1dCBpZiB5b3Ug
c2F5IHNsYWIgYWxsb2NhdGlvbnMgYXJlIHN0aWxsCj4gPiBwcm9uZSB0aGUga2VybmVsIHBhZ2Vz
IGdldHRpbmcgZnJlZWQgZXZlbiBhZnRlciByZWZjb3VudCB0aGVuIGNhbiB5b3UKPiA+IHN1Z2dl
c3QgaG93IHNob3VsZCB3ZSBoYW5kbGUgdGhpcyBiZXR0ZXI/Cj4gPgo+ID4gQXMgb3RoZXJ3aXNl
IGl0IGNhbiBjYXVzZSB2ZXJ5IGhhcmQgdG8gZGVidWcgcHJvYmxlbXMgaWYgdHJ1c3RlZCBPUyBj
YW4KPiA+IG1hbmlwdWxhdGUga2VybmVsIHBhZ2VzIHRoYXQgYXJlIG5vIGxvbmdlciBhdmFpbGFi
bGUuCj4gCj4gV2UgbXVzdCBiZSBhYmxlIHRvIHJlbHkgb24gdGhlIGtlcm5lbCBjYWxsZXJzIHRv
IGhhdmUgdGhlIG5lZWRlZAo+IHJlZmVyZW5jZXMgYmVmb3JlIGNhbGxpbmcgdGVlX3NobV9yZWdp
c3Rlcl9rZXJuZWxfYnVmKCkgYW5kIHRvIGtlZXAKPiB0aG9zZSB1bnRpbCBhZnRlciBjYWxsaW5n
IHRlZV9zaG1fZnJlZSgpLgoKSSBjaGVja2VkIHRoZSBjb2RlIG9uY2UgYWdhaW4gYW5kIGZpZ3Vy
ZWQgdGhhdCB3ZSBjb3VsZCBkcm9wL3JlcGxhY2UKdGVlX3NobV9yZWdpc3Rlcl9rZXJuZWxfYnVm
KCkgd2l0aCB0ZWVfc2htX2FsbG9jX2tlcm5lbF9idWYoKS4gSSBkb24ndApzZWUgd2h5IGEga2Vy
bmVsIGRyaXZlciBuZWVkcyB0byB0ZWVfc2htX3JlZ2lzdGVyX2tlcm5lbF9idWYoKSBpbiB0aGUK
Zmlyc3QgcGxhY2UsIG1heWJlIHRoaXMgaXMgbGVnYWN5LiBUaGUgb25seSB1c2VycyBvZgp0ZWVf
c2htX3JlZ2lzdGVyX2tlcm5lbF9idWYoKSBhcmUgdHJ1c3RlZF90ZWUuYyBhbmQgdGVlX3N0bW1f
ZWZpLmMuCgorQ2MgdGhlIGVmaS1zdG1tIGZvbGtzIHNpbmNlIHRoZXkgd2lsbCBiZSBhZmZlY3Rl
ZCBieSB0aGlzIGNoYW5nZSBhcwp3ZWxsLgoKUmVnYXJkcywKICBNYXJjbwoKCj4gPiA+ID4gPiBB
bmQgaWYgdGhhdCdzIHlvdXIgQVBJIGNvbnRyYWN0LCB0aGVuIHRoZXJlJ3Mgbm8gcG9pbnQgaW4g
dGFraW5nCj4gPiA+ID4gPiByZWZjb3VudHMgb24gb3RoZXIga2luZHMgb2YgcGFnZXMgZWl0aGVy
OyBpdCdzIGp1c3QgdW5uZWNlc3NhcnkgYXRvbWljCj4gPiA+ID4gPiBpbnN0cnVjdGlvbnMuICBT
byB0aGUgcmlnaHQgcGF0Y2ggbWlnaHQgYmUgc29tZXRoaW5nIGxpa2UgdGhpczoKPiA+ID4gPiA+
Cj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3RlZS90ZWVfc2htLmMKPiA+ID4gPiA+IEBAIC0xNSwy
OSArMTUsMTEgQEAKPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvaGlnaG1lbS5oPgo+ID4gPiA+
ID4gICNpbmNsdWRlICJ0ZWVfcHJpdmF0ZS5oIgo+ID4gPiA+Cj4gPiA+ID4gSSBoYWQgdGhlIHNh
bWUgZGlmZiBidXQgZGlkbid0IHdlbnQgdGhpcyB3YXkgc2luY2Ugd2UgY2FuJ3QgYmUgc3VyZSB0
aGF0Cj4gPiA+ID4gaW92J3MgYXJlIGFsd2F5cyBzbGFiIGJhY2tlZC4gQXMgZmFyIGFzIEkgdW5k
ZXJzdG9vZCBJT1ZzLiBJbgo+ID4gPiA+ICd3b3JzdC1jYXNlJyBzY2VuYXJpbyBhbiBpb3YgY2Fu
IGJlIGJhY2tlZCBieSBkaWZmZXJlbnQgcGFnZSB0eXBlcyB0b28uCj4gPiA+Cj4gPiA+IFdlJ3Jl
IG9ubHkgdXNpbmcga3ZlYydzLiBCcmllZmx5LCBiZWZvcmUgY29tbWl0IDdiZGVlNDE1NzU5MSAo
InRlZToKPiA+ID4gVXNlIGlvdl9pdGVyIHRvIGJldHRlciBzdXBwb3J0IHNoYXJlZCBidWZmZXIg
cmVnaXN0cmF0aW9uIikgd2UgY2hlY2tlZAo+ID4gPiB3aXRoIGlzX3ZtYWxsb2NfYWRkcigpIHx8
IGlzX2ttYXBfYWRkcigpLiBJIGxpa2UgTWF0dGhldydzIHN1Z2dlc3Rpb24sCj4gPiA+IGl0J3Mg
bmljZSB0byBmaXggcHJvYmxlbXMgYnkgZGVsZXRpbmcgY29kZS4gOi0pCj4gPiA+Cj4gPiA+IFN1
bWl0LCB5b3Uga25vdyB0aGUgY2FsbGVycyBiZXR0ZXIuIFdoYXQgZG8geW91IHRoaW5rPwo+ID4K
PiA+IElmIHdlIGRvbid0IGhhdmUgYSBzYW5lIHdheSB0byByZWZjb250IHJlZ2lzdGVyZWQga2Vy
bmVsIHBhZ2VzIGluIFRFRQo+ID4gc3Vic3lzdGVtIHRoZW4geWVhaCB3ZSBoYXZlIHRvIHNvbGVs
eSByZWx5IG9uIHRoZSBjbGllbnQgZHJpdmVycyB0bwo+ID4gYmVoYXZlIHByb3Blcmx5LiBOZXZl
cnRoZWxlc3MsIGl0J3Mgc3RpbGwgd2l0aGluIHRoZSBrZXJuZWwgYm91bmRhcmllcwo+ID4gd2hp
Y2ggd2UgY2FuIHJlbHkgdXBvbi4KPiAKPiBZZXMuCj4gCj4gQ2hlZXJzLAo+IEplbnMKCi0tIAoj
Z2VybnBlckR1IAojQ2FsbE1lQnlNeUZpcnN0TmFtZQoKUGVuZ3V0cm9uaXggZS5LLiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKU3RldWVy
d2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwgaHR0cHM6Ly93d3cucGVuZ3V0
cm9uaXguZGUvIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAgICAgICAgICAgICAgICAgIHwg
UGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJB
IDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkxNy05ICAgIHwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
