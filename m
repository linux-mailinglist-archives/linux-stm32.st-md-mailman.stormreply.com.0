Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0eKDMl2LuGnCfgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 23:59:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9202A1C83
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 23:59:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9BB1C87ED8;
	Mon, 16 Mar 2026 22:59:40 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 725A1C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 22:59:39 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-50906a98ffeso251561cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 15:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773701978; cv=none;
 d=google.com; s=arc-20240605;
 b=kz/0U5suaZtjpHHGFvh+sHPsQVeRevqCkg9r8bdRHUnntz+r08cdS5eqQ4FeBNqbmA
 c/6QdHyuQXrNUimWME/dvF5p3pPzywm9crZV2CforHXSkwHyfcrOzA5iRkIU+ZvmSsYq
 xk+rYsA+Kns1Poq3m2Sza2/LF4TuGGMHFBA5J2xAzH2/llPEfW3oClSKsuYDEF5xXCRN
 LhDV9vsXZaBTOw+sNf3rj1AaRd5vbB17PPFt9y2hJaNvoB7Q7ZYIC9PgwD2aEo8pYCWr
 F1jFzZZEAWYCPXomd/4F6tZQS8Gxsj987ondQrKfy+ByGGvinOfDX9RqTbcmDQmgTds5
 fGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
 fh=qp5gw1QLITt6ziEu7odxKIEsLpO3SYLqYKtPesKvgGM=;
 b=UlvtDA97RyUY94MjBcYuvpwvSb3E8afYx8CIwgT4QQzH1sO5MOtnufrM/CYOs+OO1C
 RbZByyQ995SnTxRnGPgKTnbVORSN4ApmK8n+x+TWE+7Z1tc2dmoOtsyIHqiKGIUjOX7U
 x4uv8EQ49cK860AfDF6kgHaXHNXzVb2e+Kvzal6K2rS/ahx6Mn2ZkAWmxrd3bFEXZz3J
 wfyQyKy1zM3z3oJpnNO40c9NcVpq4rvNQdzFLcpL1n+Pr7H2RBFXAgm0ng8dfO3G806T
 8itqrRoNPrClWkw/ah5NiR0f8qckF8cZkf4wROe17n4ygIHn40k+tnWmuyPBqeWpOwL6
 nBPQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773701978; x=1774306778;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
 b=btUP93uNVWij2hmkKwoZentmyzszALaKlmS0CsOcQNTb2xft5LTmyBTV6+MnBiNw84
 NxP1u3ZIGYzlyv1NDFSCXFMIXh/L0J6FnAzv2HtEP0dT+1GY/4iFaSvLRtffmELvm36S
 1O1juaztVQqpY+ArRSnlRYHawVZKBxCA+uij5Hp2UpInb44nx6Qb7O+BOJ1NKAdzOSiU
 eyy5ZGQASfQn0dQ33Oeb+xcG4rw1mlu7nQBH8ZOSvULwbNEw523yVGVfOBahuPlpUmyz
 jadE81qcT1ugNgsukdFifeL0eqX3h98MnR1NAUwYag77WJzvjff+K9nUGTHekYLu8qXQ
 k8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773701978; x=1774306778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
 b=rnTEE7jyvmc/HgemEqo0qUJpMIAS4GeZxxpyhhCYH2+WmgcO36EwlYd4b9eX1oRHbK
 e1Hze17Xnq93SjRvYcXqLK70mDPpJzyH0ObYlA/MsQxdsUfAPJShVu0/89ud5fV1Uh0a
 09qlLOwjwk4KtXvhO5o+v9SWUiGvnbzKNP8UzfTh0pprLaBZ3exjqsbOTEMXVv1z23QK
 tp3h70LDdHQkwyInJ6cnh1XbuWL/LCyNwgnZdosci4cQtIrlx2Tn6b+/jWMxi8LwQ1e6
 BGwKTrP7cV7SEJp26FQFllpTlwsO5viVQpj/za4hv/5Lnf2p9jaebkT9B2d5H6PB4vj8
 7D/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA0zOL3yqpI934VS6ndqtpOnq6Tqj7iRD1rek5onULV4hnGafVHe9QoWASmiz/vciRHD6v2EocEN4kyQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzf1kDX3o1kFbGq7PXMTiYJ488nMaLhEVPnVOVvf9OgHwJlVpgw
 c2p/DfnygkIOgsX51PTL0b0oldcZZvRMzpY0zpM4k2IpSWgcVqXvtifzu0lM7UiB9U4xY/DAap4
 I/NX6AXmJxtJ+8wwVPxabDTZLHQnE+fYvIsM6ONKR
