Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNZaLkMUuGl/YwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 15:31:31 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D4E29B6A5
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 15:31:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16A4FC87ED8;
	Mon, 16 Mar 2026 14:31:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA6D2C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 14:31:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8023760018;
 Mon, 16 Mar 2026 14:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC85CC19421;
 Mon, 16 Mar 2026 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773671488;
 bh=wmwRlESgrnvepPbb1PirkwNJB9yCJFViHuseAPzZgTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1MvHmFeTMXLS17UDbf4qKWdxfdfl1nIIM1Znjt/hB9Jrz7XpIjRGeKs/GgD5HbmT
 GJnoLBvTQBD3mLyiQNYu/uMaiNpDmAFyJZxaGwL4kth9NMa+7N8pWmipLI9MOUnNIm
 XZuQWf4hbnuJkGt5El0XdUQ+XGEEEj/ffydaRt0U7/71pqXpi7xrliHkFxDB3ruYpx
 nd8CvutsY0NcvbrtfRvTcx8uB1G0uZ0HoUdnCcCHmTSa8GQRX3yC4bOT9X7R/YGAmG
 CL3fSgSn9uu67vMXPRuf0GENu4YKm6u93U51R6SiQiRnK+y3zr8woWQTM2An6cXIJn
 BxJKdQaXB4REg==
