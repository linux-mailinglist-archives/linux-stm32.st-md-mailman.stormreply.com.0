Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K9PGjhXuGmKcAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 20:17:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F360429FAC5
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 20:17:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A5FAC87EC5;
	Mon, 16 Mar 2026 19:17:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA8A5C87EC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 19:17:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A6F9060097;
 Mon, 16 Mar 2026 19:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7BCC19421;
 Mon, 16 Mar 2026 19:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773688628;
 bh=QyEpZlZG4opNA8anvj6G5Slo7c/FEhsWdlvBbfWACi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6V8nYcqmeDZKuY4zGNJ/3JO3CnU0d9efgyFdkVY7WSUNYIDhCTI9Db2OUNnvZkuV
 DJKNEIr0LVqkw7Qm+7/LNMZVIy2H6lZSikEMJxAeb3rC/4Ok0+/5T9pPdWx0hxlyfF
 YC9hu93u2F0y8eWR++ss1I+ojYbIFXoX/ZuREscW0OSdbh8qpKKHZ34v9W5/hiyDoR
 j6phsp0FGdk9ZAHp8Dp/oyzPLmvM0Lji+BhGIxnplEpsoKuFzNUNe28cRSEOmi6Zgz
 5pNsd9DGY8/zp1LM+egYfiwZmkjPSb7Ys/IvaCJPlZM7sDDRwMQVyAWIqyg9+q9N6f
 35RjXxG9KVfKA==
Date: Mon, 16 Mar 2026 19:16:56 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Message-ID: <6a0e73a5-519e-49ca-9f76-2f6cc5a1577c@lucifer.local>
References: <cover.1773346620.git.ljs@kernel.org>
 <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
 <CAJuCfpGd702=Xop3X5Aop9rrScdiAOQEEooTu1gcJqR9pmO5GA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpGd702=Xop3X5Aop9rrScdiAOQEEooTu1gcJqR9pmO5GA@mail.gmail.com>
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
 Vlastimil Babka <vbabka@kernel.org>, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Long Li <longli@microsoft.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, linux-afs@lists.infradead.org,
 Pedro Falcato <pfalcato@suse.de>, Ryan Roberts <ryan.roberts@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Christian Brauner <brauner@kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 02/15] mm: add documentation for the
 mmap_prepare file operation callback
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
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.co
 m,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com,linux-foundation.org];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.206];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer.local:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: F360429FAC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU3VuLCBNYXIgMTUsIDIwMjYgYXQgMDQ6MjM6MTRQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIFRodSwgTWFyIDEyLCAyMDI2IGF0IDE6MjfigK9QTSBMb3JlbnpvIFN0
