Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGa3Np3ZuGnUkAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 05:33:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DB62A3BC1
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 05:33:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D84BC87ED8;
	Tue, 17 Mar 2026 04:33:33 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18A68C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 04:33:31 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-509062d829dso231051cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 21:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773722011; cv=none;
 d=google.com; s=arc-20240605;
 b=lptIhA6mDWv6e8Zn46P8UdEQxI5R+sPy45uh9ozTmxpCjeNvv8NknykjzoTdABO4gj
 fr0xEyvCCOi5jeA45GrRq6hcNKyOGWrcRRbpLOQ4HRUWcKHN4s3cduUKlgJEPDHLgXCu
 ZjStQc+mYZmwzH1NILoeydJkDGTF7ZsBeREtBP3kvKTuJfCOPaE9bAXgYjyfqvmjO6Uv
 5+p5wpSkUB0+ReHBFZpSlFxiesKZ+6r0XlJrEO41Eswi/+ZknQNIsCoIxTBN6bgbTrxX
 N1YVXMKoEG6Wih3/ljWuhbWldI+SGcWxXwoWHmuKebPSRELxfN8BU7YsHrtiHkhM/s5Y
 kYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
 fh=iKPffOGwvv7UjeIjSQ0Fe4ph/smh/Eou8OA8pnAJJpg=;
 b=HHN1lbXXXWBBEgJ6k0LkbArxcMrClyl2bwcgqIc2OfoUI+OBMzAB5NOvYtpOZH2YnN
 VoSrxq/+cVL4FEUthkyXqD5vA7DpcT4ZAYX9mTSCqgfLwzn9ihX6tqqpgf8g/0cNDApM
 t2wvli5yKTCdKplH0bSZIU/cM1dc1zqTUX0Xd//8zsj60csYBXfvgXsiwC3SKMo1ydoc
 XEoVIqqS9O5wzmi8XCgUcVq6HGo2LmR1wX9RDVwr5mgv67y7tmJWrUt2oVmh8mybJZSl
 5ybGH577b9iVFq0djKAOonbAJq7tJt9XTzshOQ94Khb1oRu7VuLDytIaphE6H/5W4CPf
 P9ag==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773722011; x=1774326811;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
 b=hnXCxIZPH6+xKS7llJ4+dbW44vojsEhJU/jBLmn+ZAOyBgOI8BnnkSe2tpMW3uWPDr
 6zqaUL3ewN7rZupv9kdLKMuXy16ZuYoCBXM7IQBwyxboiGBhRWlx5oNsi5AFV0ESzytv
 VxNCDa2MvO3+gbBN5RIZhD8OpC9pZhlQwO8H9KzoDLP1ahLut/rJm2fyBwVOpI0xWzIp
 uA426+UF5h6oh3OChRCK+TRp57cLx9YFOnVJDQhVw5ucg0AnH9lYhPXA3ye7Jb13cArJ
 4dcEdgrFr3ud4HtKWMOS90tM2X4YLCIKclyrlkCe6412/7yrvsA+M+AtoNwwPQpdYAnN
 gNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773722011; x=1774326811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
 b=Z5zMPJBpQvmKbOKaaqhuhtjlMflb2V9WbaBeeswmKkOgsAoFe7B6oe/hNFzDsC9Al3
 Zvo1pPnEiZwXYlYwJpBhBJAizMORw1I3ARQDWg0iDRYtjiRh09ZXyvjzcWrP+rWY019x
 LG9/dQNAfTZF2VOI5QOha+4cHUuW/ccQuW5PETy17gh2Gei5+lxkmKSHTIjT2of2sid2
 KDtr/AYnh6I9/jKgy8DbNERUxDFIqFmuo+YSU8NWWopRlKv/iXLQ941sQSlwWPZbnsmZ
 IduHXsDRQAcPA5mV2fn74oXFGULyFPX6bXcsB+Rem3KIUkyk6ajUiTGZ+2+ih+S5pVzk
 N9XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5PQ8J3pxmjdLyqGc+AkbP1dtmTOt7hAEmbJfBrRy/8u9XrVwz6RSXzIoTa5aJs8sQD8a5QHSFy91F1g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwOlAalXLsbpgnbMUezlRKfuP2CFliC3J21NRgUMA6OLk379nWN
 gKPy38tFjOLRjFYxnVml0/1ggv8P/xjOFkO5AfOSVC20jj3hbOvLmpz67CO+ukluR0PNlHZ24wI
 DHAWjmKkHGfW6SO5DqSmp8Laoq5DPwNDvk79DbZqe
X-Gm-Gg: ATEYQzxIHxIMM0BzeJh5VgqvTLNvKWG0mn5aXa0cH5p/0l2NDypKtmkaAUY7l6wXWUJ
 rm9MfPWJYfnSgWGlgBx4Xic5PKzgFQ9Y/+0a2rDR7FnpdLSRE4QqJ6fPO8Bv7Y9iUG/jH5IANuo
 SjA0jSdG+LtYSaXLpICN4y6UWQi2+gggLnPuQ94ON349pv22NK8Uj6X614bnwX+0IOMDpzVm7Rx
 ZkpOVAEi7ErREM638eFh06CEDOBj6JpOiLtyQm92ONb486QkdfeeOos+zPJyAA4X1PKQAD9/Spt
 GWOVlQ==
