Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJBUKvvYuGmjkAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 05:30:51 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AD12A39CC
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 05:30:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC280C87ED8;
	Tue, 17 Mar 2026 04:30:50 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CAB9C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 04:30:49 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-5091ed02c54so192391cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 21:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773721848; cv=none;
 d=google.com; s=arc-20240605;
 b=gfMy6Bi+TXoZv/7hzA/qvwXPaAD/9riXxLeat10qUEPozPjkQuzrTJscOwRHxoROLR
 lYMrwYOwaH74qfcaq8xoluvgQ1U5VMf47hHKy//lozl8klAOFPtM4qW/WIuDCvLWOtPz
 HzC2gfuixUnhcEI+qmUnCoqNkSkVL6+kEWY/RBwWLd/96rMIE5AXI1KFKP2UoTzxAsAr
 0A86XM2YXZsuUGlJ8yV/vtnQvj8J9pTJnl5pN2S/16gVAyZ891Y/BPRdSlTWQ7KhjDLO
 tq3RRKiA+/EPIvQfkJEmXJOlfZu5kepTfWUmpQ09mjNwIsq+BSgRB9WW1Yacg2CGFmsP
 uzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
 fh=yQyk4SKki0jm1306mVvQO65y1bHyeXmh7+lpguBlt3I=;
 b=LQUKlfgXeB0JbI/9IEzXl3ptLeSqgGlKTUIN9CmrofbR5ZatvVvlvY03SFR0zS30aU
 CCrog0eGtTnZCnzyeE9z+5ochNF7Wi2dk+worcQp4ys7Fx+vRLX//EwE/UeftKkJixO7
 I0/nM21/kGIMsEa9LEijn2XrmIbnXMW0FcVehLkYVVjGlcHeqRYMaMtAESZNGbMI86gQ
 J/y9hkmX3OcStrnqfzZMBJg99717p3EBOP+I/O+ELDJRec1BdC3XSbA7u6bTNCLSQlBU
 7FZr8Pu6obi25GJ3ThwuWcQi6K7gT0nH9OhV1wskR0ujSe4p8wwKpMNgCPcBGrib7XUx
 Kn8A==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773721848; x=1774326648;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
 b=Uhjh5uREntnPYotGIVspOjD+T82KcLw9eq8Lfa4mYXohS5UPDV5x+2dRcMJJhyo8nK
 nEdy9SA/f48rlu6MENVS8qiSEqk4Wr7Y0+8YE0tGRe4F4cOxAm/j4wRi12rO6DA2RdMG
 oM3ug/5jDgzA9mVPJWkdDY2XvGwJqvMEnhn7COpaPkvWXLxIisPICq2e+ClEbQCLb/lN
 vP1yDF1ZHBtF3HUbOaKtoH1FYjok0In5Oy2i/GHy/M3scUofiXdE9YxwN37MfmePrZzm
 0kGTCSmHZMZisbpFlujz6ElhLm71xeAm5aJDamajrmrkWUNq9Z8OM8srVxP0P7/ViqBW
 sW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773721848; x=1774326648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
 b=m+1sWtuk0rxza7E+REVd96N3By/5LyOnRn8us4W9p9JYH9kQkryzH/QV8JOy7JP3ks
 mqo8Rl6j7QC/q4UTE1VLccaNQYqin4Ner7JHpgB0bysklmcZGc8+z+luCyAulwPcx25l
 XNbIsB6jDBvgz6LlLSIllQ0vQPO2EwEHK5zsHWeK68vNo2BvQDdW5dIO4wXYRrMKJLmy
 VTTePdIQNtmQjDv1bUlKa3+dwqSOY+ZS5AvevcStxYB2j8zn+7IyWqgvg5wqm65klu/S
 VXXKFi3tMRVeN+wImMBu6WiYuTGURh2dD2Ewe5/7M/rxcmNyOIX4IdoVGgElUkib5r5s
 mjhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVizGo/5A5D54CCF6NnO+8WAPmA2P9E4GaGtxnrxBwM/N9/uVYp6VuNTsfzcW8wxEmfM/nSDDldMdtSeg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy0rBXeMSTvAGbLXYI1an4Y19C3NHjzhMYMBS1YBWGJNAxCehnb
 oxiV/Gj7iTKsIDXvLVQGFWDSkuzYmt8m34R/lBHzv/jKpxfbAMEkehuZKncxROdQofSfddiSJzB
 jqf09B9lwSN0OY8OXH56xaE8wenIRRj56xlVq6y52
