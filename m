Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCEIAbq9uWnJMQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 21:46:50 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0B2B260E
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 21:46:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F805C8F262;
	Tue, 17 Mar 2026 20:46:49 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C320C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 20:46:48 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-5091ed02c54so60281cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 13:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773780407; cv=none;
 d=google.com; s=arc-20240605;
 b=U3OpyLDgW08COTwpX2RXIUkg0Lt4j64ECkzmnKisNwpA2B0mVQaKXFESghQ+rq5RCQ
 yyXjmO2O2fJnpy7ZxbdtEO0gMWPEems3+6KajLN7m2BZoDie+wlhh5SQ9Z6VoSWqUTKZ
 /7Rjchu+BZNJAp1APiqENToZgaxNRqTg8x6WfhMmcf1/7jaUADdQtm4D1k15HT0KaAQo
 qeCGutnTIcyRtbyDdgZsy6J1MHdxvBXqhdocMtEWDMfBJvb6hqhCLNiJI5uIUVMRa+lf
 byeV1m6ZwePeIc2AMNMM3AClXFb8oPD/Ss2svZw6CLl5P7JwU7UtTe9Z6qGdQnTooYE8
 rftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
 fh=uJu/FEn2f57fsFoJ6i2zVN90KmpcdR9d0sLDqIRg8J0=;
 b=RuDDCXOsSQvA9y9mRV9cdMgM24siy0fJ+MtKz3UxQ6m40t7WTSxOkqARubF0soYpLo
 xHA/fJH+RLZmWfpv5FVDMOreTBNPUh6282rRUmuRcNc1vNkZbmEE692EIaQ3Q76BzxK7
 b8fZH0a/tnP2AMOXXgDG+iVScM3ABnv1gkGqyOnzkDV8h22RpmconCLk261EMr5V5Cr0
 vsN7sfHTuA0z6DS8DDumsPOdCb2dCo7dfhEiXwUPi/gMbXAzRYEb7GEUeUpEpxH+7fwr
 2TjU07EC6ijKEbVtB/OSO0uv6JBj4gDwSzm6lKuvavgcgscbYA9x4djPetdfQWkhpill
 9geg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773780407; x=1774385207;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
 b=eY5VgTw1/7Tljp7KXLSAAmZlhG4unk2AO3qeSvMVr4gNMR9d3GKXVBuB5rgN3xwItU
 Ha9jDMMjsMwRbvuF5BcLMuzKKCKwv/tSEd563WHCPbLoXy39aY+40rYraUhcjRoiaLkv
 z1P0XKY69ksgAlv29yNgzYgV1ktXn0sdek2+rHWvEEkaNo4xZujwLflQ1Xi8xppPOFjr
 df43rV8REDM4ok9Q8D5aBcUSyLgJDTJBLgxseANm784C32XhkNAXOnME2Jy0aZ4rgOIh
 uFibHV8Mc4EhLW+6M9P+ttWoC/t4PQGW32GVUHDK7FcjX51kD8kVdYKHfBEjefCi6n9q
 rHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773780407; x=1774385207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=puh87Pmz2QIedt98QmYFqHshzK8OJIco1FTLmkjNO+s=;
 b=FzbCZWBP8t9z8T+UANHk3iPSUdznfbJvQXisl6rovS6yResIj1BSYMRYAs3f3OQ2R6
 I0CPhTs9iLv1QkzE9ZOMR2kTKZPK53B4CWIkg01rJycQTGLySqunPxz7EMNQ5rorCtqE
 dGCvd5DtWhgkad71Jv7rJfqwD2etUCDlmd/5uAUFFnwyFovpZp6w/5wOtQ0tshcJbmON
 3EvV9k624cLDm3QSE4B1Ym6zEBEFnZ2U1cKcVnkIWhV0WoyIY7Rl6UNxkrzCnuVBU6wj
 yIwNo1PteZmqM7JXUPkNu9zOXcI0jzHvHawQ+9HpvFF1dsBdGnPPSDuMQOGfhqRFG7jZ
 tKJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUufXjoJJHW5HMbW3kZrxvq2kQc0WtxRCNxwKDf70gpASgZiI5mONZhfXu5lGVP1sKB/eAVNSLfmatpFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1unDKdRm3rZInOsqZb8S8cgk3xx7Bv1yGipidoAX7fwzlBIA5
 llFgPmXZ+P4drmui9RwVhYNyG0ILTf0IZZ6IYC/zUhbGRzoB6vQmSVf0X3jrQ0PmxOYLIOTiQwV
 gdoUL04iMVmCACdAQ7TEOYOwgNcvD+kXFSdQ27zYQ
