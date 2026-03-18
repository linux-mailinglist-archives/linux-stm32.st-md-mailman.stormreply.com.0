Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO9EGI7MummfcAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 17:02:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 377712BEE3E
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 17:02:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0439C87ED8;
	Wed, 18 Mar 2026 16:02:20 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA064C87EC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 16:02:19 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-509069a7a7fso645281cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 09:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773849739; cv=none;
 d=google.com; s=arc-20240605;
 b=hzBD96khk938VFhoba5mNBlF/MTT6GG35EaWhzNP639uzbbGLACZ5qbApPBGXN3ksg
 sns5Z/YJaphRWYQKktaNqwUtj3gZNv1uVvq0ZUPgGmS6dH2gjaOkNWTwM0fmLUOup0Mm
 ntdo/u1quodxNmwXgjNg/ASJmPK4CJPGcvhnOLn9T3YztVjPS2dH1GR/D2VgR+PMPsJU
 bsXnxY3XN3qWM1U3cxJ9GreFFFDoatBwmE3WFm9IaSs9d+qVoOnKAgIIlEV+EXHNs3zC
 Qb6uONHiuIPilUJ+8U/NN5e19JeHd5e1nTIRrevLLCetxOAzKDGf9ZbDF71gdkFuXcms
 iZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
 fh=AwajJYsi5L/bDs6c6X6tX99yC9Xakg/ggY5v1gqxs8c=;
 b=KQ1U4JgNtYnNnv58u849GiDmoRXbAky1rrISuS2Fn2PrNqq86v06leUytApdHCdbFj
 baya75sCBuuaTDNYTHPWrarxu5R2kcowCnTc0PcWbhj/mdI+Mk+KDi3HAKLAgK6sb7ha
 jV2yBm56MuLZLc9PvkJOBYUrTh7lCvlKRXaPqyD0Hx/9HVof3ZGGH62ToftNo87+RBx1
 UXD7UFF2hCAdX6HXErOnCoi2iY7Jj2DLzlmVpuzN/NzcACFG7OsEKtjMUxaynpfns3pR
 y7sDRHGDtFvlhsvbD3SpuzClNP78XGXWeAm5+42YvA86kA5S52PcY2jvVdp7yVlfO8KZ
 MnLw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773849739; x=1774454539;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
 b=Sqtn8VgcM/rJ6r8+wwdpQauzqsFAXHPFHZq9W0sDrOACFHYwRlWWLNJ4suPot3gU6B
 gMZs783c6baB5/7I1vajxc+zEltytUc3sp3xH4j1SMULwvoqUVE9XWFbwJjewPx9sw7x
 DBc1DO46o4uWb4eMlQEfBjRcjJHEniBVC8BCxnLn2AYEmTu/fe1v1uYHJUE1zu4bYTL7
 iOjg/TzT0v0u6GT5ZfzI5kP+ET1uYaaMFoS7CtHEGLmFOsTjylXzhw0KCe/n5kwDOh87
 qGc08GQw8tx9TwhwtYQ0YDO+piL1YWazf18dl+YGtSWEdMPyUpLMtfzUVDcZrflqpno1
 7Jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773849739; x=1774454539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
 b=Ha80SV0xG9vubAIHUofb6AHFNx2AhOMDJTeJowpXNcdLrhYBf7+Fsc6rBE6tvv0Oyz
 hJvRk1NxkZvyf/mwk5U3Wb1jLBwfK40nGtv26MbJzeFMy9WtxBRfMyF3yRDNe01vccM2
 7Vjtb45/ku+KsRI5LkQAsef2BXFQm4d4u8TvIY7j91nyX4sikommgpisYVXL6QmxqLvN
 cZ8L3YgbmSolQcPM+4zjBoUkNCAyk3JOTSB7nd23fAzA0KxG+Ed2mWVvYIRhVOclkkVi
 559+I5jm+CAlZm0r6swiT+LCUw0WB2i7aeDj0AlS2Ar9F75aFpnsIeGcx2HUKNz2Q2SE
 Y67Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoApVhDPkWm887dUMen79V3Pa4l5BEiPe7RiQpx5dyCps+4VWj1n2Hr8GCgvMo/xSF2PU8NEhsSO7zTg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywa324HZF6eOEh0GsG1eYN+IuKWwwcXw/bjV8NTSe9H11JvUBgV
 +KZttpN9Nt4PleGip+6A7QGjq1GsHzhzsDJlaNV8UxbxDeOAMdU1Sk36y35coCv+rtphtdxEhcw
 5c+lbxZvnnMuiAwlFnOaH4uj2JGMAhYHPWDU++5lb
