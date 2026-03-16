Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNvhJr8TuGk7YwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 15:29:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E8329B614
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 15:29:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D62A1C87ED8;
	Mon, 16 Mar 2026 14:29:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89960C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 14:29:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E4EBE42DCF;
 Mon, 16 Mar 2026 14:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901EFC19421;
 Mon, 16 Mar 2026 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773671355;
 bh=PFUSnO/9ILgelOXbwjEIMdn/Aab1PlCJ0qMrqAnbvw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZNArTqce345KwAkB2/OySCnh6EME1XoJwR/oAl0lWq7Ylt9gkTfk6stvl4mVK9/3F
 KwYOcm79Ed4P16v4AgfrWxgeQ5kXFytmq8JtvKgeAJBHJni4gvkqoXRwSRojWkzMXW
 KjdJCy/qJzif6rc5Ha23V7TyHyiPTJueX/dmlebfwa3TllC3B8dzFJIvh09GNdM5hA
 U109OB4NNCj4y6zxKWnPMdODpWkf+W9tJkoIot699UjVOMo5rbg+oOW+XblrH75bPT
 2K9hfeg+fCNBKA/MiRSMUpOgDleW7qa6JeZtPbHw5YSqiNeQgyfmSpebEkCOjXVHFZ
 N7HDaEOyJ+00A==
