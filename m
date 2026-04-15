Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ly6Ljz632ntbAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 22:51:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A57407B80
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 22:51:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A1A8C3F944;
	Wed, 15 Apr 2026 20:51:07 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4823CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 20:51:06 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43d6fbd0954so3224383f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 13:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776286265; cv=none;
 d=google.com; s=arc-20240605;
 b=S+mBZftgq4535k0fbIjqdL95UvX780vrh17321Y5yG6r9xRpu13buD4jXX6QFJCJvo
 0UwNEtk4zBXnoLu8+WkJmEeYYrcYDdeuyxqYmXl6AMP4/hFHnfCC9n0fnGM02iDNXYyg
 vIB+WMbO80NLMmKB6fs3EPQaY4MBSAqprI+hCA4LEUeefR5Pu98aA/hoHlaa4CqripDP
 VhGYkQc1K14D6BqsAzmLyAxfiG9st0Iser0PMjhZe8IgG/t4kvMW55drQjPHLMneDcM3
 upXwbYPYBqrW47jtE3uwtCUz06eTtJtzfTshupnnuDkSmnPH3C1ZHiZz6Sq8/ARDhUPU
 nsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=A7UDYGzKJJe/bdquUBaYKdQJ1gprhVLDRlL+WM3sRcQ=;
 fh=+aXRQXNjo41c2tAdXD0KDMP5SE1rxtOQ6CAF4+Z/e/w=;
 b=DDDiYC2/MR7Ah+NlPhczKVfD3OqvJXURO3HrRtoRTeqZr4nnv9sQkuPBldNzB4rHNZ
 wLsgzDEzR848Oo37UpcZ+PHV0/hblhxcfBEMOTQBAqcitsYBlbz6phcHHwTpV6/bjjm7
 lGIUe3AuO08CG8HQ2Et/QeqZ4aNJN8stRO2rfEBwpr4IinWx1MV5lj4euRCZ1SNCsUPj
 2rfd3lBwlj4C0nV9LGySqrIPtRU+CYIBBmJ2reb1VtAu+rhIVul4nfXfJW/AOAB35SMc
 /YK0v/jycX98YEAzYii1gQa/wxDxxRV1b2ENR4IzInOoIcvmPErWiz1prz47fMKvJcJo
 bl5Q==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776286265; x=1776891065;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A7UDYGzKJJe/bdquUBaYKdQJ1gprhVLDRlL+WM3sRcQ=;
 b=gwj5yl5LFz/M/wzj/d0SAWNKE0feCdOAHsGAW46bWMlRTqnygMUuNhwXYV4TnOoU2U
 1NP5E6YWHk2tt1icYHKBpOsYKmVEDqdEURzZ0z3UCSQTTg7ywdHJv+nIeb5/eETuxGdh
 bmqQs6K4qX6TmPON1cOVVXf3smj38A8xevbOlUf5a5Vr1UoP0srljkZ+HCyRhrJNYkjP
 vq1cc9UjN9jT+CVcLOruBtT1mfKDISDhGvW7lnnGkyw0u4WoPrplE3McYEByygi1FwIG
 FyHSv/+3jEV1xTLbaXkTfV3wI/d03I9PWym5CMgTLG7MIuX1mNBh+0jkKku/AcBSoZzh
 XzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776286265; x=1776891065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A7UDYGzKJJe/bdquUBaYKdQJ1gprhVLDRlL+WM3sRcQ=;
 b=i98VhHHHzw/NaMNRGLYSlMSMDOxSr82A6ULh202ymo4ngYztiCLnxzYO5PYvsmr/gT
 43St8O/+Gbux5VxkVDAtYfb6YA9wRBHgX2JzTk7LEr6GnOEXoc8bkuiyuHys/CMpLRGO
 KVwBLrk8ggaGnqNvhW4U7Lj0zMv0ORdcw1hXaSzZLxDcv+wKyEcPLIAU0uplKReTiUmB
 TlBqJ1qTPkFHx4MzKd6iE2AcoQXEEW7F0RChRFwM/F1+ZPhznTbUZ3oacMPllBfUYmNJ
 Vcvd2OS6SVHeK2O/1zcCbxZG26yXB0oFQaWEnbsuoZpT4a7FLX7u1wYyjXgbeHSNmxZh
 pvVw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ht9ij0zdBQbxFIsYoDxxabjxcJW0AlWBHmDGappAAVs9gW5TcMyrJsIXdBZvIAyVfcswNPFzl33RFuA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyI0WFiSgNDJpr7i92FppHhFiAbIf4XtlCi0L0VMEPAUSxiMgsi
 cXMN7GQKQkkv/+kTLJEqDFqjqznhMMKbs2AfeAdIpqixZB01ftYeTlcOusQTJMO4UUUyHxvLFJn
 8kEOllgWJbqg+jEQiCDVlWWbD/qAtXyk=
