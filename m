Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN51NeGx2mnl5QgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Apr 2026 22:41:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 658753E1A6C
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Apr 2026 22:41:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C49D5C8F282;
	Sat, 11 Apr 2026 20:41:04 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44393C8F280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Apr 2026 20:41:04 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so2039631f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Apr 2026 13:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775940063; cv=none;
 d=google.com; s=arc-20240605;
 b=KAbDaK99s3YySnE9cFXOQdCpn57Enb8XqCspW/Mj7cMnqVSlTLh2zNA17l5v5XcGrc
 MR9RyJ+yX0h0KcDKSbzXMF9MHZoeooL9mPWd0H5/YrK+wpa0kYmEGU4KNgu9e+bUJ8D+
 c8Okoo5UlriU6a5qU+ycw01jQmZrYwIorM12qhVwDitfKZ6wEy7hqhPxSgxhn+YKsAar
 /Nl8E3vkYpPZdByOYBFXvEmfLulwK3V3r5g6soKQrzFKgfrhfjH08EMI5NMCMoBV6trC
 mjAzO8ebGP5phOb1oO/UIeNJhWq0qlccERuwwtYldcYZ+zIdgFq6qvLAtqPA2xtKC+cl
 zFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5q5RroT50XruNLk8tby8qXtaVeWRUZkkC5f73ORjtiQ=;
 fh=49SGCWyyHVVDC3X0Lzr/qs6gxOLM2k8cxbhcZVE/3wk=;
 b=LcKSHqeUQfHBp+Fts4vVyjESX3Fl1xA9G/+rycXfVtfKDUUf777ncSCkx4eijKgPpx
 184CUHZXiYsLi32AJTs0o0y/smHsqCqCH5KDcdFMvo1Emll0ucH1ZesxZQRTpSmO5QZb
 lrvcrPs09ulFsyBJCOWKkwqE5P11KbVOvGkVHwj90U/0IdYmf/NRuPyiDe/Fy1whH06v
 A9n/k1oJTvBZhY1EQRSc0UzuOg12wJPblEyrb1EKkX5vGNCqTstYcfQqStpkhDpM0mMx
 kEBhBH52KD2pDWH1SYAQRtosgVsAe5GOtvqL6hxaRsMkFLKUeh439OkAVD0X4gCi/KZI
 4dTQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775940063; x=1776544863;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5q5RroT50XruNLk8tby8qXtaVeWRUZkkC5f73ORjtiQ=;
 b=MAYdsQk38/m5PSuadImXPcmcJLEoBUaGnCWbP3hm3rjrOjXDnMyWT6qnSvxTC5+CMK
 Rse0679cxB7VfHfFqeKEg0xgWUo939zP/lh8WwSITx+xXSp6FE6vuP9ey/XLcsBKk7NI
 GZ4DX9YENRLvxXFjcy4ZbZ6NbSxmddZyFHZntZUnehbHJ3+YLbm9UAqIkd9YLGTX45C/
 LjoPTV695dUlSAv6/VgFlo1jDWnDG95rXtUKW9UTcGi1mdqco2UcxK3T7qEQGqBtvvTU
 Tr2cNjQvnvfZQTBhTk+YpaDuFuXZsxbgHfGpZz6kojcam54xIPnNJZk3kybMbp8QXHkO
 1Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775940063; x=1776544863;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5q5RroT50XruNLk8tby8qXtaVeWRUZkkC5f73ORjtiQ=;
 b=UiuXMkiJ8apOj+4q993eRZfmw0g3B/L3j5kNp8MzgADJmAKjOLKiwYewN58rO4ipQV
 0shfI5eo3ZquZaFwtmptDgiqcYnYc+1AuODwvUnvWofJAYTPFJZMAAsdjLm0BI4KClHD
 qOqK/X5uv46oy1gHIuIC8v8R1PbDZPUgWP484rIs3rlnMzAN2tSl9VA1CfkunJekA4r8
 ZHzqTHWL0pXZ+klB+lqHMiUEzC4oVVKCpbDMyPp7e/dfmqkc5//IL4zJN6Sdu1LN4s5Z
 7mlUznbEdNEgePNAtCyZIwfGzHHR95SKbfGfrfoEXQdCnTQEOhASbmyLCpx81ddpxrMQ
 M/Fw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/boduj4ov4D5xRJUw+nXiMS9m6k0XS3CBpeM6qDnp4EJTLFdLCTfEmlKsKb2wqXKl9ApyE6hDSbMXRQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz2xWJ+9c9ORwDVWSy1RJvqJEtM7LWhpBpJmctMqi6QZx5Jc8yK
 oM+pGtogBm24KWUJ0Dw3u9RpU8ziR09TjRC9vIKWyISgyhRB712K/jIoz+04ut2wK4qiGhSC024
 DoqVEvm77A49YUYRi+XTas00JMoKNhRQ=
