Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OoSaAHE/t2kcOwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 00:23:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EAD292FE7
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 00:23:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 114CDC87ED1;
	Sun, 15 Mar 2026 23:23:28 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10A19C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2026 23:23:26 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-50906a98ffeso714431cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2026 16:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773617006; cv=none;
 d=google.com; s=arc-20240605;
 b=aDKDVx9Z1sbA5//tjXGFSQUf1uJuYKXcOd9MURpJrC587VPuGnKloe68h4BJnmLYiQ
 ziFuuFGANkdyISxftOgdqKLZLSIsx5bwrjiXj6A8bdVln42oQNDEG76jzmFj6Au2JGNc
 xin4wV46T04LDP/wjVXrPumyMzbjLuuNqXTS+FOYenG9z6tD0Sqc0lLkF7+jXsdrFS6I
 EQEUxwpCmyRvLO2fLapeh/BBNq/tpz8J7u/5Jcua1OLWj258GrjqskseqxAWpPJ6Jjw0
 9JEhSEMwQ8wWq9RI8QYF10r0XszlTUlRKGwd5NjBcEQ5vFT+WwXvnd8snArjPx7yNrxX
 91lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OT8Iw6M557aLYwHQwbfjFt5SgiwLxQR3GJ4aDtnOQyU=;
 fh=I1iomIL8MAMr8dwBUwPYh/yQlLl6zF7hrOCsxGifpDE=;
 b=ElSorP9Fy1M/z4SzNNJFTzY6RftmMEEzKTqvj9aAvKb2udJCnMfuFpoqUC/zr6icnv
 xBqZiyRjDZiwaiedIGuCNAsoZ6ClCZA7QKAcvgDB5/lIXFdXAkDBulK4xMywqxlW+RM0
 +40prd0oiog/8Q9EE+I4DO2g+zcQOeor/JiyG8VQv0yYYlmcy9kCz/vUujFfat4RedC0
 KlS/L1CR/SFnjXCvQ+2Vkee9+kvqXp8zJIYV6ldlzgzORvoWGzVy5DjqVU6CIZBDu+6m
 vtl1YDb8+5DegOpu5tuwYjgtlHNURoKq5zqGjRDW0wZpMZ2DlC/WAFvYr9Nh3pq1OSKe
 GKIQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773617006; x=1774221806;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OT8Iw6M557aLYwHQwbfjFt5SgiwLxQR3GJ4aDtnOQyU=;
 b=KgyMeb20RrvgaYpyfmabo24NNwBEmgM06l4EKChPkSdDpRogbQgcYxCgE2xtny76hv
 ymfmt2AOKUkHyodEhb/w3V57S2d82GX+Muk/YcUADlo+4IGv+z8NSJAQdPhSuQ+mruA6
 qXcdmq7JBf78aElXv1/GOYtRc65MqvVVrM21rGqjO36+/A6MaVb5srgnplc2Ah81iUY5
 7EP4mHqRA9ZxM7wrVVlcFht/Jj098DovSJsBzGIgCB6pYkzr4/3GcQKHikyoaUaI4PWK
 xH3umOAax1UFtt5AlmqJvz8SAGSVf3NJwWT5Ek9CZNYa0c2S3gzMOMhcksGc86bxgkye
 kQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773617006; x=1774221806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OT8Iw6M557aLYwHQwbfjFt5SgiwLxQR3GJ4aDtnOQyU=;
 b=QHbeAWfBpW7pPmDSafsspP7aliJVb7Umif4YJybG++TsM+dzfTtzBVGiz756sVKetU
 bN7P2RyWJ6DgyYUfgJUUA0MdFytUPypkdOFNccTJFnVYHjGGTD+6RXdWEt5TOM415vxx
 zo3/zt58zkYnG2xakch2cojj6VbX4vHWET7OloqNSU4XghLS1zKLjRCzElwy0jyitLQO
 /05DiWnvafLC9YWqq1az7DhS6pkBeLtk33drgUmCfJmvuHvD9DFgOSVVwqz/LmICqVt3
 hKzIhJM2UN4j1FUrMm5zv/ygagHcB3GVh137eQNQBkZCJzVpQviPdXDkNrSRzhEyhSi2
 5hSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWprTL2RjJc0nKfdstFoTUHYAt32ibEPe1Ck1mKt1+hLEqKVSQquIgu2KbMTvdvdkveeeH5+QeV1m4ysQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz1X70UBVgzpjOCvb7ljWX7agezDvgDez4qGMWy3l/shAfEKcH8
 PedDeFUX9bpCgmQ9V6v2VcJLD1GAj1KBm70Doiy7yudqzcqzM8IRW1YVLxrCrlgcJpRE02xqUfS
 x/hGxga7Mgkpal0h2qREBKStKkmos9mWoTuwlDQuc
