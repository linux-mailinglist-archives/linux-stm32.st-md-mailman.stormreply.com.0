Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOs6HwzHuWluNgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 22:26:36 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 165F72B2AAE
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 22:26:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A27C7C8F262;
	Tue, 17 Mar 2026 21:26:35 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDA62C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 21:26:34 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-50906a98ffeso171341cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 14:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773782793; cv=none;
 d=google.com; s=arc-20240605;
 b=QiaqVlZMb0hqHJ1GMom3522/ZYY2EZbyDYjNnXoZWkIMtbdA36moYqVsTjBMbJviaD
 Z+IpUf2xWQToX142Oj0YpyanQ3XwlbdxGwzvWdIZS2hh7DWNkvcjxhEYiIRZ/50JQ6MS
 5pogpoIjqgpU7zTcIgQL+9n1AQxcptfEbOnGUOBVZKHDV1UHD4+EjiPB1q/uMXr87sIV
 qZgPiWZtTr0c9N6SGbynJQJlk84SEuONks0XJfoj87x0gzm/EVXjg0Gn4xSfHy1TVXVW
 XuwK9nwQGe2/TeYdzsCHVlgnisVLDSfSBWpV79AYN0GMDhnZylXjE7Mzn8adyqPPRQ+N
 6vMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
 fh=Tk+aS+omLupPTFsZDYnFMHJLq7pgVaH1izm0XT9RTN4=;
 b=ImXAKLx/F/lH1RNt+VylCcwDYuHpNBoZcH0L0aN27y3CRXnNqa9FsDfQTCw1R/aeCS
 zaFmHzZ49uytdQVy7Q/xl33Wfw36293uq/EyLf+Khu8HwjYtM6Ctmo2feQU9JWmKFfoP
 u3r45FR9P30whoTbz56Ar5VY+PUINjfZZJO3fxNvo6xfZpKJ1583LCWmAWiez03dym+C
 yMHx36YIWZWZy0WUO1z+NKk7AXAVqHq3d8xEn9v+tRvVD6h51RrsglVAkiyQ60m7HRW5
 VKsFuWxdQkPtmDHGWZ0ShWbgECML9FbhJks4ubmr73pTUC8zLo3vLBqURMG4mFO3mElN
 QIpw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773782793; x=1774387593;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
 b=pkFYm+wIzymx4ctVnGjwEvyCjIPrLncxdjfXnrO7cSGvGHXnLV/vjLxHyXgy0N+Qdw
 3XuBk4LRJuEpZBI28fxBNeL/o5xfdFqThZ1v0bRVbbGJnKm9tfIj5WZ3G2JPviaJeS/D
 nxDAyxIa+IhxQlCgmmEzcRiqhGr4QezUrg2EY2txK2rhrTa2NmbVwB4YSILpMmZgLbKI
 dOg811ShpWnLclZetKhMzqBrCR3SkIqsvBDDZig2sXimSJSj1bPGSHs4zIEYSpPD134y
 7QxWoz7FqXAw1U+CGYELmF2WjqNXtF85V6ijPzAownIekU3bMQhIwZTslG5L8mKzIC7/
 z+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773782793; x=1774387593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O9MljJMIpne7nbSW7i1x1Or1SMzjT+hBLrQOgGeQvrk=;
 b=JE+F93mgPfKZnElOpytpGjzB4aZSLQ36ZRI1H3/Q0NrDdLn0qozpjpfppOycnkrU/S
 xLn98OK3JXCcAETQDOj7y7uHVhu1WOuqNjgSQsDxR0VNNgjgBhDcn25gkpIiMqurlqQ9
 W1+E4iwxqnUrfT4EAXeMVjcgFzP/ScpedfZnN6xZ3PB1mZdl10wThYCg/uocmriYcW5h
 ot+DlbjPAEAPbenxBUnAty9jLTWuoz56CfiWck6C2XpG7AIweIJ/OZNBm4dE71FD8D5z
 qNzEwn5t6duTUdzcnxgVauMv/VGTAzxz++iBhINLhVGh0FWpQmiHFH+Re6vybuDGBpe/
 55Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAMTi5SWCuG4LVMscMe4QfZS2t7aAOByGgyRPIjHA1nsUtGNukVSr++4lPd/LYOHUZbgQ+GIF3ngiVtQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNMZVpFX/NEZ0n3VrwPqPBm2D3rPjBPUYGSwiMNStnsBfOLBna
 oCsslO4ExTSKpHyenlbkHItm8wgTCvonU7QQNepKP6Ucw5kGD4YNLUbW1t8Mryu34KodxjHfr9j
 A+P+EX96uCicUhZuGhjMO7MieBgobT8j/tNTvJmna
