Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K9oCU1St2m/PwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 01:43:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA82B293213
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 01:43:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EE16C87EBD;
	Mon, 16 Mar 2026 00:43:56 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E53F3C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 00:43:54 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-509069a7a7fso778381cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2026 17:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773621834; cv=none;
 d=google.com; s=arc-20240605;
 b=IC5D/mtUVZ2MjOpv+D4o5UrOCT7hhnSKZ3rhjy0jyUNISIa7ckFh0kSBQ4ki44yErd
 TeFrSvVJEKdzWHymZHpCmpp/BJcPT57GflCGHHZP3vGIHgSiffpVV2IkS+gOPZum+qGn
 O7vIzfGfu0P5mcls7PZajgbZgFDJ+JkG1IYq3W9gMM6IW3GuVyC3nLW9p5Kmn0fOP3cG
 0BxD6cWT74Tla99gQ+29GlQQQo+KJYB2gUj6AKHj+nA3GQHhoFTt5wYvFwggYQOOI1ZV
 ehYGWLo1yE/Hq3fzMkXA33R5CPUSghDvyM7mtkQdV3WCcVNROO609WQrbVbRDTwB1BYe
 9GyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
 fh=HdsVjugSZpEwbdbSvpzht53fVZBpt/5msZBEfZTVTu8=;
 b=JMS5RTXxPkpI6P6WEmu0W9J5zjQIPuduEmJEwWEFZ2ZTFb90akrevhlK7HYKvhg/vX
 aOslSCJ1K0V45Rmb9Pr757Vys4Im8P9Il2iRF6IsB/zkJNSngcUHw/0fdod9moEFGcJj
 gL6ZrSesurcwI3tecgR+Wgh44QCkFWnSqJq/MrK1XGuIm+PZM8rAXGraL7iSQILCzts8
 TF1Z99WHYJVqo+1LsR1PngI57KNJU/+NM0idvrar0ASl527MTwYEr7PxqShrfID6GIvV
 dszZTUGl4u7n+V190j+T1AlwCaMu1n522RefE8ftpUnpOLVGpelAdN2b1BQjmkr5Yyjc
 nHfQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773621834; x=1774226634;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
 b=lFXe3wr0yTMiv9g8xleLR/ZNVQ4ms5RvjNPuD4fhhBzIxUNnrnrC0DS+E3oJljx+8p
 dpyeEknZSU+gTVPZF8NM98T5WFkxZ9gmLqPkvRp7Kn/bu9AfOdyRjwbYD9gtqw5AQ5RI
 XM+1M8ldjkr6b6cZTNA/a8SnycbN9H6+c2nRsu4Kb/UEqJDAxbStpNf48OmyWl8ZuYzV
 kWrR8l90aPX9JPZNZtOB23NL5OJGXnTl+WjU83PiKU1wIywSTSUTZDboSRIc9hkinp/k
 KzuOPGmX6RB5RD9XHpHtW7e0HYA+MbGtYI8pxPoIPIuePKo1O5F5norqD5Cg5+jzGdvz
 /L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773621834; x=1774226634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
 b=OzySLld+JZAR3elY4WNdwmnPNhLAl7lK5XKvJcp32DQurJ5sg323hIfgDtPHJYdQim
 M6WJU2b8nEjaaFK1oQYrLZ2KSJtQo3jmMb+eXhbaMAzS21NgJXMoVTYRO64M/aiSthvJ
 Fnp/ossDNxkpOqxTKCU5N0xB9vnZ+kg2MCw1HuVXNSywgSKl2LxsVy5oIwcKmLKIK8WR
 eOwQoxXyI0zD87/9L4LxSN6wejpnM1D3L2dIpQfup165CCn8e+YGl3TwUFDtGaTwZhjn
 K0kO//WE2ciJJ0rm5/8vHjH8iRsaIrElxRo5H4UIS3cNLA4DwfHfN01YqxAiqyonDTcb
 1J3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBpc1nKtu5/bfC+zUOpspwuk3QKDaCuCFHRjkIHu5NFmRu73tEe1DQBlN1WAqSm3/EAFXOGIAiRKP9bQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyAAOZnNdWVbynNbMhCbj7CT1QUq9MbTnMZyu/NV7WUvz2X8hFF
 zkE2gxHUQfDMhyL4ZTj2CqsDIy3+p4Pji3cYoSnxYSeAquxoOsipjsR4lHM5QFF3KHwkLGXd9QL
 6k502sRQ6huTqLXd2dQoFkPcUihyTPQ7nbsXlnATu