Date: Mon, 16 Mar 2026 14:31:17 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Message-ID: <fdc193c6-483e-4e8e-8813-fa71d984bfb1@lucifer.local>
References: <cover.1773346620.git.ljs@kernel.org>
 <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
 <CAJuCfpHVN66abFrJgorXKBsjv7Ut=CP-E4NpLMC4SW613tJwtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpHVN66abFrJgorXKBsjv7Ut=CP-E4NpLMC4SW613tJwtw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 03/15] mm: document
 vm_operations_struct->open the same as close()
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	NEURAL_SPAM(0.00)[0.113];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lucifer.local:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 63D4E29B6A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU3VuLCBNYXIgMTUsIDIwMjYgYXQgMDU6NDM6NDFQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIFRodSwgTWFyIDEyLCAyMDI2IGF0IDE6MjfigK9QTSBMb3JlbnpvIFN0
b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBEZXNjcmliZSB3
aGVuIHRoZSBvcGVyYXRpb24gaXMgaW52b2tlZCBhbmQgdGhlIGNvbnRleHQgaW4gd2hpY2ggaXQg
aXMKPiA+IGludm9rZWQsIG1hdGNoaW5nIHRoZSBkZXNjcmlwdGlvbiBhbHJlYWR5IGFkZGVkIGZv
ciB2bV9vcC0+Y2xvc2UoKS4KPiA+Cj4gPiBXaGlsZSB3ZSdyZSBoZXJlLCB1cGRhdGUgYWxsIG91
dGRhdGVkIHJlZmVyZW5jZXMgdG8gYW4gJ2FyZWEnIGZpZWxkIGZvcgo+ID4gVk1BcyB0byB0aGUg
bW9yZSBjb25zaXN0ZW50ICd2bWEnLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3Rv
YWtlcyAoT3JhY2xlKSA8bGpzQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4
L21tLmggfCAxNSArKysrKysrKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gPiBpbmRleCBjYzU5NjBhODQzODIuLjEyYTBi
NGM2MzczNiAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAo+ID4gKysrIGIvaW5j
bHVkZS9saW51eC9tbS5oCj4gPiBAQCAtNzQ4LDE1ICs3NDgsMjAgQEAgc3RydWN0IHZtX3VmZmRf
b3BzOwo+ID4gICAqIHRvIHRoZSBmdW5jdGlvbnMgY2FsbGVkIHdoZW4gYSBuby1wYWdlIG9yIGEg
d3AtcGFnZSBleGNlcHRpb24gb2NjdXJzLgo+ID4gICAqLwo+ID4gIHN0cnVjdCB2bV9vcGVyYXRp
b25zX3N0cnVjdCB7Cj4gPiAtICAgICAgIHZvaWQgKCpvcGVuKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKiBhcmVhKTsKPiA+ICsgICAgICAgLyoqCj4gPiArICAgICAgICAqIEBvcGVuOiBDYWxsZWQg
d2hlbiBhIFZNQSBpcyByZW1hcHBlZCBvciBzcGxpdC4gTm90IGNhbGxlZCB1cG9uIGZpcnN0Cj4g
PiArICAgICAgICAqIG1hcHBpbmcgYSBWTUEuCj4KPiBJdCdzIGFsc28gY2FsbGVkIGZyb20gZHVw
X21tYXAoKSB3aGljaCBpcyBwYXJ0IG9mIGZvcmtpbmcuCgpBaCB5dXAgOikgd2lsbCB1cGRhdGUg
dGhhbmtzIQoKPgo+ID4gKyAgICAgICAgKiBDb250ZXh0OiBVc2VyIGNvbnRleHQuICBNYXkgc2xl
ZXAuICBDYWxsZXIgaG9sZHMgbW1hcF9sb2NrLgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAg
dm9pZCAoKm9wZW4pKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiA+ICAgICAgICAgLyoq
Cj4gPiAgICAgICAgICAqIEBjbG9zZTogQ2FsbGVkIHdoZW4gdGhlIFZNQSBpcyBiZWluZyByZW1v
dmVkIGZyb20gdGhlIE1NLgo+ID4gICAgICAgICAgKiBDb250ZXh0OiBVc2VyIGNvbnRleHQuICBN
YXkgc2xlZXAuICBDYWxsZXIgaG9sZHMgbW1hcF9sb2NrLgo+ID4gICAgICAgICAgKi8KPiA+IC0g
ICAgICAgdm9pZCAoKmNsb3NlKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiBhcmVhKTsKPiA+ICsg
ICAgICAgdm9pZCAoKmNsb3NlKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gPiAgICAg
ICAgIC8qIENhbGxlZCBhbnkgdGltZSBiZWZvcmUgc3BsaXR0aW5nIHRvIGNoZWNrIGlmIGl0J3Mg
YWxsb3dlZCAqLwo+ID4gLSAgICAgICBpbnQgKCptYXlfc3BsaXQpKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqYXJlYSwgdW5zaWduZWQgbG9uZyBhZGRyKTsKPiA+IC0gICAgICAgaW50ICgqbXJlbWFw
KShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKmFyZWEpOwo+ID4gKyAgICAgICBpbnQgKCptYXlfc3Bs
aXQpKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIpOwo+ID4g
KyAgICAgICBpbnQgKCptcmVtYXApKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiA+ICAg
ICAgICAgLyoKPiA+ICAgICAgICAgICogQ2FsbGVkIGJ5IG1wcm90ZWN0KCkgdG8gbWFrZSBkcml2
ZXItc3BlY2lmaWMgcGVybWlzc2lvbgo+ID4gICAgICAgICAgKiBjaGVja3MgYmVmb3JlIG1wcm90
ZWN0KCkgaXMgZmluYWxpc2VkLiAgIFRoZSBWTUEgbXVzdCBub3QKPiA+IEBAIC03NjgsNyArNzcz
LDcgQEAgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHsKPiA+ICAgICAgICAgdm1fZmF1bHRf
dCAoKmh1Z2VfZmF1bHQpKHN0cnVjdCB2bV9mYXVsdCAqdm1mLCB1bnNpZ25lZCBpbnQgb3JkZXIp
Owo+ID4gICAgICAgICB2bV9mYXVsdF90ICgqbWFwX3BhZ2VzKShzdHJ1Y3Qgdm1fZmF1bHQgKnZt
ZiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHBnb2ZmX3Qgc3RhcnRfcGdvZmYsIHBnb2Zm
X3QgZW5kX3Bnb2ZmKTsKPiA+IC0gICAgICAgdW5zaWduZWQgbG9uZyAoKnBhZ2VzaXplKShzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiBhcmVhKTsKPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyAoKnBh
Z2VzaXplKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gPgo+ID4gICAgICAgICAvKiBu
b3RpZmljYXRpb24gdGhhdCBhIHByZXZpb3VzbHkgcmVhZC1vbmx5IHBhZ2UgaXMgYWJvdXQgdG8g
YmVjb21lCj4gPiAgICAgICAgICAqIHdyaXRhYmxlLCBpZiBhbiBlcnJvciBpcyByZXR1cm5lZCBp
dCB3aWxsIGNhdXNlIGEgU0lHQlVTICovCj4gPiAtLQo+ID4gMi41My4wCj4gPgoKQ2hlZXJzLCBM
b3JlbnpvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
