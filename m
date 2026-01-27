Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCsXIy/AeGn6sgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 14:39:59 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18B95005
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 14:39:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E5CBC555BE;
	Tue, 27 Jan 2026 13:39:58 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE8C4C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 13:39:56 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so5456079f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 05:39:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769521196; cv=none;
 d=google.com; s=arc-20240605;
 b=RD4eD1U/0abMOBfusfu9BTXca/koYsb5l9KqGxbjtcUimVSC/HO+ZIq1nyAP7P0I5p
 G1XDnbAj+SE+ooo1RzXFJRq78ve+aYo+u8OGGrPpIrzT5n+c4BYvnaPNa9guQ2DU5yOZ
 lAvDsWA7r7fXW3rrRzUit9RUUh+CddLKT3TKTUwd913rlcJQWdvrLXnSqVEFDbGOdSk8
 2zjcp/OA10hi/BM12Xe5VLOeeQ0nJ+FwFiAJRzfiQkuqqBZDol4OSi7TLR3KO6UANkKS
 6OyyXUf8Fc1JdUrMpYGK8xfqoPHOc7Md44I8QbO7S9cx5cewqdzEtnOvGi73g0v+URI7
 9W7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IlR/WA7RxT5C3CkoKZj7WZ73vofWrh2up1KlQooa0gk=;
 fh=HBTNVMXHQnvns2auHe/mo52GpC+J3AN/zJ3iDYNUDQE=;
 b=QNnyEjVme6ZzNcximIjEpQp2edaDbJzaAyfTYlAfAF9h2WZ/8sRrwZi6DFRCFB16Bc
 mOQ3ikqB33UqyH31eAFUnHnnNpfSYeUzs+bvwXeWqkCs9TkfawJ8TwuDjAHeSNq6WPAq
 UxVLHhwsc83NAZJhH0wWvQHjM5MBgGive/q5vqzO+PfWK30SRuC9J31fPXWj3kjWDhWZ
 LTJpcqPU6Sbj/rIINM/yIwQQoHs7/LIRBdUGudshZO5RsNYoHmPcic0yVCIso3iVS6Uh
 jUZlZLQclbRxobvzsKgZSYKvq9VZN3JZVJSkTqan691wZ0WPYTP1WwefLUTx3B7COcUH
 B9WA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769521196; x=1770125996;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IlR/WA7RxT5C3CkoKZj7WZ73vofWrh2up1KlQooa0gk=;
 b=VA5hNhIUO7DnIzj2DUyCxwpJ2KeouvQ3nEO9wtcO+a5yWqsLAAi/pZfcWw4ZkHkKfG
 qtxWVuEOl4U5iUp1Teypt6ueKtKID4aX7aRAxnjymH6qFshgQnvszCUSsirATiuZ0+zD
 L28LxBvl2Ed8ymoHTtcw4/F0jhpjCEI6bCHEc0elac0eFS3LAdswY6EafjyjvoK39+9Y
 cCv8uKTaxn8/qXbZ7BaqmphsAjMY2lsWTcelppewY/UJ4pJlT86Ozn3lX0zdzA/2zMYN
 /lyC/bD+30Timu3HKwD8OSSmqzYoRaHLh6iPhcAa811rgmb7SIcKzdwP2KFujzWbfZRY
 sGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769521196; x=1770125996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IlR/WA7RxT5C3CkoKZj7WZ73vofWrh2up1KlQooa0gk=;
 b=QOifpC/0x0c62tNA1v4KxJuJG6OPRq2kzCTFOoFDyl6VDMPo+f7x8eLfwPSU9G82m3
 OGs515eXLe9yT+YRZoJ1/Ey7fhdP60BPMUIjViQEkUWHdf0h5igecRVrbUuakQXfHJtu
 OzywKxykDIM33K4qNM43aKNWKLdqFI2a9N9PmdLOYZjy+SWNU9YK+uiK4y5NLpRU7VmM
 qCiAHPA905DYQ7rRLjup54ZMjUBUKLkEkD7cfwa14HsKMXhbXd0eZUTika88Rvp2x0qG
 cQZ5rSCwrFy5nPE3vF6KkmFNE+HPpx3fnUKIQttMwvNfBKAzbvcW9PvSqNHvxEN749O2
 l5ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZdAZYYQs5TAT3vJMG9l4LtI6zFDsXkbCl6uAqK6bs2gR7+hzO5TSDFKfDt5e/R9mJpgD66HNMDEvrkw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxeMnu7spllZGLKIvW6XXwsRY26CXdeZ+P2I8LTibSsfWUeQKJr
 JlC5tQp1HDUaOghZNd5RNd27zhPQOCs+Y0q9bJ2u50+NhsZoP9cJDxNpozhlRkcj9vbGucMorkH
 9cqXyj56HxCkdXuxBEgL5NrZsruJRBhU=