b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBUaGlzIGRvY3Vt
ZW50YXRpb24gbWFrZXMgaXQgZWFzaWVyIGZvciBhIGRyaXZlci9maWxlIHN5c3RlbSBpbXBsZW1l
bnRlciB0bwo+ID4gY29ycmVjdGx5IHVzZSB0aGlzIGNhbGxiYWNrLgo+ID4KPiA+IEl0IGNvdmVy
cyB0aGUgZnVuZGFtZW50YWxzLCB3aGlsc3QgaW50ZW50aW9uYWxseSBsZWF2aW5nIHRoZSBsZXNz
IGxvdmVseQo+ID4gcG9zc2libGUgYWN0aW9ucyBvbmUgbWlnaHQgdGFrZSB1bmRvY3VtZW50ZWQg
KGZvciBpbnN0YW5jZSAtIHRoZQo+ID4gc3VjY2Vzc19ob29rLCBlcnJvcl9ob29rIGZpZWxkcyBp
biBtbWFwX2FjdGlvbikuCj4gPgo+ID4gVGhlIGRvY3VtZW50IGFsc28gY292ZXJzIHRoZSBuZXcg
Vk1BIGZsYWdzIGltcGxlbWVudGF0aW9uIHdoaWNoIGlzIHRoZSBvbmx5Cj4gPiBvbmUgd2hpY2gg
d2lsbCB3b3JrIGNvcnJlY3RseSB3aXRoIG1tYXBfcHJlcGFyZS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPgo+ID4gLS0tCj4g
PiAgRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9tbWFwX3ByZXBhcmUucnN0IHwgMTMxICsrKysr
KysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMzEgaW5zZXJ0aW9ucygrKQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL21tYXBfcHJl
cGFyZS5yc3QKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9t
bWFwX3ByZXBhcmUucnN0IGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9tbWFwX3ByZXBhcmUu
cnN0Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi43Njkw
ODIwMGYzYTEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZmlsZXN5
c3RlbXMvbW1hcF9wcmVwYXJlLnJzdAo+ID4gQEAgLTAsMCArMSwxMzEgQEAKPiA+ICsuLiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gKwo+ID4gKz09PT09PT09PT09PT09PT09
PT09PT09PT09PQo+ID4gK21tYXBfcHJlcGFyZSBjYWxsYmFjayBIT1dUTwo+ID4gKz09PT09PT09
PT09PT09PT09PT09PT09PT09PQo+ID4gKwo+ID4gK0ludHJvZHVjdGlvbgo+ID4gKyMjIyMjIyMj
IyMjIwo+ID4gKwo+ID4gK1RoZSBgc3RydWN0IGZpbGUtPmZfb3AtPm1tYXAoKWAgY2FsbGJhY2sg
aGFzIGJlZW4gZGVwcmVjYXRlZCBhcyBpdCBpcyBib3RoIGEKPiA+ICtzdGFiaWxpdHkgYW5kIHNl
Y3VyaXR5IHJpc2ssIGFuZCBkb2Vzbid0IGFsd2F5cyBwZXJtaXQgdGhlIG1lcmdpbmcgb2YgYWRq
YWNlbnQKPiA+ICttYXBwaW5ncyByZXN1bHRpbmcgaW4gdW5uZWNlc3NhcnkgbWVtb3J5IGZyYWdt
ZW50YXRpb24uCj4gPiArCj4gPiArSXQgaGFzIGJlZW4gcmVwbGFjZWQgd2l0aCB0aGUgYGZpbGUt
PmZfb3AtPm1tYXBfcHJlcGFyZSgpYCBjYWxsYmFjayB3aGljaCBzb2x2ZXMKPiA+ICt0aGVzZSBw
cm9ibGVtcy4KPiA+ICsKPiA+ICsjIyBIb3cgVG8gVXNlCj4gPiArCj4gPiArSW4geW91ciBkcml2
ZXIncyBgc3RydWN0IGZpbGVfb3BlcmF0aW9uc2Agc3RydWN0LCBzcGVjaWZ5IGFuIGBtbWFwX3By
ZXBhcmVgCj4gPiArY2FsbGJhY2sgcmF0aGVyIHRoYW4gYW4gYG1tYXBgIG9uZSwgZS5nLiBmb3Ig
ZXh0NDoKPiA+ICsKPiA+ICsKPiA+ICsuLiBjb2RlLWJsb2NrOjogQwo+ID4gKwo+ID4gKyAgICBj
b25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGV4dDRfZmlsZV9vcGVyYXRpb25zID0gewo+ID4g
KyAgICAgICAgLi4uCj4gPiArICAgICAgICAubW1hcF9wcmVwYXJlICAgID0gZXh0NF9maWxlX21t
YXBfcHJlcGFyZSwKPiA+ICsgICAgfTsKPiA+ICsKPiA+ICtUaGlzIGhhcyBhIHNpZ25hdHVyZSBv
ZiBgaW50ICgqbW1hcF9wcmVwYXJlKShzdHJ1Y3Qgdm1fYXJlYV9kZXNjICopYC4KPiA+ICsKPiA+
ICtFeGFtaW5pbmcgdGhlIGBzdHJ1Y3Qgdm1fYXJlYV9kZXNjYCB0eXBlOgo+ID4gKwo+ID4gKy4u
IGNvZGUtYmxvY2s6OiBDCj4gPiArCj4gPiArICAgIHN0cnVjdCB2bV9hcmVhX2Rlc2Mgewo+ID4g
KyAgICAgICAgLyogSW1tdXRhYmxlIHN0YXRlLiAqLwo+ID4gKyAgICAgICAgY29uc3Qgc3RydWN0
IG1tX3N0cnVjdCAqY29uc3QgbW07Cj4gPiArICAgICAgICBzdHJ1Y3QgZmlsZSAqY29uc3QgZmls
ZTsgLyogTWF5IHZhcnkgZnJvbSB2bV9maWxlIGluIHN0YWNrZWQgY2FsbGVycy4gKi8KPiA+ICsg
ICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQ7Cj4gPiArICAgICAgICB1bnNpZ25lZCBsb25nIGVu
ZDsKPiA+ICsKPiA+ICsgICAgICAgIC8qIE11dGFibGUgZmllbGRzLiBQb3B1bGF0ZWQgd2l0aCBp
bml0aWFsIHN0YXRlLiAqLwo+ID4gKyAgICAgICAgcGdvZmZfdCBwZ29mZjsKPiA+ICsgICAgICAg
IHN0cnVjdCBmaWxlICp2bV9maWxlOwo+ID4gKyAgICAgICAgdm1hX2ZsYWdzX3Qgdm1hX2ZsYWdz
Owo+ID4gKyAgICAgICAgcGdwcm90X3QgcGFnZV9wcm90Owo+ID4gKwo+ID4gKyAgICAgICAgLyog
V3JpdGUtb25seSBmaWVsZHMuICovCj4gPiArICAgICAgICBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0
aW9uc19zdHJ1Y3QgKnZtX29wczsKPiA+ICsgICAgICAgIHZvaWQgKnByaXZhdGVfZGF0YTsKPiA+
ICsKPiA+ICsgICAgICAgIC8qIFRha2UgZnVydGhlciBhY3Rpb24/ICovCj4gPiArICAgICAgICBz
dHJ1Y3QgbW1hcF9hY3Rpb24gYWN0aW9uOwo+Cj4gU28sIGFjdGlvbiBzdGlsbCBiZWxvbmdzIHRv
IC8qIFdyaXRlLW9ubHkgZmllbGRzLiAqLyBzZWN0aW9uPyBUaGlzIGlzCj4gbml0cGlja3ksIGJ1
dCBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gaGF2ZSB0aGlzIGFzOgo+Cj4gICAgICAgICAvKiBXcml0
ZS1vbmx5IGZpZWxkcy4gKi8KPiAgICAgICAgIGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0
cnVjdCAqdm1fb3BzOwo+ICAgICAgICAgdm9pZCAqcHJpdmF0ZV9kYXRhOwo+ICAgICAgICAgc3Ry
dWN0IG1tYXBfYWN0aW9uIGFjdGlvbjsgLyogVGFrZSBmdXJ0aGVyIGFjdGlvbj8gKi8KCkFic29s
dXRlbHkgbm90LiBUaGlzIGZpZWxkIGlzIG5vdCB0byBiZSB3cml0dGVuIHRvIGJ5IHRoZSB1c2Vy
LgoKV2Ugc2FkbHkgaGF2ZSB0byBhbGxvdyBodWdldGxiIHRvIGRvIHNvbWUgaGFja3MsIGJ1dCB0
aGVzZSBhcmUgdGhpbmdzIHdlIGRvbid0CndhbnQgdG8gcG9pbnQgb3V0LgoKVXNlcnMgc2hvdWxk
IHVzZSBtbWFwX2FjdGlvbl94eHgoKSBmdW5jdGlvbnMuCgo+Cj4gPiArICAgIH07Cj4gPiArCj4g
PiArVGhpcyBpcyBzdHJhaWdodGZvcndhcmQgLSB5b3UgaGF2ZSBhbGwgdGhlIGZpZWxkcyB5b3Ug
bmVlZCB0byBzZXQgdXAgdGhlCj4gPiArbWFwcGluZywgYW5kIHlvdSBjYW4gdXBkYXRlIHRoZSBt
dXRhYmxlIGFuZCB3cml0YWJsZSBmaWVsZHMsIGZvciBpbnN0YW5jZToKPiA+ICsKPiA+ICsuLiBj
b2RlLWJsb2NrOjogQ3cKPiA+ICsKPiA+ICsgICAgc3RhdGljIGludCBleHQ0X2ZpbGVfbW1hcF9w
cmVwYXJlKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gPiArICAgIHsKPiA+ICsgICAgICAg
IGludCByZXQ7Cj4gPiArICAgICAgICBzdHJ1Y3QgZmlsZSAqZmlsZSA9IGRlc2MtPmZpbGU7Cj4g
PiArICAgICAgICBzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZmlsZS0+Zl9tYXBwaW5nLT5ob3N0Owo+
ID4gKwo+ID4gKyAgICAgICAgLi4uCj4gPiArCj4gPiArICAgICAgICBmaWxlX2FjY2Vzc2VkKGZp
bGUpOwo+ID4gKyAgICAgICAgaWYgKElTX0RBWChmaWxlX2lub2RlKGZpbGUpKSkgewo+ID4gKyAg
ICAgICAgICAgIGRlc2MtPnZtX29wcyA9ICZleHQ0X2RheF92bV9vcHM7Cj4gPiArICAgICAgICAg
ICAgdm1hX2Rlc2Nfc2V0X2ZsYWdzKGRlc2MsIFZNQV9IVUdFUEFHRV9CSVQpOwo+ID4gKyAgICAg
ICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICBkZXNjLT52bV9vcHMgPSAmZXh0NF9maWxlX3Zt
X29wczsKPiA+ICsgICAgICAgIH0KPiA+ICsgICAgICAgIHJldHVybiAwOwo+ID4gKyAgICB9Cj4g
PiArCj4gPiArSW1wb3J0YW50bHksIHlvdSBubyBsb25nZXIgaGF2ZSB0byBkYW5jZSBhcm91bmQg
d2l0aCByZWZlcmVuY2UgY291bnRzIG9yIGxvY2tzCj4gPiArd2hlbiB1cGRhdGluZyB0aGVzZSBm
aWVsZHMgLSBfX3lvdSBjYW4gc2ltcGx5IGdvIGFoZWFkIGFuZCBjaGFuZ2UgdGhlbV9fLgo+ID4g
Kwo+ID4gK0V2ZXJ5dGhpbmcgaXMgdGFrZW4gY2FyZSBvZiBieSB0aGUgbWFwcGluZyBjb2RlLgo+
ID4gKwo+ID4gK1ZNQSBGbGFncwo+ID4gKz09PT09PT09PQo+ID4gKwo+ID4gK0Fsb25nIHdpdGgg
YG1tYXBfcHJlcGFyZWAsIFZNQSBmbGFncyBoYXZlIHVuZGVyZ29uZSBhbiBvdmVyaGF1bC4gV2hl
cmUgYmVmb3JlCj4gPiAreW91IHdvdWxkIGludm9rZSBvbmUgb2YgYHZtX2ZsYWdzX2luaXQoKWAs
IGB2bV9mbGFnc19yZXNldCgpYCwgYHZtX2ZsYWdzX3NldCgpYCwKPiA+ICtgdm1fZmxhZ3NfY2xl
YXIoKWAsIGFuZCBgdm1fZmxhZ3NfbW9kKClgIHRvIG1vZGlmeSBmbGFncyAoYW5kIHRvIGhhdmUg
dGhlCj4gPiArbG9ja2luZyBkb25lIGNvcnJlY3RseSBmb3IgeW91LCB0aGlzIGlzIG5vIGxvbmdl
ciBuZWNlc3NhcnkuCj4gPiArCj4gPiArQWxzbywgdGhlIGxlZ2FjeSBhcHByb2FjaCBvZiBzcGVj
aWZ5aW5nIFZNQSBmbGFncyB2aWEgYFZNX1JFQURgLCBgVk1fV1JJVEVgLAo+ID4gK2V0Yy4gLSBp
LmUuIHVzaW5nIGEgYFZNX3h4eGAgbWFjcm8gaGFzIGNoYW5nZWQgdG9vLgo+ID4gKwo+ID4gK1do
ZW4gaW1wbGVtZW50aW5nIGBtbWFwX3ByZXBhcmUoKWAsIHJlZmVyZW5jZSBmbGFncyBieSB0aGVp
ciBiaXQgbnVtYmVyLCBkZWZpbmVkCj4gPiArYXMgYSBgVk1BX3h4eF9CSVRgIG1hY3JvLCBlLmcu
IGBWTUFfUkVBRF9CSVRgLCBgVk1BX1dSSVRFX0JJVGAgZXRjLiwgYW5kIHVzZSBvbmUKPiA+ICtv
ZiAod2hlcmUgYGRlc2NgIGlzIGEgcG9pbnRlciB0byBgc3RydWN0IHZtYV9hcmVhX2Rlc2NgKToK
PiA+ICsKPiA+ICsqIGB2bWFfZGVzY190ZXN0X2ZsYWdzKGRlc2MsIC4uLilgIC0gU3BlY2lmeSBh
IGNvbW1hLXNlcGFyYXRlZCBsaXN0IG9mIGZsYWdzIHlvdQo+ID4gKyAgd2lzaCB0byB0ZXN0IGZv
ciAod2hldGhlciBfYW55XyBhcmUgc2V0KSwgZS5nLiAtIGB2bWFfZGVzY190ZXN0X2ZsYWdzKGRl
c2MsCj4gPiArICBWTUFfV1JJVEVfQklULCBWTUFfTUFZV1JJVEVfQklUKWAgLSByZXR1cm5zIGB0
cnVlYCBpZiBlaXRoZXIgYXJlIHNldCwKPiA+ICsgIG90aGVyd2lzZSBgZmFsc2VgLgo+ID4gKyog
YHZtYV9kZXNjX3NldF9mbGFncyhkZXNjLCAuLi4pYCAtIFVwZGF0ZSB0aGUgVk1BIGRlc2NyaXB0
b3IgZmxhZ3MgdG8gc2V0Cj4gPiArICBhZGRpdGlvbmFsIGZsYWdzIHNwZWNpZmllZCBieSBhIGNv
bW1hLXNlcGFyYXRlZCBsaXN0LAo+ID4gKyAgZS5nLiAtIGB2bWFfZGVzY19zZXRfZmxhZ3MoZGVz
YywgVk1BX1BGTk1BUF9CSVQsIFZNQV9JT19CSVQpYC4KPiA+ICsqIGB2bWFfZGVzY19jbGVhcl9m
bGFncyhkZXNjLCAuLi4pYCAtIFVwZGF0ZSB0aGUgVk1BIGRlc2NyaXB0b3IgZmxhZ3MgdG8gY2xl
YXIKPiA+ICsgIGZsYWdzIHNwZWNpZmllZCBieSBhIGNvbW1hLXNlcGFyYXRlZCBsaXN0LCBlLmcu
IC0gYHZtYV9kZXNjX2NsZWFyX2ZsYWdzKGRlc2MsCj4gPiArICBWTUFfV1JJVEVfQklULCBWTUFf
TUFZV1JJVEVfQklUKWAuCj4gPiArCj4gPiArQWN0aW9ucwo+ID4gKz09PT09PT0KPiA+ICsKPiA+
ICtZb3UgY2FuIG5vdyB2ZXJ5IGVhc2lseSBoYXZlIGFjdGlvbnMgYmUgcGVyZm9ybWVkIHVwb24g
YSBtYXBwaW5nIG9uY2Ugc2V0IHVwIGJ5Cj4gPiArdXRpbGlzaW5nIHNpbXBsZSBoZWxwZXIgZnVu
Y3Rpb25zIGludm9rZWQgdXBvbiB0aGUgYHN0cnVjdCB2bV9hcmVhX2Rlc2NgCj4gPiArcG9pbnRl
ci4gVGhlc2UgYXJlOgo+ID4gKwo+ID4gKyogYG1tYXBfYWN0aW9uX3JlbWFwKClgIC0gUmVtYXBz
IGEgcmFuZ2UgY29uc2lzdGluZyBvbmx5IG9mIFBGTnMgZm9yIGEgc3BlY2lmaWMKPiA+ICsgIHJh
bmdlIHN0YXJ0aW5nIGEgdmlydHVhbCBhZGRyZXNzIGFuZCBQRk4gbnVtYmVyIG9mIGEgc2V0IHNp
emUuCj4gPiArCj4gPiArKiBgbW1hcF9hY3Rpb25fcmVtYXBfZnVsbCgpYCAtIFNhbWUgYXMgYG1t
YXBfYWN0aW9uX3JlbWFwKClgLCBvbmx5IHJlbWFwcyB0aGUKPiA+ICsgIGVudGlyZSBtYXBwaW5n
IGZyb20gYHN0YXJ0X3BmbmAgb253YXJkLgo+ID4gKwo+ID4gKyogYG1tYXBfYWN0aW9uX2lvcmVt
YXAoKWAgLSBTYW1lIGFzIGBtbWFwX2FjdGlvbl9yZW1hcCgpYCwgb25seSBwZXJmb3JtcyBhbiBJ
L08KPiA+ICsgIHJlbWFwLgo+ID4gKwo+ID4gKyogYG1tYXBfYWN0aW9uX2lvcmVtYXBfZnVsbCgp
YCAtIFNhbWUgYXMgYG1tYXBfYWN0aW9uX2lvcmVtYXAoKWAsIG9ubHkgcmVtYXBzCj4gPiArICB0
aGUgZW50aXJlIG1hcHBpbmcgZnJvbSBgc3RhcnRfcGZuYCBvbndhcmQuCj4gPiArCj4gPiArKipO
T1RFOioqIFRoZSAnYWN0aW9uJyBmaWVsZCBzaG91bGQgbmV2ZXIgbm9ybWFsbHkgYmUgbWFuaXB1
bGF0ZWQgZGlyZWN0bHksCj4gPiArcmF0aGVyIHlvdSBvdWdodCB0byB1c2Ugb25lIG9mIHRoZXNl
IGhlbHBlcnMuCj4KPiBJJ20gZ3Vlc3NpbmcgdGhlIHN0YXJ0IGFuZCBzaXplIHBhcmFtZXRlcnMg
cGFzc2VkIHRvCj4gbW1hcF9hY3Rpb25fcmVtYXAoKSBhbmQgc3VjaCBhcmUgcmVzdHJpY3RlZCBi
eSB2bV9hcmVhX2Rlc2Muc3RhcnQKPiB2bV9hcmVhX2Rlc2MuZW5kLiBJZiBzbywgc2hvdWxkIHdl
IGRvY3VtZW50IHRob3NlIHJlc3RyaWN0aW9ucyBhbmQKPiBlbmZvcmNlIHRoZW0gaW4gdGhlIGNv
ZGU/CgpJIG1lYW4gaXQncyB0aGUgc2FtZSByZXN0cmljdGlvbnMgYXMgYWxsIG9mIHRoZSBmdW5j
dGlvbnMgYWxyZWFkeSBhcHBseSBpZiB5b3UKd2VyZSB0byB1c2UgdGhlbSB3aXRoIGEgVk1BIGRl
c2NyaXB0b3IuCgpJIHRoaW5rIGltcGxpY2l0bHkgYSByZW1hcCB3aWxsIGZhaWwgaWYgeW91IHRy
eSBpdCBvdXQgb2YgdGhlIFZNQSByYW5nZSBhdCB0aGUKcG9pbnQgb2YgYXBwbHlpbmcgdGhlIGNo
YW5nZS4KCkJ1dCBpdCBtaWdodCBiZSB3b3J0aCBhZGRpbmcgcmFuZ2VfaW5fdm1hX2Rlc2MoKSBj
aGVja3MgYXQgcHJlcGFyZSB0aW1lLCB3aWxsCnNlZSBpZiBJIGNhbiBkbyB0aGF0IGZvciB0aGUg
cmVzcGluLgoKSSB0aGluayBpdCdzIHByZXR0eSBvYnZpb3VzIHRoYXQgeW91IHNob3VsZG4ndCBi
ZSB0cnlpbmcgdG8gcmVtYXAgdG90YWxseQp1bnJlbGF0ZWQgbWVtb3J5LCBzbyBJJ20gbm90IHN1
cmUgdGhhdCdzIGF0IGEgbGV2ZWwgb2YgZ3JhbnVsYXJpdHkgdGhhdCdzIHN1aXRlZAp0byB0aGlz
IGRvY3VtZW50IHRob3VnaC4KCj4KPiA+ICsgICAgc3RydWN0IHZtX2FyZWFfZGVzYyB7Cj4gPiAr
ICAgICAgICAvKiBJbW11dGFibGUgc3RhdGUuICovCj4gPiArICAgICAgICBjb25zdCBzdHJ1Y3Qg
bW1fc3RydWN0ICpjb25zdCBtbTsKPiA+ICsgICAgICAgIHN0cnVjdCBmaWxlICpjb25zdCBmaWxl
OyAvKiBNYXkgdmFyeSBmcm9tIHZtX2ZpbGUgaW4gc3RhY2tlZCBjYWxsZXJzLiAqLwo+ID4gKyAg
ICAgICAgdW5zaWduZWQgbG9uZyBzdGFydDsKPiA+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5k
Owo+Cj4KPiA+IC0tCj4gPiAyLjUzLjAKPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
