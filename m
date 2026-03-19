Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MfbJxgUvGnbrwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 16:19:52 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3B12CD96A
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 16:19:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11B84C87ED5;
	Thu, 19 Mar 2026 15:19:52 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BB48C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 15:19:50 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-667365131b0so12343a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 08:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773933590; cv=none;
 d=google.com; s=arc-20240605;
 b=YmxFbA7eegGR9L7wR0TeQRvKLy7IMgXqOcYzLusfCShgvQo9m/cxGnBzKAtDUwv6W+
 MfEjorJd2fySx2r0Dse923nbXXusPHZWa9/p5KHV/6ki2DYMQyI409W7/oo32EG9bolG
 07NLHjoHLHHtSnR2KeR3BM96VrUhy+95TvHx8rt2k1vO3XTZZqn9c2keeDfreLJJqDT7
 vKyQNhgQVHaGD+hqrgaLfVXF6zZBERtOIS0Q9ktx8c29RVYpbKrF//vOJbRlgfekBaQ7
 hNTE9mCJOVx6b7w/CiIHeb8S4ym5JNryWjjeYX1/FilbkvHUfRKFw7ro9w9RB6ynXyQC
 X2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OfH8Q5Td26D2zz2vaWeEEQdnUyXBLu9cQNzXDyggGWs=;
 fh=CDOCas4LO0gYUr4j7JNud470RtS1GhNOv7hrBmZpwMw=;
 b=LhAMN+6YmaevsZjGON7UL584UC25ZxuiuqpzBxdMo/FyhooDiOaJEFqrnOpK77QuqD
 YUaOnVDtHDNcDVfBXjANS7QPfBbpZW3hUKxAlrGsnvrOKwoTCG0Zn9S9VoZnU0tcArrF
 S0tLqb4toFccILoNqVRiBQlCqXbdLr9ExoLcZbBC9FJpwH9gb3UWK3+klu7txMsz2gyN
 AOhju+PBNVaVEjsrj2BbTgg30qioFNPt88x5w/o2VoGBXB4MtAuRgZjGzZmOQTCi9OIH
 6OJZszsYukL6K2offJY15TbTiFpNLw7DWAhzsJRNQRYqToOIY8iN1zlEuPFwL7b0a5rv
 J/dA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773933590; x=1774538390;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OfH8Q5Td26D2zz2vaWeEEQdnUyXBLu9cQNzXDyggGWs=;
 b=S7KNscJLr91IqVuQ/8JbhU3u4XyrGs+HGgUsynAbE10Zgq11/gLbYPBwFjbSriKpzx
 4mZ5TR9pay4URsPcHbTqRVWhJai8U3L3txFU8IRF6Z/GseUwY0AOUvcJcpLKIhSFuIET
 05poKz3Eq3Ii+Ab+IY75T0rUE+HtQ4qEuh1F6xgP4w4vekYuaE2C6v1NG6azBuNoSb92
 k4xuuhMnL4aCfPmyJtbdYe7lbA2nBgHNKNtl0stmJ8G1pTaD3YuxnfISA7wXDtMGkgOf
 q3dcsIcZzjwOW2DV/9ZVN3qeXk+vNhY8YbWC4/Q6xNTBAHMKnA+84IAemmusFaSqlkIe
 Q18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773933590; x=1774538390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OfH8Q5Td26D2zz2vaWeEEQdnUyXBLu9cQNzXDyggGWs=;
 b=IaehB976hS0GoR6pciIssqqXIFGp+BdV2V9CXJouJ3Gi1TeW67prH+GIMM9xN+Zt+b
 RBn08tsRS7DimDk+tquxSNMt3UQT/9zxS8ZMl148OpLEC2YsAQyj7IZYW97Ic8Rbdo0t
 /Bhn9j2qKjJrNKTL1njRjsFQPhFj1dc+oPmmius5b0pwx/qdw4axsxNjyuF/wot1uVox
 G4NcXOgtBnHekMUQpI/i+b5zNEbLxKaV42EXv/C7DY9JjI5MEG+ODqjGBkcS0qhyzULS
 +7UstgQBfSVXzRUW2T3qB817o8ft22z7kcqxv+1+YAMwcr1dPWJJUUq5FEVbvomIn35Z
 z8uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHh0F3jTgcj3U1XLIezWVo7ORWuGNicvLvhZifnVxcOVnI+2ZCbkhk2ffRP17+/5gwdivdcJ1Q+hpp+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxzrSZ+lShB91QK1/mM2eZI27QH3RxDyl+juSLXlKSCuandrBez
 aH2ceRMRnvjLPFF8Wk835cvXyZ3I9uporDbJJ1qSxmY6irRluAcmfU3+5NdhtvC3Ad2NaCxn2Ci
 wbqLOB/zUMz+9ZigOz1chJ9cGmiQ5A/DEPNHsW33i
