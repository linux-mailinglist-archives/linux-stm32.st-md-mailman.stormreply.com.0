Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sU2HHLAgOmrP1wcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 07:59:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F00566B452F
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 07:59:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=WKhiDDUd;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A308DC9AE46;
	Tue, 23 Jun 2026 05:59:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2161EC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2026 08:05:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1913F6001A;
 Mon, 22 Jun 2026 08:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B84C1F000E9;
 Mon, 22 Jun 2026 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782115519;
 bh=FAbpiNhKVqoEfhFmUfUdlxgESW8QuGiY+lhl+lA+T60=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=WKhiDDUdL0KRgYXfe2WI9TPD1Fcz4Jm9ZEs4TCvppOjXgUFC4H1afMQFw+2v6sbYC
 wyKQOW94sIC2JrNxh5T1XMUYBWAlDKC18spHzcXcYSeSIENbdvnOdBeIFeCRHU0wcr
 GXhaSILwuzYrxIUKMomqoVtJ32rfzWA7jVghDLmfnz+BZrvg16SiSZpHTKMbep/4WK
 cTRFBl6B2TwAUd1X5OjJrSj8wdRtwPxWGGAsp+lGM7jfcHoi8eTosbKCizRmGWHd0+
 cQFh5OCUybibOIb31BzksIWMYD20OkhiGIxmv8Z+opVm7KScIv+rhlWvQYzzdL9N23
 S4BwD770Utgzw==
Message-ID: <dbb5915e-6587-4de9-87f3-76bea5024da8@kernel.org>
Date: Mon, 22 Jun 2026 10:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
References: <20260621093430.264983361@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260621093430.264983361@kernel.org>
X-Mailman-Approved-At: Tue, 23 Jun 2026 05:59:10 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 John Ogness <john.ogness@linutronix.de>, linux-rdma@vger.kernel.org,
 linux-ext4@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-kbuild@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 0/2] tracing: Move trace_printk.h out of
	kernel.h
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
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:rostedt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:mark.rutland@arm.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:dri-devel@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:john.ogness@linutronix.de,m:linux-rdma@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:tglx@kernel.org,m:yury.norov@gmail.com,m:linux-kbuild@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:mathieu.desnoyers@efficios.com,m:linux-arm-kernel@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:torvalds@linux-foundation.org,m:linux-usb@vger.kernel.org,m:julia.lawall@inria.fr,m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:linuxppc-dev@lists.ozlabs.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,infradead.org,linutronix.de,lists.freedesktop.org,st-md-mailman.stormreply.com,kernel.org,gmail.com,efficios.com,lists.infradead.org,linux-foundation.org,inria.fr,lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F00566B452F

