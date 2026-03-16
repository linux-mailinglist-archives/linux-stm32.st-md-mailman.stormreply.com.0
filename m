Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDHLFeVrt2kYRAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 03:33:09 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6B12941AC
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 03:33:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F33FC87EBD;
	Mon, 16 Mar 2026 02:33:08 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D42C1C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 02:33:06 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-509062d829dso709021cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2026 19:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773628385; cv=none;
 d=google.com; s=arc-20240605;
 b=gaSGcD9G71wblivGHp7mGqgDyVUtWLujpqKI4JhnQV8BgEWXYAkuwN1tvFP2bRqi6a
 NOG/1PJHcGGN1GqzOW1zC7/VZc4Ke3mEJ8Vx9j5ke1Q/FUreVCXtfx8bx++T1NYD4vYi
 U1+u+VmgHld/nXTEujmzzaik8PO45pdnRZF+MbboNOI1x3DzMwIoAQoeUklAi6DvSLeI
 rU6PXSD2hjUMPLONrQbKirB/L4C1zTBg3lhTiFwZJjmNQ45gtLruP6bOa5KDvos5cEjz
 berNQ5CEJPQAcd3wGdfPsMvYlHxAQbVobuZn6SYE+uB2NmIJWDwj6VZCBn2ACsLxgYBf
 8dGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
 fh=Wf4oAQsS+oPzkIjCygP1EZIR3213/xJoo4rvKzLjggM=;
 b=IHrRVTdsR733D6zOCKZyZIxkO33HkY8kt2Jy4nNg2od8K03tjwbdrLdtYDSXOHNgQq
 8x4zfdkhUvvqNONJylzq2m1Fy6o+/TohiW3ptDVfRpHMIRwFM3L6Ev2sJ13B1R4FBj+U
 EsnD7cplMZoLpowoO/mfyPyFVES2RnuWI6D3gefplw2EbHFypyq6LCAO0E8K3ZszexEk
 YJ/ccjZQaPexn5+OtTQPX49vbE9vEP/XzBrw37w89qtsQiYEhGlkOynpIKoWBB+xyuob
 AQddb6NqBZ4hmVpPTLVzJXjWfadCuLnMj197jpQ7ztwH/8RMxpzpdbSz3oAKIoWOpxx3
 8JMg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773628385; x=1774233185;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
 b=j1k03IWaPIYRTezMRlZDWiymRCAMp+dbM+EQbYugtk2B4kkxpIIvVkzO6N5eL/cMwH
 ZzUace8N2M18U0jHM/Rq1xk11ZGberC0WaGm1RBKBMW2XD5zjeVpOF/NvqZwBdOWQHPX
 SV0n2NVw1LIktHbTlErlZJ9+Nygxqa6zGG6Ixo2fZwqLJDFk8l8aFYLXUKA/j77uVjMF
 tnG1dkLuABLdx7dcjaRPabqvFdFVk/FZxz9zLMs1zEfmm8fxHCb8Cw4DT0onLcNqLT+b
 DQtjUMoKbMD2FjvGWl0dt2wjLtavPh5ufQanQJjMMnuuLX6uooX3IgSDHJex86TYAylB
 8yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773628385; x=1774233185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SOxR7OMcrpIXquZYk6Fw42QRhAnf+JOcixO64waw3M8=;
 b=KRVYG2KDJYuy+FE3pD2hVvJVau60LsBlsEYjq3v9gZVn7w8TZyVX7i3gM1jmjrb5yv
 Ec8hh1kJtL+EG8lGibdj5uV+oeZv1z+OAJnxQqUdmnOJu1KXzEP67WZifAJBBudyOg+d
 gcvKd0tE8w3N+3puTWB6zz3j5h9DYogKubxnGM07q63cgqZRIt7Qh/MLdA8ATJ+IGy9h
 +huGnk7A8A4P37XNkQ38zSjY/V/IyvR3ZfYhAaufAYUw0PPMJgiBUGROCIi0WXZh/p2h
 IxjCXkv9RPXdFt63kRrOuVtOp3ltr40jDIgFb8scm5YMGdLTmETlTK78KAmi2C8Sv+hm
 Ob6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqUtE/vIXgEZwsG1CeeCGgCh5Bo9rHcZXYd6kDfSKhSERmRchtRGqX55BiE6+xR05hLqrSvAwikwp8YQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzsKYhGUAm+fZxWEv3WNiKdZvTvyodogC2wGZVaBVUuK+Lif6By
 eHJna2N7c5pMR0ll41oc70HvDV9bajC5qkGHz04lS2oP7+SARJ1OA5wy8SCyuqdLqC+wVmGi5hq
 HEj/ij6KVoRM0uVX8q/EOzuzaiKnZkrRT2y+Ox1GL
