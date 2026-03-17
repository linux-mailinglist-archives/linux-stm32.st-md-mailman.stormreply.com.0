Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PP8LHDIuWl/NgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 22:32:32 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BC52B2BC0
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 22:32:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EE6AC8F262;
	Tue, 17 Mar 2026 21:32:32 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B03AC87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 21:32:30 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-5091ed02c54so88981cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 14:32:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773783149; cv=none;
 d=google.com; s=arc-20240605;
 b=MuZ6+zofsLcKqSTxTcJ/w64vbmLfGUReyrw7kUp+joLxua7DzM6vGWClFnqQ8vZHif
 v6s8MO9FU9wP6lPHflr+cmz6T6uGLo09NYvKYv80XWYLr5mtRh1dG3NGVg7+XCb9NQiI
 /qLt7+ETRBcoznFCR7XQUQxjKHgTHD+Wzsp3bFFctCrsoCixT4h6PbN/XOqTd7UvTCmH
 hdfvAAe5xGvTUkGbaGns5F9tRrSDQDabGJWDwS2pG9LBPy9LqMR9QhaHeFqCW8rkjMN9
 kZPOwzd42jdfY8sh+T7hanxt3tM0/evAVda45c0c/UNMBhUDLZvcXH/7x0wLGAApvLf6
 MmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=eaVVTt78dt2IOUr/WJrEfVNvHIkRI9uCxJf+IAlfUTo=;
 fh=MLKeYwgA2nN2ya3y3tz/WhKE5EaDdkFrkXYqXraatfo=;
 b=OhHxEh+/LXh+BmgiteOpzwYJ66q6ObOZ8NSY9yXGMquup9nJBuE8CwjShnsKYK1KMd
 xa+2VSsQWNZ4wgfYK+NdIwGO1mGqvgKGwRYmICRfahxWjzyhe1BCCCJ/NuxaXisv5wdd
 A66GR7S0p7h573iKYrho+5cRv2Hb676XiSd41raoFsOEzdz7RXrcOEaXltHDXIc7gjE7
 q8VBj4mBJtVdAOATYY0b7SfLHUmblNS1/Hsb53bNIScI724we2jMV3QWFMJW6YQFJBIn
 1Fqo0l/B9QNCLa3HyWXU2oHkjt5Wv2lXlxt3XX1oLKIuCtBpLV5ug9vOKQJrO2rW+K3B
 FCBA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773783149; x=1774387949;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eaVVTt78dt2IOUr/WJrEfVNvHIkRI9uCxJf+IAlfUTo=;
 b=p3Rx8DxkN5Ozw3GNN0ttfintOvGzwjbGU3ojR2qPXw+606F8T20elw7cVERiaryczO
 gtEKPx+S1d8ic4xa6GuFVCxUErocEjyGzszER1BLd5n7C2+oZaQVZEaJuHCA1n7/S4dB
 vPDIkLoapYe+O4EIaFgO7VSm/WBubV00SguxHFea3lp6EHOx7vcnjzHwdmcuAXsyoWKu
 KpukuwlI58jvT3kq57Fh1t2/fnAoT+TkCI2R2MDf1pqKWcF4ys2b4wyEDh9v0VBd/ppR
 lZgK2oijJk/m7SEvEptWllgoeh6cmLV+t32MALgYoY0s1vF/g9Xxh/DBm9b4C9TcaVt1
 i1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773783149; x=1774387949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eaVVTt78dt2IOUr/WJrEfVNvHIkRI9uCxJf+IAlfUTo=;
 b=oFyi9lMKoMFW0EPL962FvQfnU63/GwXicR82yRkA4u2GBnkafy4weXhvDfng5a2BcI
 0VuCAdAMrOUB3lsJklfyeYu+p7imAcdOHRB7CiKvClntWSRV/SY4rlCbz7rMGVEhfjya
 rOjNGxANcpFmP3oQqB/QVsYySeqLq8fRHAwLcTkFTiWbCVB+woZFN9N/JmIN732EPsLH
 amB7FyOyP7YNPFgWNyDv2ZaXi+Lnz+oMI7r2cZjbhZG4TAjqwHanKCx0nxfBnF1de+MA
 INdubtWuKR5LKva6Fv5HPUxWHKkfYrb8QqUVcst0MEJzn1PqUQ0hKKs70QHI4k++UHhg
 ot6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEQcTD+M9ghexrZ+lYnH4of6CmH+dyQAselhl8o9BV0gG5Qnvm7kPpJQDHIs48BMO1LSg4xIory6NAHA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxIcWZOl+s2t20twCl5vXb5er4T9p+tlLDdWrqJEKvTh8LApkoA
 ILfGsgeak7gxZylIhPToo/sDBwMkQrPrNlHyr0AXePaalj2lfgXHx70FyeMRMW0LigPHTRjUqoD
 2+jOT8Th4fP8cH1Blv78L4sE1qjxrHEdZL6pQvMX1
