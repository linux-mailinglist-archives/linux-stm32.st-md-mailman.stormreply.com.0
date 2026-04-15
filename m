Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEnnJyTN32lwZAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 19:38:44 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D2A406DA2
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 19:38:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81860C3F944;
	Wed, 15 Apr 2026 17:38:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74F39C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 17:38:42 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488a4bc360bso39523715e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 10:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776274722; cv=none;
 d=google.com; s=arc-20240605;
 b=hLhTq2CiE0GsIIeicllt8PmGJFuizPvfC4WpysW6iBiX+ljymRjrXTOoL9MYXfcEHo
 KmUt0XTqo76+b8NuQ+sw41XclKwW3EasDbMQgWKQ9ZnlhOwyHY0wsSJwvX81xNFblSVN
 4H8rg3k5Mv0FdFbh/QDS+w0v1jLbTKwxulEKv58kg+zqaBRAXs12eGNsPJtQtkVbSY+z
 A5JJt7ytZuT0FrAeRDASXN696TcERDWeEr/AlhzbEcT5Pcy8e+MFfBtVspiBcR6K/UMp
 svfkbV0D3dHrLijefqENwQU2wXXD7tPkeeEG/0ARH2RRfdtoyvgfr80FXxFllJZQ9PZW
 TFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zcbF3rKrTIYUlxquwtwJBdRMB8TU6zntVRfT41or7CA=;
 fh=fD0lPspdlbpRFIuIqVPtd9zV4SxBezQop0I9FpUCPDc=;
 b=hvack4bonQGsxIwAfLdE//KaGJFsx1xxUYhu2GDQ/loo6F6AF7gH6PD/JTehL2qTGp
 oHGX6btJPqBtv1g9oM+ZPxj2djY9QoGuTXT1RD3a9GPc+hrCf5/6+VdcimZj8l22Iwko
 FpRbpoOAgGCMb/AdjvZ2lybnnkdnCnR2BoxqtBSxr5C92kyk3RvVTp+g21mbXqRhJS68
 nLTUuOjN9jcz94zHS144XssId13uKyFSW0DGKzyWe3unVCnXoOOeBvLyvE6PVANmHiCy
 Wwwhe0NfgG50v936aueCSRxgo+axAP30at79bY0v+LwseZX9n1Kz8V/g8uPi7ie65oLi
 D5kQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776274722; x=1776879522;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zcbF3rKrTIYUlxquwtwJBdRMB8TU6zntVRfT41or7CA=;
 b=cX1z+CgJqb6hHk9Aq5OdDCOA+/CYO/OS78R7/UF7A1v0ZoT+1HWfQdUjuTs8Otekgy
 s0fEElgAFp4Gsxi3HjRIm93ErFUwFlNV/ZZqmHOuzNKDFCrYHL/nf8l5krzm0rxxgC2i
 EMVm94zdfQ8AL8RkuZa0BQ8W/6pb+tpc0Q1kpp8nmdeSIZmjqDSDgxXlmoR9y6PQ7fux
 dEw6zNw34lqK6BdZsow9fLSfTd2z01DxrLzlRpNZ9AfdxSsL5Xlx9dJ8qKVpoENtqIYy
 0w9lxFEIY/2Sgmexg31maXyB3lrN4cW3gqhVS8wUM3FVOC0FIALkohTKIcvL82G0wwJn
 +orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776274722; x=1776879522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zcbF3rKrTIYUlxquwtwJBdRMB8TU6zntVRfT41or7CA=;
 b=WcFwY/sUSdDuUTOiGpLpw8Up21UoGW2IFEKCxR2lXpX5Aj0tBj1upo9S7oZGcutKSK
 ug9AarzjDL1EfZ5TgV+3NSWuR2T0tUT5yFxGScRjbCETCS9FDgQtlCQSnxE0IsIR5of2
 1icVK7ZtdKAQ71h1FektQApMnrnRFHiNP66GLrC69rTSXvUwruejvxF3c3KKL9jih4XL
 DCHa3DGl34KwvxdmtlEbsbxfKBuoVgS65Ua2KHqQKpw/jO98bVCfqu0AkUe9qvuURhkv
 s4rEd1nyM9LdfU+6gTLbJRysDQVmgFXudiVPLT2SxyGJUnBv/dhMlSLW2+31hkRkEsZb
 AvVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8DmsI0WivLO4II2i0T4Reo9ATMmZxFqBhbd4ySQUh93IuxCNTd5UYEF8PnU3Fbe1cTO1nys16+S72Iog==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxQy+XR8xrVpimQ5OQb3dbsD/CEV9Qr45rUO1cOGeIixfJ9PPXH
 Vy2Hek0rPqZKKUng1g6eBtYut59cuudyPt4UisRu+BYsxvQ1/GJHHvSX9SOl9vZqMHu2bK8ZBJt
 Eggo5l3DfcxOPbMJ+MpJtGmOk1DlaQTM=