X-Gm-Gg: ATEYQzzTZEG3ZiYYiMNyoMdfaklC//bg3U6kwYR4ttVVXtcrVNxqE5uGXNZOdX2jjao
 dkTjfPCsqgX0wuhQ5wTjtxlDboea5MKAPE7qwyU0NkNh83D1I3nDpAV1GtJcTAAROo+hRDykIG3
 rIPiBUBpeWslvfuc/oV7wiXRQqThv5gZbjZ0QluCdFogCgcQuU/OgQ8V4reuucGzNCRaCQrdY96
 cPGG7hfyWQds3mKdYV/DmQvLuUNdWqUXDxipfo1xdeJG7vXLGCGq/oOgkcLCjg5JGXhwTW/lGRC
 uqS/MFQXZgpbFWJm
X-Received: by 2002:a05:622a:1822:b0:509:1d4b:f86f with SMTP id
 d75a77b69052e-509694fc2a0mr18649221cf.14.1773617005021; Sun, 15 Mar 2026
 16:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org>
 <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
In-Reply-To: <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 16:23:14 -0700
X-Gm-Features: AaiRm50msQxab5MfkpLsIIibDHC-kfdIQCyqr3kXogsNup53_Z_U3j15wVPbEHM
Message-ID: <CAJuCfpGd702=Xop3X5Aop9rrScdiAOQEEooTu1gcJqR9pmO5GA@mail.gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 88EAD292FE7
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgMToyN+KAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBkb2N1bWVudGF0aW9uIG1ha2VzIGl0
IGVhc2llciBmb3IgYSBkcml2ZXIvZmlsZSBzeXN0ZW0gaW1wbGVtZW50ZXIgdG8KPiBjb3JyZWN0
bHkgdXNlIHRoaXMgY2FsbGJhY2suCj4KPiBJdCBjb3ZlcnMgdGhlIGZ1bmRhbWVudGFscywgd2hp
bHN0IGludGVudGlvbmFsbHkgbGVhdmluZyB0aGUgbGVzcyBsb3ZlbHkKPiBwb3NzaWJsZSBhY3Rp
b25zIG9uZSBtaWdodCB0YWtlIHVuZG9jdW1lbnRlZCAoZm9yIGluc3RhbmNlIC0gdGhlCj4gc3Vj
Y2Vzc19ob29rLCBlcnJvcl9ob29rIGZpZWxkcyBpbiBtbWFwX2FjdGlvbikuCj4KPiBUaGUgZG9j
dW1lbnQgYWxzbyBjb3ZlcnMgdGhlIG5ldyBWTUEgZmxhZ3MgaW1wbGVtZW50YXRpb24gd2hpY2gg
aXMgdGhlIG9ubHkKPiBvbmUgd2hpY2ggd2lsbCB3b3JrIGNvcnJlY3RseSB3aXRoIG1tYXBfcHJl
cGFyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSA8bGpzQGtl
cm5lbC5vcmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJl
LnJzdCB8IDEzMSArKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEzMSBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0
ZW1zL21tYXBfcHJlcGFyZS5yc3QKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2ZpbGVz
eXN0ZW1zL21tYXBfcHJlcGFyZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL21tYXBf
cHJlcGFyZS5yc3QKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4u
NzY5MDgyMDBmM2ExCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZmlsZXN5
c3RlbXMvbW1hcF9wcmVwYXJlLnJzdAo+IEBAIC0wLDAgKzEsMTMxIEBACj4gKy4uIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKwo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09
PT0KPiArbW1hcF9wcmVwYXJlIGNhbGxiYWNrIEhPV1RPCj4gKz09PT09PT09PT09PT09PT09PT09
PT09PT09PQo+ICsKPiArSW50cm9kdWN0aW9uCj4gKyMjIyMjIyMjIyMjIwo+ICsKPiArVGhlIGBz
dHJ1Y3QgZmlsZS0+Zl9vcC0+bW1hcCgpYCBjYWxsYmFjayBoYXMgYmVlbiBkZXByZWNhdGVkIGFz
IGl0IGlzIGJvdGggYQo+ICtzdGFiaWxpdHkgYW5kIHNlY3VyaXR5IHJpc2ssIGFuZCBkb2Vzbid0
IGFsd2F5cyBwZXJtaXQgdGhlIG1lcmdpbmcgb2YgYWRqYWNlbnQKPiArbWFwcGluZ3MgcmVzdWx0
aW5nIGluIHVubmVjZXNzYXJ5IG1lbW9yeSBmcmFnbWVudGF0aW9uLgo+ICsKPiArSXQgaGFzIGJl
ZW4gcmVwbGFjZWQgd2l0aCB0aGUgYGZpbGUtPmZfb3AtPm1tYXBfcHJlcGFyZSgpYCBjYWxsYmFj
ayB3aGljaCBzb2x2ZXMKPiArdGhlc2UgcHJvYmxlbXMuCj4gKwo+ICsjIyBIb3cgVG8gVXNlCj4g
Kwo+ICtJbiB5b3VyIGRyaXZlcidzIGBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zYCBzdHJ1Y3QsIHNw
ZWNpZnkgYW4gYG1tYXBfcHJlcGFyZWAKPiArY2FsbGJhY2sgcmF0aGVyIHRoYW4gYW4gYG1tYXBg
IG9uZSwgZS5nLiBmb3IgZXh0NDoKPiArCj4gKwo+ICsuLiBjb2RlLWJsb2NrOjogQwo+ICsKPiAr
ICAgIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgZXh0NF9maWxlX29wZXJhdGlvbnMgPSB7
Cj4gKyAgICAgICAgLi4uCj4gKyAgICAgICAgLm1tYXBfcHJlcGFyZSAgICA9IGV4dDRfZmlsZV9t
bWFwX3ByZXBhcmUsCj4gKyAgICB9Owo+ICsKPiArVGhpcyBoYXMgYSBzaWduYXR1cmUgb2YgYGlu
dCAoKm1tYXBfcHJlcGFyZSkoc3RydWN0IHZtX2FyZWFfZGVzYyAqKWAuCj4gKwo+ICtFeGFtaW5p
bmcgdGhlIGBzdHJ1Y3Qgdm1fYXJlYV9kZXNjYCB0eXBlOgo+ICsKPiArLi4gY29kZS1ibG9jazo6
IEMKPiArCj4gKyAgICBzdHJ1Y3Qgdm1fYXJlYV9kZXNjIHsKPiArICAgICAgICAvKiBJbW11dGFi
bGUgc3RhdGUuICovCj4gKyAgICAgICAgY29uc3Qgc3RydWN0IG1tX3N0cnVjdCAqY29uc3QgbW07
Cj4gKyAgICAgICAgc3RydWN0IGZpbGUgKmNvbnN0IGZpbGU7IC8qIE1heSB2YXJ5IGZyb20gdm1f
ZmlsZSBpbiBzdGFja2VkIGNhbGxlcnMuICovCj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFy
dDsKPiArICAgICAgICB1bnNpZ25lZCBsb25nIGVuZDsKPiArCj4gKyAgICAgICAgLyogTXV0YWJs
ZSBmaWVsZHMuIFBvcHVsYXRlZCB3aXRoIGluaXRpYWwgc3RhdGUuICovCj4gKyAgICAgICAgcGdv
ZmZfdCBwZ29mZjsKPiArICAgICAgICBzdHJ1Y3QgZmlsZSAqdm1fZmlsZTsKPiArICAgICAgICB2
bWFfZmxhZ3NfdCB2bWFfZmxhZ3M7Cj4gKyAgICAgICAgcGdwcm90X3QgcGFnZV9wcm90Owo+ICsK
PiArICAgICAgICAvKiBXcml0ZS1vbmx5IGZpZWxkcy4gKi8KPiArICAgICAgICBjb25zdCBzdHJ1
Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgKnZtX29wczsKPiArICAgICAgICB2b2lkICpwcml2YXRl
X2RhdGE7Cj4gKwo+ICsgICAgICAgIC8qIFRha2UgZnVydGhlciBhY3Rpb24/ICovCj4gKyAgICAg
ICAgc3RydWN0IG1tYXBfYWN0aW9uIGFjdGlvbjsKClNvLCBhY3Rpb24gc3RpbGwgYmVsb25ncyB0
byAvKiBXcml0ZS1vbmx5IGZpZWxkcy4gKi8gc2VjdGlvbj8gVGhpcyBpcwpuaXRwaWNreSwgYnV0
IGl0IG1pZ2h0IGJlIGJldHRlciB0byBoYXZlIHRoaXMgYXM6CgogICAgICAgIC8qIFdyaXRlLW9u
bHkgZmllbGRzLiAqLwogICAgICAgIGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCAq
dm1fb3BzOwogICAgICAgIHZvaWQgKnByaXZhdGVfZGF0YTsKICAgICAgICBzdHJ1Y3QgbW1hcF9h
Y3Rpb24gYWN0aW9uOyAvKiBUYWtlIGZ1cnRoZXIgYWN0aW9uPyAqLwoKPiArICAgIH07Cj4gKwo+
ICtUaGlzIGlzIHN0cmFpZ2h0Zm9yd2FyZCAtIHlvdSBoYXZlIGFsbCB0aGUgZmllbGRzIHlvdSBu
ZWVkIHRvIHNldCB1cCB0aGUKPiArbWFwcGluZywgYW5kIHlvdSBjYW4gdXBkYXRlIHRoZSBtdXRh
YmxlIGFuZCB3cml0YWJsZSBmaWVsZHMsIGZvciBpbnN0YW5jZToKPiArCj4gKy4uIGNvZGUtYmxv
Y2s6OiBDdwo+ICsKPiArICAgIHN0YXRpYyBpbnQgZXh0NF9maWxlX21tYXBfcHJlcGFyZShzdHJ1
Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ICsgICAgewo+ICsgICAgICAgIGludCByZXQ7Cj4gKyAg
ICAgICAgc3RydWN0IGZpbGUgKmZpbGUgPSBkZXNjLT5maWxlOwo+ICsgICAgICAgIHN0cnVjdCBp
bm9kZSAqaW5vZGUgPSBmaWxlLT5mX21hcHBpbmctPmhvc3Q7Cj4gKwo+ICsgICAgICAgIC4uLgo+
ICsKPiArICAgICAgICBmaWxlX2FjY2Vzc2VkKGZpbGUpOwo+ICsgICAgICAgIGlmIChJU19EQVgo
ZmlsZV9pbm9kZShmaWxlKSkpIHsKPiArICAgICAgICAgICAgZGVzYy0+dm1fb3BzID0gJmV4dDRf
ZGF4X3ZtX29wczsKPiArICAgICAgICAgICAgdm1hX2Rlc2Nfc2V0X2ZsYWdzKGRlc2MsIFZNQV9I
VUdFUEFHRV9CSVQpOwo+ICsgICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgIGRlc2MtPnZt
X29wcyA9ICZleHQ0X2ZpbGVfdm1fb3BzOwo+ICsgICAgICAgIH0KPiArICAgICAgICByZXR1cm4g
MDsKPiArICAgIH0KPiArCj4gK0ltcG9ydGFudGx5LCB5b3Ugbm8gbG9uZ2VyIGhhdmUgdG8gZGFu
Y2UgYXJvdW5kIHdpdGggcmVmZXJlbmNlIGNvdW50cyBvciBsb2Nrcwo+ICt3aGVuIHVwZGF0aW5n
IHRoZXNlIGZpZWxkcyAtIF9feW91IGNhbiBzaW1wbHkgZ28gYWhlYWQgYW5kIGNoYW5nZSB0aGVt
X18uCj4gKwo+ICtFdmVyeXRoaW5nIGlzIHRha2VuIGNhcmUgb2YgYnkgdGhlIG1hcHBpbmcgY29k
ZS4KPiArCj4gK1ZNQSBGbGFncwo+ICs9PT09PT09PT0KPiArCj4gK0Fsb25nIHdpdGggYG1tYXBf
cHJlcGFyZWAsIFZNQSBmbGFncyBoYXZlIHVuZGVyZ29uZSBhbiBvdmVyaGF1bC4gV2hlcmUgYmVm
b3JlCj4gK3lvdSB3b3VsZCBpbnZva2Ugb25lIG9mIGB2bV9mbGFnc19pbml0KClgLCBgdm1fZmxh
Z3NfcmVzZXQoKWAsIGB2bV9mbGFnc19zZXQoKWAsCj4gK2B2bV9mbGFnc19jbGVhcigpYCwgYW5k
IGB2bV9mbGFnc19tb2QoKWAgdG8gbW9kaWZ5IGZsYWdzIChhbmQgdG8gaGF2ZSB0aGUKPiArbG9j
a2luZyBkb25lIGNvcnJlY3RseSBmb3IgeW91LCB0aGlzIGlzIG5vIGxvbmdlciBuZWNlc3Nhcnku
Cj4gKwo+ICtBbHNvLCB0aGUgbGVnYWN5IGFwcHJvYWNoIG9mIHNwZWNpZnlpbmcgVk1BIGZsYWdz
IHZpYSBgVk1fUkVBRGAsIGBWTV9XUklURWAsCj4gK2V0Yy4gLSBpLmUuIHVzaW5nIGEgYFZNX3h4
eGAgbWFjcm8gaGFzIGNoYW5nZWQgdG9vLgo+ICsKPiArV2hlbiBpbXBsZW1lbnRpbmcgYG1tYXBf
cHJlcGFyZSgpYCwgcmVmZXJlbmNlIGZsYWdzIGJ5IHRoZWlyIGJpdCBudW1iZXIsIGRlZmluZWQK
PiArYXMgYSBgVk1BX3h4eF9CSVRgIG1hY3JvLCBlLmcuIGBWTUFfUkVBRF9CSVRgLCBgVk1BX1dS
SVRFX0JJVGAgZXRjLiwgYW5kIHVzZSBvbmUKPiArb2YgKHdoZXJlIGBkZXNjYCBpcyBhIHBvaW50
ZXIgdG8gYHN0cnVjdCB2bWFfYXJlYV9kZXNjYCk6Cj4gKwo+ICsqIGB2bWFfZGVzY190ZXN0X2Zs
YWdzKGRlc2MsIC4uLilgIC0gU3BlY2lmeSBhIGNvbW1hLXNlcGFyYXRlZCBsaXN0IG9mIGZsYWdz
IHlvdQo+ICsgIHdpc2ggdG8gdGVzdCBmb3IgKHdoZXRoZXIgX2FueV8gYXJlIHNldCksIGUuZy4g
LSBgdm1hX2Rlc2NfdGVzdF9mbGFncyhkZXNjLAo+ICsgIFZNQV9XUklURV9CSVQsIFZNQV9NQVlX
UklURV9CSVQpYCAtIHJldHVybnMgYHRydWVgIGlmIGVpdGhlciBhcmUgc2V0LAo+ICsgIG90aGVy
d2lzZSBgZmFsc2VgLgo+ICsqIGB2bWFfZGVzY19zZXRfZmxhZ3MoZGVzYywgLi4uKWAgLSBVcGRh
dGUgdGhlIFZNQSBkZXNjcmlwdG9yIGZsYWdzIHRvIHNldAo+ICsgIGFkZGl0aW9uYWwgZmxhZ3Mg
c3BlY2lmaWVkIGJ5IGEgY29tbWEtc2VwYXJhdGVkIGxpc3QsCj4gKyAgZS5nLiAtIGB2bWFfZGVz
Y19zZXRfZmxhZ3MoZGVzYywgVk1BX1BGTk1BUF9CSVQsIFZNQV9JT19CSVQpYC4KPiArKiBgdm1h
X2Rlc2NfY2xlYXJfZmxhZ3MoZGVzYywgLi4uKWAgLSBVcGRhdGUgdGhlIFZNQSBkZXNjcmlwdG9y
IGZsYWdzIHRvIGNsZWFyCj4gKyAgZmxhZ3Mgc3BlY2lmaWVkIGJ5IGEgY29tbWEtc2VwYXJhdGVk
IGxpc3QsIGUuZy4gLSBgdm1hX2Rlc2NfY2xlYXJfZmxhZ3MoZGVzYywKPiArICBWTUFfV1JJVEVf
QklULCBWTUFfTUFZV1JJVEVfQklUKWAuCj4gKwo+ICtBY3Rpb25zCj4gKz09PT09PT0KPiArCj4g
K1lvdSBjYW4gbm93IHZlcnkgZWFzaWx5IGhhdmUgYWN0aW9ucyBiZSBwZXJmb3JtZWQgdXBvbiBh
IG1hcHBpbmcgb25jZSBzZXQgdXAgYnkKPiArdXRpbGlzaW5nIHNpbXBsZSBoZWxwZXIgZnVuY3Rp
b25zIGludm9rZWQgdXBvbiB0aGUgYHN0cnVjdCB2bV9hcmVhX2Rlc2NgCj4gK3BvaW50ZXIuIFRo
ZXNlIGFyZToKPiArCj4gKyogYG1tYXBfYWN0aW9uX3JlbWFwKClgIC0gUmVtYXBzIGEgcmFuZ2Ug
Y29uc2lzdGluZyBvbmx5IG9mIFBGTnMgZm9yIGEgc3BlY2lmaWMKPiArICByYW5nZSBzdGFydGlu
ZyBhIHZpcnR1YWwgYWRkcmVzcyBhbmQgUEZOIG51bWJlciBvZiBhIHNldCBzaXplLgo+ICsKPiAr
KiBgbW1hcF9hY3Rpb25fcmVtYXBfZnVsbCgpYCAtIFNhbWUgYXMgYG1tYXBfYWN0aW9uX3JlbWFw
KClgLCBvbmx5IHJlbWFwcyB0aGUKPiArICBlbnRpcmUgbWFwcGluZyBmcm9tIGBzdGFydF9wZm5g
IG9ud2FyZC4KPiArCj4gKyogYG1tYXBfYWN0aW9uX2lvcmVtYXAoKWAgLSBTYW1lIGFzIGBtbWFw
X2FjdGlvbl9yZW1hcCgpYCwgb25seSBwZXJmb3JtcyBhbiBJL08KPiArICByZW1hcC4KPiArCj4g
KyogYG1tYXBfYWN0aW9uX2lvcmVtYXBfZnVsbCgpYCAtIFNhbWUgYXMgYG1tYXBfYWN0aW9uX2lv
cmVtYXAoKWAsIG9ubHkgcmVtYXBzCj4gKyAgdGhlIGVudGlyZSBtYXBwaW5nIGZyb20gYHN0YXJ0
X3BmbmAgb253YXJkLgo+ICsKPiArKipOT1RFOioqIFRoZSAnYWN0aW9uJyBmaWVsZCBzaG91bGQg
bmV2ZXIgbm9ybWFsbHkgYmUgbWFuaXB1bGF0ZWQgZGlyZWN0bHksCj4gK3JhdGhlciB5b3Ugb3Vn
aHQgdG8gdXNlIG9uZSBvZiB0aGVzZSBoZWxwZXJzLgoKSSdtIGd1ZXNzaW5nIHRoZSBzdGFydCBh
bmQgc2l6ZSBwYXJhbWV0ZXJzIHBhc3NlZCB0bwptbWFwX2FjdGlvbl9yZW1hcCgpIGFuZCBzdWNo
IGFyZSByZXN0cmljdGVkIGJ5IHZtX2FyZWFfZGVzYy5zdGFydAp2bV9hcmVhX2Rlc2MuZW5kLiBJ
ZiBzbywgc2hvdWxkIHdlIGRvY3VtZW50IHRob3NlIHJlc3RyaWN0aW9ucyBhbmQKZW5mb3JjZSB0
aGVtIGluIHRoZSBjb2RlPwoKPiArICAgIHN0cnVjdCB2bV9hcmVhX2Rlc2Mgewo+ICsgICAgICAg
IC8qIEltbXV0YWJsZSBzdGF0ZS4gKi8KPiArICAgICAgICBjb25zdCBzdHJ1Y3QgbW1fc3RydWN0
ICpjb25zdCBtbTsKPiArICAgICAgICBzdHJ1Y3QgZmlsZSAqY29uc3QgZmlsZTsgLyogTWF5IHZh
cnkgZnJvbSB2bV9maWxlIGluIHN0YWNrZWQgY2FsbGVycy4gKi8KPiArICAgICAgICB1bnNpZ25l
ZCBsb25nIHN0YXJ0Owo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kOwoKCj4gLS0KPiAyLjUz
LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