Date: Mon, 16 Mar 2026 14:29:04 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Message-ID: <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev>
 <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
 <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Clemens Ladisch <clemens@ladisch.de>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 linux-stm32@st-md-mailman.stormreply.com, Wei Liu <wei.liu@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Long Li <longli@microsoft.com>,
 linux-staging@lists.linux.dev, Dexuan Cui <decui@microsoft.com>,
 linux-afs@lists.infradead.org, Pedro Falcato <pfalcato@suse.de>,
 Ryan Roberts <ryan.roberts@arm.com>, Usama Arif <usama.arif@linux.dev>,
 Jann Horn <jannh@google.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Vlastimil Babka <vbabka@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 05/15] fs: afs: correctly drop reference
 count on mapping failure
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
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:arnd@arndb.de,m:linux-scsi@vger.kernel.org,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:usama.arif@linux.dev,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gm
 ail.com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,arndb.de,nod.at,lists.linux.dev,suse.de,arm.com,linux.dev,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com,linux-foundation.org];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.184];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer.local:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 39E8329B614
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU3VuLCBNYXIgMTUsIDIwMjYgYXQgMDc6MzI6NTRQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIEZyaSwgTWFyIDEzLCAyMDI2IGF0IDU6MDDigK9BTSBMb3JlbnpvIFN0
b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIE1h
ciAxMywgMjAyNiBhdCAwNDowNzo0M0FNIC0wNzAwLCBVc2FtYSBBcmlmIHdyb3RlOgo+ID4gPiBP
biBUaHUsIDEyIE1hciAyMDI2IDIwOjI3OjIwICswMDAwICJMb3JlbnpvIFN0b2FrZXMgKE9yYWNs
ZSkiIDxsanNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gQ29tbWl0IDlkNTQwM2Ix
MDM2YyAoImZzOiBjb252ZXJ0IG1vc3Qgb3RoZXIgZ2VuZXJpY19maWxlXyptbWFwKCkgdXNlcnMg
dG8KPiA+ID4gPiAubW1hcF9wcmVwYXJlKCkiKSB1cGRhdGVkIEFGUyB0byB1c2UgdGhlIG1tYXBf
cHJlcGFyZSBjYWxsYmFjayBpbiBmYXZvdXIgb2YKPiA+ID4gPiB0aGUgZGVwcmVjYXRlZCBtbWFw
IGNhbGxiYWNrLgo+ID4gPiA+Cj4gPiA+ID4gSG93ZXZlciwgaXQgZGlkIG5vdCBhY2NvdW50IGZv
ciB0aGUgZmFjdCB0aGF0IG1tYXBfcHJlcGFyZSBjYW4gZmFpbCB0byBtYXAKPiA+ID4gPiBkdWUg
dG8gYW4gb3V0IG9mIG1lbW9yeSBlcnJvciwgYW5kIHRodXMgc2hvdWxkIG5vdCBiZSBpbmNyZW1l
bnRpbmcgYQo+ID4gPiA+IHJlZmVyZW5jZSBjb3VudCBvbiBtbWFwX3ByZXBhcmUuCj4KPiBUaGlz
IGlzIGEgYml0IGNvbmZ1c2luZy4gSSBzZWUgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZG9l
cwo+IGFmc19hZGRfb3Blbl9tbWFwKCkgYW5kIHRoZW4gaWYgZ2VuZXJpY19maWxlX21tYXBfcHJl
cGFyZSgpIGZhaWxzIGl0Cj4gZG9lcyBhZnNfZHJvcF9vcGVuX21tYXAoKSwgdGhlcmVmb3JlIHJl
ZmNvdW50aW5nIHNlZW1zIHRvIGJlIGJhbGFuY2VkLgo+IElzIHRoZXJlIHJlYWxseSBhIHByb2Js
ZW0/CgpGaXJzdGx5LCBtbWFwX3ByZXBhcmUgaXMgaW52b2tlZCBiZWZvcmUgd2UgdHJ5IHRvIG1l
cmdlLCBzbyB0aGUgVk1BIGNvdWxkIGluCnRoZW9yeSBnZXQgbWVyZ2VkIGFuZCB0aGVuIHRoZSBy
ZWZjb3VudGluZyB3aWxsIGJlIHdyb25nLgoKU2Vjb25kbHksIG1tYXBfcHJlcGFyZSBvY2N1cnMg
YXQgc3VjaCBhdCB0aW1lIHdoZXJlIGl0IGlzIF9wb3NzaWJsZV8gdGhhdAphbGxvY2F0aW9uIGZh
aWx1cmVzIGFzIGRlc2NyaWJlZCBiZWxvdyBjb3VsZCBoYXBwZW4uCgpJJ2xsIHVwZGF0ZSB0aGUg
Y29tbWl0IG1lc3NhZ2UgdG8gcmVmbGVjdCB0aGUgbWVyZ2UgYXNwZWN0IGFjdHVhbGx5LgoKPgo+
ID4gPiA+Cj4gPiA+ID4gV2l0aCB0aGUgbmV3bHkgYWRkZWQgdm1fb3BzLT5tYXBwZWQgY2FsbGJh
Y2sgYXZhaWxhYmxlLCB3ZSBjYW4gc2ltcGx5IGRlZmVyCj4gPiA+ID4gdGhpcyBvcGVyYXRpb24g
dG8gdGhhdCBjYWxsYmFjayB3aGljaCBpcyBvbmx5IGludm9rZWQgb25jZSB0aGUgbWFwcGluZyBp
cwo+ID4gPiA+IHN1Y2Nlc3NmdWxseSBpbiBwbGFjZSAoYnV0IG5vdCB5ZXQgdmlzaWJsZSB0byB1
c2Vyc3BhY2UgYXMgdGhlIG1tYXAgYW5kIFZNQQo+ID4gPiA+IHdyaXRlIGxvY2tzIGFyZSBoZWxk
KS4KPiA+ID4gPgo+ID4gPiA+IFRoZXJlZm9yZSBhZGQgYWZzX21hcHBlZCgpIHRvIGltcGxlbWVu
dCB0aGlzIGNhbGxiYWNrIGZvciBBRlMuCj4gPiA+ID4KPiA+ID4gPiBJbiBwcmFjdGljZSB0aGUg
bWFwcGluZyBhbGxvY2F0aW9ucyBhcmUgJ3RvbyBzbWFsbCB0byBmYWlsJyBzbyB0aGlzIGlzCj4g
PiA+ID4gc29tZXRoaW5nIHRoYXQgcmVhbGlzdGljYWxseSBzaG91bGQgbmV2ZXIgaGFwcGVuIGlu
IHByYWN0aWNlIChvciB3b3VsZCBkbwo+ID4gPiA+IHNvIGluIGEgY2FzZSB3aGVyZSB0aGUgcHJv
Y2VzcyBpcyBhYm91dCB0byBkaWUgYW55d2F5KSwgYnV0IHdlIHNob3VsZCBzdGlsbAo+ID4gPiA+
IGhhbmRsZSB0aGlzLgo+Cj4gbml0OiBJIHdvdWxkIGRyb3AgdGhlIGFib3ZlIHBhcmFncmFwaC4g
SWYgaXQncyBpbXBvc3NpYmxlIHdoeSBhcmUgeW91Cj4gaGFuZGxpbmcgaXQ/IElmIGl0J3MgdW5s
aWtlbHksIHRoZW4gaGFuZGxpbmcgaXQgaXMgZXZlbiBtb3JlCj4gaW1wb3J0YW50LgoKU3VyZSBJ
IGNhbiBkcm9wIGl0LCBidXQgaXQncyBhbiBvbmdvaW5nIHRoaW5nIHdpdGggdGhlc2Ugc21hbGwg
YWxsb2NhdGlvbnMuCgpJIHdpc2ggd2UgY291bGQganVzdCBtb3ZlIHRvIGEgc2NlbmFyaW8gd2hl
cmUgd2UgY2FuIHNpbXB5IGFzc3VtZSBhbGxvY2F0aW9ucwp3aWxsIGFsd2F5cyBzdWNjZWVkIDop
CgpWbGFzdGEgLSB0aG91Z2h0cz8KCkNoZWVycywgTG9yZW56bwoKPgo+ID4gPiA+Cj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4K
PiA+ID4gPiAtLS0KPiA+ID4gPiAgZnMvYWZzL2ZpbGUuYyB8IDIwICsrKysrKysrKysrKysrKyst
LS0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2Fmcy9maWxlLmMgYi9mcy9hZnMv
ZmlsZS5jCj4gPiA+ID4gaW5kZXggZjYwOTM2NmZkMmFjLi42OWVmODZmNWUyNzQgMTAwNjQ0Cj4g
PiA+ID4gLS0tIGEvZnMvYWZzL2ZpbGUuYwo+ID4gPiA+ICsrKyBiL2ZzL2Fmcy9maWxlLmMKPiA+
ID4gPiBAQCAtMjgsNiArMjgsOCBAQCBzdGF0aWMgc3NpemVfdCBhZnNfZmlsZV9zcGxpY2VfcmVh
ZChzdHJ1Y3QgZmlsZSAqaW4sIGxvZmZfdCAqcHBvcywKPiA+ID4gPiAgc3RhdGljIHZvaWQgYWZz
X3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0ICphcmVhKTsKPiA+ID4gPiAgc3RhdGljIHZv
aWQgYWZzX3ZtX2Nsb3NlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqYXJlYSk7Cj4gPiA+ID4gIHN0
YXRpYyB2bV9mYXVsdF90IGFmc192bV9tYXBfcGFnZXMoc3RydWN0IHZtX2ZhdWx0ICp2bWYsIHBn
b2ZmX3Qgc3RhcnRfcGdvZmYsIHBnb2ZmX3QgZW5kX3Bnb2ZmKTsKPiA+ID4gPiArc3RhdGljIGlu
dCBhZnNfbWFwcGVkKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBwZ29m
Zl90IHBnb2ZmLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmaWxlICpm
aWxlLCB2b2lkICoqdm1fcHJpdmF0ZV9kYXRhKTsKPiA+ID4gPgo+ID4gPiA+ICBjb25zdCBzdHJ1
Y3QgZmlsZV9vcGVyYXRpb25zIGFmc19maWxlX29wZXJhdGlvbnMgPSB7Cj4gPiA+ID4gICAgIC5v
cGVuICAgICAgICAgICA9IGFmc19vcGVuLAo+ID4gPiA+IEBAIC02MSw2ICs2Myw3IEBAIGNvbnN0
IHN0cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgYWZzX2ZpbGVfYW9wcyA9IHsKPiA+ID4g
PiAgfTsKPiA+ID4gPgo+ID4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNf
c3RydWN0IGFmc192bV9vcHMgPSB7Cj4gPiA+ID4gKyAgIC5tYXBwZWQgICAgICAgICA9IGFmc19t
YXBwZWQsCj4gPiA+ID4gICAgIC5vcGVuICAgICAgICAgICA9IGFmc192bV9vcGVuLAo+ID4gPiA+
ICAgICAuY2xvc2UgICAgICAgICAgPSBhZnNfdm1fY2xvc2UsCj4gPiA+ID4gICAgIC5mYXVsdCAg
ICAgICAgICA9IGZpbGVtYXBfZmF1bHQsCj4gPiA+ID4gQEAgLTUwMCwxMyArNTAzLDIyIEBAIHN0
YXRpYyBpbnQgYWZzX2ZpbGVfbW1hcF9wcmVwYXJlKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2Mp
Cj4gPiA+ID4gICAgIGFmc19hZGRfb3Blbl9tbWFwKHZub2RlKTsKPiA+ID4KPiA+ID4gSXMgdGhl
IGFib3ZlIGFmc19hZGRfb3Blbl9tbWFwIGFuIGFkZGl0aW9uYWwgb25lLCB3aGljaCBjb3VsZCBj
YXVzZSBhIHJlZmVyZW5jZQo+ID4gPiBsZWFrPyBEb2VzIHRoZSBhYm92ZSBvbmUgbmVlZCB0byBi
ZSByZW1vdmVkIGFuZCBvbmx5IHRoZSBvbmUgaW4gYWZzX21hcHBlZCgpCj4gPiA+IG5lZWRzIHRv
IGJlIGtlcHQ/Cj4gPgo+ID4gQWggeWVhaCBnb29kIHNwb3QsIHdpbGwgZml4IHRoYW5rcyEKPiA+
Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAgICAgcmV0ID0gZ2VuZXJpY19maWxlX21tYXBfcHJlcGFy
ZShkZXNjKTsKPiA+ID4gPiAtICAgaWYgKHJldCA9PSAwKQo+ID4gPiA+IC0gICAgICAgICAgIGRl
c2MtPnZtX29wcyA9ICZhZnNfdm1fb3BzOwo+ID4gPiA+IC0gICBlbHNlCj4gPiA+ID4gLSAgICAg
ICAgICAgYWZzX2Ryb3Bfb3Blbl9tbWFwKHZub2RlKTsKPiA+ID4gPiArICAgaWYgKHJldCkKPiA+
ID4gPiArICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiA+ICsKPiA+ID4gPiArICAgZGVzYy0+
dm1fb3BzID0gJmFmc192bV9vcHM7Cj4gPiA+ID4gICAgIHJldHVybiByZXQ7Cj4gPiA+ID4gIH0K
PiA+ID4gPgo+ID4gPiA+ICtzdGF0aWMgaW50IGFmc19tYXBwZWQodW5zaWduZWQgbG9uZyBzdGFy
dCwgdW5zaWduZWQgbG9uZyBlbmQsIHBnb2ZmX3QgcGdvZmYsCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgY29uc3Qgc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKip2bV9wcml2YXRlX2RhdGEpCj4g
PiA+ID4gK3sKPiA+ID4gPiArICAgc3RydWN0IGFmc192bm9kZSAqdm5vZGUgPSBBRlNfRlNfSShm
aWxlX2lub2RlKGZpbGUpKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgIGFmc19hZGRfb3Blbl9tbWFw
KHZub2RlKTsKPiA+ID4gPiArICAgcmV0dXJuIDA7Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+
ID4gIHN0YXRpYyB2b2lkIGFmc192bV9vcGVuKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+
ID4gPiA+ICB7Cj4gPiA+ID4gICAgIGFmc19hZGRfb3Blbl9tbWFwKEFGU19GU19JKGZpbGVfaW5v
ZGUodm1hLT52bV9maWxlKSkpOwo+ID4gPiA+IC0tCj4gPiA+ID4gMi41My4wCj4gPiA+ID4KPiA+
ID4gPgo+ID4KPiA+IENoZWVycywgTG9yZW56bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