X-Gm-Gg: ATEYQzzY975Qp10vN2XyNIW2UoKFsi9vr393/SbDyeK+TMCNGd2WKdeV+kDORTpjjwK
 k6/t3TmJ//33fNGmUtUiMRTlaDRHpVt6fVs3RiBTUI1IplOpLi6MaHindrVGGTmWPH7b3bIbt0y
 JkbHLVg+YOVliMWrk84XsA0agEgnz2vwZHqfoQM61ekDr9D6VtUICZ4SAHBZ+mE7Jl9cUFXa6Rz
 fsXVptyNYnd40ILXbSlb7tXiROxzfzDnMp1wKhFo6m/v16VyOxZuBsYZICqDiVKnMIMCWsnJ0m3
 Wd7It/7+zWLP6YuthR+4Q5olJSIv6RrpLz9a6A==
X-Received: by 2002:a05:622a:614:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-50b1470ee58mr4568251cf.2.1773782792685; Tue, 17 Mar 2026
 14:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org>
 <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
In-Reply-To: <48c6d25e374b57dba6df4fdddd4830d3fc1105be.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Mar 2026 14:26:21 -0700
X-Gm-Features: AaiRm51SJauRxJyG8YD3YuiOnfN0s_6akSz6AhkIFbo6vEz-Gt-mAXyXfHq04tA
Message-ID: <CAJuCfpFXuHg4KPY27pqMC-xV5y9ZY2W72_R8_rxO0DvrJ=_yvw@mail.gmail.com>
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
	NEURAL_SPAM(0.00)[0.979];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 165F72B2AAE
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMjoxNOKAr1BNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIGZfb3AtPm1tYXAgaW50ZXJmYWNlIGlz
IGRlcHJlY2F0ZWQsIHNvIHVwZGF0ZSBkcml2ZXIgdG8gdXNlIGl0cwo+IHN1Y2Nlc3NvciwgbW1h
cF9wcmVwYXJlLgo+Cj4gVGhlIGRyaXZlciBwcmV2aW91c2x5IHVzZWQgdm1faW9tYXBfbWVtb3J5
KCksIHNvIHRoaXMgY2hhbmdlIHJlcGxhY2VzIGl0Cj4gd2l0aCBpdHMgbW1hcF9wcmVwYXJlIGVx
dWl2YWxlbnQsIG1tYXBfYWN0aW9uX3NpbXBsZV9pb3JlbWFwKCkuCj4KPiBGdW5jdGlvbnMgdGhh
dCB3cmFwIG1tYXAoKSBhcmUgYWxzbyBjb252ZXJ0ZWQgdG8gd3JhcCBtbWFwX3ByZXBhcmUoKQo+
IGluc3RlYWQuCj4KPiBBbHNvIHVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbiBhY2NvcmRpbmdseS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoT3JhY2xlKSA8bGpzQGtlcm5lbC5v
cmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92bWUucnN0ICAgIHwgIDIgKy0K
PiAgZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZS5jICAgICAgfCAyMCArKysrKy0tLS0tLQo+
ICBkcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmggICAgICB8ICAyICstCj4gIGRyaXZlcnMv
c3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5jIHwgNTEgKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdm1lLnJzdCBiL0Rv
Y3VtZW50YXRpb24vZHJpdmVyLWFwaS92bWUucnN0Cj4gaW5kZXggYzBiNDc1MzY5ZGUwLi43MTEx
OTk5YWJjMTQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3ZtZS5yc3QK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdm1lLnJzdAo+IEBAIC0xMDcsNyArMTA3
LDcgQEAgVGhlIGZ1bmN0aW9uIDpjOmZ1bmM6YHZtZV9tYXN0ZXJfcmVhZGAgY2FuIGJlIHVzZWQg
dG8gcmVhZCBmcm9tIGFuZAo+Cj4gIEluIGFkZGl0aW9uIHRvIHNpbXBsZSByZWFkcyBhbmQgd3Jp
dGVzLCA6YzpmdW5jOmB2bWVfbWFzdGVyX3Jtd2AgaXMgcHJvdmlkZWQgdG8KPiAgZG8gYSByZWFk
LW1vZGlmeS13cml0ZSB0cmFuc2FjdGlvbi4gUGFydHMgb2YgYSBWTUUgd2luZG93IGNhbiBhbHNv
IGJlIG1hcHBlZAo+IC1pbnRvIHVzZXIgc3BhY2UgbWVtb3J5IHVzaW5nIDpjOmZ1bmM6YHZtZV9t
YXN0ZXJfbW1hcGAuCj4gK2ludG8gdXNlciBzcGFjZSBtZW1vcnkgdXNpbmcgOmM6ZnVuYzpgdm1l
X21hc3Rlcl9tbWFwX3ByZXBhcmVgLgo+Cj4KPiAgU2xhdmUgd2luZG93cwo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmMgYi9kcml2ZXJzL3N0YWdpbmcvdm1lX3Vz
ZXIvdm1lLmMKPiBpbmRleCBmMTBhMDBjMDVmMTIuLjcyMjBhYmE3YjkxOSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcv
dm1lX3VzZXIvdm1lLmMKPiBAQCAtNzM1LDkgKzczNSw5IEBAIHVuc2lnbmVkIGludCB2bWVfbWFz
dGVyX3JtdyhzdHJ1Y3Qgdm1lX3Jlc291cmNlICpyZXNvdXJjZSwgdW5zaWduZWQgaW50IG1hc2ss
Cj4gIEVYUE9SVF9TWU1CT0wodm1lX21hc3Rlcl9ybXcpOwo+Cj4gIC8qKgo+IC0gKiB2bWVfbWFz
dGVyX21tYXAgLSBNbWFwIHJlZ2lvbiBvZiBWTUUgbWFzdGVyIHdpbmRvdy4KPiArICogdm1lX21h
c3Rlcl9tbWFwX3ByZXBhcmUgLSBNbWFwIHJlZ2lvbiBvZiBWTUUgbWFzdGVyIHdpbmRvdy4KPiAg
ICogQHJlc291cmNlOiBQb2ludGVyIHRvIFZNRSBtYXN0ZXIgcmVzb3VyY2UuCj4gLSAqIEB2bWE6
IFBvaW50ZXIgdG8gZGVmaW5pdGlvbiBvZiB1c2VyIG1hcHBpbmcuCj4gKyAqIEBkZXNjOiBQb2lu
dGVyIHRvIGRlc2NyaXB0b3Igb2YgdXNlciBtYXBwaW5nLgo+ICAgKgo+ICAgKiBNZW1vcnkgbWFw
IGEgcmVnaW9uIG9mIHRoZSBWTUUgbWFzdGVyIHdpbmRvdyBpbnRvIHVzZXIgc3BhY2UuCj4gICAq
Cj4gQEAgLTc0NSwxMiArNzQ1LDEzIEBAIEVYUE9SVF9TWU1CT0wodm1lX21hc3Rlcl9ybXcpOwo+
ICAgKiAgICAgICAgIHJlc291cmNlIG9yIC1FRkFVTFQgaWYgbWFwIGV4Y2VlZHMgd2luZG93IHNp
emUuIE90aGVyIGdlbmVyaWMgbW1hcAo+ICAgKiAgICAgICAgIGVycm9ycyBtYXkgYWxzbyBiZSBy
ZXR1cm5lZC4KPiAgICovCj4gLWludCB2bWVfbWFzdGVyX21tYXAoc3RydWN0IHZtZV9yZXNvdXJj
ZSAqcmVzb3VyY2UsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICtpbnQgdm1lX21hc3Rl
cl9tbWFwX3ByZXBhcmUoc3RydWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2UsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gIHsKPiArICAg
ICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgdm1hX3NpemUgPSB2bWFfZGVzY19zaXplKGRlc2MpOwo+
ICAgICAgICAgc3RydWN0IHZtZV9icmlkZ2UgKmJyaWRnZSA9IGZpbmRfYnJpZGdlKHJlc291cmNl
KTsKPiAgICAgICAgIHN0cnVjdCB2bWVfbWFzdGVyX3Jlc291cmNlICppbWFnZTsKPiAgICAgICAg
IHBoeXNfYWRkcl90IHBoeXNfYWRkcjsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgdm1hX3NpemU7
Cj4KPiAgICAgICAgIGlmIChyZXNvdXJjZS0+dHlwZSAhPSBWTUVfTUFTVEVSKSB7Cj4gICAgICAg
ICAgICAgICAgIGRldl9lcnIoYnJpZGdlLT5wYXJlbnQsICJOb3QgYSBtYXN0ZXIgcmVzb3VyY2Vc
biIpOwo+IEBAIC03NTgsMTkgKzc1OSwxOCBAQCBpbnQgdm1lX21hc3Rlcl9tbWFwKHN0cnVjdCB2
bWVfcmVzb3VyY2UgKnJlc291cmNlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgICAg
ICAgIH0KPgo+ICAgICAgICAgaW1hZ2UgPSBsaXN0X2VudHJ5KHJlc291cmNlLT5lbnRyeSwgc3Ry
dWN0IHZtZV9tYXN0ZXJfcmVzb3VyY2UsIGxpc3QpOwo+IC0gICAgICAgcGh5c19hZGRyID0gaW1h
Z2UtPmJ1c19yZXNvdXJjZS5zdGFydCArICh2bWEtPnZtX3Bnb2ZmIDw8IFBBR0VfU0hJRlQpOwo+
IC0gICAgICAgdm1hX3NpemUgPSB2bWEtPnZtX2VuZCAtIHZtYS0+dm1fc3RhcnQ7Cj4gKyAgICAg
ICBwaHlzX2FkZHIgPSBpbWFnZS0+YnVzX3Jlc291cmNlLnN0YXJ0ICsgKGRlc2MtPnBnb2ZmIDw8
IFBBR0VfU0hJRlQpOwo+Cj4gICAgICAgICBpZiAocGh5c19hZGRyICsgdm1hX3NpemUgPiBpbWFn
ZS0+YnVzX3Jlc291cmNlLmVuZCArIDEpIHsKPiAgICAgICAgICAgICAgICAgZGV2X2Vycihicmlk
Z2UtPnBhcmVudCwgIk1hcCBzaXplIGNhbm5vdCBleGNlZWQgdGhlIHdpbmRvdyBzaXplXG4iKTsK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gICAgICAgICB9Cj4KPiAtICAgICAg
IHZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X25vbmNhY2hlZCh2bWEtPnZtX3BhZ2VfcHJvdCk7
Cj4gLQo+IC0gICAgICAgcmV0dXJuIHZtX2lvbWFwX21lbW9yeSh2bWEsIHBoeXNfYWRkciwgdm1h
LT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0KTsKPiArICAgICAgIGRlc2MtPnBhZ2VfcHJvdCA9IHBn
cHJvdF9ub25jYWNoZWQoZGVzYy0+cGFnZV9wcm90KTsKPiArICAgICAgIG1tYXBfYWN0aW9uX3Np
bXBsZV9pb3JlbWFwKGRlc2MsIHBoeXNfYWRkciwgdm1hX3NpemUpOwo+ICsgICAgICAgcmV0dXJu
IDA7Cj4gIH0KPiAtRVhQT1JUX1NZTUJPTCh2bWVfbWFzdGVyX21tYXApOwo+ICtFWFBPUlRfU1lN
Qk9MKHZtZV9tYXN0ZXJfbW1hcF9wcmVwYXJlKTsKPgo+ICAvKioKPiAgICogdm1lX21hc3Rlcl9m
cmVlIC0gRnJlZSBWTUUgbWFzdGVyIHdpbmRvdwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvdm1lX3VzZXIvdm1lLmggYi9kcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmgKPiBpbmRl
eCA3OTdlOTk0MGZkZDEuLmI2NDEzNjA1ZWE0OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdp
bmcvdm1lX3VzZXIvdm1lLmgKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvdm1lX3VzZXIvdm1lLmgK
PiBAQCAtMTUxLDcgKzE1MSw3IEBAIHNzaXplX3Qgdm1lX21hc3Rlcl9yZWFkKHN0cnVjdCB2bWVf
cmVzb3VyY2UgKnJlc291cmNlLCB2b2lkICpidWYsIHNpemVfdCBjb3VudCwKPiAgc3NpemVfdCB2
bWVfbWFzdGVyX3dyaXRlKHN0cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNlLCB2b2lkICpidWYs
IHNpemVfdCBjb3VudCwgbG9mZl90IG9mZnNldCk7Cj4gIHVuc2lnbmVkIGludCB2bWVfbWFzdGVy
X3JtdyhzdHJ1Y3Qgdm1lX3Jlc291cmNlICpyZXNvdXJjZSwgdW5zaWduZWQgaW50IG1hc2ssIHVu
c2lnbmVkIGludCBjb21wYXJlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgc3dhcCwgbG9mZl90IG9mZnNldCk7Cj4gLWludCB2bWVfbWFzdGVyX21tYXAoc3RydWN0
IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2UsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiAr
aW50IHZtZV9tYXN0ZXJfbW1hcF9wcmVwYXJlKHN0cnVjdCB2bWVfcmVzb3VyY2UgKnJlc291cmNl
LCBzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKTsKPiAgdm9pZCB2bWVfbWFzdGVyX2ZyZWUoc3Ry
dWN0IHZtZV9yZXNvdXJjZSAqcmVzb3VyY2UpOwo+Cj4gIHN0cnVjdCB2bWVfcmVzb3VyY2UgKnZt
ZV9kbWFfcmVxdWVzdChzdHJ1Y3Qgdm1lX2RldiAqdmRldiwgdTMyIHJvdXRlKTsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV91c2VyLmMgYi9kcml2ZXJzL3N0YWdp
bmcvdm1lX3VzZXIvdm1lX3VzZXIuYwo+IGluZGV4IGQ5NWRkN2Q5MTkwYS4uMTFlMjVjMmY2YjBh
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy92bWVfdXNlci92bWVfdXNlci5jCj4gKysr
IGIvZHJpdmVycy9zdGFnaW5nL3ZtZV91c2VyL3ZtZV91c2VyLmMKPiBAQCAtNDQ2LDI0ICs0NDYs
MTQgQEAgc3RhdGljIHZvaWQgdm1lX3VzZXJfdm1fY2xvc2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCj4gICAgICAgICBrZnJlZSh2bWFfcHJpdik7Cj4gIH0KPgo+IC1zdGF0aWMgY29uc3Qg
c3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHZtZV91c2VyX3ZtX29wcyA9IHsKPiAtICAgICAg
IC5vcGVuID0gdm1lX3VzZXJfdm1fb3BlbiwKPiAtICAgICAgIC5jbG9zZSA9IHZtZV91c2VyX3Zt
X2Nsb3NlLAo+IC19Owo+IC0KPiAtc3RhdGljIGludCB2bWVfdXNlcl9tYXN0ZXJfbW1hcCh1bnNp
Z25lZCBpbnQgbWlub3IsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICtzdGF0aWMgaW50
IHZtZV91c2VyX3ZtX21hcHBlZCh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVu
ZCwgcGdvZmZfdCBwZ29mZiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqKnZtX3ByaXZhdGVfZGF0YSkKPiAgewo+IC0gICAgICAg
aW50IGVycjsKPiArICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBtaW5vciA9IGltaW5vcihmaWxl
X2lub2RlKGZpbGUpKTsKPiAgICAgICAgIHN0cnVjdCB2bWVfdXNlcl92bWFfcHJpdiAqdm1hX3By
aXY7Cj4KPiAgICAgICAgIG11dGV4X2xvY2soJmltYWdlW21pbm9yXS5tdXRleCk7Cj4KPiAtICAg
ICAgIGVyciA9IHZtZV9tYXN0ZXJfbW1hcChpbWFnZVttaW5vcl0ucmVzb3VyY2UsIHZtYSk7Cj4g
LSAgICAgICBpZiAoZXJyKSB7Cj4gLSAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmaW1hZ2Vb
bWlub3JdLm11dGV4KTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPiAtICAgICAgIH0K
PiAtCgpPaywgdGhpcyBjaGFuZ2VzIHRoZSBzZXQgb2YgdGhlIG9wZXJhdGlvbnMgcGVyZm9ybWVk
IHVuZGVyIGltYWdlW21pbm9yXS5tdXRleC4KQmVmb3JlIHdlIGhhZDoKCm11dGV4X2xvY2soJmlt
YWdlW21pbm9yXS5tdXRleCk7CnZtZV9tYXN0ZXJfbW1hcCgpOwo8c29tZSBmaW5hbCBhZGp1c3Rt
ZW50cz4KbXV0ZXhfdW5sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwoKTm93IHdlIGhhdmU6Cgpt
dXRleF9sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwp2bWVfbWFzdGVyX21tYXBfcHJlcGFyZSgp
Cm11dGV4X3VubG9jaygmaW1hZ2VbbWlub3JdLm11dGV4KTsKdm1faW9tYXBfbWVtb3J5KCk7Cm11
dGV4X2xvY2soJmltYWdlW21pbm9yXS5tdXRleCk7CnZtZV91c2VyX3ZtX21hcHBlZCgpOyAvLyA8
c29tZSBmaW5hbCBhZGp1c3RtZW50cz4KbXV0ZXhfdW5sb2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgp
OwoKSSB0aGluayBhcyBsb25nIGFzIGltYWdlW21pbm9yXSBkb2VzIG5vdCBjaGFuZ2Ugd2hpbGUg
d2UgYXJlIG5vdApob2xkaW5nIHRoZSBtdXRleCB3ZSBzaG91bGQgYmUgc2FmZSwgYW5kIGxvb2tp
bmcgYXQgdGhlIGNvZGUgaXQgc2VlbXMKdG8gYmUgdGhlIGNhc2UuIEJ1dCBJJ20gbm90IGZhbWls
aWFyIHdpdGggdGhpcyBkcml2ZXIgYW5kIG1pZ2h0IGJlCndyb25nLiBXb3J0aCBkb3VibGUtY2hl
Y2tpbmcuCgo+ICAgICAgICAgdm1hX3ByaXYgPSBrbWFsbG9jX29iaigqdm1hX3ByaXYpOwo+ICAg
ICAgICAgaWYgKCF2bWFfcHJpdikgewo+ICAgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJmlt
YWdlW21pbm9yXS5tdXRleCk7Cj4gQEAgLTQ3MiwyMiArNDYyLDQxIEBAIHN0YXRpYyBpbnQgdm1l
X3VzZXJfbWFzdGVyX21tYXAodW5zaWduZWQgaW50IG1pbm9yLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSkKPgo+ICAgICAgICAgdm1hX3ByaXYtPm1pbm9yID0gbWlub3I7Cj4gICAgICAgICBy
ZWZjb3VudF9zZXQoJnZtYV9wcml2LT5yZWZjbnQsIDEpOwo+IC0gICAgICAgdm1hLT52bV9vcHMg
PSAmdm1lX3VzZXJfdm1fb3BzOwo+IC0gICAgICAgdm1hLT52bV9wcml2YXRlX2RhdGEgPSB2bWFf
cHJpdjsKPiAtCj4gKyAgICAgICAqdm1fcHJpdmF0ZV9kYXRhID0gdm1hX3ByaXY7Cj4gICAgICAg
ICBpbWFnZVttaW5vcl0ubW1hcF9jb3VudCsrOwo+Cj4gICAgICAgICBtdXRleF91bmxvY2soJmlt
YWdlW21pbm9yXS5tdXRleCk7Cj4gLQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC1zdGF0
aWMgaW50IHZtZV91c2VyX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hKQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHZt
ZV91c2VyX3ZtX29wcyA9IHsKPiArICAgICAgIC5tYXBwZWQgPSB2bWVfdXNlcl92bV9tYXBwZWQs
Cj4gKyAgICAgICAub3BlbiA9IHZtZV91c2VyX3ZtX29wZW4sCj4gKyAgICAgICAuY2xvc2UgPSB2
bWVfdXNlcl92bV9jbG9zZSwKPiArfTsKPiArCj4gK3N0YXRpYyBpbnQgdm1lX3VzZXJfbWFzdGVy
X21tYXBfcHJlcGFyZSh1bnNpZ25lZCBpbnQgbWlub3IsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gK3sKPiArICAg
ICAgIGludCBlcnI7Cj4gKwo+ICsgICAgICAgbXV0ZXhfbG9jaygmaW1hZ2VbbWlub3JdLm11dGV4
KTsKPiArCj4gKyAgICAgICBlcnIgPSB2bWVfbWFzdGVyX21tYXBfcHJlcGFyZShpbWFnZVttaW5v
cl0ucmVzb3VyY2UsIGRlc2MpOwo+ICsgICAgICAgaWYgKCFlcnIpCj4gKyAgICAgICAgICAgICAg
IGRlc2MtPnZtX29wcyA9ICZ2bWVfdXNlcl92bV9vcHM7Cj4gKwo+ICsgICAgICAgbXV0ZXhfdW5s
b2NrKCZpbWFnZVttaW5vcl0ubXV0ZXgpOwo+ICsgICAgICAgcmV0dXJuIGVycjsKPiArfQo+ICsK
PiArc3RhdGljIGludCB2bWVfdXNlcl9tbWFwX3ByZXBhcmUoc3RydWN0IHZtX2FyZWFfZGVzYyAq
ZGVzYykKPiAgewo+IC0gICAgICAgdW5zaWduZWQgaW50IG1pbm9yID0gaW1pbm9yKGZpbGVfaW5v
ZGUoZmlsZSkpOwo+ICsgICAgICAgY29uc3Qgc3RydWN0IGZpbGUgKmZpbGUgPSBkZXNjLT5maWxl
Owo+ICsgICAgICAgY29uc3QgdW5zaWduZWQgaW50IG1pbm9yID0gaW1pbm9yKGZpbGVfaW5vZGUo
ZmlsZSkpOwo+Cj4gICAgICAgICBpZiAodHlwZVttaW5vcl0gPT0gTUFTVEVSX01JTk9SKQo+IC0g
ICAgICAgICAgICAgICByZXR1cm4gdm1lX3VzZXJfbWFzdGVyX21tYXAobWlub3IsIHZtYSk7Cj4g
KyAgICAgICAgICAgICAgIHJldHVybiB2bWVfdXNlcl9tYXN0ZXJfbW1hcF9wcmVwYXJlKG1pbm9y
LCBkZXNjKTsKPgo+ICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gIH0KPiBAQCAtNDk4LDcgKzUw
Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHZtZV91c2VyX2ZvcHMg
PSB7Cj4gICAgICAgICAubGxzZWVrID0gdm1lX3VzZXJfbGxzZWVrLAo+ICAgICAgICAgLnVubG9j
a2VkX2lvY3RsID0gdm1lX3VzZXJfdW5sb2NrZWRfaW9jdGwsCj4gICAgICAgICAuY29tcGF0X2lv
Y3RsID0gY29tcGF0X3B0cl9pb2N0bCwKPiAtICAgICAgIC5tbWFwID0gdm1lX3VzZXJfbW1hcCwK
PiArICAgICAgIC5tbWFwX3ByZXBhcmUgPSB2bWVfdXNlcl9tbWFwX3ByZXBhcmUsCj4gIH07Cj4K
PiAgc3RhdGljIGludCB2bWVfdXNlcl9tYXRjaChzdHJ1Y3Qgdm1lX2RldiAqdmRldikKPiAtLQo+
IDIuNTMuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