X-Gm-Gg: AZuq6aLw1x6J3DStyAmvXlG7KVSQUJkKk0v5vm9kxeX6s8SCDIeD7u4yD8rxnEUuCx7
 pe/3mPuL/kMICnOaClLAC54WLY6wElh0NX43OmsLRQMHl304g+aUptFgzw0i4pJoR1CG/F3rbEO
 1UcNouzxCHuw4wZgdQBMGUvl0XiAE1aRrZ5qHaTsa99TEeRHxpaMVtyz9iyV3OZumiEtokzC0i1
 uC7KKrDPcYswqbtetOstftVWML66zpoqaUGrkKILenlALWnYP1aGb9iRk3C8Tz0Rl9fXwMKmChJ
 g8i/83eq2RZsjtg3ewfcnhkcw8yAkX1yk+6f89jfvIm1kQoAGiCjQxzeqw==
X-Received: by 2002:a05:6000:26c7:b0:435:9691:d525 with SMTP id
 ffacd0b85a97d-435dd02bd66mr2596133f8f.13.1769521195749; Tue, 27 Jan 2026
 05:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk>
In-Reply-To: <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Jan 2026 13:39:29 +0000
X-Gm-Features: AZwV_Qi7ONuSH5cnoHQEqydQB-V8V2QfAv3cVDqg-9__qb79RGS2Oo_Iqp8eszA
Message-ID: <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH net-next] net: stmmac: Preserve
 bootloader MAC address across unconditional reset
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:linux-kernel@vger.kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:netdev@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:biju.das.jz@bp.renesas.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:geert@glider.be,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,pengutronix.de,glider.be,bp.renesas.com,renesas.com,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,armlinux.org.uk:email]
X-Rspamd-Queue-Id: BC18B95005
X-Rspamd-Action: no action