X-Gm-Gg: AeBDies4glXXlD4U7yMArBWqTYx6qOXBwRsjpt3tNgtZaYc06RsXwZtuU/aOk1o/6D2
 Ov1tuY25O29TjBeHsxbnT5XH/xKMsL8sBiDhiKfks+qsZYt/eIVah/AzIOeeUTv1M29+Wr7+RKz
 LmNrUEfdydLkMpJvB+9M/kRjAPgWkPE7On6NGVyeITYJn0POZ9+KoieQfQLUMEdgGas+AcN3UyS
 UGxzhiDu5hva3pYBieSSNt7LDiWviRezvjapKRR3aM/oRPI1JobpHyraIKruN9ntBa+q6W14NHP
 Gsk8NDzB6ZBl90OKZPDv3xERihFpytVXJlV/myuW9fz3s8D3SSY=
X-Received: by 2002:a05:6000:220b:b0:43d:30b4:1859 with SMTP id
 ffacd0b85a97d-43d64235cf5mr34620475f8f.7.1776286265230; Wed, 15 Apr 2026
 13:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org> <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
 <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
 <ad5LlXzeQ8j14Mjg@shell.armlinux.org.uk>
 <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
 <CAH5Ym4jA8w9=UxMT4vKJpnXkuDHtkFtMcg4u2sy_0S+8wgy-9w@mail.gmail.com>
 <ad-ID2WaPgPJqdsa@shell.armlinux.org.uk>
 <CAH5Ym4jKdzDeYwCfkMLmUz0FsiD2vFwfuAvqFE=uvMtPmakeMQ@mail.gmail.com>
 <ad_o4aDP0UBY_8i4@shell.armlinux.org.uk>