X-Gm-Gg: AeBDievHmlfbG6r/mRAEFjNDL4ZsdfdSD5fnrgXXZ/sYOTQp0o0RKJpbhP+fet40xOR
 dHCemjpMh3lE5oCMjvQpiHIf+IHxRt5Luv3gZ8OT/Udz/6mAOpRJGSQi0kDbI/EUw1zG11xuqUg
 Gx0TV9ZF9reDzU58ZdTl+V3L9tB/JImccEgGayPL7J9mTEJF3xxpK1auGhrMrDOErJdtrsYQhBK
 ZFvxXi1hNA2Jy6Y24aK/cqoWvfLsgnaqMZxN1i+0KB1LXkvQPLGpJ2YD8DQcJl62FYKfhjltsRp
 Fw8PpVq/dtZZbSYyF+z8m7JMP9K49VPt+arLCyyBQnQMJIQ8uew=
X-Received: by 2002:a05:600c:c0c9:b0:487:1826:d89b with SMTP id
 5b1f17b1804b1-488d67e262cmr213788065e9.9.1776274721328; Wed, 15 Apr 2026
 10:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org> <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
 <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
 <ad5LlXzeQ8j14Mjg@shell.armlinux.org.uk>
 <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
 <CAH5Ym4jA8w9=UxMT4vKJpnXkuDHtkFtMcg4u2sy_0S+8wgy-9w@mail.gmail.com>
 <ad-ID2WaPgPJqdsa@shell.armlinux.org.uk>