X-Gm-Gg: ATEYQzwjC4Do/bEFIG4EJMAgshCRgVvOPPplj6VNqJVSfamTRI9wBchn2H64JdoCqzh
 lqeEcyeC1voDOcll4wDklDkXxo/k27q6eCm25P/9M+SN3jPEK/ok2MNic4ZmyJlls1lA5s/GqgL
 P3ypiGZGe0/nE49NjFVNNU3djQt7RUurkkaHxxEkKVFPW6gfQ52IUy59QZYLEuIdyoTG3hHDcgA
 OFf5VAE7uYdKGDY3XmVcgye9ItvfgvCkauSD9H6aztnGbg7CKP5CQQlBh+2rDVwhuUlEvHbus9d
 NC+yMroQNQHZyE4H9gZBhxraoWknKC3uMt9jd9iAaVvW/SZo
X-Received: by 2002:ac8:5d4e:0:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-50b1462cacfmr16816931cf.0.1773849737454; Wed, 18 Mar 2026
 09:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org>
 <4e152e7b8e1a93baf0777628eef9409d031cf8f6.1773695307.git.ljs@kernel.org>
In-Reply-To: <4e152e7b8e1a93baf0777628eef9409d031cf8f6.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Mar 2026 09:02:04 -0700
X-Gm-Features: AaiRm52kf0p9Fxu6EolM9nhc_2BIDOLEzyHhrKwtGPKlzkXo42y6XvhNDeOCJ6g
Message-ID: <CAJuCfpFd-d-E24d5-G6=dSYDpyHkwS=aXzGd6+SzyMkgssyPAw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 16/16] mm: on remap assert that input
 range within the proposed VMA
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
	NEURAL_SPAM(0.00)[0.973];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 377712BEE3E
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxNOKAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gTm93IHdlIGhhdmUgcmFuZ2VfaW5fdm1hX2Rl
c2MoKSwgdXBkYXRlIHJlbWFwX3Bmbl9yYW5nZV9wcmVwYXJlKCkgdG8gY2hlY2sKPiB3aGV0aGVy
IHRoZSBpbnB1dCByYW5nZSBpbiBjb250YWluZWQgd2l0aGluIHRoZSBzcGVjaWZpZWQgVk1BLCBz
byB3ZSBjYW4KCnMvaW4gY29udGFpbmVkL2lzIGNvbnRhaW5lZAoKPiBmYWlsIGF0IHByZXBhcmUg
dGltZSBpZiBhbiBpbnZhbGlkIHJhbmdlIGlzIHNwZWNpZmllZC4KPgo+IFRoaXMgY292ZXJzIHRo
ZSBJL08gcmVtYXAgbW1hcCBhY3Rpb25zIGFsc28gd2hpY2ggdWx0aW1hdGVseSBjYWxsIGludG8g
dGhpcwo+IGZ1bmN0aW9uLCBhbmQgb3RoZXIgbW1hcCBhY3Rpb24gdHlwZXMgZWl0aGVyIGFscmVh
ZHkgc3BhbiB0aGUgZnVsbCBWTUEgb3IKPiBjaGVjayB0aGlzIGFscmVhZHkuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPgoKUmV2aWV3
ZWQtYnk6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBt
bS9tZW1vcnkuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9tbS9tZW1vcnkuYyBiL21tL21lbW9yeS5jCj4gaW5kZXggODQ5ZDVkOWVl
YjgzLi5kZTBkZDE3NzU5ZTIgMTAwNjQ0Cj4gLS0tIGEvbW0vbWVtb3J5LmMKPiArKysgYi9tbS9t
ZW1vcnkuYwo+IEBAIC0zMTQyLDYgKzMxNDIsOSBAQCBpbnQgcmVtYXBfcGZuX3JhbmdlX3ByZXBh
cmUoc3RydWN0IHZtX2FyZWFfZGVzYyAqZGVzYykKPiAgICAgICAgIGNvbnN0IGJvb2wgaXNfY293
ID0gdm1hX2Rlc2NfaXNfY293X21hcHBpbmcoZGVzYyk7Cj4gICAgICAgICBpbnQgZXJyOwo+Cj4g
KyAgICAgICBpZiAoIXJhbmdlX2luX3ZtYV9kZXNjKGRlc2MsIHN0YXJ0LCBlbmQpKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiArCj4gICAgICAgICBlcnIgPSBnZXRfcmVtYXBf
cGdvZmYoaXNfY293LCBzdGFydCwgZW5kLCBkZXNjLT5zdGFydCwgZGVzYy0+ZW5kLCBwZm4sCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRlc2MtPnBnb2ZmKTsKPiAgICAgICAgIGlm
IChlcnIpCj4gLS0KPiAyLjUzLjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