X-Gm-Gg: ATEYQzxIBfZwnJKVa6qgeSdh/SveV+tn7PeluFlNs0lfD/eICjDIR1BzGYuI3nU0SdK
 HxUvES4dC5ndnR0XqotZ9LnjwV456Ocbv4HZDrYvkICYW8PL/RCuIhpLooFq8xiIQcDMuJnSlbO
 9NSZFrFp2aVQynCCBxsoA6e1g4x6XHbBXzN4Xu0CO72w9OlPQ9LDinzLP0/WeKopIWjHbNq3Vf8
 TOHrrpGMNjmji+7nNws1V2SH7LSgMqNQvEr5F9J/plF16GhQgtecIu+tqM05aRXTNJN9gLyHOHh
 +bT58w==
X-Received: by 2002:a05:622a:1b92:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-50998c190femr8741161cf.2.1773721847648; Mon, 16 Mar 2026
 21:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org>
 <77fbdae93f250fa1551f3052fc9034739795ff20.1773695307.git.ljs@kernel.org>
In-Reply-To: <77fbdae93f250fa1551f3052fc9034739795ff20.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 21:30:36 -0700
X-Gm-Features: AaiRm50ZCLTl3QDNivnPnY48qRQMsgXcmE9SOEgt_D7vDyjlZ8af9f8bQZf6tcw
Message-ID: <CAJuCfpFdKjix2fEdZ7iSrd_nk4-5e7EUNAoCEgUc5snKzq-3Cg@mail.gmail.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH v2 07/16] misc: open-dice: replace
 deprecated mmap hook with mmap_prepare
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
X-Spamd-Result: default: False [6.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[google.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_SENDER(0.00)[surenb@google.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m
 :linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[google.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com,linux-foundation.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.979];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 53AD12A39CC
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxM+KAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIGZfb3AtPm1tYXAgaW50ZXJmYWNlIGlz
IGRlcHJlY2F0ZWQsIHNvIHVwZGF0ZSBkcml2ZXIgdG8gdXNlIGl0cwo+IHN1Y2Nlc3NvciwgbW1h
cF9wcmVwYXJlLgo+Cj4gVGhlIGRyaXZlciBwcmV2aW91c2x5IHVzZWQgdm1faW9tYXBfbWVtb3J5
KCksIHNvIHRoaXMgY2hhbmdlIHJlcGxhY2VzIGl0Cj4gd2l0aCBpdHMgbW1hcF9wcmVwYXJlIGVx
dWl2YWxlbnQsIG1tYXBfYWN0aW9uX3NpbXBsZV9pb3JlbWFwKCkuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6
IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBkcml2ZXJz
L21pc2Mvb3Blbi1kaWNlLmMgfCAxOSArKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWlzYy9vcGVuLWRpY2UuYyBiL2RyaXZlcnMvbWlzYy9vcGVuLWRpY2UuYwo+IGluZGV4
IDI0YzI5ZTBmMDBlZi4uNDUwNjBmYjRlYTI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWlzYy9v
cGVuLWRpY2UuYwo+ICsrKyBiL2RyaXZlcnMvbWlzYy9vcGVuLWRpY2UuYwo+IEBAIC04NiwyOSAr
ODYsMzIgQEAgc3RhdGljIHNzaXplX3Qgb3Blbl9kaWNlX3dyaXRlKHN0cnVjdCBmaWxlICpmaWxw
LCBjb25zdCBjaGFyIF9fdXNlciAqcHRyLAo+ICAvKgo+ICAgKiBDcmVhdGVzIGEgbWFwcGluZyBv
ZiB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbiBpbiB1c2VyIGFkZHJlc3Mgc3BhY2UuCj4gICAq
Lwo+IC1zdGF0aWMgaW50IG9wZW5fZGljZV9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiArc3RhdGljIGludCBvcGVuX2RpY2VfbW1hcF9wcmVwYXJl
KHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gIHsKPiArICAgICAgIHN0cnVjdCBmaWxlICpm
aWxwID0gZGVzYy0+ZmlsZTsKPiAgICAgICAgIHN0cnVjdCBvcGVuX2RpY2VfZHJ2ZGF0YSAqZHJ2
ZGF0YSA9IHRvX29wZW5fZGljZV9kcnZkYXRhKGZpbHApOwo+Cj4gLSAgICAgICBpZiAodm1hLT52
bV9mbGFncyAmIFZNX01BWVNIQVJFKSB7Cj4gKyAgICAgICBpZiAodm1hX2Rlc2NfdGVzdChkZXNj
LCBWTUFfTUFZU0hBUkVfQklUKSkgewo+ICAgICAgICAgICAgICAgICAvKiBEbyBub3QgYWxsb3cg
dXNlcnNwYWNlIHRvIG1vZGlmeSB0aGUgdW5kZXJseWluZyBkYXRhLiAqLwo+IC0gICAgICAgICAg
ICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZNX1dSSVRFKQo+ICsgICAgICAgICAgICAgICBpZiAo
dm1hX2Rlc2NfdGVzdChkZXNjLCBWTUFfV1JJVEVfQklUKSkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVQRVJNOwo+ICAgICAgICAgICAgICAgICAvKiBFbnN1cmUgdXNlcnNwYWNl
IGNhbm5vdCBhY3F1aXJlIFZNX1dSSVRFIGxhdGVyLiAqLwo+IC0gICAgICAgICAgICAgICB2bV9m
bGFnc19jbGVhcih2bWEsIFZNX01BWVdSSVRFKTsKPiArICAgICAgICAgICAgICAgdm1hX2Rlc2Nf
Y2xlYXJfZmxhZ3MoZGVzYywgVk1BX01BWVdSSVRFX0JJVCk7Cj4gICAgICAgICB9Cj4KPiAgICAg
ICAgIC8qIENyZWF0ZSB3cml0ZS1jb21iaW5lIG1hcHBpbmcgc28gYWxsIGNsaWVudHMgb2JzZXJ2
ZSBhIHdpcGUuICovCj4gLSAgICAgICB2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF93cml0ZWNv
bWJpbmUodm1hLT52bV9wYWdlX3Byb3QpOwo+IC0gICAgICAgdm1fZmxhZ3Nfc2V0KHZtYSwgVk1f
RE9OVENPUFkgfCBWTV9ET05URFVNUCk7Cj4gLSAgICAgICByZXR1cm4gdm1faW9tYXBfbWVtb3J5
KHZtYSwgZHJ2ZGF0YS0+cm1lbS0+YmFzZSwgZHJ2ZGF0YS0+cm1lbS0+c2l6ZSk7Cj4gKyAgICAg
ICBkZXNjLT5wYWdlX3Byb3QgPSBwZ3Byb3Rfd3JpdGVjb21iaW5lKGRlc2MtPnBhZ2VfcHJvdCk7
Cj4gKyAgICAgICB2bWFfZGVzY19zZXRfZmxhZ3MoZGVzYywgVk1BX0RPTlRDT1BZX0JJVCwgVk1B
X0RPTlREVU1QX0JJVCk7Cj4gKyAgICAgICBtbWFwX2FjdGlvbl9zaW1wbGVfaW9yZW1hcChkZXNj
LCBkcnZkYXRhLT5ybWVtLT5iYXNlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZHJ2ZGF0YS0+cm1lbS0+c2l6ZSk7Cj4gKyAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIG9wZW5fZGljZV9mb3BzID0gewo+ICAg
ICAgICAgLm93bmVyID0gVEhJU19NT0RVTEUsCj4gICAgICAgICAucmVhZCA9IG9wZW5fZGljZV9y
ZWFkLAo+ICAgICAgICAgLndyaXRlID0gb3Blbl9kaWNlX3dyaXRlLAo+IC0gICAgICAgLm1tYXAg
PSBvcGVuX2RpY2VfbW1hcCwKPiArICAgICAgIC5tbWFwX3ByZXBhcmUgPSBvcGVuX2RpY2VfbW1h
cF9wcmVwYXJlLAo+ICB9Owo+Cj4gIHN0YXRpYyBpbnQgX19pbml0IG9wZW5fZGljZV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+IC0tCj4gMi41My4wCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
