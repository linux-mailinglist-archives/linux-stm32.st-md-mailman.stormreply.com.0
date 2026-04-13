Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bRvZN/pJ3GnCOwkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 03:42:18 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3EC3E6AF8
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 03:42:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6DE3C87ED1;
	Mon, 13 Apr 2026 01:42:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8477FC87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 01:42:16 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-43cfce3a195so2384914f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2026 18:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776044536; cv=none;
 d=google.com; s=arc-20240605;
 b=PJ04RmVSOC9YJ5tvMOUHYl5G3rNX9cYec+WfBvi4M6Dvy9fSfj5BzclqUzWPAEE0pl
 0ktisogPmtwyubXhnOElcvqLcLB4jdOQ9FenVZ1nSNKNWn+nL+44nbqgkhzDVDDa+F52
 abkPfg02/UMU4Ad8vsHGxFSGC5xFJZwJSd8Gk5oSu23IL+4UrdB4ZCuG1gPY0BXnLMF6
 54f/d2VY43okl1UCRIpaSEhXZmx/vZo5PZfAi+eGN4+yv7gKazpd00XoHrbltRKziz3X
 wV17BFICaW0KE45DA6afOfvqQvVMK2/31n0xeklfTqnvThNzj4bZ59NJOPQ2hyLe6qmt
 vLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mkQ6RBTZ5z5vPmik3lad4IDd4nljLh9X4eyQBenQOSc=;
 fh=azEcyaJe5wqBuC/VinWYXpJai3i5aQHEKlW7aXAcEIw=;
 b=BIsU43BQb+2mxqXahwfxIdmlCkffRF/aE4Bg52HaFDNIRVPW1fRwb4B72665nDT9kZ
 lxPDpciISqI5q9JLEOHcPYyAxf6kU7ZlszkXSrwFGQWpsFrUZldL6d7qkiEF3hUEdXNY
 HHTjNpj8lcQLYi0qnrgxeTcAupOTUHfFVDjRA96KtbRKZsHV0SPWiCA+0TbccNdWVU5D
 pRO4FyXAoEiHe7VeMHVNdbatZLdcEfFHDGcyNMagvk71JefFnK8smdOoDgJG9Z/rBgIt
 JU7V0eoJhazpMOi54hIKVvawjPyRbriBNUlF6HDsA8+PIqwnwkwcYqGEBc0uj3YVvvsK
 5LYw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776044536; x=1776649336;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkQ6RBTZ5z5vPmik3lad4IDd4nljLh9X4eyQBenQOSc=;
 b=hh+yOAM4Xpzh7t2p9P7QIg1C33eapsuoR1agdIBkw30S0QeCvPhHN8m2XP4e0X7G5V
 /eHkQWA2TI8iMN6k6+6wO9hmKlJo/kSOXVjufzPbtEvGXDQZwJ6NcbAE7AKWV1Yu42Fv
 f3ws0+4ELRExg8FzIuEskn2jMtHnXPsidVjR55UfFrAFgemQ88FFTvxJ5uztHAcXckYV
 UCQWsQLKA1pVLa4GG+vjjT6Y+MEsQr42VrMdOpwD389zgfrOqOQJXgKWT7NA2bYTdbsb
 XrIYTKQGxcOOWp5K3QNdkKU6bcoR7ZghAAD4YKNv4P/eJi07HOOCRsAoQWVYHa5H/J1v
 cSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776044536; x=1776649336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mkQ6RBTZ5z5vPmik3lad4IDd4nljLh9X4eyQBenQOSc=;
 b=oEdMe06/CTMTcSTSzq6vpNdkF0UWFI0lsw6Stmr5wY0p2W/s7kMTtLWAyfnWSN8yAb
 8OckyTAyKdROvdYYM9ehtb6qj7NxdPy0IDXbRL4uQrUYwiRAiFO1Ci3yJUyCI/7usHEH
 TwLvw67q4Be2rQc/3oQe76bos6AY4QifqFli1dLqOPZ/Xo7tXGnut1EGnOiUaqbsL/pP
 F0Y1b/6AvUXAEbK54BdSc/t3RbncscXeeI7QD1STWIQ6Bk6pkSWef2aMpuMgS9BZXH49
 D6AZtc32aM4o7KDe15zKC2oDT3wFSgruE+PwXdJH7VUSFwZr0oNj0UfriZFIYF8HTzv/
 JcOQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+G8vxlefQWuLVHmlpgneyeDwD3QxQet3VgYfegMsQFAbKbBWBRimEuRPupPNMYDNCqB0R68YixtpJ5pQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywkh9ELncjQpz4OmcdG3rUR7uZjZSKSiMNXZLuNBJvREyXawo7i
 Ps3y1wASuNUKIBOcoVyDgHMJoDJIWpQsIwaFSON9vPDhzft1FmJtmEUNdmAK3lgFtfsAgjaO9IJ
 GzB52CPFWAXLyxrIuhwZs1uHhwForlOo=
X-Gm-Gg: AeBDieuYr/hCFQ8iRuUBQVd85GEvyXOWTQ0f0Rq0xWcQvqwGvQsekESTTMzatvW8ym1
 QY40zwTbVDYMm8t0OTiZdAYb8bldaZBmhS5/0P0jyurDsxQxX2pY/LXiPwW3+i/sjdsD9LlmMOt
 iJuf7sNsL7stWJWQp8Xpky2+KHf3+Hj3kRHV388SynTa0pAmyc94lTq+7ymVS9I9JixIECMEsI+
 cPvuhRguGpz8F0AUkC+3khUrO/d/vN084O46X3jKznfTtKaik7AUvegLcwxz/xuX5FrgGSB2PVq
 ukiLyVHNGRX8N9M+PdrCToVjPZVXad22iVNoAzOh