X-Gm-Gg: ATEYQzzmCpMazStdUgej2mnSspZVZMpqEdoM3ZgAzFFqKuMpAZHh2XwfwLhjtqXwmEc
 oKbJpO20A8NEpuVwc/ly0ijnhS/hqnM8yg2aW5qNEANd6DynNNpXErDAeKkg9mv7pZy4TGIGHt5
 XPgBh9UC7Kyx8LJ2SORzZ2qOo3I0Z4+Sbh8mem23BQnZGED0HOw3DKKPUN9Fd33gutSheKx5p8Y
 Dq9+8RxUaumauC82lIyruxKNC3iYM+Zts5BjmvlE9MJO4V3so0OVKxMXG1aiKAIUyRph+wMjg3w
 vHyVVQ==
X-Received: by 2002:ac8:590e:0:b0:503:4bc:c925 with SMTP id
 d75a77b69052e-5096aa2ae2cmr17578141cf.13.1773621833001; Sun, 15 Mar 2026
 17:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org>
 <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
In-Reply-To: <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 17:43:41 -0700
X-Gm-Features: AaiRm51H9IsCynzRpnxAc6_DrzYXD9cjd8fR558hmylwDQfMj5FrJzUnU5dorNw
Message-ID: <CAJuCfpHVN66abFrJgorXKBsjv7Ut=CP-E4NpLMC4SW613tJwtw@mail.gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m
 :linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[surenb@google.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[google.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com,linux-foundation.org];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: AA82B293213
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgMToyN+KAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRGVzY3JpYmUgd2hlbiB0aGUgb3BlcmF0aW9u
IGlzIGludm9rZWQgYW5kIHRoZSBjb250ZXh0IGluIHdoaWNoIGl0IGlzCj4gaW52b2tlZCwgbWF0
Y2hpbmcgdGhlIGRlc2NyaXB0aW9uIGFscmVhZHkgYWRkZWQgZm9yIHZtX29wLT5jbG9zZSgpLgo+
Cj4gV2hpbGUgd2UncmUgaGVyZSwgdXBkYXRlIGFsbCBvdXRkYXRlZCByZWZlcmVuY2VzIHRvIGFu
ICdhcmVhJyBmaWVsZCBmb3IKPiBWTUFzIHRvIHRoZSBtb3JlIGNvbnNpc3RlbnQgJ3ZtYScuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21tLmggfCAxNSArKysrKysrKysrLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gaW5kZXggY2M1
OTYwYTg0MzgyLi4xMmEwYjRjNjM3MzYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5o
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gQEAgLTc0OCwxNSArNzQ4LDIwIEBAIHN0cnVj
dCB2bV91ZmZkX29wczsKPiAgICogdG8gdGhlIGZ1bmN0aW9ucyBjYWxsZWQgd2hlbiBhIG5vLXBh
Z2Ugb3IgYSB3cC1wYWdlIGV4Y2VwdGlvbiBvY2N1cnMuCj4gICAqLwo+ICBzdHJ1Y3Qgdm1fb3Bl
cmF0aW9uc19zdHJ1Y3Qgewo+IC0gICAgICAgdm9pZCAoKm9wZW4pKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqIGFyZWEpOwo+ICsgICAgICAgLyoqCj4gKyAgICAgICAgKiBAb3BlbjogQ2FsbGVkIHdo
ZW4gYSBWTUEgaXMgcmVtYXBwZWQgb3Igc3BsaXQuIE5vdCBjYWxsZWQgdXBvbiBmaXJzdAo+ICsg
ICAgICAgICogbWFwcGluZyBhIFZNQS4KCkl0J3MgYWxzbyBjYWxsZWQgZnJvbSBkdXBfbW1hcCgp
IHdoaWNoIGlzIHBhcnQgb2YgZm9ya2luZy4KCj4gKyAgICAgICAgKiBDb250ZXh0OiBVc2VyIGNv
bnRleHQuICBNYXkgc2xlZXAuICBDYWxsZXIgaG9sZHMgbW1hcF9sb2NrLgo+ICsgICAgICAgICov
Cj4gKyAgICAgICB2b2lkICgqb3Blbikoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwo+ICAg
ICAgICAgLyoqCj4gICAgICAgICAgKiBAY2xvc2U6IENhbGxlZCB3aGVuIHRoZSBWTUEgaXMgYmVp
bmcgcmVtb3ZlZCBmcm9tIHRoZSBNTS4KPiAgICAgICAgICAqIENvbnRleHQ6IFVzZXIgY29udGV4
dC4gIE1heSBzbGVlcC4gIENhbGxlciBob2xkcyBtbWFwX2xvY2suCj4gICAgICAgICAgKi8KPiAt
ICAgICAgIHZvaWQgKCpjbG9zZSkoc3RydWN0IHZtX2FyZWFfc3RydWN0ICogYXJlYSk7Cj4gKyAg
ICAgICB2b2lkICgqY2xvc2UpKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiAgICAgICAg
IC8qIENhbGxlZCBhbnkgdGltZSBiZWZvcmUgc3BsaXR0aW5nIHRvIGNoZWNrIGlmIGl0J3MgYWxs
b3dlZCAqLwo+IC0gICAgICAgaW50ICgqbWF5X3NwbGl0KShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KmFyZWEsIHVuc2lnbmVkIGxvbmcgYWRkcik7Cj4gLSAgICAgICBpbnQgKCptcmVtYXApKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqYXJlYSk7Cj4gKyAgICAgICBpbnQgKCptYXlfc3BsaXQpKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIpOwo+ICsgICAgICAgaW50
ICgqbXJlbWFwKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gICAgICAgICAvKgo+ICAg
ICAgICAgICogQ2FsbGVkIGJ5IG1wcm90ZWN0KCkgdG8gbWFrZSBkcml2ZXItc3BlY2lmaWMgcGVy
bWlzc2lvbgo+ICAgICAgICAgICogY2hlY2tzIGJlZm9yZSBtcHJvdGVjdCgpIGlzIGZpbmFsaXNl
ZC4gICBUaGUgVk1BIG11c3Qgbm90Cj4gQEAgLTc2OCw3ICs3NzMsNyBAQCBzdHJ1Y3Qgdm1fb3Bl
cmF0aW9uc19zdHJ1Y3Qgewo+ICAgICAgICAgdm1fZmF1bHRfdCAoKmh1Z2VfZmF1bHQpKHN0cnVj
dCB2bV9mYXVsdCAqdm1mLCB1bnNpZ25lZCBpbnQgb3JkZXIpOwo+ICAgICAgICAgdm1fZmF1bHRf
dCAoKm1hcF9wYWdlcykoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgcGdvZmZfdCBzdGFydF9wZ29mZiwgcGdvZmZfdCBlbmRfcGdvZmYpOwo+IC0gICAgICAg
dW5zaWduZWQgbG9uZyAoKnBhZ2VzaXplKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiBhcmVhKTsK
PiArICAgICAgIHVuc2lnbmVkIGxvbmcgKCpwYWdlc2l6ZSkoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpOwo+Cj4gICAgICAgICAvKiBub3RpZmljYXRpb24gdGhhdCBhIHByZXZpb3VzbHkgcmVh
ZC1vbmx5IHBhZ2UgaXMgYWJvdXQgdG8gYmVjb21lCj4gICAgICAgICAgKiB3cml0YWJsZSwgaWYg
YW4gZXJyb3IgaXMgcmV0dXJuZWQgaXQgd2lsbCBjYXVzZSBhIFNJR0JVUyAqLwo+IC0tCj4gMi41
My4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