X-Gm-Gg: ATEYQzxtFKUKQmd3GfeBlYKvS03HE2kRQpwSF7jo7APslfl1Po4xQAoolMNmGsCJwd5
 EjT0qPuAn4m5l0EFSTHPtQBpygPf37k5pXKZiFR386YYREmMAZdwNR7OECrrYxzet+Gc45mUbwo
 tO8DTkHTr9rfhB3Oz7UDbaC4pXpAiSf/VamxBTpK8pphURjqT/7Z/ODwwCidsB6GWRDbnmOewyY
 hMV2hjkUt0OI0h0RQh6Vk8R30eLLGGoWDmQlPNBIek6XjAgkh505HoPqUg0N/eYLFzRJ4E9uAya
 k6T9ONYlYlkvAqQHNtRBH+3UhLtVJLdhR+AXLg==
X-Received: by 2002:a05:622a:130f:b0:509:371:f2ab with SMTP id
 d75a77b69052e-50b14848d70mr3924821cf.16.1773780406374; Tue, 17 Mar 2026
 13:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org>
 <d34056a65bd387286f4e155d52449106ddc99f78.1773695307.git.ljs@kernel.org>
In-Reply-To: <d34056a65bd387286f4e155d52449106ddc99f78.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Mar 2026 13:46:34 -0700
X-Gm-Features: AaiRm50ZSv0JOBEsyaTpLpUZLAlSOUqng_UaLNmSO0lPuUbLHyEvRlv0uikpAUM
Message-ID: <CAJuCfpH653zdE=mXArpx8BUszVVC1PoN+rvp+WxdM3aAUbpqRw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 10/16] stm: replace deprecated mmap
	hook with mmap_prepare
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
	NEURAL_SPAM(0.00)[0.977];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 8FB0B2B260E
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxNOKAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIGZfb3AtPm1tYXAgaW50ZXJmYWNlIGlz
IGRlcHJlY2F0ZWQsIHNvIHVwZGF0ZSBkcml2ZXIgdG8gdXNlIGl0cwo+IHN1Y2Nlc3NvciwgbW1h
cF9wcmVwYXJlLgo+Cj4gVGhlIGRyaXZlciBwcmV2aW91c2x5IHVzZWQgdm1faW9tYXBfbWVtb3J5
KCksIHNvIHRoaXMgY2hhbmdlIHJlcGxhY2VzIGl0Cj4gd2l0aCBpdHMgbW1hcF9wcmVwYXJlIGVx
dWl2YWxlbnQsIG1tYXBfYWN0aW9uX3NpbXBsZV9pb3JlbWFwKCkuCj4KPiBBbHNvLCBpbiBvcmRl
ciB0byBjb3JyZWN0bHkgbWFpbnRhaW4gcmVmZXJlbmNlIGNvdW50aW5nLCBhZGQgYQo+IHZtX29w
cy0+bWFwcGVkIGNhbGxiYWNrIHRvIGluY3JlbWVudCB0aGUgcmVmZXJlbmNlIGNvdW50IHdoZW4g
c3VjY2Vzc2Z1bGx5Cj4gbWFwcGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2Vz
IChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5
YW4gPHN1cmVuYkBnb29nbGUuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9od3RyYWNpbmcvc3RtL2Nv
cmUuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaHd0cmFjaW5nL3N0bS9jb3JlLmMgYi9kcml2ZXJzL2h3dHJhY2luZy9zdG0vY29yZS5j
Cj4gaW5kZXggMzc1ODRlNzg2YmI1Li5mNDhjNmE4YTA2NTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9od3RyYWNpbmcvc3RtL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb3Jl
LmMKPiBAQCAtNjY2LDYgKzY2NiwxNiBAQCBzdGF0aWMgc3NpemVfdCBzdG1fY2hhcl93cml0ZShz
dHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBfX3VzZXIgKmJ1ZiwKPiAgICAgICAgIHJldHVy
biBjb3VudDsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgc3RtX21tYXBfbWFwcGVkKHVuc2lnbmVkIGxv
bmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBwZ29mZl90IHBnb2ZmLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICoqdm1fcHJpdmF0
ZV9kYXRhKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qgc3RtX2ZpbGUgKnN0bWYgPSBmaWxlLT5wcml2
YXRlX2RhdGE7Cj4gKyAgICAgICBzdHJ1Y3Qgc3RtX2RldmljZSAqc3RtID0gc3RtZi0+c3RtOwo+
ICsKPiArICAgICAgIHBtX3J1bnRpbWVfZ2V0X3N5bmMoJnN0bS0+ZGV2KTsKPiArICAgICAgIHJl
dHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBzdG1fbW1hcF9vcGVuKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qgc3RtX2ZpbGUgKnN0bWYgPSB2
bWEtPnZtX2ZpbGUtPnByaXZhdGVfZGF0YTsKPiBAQCAtNjg0LDEyICs2OTQsMTQgQEAgc3RhdGlj
IHZvaWQgc3RtX21tYXBfY2xvc2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gIH0KPgo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHN0bV9tbWFwX3Ztb3Bz
ID0gewo+ICsgICAgICAgLm1hcHBlZCA9IHN0bV9tbWFwX21hcHBlZCwKPiAgICAgICAgIC5vcGVu
ICAgPSBzdG1fbW1hcF9vcGVuLAo+ICAgICAgICAgLmNsb3NlICA9IHN0bV9tbWFwX2Nsb3NlLAo+
ICB9Owo+Cj4gLXN0YXRpYyBpbnQgc3RtX2NoYXJfbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gK3N0YXRpYyBpbnQgc3RtX2NoYXJfbW1hcF9wcmVw
YXJlKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gIHsKPiArICAgICAgIHN0cnVjdCBmaWxl
ICpmaWxlID0gZGVzYy0+ZmlsZTsKPiAgICAgICAgIHN0cnVjdCBzdG1fZmlsZSAqc3RtZiA9IGZp
bGUtPnByaXZhdGVfZGF0YTsKPiAgICAgICAgIHN0cnVjdCBzdG1fZGV2aWNlICpzdG0gPSBzdG1m
LT5zdG07Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUsIHBoeXM7Cj4gQEAgLTY5NywxMCAr
NzA5LDEwIEBAIHN0YXRpYyBpbnQgc3RtX2NoYXJfbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gICAgICAgICBpZiAoIXN0bS0+ZGF0YS0+bW1pb19h
ZGRyKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4KPiAtICAgICAgIGlm
ICh2bWEtPnZtX3Bnb2ZmKQo+ICsgICAgICAgaWYgKGRlc2MtPnBnb2ZmKQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPgo+IC0gICAgICAgc2l6ZSA9IHZtYS0+dm1fZW5kIC0gdm1h
LT52bV9zdGFydDsKPiArICAgICAgIHNpemUgPSB2bWFfZGVzY19zaXplKGRlc2MpOwo+Cj4gICAg
ICAgICBpZiAoc3RtZi0+b3V0cHV0Lm5yX2NoYW5zICogc3RtLT5kYXRhLT5zd19tbWlvc3ogIT0g
c2l6ZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gQEAgLTcxMiwxMyArNzI0
LDEyIEBAIHN0YXRpYyBpbnQgc3RtX2NoYXJfbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gICAgICAgICBpZiAoIXBoeXMpCj4gICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gLSAgICAgICBwbV9ydW50aW1lX2dldF9zeW5jKCZzdG0t
PmRldik7Cj4gLQo+IC0gICAgICAgdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVk
KHZtYS0+dm1fcGFnZV9wcm90KTsKPiAtICAgICAgIHZtX2ZsYWdzX3NldCh2bWEsIFZNX0lPIHwg
Vk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QKTsKPiAtICAgICAgIHZtYS0+dm1fb3BzID0gJnN0
bV9tbWFwX3Ztb3BzOwo+IC0gICAgICAgdm1faW9tYXBfbWVtb3J5KHZtYSwgcGh5cywgc2l6ZSk7
Cj4gKyAgICAgICBkZXNjLT5wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKGRlc2MtPnBhZ2Vf
cHJvdCk7Cj4gKyAgICAgICB2bWFfZGVzY19zZXRfZmxhZ3MoZGVzYywgVk1BX0lPX0JJVCwgVk1B
X0RPTlRFWFBBTkRfQklULAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIFZNQV9ET05URFVN
UF9CSVQpOwo+ICsgICAgICAgZGVzYy0+dm1fb3BzID0gJnN0bV9tbWFwX3Ztb3BzOwo+Cj4gKyAg
ICAgICBtbWFwX2FjdGlvbl9zaW1wbGVfaW9yZW1hcChkZXNjLCBwaHlzLCBzaXplKTsKPiAgICAg
ICAgIHJldHVybiAwOwo+ICB9Cj4KPiBAQCAtODM2LDcgKzg0Nyw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHN0bV9mb3BzID0gewo+ICAgICAgICAgLm9wZW4gICAgICAg
ICAgID0gc3RtX2NoYXJfb3BlbiwKPiAgICAgICAgIC5yZWxlYXNlICAgICAgICA9IHN0bV9jaGFy
X3JlbGVhc2UsCj4gICAgICAgICAud3JpdGUgICAgICAgICAgPSBzdG1fY2hhcl93cml0ZSwKPiAt
ICAgICAgIC5tbWFwICAgICAgICAgICA9IHN0bV9jaGFyX21tYXAsCj4gKyAgICAgICAubW1hcF9w
cmVwYXJlICAgPSBzdG1fY2hhcl9tbWFwX3ByZXBhcmUsCj4gICAgICAgICAudW5sb2NrZWRfaW9j
dGwgPSBzdG1fY2hhcl9pb2N0bCwKPiAgICAgICAgIC5jb21wYXRfaW9jdGwgICA9IGNvbXBhdF9w
dHJfaW9jdGwsCj4gIH07Cj4gLS0KPiAyLjUzLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
