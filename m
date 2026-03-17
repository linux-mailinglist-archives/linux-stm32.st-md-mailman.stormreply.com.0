Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDf2N6kXuWmzqAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 09:58:17 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB162A6209
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 09:58:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17785C87EC5;
	Tue, 17 Mar 2026 08:58:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E078C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 08:58:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4329D40C49;
 Tue, 17 Mar 2026 08:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0D5C2BCB6;
 Tue, 17 Mar 2026 08:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773737894;
 bh=6555lE8Eqz4VdrShTAZB8tLmpI5/NfoZfhGSGsRo30Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jK3J4jIDbHMCKrxQ+OjUgrUordb9Xw/krWi+plO21PkM4j44mP8jyUr0+L6Gs8K54
 3+hgkwVbgGjfrOruLgVyuttzaOPX/kP+WAWxiOzWMmNRwEJfgcT1aOb+x9THjCaONq
 W9tloCz+rbEOI7JtI6nvRrRf2D+/xm5SN0ksYzj8cK9AxVC7/LC8vX5ZIQjB8gYlTe
 Ws0eHBg1CWeRLxy89UpcLRszfQD6r867MrcFbjb+4b6l6NGjIPmb/YlGHORmMA2O/9
 FjMkQioxd3ZmUvzvbV0gDNR0yAshhPSjBnl+NHW2jaZPx63xqVGFwCmPgqjWPZC4k5
 khapcITUoXimg==
