Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D391FCA43
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2020 11:56:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 871F3C36B0D;
	Wed, 17 Jun 2020 09:56:49 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FF8FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 08:03:34 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id o15so1271966ejm.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IoLOTj4N/UivUbV7Xr+eQksZLmcOCCkaL8Z2FZzpaSE=;
 b=n7fvTs+/AIa8pMpfW6aPzMLlPj+Dgki9bUAxy/WJhTzuhCBbd+H1VjHgPGq499Rpv/
 5d/Fu/pYEKH1b6nUOp+B/0rVShHG5a3F5X6E9yohIERXhGRB+jfz7fG7aLScoIpx8e+F
 hoa3YKo1A1lDCasydfb4WIy1UyVUOIk9DfVXXMnVNv4WGz8gFNusqZ8XbJsGTDUN9Fqb
 G31mdXjKpT3KyemJTlD9XocjfZeFc/GyLV2zWtdzsLpQAbvFvS3y1YSYDd18MIgGQFXl
 /yNkjvwU7T7hVY2TKYobQ4wa9+HTev7V+Zm0ABk5R4hLFzxjXuIxIeh+PmN3kmrE6ePT
 RYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IoLOTj4N/UivUbV7Xr+eQksZLmcOCCkaL8Z2FZzpaSE=;
 b=NqPQe3SfgrbXpiV5Ryn1XmoJV0Apvu82p/opEFkZfjGHx14MgB/7XuTn68EhsHAvBa
 2JW8E1Pv2/W05HPE2wgKNWjvVV9RtMrk2K1ygBdDGpzQR0vYX11VUkBE7MsVY/n9hmFE
 gCcwsA8ue8Nw+EG+wOVtgCvBSTVpYkLGC5Oar6EvE7HJHDLIFRk07xGzwdtbU5zXOK1D
 dxB14cRzfiD7TftVeDlmOw/umrcBKSU3vZ4pj93sJE7oI0DS8/UDtpYKBF0JwEskVw7j
 LzJl7H1/22y+DaVos0N2rA4BoiN1BpZmkyhTU/SAAenInrMYZcklWS8IUsubMDRBNk/6
 96pw==
X-Gm-Message-State: AOAM533ueGq+3OelHrYD5Gb1bqVxD7lmXG5FCNZVWbaVOYreOwy8Q9Dy
 tLc8w0a/FC/av+ZITaTqNio=
X-Google-Smtp-Source: ABdhPJwEiLAyKqBWSBg/9gW1RJJ++WW+xletvVfauJvMuZRCPanBDVczGoSWbdvhRqSEjwIJMjoADg==
X-Received: by 2002:a17:906:1149:: with SMTP id
 i9mr6779545eja.100.1592381013809; 
 Wed, 17 Jun 2020 01:03:33 -0700 (PDT)
Received: from [10.31.1.6] ([194.187.249.54])
 by smtp.gmail.com with ESMTPSA id n16sm12971271ejl.70.2020.06.17.01.03.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 01:03:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Jo -l <joel.voyer@gmail.com>
In-Reply-To: <20200617003711.GD8681@bombadil.infradead.org>
Date: Wed, 17 Jun 2020 10:03:30 +0200
Message-Id: <29829792-2C3E-44D1-A337-E206F1B6C92A@gmail.com>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <20200616230130.GJ27795@twin.jikos.cz>
 <20200617003711.GD8681@bombadil.infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:56:48 +0000
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 dsterba@suse.cz, David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, kasan-dev@googlegroups.com,
 linux-wpan@vger.kernel.org, David Rientjes <rientjes@google.com>,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/3] mm,
	treewide: Rename kzfree() to kfree_sensitive()
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