X-Gm-Gg: AeBDievGGWb+Ej3Ejp0kaOn2Af9GptN0v6lWEyqG4StgfxND0Pe/md+Ag4OWnp9BxH+
 blKxxhEnmPFAakyuArB1A1wiGmZVgvPx+ZQpvUGZ5dXncBigPu7Bn3NOCDFuXA131MDx7cvKrgB
 nFQEFvuDQvTD3WOma7gNGqIWAddNdFwN06/2LaCWR4Ixe8vHDGlEyDsqwullPz/KDpTNaA8mQ2H
 z6g5W87Ri79dxtVfE5TO9Wz4oQukQMyN+3vt7bY1+Bgwqiq05jVHhBxHaQj9HMF0vqFvvjd2JGf
 cfjJ/y5g41SrXK+fy+AGUC0AO+pI1eEe47jjwA==
X-Received: by 2002:a05:6000:18a9:b0:43c:f1da:488b with SMTP id
 ffacd0b85a97d-43d642b9ce4mr12087419f8f.30.1775940063242; Sat, 11 Apr 2026
 13:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260401041929.12392-1-CFSworks@gmail.com>
 <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
 <CAH5Ym4g3pbU_bWzMwJMdhEFv4K2sp3pty3g04=0=9Z80_LzW1w@mail.gmail.com>
 <adjrtRSepmac2hpN@shell.armlinux.org.uk>