Date: Tue, 17 Mar 2026 08:58:02 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Message-ID: <679f8190-752a-4b0c-ab5e-635938169cab@lucifer.local>
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev>
 <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
 <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
 <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
 <CAJuCfpH2XyAJOFKCZnviVV_UbF4O0wzj3QgJieo+LD=Cvr71jA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpH2XyAJOFKCZnviVV_UbF4O0wzj3QgJieo+LD=Cvr71jA@mail.gmail.com>
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
	NEURAL_SPAM(0.00)[0.224];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer.local:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 6FB162A6209
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMDg6NDE6NDhQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIE1vbiwgTWFyIDE2LCAyMDI2IGF0IDc6MjnigK9BTSBMb3JlbnpvIFN0
b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTdW4sIE1h
ciAxNSwgMjAyNiBhdCAwNzozMjo1NFBNIC0wNzAwLCBTdXJlbiBCYWdoZGFzYXJ5YW4gd3JvdGU6
Cj4gPiA+IE9uIEZyaSwgTWFyIDEzLCAyMDI2IGF0IDU6MDDigK9BTSBMb3JlbnpvIFN0b2FrZXMg
KE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwg
TWFyIDEzLCAyMDI2IGF0IDA0OjA3OjQzQU0gLTA3MDAsIFVzYW1hIEFyaWYgd3JvdGU6Cj4gPiA+
ID4gPiBPbiBUaHUsIDEyIE1hciAyMDI2IDIwOjI3OjIwICswMDAwICJMb3JlbnpvIFN0b2FrZXMg
KE9yYWNsZSkiIDxsanNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPiBD
b21taXQgOWQ1NDAzYjEwMzZjICgiZnM6IGNvbnZlcnQgbW9zdCBvdGhlciBnZW5lcmljX2ZpbGVf
Km1tYXAoKSB1c2VycyB0bwo+ID4gPiA+ID4gPiAubW1hcF9wcmVwYXJlKCkiKSB1cGRhdGVkIEFG
UyB0byB1c2UgdGhlIG1tYXBfcHJlcGFyZSBjYWxsYmFjayBpbiBmYXZvdXIgb2YKPiA+ID4gPiA+
ID4gdGhlIGRlcHJlY2F0ZWQgbW1hcCBjYWxsYmFjay4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
SG93ZXZlciwgaXQgZGlkIG5vdCBhY2NvdW50IGZvciB0aGUgZmFjdCB0aGF0IG1tYXBfcHJlcGFy
ZSBjYW4gZmFpbCB0byBtYXAKPiA+ID4gPiA+ID4gZHVlIHRvIGFuIG91dCBvZiBtZW1vcnkgZXJy
b3IsIGFuZCB0aHVzIHNob3VsZCBub3QgYmUgaW5jcmVtZW50aW5nIGEKPiA+ID4gPiA+ID4gcmVm
ZXJlbmNlIGNvdW50IG9uIG1tYXBfcHJlcGFyZS4KPiA+ID4KPiA+ID4gVGhpcyBpcyBhIGJpdCBj
b25mdXNpbmcuIEkgc2VlIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGRvZXMKPiA+ID4gYWZz
X2FkZF9vcGVuX21tYXAoKSBhbmQgdGhlbiBpZiBnZW5lcmljX2ZpbGVfbW1hcF9wcmVwYXJlKCkg
ZmFpbHMgaXQKPiA+ID4gZG9lcyBhZnNfZHJvcF9vcGVuX21tYXAoKSwgdGhlcmVmb3JlIHJlZmNv
dW50aW5nIHNlZW1zIHRvIGJlIGJhbGFuY2VkLgo+ID4gPiBJcyB0aGVyZSByZWFsbHkgYSBwcm9i
bGVtPwo+ID4KPiA+IEZpcnN0bHksIG1tYXBfcHJlcGFyZSBpcyBpbnZva2VkIGJlZm9yZSB3ZSB0
cnkgdG8gbWVyZ2UsIHNvIHRoZSBWTUEgY291bGQgaW4KPiA+IHRoZW9yeSBnZXQgbWVyZ2VkIGFu
ZCB0aGVuIHRoZSByZWZjb3VudGluZyB3aWxsIGJlIHdyb25nLgo+Cj4gSSBzZWUgbm93LiBPaywg
bWFrZXMgc2Vuc2UuCj4KPiA+Cj4gPiBTZWNvbmRseSwgbW1hcF9wcmVwYXJlIG9jY3VycyBhdCBz
dWNoIGF0IHRpbWUgd2hlcmUgaXQgaXMgX3Bvc3NpYmxlXyB0aGF0Cj4gPiBhbGxvY2F0aW9uIGZh
aWx1cmVzIGFzIGRlc2NyaWJlZCBiZWxvdyBjb3VsZCBoYXBwZW4uCj4KPiBSaWdodCwgYnV0IGlu
IHRoYXQgY2FzZSBhZnNfZmlsZV9tbWFwX3ByZXBhcmUoKSB3b3VsZCBkcm9wIGl0cwo+IHJlZmNv
dW50IGFuZCByZXR1cm4gYW4gZXJyb3IsIHNvIHJlZmNvdW50aW5nIGlzIHN0aWxsIGdvb2QsIG5v
PwoKTm9wZSwgaW4gX19tbWFwX3JlZ2lvbigpOgoKY2FsbF9tbWFwX3ByZXBhcmUoKQotPiBfX21t
YXBfbmV3X3ZtYSgpCnZtX2FyZWFfYWxsb2MoKSAtPiBjYW4gZmFpbAp2bWFfaXRlcl9wcmVhbGxv
YygpIC0+IGNhbiBmYWlsCl9fbW1hcF9uZXdfZmlsZV92bWEoKSAvIHNobWVtX3plcm9fc2V0dXAo
KSAtPiBjYW4gZmFpbAoKSWYgYW55IG9mIHRob3NlIGZhaWwgdGhlIFZNQSBpcyBub3QgZXZlbiBz
ZXQgdXAsIHNvIG5vIGNsb3NlKCkgd2lsbCBiZSBjYWxsZWQKYmVjYXVzZSB0aGVyZSdzIG5vIFZN
QSB0byBjYWxsIGNsb3NlIG9uLgoKVGhpcyBpcyB3aGF0IG1ha2VzIG1tYXBfcHJlcGFyZSB2ZXJ5
IGRpZmZlcmVudCBmcm9tIG1tYXAgd2hpY2ggcGFzc2VzIGluIChhCnBhcnRpYWxseSBlc3RhYmxp
c2hlZCkgVk1BLgoKVGhhdCBhbmQgb2YgY291cnNlIGEgcG90ZW50aWFsIG1lcmdlIHdvdWxkIG1l
YW4gYW55IHJlZmNvdW50IGluY3JlbWVudCB3b3VsZCBiZQp3cm9uZy4KCj4KPiA+Cj4gPiBJJ2xs
IHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gcmVmbGVjdCB0aGUgbWVyZ2UgYXNwZWN0IGFj
dHVhbGx5Lgo+Cj4gVGhhbmtzIQoKWW91J3JlIHdlbGNvbWUsIGFuZCBkb25lIGluIHYyIDopCgo+
Cj4gPgo+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBXaXRoIHRoZSBuZXdseSBhZGRlZCB2
bV9vcHMtPm1hcHBlZCBjYWxsYmFjayBhdmFpbGFibGUsIHdlIGNhbiBzaW1wbHkgZGVmZXIKPiA+
ID4gPiA+ID4gdGhpcyBvcGVyYXRpb24gdG8gdGhhdCBjYWxsYmFjayB3aGljaCBpcyBvbmx5IGlu
dm9rZWQgb25jZSB0aGUgbWFwcGluZyBpcwo+ID4gPiA+ID4gPiBzdWNjZXNzZnVsbHkgaW4gcGxh
Y2UgKGJ1dCBub3QgeWV0IHZpc2libGUgdG8gdXNlcnNwYWNlIGFzIHRoZSBtbWFwIGFuZCBWTUEK
PiA+ID4gPiA+ID4gd3JpdGUgbG9ja3MgYXJlIGhlbGQpLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBUaGVyZWZvcmUgYWRkIGFmc19tYXBwZWQoKSB0byBpbXBsZW1lbnQgdGhpcyBjYWxsYmFjayBm
b3IgQUZTLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJbiBwcmFjdGljZSB0aGUgbWFwcGluZyBh
bGxvY2F0aW9ucyBhcmUgJ3RvbyBzbWFsbCB0byBmYWlsJyBzbyB0aGlzIGlzCj4gPiA+ID4gPiA+
IHNvbWV0aGluZyB0aGF0IHJlYWxpc3RpY2FsbHkgc2hvdWxkIG5ldmVyIGhhcHBlbiBpbiBwcmFj
dGljZSAob3Igd291bGQgZG8KPiA+ID4gPiA+ID4gc28gaW4gYSBjYXNlIHdoZXJlIHRoZSBwcm9j
ZXNzIGlzIGFib3V0IHRvIGRpZSBhbnl3YXkpLCBidXQgd2Ugc2hvdWxkIHN0aWxsCj4gPiA+ID4g
PiA+IGhhbmRsZSB0aGlzLgo+ID4gPgo+ID4gPiBuaXQ6IEkgd291bGQgZHJvcCB0aGUgYWJvdmUg
cGFyYWdyYXBoLiBJZiBpdCdzIGltcG9zc2libGUgd2h5IGFyZSB5b3UKPiA+ID4gaGFuZGxpbmcg
aXQ/IElmIGl0J3MgdW5saWtlbHksIHRoZW4gaGFuZGxpbmcgaXQgaXMgZXZlbiBtb3JlCj4gPiA+
IGltcG9ydGFudC4KPiA+Cj4gPiBTdXJlIEkgY2FuIGRyb3AgaXQsIGJ1dCBpdCdzIGFuIG9uZ29p
bmcgdGhpbmcgd2l0aCB0aGVzZSBzbWFsbCBhbGxvY2F0aW9ucy4KPiA+Cj4gPiBJIHdpc2ggd2Ug
Y291bGQganVzdCBtb3ZlIHRvIGEgc2NlbmFyaW8gd2hlcmUgd2UgY2FuIHNpbXB5IGFzc3VtZSBh
bGxvY2F0aW9ucwo+ID4gd2lsbCBhbHdheXMgc3VjY2VlZCA6KQo+Cj4gVGhhdCB3b3VsZCBiZSBy
ZWFsbHkgbmljZSBidXQgdW5mb3J0dW5hdGVseSB0aGUgd29ybGQgaXMgbm90IHRoYXQKPiBwZXJm
ZWN0LiBJIGp1c3QgZG9uJ3Qgd2FudCB0byBiZSBjaGFzaW5nIHNvbWUgcmFyZWx5IHJlcHJvZHVj
aWJsZSBidWcKPiBiZWNhdXNlIG9mIHRoZSBhc3N1bXB0aW9uIHRoYXQgYW4gYWxsb2NhdGlvbiBp
cyB0b28gc21hbGwgdG8gZmFpbC4KCkkgbWVhbiBJIGFncmVlLCB3ZSBzaG91bGQgaGFuZGxlIGFs
bCBlcnJvciBwYXRocy4KCkNoZWVycywgTG9yZW56bwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