X-Gm-Gg: ATEYQzwrEuyBTkMzNJSmxvXWdGO9NGY9T6m+q1RFNy5JePgEO3anMKAo69VAucgrSAm
 7EuHY6NrL6SwoYVp1YgRg2ZeHl3uqA4P5HQr/YAT+g167UotNhP26EKYto8X47vP4Yfv2+P4buD
 WoWHM3b6Dx9JTljktjh+TFriKvTNkyHcoJJundyMYJb1XCNVHeCl+J0Sb1h3i+IXqahN2yN31d8
 Blgs1TTkWI25Cf7/RvE5q/unwhmzN6wGSlfWgT8dj4arMVuQNDvFRXB4b7O76NhAlQNECGSvrWG
 R2Et6Q==
X-Received: by 2002:a05:622a:60c:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-5096a92ebdbmr823271cf.1.1773628384887; Sun, 15 Mar 2026
 19:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev>
 <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
In-Reply-To: <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 19:32:54 -0700
X-Gm-Features: AaiRm52_478_pqzpMaMH6nJQtQvcaF-xKuK5uDWZ-u00xGMYRYKMJPl6M-Q1q5E
Message-ID: <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:arnd@arndb.de,m:linux-scsi@vger.kernel.org,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:usama.arif@linux.dev,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:vbabka@kernel.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail
 .com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,arndb.de,nod.at,lists.linux.dev,suse.de,arm.com,linux.dev,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com,linux-foundation.org];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: EE6B12941AC
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgNTowMOKAr0FNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMDQ6
MDc6NDNBTSAtMDcwMCwgVXNhbWEgQXJpZiB3cm90ZToKPiA+IE9uIFRodSwgMTIgTWFyIDIwMjYg
MjA6Mjc6MjAgKzAwMDAgIkxvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSIgPGxqc0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Cj4gPiA+IENvbW1pdCA5ZDU0MDNiMTAzNmMgKCJmczogY29udmVydCBtb3N0
IG90aGVyIGdlbmVyaWNfZmlsZV8qbW1hcCgpIHVzZXJzIHRvCj4gPiA+IC5tbWFwX3ByZXBhcmUo
KSIpIHVwZGF0ZWQgQUZTIHRvIHVzZSB0aGUgbW1hcF9wcmVwYXJlIGNhbGxiYWNrIGluIGZhdm91
ciBvZgo+ID4gPiB0aGUgZGVwcmVjYXRlZCBtbWFwIGNhbGxiYWNrLgo+ID4gPgo+ID4gPiBIb3dl
dmVyLCBpdCBkaWQgbm90IGFjY291bnQgZm9yIHRoZSBmYWN0IHRoYXQgbW1hcF9wcmVwYXJlIGNh
biBmYWlsIHRvIG1hcAo+ID4gPiBkdWUgdG8gYW4gb3V0IG9mIG1lbW9yeSBlcnJvciwgYW5kIHRo
dXMgc2hvdWxkIG5vdCBiZSBpbmNyZW1lbnRpbmcgYQo+ID4gPiByZWZlcmVuY2UgY291bnQgb24g
bW1hcF9wcmVwYXJlLgoKVGhpcyBpcyBhIGJpdCBjb25mdXNpbmcuIEkgc2VlIHRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIGRvZXMKYWZzX2FkZF9vcGVuX21tYXAoKSBhbmQgdGhlbiBpZiBnZW5l
cmljX2ZpbGVfbW1hcF9wcmVwYXJlKCkgZmFpbHMgaXQKZG9lcyBhZnNfZHJvcF9vcGVuX21tYXAo
KSwgdGhlcmVmb3JlIHJlZmNvdW50aW5nIHNlZW1zIHRvIGJlIGJhbGFuY2VkLgpJcyB0aGVyZSBy
ZWFsbHkgYSBwcm9ibGVtPwoKPiA+ID4KPiA+ID4gV2l0aCB0aGUgbmV3bHkgYWRkZWQgdm1fb3Bz
LT5tYXBwZWQgY2FsbGJhY2sgYXZhaWxhYmxlLCB3ZSBjYW4gc2ltcGx5IGRlZmVyCj4gPiA+IHRo
aXMgb3BlcmF0aW9uIHRvIHRoYXQgY2FsbGJhY2sgd2hpY2ggaXMgb25seSBpbnZva2VkIG9uY2Ug
dGhlIG1hcHBpbmcgaXMKPiA+ID4gc3VjY2Vzc2Z1bGx5IGluIHBsYWNlIChidXQgbm90IHlldCB2
aXNpYmxlIHRvIHVzZXJzcGFjZSBhcyB0aGUgbW1hcCBhbmQgVk1BCj4gPiA+IHdyaXRlIGxvY2tz
IGFyZSBoZWxkKS4KPiA+ID4KPiA+ID4gVGhlcmVmb3JlIGFkZCBhZnNfbWFwcGVkKCkgdG8gaW1w
bGVtZW50IHRoaXMgY2FsbGJhY2sgZm9yIEFGUy4KPiA+ID4KPiA+ID4gSW4gcHJhY3RpY2UgdGhl
IG1hcHBpbmcgYWxsb2NhdGlvbnMgYXJlICd0b28gc21hbGwgdG8gZmFpbCcgc28gdGhpcyBpcwo+
ID4gPiBzb21ldGhpbmcgdGhhdCByZWFsaXN0aWNhbGx5IHNob3VsZCBuZXZlciBoYXBwZW4gaW4g
cHJhY3RpY2UgKG9yIHdvdWxkIGRvCj4gPiA+IHNvIGluIGEgY2FzZSB3aGVyZSB0aGUgcHJvY2Vz
cyBpcyBhYm91dCB0byBkaWUgYW55d2F5KSwgYnV0IHdlIHNob3VsZCBzdGlsbAo+ID4gPiBoYW5k
bGUgdGhpcy4KCm5pdDogSSB3b3VsZCBkcm9wIHRoZSBhYm92ZSBwYXJhZ3JhcGguIElmIGl0J3Mg
aW1wb3NzaWJsZSB3aHkgYXJlIHlvdQpoYW5kbGluZyBpdD8gSWYgaXQncyB1bmxpa2VseSwgdGhl
biBoYW5kbGluZyBpdCBpcyBldmVuIG1vcmUKaW1wb3J0YW50LgoKPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4KPiA+ID4g
LS0tCj4gPiA+ICBmcy9hZnMvZmlsZS5jIHwgMjAgKysrKysrKysrKysrKysrKy0tLS0KPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvZnMvYWZzL2ZpbGUuYyBiL2ZzL2Fmcy9maWxlLmMKPiA+ID4gaW5k
ZXggZjYwOTM2NmZkMmFjLi42OWVmODZmNWUyNzQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2ZzL2Fmcy9m
aWxlLmMKPiA+ID4gKysrIGIvZnMvYWZzL2ZpbGUuYwo+ID4gPiBAQCAtMjgsNiArMjgsOCBAQCBz
dGF0aWMgc3NpemVfdCBhZnNfZmlsZV9zcGxpY2VfcmVhZChzdHJ1Y3QgZmlsZSAqaW4sIGxvZmZf
dCAqcHBvcywKPiA+ID4gIHN0YXRpYyB2b2lkIGFmc192bV9vcGVuKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqYXJlYSk7Cj4gPiA+ICBzdGF0aWMgdm9pZCBhZnNfdm1fY2xvc2Uoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICphcmVhKTsKPiA+ID4gIHN0YXRpYyB2bV9mYXVsdF90IGFmc192bV9tYXBfcGFn
ZXMoc3RydWN0IHZtX2ZhdWx0ICp2bWYsIHBnb2ZmX3Qgc3RhcnRfcGdvZmYsIHBnb2ZmX3QgZW5k
X3Bnb2ZmKTsKPiA+ID4gK3N0YXRpYyBpbnQgYWZzX21hcHBlZCh1bnNpZ25lZCBsb25nIHN0YXJ0
LCB1bnNpZ25lZCBsb25nIGVuZCwgcGdvZmZfdCBwZ29mZiwKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKip2bV9wcml2YXRlX2RhdGEpOwo+ID4g
Pgo+ID4gPiAgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBhZnNfZmlsZV9vcGVyYXRpb25z
ID0gewo+ID4gPiAgICAgLm9wZW4gICAgICAgICAgID0gYWZzX29wZW4sCj4gPiA+IEBAIC02MSw2
ICs2Myw3IEBAIGNvbnN0IHN0cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgYWZzX2ZpbGVf
YW9wcyA9IHsKPiA+ID4gIH07Cj4gPiA+Cj4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29w
ZXJhdGlvbnNfc3RydWN0IGFmc192bV9vcHMgPSB7Cj4gPiA+ICsgICAubWFwcGVkICAgICAgICAg
PSBhZnNfbWFwcGVkLAo+ID4gPiAgICAgLm9wZW4gICAgICAgICAgID0gYWZzX3ZtX29wZW4sCj4g
PiA+ICAgICAuY2xvc2UgICAgICAgICAgPSBhZnNfdm1fY2xvc2UsCj4gPiA+ICAgICAuZmF1bHQg
ICAgICAgICAgPSBmaWxlbWFwX2ZhdWx0LAo+ID4gPiBAQCAtNTAwLDEzICs1MDMsMjIgQEAgc3Rh
dGljIGludCBhZnNfZmlsZV9tbWFwX3ByZXBhcmUoc3RydWN0IHZtX2FyZWFfZGVzYyAqZGVzYykK
PiA+ID4gICAgIGFmc19hZGRfb3Blbl9tbWFwKHZub2RlKTsKPiA+Cj4gPiBJcyB0aGUgYWJvdmUg
YWZzX2FkZF9vcGVuX21tYXAgYW4gYWRkaXRpb25hbCBvbmUsIHdoaWNoIGNvdWxkIGNhdXNlIGEg
cmVmZXJlbmNlCj4gPiBsZWFrPyBEb2VzIHRoZSBhYm92ZSBvbmUgbmVlZCB0byBiZSByZW1vdmVk
IGFuZCBvbmx5IHRoZSBvbmUgaW4gYWZzX21hcHBlZCgpCj4gPiBuZWVkcyB0byBiZSBrZXB0Pwo+
Cj4gQWggeWVhaCBnb29kIHNwb3QsIHdpbGwgZml4IHRoYW5rcyEKPgo+ID4KPiA+ID4KPiA+ID4g
ICAgIHJldCA9IGdlbmVyaWNfZmlsZV9tbWFwX3ByZXBhcmUoZGVzYyk7Cj4gPiA+IC0gICBpZiAo
cmV0ID09IDApCj4gPiA+IC0gICAgICAgICAgIGRlc2MtPnZtX29wcyA9ICZhZnNfdm1fb3BzOwo+
ID4gPiAtICAgZWxzZQo+ID4gPiAtICAgICAgICAgICBhZnNfZHJvcF9vcGVuX21tYXAodm5vZGUp
Owo+ID4gPiArICAgaWYgKHJldCkKPiA+ID4gKyAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4g
Kwo+ID4gPiArICAgZGVzYy0+dm1fb3BzID0gJmFmc192bV9vcHM7Cj4gPiA+ICAgICByZXR1cm4g
cmV0Owo+ID4gPiAgfQo+ID4gPgo+ID4gPiArc3RhdGljIGludCBhZnNfbWFwcGVkKHVuc2lnbmVk
IGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBwZ29mZl90IHBnb2ZmLAo+ID4gPiArICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqKnZtX3ByaXZhdGVf
ZGF0YSkKPiA+ID4gK3sKPiA+ID4gKyAgIHN0cnVjdCBhZnNfdm5vZGUgKnZub2RlID0gQUZTX0ZT
X0koZmlsZV9pbm9kZShmaWxlKSk7Cj4gPiA+ICsKPiA+ID4gKyAgIGFmc19hZGRfb3Blbl9tbWFw
KHZub2RlKTsKPiA+ID4gKyAgIHJldHVybiAwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICBzdGF0
aWMgdm9pZCBhZnNfdm1fb3BlbihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiA+ID4gIHsK
PiA+ID4gICAgIGFmc19hZGRfb3Blbl9tbWFwKEFGU19GU19JKGZpbGVfaW5vZGUodm1hLT52bV9m
aWxlKSkpOwo+ID4gPiAtLQo+ID4gPiAyLjUzLjAKPiA+ID4KPiA+ID4KPgo+IENoZWVycywgTG9y
ZW56bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