X-Received: by 2002:a05:6000:4026:b0:43b:50d6:4f04 with SMTP id
 ffacd0b85a97d-43d642b5f41mr15811417f8f.38.1776044535544; Sun, 12 Apr 2026
 18:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <266998d8-7e38-4bae-a4df-2f889538fe88@bootlin.com>
 <aduq7Lvkfrz971Rb@shell.armlinux.org.uk>
In-Reply-To: <aduq7Lvkfrz971Rb@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sun, 12 Apr 2026 18:42:04 -0700
X-Gm-Features: AQROBzC8C6b8uovPJvoH5TRYEOGsdMo85w4vcpDsb0ECyjaa-7k3CW1WkTIND9g
Message-ID: <CAH5Ym4hEX15dmJhGBqhhk--_PoFRKRSyE1AomY4D3ipwAz+pKg@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 6A3EC3E6AF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU3VuLCBBcHIgMTIsIDIwMjYgYXQgNzoyM+KAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiBBcyB0aGUgZHdtYWMgNS4wIGNvcmUgcmVj
ZWl2ZSBwYXRoIHNlZW1zIHRvIGxvY2sgdXAgYWZ0ZXIgdGhlIGZpcnN0Cj4gUkJVLCBJIG5ldmVy
IHNlZSBtb3JlIHRoYW4gb25lIG9mIHRob3NlIGF0IGEgdGltZS4KPgo+IFJpZ2h0IG5vdywgSSBj
b25zaWRlciB0aGlzIHByZXR0eSBtdWNoIHVuc29sdmFibGUgLSBJJ3ZlIHNwZW50IHF1aXRlCj4g
c29tZSB0aW1lIGxvb2tpbmcgYXQgaXQgYW5kIHRyeWluZyB2YXJpb3VzIGFwcHJvYWNoZXMsIG5v
dGhpbmcgc2VlbXMKPiB0byBmaXggaXQuIEhvd2V2ZXIsIGFkZGluZyBkbWFfcm1iKCkgaW4gdGhl
IGRlc2NyaXB0b3IgY2xlYW51cC9yZWZpbGwKPiBwYXRocyBkb2VzIHNlZW0gdG8gaW1wcm92ZSB0
aGUgc2l0dWF0aW9uIGEgbGl0dGxlIHdpdGggdGhlIDQ4ME1icHMKPiBjYXNlLCBiZWNhdXNlIEkg
dGhpbmsgaXQgbWVhbnMgdGhhdCB3ZSdyZSByZWFkaW5nIHRoZSBkZXNjcmlwdG9ycyBpbgo+IGEg
bW9yZSB0aW1lbHkgbWFubmVyIGFmdGVyIHRoZSBoYXJkd2FyZSBoYXMgdXBkYXRlZCB0aGVtLgoK
SGV5IFJ1c3NlbGwsCgpJJ2QgbGlrZSB0byByZXBybyB0aGlzIGJ1dCBJIGN1cnJlbnRseSBjYW4n
dCBib290IG5ldC1uZXh0LiBNeSBpc3N1ZQppcyB0aGUgc2FtZSBhcyBbMV0sIGFuZCB0aGUgcGF0
Y2ggdG8gZml4IGl0IFsyXSBpc24ndCB5ZXQgY29tbWl0dGVkCmFueXdoZXJlIGFwcGFyZW50bHku
CgpUaGlzIHByZXZlbnRzIG15IEpldHNvbiBYYXZpZXIgTlggZnJvbSBzdGFydGluZyBhdCBhbGwg
KGFuZCBhZnRlcgplbm91Z2ggYXR0ZW1wdHMsIGNvcnJ1cHRzIGVNTUMpOyBJJ20gc3VycHJpc2Vk
IHlvdSdyZSBub3Qgc3VmZmVyaW5nCnRoZSBzYW1lIGVmZmVjdHMuIEJ1dCBiZWNhdXNlIHRoaXMg
YnVnIGxpdmVzIGluIHRoZSBJT01NVSBzdWJzeXN0ZW0KKGFuZCBpdCBoYXMgc29tZXdoYXQgaW5j
b25zaXN0ZW50IGVmZmVjdHMpLCBwZXJoYXBzIHRoaXMgaXMganVzdCBhCmRpZmZlcmVudCB3YXkg
aXQgbWFuaWZlc3RzPyBDb3VsZCB5b3UgY29uZmlybSB3aGV0aGVyIHlvdXIgZHdtYWMgaGFuZwpo
YXBwZW5zIHdpdGggSU9NTVUgZGlzYWJsZWQsIGFuZC9vciB3aXRoIFsxXSByZXZlcnRlZCBvciBb
Ml0gYXBwbGllZD8KCkknbSB1c2luZyBhIGRlZmNvbmZpZyBidWlsZCBhbmQgYSBmYWlybHkgbWlu
aW1hbCBjbWRsaW5lIChqdXN0CmNvbnNvbGU9LCByb290PSwgYW5kIHJvb3R3YWl0KS4KCkNoZWVy
cywKU2FtCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzg4MDBhMzhiLTg1MTUtNGJi
ZS1hZjE1LTBkYWU4MTI3NGJmN0BudmlkaWEuY29tLwpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzAtdjEtNjY0ZDNhY2FhYmI5Kzc4Yi1pb21tdV9nYXRoZXJfYWx3YXlzX2pnZ0Budmlk
aWEuY29tLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