SGkgUnVzc2VsbCwKCk9uIE1vbiwgSmFuIDI2LCAyMDI2IGF0IDY6MTHigK9QTSBSdXNzZWxsIEtp
bmcgKE9yYWNsZSkKPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBNb24sIEph
biAyNiwgMjAyNiBhdCAwNToyNTowM1BNICswMDAwLCBQcmFiaGFrYXIgd3JvdGU6Cj4gPiBGcm9t
OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
Cj4gPgo+ID4gQ29tbWl0IDkwZjUyMmEyMGUzZDEgKCJORVQ6IGR3bWFjOiBNYWtlIGR3bWFjIHJl
c2V0IHVuY29uZGl0aW9uYWwiKQo+ID4gYXNzZXJ0cyBhIHJlc2V0IGluIHByb2JlIHdoZW4gYSBy
ZXNldCBjb250cm9sbGVyIGlzIHByZXNlbnQuIFRoaXMgcmVzZXQKPiA+IGNsZWFycyB0aGUgTUFD
IGFkZHJlc3MgcmVnaXN0ZXJzLCBzbyBhIHZhbGlkIGFkZHJlc3MgcHJvZ3JhbW1lZCBieSB0aGUK
PiA+IGJvb3Rsb2FkZXIgZ2V0cyBsb3N0IGFuZCB0aGUgZHJpdmVyIGZhbGxzIGJhY2sgdG8gYSBy
YW5kb20gYWRkcmVzcy4KPiA+Cj4gPiBSZWFkIHRoZSBNQUMgYWRkcmVzcyBmcm9tIHRoZSBoYXJk
d2FyZSByZWdpc3RlcnMgYmVmb3JlIHJlc2V0dGluZyB0aGUKPiA+IGhhcmR3YXJlLiBLZWVwIHRo
ZSBleGlzdGluZyBhZGRyZXNzIHNlbGVjdGlvbiBsb2dpYyB3aGVuIG5vIHZhbGlkCj4gPiBhZGRy
ZXNzIGlzIGZvdW5kLCBhbmQgcHJvZ3JhbSB0aGUgc2VsZWN0ZWQgYWRkcmVzcyBiYWNrIGludG8g
dGhlIE1BQwo+ID4gYWZ0ZXIgcHJvYmUgc28gaXQgcmVtYWlucyBjb25zaXN0ZW50IGluIGhhcmR3
YXJlLgo+ID4KPiA+IEV4cG9ydCBzdG1tYWNfYnVzX2Nsa3NfY29uZmlnKCkgc28gdGhlIGVhcmx5
IHJlYWQgcGF0aCBjYW4gZW5hYmxlIHRoZQo+ID4gYnVzIGNsb2NrcyBiZWZvcmUgYWNjZXNzaW5n
IHRoZSBNQUMgcmVnaXN0ZXJzLgo+Cj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGEgZ29vZCBpZGVh
LiBzdG1tYWNfYnVzX2Nsa3NfY29uZmlnKCkgaXMgc3BlY2lmaWMKPiB0byB1c2luZyBwbGF0Zm9y
bSBkZXZpY2VzLCBidXQgdGhlIGNvcmUgc3RtbWFjIGRyaXZlciBhbHNvIHN1cHBvcnRzCj4gUENJ
IHRoYXQgZG9lc24ndCB1c2Ugc3RtbWFjX2J1c19jbGtzX2NvbmZpZygpLgo+Cj4gc3RtbWFjX2J1
c19jbGtzX2NvbmZpZygpIGhhbmRsZXM6Cj4KPiAgLSBwbGF0X2RhdC0+c3RtbWFjX2Nsawo+ICAt
IHBsYXRfZGF0LT5wY2xrCj4gIC0gYW55IGNsb2NrIGhhbmRsZWQgYnkgdGhlIHBsYXRfZGF0LT5j
bGtzX2NvbmZpZygpIG1ldGhvZAo+Cj4gRm9yIHBsYXRmb3JtIGRldmljZXMsIHN0bW1hY19wcm9i
ZV9jb25maWdfZHQoKSBnZXRzIHRoZXNlIHR3byBjbG9ja3MKPiBmcm9tIERULCBhbmQgcHJlcGFy
ZXMgYW5kIGVuYWJsZXMgdGhlbSBib3RoLiBTbywgYnkgdGhlIHRpbWUgdGhlCj4gcHJvYmUgZnVu
Y3Rpb24gaXMgY2FsbGVkLCB0aGVzZSBjbG9ja3MgYXJlIGFscmVhZHkgcnVubmluZy4KPgo+IEZv
ciB0aG9zZSBoYW5kbGVkIGJ5IHRoZSBwbGF0Zm9ybSBnbHVlLCB0aGUgZ2x1ZXMgdGhhdCBwb3B1
bGF0ZQo+IHRoaXMgZnVuY3Rpb246Cj4KPiBlaWM3NzAwOiBlaWM3NzAwX2Nsa3NfY29uZmlnKCkg
LSB0aGlzIGlzIGNhbGxlZCBmcm9tIHRoZSBpbml0L2V4aXQKPiBoYW5kbGVycy4gV2lsbCBiZSBp
bnZva2VkIHRvIGVuYWJsZSB0aGUgY2xvY2tzIGJ5IHN0bW1hY19kdnJfcHJvYmUoKS4KPgo+IGlt
eDogaW14X2R3bWFjX2Nsa3NfY29uZmlnKCkgLSBjYWxsZWQgYnkgaW14X2R3bWFjX3Byb2JlKCkg
dG8gZW5hYmxlCj4gY2xvY2tzIHByaW9yIHRvIHN0bW1hY19kdnJfcHJvYmUoKSBiZWluZyBpbnZv
a2VkLgo+Cj4gbWVkaWFrdGVrOiBtZWRpYXRla19kd21hY19jbGtzX2NvbmZpZygpIC0gY2FsbGVk
IGJ5Cj4gbWVkaWF0ZWtfZHdtYWNfcHJvYmUoKSB0byBlbmFibGUgY2xvY2tzIHByaW9yIHRvIHN0
bW1hY19kdnJfcHJvYmUoKQo+IGJlaW5nIGludm9rZWQuCj4KPiBxY29tLWV0aHFvczogZXRocW9z
X2Nsa3NfY29uZmlnKCkgLSBjYWxsZWQgYnkgcWNvbV9ldGhxb3NfcHJvYmUoKSB0bwo+IGVuYWJs
ZSBjbG9ja3MgcHJpb3IgdG8gc3RtbWFjX2R2cl9wcm9iZSgpIGJlaW5nIGludm9rZWQuCj4KPiBT
bywgSSBjYW4gY29uZmlkZW50bHkgc2F5IHRoYXQgYWxsIGNsb2NrcyBzaG91bGQgYmUgcnVubmlu
ZyBieSB0aGUKPiB0aW1lIF9fc3RtbWFjX2R2cl9wcm9iZSgpIGlzIGNhbGxlZCwgYW5kIHRodXMg
dGhlcmUgc2hvdWxkIGJlIG5vCj4gcmVxdWlyZW1lbnQgdG8gY2FsbCBzdG1tYWNfYnVzX2Nsa3Nf
Y29uZmlnKCkgaW4gdGhpcyBjb2RlLgo+CkFncmVlZC4KCj4KPiBUaGUgbmV4dCBwcm9ibGVtOiB5
b3UgcGxhY2UgdGhpcyBjb2RlIHRvIHJlYWQgcmVnaXN0ZXJzIGZyb20gc3RtbWFjCj4gYmVmb3Jl
Ogo+Cj4gICAgICAgICByZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KHByaXYtPnBsYXQtPnN0
bW1hY19haGJfcnN0KTsKPgo+IFNhZGx5LCB0aGUgYmluZGluZyBkb2N1bWVudGF0aW9uIGlzIHRv
byB2YWd1ZSB0byBwaW4gZG93biB3aGF0IHRoaXMKPiBpcywgYXMgZHdtYWMgY2FuIGhhdmUgQUhC
IG1hc3RlciAod2hpY2ggZ2VuZXJhdGVzIGJ1cyBjeWNsZXMgZm9yCj4gYWNjZXNzaW5nIG1lbW9y
eSkgYW5kIEFIQiBzbGF2ZSAod2hpY2ggd291bGQgYmUgdGhlIHRhcmdldCBmb3IKPiByZWdpc3Rl
ciBhY2Nlc3NlcykgaW50ZXJmYWNlcy4KPgo+IFRoZSBwcm9ibGVtIGhlcmUgaXMgdGhhdCBpZiBz
b21lIHBsYXRmb3JtIGdsdWUgaGFzIHdpcmVkIHRoaXMgcmVzZXQKPiBzdWNoIHRoYXQgaXQgcmVz
ZXRzIHRoZSBBSEIgc2xhdmUgc2lkZSwgdGhhdCB3aWxsIHByZXZlbnQgcmVnaXN0ZXIKPiBhY2Nl
c3MsIGFuZCB0aHVzIHlvdXIgYXR0ZW1wdCB0byByZWFkIHRoZSBNQUMgYWNyb3NzIGFsbCBkZXZp
Y2VzCj4gd2lsbCBmYWlsLgo+Ck9rLCBnb3QgeW91LgoKPgo+IFRoZSBuZXh0IHF1ZXN0aW9uIHRo
YXQgY29tZXMgdXAgaXMgdGhhdCB3ZSBoYXZlIGEgcGVyZmVjdGx5IGdvb2Qgd2F5Cj4gdGhhdCdz
IGJlZW4gYXJvdW5kIGZvciB5ZWFycyB0byBwYXNzIGEgTUFDIGFkZHJlc3MgZnJvbSB0aGUgYm9v
dAo+IGxvYWRlciBpbnRvIHRoZSBrZXJuZWwgZm9yIGFueSBuZXR3b3JrIGludGVyZmFjZS4gSSBu
b3RpY2UgdGhhdCBpdAo+IGlzbid0IG1lbnRpb25lZCBpbiB0aGUgRFQgYmluZGluZ3MsIHByZXN1
bWFibHkgdG8gcHJldmVudCBwZW9wbGUKPiBmcm9tIGFkZGluZyBpdCB0byB0aGVpciBpbi1rZXJu
ZWwgRFQgZmlsZXMuCj4KPiAgICAgICAgIG1hYy1hZGRyZXNzID0KPiAgICAgICAgIGxvY2FsLW1h
Yy1hZGRyZXNzID0KPgo+IFRoZSBvbGQgZG9jdW1lbnRhdGlvbiBpbiBldGhlcm5ldC50eHQgd2Fz
Ogo+Cj4gLSBtYWMtYWRkcmVzczogYXJyYXkgb2YgNiBieXRlcywgc3BlY2lmaWVzIHRoZSBNQUMg
YWRkcmVzcyB0aGF0IHdhcyBsYXN0IHVzZWQgYnkKPiAgIHRoZSBib290IHByb2dyYW07IHNob3Vs
ZCBiZSB1c2VkIGluIGNhc2VzIHdoZXJlIHRoZSBNQUMgYWRkcmVzcyBhc3NpZ25lZCB0bwo+ICAg
dGhlIGRldmljZSBieSB0aGUgYm9vdCBwcm9ncmFtIGlzIGRpZmZlcmVudCBmcm9tIHRoZSAibG9j
YWwtbWFjLWFkZHJlc3MiCj4gICBwcm9wZXJ0eTsKPiAtIGxvY2FsLW1hYy1hZGRyZXNzOiBhcnJh
eSBvZiA2IGJ5dGVzLCBzcGVjaWZpZXMgdGhlIE1BQyBhZGRyZXNzIHRoYXQgd2FzCj4gICBhc3Np
Z25lZCB0byB0aGUgbmV0d29yayBkZXZpY2U7Cj4KPiBHaXZlbiB0aGF0IHRoZXNlIGFyZSBpbnRl
cmZhY2VzIGJldHdlZW4gdGhlIGJvb3QgbG9hZGVyIGFuZCB0aGUga2VybmVsLAo+IHRoZXkgY2Fu
J3QgYmUgZGVwcmVjYXRlZCwgYXMgcGxhdGZvcm1zIHdpbGwgcmVseSB1cG9uIHRoZXNlIHByb3Bl
cnRpZXMKPiB0byBwYXNzIHRoZSBNQUMgYWRkcmVzcyBmcm9tIHRoZSBib290IGxvYWRlciB0byB0
aGUga2VybmVsLiBGb3IgZXhhbXBsZQo+IG9uIG9uZSBvZiBteSBzeXN0ZW1zOgo+Cj4gJCB2ZGly
IC9zeXMvY2xhc3MvbmV0L2V0aDAvb2Zfbm9kZS8KPiB0b3RhbCAwCj4gLXItLXItLXItLSAxIHJv
b3Qgcm9vdCAgNCBKYW4gMjYgMTg6MDggZ29wLXBvcnQtaWQKPiAtci0tci0tci0tIDEgcm9vdCBy
b290IDUwIEphbiAyNiAxODowOCBpbnRlcnJ1cHQtbmFtZXMKPiAtci0tci0tci0tIDEgcm9vdCBy
b290IDgwIEphbiAyNiAxODowOCBpbnRlcnJ1cHRzCj4gLXItLXItLXItLSAxIHJvb3Qgcm9vdCAg
NiBKYW4gMjYgMTg6MDggbG9jYWwtbWFjLWFkZHJlc3MKPiAtci0tci0tci0tIDEgcm9vdCByb290
IDE0IEphbiAyNiAxODowOCBuYW1lCj4gLXItLXItLXItLSAxIHJvb3Qgcm9vdCAgNCBKYW4gMjYg
MTg6MDggcGh5Cj4gLXItLXItLXItLSAxIHJvb3Qgcm9vdCAxMCBKYW4gMjYgMTg6MDggcGh5LW1v
ZGUKPiAtci0tci0tci0tIDEgcm9vdCByb290ICA4IEphbiAyNiAxODowOCBwaHlzCj4gLXItLXIt
LXItLSAxIHJvb3Qgcm9vdCAgNCBKYW4gMjYgMTg6MDggcG9ydC1pZAo+IC1yLS1yLS1yLS0gMSBy
b290IHJvb3QgIDQgSmFuIDI2IDE4OjA4IHJlZwo+IC1yLS1yLS1yLS0gMSByb290IHJvb3QgIDUg
SmFuIDI2IDE4OjA4IHN0YXR1cwo+Cj4gd2hlcmUgImxvY2FsLW1hYy1hZGRyZXNzIiBzdGF0ZXMg
dGhlIE1BQyBhZGRyZXNzIHRvIGJlIHVzZWQgZm9yIGV0aDAsCj4gYXMgc3BlY2lmaWVkIGJ5IHRo
ZSBib290IGxvYWRlci4KPgpUaGFua3MgZm9yIHRoZSBwb2ludGVyLCBJIHdpbGwgdXNlIHRoZSBh
Ym92ZS1tZW50aW9uZWQgbWV0aG9kIHdpdGgKd2hpY2ggd2Ugd29uJ3QgYmUgbmVlZGluZyB0aGlz
IHBhdGNoIG9uIHRoZSBSWi9UMkggcGxhdGZvcm0uCgo+IEkgZG9uJ3QgdGhpbmsgc3RtbWFjIG5l
ZWRzIHRoaXMgZXh0cmEgY29tcGxpY2F0aW9uIHByb3ZpZGVkIHBsYXRmb3Jtcwo+IG1ha2UgdXNl
IG9mIG1lY2hhbmlzbXMgdGhhdCBhbHJlYWR5IGV4aXN0Li4uIGFuZCBJIGZlZWwgaXQncyB0aW1l
IHRvCj4gc3RhcnQgc2F5aW5nIG5vIHRvIHBsYXRmb3JtIHNwZWNpZmljIHF1aXJrcyB0aGF0IGNh
biBiZSBoYW5kbGVkIGJ5Cj4gdGhvc2UgbWVjaGFuaXNtcy4KPgpPay4KCkNoZWVycywKUHJhYmhh
a2FyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