CgpMZSAyMS8wNi8yMDI2IMOgIDExOjM0LCBTdGV2ZW4gUm9zdGVkdCBhIMOpY3JpdMKgOgo+IFRo
ZXJlJ3MgYmVlbiBjb21wbGFpbnRzIGFib3V0IHRyYWNlX3ByaW50aygpIGJlaW5nIGRlZmluZWQg
aW4ga2VybmVsLmggYXMgaXQKPiBjYW4gaW5jcmVhc2UgdGhlIGNvbXBpbGF0aW9uIHRpbWUuIEFz
IGl0IGlzIG9ubHkgdXNlZCBieSBzb21lIGRldmVsb3BlcnMgZm9yCj4gZGVidWdnaW5nIHB1cnBv
c2VzLCBpdCBzaG91bGQgbm90IGJlIGluIGtlcm5lbC5oIGNhdXNpbmcgbG90cyBvZiB3YXN0ZWQg
Q1BVCj4gY3ljbGVzIGZvciB0aG9zZSB0aGF0IGRvIG5vdCBldmVyIGNhcmUgYWJvdXQgaXQuCgpE
byB3ZSBoYXZlIGEgbWVhc3VyZW1lbnQgb2YgdGhlIGluY3JlYXNlZCBjb21waWxhdGlvbiB0aW1l
ID8KCkNocmlzdG9waGUKCj4gCj4gSW5zdGVhZCwgYWRkIGEgQ09ORklHX1RSQUNFX1BSSU5US19E
RUJVR0dJTkcgb3B0aW9uIHRoYXQgZGV2ZWxvcGVycyB0aGF0IGRvCj4gdXNlIGl0IGNhbiBzZXQg
YW5kIG5vdCBoYXZlIHRvIGFsd2F5cyByZW1lbWJlciB0byBhZGQgI2luY2x1ZGUgPGxpbnV4L3Ry
YWNlX3ByaW50ay5oPgo+IHRvIHRoZSBmaWxlcyB0aGV5IGFkZCB0cmFjZV9wcmludGsoKSB3aGls
ZSBkZWJ1Z2dpbmcuIEl0IGFsc28gbWVhbnMgdGhhdAo+IHRob3NlIHRoYXQgZG8gbm90IGhhdmUg
dGhhdCBjb25maWcgc2V0IHdpbGwgbm90IGhhdmUgdG8gd29ycnkgYWJvdXQgd2FzdGVkCj4gQ1BV
IGN5Y2xlcyBhcyBpdCBpcyBvbmx5IGluY2x1ZGUgaW4gdGhlIENGTEFHUyB3aGVuIHRoZSBvcHRp
b24gaXMgc2V0LCBhbmQKPiBpdHMgY29tcGxldGVseSBpZ25vcmVkIG90aGVyd2lzZS4KPiAKPiBT
dGV2ZW4gUm9zdGVkdCAoMik6Cj4gICAgICAgIHRyYWNpbmc6IE1vdmUgbm9uLXRyYWNlX3ByaW50
ayBwcm90b3R5cGVzIGJhY2sgdG8ga2VybmVsLmgKPiAgICAgICAgdHJhY2luZzogQWRkIENPTkZJ
R19UUkFDRV9QUklOVEtfREVCVUdHSU5HIHRvIGNsZWFuIHVwIGtlcm5lbC5oCj4gCj4gLS0tLQo+
ICAgLi4uL2RyaXZlcl9kZXZlbG9wbWVudF9kZWJ1Z2dpbmdfZ3VpZGUucnN0ICAgICAgICAgfCAg
MiArLQo+ICAgTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgNSArKysrKwo+ICAgYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfeGljcy5jICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndHQu
aCAgICAgICAgICAgICAgICB8ICAxICsKPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2Vt
LmggICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAgZHJpdmVycy9od3RyYWNpbmcvc3RtL2R1
bW15X3N0bS5jICAgICAgICAgICAgICAgICAgfCAgNCArKysrCj4gICBkcml2ZXJzL2luZmluaWJh
bmQvaHcvaGZpMS90cmFjZV9kYmcuaCAgICAgICAgICAgICB8ICAxICsKPiAgIGRyaXZlcnMvdXNi
L2Vhcmx5L3hoY2ktZGJjLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAgZnMvZXh0
NC9pbmxpbmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gICBp
bmNsdWRlL2xpbnV4L2tlcm5lbC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE5ICsr
KysrKysrKysrKysrKysrKy0KPiAgIGluY2x1ZGUvbGludXgvc3VucnBjL2RlYnVnLmggICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAgaW5jbHVkZS9saW51eC90cmFjZV9wcmludGsuaCAg
ICAgICAgICAgICAgICAgICAgICAgfCAyMiArKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBrZXJu
ZWwvdHJhY2UvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysr
KysrKysKPiAgIGtlcm5lbC90cmFjZS9yaW5nX2J1ZmZlcl9iZW5jaG1hcmsuYyAgICAgICAgICAg
ICAgIHwgIDEgKwo+ICAga2VybmVsL3RyYWNlL3RyYWNlLmggICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4gICBzYW1wbGVzL2Zwcm9iZS9mcHJvYmVfZXhhbXBsZS5jICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKPiAgIHNhbXBsZXMvZnRyYWNlL2Z0cmFjZS1kaXJlY3QtbW9k
aWZ5LmMgICAgICAgICAgICAgIHwgIDEgKwo+ICAgc2FtcGxlcy9mdHJhY2UvZnRyYWNlLWRpcmVj
dC1tdWx0aS1tb2RpZnkuYyAgICAgICAgfCAgMSArCj4gICBzYW1wbGVzL2Z0cmFjZS9mdHJhY2Ut
ZGlyZWN0LW11bHRpLmMgICAgICAgICAgICAgICB8ICAyICstCj4gICBzYW1wbGVzL2Z0cmFjZS9m
dHJhY2UtZGlyZWN0LXRvby5jICAgICAgICAgICAgICAgICB8ICAyICstCj4gICBzYW1wbGVzL2Z0
cmFjZS9mdHJhY2UtZGlyZWN0LmMgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gICAyMSBm
aWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