Qm9uam91ciwKRMOpc29sw6ksIGF1Y3VuZSB0cmFkdWN0aW9uIHBvc3NpYmxlLCAKRW4gZnJhbsOn
YWlzIHBvdXIgY29tcHJlbmRyZSEKTWVyY2kKc2x0cwoKPiBMZSAxNyAwNiAyMDIwIMOgIDAyOjM3
LCBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gYSDDqWNyaXQgOgo+IAo+IE9u
IFdlZCwgSnVuIDE3LCAyMDIwIGF0IDAxOjAxOjMwQU0gKzAyMDAsIERhdmlkIFN0ZXJiYSB3cm90
ZToKPj4gT24gVHVlLCBKdW4gMTYsIDIwMjAgYXQgMTE6NTM6NTBBTSAtMDcwMCwgSm9lIFBlcmNo
ZXMgd3JvdGU6Cj4+PiBPbiBNb24sIDIwMjAtMDYtMTUgYXQgMjE6NTcgLTA0MDAsIFdhaW1hbiBM
b25nIHdyb3RlOgo+Pj4+IHY0Ogo+Pj4+IC0gQnJlYWsgb3V0IHRoZSBtZW16ZXJvX2V4cGxpY2l0
KCkgY2hhbmdlIGFzIHN1Z2dlc3RlZCBieSBEYW4gQ2FycGVudGVyCj4+Pj4gIHNvIHRoYXQgaXQg
Y2FuIGJlIGJhY2twb3J0ZWQgdG8gc3RhYmxlLgo+Pj4+IC0gRHJvcCB0aGUgImNyeXB0bzogUmVt
b3ZlIHVubmVjZXNzYXJ5IG1lbXplcm9fZXhwbGljaXQoKSIgcGF0Y2ggZm9yCj4+Pj4gIG5vdyBh
cyB0aGVyZSBjYW4gYmUgYSBiaXQgbW9yZSBkaXNjdXNzaW9uIG9uIHdoYXQgaXMgYmVzdC4gSXQg
d2lsbCBiZQo+Pj4+ICBpbnRyb2R1Y2VkIGFzIGEgc2VwYXJhdGUgcGF0Y2ggbGF0ZXIgb24gYWZ0
ZXIgdGhpcyBvbmUgaXMgbWVyZ2VkLgo+Pj4gCj4+PiBUbyB0aGlzIGxhcmdlciBhdWRpZW5jZSBh
bmQgbGFzdCB3ZWVrIHdpdGhvdXQgcmVwbHk6Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzU3M2IzZmJkNTkyN2M2NDM5MjBlMTM2NDIzMGMyOTZiMjNlNzU4NGQuY2FtZWxAcGVyY2hl
cy5jb20vCj4+PiAKPj4+IEFyZSB0aGVyZSBfYW55XyBmYXN0cGF0aCB1c2VzIG9mIGtmcmVlIG9y
IHZmcmVlPwo+PiAKPj4gSSdkIGNvbnNpZGVyIGtmcmVlIHBlcmZvcm1hbmNlIGNyaXRpY2FsIGZv
ciBjYXNlcyB3aGVyZSBpdCBpcyBjYWxsZWQKPj4gdW5kZXIgbG9ja3MuIElmIHBvc3NpYmxlIHRo
ZSBrZnJlZSBpcyBtb3ZlZCBvdXRzaWRlIG9mIHRoZSBjcml0aWNhbAo+PiBzZWN0aW9uLCBidXQg
d2UgaGF2ZSByYnRyZWVzIG9yIGxpc3RzIHRoYXQgZ2V0IGRlbGV0ZWQgdW5kZXIgbG9ja3MgYW5k
Cj4+IHJlc3RydWN0dXJpbmcgdGhlIGNvZGUgdG8gZG8gZWcuIHNwbGljZSBhbmQgZnJlZSBpdCBv
dXRzaWRlIG9mIHRoZSBsb2NrCj4+IGlzIG5vdCBhbHdheXMgcG9zc2libGUuCj4gCj4gTm90IGp1
c3QgcGVyZm9ybWFuY2UgY3JpdGljYWwsIGJ1dCBjb3JyZWN0bmVzcyBjcml0aWNhbC4gIFNpbmNl
IGt2ZnJlZSgpCj4gbWF5IGFsbG9jYXRlIGZyb20gdGhlIHZtYWxsb2MgYWxsb2NhdG9yLCBJIHJl
YWxseSB0aGluayB0aGF0IGt2ZnJlZSgpCj4gc2hvdWxkIGFzc2VydCB0aGF0IGl0J3MgIWluX2F0
b21pYygpLiAgT3RoZXJ3aXNlIHdlIGNhbiBnZXQgaW50byB0cm91YmxlCj4gaWYgd2UgZW5kIHVw
IGNhbGxpbmcgdmZyZWUoKSBhbmQgaGF2ZSB0byB0YWtlIHRoZSBtdXRleC4KCkpvLWwKam9lbC52
b3llckBnbWFpbC5jb20KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