X-Gm-Gg: ATEYQzwCp2lFADr5rJ0nIxHTdLIugC4h8fTVfD5X9lTntFrP3uxfXTxem01lUSJnyef
 zyGPY+OkOlfhbyPo5Qggbd7wjwVRabno+O5e3Qh4bsg1/7RXDammuOzpJtywRas58eD+pl+ZQyz
 nX7clCLOZ9SNXuMSpYV3PoEOOp2S09u2HiYM2cM7TXvoZWIURCARJHLVYVMtcmHwZN6Cc7jMsrc
 iQEbSfd75PyE6dVaC2HLTCyeG4DLN7y2BrjNe2ZDe/H7bmGGhiab/wuzgeutVOPCX1JBembfxfh
 r+UwHpf0SBM/7RDJQCQ5DfC3lT9mExpkvxaNHg==
X-Received: by 2002:a05:622a:1a9b:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-50b1480564fmr4695911cf.8.1773783147340; Tue, 17 Mar 2026
 14:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org>
 <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
 <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
In-Reply-To: <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Mar 2026 14:32:16 -0700
X-Gm-Features: AaiRm50LOaxRG8hnm9GByPrpi5KQ-jnLdYLBR44IEnVyj1qDMmlGA-pMovuTqLE
Message-ID: <CAJuCfpE5qZmi43EeZiRcy78pD6YvJb5n_xnoUJfwEjomowu0=A@mail.gmail.com>
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
	NEURAL_SPAM(0.00)[0.863];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 59BC52B2BC0
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgMjoyNuKAr1BNIFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3Vy
ZW5iQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxNOKA
r1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4K
PiA+IFRoZSBmX29wLT5tbWFwIGludGVyZmFjZSBpcyBkZXByZWNhdGVkLCBzbyB1cGRhdGUgZHJp
dmVyIHRvIHVzZSBpdHMKPiA+IHN1Y2Nlc3NvciwgbW1hcF9wcmVwYXJlLgo+ID4KPiA+IFRoZSBk
cml2ZXIgcHJldmlvdXNseSB1c2VkIHZtX2lvbWFwX21lbW9yeSgpLCBzbyB0aGlzIGNoYW5nZSBy
ZXBsYWNlcyBpdAo+ID4gd2l0aCBpdHMgbW1hcF9wcmVwYXJlIGVxdWl2YWxlbnQsIG1tYXBfYWN0
aW9uX3NpbXBsZV9pb3JlbWFwKCkuCj4gPgo+ID4gRnVuY3Rpb25zIHRoYXQgd3JhcCBtbWFwKCkg
YXJlIGFsc28gY29udmVydGVkIHRvIHdyYXAgbW1hcF9wcmVwYXJlKCkKPiA+IGluc3RlYWQuCj4g
Pgo+ID4gQWxzbyB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gYWNjb3JkaW5nbHkuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4K
PiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92bWUucnN0ICAgIHwgIDIgKy0K
PiA+ICBkcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmMgICAgICB8IDIwICsrKysrLS0tLS0t
Cj4gPiAgZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZS5oICAgICAgfCAgMiArLQo+ID4gIGRy
aXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5jIHwgNTEgKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDMzIGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkv
dm1lLnJzdCBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92bWUucnN0Cj4gPiBpbmRleCBjMGI0
NzUzNjlkZTAuLjcxMTE5OTlhYmMxNCAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS92bWUucnN0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdm1lLnJz
dAo+ID4gQEAgLTEwNyw3ICsxMDcsNyBAQCBUaGUgZnVuY3Rpb24gOmM6ZnVuYzpgdm1lX21hc3Rl
cl9yZWFkYCBjYW4gYmUgdXNlZCB0byByZWFkIGZyb20gYW5kCj4gPgo+ID4gIEluIGFkZGl0aW9u
IHRvIHNpbXBsZSByZWFkcyBhbmQgd3JpdGVzLCA6YzpmdW5jOmB2bWVfbWFzdGVyX3Jtd2AgaXMg
cHJvdmlkZWQgdG8KPiA+ICBkbyBhIHJlYWQtbW9kaWZ5LXdyaXRlIHRyYW5zYWN0aW9uLiBQYXJ0
cyBvZiBhIFZNRSB3aW5kb3cgY2FuIGFsc28gYmUgbWFwcGVkCj4gPiAtaW50byB1c2VyIHNwYWNl
IG1lbW9yeSB1c2luZyA6YzpmdW5jOmB2bWVfbWFzdGVyX21tYXBgLgo+ID4gK2ludG8gdXNlciBz
cGFjZSBtZW1vcnkgdXNpbmcgOmM6ZnVuYzpgdm1lX21hc3Rlcl9tbWFwX3ByZXBhcmVgLgo+ID4K
PiA+Cj4gPiAgU2xhdmUgd2luZG93cwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy92
bWVfdXNlci92bWUuYyBiL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUuYwo+ID4gaW5kZXgg
ZjEwYTAwYzA1ZjEyLi43MjIwYWJhN2I5MTkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdp
bmcvdm1lX3VzZXIvdm1lLmMKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUu
Ywo+ID4gQEAgLTczNSw5ICs3MzUsOSBAQCB1bnNpZ25lZCBpbnQgdm1lX21hc3Rlcl9ybXcoc3Ry
dWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2UsIHVuc2lnbmVkIGludCBtYXNrLAo+ID4gIEVYUE9S
VF9TWU1CT0wodm1lX21hc3Rlcl9ybXcpOwo+ID4KPiA+ICAvKioKPiA+IC0gKiB2bWVfbWFzdGVy
X21tYXAgLSBNbWFwIHJlZ2lvbiBvZiBWTUUgbWFzdGVyIHdpbmRvdy4KPiA+ICsgKiB2bWVfbWFz
dGVyX21tYXBfcHJlcGFyZSAtIE1tYXAgcmVnaW9uIG9mIFZNRSBtYXN0ZXIgd2luZG93Lgo+ID4g
ICAqIEByZXNvdXJjZTogUG9pbnRlciB0byBWTUUgbWFzdGVyIHJlc291cmNlLgo+ID4gLSAqIEB2
bWE6IFBvaW50ZXIgdG8gZGVmaW5pdGlvbiBvZiB1c2VyIG1hcHBpbmcuCj4gPiArICogQGRlc2M6
IFBvaW50ZXIgdG8gZGVzY3JpcHRvciBvZiB1c2VyIG1hcHBpbmcuCj4gPiAgICoKPiA+ICAgKiBN
ZW1vcnkgbWFwIGEgcmVnaW9uIG9mIHRoZSBWTUUgbWFzdGVyIHdpbmRvdyBpbnRvIHVzZXIgc3Bh
Y2UuCj4gPiAgICoKPiA+IEBAIC03NDUsMTIgKzc0NSwxMyBAQCBFWFBPUlRfU1lNQk9MKHZtZV9t
YXN0ZXJfcm13KTsKPiA+ICAgKiAgICAgICAgIHJlc291cmNlIG9yIC1FRkFVTFQgaWYgbWFwIGV4
Y2VlZHMgd2luZG93IHNpemUuIE90aGVyIGdlbmVyaWMgbW1hcAo+ID4gICAqICAgICAgICAgZXJy
b3JzIG1heSBhbHNvIGJlIHJldHVybmVkLgo+ID4gICAqLwo+ID4gLWludCB2bWVfbWFzdGVyX21t
YXAoc3RydWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2UsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hKQo+ID4gK2ludCB2bWVfbWFzdGVyX21tYXBfcHJlcGFyZShzdHJ1Y3Qgdm1lX3Jlc291cmNl
ICpyZXNvdXJjZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJl
YV9kZXNjICpkZXNjKQo+ID4gIHsKPiA+ICsgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyB2bWFf
c2l6ZSA9IHZtYV9kZXNjX3NpemUoZGVzYyk7Cj4gPiAgICAgICAgIHN0cnVjdCB2bWVfYnJpZGdl
ICpicmlkZ2UgPSBmaW5kX2JyaWRnZShyZXNvdXJjZSk7Cj4gPiAgICAgICAgIHN0cnVjdCB2bWVf
bWFzdGVyX3Jlc291cmNlICppbWFnZTsKPiA+ICAgICAgICAgcGh5c19hZGRyX3QgcGh5c19hZGRy
Owo+ID4gLSAgICAgICB1bnNpZ25lZCBsb25nIHZtYV9zaXplOwo+ID4KPiA+ICAgICAgICAgaWYg
KHJlc291cmNlLT50eXBlICE9IFZNRV9NQVNURVIpIHsKPiA+ICAgICAgICAgICAgICAgICBkZXZf
ZXJyKGJyaWRnZS0+cGFyZW50LCAiTm90IGEgbWFzdGVyIHJlc291cmNlXG4iKTsKPiA+IEBAIC03
NTgsMTkgKzc1OSwxOCBAQCBpbnQgdm1lX21hc3Rlcl9tbWFwKHN0cnVjdCB2bWVfcmVzb3VyY2Ug
KnJlc291cmNlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiA+ICAgICAgICAgfQo+ID4K
PiA+ICAgICAgICAgaW1hZ2UgPSBsaXN0X2VudHJ5KHJlc291cmNlLT5lbnRyeSwgc3RydWN0IHZt
ZV9tYXN0ZXJfcmVzb3VyY2UsIGxpc3QpOwo+ID4gLSAgICAgICBwaHlzX2FkZHIgPSBpbWFnZS0+
YnVzX3Jlc291cmNlLnN0YXJ0ICsgKHZtYS0+dm1fcGdvZmYgPDwgUEFHRV9TSElGVCk7Cj4gPiAt
ICAgICAgIHZtYV9zaXplID0gdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0Owo+ID4gKyAgICAg
ICBwaHlzX2FkZHIgPSBpbWFnZS0+YnVzX3Jlc291cmNlLnN0YXJ0ICsgKGRlc2MtPnBnb2ZmIDw8
IFBBR0VfU0hJRlQpOwo+ID4KPiA+ICAgICAgICAgaWYgKHBoeXNfYWRkciArIHZtYV9zaXplID4g
aW1hZ2UtPmJ1c19yZXNvdXJjZS5lbmQgKyAxKSB7Cj4gPiAgICAgICAgICAgICAgICAgZGV2X2Vy
cihicmlkZ2UtPnBhcmVudCwgIk1hcCBzaXplIGNhbm5vdCBleGNlZWQgdGhlIHdpbmRvdyBzaXpl
XG4iKTsKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiA+ICAgICAgICAgfQo+
ID4KPiA+IC0gICAgICAgdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKHZtYS0+
dm1fcGFnZV9wcm90KTsKPiA+IC0KPiA+IC0gICAgICAgcmV0dXJuIHZtX2lvbWFwX21lbW9yeSh2
bWEsIHBoeXNfYWRkciwgdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0KTsKPiA+ICsgICAgICAg
ZGVzYy0+cGFnZV9wcm90ID0gcGdwcm90X25vbmNhY2hlZChkZXNjLT5wYWdlX3Byb3QpOwo+ID4g
KyAgICAgICBtbWFwX2FjdGlvbl9zaW1wbGVfaW9yZW1hcChkZXNjLCBwaHlzX2FkZHIsIHZtYV9z
aXplKTsKPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4gLUVYUE9SVF9TWU1CT0wodm1l
X21hc3Rlcl9tbWFwKTsKPiA+ICtFWFBPUlRfU1lNQk9MKHZtZV9tYXN0ZXJfbW1hcF9wcmVwYXJl
KTsKPiA+Cj4gPiAgLyoqCj4gPiAgICogdm1lX21hc3Rlcl9mcmVlIC0gRnJlZSBWTUUgbWFzdGVy
IHdpbmRvdwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUuaCBi
L2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUuaAo+ID4gaW5kZXggNzk3ZTk5NDBmZGQxLi5i
NjQxMzYwNWVhNDkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1l
LmgKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWUuaAo+ID4gQEAgLTE1MSw3
ICsxNTEsNyBAQCBzc2l6ZV90IHZtZV9tYXN0ZXJfcmVhZChzdHJ1Y3Qgdm1lX3Jlc291cmNlICpy
ZXNvdXJjZSwgdm9pZCAqYnVmLCBzaXplX3QgY291bnQsCj4gPiAgc3NpemVfdCB2bWVfbWFzdGVy
X3dyaXRlKHN0cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNlLCB2b2lkICpidWYsIHNpemVfdCBj
b3VudCwgbG9mZl90IG9mZnNldCk7Cj4gPiAgdW5zaWduZWQgaW50IHZtZV9tYXN0ZXJfcm13KHN0
cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNlLCB1bnNpZ25lZCBpbnQgbWFzaywgdW5zaWduZWQg
aW50IGNvbXBhcmUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50
IHN3YXAsIGxvZmZfdCBvZmZzZXQpOwo+ID4gLWludCB2bWVfbWFzdGVyX21tYXAoc3RydWN0IHZt
ZV9yZXNvdXJjZSAqcmVzb3VyY2UsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiA+ICtp
bnQgdm1lX21hc3Rlcl9tbWFwX3ByZXBhcmUoc3RydWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2Us
IHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpOwo+ID4gIHZvaWQgdm1lX21hc3Rlcl9mcmVlKHN0
cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNlKTsKPiA+Cj4gPiAgc3RydWN0IHZtZV9yZXNvdXJj
ZSAqdm1lX2RtYV9yZXF1ZXN0KHN0cnVjdCB2bWVfZGV2ICp2ZGV2LCB1MzIgcm91dGUpOwo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5jIGIvZHJpdmVy
cy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV91c2VyLmMKPiA+IGluZGV4IGQ5NWRkN2Q5MTkwYS4uMTFl
MjVjMmY2YjBhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV91
c2VyLmMKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5jCj4gPiBA
QCAtNDQ2LDI0ICs0NDYsMTQgQEAgc3RhdGljIHZvaWQgdm1lX3VzZXJfdm1fY2xvc2Uoc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gPiAgICAgICAgIGtmcmVlKHZtYV9wcml2KTsKPiA+ICB9
Cj4gPgo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qgdm1lX3Vz
ZXJfdm1fb3BzID0gewo+ID4gLSAgICAgICAub3BlbiA9IHZtZV91c2VyX3ZtX29wZW4sCj4gPiAt
ICAgICAgIC5jbG9zZSA9IHZtZV91c2VyX3ZtX2Nsb3NlLAo+ID4gLX07Cj4gPiAtCj4gPiAtc3Rh
dGljIGludCB2bWVfdXNlcl9tYXN0ZXJfbW1hcCh1bnNpZ25lZCBpbnQgbWlub3IsIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hKQo+ID4gK3N0YXRpYyBpbnQgdm1lX3VzZXJfdm1fbWFwcGVkKHVu
c2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBwZ29mZl90IHBnb2ZmLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZpbGUgKmZpbGUsIHZv
aWQgKip2bV9wcml2YXRlX2RhdGEpCj4gPiAgewo+ID4gLSAgICAgICBpbnQgZXJyOwo+ID4gKyAg
ICAgICBjb25zdCB1bnNpZ25lZCBpbnQgbWlub3IgPSBpbWlub3IoZmlsZV9pbm9kZShmaWxlKSk7
Cj4gPiAgICAgICAgIHN0cnVjdCB2bWVfdXNlcl92bWFfcHJpdiAqdm1hX3ByaXY7Cj4gPgo+ID4g
ICAgICAgICBtdXRleF9sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwo+ID4KPiA+IC0gICAgICAg
ZXJyID0gdm1lX21hc3Rlcl9tbWFwKGltYWdlW21pbm9yXS5yZXNvdXJjZSwgdm1hKTsKPiA+IC0g
ICAgICAgaWYgKGVycikgewo+ID4gLSAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmaW1hZ2Vb
bWlub3JdLm11dGV4KTsKPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ID4gLSAgICAg
ICB9Cj4gPiAtCj4KPiBPaywgdGhpcyBjaGFuZ2VzIHRoZSBzZXQgb2YgdGhlIG9wZXJhdGlvbnMg
cGVyZm9ybWVkIHVuZGVyIGltYWdlW21pbm9yXS5tdXRleC4KPiBCZWZvcmUgd2UgaGFkOgo+Cj4g
bXV0ZXhfbG9jaygmaW1hZ2VbbWlub3JdLm11dGV4KTsKPiB2bWVfbWFzdGVyX21tYXAoKTsKPiA8
c29tZSBmaW5hbCBhZGp1c3RtZW50cz4KPiBtdXRleF91bmxvY2soJmltYWdlW21pbm9yXS5tdXRl
eCk7Cj4KPiBOb3cgd2UgaGF2ZToKPgo+IG11dGV4X2xvY2soJmltYWdlW21pbm9yXS5tdXRleCk7
Cj4gdm1lX21hc3Rlcl9tbWFwX3ByZXBhcmUoKQo+IG11dGV4X3VubG9jaygmaW1hZ2VbbWlub3Jd
Lm11dGV4KTsKPiB2bV9pb21hcF9tZW1vcnkoKTsKPiBtdXRleF9sb2NrKCZpbWFnZVttaW5vcl0u
bXV0ZXgpOwo+IHZtZV91c2VyX3ZtX21hcHBlZCgpOyAvLyA8c29tZSBmaW5hbCBhZGp1c3RtZW50
cz4KPiBtdXRleF91bmxvY2soJmltYWdlW21pbm9yXS5tdXRleCk7Cj4KPiBJIHRoaW5rIGFzIGxv
bmcgYXMgaW1hZ2VbbWlub3JdIGRvZXMgbm90IGNoYW5nZSB3aGlsZSB3ZSBhcmUgbm90Cj4gaG9s
ZGluZyB0aGUgbXV0ZXggd2Ugc2hvdWxkIGJlIHNhZmUsIGFuZCBsb29raW5nIGF0IHRoZSBjb2Rl
IGl0IHNlZW1zCj4gdG8gYmUgdGhlIGNhc2UuIEJ1dCBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhp
cyBkcml2ZXIgYW5kIG1pZ2h0IGJlCj4gd3JvbmcuIFdvcnRoIGRvdWJsZS1jaGVja2luZy4KCkEg
c2lkZSBub3RlOiBpZiB3ZSBoYWQgdG8gaG9sZCB0aGUgbXV0ZXggYWNyb3NzIGFsbCB0aG9zZSBv
cGVyYXRpb25zIEkKdGhpbmsgd2Ugd291bGQgbmVlZCB0byB0YWtlIHRoZSBtdXRleCBpbiB0aGUg
dm1fb3BzLT5tbWFwX3ByZXBhcmUgYW5kCmFkZCBhIHZtX29wcy0+bWFwX2ZhaWxlZCBob29rIG9y
IHNvbWV0aGluZyBhbG9uZyB0aGF0IGxpbmUgdG8gZHJvcCB0aGUKbXV0ZXggaW4gY2FzZSBtbWFw
X2FjdGlvbl9jb21wbGV0ZSgpIGZhaWxzLiBOb3Qgc3VyZSBpZiB3ZSB3aWxsIGhhdmUKc3VjaCBj
YXNlcyB0aG91Z2guLi4KCj4KPiA+ICAgICAgICAgdm1hX3ByaXYgPSBrbWFsbG9jX29iaigqdm1h
X3ByaXYpOwo+ID4gICAgICAgICBpZiAoIXZtYV9wcml2KSB7Cj4gPiAgICAgICAgICAgICAgICAg
bXV0ZXhfdW5sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwo+ID4gQEAgLTQ3MiwyMiArNDYyLDQx
IEBAIHN0YXRpYyBpbnQgdm1lX3VzZXJfbWFzdGVyX21tYXAodW5zaWduZWQgaW50IG1pbm9yLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiA+Cj4gPiAgICAgICAgIHZtYV9wcml2LT5taW5v
ciA9IG1pbm9yOwo+ID4gICAgICAgICByZWZjb3VudF9zZXQoJnZtYV9wcml2LT5yZWZjbnQsIDEp
Owo+ID4gLSAgICAgICB2bWEtPnZtX29wcyA9ICZ2bWVfdXNlcl92bV9vcHM7Cj4gPiAtICAgICAg
IHZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gdm1hX3ByaXY7Cj4gPiAtCj4gPiArICAgICAgICp2bV9w
cml2YXRlX2RhdGEgPSB2bWFfcHJpdjsKPiA+ICAgICAgICAgaW1hZ2VbbWlub3JdLm1tYXBfY291
bnQrKzsKPiA+Cj4gPiAgICAgICAgIG11dGV4X3VubG9jaygmaW1hZ2VbbWlub3JdLm11dGV4KTsK
PiA+IC0KPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgaW50IHZt
ZV91c2VyX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
KQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qgdm1lX3VzZXJf
dm1fb3BzID0gewo+ID4gKyAgICAgICAubWFwcGVkID0gdm1lX3VzZXJfdm1fbWFwcGVkLAo+ID4g
KyAgICAgICAub3BlbiA9IHZtZV91c2VyX3ZtX29wZW4sCj4gPiArICAgICAgIC5jbG9zZSA9IHZt
ZV91c2VyX3ZtX2Nsb3NlLAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIGludCB2bWVfdXNlcl9t
YXN0ZXJfbW1hcF9wcmVwYXJlKHVuc2lnbmVkIGludCBtaW5vciwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ID4g
K3sKPiA+ICsgICAgICAgaW50IGVycjsKPiA+ICsKPiA+ICsgICAgICAgbXV0ZXhfbG9jaygmaW1h
Z2VbbWlub3JdLm11dGV4KTsKPiA+ICsKPiA+ICsgICAgICAgZXJyID0gdm1lX21hc3Rlcl9tbWFw
X3ByZXBhcmUoaW1hZ2VbbWlub3JdLnJlc291cmNlLCBkZXNjKTsKPiA+ICsgICAgICAgaWYgKCFl
cnIpCj4gPiArICAgICAgICAgICAgICAgZGVzYy0+dm1fb3BzID0gJnZtZV91c2VyX3ZtX29wczsK
PiA+ICsKPiA+ICsgICAgICAgbXV0ZXhfdW5sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwo+ID4g
KyAgICAgICByZXR1cm4gZXJyOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IHZtZV91c2Vy
X21tYXBfcHJlcGFyZShzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ID4gIHsKPiA+IC0gICAg
ICAgdW5zaWduZWQgaW50IG1pbm9yID0gaW1pbm9yKGZpbGVfaW5vZGUoZmlsZSkpOwo+ID4gKyAg
ICAgICBjb25zdCBzdHJ1Y3QgZmlsZSAqZmlsZSA9IGRlc2MtPmZpbGU7Cj4gPiArICAgICAgIGNv
bnN0IHVuc2lnbmVkIGludCBtaW5vciA9IGltaW5vcihmaWxlX2lub2RlKGZpbGUpKTsKPiA+Cj4g
PiAgICAgICAgIGlmICh0eXBlW21pbm9yXSA9PSBNQVNURVJfTUlOT1IpCj4gPiAtICAgICAgICAg
ICAgICAgcmV0dXJuIHZtZV91c2VyX21hc3Rlcl9tbWFwKG1pbm9yLCB2bWEpOwo+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiB2bWVfdXNlcl9tYXN0ZXJfbW1hcF9wcmVwYXJlKG1pbm9yLCBkZXNj
KTsKPiA+Cj4gPiAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ID4gIH0KPiA+IEBAIC00OTgsNyAr
NTA3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgdm1lX3VzZXJfZm9w
cyA9IHsKPiA+ICAgICAgICAgLmxsc2VlayA9IHZtZV91c2VyX2xsc2VlaywKPiA+ICAgICAgICAg
LnVubG9ja2VkX2lvY3RsID0gdm1lX3VzZXJfdW5sb2NrZWRfaW9jdGwsCj4gPiAgICAgICAgIC5j
b21wYXRfaW9jdGwgPSBjb21wYXRfcHRyX2lvY3RsLAo+ID4gLSAgICAgICAubW1hcCA9IHZtZV91
c2VyX21tYXAsCj4gPiArICAgICAgIC5tbWFwX3ByZXBhcmUgPSB2bWVfdXNlcl9tbWFwX3ByZXBh
cmUsCj4gPiAgfTsKPiA+Cj4gPiAgc3RhdGljIGludCB2bWVfdXNlcl9tYXRjaChzdHJ1Y3Qgdm1l
X2RldiAqdmRldikKPiA+IC0tCj4gPiAyLjUzLjAKPiA+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