X-Gm-Gg: ATEYQzz4rO2Yr6uwC/MhvsjZlOyxXHPQTvKqyu7bZEUaUNBqQn3BcFczjPGm+yEHUMe
 UTf/UH4nWd7kZmkO4XGyqmswOw8rnqypctgkXSVCJKjUD5IbqvgJCC0f5uRd5ocB9BQLqfwIYRR
 xIq5VMx3Kl8AQ3SvrfqgOJY/426ItzjqeE91yL9xbuUe5TveLmZh7gAAqVjyB3L5IfYobzN/E9q
 J2FbQ7mMWpO0WVhCmnqiE3IhAf0oH29Jmd30XraeSnib7+0gFL0eR2ShqSo+gRGEM1D3whhcvpO
 5ZUruJoaN5HMC2TgZEUQnEDrZhWxOrrixjVC
X-Received: by 2002:a05:6402:46c5:b0:665:d39:4b18 with SMTP id
 4fb4d7f45d1cf-66852d6c8abmr48783a12.8.1773933589136; Thu, 19 Mar 2026
 08:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org>
 <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
 <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
 <CAJuCfpE5qZmi43EeZiRcy78pD6YvJb5n_xnoUJfwEjomowu0=A@mail.gmail.com>
 <8cdad898-b306-40fe-a367-efe7147f83b9@lucifer.local>
 <CAJuCfpHXqtxZr5s84jCcz513a2pgMeDoobsLBJH9pSON49cM+w@mail.gmail.com>
