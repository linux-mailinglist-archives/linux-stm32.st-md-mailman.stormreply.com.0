Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN0PFIzNuGlfjgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 04:42:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEED2A347A
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 04:42:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E2B8C87ED8;
	Tue, 17 Mar 2026 03:42:03 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4562C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 03:42:02 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-661169cd6d8so3735a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 20:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773718922; cv=none;
 d=google.com; s=arc-20240605;
 b=dOgogz5kEJfjJjVXzox9WAwJvSlz7b/U/g8vtqqSUbkOsTOE+IdzqDhuIvi+rvOWxP
 dX19uy6a6AJarHqIbta07kdKrJp+jSSH76BtTir9SqCSUPLohJlGQ8XuX2ZgF8QEqo1V
 NV40+ZJIvkacshWbQCIL6BEED+sNWlonlQoRDOiMqL+AdST8HafUPwoF1Gox6YxeYCeZ
 Q7G91quXHcNj7/4V6pl6zg5OzvwABq16ZTK0Uwa37AHQxpFYKhJCHMGiK6a6Y1IxAKwz
 1GA9Sro4M0NBmGEiE/GiGn/h+lF7F4qxpJuurOeabaqi6aelo9tTvMp8anBoLLUDhfwp
 ZKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
 fh=IWGtm2MRG20ta03CC7exeougNAyzyYjlaIWL1P9Ifu4=;
 b=dTTGV3woHDd6Oz753hr0rvPYM488CcTcNWBqYTshpdxBcsICh8+hghqZ7qNgQF3KL4
 KofCvcNtzsQ+h+nzITj50MrNnh4vtjkd3tCUHaLRsTuHu5Mmksew5A9RvPgs1kTjs13T
 eHJHXoCSJpw5OP7vIc+EAM0RE99dn27bQ5DDWDgfA/KC376Y+ZTOFVsZH8e1NdFm+/wE
 emNFxOEEfwZ/3mm7Rt88O4OCz/GZP2SRVlT7MLxDwWu8ge2k/uCdJ4XkW4ZV0yYyVryu
 orpBvVFNcfJmN4C5t+HVY4v19q28qJlIVBCbIwf6izmm/L6jbeh4yKuNmo9MCEgfiO2U
 fHuA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773718922; x=1774323722;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
 b=fvxZ/x+MG6PWGnYzmwtNdA4eG68KZeUJ9/3R3Lmz/Jz3u/P1XlfDdbfOxC/YwPSF+O
 J02i8Mu/kKjkI7yaAUt9fdaTSuwmk6fNRj4sLElIUyxk50YEn4pyDzKzFlDuRrQrrBDp
 YvhbdEgTOYJ94toxAw6fCZOuEeEBM04fyuq9JXv/rB0JUE4JnBCsmaYF2AkDMda+EWSf
 Cyt/Dd6TzPJQXkIxP5sGRWFeT52e8RkZfnz5e1cZcfpesKGmMVpzANZXyMY+2k8sCuc2
 rqXJjItQZUSiN2liqE30HnS954r0I5CD9fzrqm8ENqBcobRnIBsHeYOA+5gYgdyxoPL8
 UJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773718922; x=1774323722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SDjcbstE7vaBgKzikVP/a05WleFr4Bi6N01Q1DpO7Ng=;
 b=nxbq8wDAzrunReIglHG9gOac44cs1HObiP5XJ6Qv+KydoVGGyz69kwR6glDHFhsC9K
 HKmJoxePu7ql9hJsMkLv8mGNdkj6I4El3rChWW6iaS6jbJIlICksbQUrXpzpW4zef/Rs
 KyIclChpd1VKldZ2ciNZ8wZwivkemfCUiqir78iwUJZHtWN/XVvpcAIZthUspX9xNsmK
 P95A97mcXd/HSSMfJHW3K6mu4uirAYL+X3bwOpAMYB2pW2WKCkQDkVrBgLBBVkFl594G
 qcxR0FGOjxWFur7QDwIs43OgkURaD554+sS3Y61iQMl4i5On96dQk8v+wmLRqv/rgbj8
 /JgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf2o0yUoPoLoMY/gZtHGXuYJP0a4IyIcg2UJmPLShofN+ujlfLB5maCxZCObTBZAftKdu/Ti5FAI7qNg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxxemdnUVPgv2d1MNZEoztr82BFpTGAhsl95r/Iy25ezrCoDbow
 3/MUM2dQZpwQn23RpZmB0/BYU7kFsrIQuY18spkgpgQJsbOdJ+RgOlUfzUgFEfSfiyOzv3+P/8b
 6mHqe3MXXbQa6giPN1OA1tVh3QIuXGNKF+QFuidDN