In-Reply-To: <ad_o4aDP0UBY_8i4@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Wed, 15 Apr 2026 13:50:53 -0700
X-Gm-Features: AQROBzD5XBS99VCDwyzmkg2_ABsUHqZK9kvqTm38xxMES7dhJirfHEs2edhZQVs
Message-ID: <CAH5Ym4j3GePEMEMmg1Z27gYfQ0N8Sc1BMW1rnvNZ4aLQ+cfFyQ@mail.gmail.com>
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 40A57407B80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBBcHIgMTUsIDIwMjYgYXQgMTI6MzfigK9QTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkK
PGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBJdCdzIG5vdCBhIHF1ZXN0aW9uIGFi
b3V0IGhvdyBJIGRlZmluZSBSQlUgLSB0aGlzIGlzIGRlZmluZWQgYnkgU3lub3BzeXMKPiBhbmQg
SSdtIHVzaW5nIGl0ICpleGFjdGx5KiB0aGF0IHdheSBhcyBzdGF0ZWQgaW4gdGhlIGRvY3VtZW50
YXRpb24uCj4KPiAiVGhpcyBiaXQgaW5kaWNhdGVzIHRoYXQgdGhlIGhvc3Qgb3ducyB0aGUgTmV4
dCBEZXNjcmlwdG9yIGluIHRoZQo+IFJlY2VpdmUgTGlzdCBhbmQgdGhlIERNQSBjYW5ub3QgYWNx
dWlyZSBpdC4gVGhlIFJlY2VpdmUgUHJvY2VzcyBpcwo+IHN1c3BlbmRlZC4gLi4uIFRoaXMgYml0
IGlzIHNldCBvbmx5IHdoZW4gdGhlIHByZXZpb3VzIFJlY2VpdmUKPiBEZXNjcmlwdG9yIGlzIG93
bmVkIGJ5IHRoZSBETUEuIgo+Cj4gSW4gb3RoZXIgd29yZHMsIERNQSBoYXMgcHJvY2Vzc2VkIHRo
ZSBwcmV2aW91cyByZWNlaXZlIGRlc2NyaXB0b3Igd2hpY2gKPiBfd2FzXyBvd25lZCBieSB0aGUg
aGFyZHdhcmUsIHdyaXR0ZW4gYmFjayB0byBjbGVhciB0aGUgT1dOIGJpdCwgYW5kCj4gdGhlbiBm
ZXRjaGVzIHRoZSBuZXh0IGRlc2NyaXB0b3IgYW5kIGZpbmRzIHRoYXQgdGhlIE9XTiBiaXQgaXMg
YWxzbwo+IGNsZWFyLgoKSSdtIG9ubHkgdHJ5aW5nIHRvIGxlYXZlIG9wZW4gdGhlIHBvc3NpYmls
aXR5IHRoYXQgdGhlIFN5bm9wc3lzCnRlY2huaWNhbCB3cml0ZXIgYW5kIHRoZSBoYXJkd2FyZSBp
bXBsZW1lbnRhdGlvbiB0ZWFtIHdlcmVuJ3QKY29tbXVuaWNhdGluZyBjbGVhcmx5LiBXZSBhbHJl
YWR5IGhhdmUgYSBzaXR1YXRpb24gd2hlcmUgUlBTIGlzbid0CmJlaGF2aW5nIGFzIGRvY3VtZW50
ZWQgKGV2ZW4gaWYgdGhhdCdzIGxpa2VseSBqdXN0IGhhcmR3YXJlCm1pc2NvbmZpZ3VyYXRpb24p
LCBzbyB3aGlsZSBJJ20gY3VycmVudGx5IHByZXR0eSBzdXJlIFJCVSBjYXJyaWVzIG5vCm90aGVy
IChhY3R1YWwpIG1lYW5pbmcgdGhhbiAiRE1BIGNhdWdodCB1cCB0byBPV049MCwiIEknbSBvbmx5
IGFib3V0Cjc1JSBjb25maWRlbnQuCgo+ID4gSXQgd291bGQgc2VlbSogdGhhdCB0aGUga2VybmVs
IGlzbid0IHJlYWxseSBmYWlsaW5nIHRvIGtlZXAgdXAgd2l0aAo+ID4gdGhlIHBhY2tldCByYXRl
LiBJZiBSQlUgaXMgZmlyaW5nIHdpdGggYSByaW5nIHRoYXQncyBub3QgZXZlbiBjbG9zZSB0bwo+
ID4gZW1wdHksIHRoYXQgdGVsbHMgbWUgdGhlcmUncyBhbm90aGVyIHdheSBmb3IgaXQgdG8gZmly
ZS4gU28gSSBzdXNwZWN0Cj4gPiB0aGUgaGFyZHdhcmUgZGVzaWduZXJzIGltcGxlbWVudGVkIGl0
IHRvIG1lYW46Cj4gPiAiV2UgY291bGRuJ3QgcmVhZCB0aGUgbmV4dCBkZXNjcmlwdG9yLCBfb3Jf
IGl0IHdhc24ndCBvd25lZCBieSBoYXJkd2FyZS4iCj4gPgo+ID4gKCogSG93ZXZlciwgaWYgYml0
IDMxIGlzIGNsZWFyIGV2ZXJ5d2hlcmUsIHdvdWxkbid0IHRoYXQgbWVhbiB0aGUgcmluZwo+ID4g
aXMgYWN0dWFsbHkgY29tcGxldGVseSBkZXBsZXRlZCwgbm90IGZ1bGw/IElmIGNvdW50PT1idWRn
ZXQsIHdvdWxkbid0Cj4gPiB0aGF0IG1lYW4gdGhlIHdob2xlIHJpbmcgaGFzbid0IGJlZW4gdmlz
aXRlZCwgc28gd2Ugb25seSByZWZpbGxlZCA2NAo+ID4gZW50cmllcyBhbmQgbm90IG5lY2Vzc2Fy
aWx5IHRoZSBlbnRpcmUgcmluZz8gTWF5YmUgdGhlIGtlcm5lbCBpc24ndAo+ID4ga2VlcGluZyB1
cCBhZnRlciBhbGwuKQo+Cj4gQWgsIEkgdGhpbmsgdGhhdCdzIHdoZXJlIG91ciB0ZXJtaW5vbG9n
eSBkaWZmZXJzLgo+Cj4gWW91IHNlZW0gdG8gZGVmaW5lIGZ1bGwgYXMgInBvcHVsYXRlZCB3aXRo
IGVtcHR5IGJ1ZmZlcnMiLiBJIGRlZmluZQo+IGZ1bGwgdG8gbWVhbiAidGhlIGhhcmR3YXJlIGhh
cyBmaWxsZWQgZXZlcnkgYnVmZmVyIHdpdGggYSBwYWNrZXQgdGhhdAo+IGl0IGhhcyByZWNlaXZl
ZCBhbmQgaGFuZGVkIGl0IG92ZXIgdG8gc29mdHdhcmUgdG8gcHJvY2Vzcy4iIE5vdGUgZXZlbgo+
IHRoZSB0ZXJtaW5vbG9neSB0aGVyZSAtIGZpbGxpbmcgYnVmZmVycyB3aXRoIGRhdGEuIFRoYXQg
dWx0aW1hdGVseQo+IGVuZHMgdXAgZmlsbGluZyB0aGUgcmluZywgYW5kIHdoZW4gY29tcGxldGVs
eSBmaWxsZWQsIGl0IGlzIGZ1bGwuCj4KPiBJIHRoaW5rIG9mIGJ1ZmZlcnMgbGlrZSBidWNrZXRz
LiBJZiBhIGJ1ZmZlciBjb250YWlucyBubyBkYXRhLCBpdAo+IGlzIGVtcHR5LiBJZiBhIGJ1ZmZl
ciBjb250YWlucyBkYXRhLCBpdCBoYXMgYmVlbiBmaWxsZWQgb3IgaXMgZnVsbC4KPiBBcHBseSB0
aGF0IHRvIGEgbGlzdCBvZiBidWZmZXJzIGFuZCB5b3UgZ2V0IHRoZSBzYW1lIHRoaW5nLiBNYW55
Cj4gZXRoZXJuZXQgZHJpdmVyIGRvY3VtZW50YXRpb24gdXNlcyB0aGlzIHNhbWUgdGVybWlub2xv
Z3ksIHNvIEkKPiB0aG91Z2h0IGl0IHdvdWxkIGJlIHdpZGVseSB1bmRlcnN0b29kLgoKQWggb2th
eSwgSSB3YXMgYmVnaW5uaW5nIHRvIHN1c3BlY3QgdGhlIHNhbWUuIEluIG15IGRlZmVuc2U6IHRo
b3VnaCBJCmFsc28gdGhpbmsgb2YgYnVmZmVycyBpbiB0aGUgc2FtZSB3YXksIHRoaXMgZHJpdmVy
IGNhbGxzIHRoZSBwcm9jZXNzCm9mIHN1cHBseWluZyBlbXB0eSBidWZmZXJzICJyZWZpbGxpbmcs
IiB3aGljaCBpcyBhbHNvIHRoZSB0ZXJtaW5vbG9neQp3ZSd2ZSBib3RoIGJlZW4gdXNpbmcgdGhy
b3VnaG91dCB0aGlzIGV4Y2hhbmdlLCBhbmQgd2hlbiBzb21ldGhpbmcgaXMKImNvbXBsZXRlbHkg
cmVmaWxsZWQiIEkgZ2VuZXJhbGx5IGNhbGwgaXQgImZ1bGwuIiBCdXQgSSdtIHJlYWxpemluZwpu
b3cgdGhhdCB0aGUgYmlkaXJlY3Rpb25hbCAoc3VibWlzc2lvbnMrY29tcGxldGlvbnMpIG5hdHVy
ZSBvZiB0aGlzCnJpbmcgbWVhbnMgdGhhdCAiZnVsbCIgYW5kICJlbXB0eSIgYXJlbid0IHJlYWxs
eSB3ZWxsLWRlZmluZWQKY29uY2VwdHMuIEknbGwgdHJ5IHRvIHJlYWQgbW9yZSBjYXJlZnVsbHkg
KGFuZCBzd2l0Y2ggdG8gc2F5aW5nCiJjb21wbGV0ZWx5IGRpcnR5IiBhbmQgImNvbXBsZXRlbHkg
Y2xlYW4iKSBnb2luZyBmb3J3YXJkLgoKU28gdGhlIGtlcm5lbCBpcyBhYmxlIHRvIHN1cHBseSBj
bGVhbiBidWZmZXJzIHdpdGhvdXQgaXNzdWUsIGJ1dCBpdApzb21laG93IGZhbGxzIGJlaGluZCB0
aGUgaW5jb21pbmcgcGFja2V0IHJhdGUgYW5kIHRoZSBETUEgaXMgbGVmdCB3aXRoCmEgY29tcGxl
dGVseSBkaXJ0eSByaW5nLiBJIGFncmVlIHRoYXQgc3RtbWFjX3J4KCkgaXMgdGhlcmVmb3JlIGp1
c3QKbm90IHJ1bm5pbmcgZmFzdCBlbm91Z2g6IGVpdGhlciBpdCdzIGdvdCByZWFsbHkgYmFkIHNj
aGVkdWxlciBqaXR0ZXIKZm9yIHRoZSB+Ni4zbXMgbWluaW11bSBpdCB0YWtlcyBmb3IgNTEyeCBm
dWxsLXNpemVkIEV0aGVybmV0IGZyYW1lcyB0bwphcnJpdmUgZnJvbSB0aGUgUEhZICh5b3VyIHNj
ZW5hcmlvIDEpLCBvciAtLSBtb3JlIGxpa2VseSAtLSB0aGUgTkFQSQpidWRnZXRzIGdyYWR1YWxs
eSBmYWxsIGJlaGluZCB0aGUgaGFyZHdhcmUgKHlvdXIgc2NlbmFyaW8gMikuCgo+IFJpZ2h0LCA0
MEtpQi4gU29ycnksIEknbSBnZXR0aW5nIGludGVycnVwdGVkIGFsbW9zdCBjb25zdGFudGx5IHdo
aWxlCj4gdHJ5aW5nIHRvIGRvIGFueXRoaW5nLgo+Cj4gSG93ZXZlciwgSSd2ZSB0ZXN0ZWQgd2l0
aCAweDdmIGluIGJvdGggZmllbGRzLCBhbmQgaXQgc3RpbGwgZmFsbHMgZmxhdAo+IG9uIGl0cyBm
YWNlLiBJJ3ZlIGFsc28gdHJpZWQgb3RoZXIgdmFsdWVzLCBidXQgYmVjYXVzZSBJIGhhZCB0byB1
bnBsdWcKPiB0aGUgbGFwdG9wIGZyb20gdGhlIG52aWRpYSBib2FyZCB0byB1c2UgdGhlIGxhcHRv
cCBwb3J0YWJseSBkdWUgdG8gdGhlCj4gbWVkaWNhbCBlbWVyZ2VuY3kgc2l0dWF0aW9uLCB0aGF0
IGNhdXNlZCBzY3JlZW4gdG8gcXVpdCwgc28gSSd2ZSBsb3N0Cj4gYWxsIHRoYXQuIENoYW9zIHJl
aWducyBzdXByZW1lIGhlcmUgOi8KCkknbSBzb3JyeSB0byBoZWFyIGFib3V0IHRoYXQsIHBsZWFz
ZSBwcmlvcml0aXplIHlvdS95b3VycyBhbmQgZG9uJ3QKZmVlbCBsaWtlIHlvdSBvd2UgbWUgc3Bl
ZWR5IHJlcGxpZXMuCgo+IFNvLCBJJ20gbm90IHN1cmUgd2UgdW5kZXJzdGFuZCB3aGF0J3MgZ29p
bmcgb24gLSBJIGRvbid0IHRoaW5rIGl0J3MgdGhhdAo+IHRoZSBGSUZPcyBhcmUgc21hbGxlciB0
aGFuIHNwZWNpZmllZC4gSSBzdXNwZWN0IHRoYXQgdGhlIDlLaUIgdnMgMzZLaUIKPiByZXN1bHRz
IGluIHNvbWUga2luZCBvZiB0aHJvdHRsaW5nIHRoYXQgcHJldmVudHMgdGhlIGNvbmRpdGlvbiB3
aGljaAo+IGhhbmdzIHRoZSBoYXJkd2FyZS4KCkknbGwgdHJ5IHBsYXlpbmcgd2l0aCB0aGUgRklG
TyBjb25maWd1cmF0aW9uIG9uIG15IGVuZCB0byBsZWFybjoKYSkgSWYgYSBzdWl0YWJseS1jb25m
aWd1cmVkIEZJRk8gc2l6ZSBtYWtlcyB0aGUgUlBTIHN0YXR1cyBhcnJpdmUgYXMgZG9jdW1lbnRl
ZApiKSBJZiBJIGNhbiBzYWZlbHkgZmlsbCB0aGUgRklGTyBzbG93bHkgKGJ5IG1hbnVhbGx5IHN0
YWxsaW5nIHRoZQpkcml2ZXIgYW5kIGFkZGluZyBmcmFtZXMgb25lIGF0IGEgdGltZSkgYW5kIGhh
dmUgaXQgZHJhaW4gb24gcmVzdW1lCmMpIFdoZXRoZXIgdGhlIFRRUyB2YWx1ZSBjYW4gYmUgYWRq
dXN0ZWQgaW5kZXBlbmRlbnRseSBvZiB0aGlzCnByb2JsZW0ncyBwcmV2YWxlbmNlCmQpIFRoZSBt
YXhpbXVtIFJRUyB2YWx1ZSB0aGF0IGFsbG93cyB0aGUgcHJvYmxlbSB0byBoYXBwZW4KCj4gSSdt
IG5vdCBnZXR0aW5nIGFzIG11Y2ggdGltZSBhcyBJJ2QgbGlrZSB0byByZWFsbHkgdGVzdCBvdXQg
c2NlbmFyaW9zCj4gZHVlIHRvIGV2ZXJ5dGhpbmcgdGhhdCBpcyBnb2luZyBvbiwgYW5kIGhvbmVz
dGx5IEkgZmVlbCBsaWtlIGp1c3QKPiB3cml0aW5nIHRoaXMgd2VlayBvZmYgbm93IGFuZCBnaXZp
bmcgdXAuCgpJIGhhdmUgdGhlIHNhbWUgaGFyZHdhcmUsIG9ic2VydmUgdGhlIHNhbWUgaXNzdWUs
IGFuZCBmaW5kIHRoaXMKaW50ZXJlc3RpbmcgZW5vdWdoIHRvIGtlZXAgcGx1Z2dpbmcgYXdheSBh
dCBpdC4gSSB3b3VsZCBoYXZlIG5vIGhhcmQKZmVlbGluZ3MgaWYgeW91IGxlZnQgbWUgYWxvbmUg
d2l0aCB0aGlzIHByb2JsZW0gZm9yIGEgYml0LiA6KQoKQmUgd2VsbCwKU2FtCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