In-Reply-To: <ad-ID2WaPgPJqdsa@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Wed, 15 Apr 2026 10:38:29 -0700
X-Gm-Features: AQROBzAqIK7tccp5Nve5YPfldbVfMbcjsC1bB4J1LveWBztJraYfNbIwTcXSd7s
Message-ID: <CAH5Ym4jKdzDeYwCfkMLmUz0FsiD2vFwfuAvqFE=uvMtPmakeMQ@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Network Development Mailing List <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: enable RPS and RBU
	interrupts
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 35D2A406DA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBBcHIgMTUsIDIwMjYgYXQgNTo0NOKAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXByIDE0LCAyMDI2IGF0
IDA3OjEyOjM0UE0gLTA3MDAsIFNhbSBFZHdhcmRzIHdyb3RlOgo+ID4gT24gVHVlLCBBcHIgMTQs
IDIwMjYgYXQgNjoxOeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+ID4gPGxpbnV4QGFybWxp
bnV4Lm9yZy51az4gd3JvdGU6Cj4gPiA+IE9rYXksIGp1c3QgYSBxdWljayBub3RlIHRvIHNheSB0
aGF0IG52aWRpYSdzIDUuMTAuMjE2LXRlZ3JhIGtlcm5lbAo+ID4gPiBzdXJ2aXZlcyBpcGVyZjMg
LWMgLVIgdG8gdGhlIGlteDYuCj4gPgo+ID4gSGkgUnVzc2VsbCwKPiA+Cj4gPiBBdywgeW91IGJl
YXQgbWUgdG8gaXQhIEkgd2FzIGFib3V0IHRvIHJlcG9ydCB0aGF0IDUuMTAuMTA0LXRlZ3JhIGlz
Cj4gPiB1bmFmZmVjdGVkLiBBbmQgbXkgaXBlcmYzIHNlcnZlciBpcyBhIG11bHRpLUdiRSBhbWQ2
NCBtYWNoaW5lLgo+ID4KPiA+ID4gRHVtcGluZyB0aGUgcmVnaXN0ZXJzIGFuZCBjb21wYXJpbmcs
IGFuZCB0aGVuIGZvcmNpbmcgdGhlIFJRUyBhbmQgVFFTCj4gPiA+IHZhbHVlcyB0byAweDIzICgr
MSA9IDM2LCAqMjU2ID0gOTIxNiBieXRlcykgYW5kIDB4OGYgKCsxID0gMTQ0LAo+ID4gPiAqMjU2
ID0gMzY4NjQgeXRlcykgcmVzcGVjdGl2ZWx5IHNlZW1zIHRvIHNvbHZlIHRoZSBwcm9ibGVtLiBV
bmRlcgo+ID4gPiBuZXQtbmV4dCwgdGhlc2UgYm90aCBlbmQgdXAgYmVpbmcgMHhmZiAoKzEgPSAy
NTYsICoyNTYgPSA2NTUzNiBieXRlcy4pCj4gPiA+IFN1c3BpY2lvdXNseSwgMzYgKiA0ID0gMTQ0
LCBhbmQgSSBhbHNvIHNlZSB0aGF0IHRoaXMga2VybmVsIHByb2dyYW1zCj4gPiA+IGFsbCBmb3Vy
IG9mIHRoZSBNVEwgcmVjZWl2ZSBvcGVyYXRpb24gbW9kZSByZWdpc3RlcnMsIGJ1dCBvbmx5IHRo
ZQo+ID4gPiBmaXJzdCBNVEwgdHJhbnNtaXQgb3BlcmF0aW9uIG1vZGUgcmVnaXN0ZXIuIEhvd2V2
ZXIsIERNQSBjaGFubmVscyAxLTMKPiA+ID4gYXJlbid0IGluaXRpYWxpc2VkLgo+ID4KPiA+IFdv
dywgZ3JlYXQhIEkgd29uZGVyIGlmIHRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIE1UTCBGSUZPcyBh
cmUgc21hbGxlcgo+ID4gdGhhbiB0aGF0LCBzbyB3aGVuIHRoZSBETUEgc3VmZmVycyBhIG1vbWVu
dGFyeSBoaWNjdXAsIHRoZSBGSUZPcyBhcmUKPiA+IGFsbG93ZWQgdG8gb3ZlcmZsb3csIHB1dHRp
bmcgdGhlIGhhcmR3YXJlIGluIGEgYmFkIHN0YXRlLgo+ID4KPiA+IFRob3VnaCBJIHN1c3BlY3Qg
dGhpcyBpcyBvbmx5IGhhbGYgb2YgdGhlIHByb2JsZW06IGRvIHlvdSBzdGlsbCBzZWUKPiA+IFJC
VXM/IEV2ZXJ5dGhpbmcgeW91J3ZlIHNoYXJlZCBzbyBmYXIgc3VnZ2VzdHMgdGhlIERNQSBmYWls
dXJlcyBhcmUKPiA+IF9ub3RfIGJlY2F1c2UgdGhlIHJ4IHJpbmcgaXMgZHJ5aW5nIHVwLgo+Cj4g
WWVzLiBOb3RlIHRoYXQgUkJVcyB3aWxsIGhhcHBlbiBub3QgYmVjYXVzZSBvZiBETUEgZmFpbHVy
ZXMsIGJ1dCBpZgo+IHRoZSBrZXJuZWwgZmFpbHMgdG8ga2VlcCB1cCB3aXRoIHRoZSBwYWNrZXQg
cmF0ZS4gUkJVIG1lYW5zICJ3ZSByZWFkCj4gdGhlIG5leHQgZGVzY3JpcHRvciwgYW5kIGl0IHdh
c24ndCBvd25lZCBieSBoYXJkd2FyZSIuCgpBcmUgeW91IHNwZWFraW5nIGZyb20gb2JzZXJ2YXRp
b24sIGRvY3VtZW50YXRpb24sIG9yIHVuZGVyc3RhbmRpbmc/CkknZCBkZWZpbmUgUkJVIHRoZSBz
YW1lIHdheSwgYnV0IHlvdSByZXBvcnRlZDoKCmBgYApbICAgNTUuNzY2MTk5XSBkd2MtZXRoLWR3
bWFjIDI0OTAwMDAuZXRoZXJuZXQgZXRoMDogcTA6IHJlY2VpdmUgYnVmZmVyCnVuYXZhaWxhYmxl
OiBjdXJfcng9MzA5IGRpcnR5X3J4PTMwOSBsYXN0X2N1cl9yeD0yNDUKbGFzdF9jdXJfcnhfcG9z
dD0zMDkgbGFzdF9kaXJ0eV9yeD0yNDUgY291bnQ9NjQgYnVkZ2V0PTY0CgpjdXJfcnggPT0gZGly
dHlfcnggX3Nob3VsZF8gbWVhbiB0aGF0IHdlIGZ1bGx5IHJlZmlsbGVkIHRoZSByaW5nLiBbLi4u
XQpbLi4uXQpFdmVyeSByaW5nIGVudHJ5IGNvbnRhaW5zIHRoZSBzYW1lIFJERVMzIHZhbHVlLCBz
byBpdCByZWFsbHkgaXMKY29tcGxldGVseSBmdWxsIGF0IHRoZSBwb2ludCBSQlUgZmlyZXMgKGJp
dCAzMSBjbGVhciBtZWFucyBzb2Z0d2FyZQpvd25zIHRoZSBkZXNjcmlwdG9yLCBhbmQgaXQncyBi
YXNpY2FsbHkgc2F5aW5nIGZpcnN0L2xhc3Qgc2VnbWVudCwKUkRFUzEgdmFsaWQsIGJ1ZmZlciAx
IGxlbmd0aCBvZiAxNTE4LgpgYGAKCkl0IHdvdWxkIHNlZW0qIHRoYXQgdGhlIGtlcm5lbCBpc24n
dCByZWFsbHkgZmFpbGluZyB0byBrZWVwIHVwIHdpdGgKdGhlIHBhY2tldCByYXRlLiBJZiBSQlUg
aXMgZmlyaW5nIHdpdGggYSByaW5nIHRoYXQncyBub3QgZXZlbiBjbG9zZSB0bwplbXB0eSwgdGhh
dCB0ZWxscyBtZSB0aGVyZSdzIGFub3RoZXIgd2F5IGZvciBpdCB0byBmaXJlLiBTbyBJIHN1c3Bl
Y3QKdGhlIGhhcmR3YXJlIGRlc2lnbmVycyBpbXBsZW1lbnRlZCBpdCB0byBtZWFuOgoiV2UgY291
bGRuJ3QgcmVhZCB0aGUgbmV4dCBkZXNjcmlwdG9yLCBfb3JfIGl0IHdhc24ndCBvd25lZCBieSBo
YXJkd2FyZS4iCgooKiBIb3dldmVyLCBpZiBiaXQgMzEgaXMgY2xlYXIgZXZlcnl3aGVyZSwgd291
bGRuJ3QgdGhhdCBtZWFuIHRoZSByaW5nCmlzIGFjdHVhbGx5IGNvbXBsZXRlbHkgZGVwbGV0ZWQs
IG5vdCBmdWxsPyBJZiBjb3VudD09YnVkZ2V0LCB3b3VsZG4ndAp0aGF0IG1lYW4gdGhlIHdob2xl
IHJpbmcgaGFzbid0IGJlZW4gdmlzaXRlZCwgc28gd2Ugb25seSByZWZpbGxlZCA2NAplbnRyaWVz
IGFuZCBub3QgbmVjZXNzYXJpbHkgdGhlIGVudGlyZSByaW5nPyBNYXliZSB0aGUga2VybmVsIGlz
bid0CmtlZXBpbmcgdXAgYWZ0ZXIgYWxsLikKCj4gVGhhdCBoYXM6Cj4KPiAgICAgICAgIGNvbnN0
IG52ZXUzMl90IHJ4X2ZpZm9fc3pbMlVdW09TSV9FUU9TX01BWF9OVU1fUVVFVUVTXSA9IHsKPiAg
ICAgICAgICAgICAgICAgeyBGSUZPX1NaKDlVKSwgRklGT19TWig5VSksIEZJRk9fU1ooOVUpLCBG
SUZPX1NaKDlVKSwKPiAgICAgICAgICAgICAgICAgICBGSUZPX1NaKDFVKSwgRklGT19TWigxVSks
IEZJRk9fU1ooMVUpLCBGSUZPX1NaKDFVKSB9LAo+ICAgICAgICAgICAgICAgICB7IEZJRk9fU1oo
MzZVKSwgRklGT19TWigyVSksIEZJRk9fU1ooMlUpLCBGSUZPX1NaKDJVKSwKPiAgICAgICAgICAg
ICAgICAgICBGSUZPX1NaKDJVKSwgRklGT19TWigyVSksIEZJRk9fU1ooMlUpLCBGSUZPX1NaKDE2
VSkgfSwKPiAgICAgICAgIH07Cj4gICAgICAgICBjb25zdCBudmV1MzJfdCB0eF9maWZvX3N6WzJV
XVtPU0lfRVFPU19NQVhfTlVNX1FVRVVFU10gPSB7Cj4gICAgICAgICAgICAgICAgIHsgRklGT19T
Wig5VSksIEZJRk9fU1ooOVUpLCBGSUZPX1NaKDlVKSwgRklGT19TWig5VSksCj4gICAgICAgICAg
ICAgICAgICAgRklGT19TWigxVSksIEZJRk9fU1ooMVUpLCBGSUZPX1NaKDFVKSwgRklGT19TWigx
VSkgfSwKPiAgICAgICAgICAgICAgICAgeyBGSUZPX1NaKDhVKSwgRklGT19TWig4VSksIEZJRk9f
U1ooOFUpLCBGSUZPX1NaKDhVKSwKPiAgICAgICAgICAgICAgICAgICBGSUZPX1NaKDhVKSwgRklG
T19TWig4VSksIEZJRk9fU1ooOFUpLCBGSUZPX1NaKDhVKSB9LAo+ICAgICAgICAgfTsKPgo+IHdo
ZXJlIGVhY2ggb2YgdGhvc2UgdmFsdWVzIGlzIHRoZSBSUVMvVFFTIHZhbHVlIHRvIHVzZSBpbiBL
aUI6Cj4KPiAjZGVmaW5lIEZJRk9fU1ooeCkgICAgICAgICAgICAgICgoKCh4KSAqIDEwMjRVKSAv
IDI1NlUpIC0gMVUpCj4KPiBUaGlzIGRvZXNuJ3QgY29ycmVzcG9uZCB3aXRoIHRoZSB2YWx1ZXMg
SSdtIHNlZWluZyBwcm9ncmFtbWVkIGludG8KPiB0aGUgaGFyZHdhcmUgdW5kZXIgdGhlIDUuMTAu
MjE2LXRlZ3JhIGtlcm5lbC4gSSdtIHNlZWluZyBUUVMgPSAxNDMKPiAoMzZLaUIpLCBhbmQgUlFT
ID0gMzUgKDlLaUIpLiBZZXMsIHRoZXNlIHZhbHVlcyBleGlzdCBpbiB0aGUgdGFibGVzCj4gYWJv
dmUgZnJvbSBhIHF1aWNrIGxvb2ssIGJ1dCB0aGV5J3JlIG5vdCBpbiB0aGUgcmlnaHQgcGxhY2Uh
CgpUcnVlLCBidXQ6CmEpIEkgZG91YnQgNS4xMC4yMTYtdGVncmEgaW5jbHVkZXMgZXhhY3RseSB0
aGUgc2FtZSB2ZXJzaW9uIG9mIHRoZQpkcml2ZXIgZm91bmQgaW4gdGhpcyByYW5kb20gR2l0SHVi
IG1pcnJvci4gKE15IGludGVudCB3YXMgb25seSB0bwpwb2ludCBvdXQgdGhhdCB0aGV5IGRvbid0
IHVzZSA1LjEwJ3Mgc3RtbWFjOyBJIHNob3VsZCBoYXZlIGJlZW4gbW9yZQpjbGVhciB0aGF0IEkg
d2Fzbid0IHRyeWluZyB0byBsaW5rIHRoZSBzYW1lIHZlcnNpb24sIHNvcnJ5ISkKYikgVGhpcyBp
cyB2ZW5kb3IgY29kZTsgSSBkb24ndCBrbm93IGhvdyBnb29kIHRoZWlyIHRlc3RpbmcvcmV2aWV3
CnByb2Nlc3MgaXMuIEl0IG1pZ2h0IG5vdCBydW4gdGhlIHdheSBpdCBsb29rcy4gVGhlIGludGVu
dCBzZWVtcyB0byBiZQpmb3IgUlFTID4gVFFTICh3aGljaCBtYWtlcyBpbnR1aXRpdmUgc2Vuc2Up
LCBidXQgYXMgeW91J3JlIHNlZWluZyB0aGUKcmVnaXN0ZXJzIHByb2dyYW1tZWQgdGhlIG90aGVy
IHdheSAncm91bmQsIHRoZXkgbWlnaHQgaGF2ZSBnb3R0ZW4gdGhlbQpzdWJ0bHkgbWl4ZWQgdXAu
Cgo+IE5vdywgYXMgZm9yIEZJRk8gc2l6ZXMsIGlmIHdlIHN1bSB1cCBhbGwgdGhlIGVudHJpZXMs
IHRoZW4gd2UKPiBnZXQ6Cj4KPiBTVU0ocnhfZmlmb19zaXplWzBdW10pID0gNjBLaUIKPiBTVU0o
cnhfZmlmb19zaXplWzFdW10pID0gNjRLaUIKPiBTVU0odHhfZmlmb19zaXplWzBdW10pID0gNjBL
aUIKPiBTVU0odHhfZmlmb19zaXplWzFdW10pID0gNjRLaUIKCkkgZm9sbG93IHRoZSBtYXRoIHdp
dGggNjRLaUIsIGJ1dCBzdXJlbHkgdGhlIDYwS2lCIHNob3VsZCBiZQo5KzkrOSs5KzErMSsxKzE9
NDBLaUI/IFRoaXMgc2VlbXMgdG8gbWUgdGhhdCB0aGUgImxlZ2FjeSBFUU9TIiBzaW1wbHkKc2hp
ZnRzIHdpdGggc21hbGxlciBGSUZPcy4gU2luY2UgZHdtYWMgaXMgbGljZW5zZWQgYXMgYSBzb2Z0
IElQIGNvcmUsCnBlcmhhcHMgdGhlIEZJRk8gc2l6ZSBpcyBhbiBlbGFib3JhdGlvbiBwYXJhbWV0
ZXI/IFRoYXQgd291bGQgbWVhbgp0aGlzIGlzbid0IGFuIGlzc3VlIHdpdGggZHdtYWMgNS4wIGJy
b2FkbHksIGJ1dCB3aXRoIE52aWRpYSdzIHNwZWNpZmljCmluc3RhbnRpYXRpb24gb2YgaXQuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