In-Reply-To: <CAJuCfpHXqtxZr5s84jCcz513a2pgMeDoobsLBJH9pSON49cM+w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 19 Mar 2026 08:19:35 -0700
X-Gm-Features: AaiRm51bFJ7jnCWExjTkTJWtl61x7cY-2jhtQRDi8xxndWDLsjo0Sko90eA6oXU
Message-ID: <CAJuCfpG4F7r=AMTBRkazFeQsnKocu9OPFyV2TsQccLQc=oLwNA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 11/16] staging: vme_user: replace
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	NEURAL_SPAM(0.00)[0.881];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4B3B12CD96A
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgODoxOeKAr0FNIFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3Vy
ZW5iQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXIgMTksIDIwMjYgYXQgNzo1NeKA
r0FNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4K
PiA+IE9uIFR1ZSwgTWFyIDE3LCAyMDI2IGF0IDAyOjMyOjE2UE0gLTA3MDAsIFN1cmVuIEJhZ2hk
YXNhcnlhbiB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgMjoyNuKAr1BNIFN1
cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+
ID4gT24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxNOKAr1BNIExvcmVuem8gU3RvYWtlcyAoT3Jh
Y2xlKSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBmX29w
LT5tbWFwIGludGVyZmFjZSBpcyBkZXByZWNhdGVkLCBzbyB1cGRhdGUgZHJpdmVyIHRvIHVzZSBp
dHMKPiA+ID4gPiA+IHN1Y2Nlc3NvciwgbW1hcF9wcmVwYXJlLgo+ID4gPiA+ID4KPiA+ID4gPiA+
IFRoZSBkcml2ZXIgcHJldmlvdXNseSB1c2VkIHZtX2lvbWFwX21lbW9yeSgpLCBzbyB0aGlzIGNo
YW5nZSByZXBsYWNlcyBpdAo+ID4gPiA+ID4gd2l0aCBpdHMgbW1hcF9wcmVwYXJlIGVxdWl2YWxl
bnQsIG1tYXBfYWN0aW9uX3NpbXBsZV9pb3JlbWFwKCkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gRnVu
Y3Rpb25zIHRoYXQgd3JhcCBtbWFwKCkgYXJlIGFsc28gY29udmVydGVkIHRvIHdyYXAgbW1hcF9w
cmVwYXJlKCkKPiA+ID4gPiA+IGluc3RlYWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQWxzbyB1cGRh
dGUgdGhlIGRvY3VtZW50YXRpb24gYWNjb3JkaW5nbHkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4KClJl
dmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgoKPiA+ID4g
PiA+IC0tLQo+ID4gPiA+ID4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92bWUucnN0ICAgIHwg
IDIgKy0KPiA+ID4gPiA+ICBkcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmMgICAgICB8IDIw
ICsrKysrLS0tLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZS5oICAg
ICAgfCAgMiArLQo+ID4gPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5j
IHwgNTEgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPiA+ID4gPiA+ICA0IGZpbGVzIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4KPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdm1lLnJzdCBiL0RvY3Vt
ZW50YXRpb24vZHJpdmVyLWFwaS92bWUucnN0Cj4gPiA+ID4gPiBpbmRleCBjMGI0NzUzNjlkZTAu
LjcxMTE5OTlhYmMxNCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVy
LWFwaS92bWUucnN0Cj4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdm1l
LnJzdAo+ID4gPiA+ID4gQEAgLTEwNyw3ICsxMDcsNyBAQCBUaGUgZnVuY3Rpb24gOmM6ZnVuYzpg
dm1lX21hc3Rlcl9yZWFkYCBjYW4gYmUgdXNlZCB0byByZWFkIGZyb20gYW5kCj4gPiA+ID4gPgo+
ID4gPiA+ID4gIEluIGFkZGl0aW9uIHRvIHNpbXBsZSByZWFkcyBhbmQgd3JpdGVzLCA6YzpmdW5j
OmB2bWVfbWFzdGVyX3Jtd2AgaXMgcHJvdmlkZWQgdG8KPiA+ID4gPiA+ICBkbyBhIHJlYWQtbW9k
aWZ5LXdyaXRlIHRyYW5zYWN0aW9uLiBQYXJ0cyBvZiBhIFZNRSB3aW5kb3cgY2FuIGFsc28gYmUg
bWFwcGVkCj4gPiA+ID4gPiAtaW50byB1c2VyIHNwYWNlIG1lbW9yeSB1c2luZyA6YzpmdW5jOmB2
bWVfbWFzdGVyX21tYXBgLgo+ID4gPiA+ID4gK2ludG8gdXNlciBzcGFjZSBtZW1vcnkgdXNpbmcg
OmM6ZnVuYzpgdm1lX21hc3Rlcl9tbWFwX3ByZXBhcmVgLgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiAgU2xhdmUgd2luZG93cwo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy92bWVfdXNlci92bWUuYyBiL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUuYwo+ID4g
PiA+ID4gaW5kZXggZjEwYTAwYzA1ZjEyLi43MjIwYWJhN2I5MTkgMTAwNjQ0Cj4gPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvc3RhZ2luZy92bWVfdXNlci92bWUuYwo+ID4gPiA+ID4gQEAgLTczNSw5ICs3MzUsOSBAQCB1
bnNpZ25lZCBpbnQgdm1lX21hc3Rlcl9ybXcoc3RydWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2Us
IHVuc2lnbmVkIGludCBtYXNrLAo+ID4gPiA+ID4gIEVYUE9SVF9TWU1CT0wodm1lX21hc3Rlcl9y
bXcpOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAvKioKPiA+ID4gPiA+IC0gKiB2bWVfbWFzdGVyX21t
YXAgLSBNbWFwIHJlZ2lvbiBvZiBWTUUgbWFzdGVyIHdpbmRvdy4KPiA+ID4gPiA+ICsgKiB2bWVf
bWFzdGVyX21tYXBfcHJlcGFyZSAtIE1tYXAgcmVnaW9uIG9mIFZNRSBtYXN0ZXIgd2luZG93Lgo+
ID4gPiA+ID4gICAqIEByZXNvdXJjZTogUG9pbnRlciB0byBWTUUgbWFzdGVyIHJlc291cmNlLgo+
ID4gPiA+ID4gLSAqIEB2bWE6IFBvaW50ZXIgdG8gZGVmaW5pdGlvbiBvZiB1c2VyIG1hcHBpbmcu
Cj4gPiA+ID4gPiArICogQGRlc2M6IFBvaW50ZXIgdG8gZGVzY3JpcHRvciBvZiB1c2VyIG1hcHBp
bmcuCj4gPiA+ID4gPiAgICoKPiA+ID4gPiA+ICAgKiBNZW1vcnkgbWFwIGEgcmVnaW9uIG9mIHRo
ZSBWTUUgbWFzdGVyIHdpbmRvdyBpbnRvIHVzZXIgc3BhY2UuCj4gPiA+ID4gPiAgICoKPiA+ID4g
PiA+IEBAIC03NDUsMTIgKzc0NSwxMyBAQCBFWFBPUlRfU1lNQk9MKHZtZV9tYXN0ZXJfcm13KTsK
PiA+ID4gPiA+ICAgKiAgICAgICAgIHJlc291cmNlIG9yIC1FRkFVTFQgaWYgbWFwIGV4Y2VlZHMg
d2luZG93IHNpemUuIE90aGVyIGdlbmVyaWMgbW1hcAo+ID4gPiA+ID4gICAqICAgICAgICAgZXJy
b3JzIG1heSBhbHNvIGJlIHJldHVybmVkLgo+ID4gPiA+ID4gICAqLwo+ID4gPiA+ID4gLWludCB2
bWVfbWFzdGVyX21tYXAoc3RydWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2UsIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKQo+ID4gPiA+ID4gK2ludCB2bWVfbWFzdGVyX21tYXBfcHJlcGFyZShz
dHJ1Y3Qgdm1lX3Jlc291cmNlICpyZXNvdXJjZSwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ID4gPiA+ID4gIHsKPiA+ID4g
PiA+ICsgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyB2bWFfc2l6ZSA9IHZtYV9kZXNjX3NpemUo
ZGVzYyk7Cj4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCB2bWVfYnJpZGdlICpicmlkZ2UgPSBmaW5k
X2JyaWRnZShyZXNvdXJjZSk7Cj4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCB2bWVfbWFzdGVyX3Jl
c291cmNlICppbWFnZTsKPiA+ID4gPiA+ICAgICAgICAgcGh5c19hZGRyX3QgcGh5c19hZGRyOwo+
ID4gPiA+ID4gLSAgICAgICB1bnNpZ25lZCBsb25nIHZtYV9zaXplOwo+ID4gPiA+ID4KPiA+ID4g
PiA+ICAgICAgICAgaWYgKHJlc291cmNlLT50eXBlICE9IFZNRV9NQVNURVIpIHsKPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICBkZXZfZXJyKGJyaWRnZS0+cGFyZW50LCAiTm90IGEgbWFzdGVyIHJl
c291cmNlXG4iKTsKPiA+ID4gPiA+IEBAIC03NTgsMTkgKzc1OSwxOCBAQCBpbnQgdm1lX21hc3Rl
cl9tbWFwKHN0cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSkKPiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAg
aW1hZ2UgPSBsaXN0X2VudHJ5KHJlc291cmNlLT5lbnRyeSwgc3RydWN0IHZtZV9tYXN0ZXJfcmVz
b3VyY2UsIGxpc3QpOwo+ID4gPiA+ID4gLSAgICAgICBwaHlzX2FkZHIgPSBpbWFnZS0+YnVzX3Jl
c291cmNlLnN0YXJ0ICsgKHZtYS0+dm1fcGdvZmYgPDwgUEFHRV9TSElGVCk7Cj4gPiA+ID4gPiAt
ICAgICAgIHZtYV9zaXplID0gdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0Owo+ID4gPiA+ID4g
KyAgICAgICBwaHlzX2FkZHIgPSBpbWFnZS0+YnVzX3Jlc291cmNlLnN0YXJ0ICsgKGRlc2MtPnBn
b2ZmIDw8IFBBR0VfU0hJRlQpOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgaWYgKHBoeXNf
YWRkciArIHZtYV9zaXplID4gaW1hZ2UtPmJ1c19yZXNvdXJjZS5lbmQgKyAxKSB7Cj4gPiA+ID4g
PiAgICAgICAgICAgICAgICAgZGV2X2VycihicmlkZ2UtPnBhcmVudCwgIk1hcCBzaXplIGNhbm5v
dCBleGNlZWQgdGhlIHdpbmRvdyBzaXplXG4iKTsKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVGQVVMVDsKPiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+ID4KPiA+ID4gPiA+IC0g
ICAgICAgdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKHZtYS0+dm1fcGFnZV9w
cm90KTsKPiA+ID4gPiA+IC0KPiA+ID4gPiA+IC0gICAgICAgcmV0dXJuIHZtX2lvbWFwX21lbW9y
eSh2bWEsIHBoeXNfYWRkciwgdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0KTsKPiA+ID4gPiA+
ICsgICAgICAgZGVzYy0+cGFnZV9wcm90ID0gcGdwcm90X25vbmNhY2hlZChkZXNjLT5wYWdlX3By
b3QpOwo+ID4gPiA+ID4gKyAgICAgICBtbWFwX2FjdGlvbl9zaW1wbGVfaW9yZW1hcChkZXNjLCBw
aHlzX2FkZHIsIHZtYV9zaXplKTsKPiA+ID4gPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4g
PiAgfQo+ID4gPiA+ID4gLUVYUE9SVF9TWU1CT0wodm1lX21hc3Rlcl9tbWFwKTsKPiA+ID4gPiA+
ICtFWFBPUlRfU1lNQk9MKHZtZV9tYXN0ZXJfbW1hcF9wcmVwYXJlKTsKPiA+ID4gPiA+Cj4gPiA+
ID4gPiAgLyoqCj4gPiA+ID4gPiAgICogdm1lX21hc3Rlcl9mcmVlIC0gRnJlZSBWTUUgbWFzdGVy
IHdpbmRvdwo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92
bWUuaCBiL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUuaAo+ID4gPiA+ID4gaW5kZXggNzk3
ZTk5NDBmZGQxLi5iNjQxMzYwNWVhNDkgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3N0
YWdpbmcvdm1lX3VzZXIvdm1lLmgKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy92bWVf
dXNlci92bWUuaAo+ID4gPiA+ID4gQEAgLTE1MSw3ICsxNTEsNyBAQCBzc2l6ZV90IHZtZV9tYXN0
ZXJfcmVhZChzdHJ1Y3Qgdm1lX3Jlc291cmNlICpyZXNvdXJjZSwgdm9pZCAqYnVmLCBzaXplX3Qg
Y291bnQsCj4gPiA+ID4gPiAgc3NpemVfdCB2bWVfbWFzdGVyX3dyaXRlKHN0cnVjdCB2bWVfcmVz
b3VyY2UgKnJlc291cmNlLCB2b2lkICpidWYsIHNpemVfdCBjb3VudCwgbG9mZl90IG9mZnNldCk7
Cj4gPiA+ID4gPiAgdW5zaWduZWQgaW50IHZtZV9tYXN0ZXJfcm13KHN0cnVjdCB2bWVfcmVzb3Vy
Y2UgKnJlc291cmNlLCB1bnNpZ25lZCBpbnQgbWFzaywgdW5zaWduZWQgaW50IGNvbXBhcmUsCj4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHN3YXAsIGxv
ZmZfdCBvZmZzZXQpOwo+ID4gPiA+ID4gLWludCB2bWVfbWFzdGVyX21tYXAoc3RydWN0IHZtZV9y
ZXNvdXJjZSAqcmVzb3VyY2UsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiA+ID4gPiA+
ICtpbnQgdm1lX21hc3Rlcl9tbWFwX3ByZXBhcmUoc3RydWN0IHZtZV9yZXNvdXJjZSAqcmVzb3Vy
Y2UsIHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpOwo+ID4gPiA+ID4gIHZvaWQgdm1lX21hc3Rl
cl9mcmVlKHN0cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNlKTsKPiA+ID4gPiA+Cj4gPiA+ID4g
PiAgc3RydWN0IHZtZV9yZXNvdXJjZSAqdm1lX2RtYV9yZXF1ZXN0KHN0cnVjdCB2bWVfZGV2ICp2
ZGV2LCB1MzIgcm91dGUpOwo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy92
bWVfdXNlci92bWVfdXNlci5jIGIvZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV91c2VyLmMK
PiA+ID4gPiA+IGluZGV4IGQ5NWRkN2Q5MTkwYS4uMTFlMjVjMmY2YjBhIDEwMDY0NAo+ID4gPiA+
ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV91c2VyLmMKPiA+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5jCj4gPiA+ID4gPiBAQCAtNDQ2
LDI0ICs0NDYsMTQgQEAgc3RhdGljIHZvaWQgdm1lX3VzZXJfdm1fY2xvc2Uoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEpCj4gPiA+ID4gPiAgICAgICAgIGtmcmVlKHZtYV9wcml2KTsKPiA+ID4g
PiA+ICB9Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0
aW9uc19zdHJ1Y3Qgdm1lX3VzZXJfdm1fb3BzID0gewo+ID4gPiA+ID4gLSAgICAgICAub3BlbiA9
IHZtZV91c2VyX3ZtX29wZW4sCj4gPiA+ID4gPiAtICAgICAgIC5jbG9zZSA9IHZtZV91c2VyX3Zt
X2Nsb3NlLAo+ID4gPiA+ID4gLX07Cj4gPiA+ID4gPiAtCj4gPiA+ID4gPiAtc3RhdGljIGludCB2
bWVfdXNlcl9tYXN0ZXJfbW1hcCh1bnNpZ25lZCBpbnQgbWlub3IsIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hKQo+ID4gPiA+ID4gK3N0YXRpYyBpbnQgdm1lX3VzZXJfdm1fbWFwcGVkKHVuc2ln
bmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBwZ29mZl90IHBnb2ZmLAo+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZpbGUgKmZpbGUs
IHZvaWQgKip2bV9wcml2YXRlX2RhdGEpCj4gPiA+ID4gPiAgewo+ID4gPiA+ID4gLSAgICAgICBp
bnQgZXJyOwo+ID4gPiA+ID4gKyAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgbWlub3IgPSBpbWlu
b3IoZmlsZV9pbm9kZShmaWxlKSk7Cj4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCB2bWVfdXNlcl92
bWFfcHJpdiAqdm1hX3ByaXY7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICBtdXRleF9sb2Nr
KCZpbWFnZVttaW5vcl0ubXV0ZXgpOwo+ID4gPiA+ID4KPiA+ID4gPiA+IC0gICAgICAgZXJyID0g
dm1lX21hc3Rlcl9tbWFwKGltYWdlW21pbm9yXS5yZXNvdXJjZSwgdm1hKTsKPiA+ID4gPiA+IC0g
ICAgICAgaWYgKGVycikgewo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygm
aW1hZ2VbbWlub3JdLm11dGV4KTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gZXJy
Owo+ID4gPiA+ID4gLSAgICAgICB9Cj4gPiA+ID4gPiAtCj4gPiA+ID4KPiA+ID4gPiBPaywgdGhp
cyBjaGFuZ2VzIHRoZSBzZXQgb2YgdGhlIG9wZXJhdGlvbnMgcGVyZm9ybWVkIHVuZGVyIGltYWdl
W21pbm9yXS5tdXRleC4KPiA+ID4gPiBCZWZvcmUgd2UgaGFkOgo+ID4gPiA+Cj4gPiA+ID4gbXV0
ZXhfbG9jaygmaW1hZ2VbbWlub3JdLm11dGV4KTsKPiA+ID4gPiB2bWVfbWFzdGVyX21tYXAoKTsK
PiA+ID4gPiA8c29tZSBmaW5hbCBhZGp1c3RtZW50cz4KPiA+ID4gPiBtdXRleF91bmxvY2soJmlt
YWdlW21pbm9yXS5tdXRleCk7Cj4gPiA+ID4KPiA+ID4gPiBOb3cgd2UgaGF2ZToKPiA+ID4gPgo+
ID4gPiA+IG11dGV4X2xvY2soJmltYWdlW21pbm9yXS5tdXRleCk7Cj4gPiA+ID4gdm1lX21hc3Rl
cl9tbWFwX3ByZXBhcmUoKQo+ID4gPiA+IG11dGV4X3VubG9jaygmaW1hZ2VbbWlub3JdLm11dGV4
KTsKPiA+ID4gPiB2bV9pb21hcF9tZW1vcnkoKTsKPiA+ID4gPiBtdXRleF9sb2NrKCZpbWFnZVtt
aW5vcl0ubXV0ZXgpOwo+ID4gPiA+IHZtZV91c2VyX3ZtX21hcHBlZCgpOyAvLyA8c29tZSBmaW5h
bCBhZGp1c3RtZW50cz4KPiA+ID4gPiBtdXRleF91bmxvY2soJmltYWdlW21pbm9yXS5tdXRleCk7
Cj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIGFzIGxvbmcgYXMgaW1hZ2VbbWlub3JdIGRvZXMgbm90
IGNoYW5nZSB3aGlsZSB3ZSBhcmUgbm90Cj4gPiA+ID4gaG9sZGluZyB0aGUgbXV0ZXggd2Ugc2hv
dWxkIGJlIHNhZmUsIGFuZCBsb29raW5nIGF0IHRoZSBjb2RlIGl0IHNlZW1zCj4gPiA+ID4gdG8g
YmUgdGhlIGNhc2UuIEJ1dCBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhpcyBkcml2ZXIgYW5kIG1p
Z2h0IGJlCj4gPiA+ID4gd3JvbmcuIFdvcnRoIGRvdWJsZS1jaGVja2luZy4KPiA+Cj4gPiBUaGUg
ZmlsZSBpcyBwaW5uZWQgZm9yIHRoZSBkdXJhdGlvbiwgdGhlIG11dGV4IGlzIGFzc29jaWF0ZWQg
d2l0aCB0aGUgZmlsZSwKPiA+IHNvIHRoZXJlJ3Mgbm8gc2FuZSB3b3JsZCBpbiB3aGljaCB0aGF0
IGNvdWxkIGJlIHByb2JsZW1hdGljLgo+ID4KPiA+IEtlZXBpbmcgaW4gbWluZCB0aGF0IHdlIG1h
bmlwdWxhdGUgc3R1ZmYgb24gdm1lX3VzZXJfdm1fY2xvc2UoKSB0aGF0Cj4gPiBkaXJlY3RseSBh
Y2Nlc2VzIGltYWdlW21pbm9yXSBhdCBhbiBhcmJpdGFyeSB0aW1lLgo+Cj4gVGhhdCB3YXMgbXkg
dW5kZXJzdGFuZGluZyBhcyB3ZWxsLiBUaGFua3MgZm9yIGNvbmZpcm1pbmcuCj4KPiA+Cj4gPiA+
Cj4gPiA+IEEgc2lkZSBub3RlOiBpZiB3ZSBoYWQgdG8gaG9sZCB0aGUgbXV0ZXggYWNyb3NzIGFs
bCB0aG9zZSBvcGVyYXRpb25zIEkKPiA+ID4gdGhpbmsgd2Ugd291bGQgbmVlZCB0byB0YWtlIHRo
ZSBtdXRleCBpbiB0aGUgdm1fb3BzLT5tbWFwX3ByZXBhcmUgYW5kCj4gPiA+IGFkZCBhIHZtX29w
cy0+bWFwX2ZhaWxlZCBob29rIG9yIHNvbWV0aGluZyBhbG9uZyB0aGF0IGxpbmUgdG8gZHJvcCB0
aGUKPiA+ID4gbXV0ZXggaW4gY2FzZSBtbWFwX2FjdGlvbl9jb21wbGV0ZSgpIGZhaWxzLiBOb3Qg
c3VyZSBpZiB3ZSB3aWxsIGhhdmUKPiA+ID4gc3VjaCBjYXNlcyB0aG91Z2guLi4KPiA+Cj4gPiBO
bywgSSBkb24ndCB3YW50IHRvIGRvIHRoaXMgaWYgaXQgY2FuIGJlIGF0IGFsbCBhdm9pZGVkLiBZ
b3Ugc2hvdWxkIGluCj4gPiBuZWFybHkgYW55IHNhbmUgY2lyY3Vtc3RhbmNlIGJlIGFibGUgdG8g
ZGVmZXIgdGhpbmdzIHVudGlsIHRoZSBtYXBwZWQgaG9vawo+ID4gYW55d2F5Lgo+ID4KPiA+IEFs
c28gYSBtZXJnZSBjYW4gaGFwcGVuIHRvbyBhZnRlciBhbiAubW1hcF9wcmVwYXJlLCBzbyB3ZSdk
IGhhdmUgdG8gaGF2ZQo+ID4gc29tZSAnc3VjY2VzcycgaG9vayBhbmQgSSdtIGp1c3Qgbm90IGdv
aW5nIHRoZXJlIGl0J2xsIGVuZCB1cCBvcGVuIHRvIGFidXNlCj4gPiBhZ2Fpbi4KPiA+Cj4gPiAo
V2UgZG8gaGF2ZSBzdWNjZXNzIGFuZCBlcnJvciBmaWx0ZXJpbmcgaG9va3MgcmlnaHQgbm93LCBz
YWRseSwgYnV0IHRoZXkncmUKPiA+IHJlYWxseSBmb3IgaHVnZXRsYiBhbmQgSSBwbGFuIHRvIGZp
bmQgYSB3YXkgdG8gZ2V0IHJpZCBvZiB0aGVtKS4KPiA+Cj4gPiBUaGUgbW1hcF9wcmVwYXJlIGlz
IG1lYW50IHRvIGVzc2VudGlhbGx5IGJlIGFzIHN0YXRlbGVzcyBhcyBwb3NzaWJsZS4KPgo+IFll
cywgSSBhbHNvIGhvcGUgd2Ugd29uJ3QgZW5jb3VudGVyIGNhc2VzIHJlcXVpcmluZyB1cyB0byBr
ZWVwIGFueQo+IHN0YXRlIGluZm9ybWF0aW9uIGJldHdlZW4gdGhlIG1tYXBfcHJlcGFyZSBhbmQg
bWFwcGVkIHN0YWdlcy4KPgo+ID4KPiA+IEFueXdheSBJIGRvbid0IHRoaW5rIGl0J3MgcmVsZXZh
bnQgaGVyZS4KPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgdm1hX3ByaXYgPSBr
bWFsbG9jX29iaigqdm1hX3ByaXYpOwo+ID4gPiA+ID4gICAgICAgICBpZiAoIXZtYV9wcml2KSB7
Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZpbWFnZVttaW5vcl0ubXV0
ZXgpOwo+ID4gPiA+ID4gQEAgLTQ3MiwyMiArNDYyLDQxIEBAIHN0YXRpYyBpbnQgdm1lX3VzZXJf
bWFzdGVyX21tYXAodW5zaWduZWQgaW50IG1pbm9yLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIHZtYV9wcml2LT5taW5vciA9IG1pbm9yOwo+
ID4gPiA+ID4gICAgICAgICByZWZjb3VudF9zZXQoJnZtYV9wcml2LT5yZWZjbnQsIDEpOwo+ID4g
PiA+ID4gLSAgICAgICB2bWEtPnZtX29wcyA9ICZ2bWVfdXNlcl92bV9vcHM7Cj4gPiA+ID4gPiAt
ICAgICAgIHZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gdm1hX3ByaXY7Cj4gPiA+ID4gPiAtCj4gPiA+
ID4gPiArICAgICAgICp2bV9wcml2YXRlX2RhdGEgPSB2bWFfcHJpdjsKPiA+ID4gPiA+ICAgICAg
ICAgaW1hZ2VbbWlub3JdLm1tYXBfY291bnQrKzsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAg
IG11dGV4X3VubG9jaygmaW1hZ2VbbWlub3JdLm11dGV4KTsKPiA+ID4gPiA+IC0KPiA+ID4gPiA+
ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gPiAgfQo+ID4gPiA+ID4KPiA+ID4gPiA+IC1zdGF0
aWMgaW50IHZtZV91c2VyX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hKQo+ID4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19z
dHJ1Y3Qgdm1lX3VzZXJfdm1fb3BzID0gewo+ID4gPiA+ID4gKyAgICAgICAubWFwcGVkID0gdm1l
X3VzZXJfdm1fbWFwcGVkLAo+ID4gPiA+ID4gKyAgICAgICAub3BlbiA9IHZtZV91c2VyX3ZtX29w
ZW4sCj4gPiA+ID4gPiArICAgICAgIC5jbG9zZSA9IHZtZV91c2VyX3ZtX2Nsb3NlLAo+ID4gPiA+
ID4gK307Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArc3RhdGljIGludCB2bWVfdXNlcl9tYXN0ZXJf
bW1hcF9wcmVwYXJlKHVuc2lnbmVkIGludCBtaW5vciwKPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ID4g
PiA+ID4gK3sKPiA+ID4gPiA+ICsgICAgICAgaW50IGVycjsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ICsgICAgICAgbXV0ZXhfbG9jaygmaW1hZ2VbbWlub3JdLm11dGV4KTsKPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICsgICAgICAgZXJyID0gdm1lX21hc3Rlcl9tbWFwX3ByZXBhcmUoaW1hZ2VbbWlub3Jd
LnJlc291cmNlLCBkZXNjKTsKPiA+ID4gPiA+ICsgICAgICAgaWYgKCFlcnIpCj4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgZGVzYy0+dm1fb3BzID0gJnZtZV91c2VyX3ZtX29wczsKPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsgICAgICAgbXV0ZXhfdW5sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwo+
ID4gPiA+ID4gKyAgICAgICByZXR1cm4gZXJyOwo+ID4gPiA+ID4gK30KPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICtzdGF0aWMgaW50IHZtZV91c2VyX21tYXBfcHJlcGFyZShzdHJ1Y3Qgdm1fYXJlYV9k
ZXNjICpkZXNjKQo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+IC0gICAgICAgdW5zaWduZWQgaW50IG1p
bm9yID0gaW1pbm9yKGZpbGVfaW5vZGUoZmlsZSkpOwo+ID4gPiA+ID4gKyAgICAgICBjb25zdCBz
dHJ1Y3QgZmlsZSAqZmlsZSA9IGRlc2MtPmZpbGU7Cj4gPiA+ID4gPiArICAgICAgIGNvbnN0IHVu
c2lnbmVkIGludCBtaW5vciA9IGltaW5vcihmaWxlX2lub2RlKGZpbGUpKTsKPiA+ID4gPiA+Cj4g
PiA+ID4gPiAgICAgICAgIGlmICh0eXBlW21pbm9yXSA9PSBNQVNURVJfTUlOT1IpCj4gPiA+ID4g
PiAtICAgICAgICAgICAgICAgcmV0dXJuIHZtZV91c2VyX21hc3Rlcl9tbWFwKG1pbm9yLCB2bWEp
Owo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiB2bWVfdXNlcl9tYXN0ZXJfbW1hcF9w
cmVwYXJlKG1pbm9yLCBkZXNjKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIHJldHVybiAt
RU5PREVWOwo+ID4gPiA+ID4gIH0KPiA+ID4gPiA+IEBAIC00OTgsNyArNTA3LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgdm1lX3VzZXJfZm9wcyA9IHsKPiA+ID4gPiA+
ICAgICAgICAgLmxsc2VlayA9IHZtZV91c2VyX2xsc2VlaywKPiA+ID4gPiA+ICAgICAgICAgLnVu
bG9ja2VkX2lvY3RsID0gdm1lX3VzZXJfdW5sb2NrZWRfaW9jdGwsCj4gPiA+ID4gPiAgICAgICAg
IC5jb21wYXRfaW9jdGwgPSBjb21wYXRfcHRyX2lvY3RsLAo+ID4gPiA+ID4gLSAgICAgICAubW1h
cCA9IHZtZV91c2VyX21tYXAsCj4gPiA+ID4gPiArICAgICAgIC5tbWFwX3ByZXBhcmUgPSB2bWVf
dXNlcl9tbWFwX3ByZXBhcmUsCj4gPiA+ID4gPiAgfTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgc3Rh
dGljIGludCB2bWVfdXNlcl9tYXRjaChzdHJ1Y3Qgdm1lX2RldiAqdmRldikKPiA+ID4gPiA+IC0t
Cj4gPiA+ID4gPiAyLjUzLjAKPiA+ID4gPiA+Cj4gPgo+ID4gQ2hlZXJzLCBMb3JlbnpvCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