X-Received: by 2002:ac8:5844:0:b0:509:cd7:aa18 with SMTP id
 d75a77b69052e-50998d3b42cmr9273521cf.10.1773722010151; Mon, 16 Mar 2026
 21:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org>
 <a8debbca3fc7b765937e6b5b76bd9002c66b225b.1773695307.git.ljs@kernel.org>
In-Reply-To: <a8debbca3fc7b765937e6b5b76bd9002c66b225b.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 21:33:19 -0700
X-Gm-Features: AaiRm50Qx7Mej7rYBXyqChXz1IjfagNMkbSFlVwOhEN7Z-gN2V6TQSUIzNbqMWk
Message-ID: <CAJuCfpHBfD0zO60tPCEeNXSRJSoDi5Azs0LzutpYFEBW2z6JJw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 08/16] hpet: replace deprecated mmap
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
	NEURAL_SPAM(0.00)[0.867];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 80DB62A3BC1
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxNOKAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIGZfb3AtPm1tYXAgaW50ZXJmYWNlIGlz
IGRlcHJlY2F0ZWQsIHNvIHVwZGF0ZSBkcml2ZXIgdG8gdXNlIGl0cwo+IHN1Y2Nlc3NvciwgbW1h
cF9wcmVwYXJlLgo+Cj4gVGhlIGRyaXZlciBwcmV2aW91c2x5IHVzZWQgdm1faW9tYXBfbWVtb3J5
KCksIHNvIHRoaXMgY2hhbmdlIHJlcGxhY2VzIGl0Cj4gd2l0aCBpdHMgbW1hcF9wcmVwYXJlIGVx
dWl2YWxlbnQsIG1tYXBfYWN0aW9uX3NpbXBsZV9pb3JlbWFwKCkuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6
IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBkcml2ZXJz
L2NoYXIvaHBldC5jIHwgMTIgKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFyL2hw
ZXQuYyBiL2RyaXZlcnMvY2hhci9ocGV0LmMKPiBpbmRleCA2MGRkMDlhNTZmNTAuLjhmMTI4Y2M0
MDE0NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NoYXIvaHBldC5jCj4gKysrIGIvZHJpdmVycy9j
aGFyL2hwZXQuYwo+IEBAIC0zNTQsOCArMzU0LDkgQEAgc3RhdGljIF9faW5pdCBpbnQgaHBldF9t
bWFwX2VuYWJsZShjaGFyICpzdHIpCj4gIH0KPiAgX19zZXR1cCgiaHBldF9tbWFwPSIsIGhwZXRf
bW1hcF9lbmFibGUpOwo+Cj4gLXN0YXRpYyBpbnQgaHBldF9tbWFwKHN0cnVjdCBmaWxlICpmaWxl
LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiArc3RhdGljIGludCBocGV0X21tYXBfcHJl
cGFyZShzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ICB7Cj4gKyAgICAgICBzdHJ1Y3QgZmls
ZSAqZmlsZSA9IGRlc2MtPmZpbGU7Cj4gICAgICAgICBzdHJ1Y3QgaHBldF9kZXYgKmRldnA7Cj4g
ICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHI7Cj4KPiBAQCAtMzY4LDExICszNjksMTIgQEAgc3Rh
dGljIGludCBocGV0X21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKQo+ICAgICAgICAgaWYgKGFkZHIgJiAoUEFHRV9TSVpFIC0gMSkpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PU1lTOwo+Cj4gLSAgICAgICB2bWEtPnZtX3BhZ2VfcHJvdCA9IHBn
cHJvdF9ub25jYWNoZWQodm1hLT52bV9wYWdlX3Byb3QpOwo+IC0gICAgICAgcmV0dXJuIHZtX2lv
bWFwX21lbW9yeSh2bWEsIGFkZHIsIFBBR0VfU0laRSk7Cj4gKyAgICAgICBkZXNjLT5wYWdlX3By
b3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKGRlc2MtPnBhZ2VfcHJvdCk7Cj4gKyAgICAgICBtbWFwX2Fj
dGlvbl9zaW1wbGVfaW9yZW1hcChkZXNjLCBhZGRyLCBQQUdFX1NJWkUpOwo+ICsgICAgICAgcmV0
dXJuIDA7Cj4gIH0KPiAgI2Vsc2UKPiAtc3RhdGljIGludCBocGV0X21tYXAoc3RydWN0IGZpbGUg
KmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICtzdGF0aWMgaW50IGhwZXRfbW1h
cF9wcmVwYXJlKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gIHsKPiAgICAgICAgIHJldHVy
biAtRU5PU1lTOwo+ICB9Cj4gQEAgLTcxMCw3ICs3MTIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGZpbGVfb3BlcmF0aW9ucyBocGV0X2ZvcHMgPSB7Cj4gICAgICAgICAub3BlbiA9IGhwZXRfb3Bl
biwKPiAgICAgICAgIC5yZWxlYXNlID0gaHBldF9yZWxlYXNlLAo+ICAgICAgICAgLmZhc3luYyA9
IGhwZXRfZmFzeW5jLAo+IC0gICAgICAgLm1tYXAgPSBocGV0X21tYXAsCj4gKyAgICAgICAubW1h
cF9wcmVwYXJlID0gaHBldF9tbWFwX3ByZXBhcmUsCj4gIH07Cj4KPiAgc3RhdGljIGludCBocGV0
X2lzX2tub3duKHN0cnVjdCBocGV0X2RhdGEgKmhkcCkKPiAtLQo+IDIuNTMuMAo+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