In-Reply-To: <adjrtRSepmac2hpN@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sat, 11 Apr 2026 13:40:51 -0700
X-Gm-Features: AQROBzCWE5R1ZaXZe3VP4juckZTMVk39IF4qj9BF-f9NpOBdP5trAKumJEG9Iww
Message-ID: <CAH5Ym4if3Wh8uBF85F8VrPWxXFHrs6eE=vrL=-bdHN0SnLat9A@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net v4 0/2] stmmac crash/stall fixes when
	under memory pressure
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:fancer.lancer@gmail.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:fancerlancer@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,gmail.com,lunn.ch,google.com,st.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.206];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,armlinux.org.uk:email,armlinux.org.uk:url,stormreply.com:email,stormreply.com:url,tegra-ubuntu:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 658753E1A6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgNToyM+KAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDAyLCAyMDI2IGF0
IDEwOjM5OjMyQU0gLTA3MDAsIFNhbSBFZHdhcmRzIHdyb3RlOgo+ID4gT24gVGh1LCBBcHIgMiwg
MjAyNiBhdCAxMDoxNuKAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+ID4gPGxpbnV4QGFybWxp
bnV4Lm9yZy51az4gd3JvdGU6Cj4gPiA+IEkndmUgdGVzdGVkIHRoaXMgb24gbXkgSmV0c29uIFhh
dmllciBwbGF0Zm9ybS4gT25lIG9mIHRoZSBpc3N1ZXMgSSd2ZQo+ID4gPiBoYWQgaXMgdGhhdCBy
dW5uaW5nIGlwZXJmMyByZXN1bHRzIGluIHRoZSByZWNlaXZlIHNpZGUgc3RhbGxpbmcgYmVjYXVz
ZQo+ID4gPiBpdCBydW5zIG91dCBvZiBkZXNjcmlwdG9ycy4gSG93ZXZlciwgZGVzcGl0ZSB0aGUg
cmVjZWl2ZSByaW5nCj4gPiA+IGV2ZW50dWFsbHkgYmVpbmcgcmUtZmlsbGVkIGFuZCB0aGUgaGFy
ZHdhcmUgYXBwcm9wcmlhdGVseSBwcm9kZGVkLCBpdAo+ID4gPiBzdGVhZGZhc3RseSByZWZ1c2Vz
IHRvIHJlc3RhcnQsIGRlc3BpdGUgdGhlIGRlc2NyaXB0b3JzIGhhdmluZyBiZWVuCj4gPiA+IHVw
ZGF0ZWQuCj4gPgo+ID4gSGkgUnVzc2VsbCwKPiA+Cj4gPiBKdXN0IHRvIG1ha2Ugc3VyZSBJIHVu
ZGVyc3RhbmQgY29ycmVjdGx5OiBiZWZvcmUgbXkgcGF0Y2hlcywgeW91J3ZlCj4gPiBiZWVuIG9i
c2VydmluZyB0aGlzIHByb2JsZW0gb24gWGF2aWVyIGZvciBhIHdoaWxlIChubyBpbnRlcnJ1cHRz
LCByaW5nCj4gPiBnb2VzIGRyeSk7IHdpdGggbXkgcGF0Y2hlcywgdGhlIHJpbmcgaXMgcmVmaWxs
ZWQsIGJ1dCB0aGUgZHdtYWM1Cj4gPiBkb2Vzbid0IHJlc3VtZSBETUEuIChBaCwganVzdCBzYXcg
eW91ciBmb2xsb3ctdXAgZW1haWwuKQo+ID4KPiA+ID4gQW55IGlkZWFzPwo+ID4KPiA+IE9mZiB0
aGUgdG9wIG9mIG15IGhlYWQsIG15IGh5cG90aGVzaXMgaXMgdGhhdCBkd21hYzUgaGFzIGFuIGFk
ZGl0aW9uYWwKPiA+IHRyaXB3aXJlIHdoZW4gdGhlIHJlY2VpdmUgRE1BIGlzIGV4aGF1c3RlZCwg
YW5kIHRoZQo+ID4gc3RtbWFjX3NldF9yeF90YWlsX3B0cigpL3N0bW1hY19lbmFibGVfZG1hX3Jl
Y2VwdGlvbigpIGF0IHRoZSBlbmQgb2YKPiA+IHN0bW1hY19yeF9yZWZpbGwoKSBhcmVuJ3Qgc3Vm
ZmljaWVudCB0byB3YWtlIGl0IGJhY2sgdXAuCj4gPgo+ID4gSSB0aGluayB0aGlzIGlzIG5ldyB0
byBkd21hYzUsIGJlY2F1c2UgbXkgUkszNTg4IChkd21hYzQuMjAgaWlyYykKPiA+IGhhcHBpbHkg
cmVzdW1lcyBhZnRlciB0aGUgc2FtZSBjb25kaXRpb24uCj4gPgo+ID4gWW91IGdhdmUgYSBsb3Qg
b2YgaW5mbzsgdGhhbmtzISBJJ2xsIHRyeSB0byBzY3JhcGUgdXAgc29tZQo+ID4gZG9jdW1lbnRh
dGlvbiBvbiBkd21hYzUgdG8gc2VlIGlmIHRoZXJlJ3Mgc29tZXRoaW5nIG1vcmUKPiA+IHN0bW1h
Y19yeF9yZWZpbGwoKSBvdWdodCB0byBiZSBkb2luZy4gSSB0aGluayBJIGhhdmUgYSBYYXZpZXIg
TlgKPiA+IGFyb3VuZCBoZXJlIHNvbWV3aGVyZSwgSSdsbCBzZWUgaWYgSSBjYW4gcmVwcm8gdGhl
IHByb2JsZW0uCj4KPiBJJ3ZlIGFkZGVkIGRtYV9ybWIoKSBpbnRvIGR3bWFjNF93cmJhY2tfZ2V0
X3R4X3N0YXR1cygpIGFuZAo+IGR3bWFjNF93cmJhY2tfZ2V0X3J4X3N0YXR1cygpLCBhbmQgd2l0
aCB0aGF0IEkndmUgaGFkIGFuIGlwZXJmMwo+IGluc3RhbmNlIGZpbmFsbHkgY29tcGxldGUuLi4g
YnV0IG9ubHkgb25jZToKCkhpIFJ1c3NlbGwsCgpUbyBtZSBpdCBmZWVscyByZWxldmFudCB0aGF0
IHRoZSBUMTk0IGRvZXNuJ3QgdXNlIGZpcnN0LXBhcnR5CkFSTS9Db3J0ZXggY29yZXMgYnV0IHJh
dGhlciBOdmlkaWEncyBpbi1ob3VzZSAiQ2FybWVsIiBhcmNoaXRlY3R1cmUuCkRvIHlvdSBzdXBw
b3NlIHRoZSBjYWNoZSB0aGVyZSBpcyBxdWlya3kgaW4gc3VjaCBhIHdheSB0aGF0IGVpdGhlcjoK
MSkgV2UncmUgc2VlaW5nIHBvb3IgY2FjaGUgaHlnaWVuZSBpbiBzdG1tYWMgd2hlcmUgb3RoZXIg
Y2FjaGVzIGFyZQptb3JlIGZvcmdpdmluZyAobW9yZSBsaWtlbHkpCjIpIENhcm1lbCdzIGNhY2hl
IGhhcyBhIHN1YnRsZSBoYXJkd2FyZSBidWcgdHJpZ2dlcmVkIGJ5IHN0bW1hYydzCnNwZWNpZmlj
IGFjY2VzcyBwYXR0ZXJuIChsZXNzIGxpa2VseSk/CgpJJ20gc3RpbGwgdHJ5aW5nIHRvIGdldCBt
eSBYYXZpZXIgTlggdG8gYm9vdCBvbiBuZXQtbmV4dC4gSXQncyBydW5uaW5nCmludG8gZU1NQyBj
b3JydXB0aW9uL3N0YWxscyB2ZXJ5IGVhcmx5IGluIHRoZSBib290IHByb2Nlc3MgKGF0CnNsaWdo
dGx5IGRpZmZlcmVudCB0aW1lczsgZmVlbHMgbGlrZSBhIHByb2JsZW0gaW4gYXV0b2NhbGlicmF0
aW9uKQp0aGF0IEknbSBub3Qgc2VlaW5nIG9uIG9sZGVyIGtlcm5lbHMuIE9uY2UgSSdtIGRvbmUg
YmlzZWN0aW5nIHRoYXQKcmVncmVzc2lvbiBJJ2xsIHRha2UgYSBkZWVwZXIgbG9vayBhdCB0aGlz
IHN0bW1hYyBteXN0ZXJ5LiA6KQoKQ2hlZXJzLApTYW0KCj4KPiByb290QHRlZ3JhLXVidW50dTp+
IyBpcGVyZjMgLWMgMTkyLjE2OC4yNDguMSAtUgo+IENvbm5lY3RpbmcgdG8gaG9zdCAxOTIuMTY4
LjI0OC4xLCBwb3J0IDUyMDEKPiBSZXZlcnNlIG1vZGUsIHJlbW90ZSBob3N0IDE5Mi4xNjguMjQ4
LjEgaXMgc2VuZGluZwo+IFsgIDVdIGxvY2FsIDE5Mi4xNjguMjQ4LjE3NCBwb3J0IDQyMjMyIGNv
bm5lY3RlZCB0byAxOTIuMTY4LjI0OC4xIHBvcnQgNTIwMQo+IFsgSURdIEludGVydmFsICAgICAg
ICAgICBUcmFuc2ZlciAgICAgQml0cmF0ZQo+IFsgIDVdICAgMC4wMC0xLjAwICAgc2VjICA1MC44
IE1CeXRlcyAgIDQyNiBNYml0cy9zZWMKPiBbICA1XSAgIDEuMDAtMi4wMCAgIHNlYyAgNTQuOSBN
Qnl0ZXMgICA0NjAgTWJpdHMvc2VjCj4gWyAgNV0gICAyLjAwLTMuMDAgICBzZWMgIDU0LjAgTUJ5
dGVzICAgNDUzIE1iaXRzL3NlYwo+IFsgIDVdICAgMy4wMC00LjAwICAgc2VjICA1My44IE1CeXRl
cyAgIDQ1MiBNYml0cy9zZWMKPiBbICA1XSAgIDQuMDAtNS4wMCAgIHNlYyAgNTIuNCBNQnl0ZXMg
ICA0MzggTWJpdHMvc2VjCj4gWyAgNV0gICA1LjAwLTYuMDAgICBzZWMgIDU0LjMgTUJ5dGVzICAg
NDU1IE1iaXRzL3NlYwo+IFsgIDVdICAgNi4wMC03LjAwICAgc2VjICA1My43IE1CeXRlcyAgIDQ1
MiBNYml0cy9zZWMKPiBbICA1XSAgIDcuMDAtOC4wMCAgIHNlYyAgNTIuOCBNQnl0ZXMgICA0NDMg
TWJpdHMvc2VjCj4gWyAgNV0gICA4LjAwLTkuMDAgICBzZWMgIDUzLjcgTUJ5dGVzICAgNDUxIE1i
aXRzL3NlYwo+IFsgIDVdICAgOS4wMC0xMC4wMCAgc2VjICA1NC4zIE1CeXRlcyAgIDQ1NSBNYml0
cy9zZWMKPiAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAt
Cj4gWyBJRF0gSW50ZXJ2YWwgICAgICAgICAgIFRyYW5zZmVyICAgICBCaXRyYXRlICAgICAgICAg
UmV0cgo+IFsgIDVdICAgMC4wMC0xMC4wMSAgc2VjICAgNTM3IE1CeXRlcyAgIDQ1MCBNYml0cy9z
ZWMgICAxMyAgICAgICAgICAgICBzZW5kZXIKPiBbICA1XSAgIDAuMDAtMTAuMDAgIHNlYyAgIDUz
NSBNQnl0ZXMgICA0NDggTWJpdHMvc2VjICAgICAgICAgICAgICAgICAgcmVjZWl2ZXIKPgo+IGlw
ZXJmIERvbmUuCj4KPiBTbywgaXQgc2VlbXMgYmV0dGVyLCBidXQgbm90IGNvbXBsZXRlbHkgc29s
dmVkLgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjNF9kZXNjcy5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWM0X2Rlc2NzLmMKPiBpbmRleCAyOTk0ZGY0MWVjMmMuLjExOWYzMWM5NGI2MSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzRfZGVzY3MuYwo+
ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjNF9kZXNjcy5j
Cj4gQEAgLTE3LDEwICsxNywxMiBAQCBzdGF0aWMgaW50IGR3bWFjNF93cmJhY2tfZ2V0X3R4X3N0
YXR1cyhzdHJ1Y3Qgc3RtbWFjX2V4dHJhX3N0YXRzICp4LAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfZGVzYyAqcCwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2b2lkIF9faW9tZW0gKmlvYWRkcikKPiAgewo+IC0gICAg
ICAgdTMyIHRkZXMzID0gbGUzMl90b19jcHUocC0+ZGVzMyk7Cj4gKyAgICAgICB1MzIgdGRlczM7
Cj4gICAgICAgICBpbnQgcmV0ID0gdHhfZG9uZTsKPgo+ICAgICAgICAgLyogR2V0IHR4IG93bmVy
IGZpcnN0ICovCj4gKyAgICAgICBkbWFfcm1iKCk7Cj4gKyAgICAgICB0ZGVzMyA9IGxlMzJfdG9f
Y3B1KHAtPmRlczMpOwo+ICAgICAgICAgaWYgKHVubGlrZWx5KHRkZXMzICYgVERFUzNfT1dOKSkK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIHR4X2RtYV9vd247Cj4KPiBAQCAtNzAsMTIgKzcyLDEy
IEBAIHN0YXRpYyBpbnQgZHdtYWM0X3dyYmFja19nZXRfdHhfc3RhdHVzKHN0cnVjdCBzdG1tYWNf
ZXh0cmFfc3RhdHMgKngsCj4gIHN0YXRpYyBpbnQgZHdtYWM0X3dyYmFja19nZXRfcnhfc3RhdHVz
KHN0cnVjdCBzdG1tYWNfZXh0cmFfc3RhdHMgKngsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGRtYV9kZXNjICpwKQo+ICB7Cj4gLSAgICAgICB1MzIgcmRl
czEgPSBsZTMyX3RvX2NwdShwLT5kZXMxKTsKPiAtICAgICAgIHUzMiByZGVzMiA9IGxlMzJfdG9f
Y3B1KHAtPmRlczIpOwo+IC0gICAgICAgdTMyIHJkZXMzID0gbGUzMl90b19jcHUocC0+ZGVzMyk7
Cj4gKyAgICAgICB1MzIgcmRlczEsIHJkZXMyLCByZGVzMzsKPiAgICAgICAgIGludCBtZXNzYWdl
X3R5cGU7Cj4gICAgICAgICBpbnQgcmV0ID0gZ29vZF9mcmFtZTsKPgo+ICsgICAgICAgZG1hX3Jt
YigpOwo+ICsgICAgICAgcmRlczMgPSBsZTMyX3RvX2NwdShwLT5kZXMzKTsKPiAgICAgICAgIGlm
ICh1bmxpa2VseShyZGVzMyAmIFJERVMzX09XTikpCj4gICAgICAgICAgICAgICAgIHJldHVybiBk
bWFfb3duOwo+Cj4gQEAgLTEwNyw2ICsxMDksNyBAQCBzdGF0aWMgaW50IGR3bWFjNF93cmJhY2tf
Z2V0X3J4X3N0YXR1cyhzdHJ1Y3Qgc3RtbWFjX2V4dHJhX3N0YXRzICp4LAo+Cj4gICAgICAgICBt
ZXNzYWdlX3R5cGUgPSBGSUVMRF9HRVQoUkRFUzFfUFRQX01TR19UWVBFX01BU0ssIHJkZXMxKTsK
Pgo+ICsgICAgICAgcmRlczEgPSBsZTMyX3RvX2NwdShwLT5kZXMxKTsKPiAgICAgICAgIGlmIChy
ZGVzMSAmIFJERVMxX0lQX0hEUl9FUlJPUikgewo+ICAgICAgICAgICAgICAgICB4LT5pcF9oZHJf
ZXJyKys7Cj4gICAgICAgICAgICAgICAgIHJldCB8PSBjc3VtX25vbmU7Cj4gQEAgLTE1Miw2ICsx
NTUsNyBAQCBzdGF0aWMgaW50IGR3bWFjNF93cmJhY2tfZ2V0X3J4X3N0YXR1cyhzdHJ1Y3Qgc3Rt
bWFjX2V4dHJhX3N0YXRzICp4LAo+ICAgICAgICAgaWYgKHJkZXMxICYgUkRFUzFfVElNRVNUQU1Q
X0RST1BQRUQpCj4gICAgICAgICAgICAgICAgIHgtPnRpbWVzdGFtcF9kcm9wcGVkKys7Cj4KPiAr
ICAgICAgIHJkZXMyID0gbGUzMl90b19jcHUocC0+ZGVzMik7Cj4gICAgICAgICBpZiAodW5saWtl
bHkocmRlczIgJiBSREVTMl9TQV9GSUxURVJfRkFJTCkpIHsKPiAgICAgICAgICAgICAgICAgeC0+
c2FfcnhfZmlsdGVyX2ZhaWwrKzsKPiAgICAgICAgICAgICAgICAgcmV0ID0gZGlzY2FyZF9mcmFt
ZTsKPgo+IC0tCj4gUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcu
dWsvZGV2ZWxvcGVyL3BhdGNoZXMvCj4gRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMg
dXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
