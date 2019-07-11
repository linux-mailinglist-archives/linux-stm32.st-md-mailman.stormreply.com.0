Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0956569D
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2019 14:16:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE782D23098
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2019 12:16:41 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB1ACD23096
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 12:16:40 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id p184so2678150pfp.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 05:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ebaI7JZoCfM256GUV8nZnCzT8goD+tJe0e6XvNMsOn4=;
 b=AAyusSQWWFQRi1vScJOtNT6zNZtyrWwvjH5sZArjCya6rXeigax5PS1E8fW0vvrwJ5
 s5n94IqdYgqTC3i8ufS4TvWsKjSBa8+CrQND8SDZf7z+XvViOrT/2BL+jXb2a3BBV3ka
 QsRfHH82Dj03jUVI5N4kJr5MegnMGbvpI7n3Ht8FExOTKEImAMuORGJbsm2nwWDNFBEX
 ufRM7ZPgwbthjeBjtDjCuixP/mVC2pkvaUYyvuC8ssgpEipmAB0IEZDB0eENVpgeySAp
 olFAf2sachkLqVqRLK1jT2+5eby7YuDLP6TRQrBAhAkIFaD1UhTL1daCTodxOErkwSqh
 0LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ebaI7JZoCfM256GUV8nZnCzT8goD+tJe0e6XvNMsOn4=;
 b=X4dvZilH03rcaFgkGk5h3bMPKW8lICitqZn7dLnsRH+F8T4M+UzhR1lnM790ZxhQTD
 Z3Y1eZixNWHLCdr5mAoFgubjg4EGOGq1LhtDVJrXpxId1XTyjZEsOUtzitltE2jmreLr
 WN2jat9QB52tsSFJIppECy/orQ9ceO6UTffsZEQ+hYIzLR5SCOBvJpaUrKdOPECE1qqC
 /qB/jExdlv/xoqwCNtpqAuLxn2E+Y7MB6GVarhloQcLPVNydmGn64SiITdnFq3GkOFL/
 YCzAmStJ+nx7YYgevM+N5t7MBePg7+RyJyTCteiS4q6SawEEWRsSQk0Ycf56oMSoIcGy
 /nwQ==
X-Gm-Message-State: APjAAAX1QG/e92KQne2PGuh8wFsikhmiEaM4gXltMJE5tHPNstsgaJgf
 sCERdxH/iJ8hSJA1ldnjsrU=
X-Google-Smtp-Source: APXvYqzqzYQOKBq4miwPew8lzHQHfzU1AEc81YwR5rue/4y2BWib6z/bCeoGPD7v/JmU224bnamYjA==
X-Received: by 2002:a17:90a:cb8e:: with SMTP id
 a14mr4472521pju.124.1562847399177; 
 Thu, 11 Jul 2019 05:16:39 -0700 (PDT)
Received: from icarus ([2001:268:c144:cf11:d03e:81be:e250:5da0])
 by smtp.gmail.com with ESMTPSA id a16sm5951841pfd.68.2019.07.11.05.16.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Jul 2019 05:16:38 -0700 (PDT)
Date: Thu, 11 Jul 2019 21:16:20 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20190711121620.GA11661@icarus>
References: <20190507091224.17781-1-benjamin.gaignard@st.com>
 <20190711115059.GA7778@icarus>
 <CA+M3ks42Whd=QVQ-4==n5bRJKEwYpQtRHs=gBGEZ_Hr=_8YU1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+M3ks42Whd=QVQ-4==n5bRJKEwYpQtRHs=gBGEZ_Hr=_8YU1g@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Hartmut Knaack <knaack.h@gmx.de>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] IIO: stm32: Remove quadrature related
 functions from trigger driver
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

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDI6MTI6MjdQTSArMDIwMCwgQmVuamFtaW4gR2FpZ25h
cmQgd3JvdGU6Cj4gTGUgamV1LiAxMSBqdWlsLiAyMDE5IMOgIDEzOjUxLCBXaWxsaWFtIEJyZWF0
aGl0dCBHcmF5Cj4gPHZpbGhlbG0uZ3JheUBnbWFpbC5jb20+IGEgw6ljcml0IDoKPiA+Cj4gPiBP
biBUdWUsIE1heSAwNywgMjAxOSBhdCAxMToxMjoyNEFNICswMjAwLCBCZW5qYW1pbiBHYWlnbmFy
ZCB3cm90ZToKPiA+ID4gUXVhZHJhdHVyZSBmZWF0dXJlIGlzIG5vdyBob3N0ZWQgb24gaXQgb3du
IGZyYW1ld29yay4KPiA+ID4gUmVtb3ZlIHF1YWRyYXR1cmUgcmVsYXRlZCBjb2RlIGZyb20gc3Rt
MzItdHJpZ2dlciBkcml2ZXIgdG8gYXZvaWQKPiA+ID4gY29kZSBkdXBsaWNhdGlvbiBhbmQgc2lt
cGxpZnkgdGhlIEFCSS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25h
cmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4KPiA+Cj4gPiBXaGF0IGlzIHRoZSBzdGF0dXMg
b2YgdGhpcyBwYXRjaD8gQXJlIHRoZXJlIGFueSBvYmplY3Rpb25zIGN1cnJlbnRseSBmb3IKPiA+
IGl0cyBpbmNsdXNpb24/Cj4gCj4gWW91IHdlcmUgdGhlIG9ubHkgb25lIGFza2luZyBmb3IgbW9y
ZSBkZXRhaWxzIGFib3V0IGl0IDotKQo+IElmIHlvdSBhZ3JlZSBJIHRoaW5rIHRoYXQgSm9uYXRo
YW4gY2FuIG1lcmdlIGl0Lgo+IAo+IEJlbmphbWluCj4gPgo+ID4gV2lsbGlhbSBCcmVhdGhpdHQg
R3JheQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+ID4gbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKClllcywgSm9uYXRoYW4gcGxlYXNlIG1lcmdl
IHRoaXMgaWYgeW91IGhhdmUgbm8gb2JqZWN0aW9ucywgSSBoYWRuJ3QKcmVhbGl6ZWQgSSB3YXMg
ZGVsYXlpbmcgaXQuCgpUaGFuayB5b3UsCgpXaWxsaWFtIEJyZWF0aGl0dCBHcmF5Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