X-Gm-Gg: ATEYQzxeDaAqxPiyGnNsNwODnogPB71jj5sVBizhiQrMIQkGgyf5f7Pks/A+IzF84ps
 yTh5+axqIIL6I//ONxbLlDq90xP9nTlseNJL+M9a0i4ylnoDZwPR0UVjleGYhW+XKe7wVUo9xlB
 sTlUPPaq/ITvly1/l7umYbsnMjzePNLrjwfoAw9o7R91/Do19iX7ncL7OLxIXOuuIPHBMe3WlC9
 VDTq4ROPXTkYPOgsnhcsoldi/nnP1qk7v1Mdy81QM2sFaNKlYuKeO4/KsiAbeSjpUIcqkaUCSZE
 aJoq+g==
X-Received: by 2002:a05:6402:5047:b0:667:926:56e with SMTP id
 4fb4d7f45d1cf-6671449f938mr28406a12.2.1773718921655; Mon, 16 Mar 2026
 20:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev>
 <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
 <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
 <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
In-Reply-To: <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 20:41:48 -0700
X-Gm-Features: AaiRm51L9yY6IK4TcJFLhN8NGwQS7Z64sx0O9EJzSXirWOtaRRhN6Ww7XVogluY
Message-ID: <CAJuCfpH2XyAJOFKCZnviVV_UbF4O0wzj3QgJieo+LD=Cvr71jA@mail.gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:arnd@arndb.de,m:linux-scsi@vger.kernel.org,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:usama.arif@linux.dev,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail
 .com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[google.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,arndb.de,nod.at,lists.linux.dev,suse.de,arm.com,linux.dev,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com,linux-foundation.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.980];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EEEED2A347A
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgNzoyOeKAr0FNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBNYXIgMTUsIDIwMjYgYXQgMDc6
MzI6NTRQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+ID4gT24gRnJpLCBNYXIg
MTMsIDIwMjYgYXQgNTowMOKAr0FNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSA8bGpzQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIE1hciAxMywgMjAyNiBhdCAwNDowNzo0
M0FNIC0wNzAwLCBVc2FtYSBBcmlmIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgMTIgTWFyIDIwMjYg
MjA6Mjc6MjAgKzAwMDAgIkxvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSIgPGxqc0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gQ29tbWl0IDlkNTQwM2IxMDM2YyAoImZzOiBjb252
ZXJ0IG1vc3Qgb3RoZXIgZ2VuZXJpY19maWxlXyptbWFwKCkgdXNlcnMgdG8KPiA+ID4gPiA+IC5t
bWFwX3ByZXBhcmUoKSIpIHVwZGF0ZWQgQUZTIHRvIHVzZSB0aGUgbW1hcF9wcmVwYXJlIGNhbGxi
YWNrIGluIGZhdm91ciBvZgo+ID4gPiA+ID4gdGhlIGRlcHJlY2F0ZWQgbW1hcCBjYWxsYmFjay4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBIb3dldmVyLCBpdCBkaWQgbm90IGFjY291bnQgZm9yIHRoZSBm
YWN0IHRoYXQgbW1hcF9wcmVwYXJlIGNhbiBmYWlsIHRvIG1hcAo+ID4gPiA+ID4gZHVlIHRvIGFu
IG91dCBvZiBtZW1vcnkgZXJyb3IsIGFuZCB0aHVzIHNob3VsZCBub3QgYmUgaW5jcmVtZW50aW5n
IGEKPiA+ID4gPiA+IHJlZmVyZW5jZSBjb3VudCBvbiBtbWFwX3ByZXBhcmUuCj4gPgo+ID4gVGhp
cyBpcyBhIGJpdCBjb25mdXNpbmcuIEkgc2VlIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGRv
ZXMKPiA+IGFmc19hZGRfb3Blbl9tbWFwKCkgYW5kIHRoZW4gaWYgZ2VuZXJpY19maWxlX21tYXBf
cHJlcGFyZSgpIGZhaWxzIGl0Cj4gPiBkb2VzIGFmc19kcm9wX29wZW5fbW1hcCgpLCB0aGVyZWZv
cmUgcmVmY291bnRpbmcgc2VlbXMgdG8gYmUgYmFsYW5jZWQuCj4gPiBJcyB0aGVyZSByZWFsbHkg
YSBwcm9ibGVtPwo+Cj4gRmlyc3RseSwgbW1hcF9wcmVwYXJlIGlzIGludm9rZWQgYmVmb3JlIHdl
IHRyeSB0byBtZXJnZSwgc28gdGhlIFZNQSBjb3VsZCBpbgo+IHRoZW9yeSBnZXQgbWVyZ2VkIGFu
ZCB0aGVuIHRoZSByZWZjb3VudGluZyB3aWxsIGJlIHdyb25nLgoKSSBzZWUgbm93LiBPaywgbWFr
ZXMgc2Vuc2UuCgo+Cj4gU2Vjb25kbHksIG1tYXBfcHJlcGFyZSBvY2N1cnMgYXQgc3VjaCBhdCB0
aW1lIHdoZXJlIGl0IGlzIF9wb3NzaWJsZV8gdGhhdAo+IGFsbG9jYXRpb24gZmFpbHVyZXMgYXMg
ZGVzY3JpYmVkIGJlbG93IGNvdWxkIGhhcHBlbi4KClJpZ2h0LCBidXQgaW4gdGhhdCBjYXNlIGFm
c19maWxlX21tYXBfcHJlcGFyZSgpIHdvdWxkIGRyb3AgaXRzCnJlZmNvdW50IGFuZCByZXR1cm4g
YW4gZXJyb3IsIHNvIHJlZmNvdW50aW5nIGlzIHN0aWxsIGdvb2QsIG5vPwoKPgo+IEknbGwgdXBk
YXRlIHRoZSBjb21taXQgbWVzc2FnZSB0byByZWZsZWN0IHRoZSBtZXJnZSBhc3BlY3QgYWN0dWFs
bHkuCgpUaGFua3MhCgo+Cj4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdpdGggdGhlIG5ld2x5IGFk
ZGVkIHZtX29wcy0+bWFwcGVkIGNhbGxiYWNrIGF2YWlsYWJsZSwgd2UgY2FuIHNpbXBseSBkZWZl
cgo+ID4gPiA+ID4gdGhpcyBvcGVyYXRpb24gdG8gdGhhdCBjYWxsYmFjayB3aGljaCBpcyBvbmx5
IGludm9rZWQgb25jZSB0aGUgbWFwcGluZyBpcwo+ID4gPiA+ID4gc3VjY2Vzc2Z1bGx5IGluIHBs
YWNlIChidXQgbm90IHlldCB2aXNpYmxlIHRvIHVzZXJzcGFjZSBhcyB0aGUgbW1hcCBhbmQgVk1B
Cj4gPiA+ID4gPiB3cml0ZSBsb2NrcyBhcmUgaGVsZCkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhl
cmVmb3JlIGFkZCBhZnNfbWFwcGVkKCkgdG8gaW1wbGVtZW50IHRoaXMgY2FsbGJhY2sgZm9yIEFG
Uy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJbiBwcmFjdGljZSB0aGUgbWFwcGluZyBhbGxvY2F0aW9u
cyBhcmUgJ3RvbyBzbWFsbCB0byBmYWlsJyBzbyB0aGlzIGlzCj4gPiA+ID4gPiBzb21ldGhpbmcg
dGhhdCByZWFsaXN0aWNhbGx5IHNob3VsZCBuZXZlciBoYXBwZW4gaW4gcHJhY3RpY2UgKG9yIHdv
dWxkIGRvCj4gPiA+ID4gPiBzbyBpbiBhIGNhc2Ugd2hlcmUgdGhlIHByb2Nlc3MgaXMgYWJvdXQg
dG8gZGllIGFueXdheSksIGJ1dCB3ZSBzaG91bGQgc3RpbGwKPiA+ID4gPiA+IGhhbmRsZSB0aGlz
Lgo+ID4KPiA+IG5pdDogSSB3b3VsZCBkcm9wIHRoZSBhYm92ZSBwYXJhZ3JhcGguIElmIGl0J3Mg
aW1wb3NzaWJsZSB3aHkgYXJlIHlvdQo+ID4gaGFuZGxpbmcgaXQ/IElmIGl0J3MgdW5saWtlbHks
IHRoZW4gaGFuZGxpbmcgaXQgaXMgZXZlbiBtb3JlCj4gPiBpbXBvcnRhbnQuCj4KPiBTdXJlIEkg
Y2FuIGRyb3AgaXQsIGJ1dCBpdCdzIGFuIG9uZ29pbmcgdGhpbmcgd2l0aCB0aGVzZSBzbWFsbCBh
bGxvY2F0aW9ucy4KPgo+IEkgd2lzaCB3ZSBjb3VsZCBqdXN0IG1vdmUgdG8gYSBzY2VuYXJpbyB3
aGVyZSB3ZSBjYW4gc2ltcHkgYXNzdW1lIGFsbG9jYXRpb25zCj4gd2lsbCBhbHdheXMgc3VjY2Vl
ZCA6KQoKVGhhdCB3b3VsZCBiZSByZWFsbHkgbmljZSBidXQgdW5mb3J0dW5hdGVseSB0aGUgd29y
bGQgaXMgbm90IHRoYXQKcGVyZmVjdC4gSSBqdXN0IGRvbid0IHdhbnQgdG8gYmUgY2hhc2luZyBz
b21lIHJhcmVseSByZXByb2R1Y2libGUgYnVnCmJlY2F1c2Ugb2YgdGhlIGFzc3VtcHRpb24gdGhh
dCBhbiBhbGxvY2F0aW9uIGlzIHRvbyBzbWFsbCB0byBmYWlsLgoKPgo+IFZsYXN0YSAtIHRob3Vn
aHRzPwo+Cj4gQ2hlZXJzLCBMb3JlbnpvCj4KPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4KPiA+ID4g
PiA+IC0tLQo+ID4gPiA+ID4gIGZzL2Fmcy9maWxlLmMgfCAyMCArKysrKysrKysrKysrKysrLS0t
LQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9mcy9hZnMvZmlsZS5jIGIvZnMv
YWZzL2ZpbGUuYwo+ID4gPiA+ID4gaW5kZXggZjYwOTM2NmZkMmFjLi42OWVmODZmNWUyNzQgMTAw
NjQ0Cj4gPiA+ID4gPiAtLS0gYS9mcy9hZnMvZmlsZS5jCj4gPiA+ID4gPiArKysgYi9mcy9hZnMv
ZmlsZS5jCj4gPiA+ID4gPiBAQCAtMjgsNiArMjgsOCBAQCBzdGF0aWMgc3NpemVfdCBhZnNfZmls
ZV9zcGxpY2VfcmVhZChzdHJ1Y3QgZmlsZSAqaW4sIGxvZmZfdCAqcHBvcywKPiA+ID4gPiA+ICBz
dGF0aWMgdm9pZCBhZnNfdm1fb3BlbihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKmFyZWEpOwo+ID4g
PiA+ID4gIHN0YXRpYyB2b2lkIGFmc192bV9jbG9zZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKmFy
ZWEpOwo+ID4gPiA+ID4gIHN0YXRpYyB2bV9mYXVsdF90IGFmc192bV9tYXBfcGFnZXMoc3RydWN0
IHZtX2ZhdWx0ICp2bWYsIHBnb2ZmX3Qgc3RhcnRfcGdvZmYsIHBnb2ZmX3QgZW5kX3Bnb2ZmKTsK
PiA+ID4gPiA+ICtzdGF0aWMgaW50IGFmc19tYXBwZWQodW5zaWduZWQgbG9uZyBzdGFydCwgdW5z
aWduZWQgbG9uZyBlbmQsIHBnb2ZmX3QgcGdvZmYsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ICBjb25zdCBzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqKnZtX3ByaXZhdGVfZGF0YSk7Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgYWZzX2ZpbGVfb3Bl
cmF0aW9ucyA9IHsKPiA+ID4gPiA+ICAgICAub3BlbiAgICAgICAgICAgPSBhZnNfb3BlbiwKPiA+
ID4gPiA+IEBAIC02MSw2ICs2Myw3IEBAIGNvbnN0IHN0cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJh
dGlvbnMgYWZzX2ZpbGVfYW9wcyA9IHsKPiA+ID4gPiA+ICB9Owo+ID4gPiA+ID4KPiA+ID4gPiA+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IGFmc192bV9vcHMgPSB7
Cj4gPiA+ID4gPiArICAgLm1hcHBlZCAgICAgICAgID0gYWZzX21hcHBlZCwKPiA+ID4gPiA+ICAg
ICAub3BlbiAgICAgICAgICAgPSBhZnNfdm1fb3BlbiwKPiA+ID4gPiA+ICAgICAuY2xvc2UgICAg
ICAgICAgPSBhZnNfdm1fY2xvc2UsCj4gPiA+ID4gPiAgICAgLmZhdWx0ICAgICAgICAgID0gZmls
ZW1hcF9mYXVsdCwKPiA+ID4gPiA+IEBAIC01MDAsMTMgKzUwMywyMiBAQCBzdGF0aWMgaW50IGFm
c19maWxlX21tYXBfcHJlcGFyZShzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ID4gPiA+ID4g
ICAgIGFmc19hZGRfb3Blbl9tbWFwKHZub2RlKTsKPiA+ID4gPgo+ID4gPiA+IElzIHRoZSBhYm92
ZSBhZnNfYWRkX29wZW5fbW1hcCBhbiBhZGRpdGlvbmFsIG9uZSwgd2hpY2ggY291bGQgY2F1c2Ug
YSByZWZlcmVuY2UKPiA+ID4gPiBsZWFrPyBEb2VzIHRoZSBhYm92ZSBvbmUgbmVlZCB0byBiZSBy
ZW1vdmVkIGFuZCBvbmx5IHRoZSBvbmUgaW4gYWZzX21hcHBlZCgpCj4gPiA+ID4gbmVlZHMgdG8g
YmUga2VwdD8KPiA+ID4KPiA+ID4gQWggeWVhaCBnb29kIHNwb3QsIHdpbGwgZml4IHRoYW5rcyEK
PiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICByZXQgPSBnZW5lcmljX2ZpbGVf
bW1hcF9wcmVwYXJlKGRlc2MpOwo+ID4gPiA+ID4gLSAgIGlmIChyZXQgPT0gMCkKPiA+ID4gPiA+
IC0gICAgICAgICAgIGRlc2MtPnZtX29wcyA9ICZhZnNfdm1fb3BzOwo+ID4gPiA+ID4gLSAgIGVs
c2UKPiA+ID4gPiA+IC0gICAgICAgICAgIGFmc19kcm9wX29wZW5fbW1hcCh2bm9kZSk7Cj4gPiA+
ID4gPiArICAgaWYgKHJldCkKPiA+ID4gPiA+ICsgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiArICAgZGVzYy0+dm1fb3BzID0gJmFmc192bV9vcHM7Cj4gPiA+ID4g
PiAgICAgcmV0dXJuIHJldDsKPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPgo+ID4gPiA+ID4gK3N0YXRp
YyBpbnQgYWZzX21hcHBlZCh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwg
cGdvZmZfdCBwZ29mZiwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBm
aWxlICpmaWxlLCB2b2lkICoqdm1fcHJpdmF0ZV9kYXRhKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+
ICsgICBzdHJ1Y3QgYWZzX3Zub2RlICp2bm9kZSA9IEFGU19GU19JKGZpbGVfaW5vZGUoZmlsZSkp
Owo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgIGFmc19hZGRfb3Blbl9tbWFwKHZub2RlKTsKPiA+
ID4gPiA+ICsgICByZXR1cm4gMDsKPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAg
c3RhdGljIHZvaWQgYWZzX3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gPiA+
ID4gPiAgewo+ID4gPiA+ID4gICAgIGFmc19hZGRfb3Blbl9tbWFwKEFGU19GU19JKGZpbGVfaW5v
ZGUodm1hLT52bV9maWxlKSkpOwo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuNTMuMAo+ID4gPiA+
ID4KPiA+ID4gPiA+Cj4gPiA+Cj4gPiA+IENoZWVycywgTG9yZW56bwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