X-Gm-Gg: ATEYQzxdBuiFC/a9b0mg0iGOM++nwHMO71L3uqi5Uw4lbkPlvks31Et2GwfWfZFk0tl
 5YmHZPjeGCktD2qaTqylME8daV7+tINzGiyC1g2WMtxCvbqHq/wTY76/QCh0ZqG3pPm2pXYA4x+
 dcdgNM26AFVjso9u9rbys/32J2bJSDm/DWzZ4n+nPmOakUQ2+DAhphoiAo4OrLvcyjCl8c4sPFs
 Pi6x3tyrvGTOrYLXet5ZxLN/QUOUPBO7PjKBJBkRJv41qhLUx9PUh++J0xaxbyIrzjhY7JnQVXu
 ubD0uING3zVZxMyx
X-Received: by 2002:ac8:5e12:0:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5099ac78738mr2798501cf.1.1773701977490; Mon, 16 Mar 2026
 15:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org>
 <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
 <CAJuCfpGd702=Xop3X5Aop9rrScdiAOQEEooTu1gcJqR9pmO5GA@mail.gmail.com>
 <6a0e73a5-519e-49ca-9f76-2f6cc5a1577c@lucifer.local>
In-Reply-To: <6a0e73a5-519e-49ca-9f76-2f6cc5a1577c@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 15:59:26 -0700
X-Gm-Features: AaiRm5118TD3MF16DHCGoLHkzYMnffHjhVhwrz0uUgfCnERLy0ui_OLbleubf-w
Message-ID: <CAJuCfpEjTw1nQik_HWXHg2su2DwzPrn5NPGpeAVPrjJK0tOSkg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 02/15] mm: add documentation for the
 mmap_prepare file operation callback
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
	NEURAL_SPAM(0.00)[0.981];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 5E9202A1C83
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTI6MTfigK9QTSBMb3JlbnpvIFN0b2FrZXMgKE9yYWNs
ZSkKPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgTWFyIDE1LCAyMDI2IGF0IDA0
OjIzOjE0UE0gLTA3MDAsIFN1cmVuIEJhZ2hkYXNhcnlhbiB3cm90ZToKPiA+IE9uIFRodSwgTWFy
IDEyLCAyMDI2IGF0IDE6MjfigK9QTSBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBkb2N1bWVudGF0aW9uIG1ha2VzIGl0IGVh
c2llciBmb3IgYSBkcml2ZXIvZmlsZSBzeXN0ZW0gaW1wbGVtZW50ZXIgdG8KPiA+ID4gY29ycmVj
dGx5IHVzZSB0aGlzIGNhbGxiYWNrLgo+ID4gPgo+ID4gPiBJdCBjb3ZlcnMgdGhlIGZ1bmRhbWVu
dGFscywgd2hpbHN0IGludGVudGlvbmFsbHkgbGVhdmluZyB0aGUgbGVzcyBsb3ZlbHkKPiA+ID4g
cG9zc2libGUgYWN0aW9ucyBvbmUgbWlnaHQgdGFrZSB1bmRvY3VtZW50ZWQgKGZvciBpbnN0YW5j
ZSAtIHRoZQo+ID4gPiBzdWNjZXNzX2hvb2ssIGVycm9yX2hvb2sgZmllbGRzIGluIG1tYXBfYWN0
aW9uKS4KPiA+ID4KPiA+ID4gVGhlIGRvY3VtZW50IGFsc28gY292ZXJzIHRoZSBuZXcgVk1BIGZs
YWdzIGltcGxlbWVudGF0aW9uIHdoaWNoIGlzIHRoZSBvbmx5Cj4gPiA+IG9uZSB3aGljaCB3aWxs
IHdvcmsgY29ycmVjdGx5IHdpdGggbW1hcF9wcmVwYXJlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPgo+ID4gPiAtLS0K
PiA+ID4gIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJlLnJzdCB8IDEzMSAr
KysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMzEgaW5zZXJ0aW9u
cygrKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMv
bW1hcF9wcmVwYXJlLnJzdAo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9m
aWxlc3lzdGVtcy9tbWFwX3ByZXBhcmUucnN0IGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9t
bWFwX3ByZXBhcmUucnN0Cj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uNzY5MDgyMDBmM2ExCj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9tbWFwX3ByZXBhcmUucnN0Cj4gPiA+IEBAIC0wLDAg
KzEsMTMxIEBACj4gPiA+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4g
PiArCj4gPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ID4gK21tYXBfcHJlcGFy
ZSBjYWxsYmFjayBIT1dUTwo+ID4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiA+
ICsKPiA+ID4gK0ludHJvZHVjdGlvbgo+ID4gPiArIyMjIyMjIyMjIyMjCj4gPiA+ICsKPiA+ID4g
K1RoZSBgc3RydWN0IGZpbGUtPmZfb3AtPm1tYXAoKWAgY2FsbGJhY2sgaGFzIGJlZW4gZGVwcmVj
YXRlZCBhcyBpdCBpcyBib3RoIGEKPiA+ID4gK3N0YWJpbGl0eSBhbmQgc2VjdXJpdHkgcmlzaywg
YW5kIGRvZXNuJ3QgYWx3YXlzIHBlcm1pdCB0aGUgbWVyZ2luZyBvZiBhZGphY2VudAo+ID4gPiAr
bWFwcGluZ3MgcmVzdWx0aW5nIGluIHVubmVjZXNzYXJ5IG1lbW9yeSBmcmFnbWVudGF0aW9uLgo+
ID4gPiArCj4gPiA+ICtJdCBoYXMgYmVlbiByZXBsYWNlZCB3aXRoIHRoZSBgZmlsZS0+Zl9vcC0+
bW1hcF9wcmVwYXJlKClgIGNhbGxiYWNrIHdoaWNoIHNvbHZlcwo+ID4gPiArdGhlc2UgcHJvYmxl
bXMuCj4gPiA+ICsKPiA+ID4gKyMjIEhvdyBUbyBVc2UKPiA+ID4gKwo+ID4gPiArSW4geW91ciBk
cml2ZXIncyBgc3RydWN0IGZpbGVfb3BlcmF0aW9uc2Agc3RydWN0LCBzcGVjaWZ5IGFuIGBtbWFw
X3ByZXBhcmVgCj4gPiA+ICtjYWxsYmFjayByYXRoZXIgdGhhbiBhbiBgbW1hcGAgb25lLCBlLmcu
IGZvciBleHQ0Ogo+ID4gPiArCj4gPiA+ICsKPiA+ID4gKy4uIGNvZGUtYmxvY2s6OiBDCj4gPiA+
ICsKPiA+ID4gKyAgICBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGV4dDRfZmlsZV9vcGVy
YXRpb25zID0gewo+ID4gPiArICAgICAgICAuLi4KPiA+ID4gKyAgICAgICAgLm1tYXBfcHJlcGFy
ZSAgICA9IGV4dDRfZmlsZV9tbWFwX3ByZXBhcmUsCj4gPiA+ICsgICAgfTsKPiA+ID4gKwo+ID4g
PiArVGhpcyBoYXMgYSBzaWduYXR1cmUgb2YgYGludCAoKm1tYXBfcHJlcGFyZSkoc3RydWN0IHZt
X2FyZWFfZGVzYyAqKWAuCj4gPiA+ICsKPiA+ID4gK0V4YW1pbmluZyB0aGUgYHN0cnVjdCB2bV9h
cmVhX2Rlc2NgIHR5cGU6Cj4gPiA+ICsKPiA+ID4gKy4uIGNvZGUtYmxvY2s6OiBDCj4gPiA+ICsK
PiA+ID4gKyAgICBzdHJ1Y3Qgdm1fYXJlYV9kZXNjIHsKPiA+ID4gKyAgICAgICAgLyogSW1tdXRh
YmxlIHN0YXRlLiAqLwo+ID4gPiArICAgICAgICBjb25zdCBzdHJ1Y3QgbW1fc3RydWN0ICpjb25z
dCBtbTsKPiA+ID4gKyAgICAgICAgc3RydWN0IGZpbGUgKmNvbnN0IGZpbGU7IC8qIE1heSB2YXJ5
IGZyb20gdm1fZmlsZSBpbiBzdGFja2VkIGNhbGxlcnMuICovCj4gPiA+ICsgICAgICAgIHVuc2ln
bmVkIGxvbmcgc3RhcnQ7Cj4gPiA+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kOwo+ID4gPiAr
Cj4gPiA+ICsgICAgICAgIC8qIE11dGFibGUgZmllbGRzLiBQb3B1bGF0ZWQgd2l0aCBpbml0aWFs
IHN0YXRlLiAqLwo+ID4gPiArICAgICAgICBwZ29mZl90IHBnb2ZmOwo+ID4gPiArICAgICAgICBz
dHJ1Y3QgZmlsZSAqdm1fZmlsZTsKPiA+ID4gKyAgICAgICAgdm1hX2ZsYWdzX3Qgdm1hX2ZsYWdz
Owo+ID4gPiArICAgICAgICBwZ3Byb3RfdCBwYWdlX3Byb3Q7Cj4gPiA+ICsKPiA+ID4gKyAgICAg
ICAgLyogV3JpdGUtb25seSBmaWVsZHMuICovCj4gPiA+ICsgICAgICAgIGNvbnN0IHN0cnVjdCB2
bV9vcGVyYXRpb25zX3N0cnVjdCAqdm1fb3BzOwo+ID4gPiArICAgICAgICB2b2lkICpwcml2YXRl
X2RhdGE7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgLyogVGFrZSBmdXJ0aGVyIGFjdGlvbj8gKi8K
PiA+ID4gKyAgICAgICAgc3RydWN0IG1tYXBfYWN0aW9uIGFjdGlvbjsKPiA+Cj4gPiBTbywgYWN0
aW9uIHN0aWxsIGJlbG9uZ3MgdG8gLyogV3JpdGUtb25seSBmaWVsZHMuICovIHNlY3Rpb24/IFRo
aXMgaXMKPiA+IG5pdHBpY2t5LCBidXQgaXQgbWlnaHQgYmUgYmV0dGVyIHRvIGhhdmUgdGhpcyBh
czoKPiA+Cj4gPiAgICAgICAgIC8qIFdyaXRlLW9ubHkgZmllbGRzLiAqLwo+ID4gICAgICAgICBj
b25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgKnZtX29wczsKPiA+ICAgICAgICAgdm9p
ZCAqcHJpdmF0ZV9kYXRhOwo+ID4gICAgICAgICBzdHJ1Y3QgbW1hcF9hY3Rpb24gYWN0aW9uOyAv
KiBUYWtlIGZ1cnRoZXIgYWN0aW9uPyAqLwo+Cj4gQWJzb2x1dGVseSBub3QuIFRoaXMgZmllbGQg
aXMgbm90IHRvIGJlIHdyaXR0ZW4gdG8gYnkgdGhlIHVzZXIuCj4KPiBXZSBzYWRseSBoYXZlIHRv
IGFsbG93IGh1Z2V0bGIgdG8gZG8gc29tZSBoYWNrcywgYnV0IHRoZXNlIGFyZSB0aGluZ3Mgd2Ug
ZG9uJ3QKPiB3YW50IHRvIHBvaW50IG91dC4KCkFjay4KCj4KPiBVc2VycyBzaG91bGQgdXNlIG1t
YXBfYWN0aW9uX3h4eCgpIGZ1bmN0aW9ucy4KPgo+ID4KPiA+ID4gKyAgICB9Owo+ID4gPiArCj4g
PiA+ICtUaGlzIGlzIHN0cmFpZ2h0Zm9yd2FyZCAtIHlvdSBoYXZlIGFsbCB0aGUgZmllbGRzIHlv
dSBuZWVkIHRvIHNldCB1cCB0aGUKPiA+ID4gK21hcHBpbmcsIGFuZCB5b3UgY2FuIHVwZGF0ZSB0
aGUgbXV0YWJsZSBhbmQgd3JpdGFibGUgZmllbGRzLCBmb3IgaW5zdGFuY2U6Cj4gPiA+ICsKPiA+
ID4gKy4uIGNvZGUtYmxvY2s6OiBDdwo+ID4gPiArCj4gPiA+ICsgICAgc3RhdGljIGludCBleHQ0
X2ZpbGVfbW1hcF9wcmVwYXJlKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gPiA+ICsgICAg
ewo+ID4gPiArICAgICAgICBpbnQgcmV0Owo+ID4gPiArICAgICAgICBzdHJ1Y3QgZmlsZSAqZmls
ZSA9IGRlc2MtPmZpbGU7Cj4gPiA+ICsgICAgICAgIHN0cnVjdCBpbm9kZSAqaW5vZGUgPSBmaWxl
LT5mX21hcHBpbmctPmhvc3Q7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgLi4uCj4gPiA+ICsKPiA+
ID4gKyAgICAgICAgZmlsZV9hY2Nlc3NlZChmaWxlKTsKPiA+ID4gKyAgICAgICAgaWYgKElTX0RB
WChmaWxlX2lub2RlKGZpbGUpKSkgewo+ID4gPiArICAgICAgICAgICAgZGVzYy0+dm1fb3BzID0g
JmV4dDRfZGF4X3ZtX29wczsKPiA+ID4gKyAgICAgICAgICAgIHZtYV9kZXNjX3NldF9mbGFncyhk
ZXNjLCBWTUFfSFVHRVBBR0VfQklUKTsKPiA+ID4gKyAgICAgICAgfSBlbHNlIHsKPiA+ID4gKyAg
ICAgICAgICAgIGRlc2MtPnZtX29wcyA9ICZleHQ0X2ZpbGVfdm1fb3BzOwo+ID4gPiArICAgICAg
ICB9Cj4gPiA+ICsgICAgICAgIHJldHVybiAwOwo+ID4gPiArICAgIH0KPiA+ID4gKwo+ID4gPiAr
SW1wb3J0YW50bHksIHlvdSBubyBsb25nZXIgaGF2ZSB0byBkYW5jZSBhcm91bmQgd2l0aCByZWZl
cmVuY2UgY291bnRzIG9yIGxvY2tzCj4gPiA+ICt3aGVuIHVwZGF0aW5nIHRoZXNlIGZpZWxkcyAt
IF9feW91IGNhbiBzaW1wbHkgZ28gYWhlYWQgYW5kIGNoYW5nZSB0aGVtX18uCj4gPiA+ICsKPiA+
ID4gK0V2ZXJ5dGhpbmcgaXMgdGFrZW4gY2FyZSBvZiBieSB0aGUgbWFwcGluZyBjb2RlLgo+ID4g
PiArCj4gPiA+ICtWTUEgRmxhZ3MKPiA+ID4gKz09PT09PT09PQo+ID4gPiArCj4gPiA+ICtBbG9u
ZyB3aXRoIGBtbWFwX3ByZXBhcmVgLCBWTUEgZmxhZ3MgaGF2ZSB1bmRlcmdvbmUgYW4gb3Zlcmhh
dWwuIFdoZXJlIGJlZm9yZQo+ID4gPiAreW91IHdvdWxkIGludm9rZSBvbmUgb2YgYHZtX2ZsYWdz
X2luaXQoKWAsIGB2bV9mbGFnc19yZXNldCgpYCwgYHZtX2ZsYWdzX3NldCgpYCwKPiA+ID4gK2B2
bV9mbGFnc19jbGVhcigpYCwgYW5kIGB2bV9mbGFnc19tb2QoKWAgdG8gbW9kaWZ5IGZsYWdzIChh
bmQgdG8gaGF2ZSB0aGUKPiA+ID4gK2xvY2tpbmcgZG9uZSBjb3JyZWN0bHkgZm9yIHlvdSwgdGhp
cyBpcyBubyBsb25nZXIgbmVjZXNzYXJ5Lgo+ID4gPiArCj4gPiA+ICtBbHNvLCB0aGUgbGVnYWN5
IGFwcHJvYWNoIG9mIHNwZWNpZnlpbmcgVk1BIGZsYWdzIHZpYSBgVk1fUkVBRGAsIGBWTV9XUklU
RWAsCj4gPiA+ICtldGMuIC0gaS5lLiB1c2luZyBhIGBWTV94eHhgIG1hY3JvIGhhcyBjaGFuZ2Vk
IHRvby4KPiA+ID4gKwo+ID4gPiArV2hlbiBpbXBsZW1lbnRpbmcgYG1tYXBfcHJlcGFyZSgpYCwg
cmVmZXJlbmNlIGZsYWdzIGJ5IHRoZWlyIGJpdCBudW1iZXIsIGRlZmluZWQKPiA+ID4gK2FzIGEg
YFZNQV94eHhfQklUYCBtYWNybywgZS5nLiBgVk1BX1JFQURfQklUYCwgYFZNQV9XUklURV9CSVRg
IGV0Yy4sIGFuZCB1c2Ugb25lCj4gPiA+ICtvZiAod2hlcmUgYGRlc2NgIGlzIGEgcG9pbnRlciB0
byBgc3RydWN0IHZtYV9hcmVhX2Rlc2NgKToKPiA+ID4gKwo+ID4gPiArKiBgdm1hX2Rlc2NfdGVz
dF9mbGFncyhkZXNjLCAuLi4pYCAtIFNwZWNpZnkgYSBjb21tYS1zZXBhcmF0ZWQgbGlzdCBvZiBm
bGFncyB5b3UKPiA+ID4gKyAgd2lzaCB0byB0ZXN0IGZvciAod2hldGhlciBfYW55XyBhcmUgc2V0
KSwgZS5nLiAtIGB2bWFfZGVzY190ZXN0X2ZsYWdzKGRlc2MsCj4gPiA+ICsgIFZNQV9XUklURV9C
SVQsIFZNQV9NQVlXUklURV9CSVQpYCAtIHJldHVybnMgYHRydWVgIGlmIGVpdGhlciBhcmUgc2V0
LAo+ID4gPiArICBvdGhlcndpc2UgYGZhbHNlYC4KPiA+ID4gKyogYHZtYV9kZXNjX3NldF9mbGFn
cyhkZXNjLCAuLi4pYCAtIFVwZGF0ZSB0aGUgVk1BIGRlc2NyaXB0b3IgZmxhZ3MgdG8gc2V0Cj4g
PiA+ICsgIGFkZGl0aW9uYWwgZmxhZ3Mgc3BlY2lmaWVkIGJ5IGEgY29tbWEtc2VwYXJhdGVkIGxp
c3QsCj4gPiA+ICsgIGUuZy4gLSBgdm1hX2Rlc2Nfc2V0X2ZsYWdzKGRlc2MsIFZNQV9QRk5NQVBf
QklULCBWTUFfSU9fQklUKWAuCj4gPiA+ICsqIGB2bWFfZGVzY19jbGVhcl9mbGFncyhkZXNjLCAu
Li4pYCAtIFVwZGF0ZSB0aGUgVk1BIGRlc2NyaXB0b3IgZmxhZ3MgdG8gY2xlYXIKPiA+ID4gKyAg
ZmxhZ3Mgc3BlY2lmaWVkIGJ5IGEgY29tbWEtc2VwYXJhdGVkIGxpc3QsIGUuZy4gLSBgdm1hX2Rl
c2NfY2xlYXJfZmxhZ3MoZGVzYywKPiA+ID4gKyAgVk1BX1dSSVRFX0JJVCwgVk1BX01BWVdSSVRF
X0JJVClgLgo+ID4gPiArCj4gPiA+ICtBY3Rpb25zCj4gPiA+ICs9PT09PT09Cj4gPiA+ICsKPiA+
ID4gK1lvdSBjYW4gbm93IHZlcnkgZWFzaWx5IGhhdmUgYWN0aW9ucyBiZSBwZXJmb3JtZWQgdXBv
biBhIG1hcHBpbmcgb25jZSBzZXQgdXAgYnkKPiA+ID4gK3V0aWxpc2luZyBzaW1wbGUgaGVscGVy
IGZ1bmN0aW9ucyBpbnZva2VkIHVwb24gdGhlIGBzdHJ1Y3Qgdm1fYXJlYV9kZXNjYAo+ID4gPiAr
cG9pbnRlci4gVGhlc2UgYXJlOgo+ID4gPiArCj4gPiA+ICsqIGBtbWFwX2FjdGlvbl9yZW1hcCgp
YCAtIFJlbWFwcyBhIHJhbmdlIGNvbnNpc3Rpbmcgb25seSBvZiBQRk5zIGZvciBhIHNwZWNpZmlj
Cj4gPiA+ICsgIHJhbmdlIHN0YXJ0aW5nIGEgdmlydHVhbCBhZGRyZXNzIGFuZCBQRk4gbnVtYmVy
IG9mIGEgc2V0IHNpemUuCj4gPiA+ICsKPiA+ID4gKyogYG1tYXBfYWN0aW9uX3JlbWFwX2Z1bGwo
KWAgLSBTYW1lIGFzIGBtbWFwX2FjdGlvbl9yZW1hcCgpYCwgb25seSByZW1hcHMgdGhlCj4gPiA+
ICsgIGVudGlyZSBtYXBwaW5nIGZyb20gYHN0YXJ0X3BmbmAgb253YXJkLgo+ID4gPiArCj4gPiA+
ICsqIGBtbWFwX2FjdGlvbl9pb3JlbWFwKClgIC0gU2FtZSBhcyBgbW1hcF9hY3Rpb25fcmVtYXAo
KWAsIG9ubHkgcGVyZm9ybXMgYW4gSS9PCj4gPiA+ICsgIHJlbWFwLgo+ID4gPiArCj4gPiA+ICsq
IGBtbWFwX2FjdGlvbl9pb3JlbWFwX2Z1bGwoKWAgLSBTYW1lIGFzIGBtbWFwX2FjdGlvbl9pb3Jl
bWFwKClgLCBvbmx5IHJlbWFwcwo+ID4gPiArICB0aGUgZW50aXJlIG1hcHBpbmcgZnJvbSBgc3Rh
cnRfcGZuYCBvbndhcmQuCj4gPiA+ICsKPiA+ID4gKyoqTk9URToqKiBUaGUgJ2FjdGlvbicgZmll
bGQgc2hvdWxkIG5ldmVyIG5vcm1hbGx5IGJlIG1hbmlwdWxhdGVkIGRpcmVjdGx5LAo+ID4gPiAr
cmF0aGVyIHlvdSBvdWdodCB0byB1c2Ugb25lIG9mIHRoZXNlIGhlbHBlcnMuCj4gPgo+ID4gSSdt
IGd1ZXNzaW5nIHRoZSBzdGFydCBhbmQgc2l6ZSBwYXJhbWV0ZXJzIHBhc3NlZCB0bwo+ID4gbW1h
cF9hY3Rpb25fcmVtYXAoKSBhbmQgc3VjaCBhcmUgcmVzdHJpY3RlZCBieSB2bV9hcmVhX2Rlc2Mu
c3RhcnQKPiA+IHZtX2FyZWFfZGVzYy5lbmQuIElmIHNvLCBzaG91bGQgd2UgZG9jdW1lbnQgdGhv
c2UgcmVzdHJpY3Rpb25zIGFuZAo+ID4gZW5mb3JjZSB0aGVtIGluIHRoZSBjb2RlPwo+Cj4gSSBt
ZWFuIGl0J3MgdGhlIHNhbWUgcmVzdHJpY3Rpb25zIGFzIGFsbCBvZiB0aGUgZnVuY3Rpb25zIGFs
cmVhZHkgYXBwbHkgaWYgeW91Cj4gd2VyZSB0byB1c2UgdGhlbSB3aXRoIGEgVk1BIGRlc2NyaXB0
b3IuCj4KPiBJIHRoaW5rIGltcGxpY2l0bHkgYSByZW1hcCB3aWxsIGZhaWwgaWYgeW91IHRyeSBp
dCBvdXQgb2YgdGhlIFZNQSByYW5nZSBhdCB0aGUKPiBwb2ludCBvZiBhcHBseWluZyB0aGUgY2hh
bmdlLgo+Cj4gQnV0IGl0IG1pZ2h0IGJlIHdvcnRoIGFkZGluZyByYW5nZV9pbl92bWFfZGVzYygp
IGNoZWNrcyBhdCBwcmVwYXJlIHRpbWUsIHdpbGwKPiBzZWUgaWYgSSBjYW4gZG8gdGhhdCBmb3Ig
dGhlIHJlc3Bpbi4KPgo+IEkgdGhpbmsgaXQncyBwcmV0dHkgb2J2aW91cyB0aGF0IHlvdSBzaG91
bGRuJ3QgYmUgdHJ5aW5nIHRvIHJlbWFwIHRvdGFsbHkKPiB1bnJlbGF0ZWQgbWVtb3J5LCBzbyBJ
J20gbm90IHN1cmUgdGhhdCdzIGF0IGEgbGV2ZWwgb2YgZ3JhbnVsYXJpdHkgdGhhdCdzIHN1aXRl
ZAo+IHRvIHRoaXMgZG9jdW1lbnQgdGhvdWdoLgoKSSBqdXN0IHNhdyB5b3UgYWxyZWFkeSBoYXZl
IFdBUk5fT05fT05DRSgpIGluc2lkZSBtbWFwX2FjdGlvbl9yZW1hcCgpCnRvIGNoZWNrIGZvciB0
aGVzZSBsaW1pdHMsIHNvIGNvZGV3aXNlIEkgdGhpbmsgd2UgYXJlIGFscmVhZHkgZ29vZC4KCkZv
ciBkb2N1bWVudGF0aW9uIEknbGwgcmVseSBvbiB5b3VyIGp1ZGdlbWVudCB3aGV0aGVyIHRvIG1l
bnRpb24gdGhpcyBvciBub3QuCgo+Cj4gPgo+ID4gPiArICAgIHN0cnVjdCB2bV9hcmVhX2Rlc2Mg
ewo+ID4gPiArICAgICAgICAvKiBJbW11dGFibGUgc3RhdGUuICovCj4gPiA+ICsgICAgICAgIGNv
bnN0IHN0cnVjdCBtbV9zdHJ1Y3QgKmNvbnN0IG1tOwo+ID4gPiArICAgICAgICBzdHJ1Y3QgZmls
ZSAqY29uc3QgZmlsZTsgLyogTWF5IHZhcnkgZnJvbSB2bV9maWxlIGluIHN0YWNrZWQgY2FsbGVy
cy4gKi8KPiA+ID4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydDsKPiA+ID4gKyAgICAgICAg
dW5zaWduZWQgbG9uZyBlbmQ7Cj4gPgo+ID4KPiA+ID4gLS0KPiA+ID4gMi41My4wCj4gPiA+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
